---
title: How to Transfer Auditd Logs to a Remote Host on AlmaLinux
linkTitle: Transfer Auditd Logs
description: Learn how to configure Auditd on AlmaLinux to transfer logs to a remote host. Secure and centralize log management with this comprehensive step-by-step guide.
date: 2025-01-07T09:30:30.879Z
weight: 1500
url: transfer-auditd-logs-remote-host-almalinux
translationKey: transfer-auditd-logs-remote-host-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
featured_image: /images/almalinux.webp
---
### **How to Transfer Auditd Logs to a Remote Host on AlmaLinux**

### Introduction

Auditd, the Audit Daemon, is a critical tool for Linux system administrators, providing detailed logging of security-relevant events such as file access, user activities, and system modifications. However, for enhanced security, compliance, and centralized monitoring, it is often necessary to transfer Auditd logs to a remote host. This approach ensures logs remain accessible even if the source server is compromised.

In this guide, we’ll walk you through the process of configuring Auditd to transfer logs to a remote host on AlmaLinux. By following this tutorial, you can set up a robust log management system suitable for compliance with regulatory standards such as PCI DSS, HIPAA, or GDPR.

---

### **Prerequisites**

Before you begin, ensure the following:

1. **AlmaLinux system with Auditd installed**: The source system generating the logs.
2. **Remote log server**: A destination server to receive and store the logs.
3. **Sudo privileges**: Administrative access to configure services.
4. **Stable network connection**: Required for reliable log transmission.

Optional: Familiarity with SELinux and firewalld, as these services may need adjustments.

---

### **Step 1: Install and Configure Auditd**

#### Install Auditd on the Source System

If Auditd is not already installed on your AlmaLinux system, install it using:

```bash
sudo dnf install -y audit audit-libs
```

#### Start and Enable Auditd

Ensure the Auditd service is active and enabled at boot:

```bash
sudo systemctl enable auditd
sudo systemctl start auditd
```

#### Verify Installation

Check that Auditd is running:

```bash
sudo systemctl status auditd
```

---

### **Step 2: Set Up Remote Logging**

To transfer logs to a remote host, you need to configure Auditd’s `audispd` plugin system, specifically the `audisp-remote` plugin.

#### Edit the Auditd Configuration

1. Open the Auditd configuration file:

   ```bash
   sudo nano /etc/audit/auditd.conf
   ```

2. Update the following settings:
   - **`log_format`**: Set to `RAW` for compatibility.

     ```bash
     log_format = RAW
     ```

   - **`enable_krb5`**: Disable Kerberos authentication if not in use.

     ```bash
     enable_krb5 = no
     ```

3. Save and close the file.

---

### **Step 3: Configure the `audisp-remote` Plugin**

The `audisp-remote` plugin is responsible for sending Auditd logs to a remote host.

1. Edit the `audisp-remote` configuration file:

   ```bash
   sudo nano /etc/audit/plugins.d/audisp-remote.conf
   ```

2. Update the following settings:
   - **`active`**: Ensure the plugin is active:

     ```bash
     active = yes
     ```

   - **`direction`**: Set the transmission direction to `out`.

     ```bash
     direction = out
     ```

   - **`path`**: Specify the path to the remote plugin executable:

     ```bash
     path = /sbin/audisp-remote
     ```

   - **`type`**: Use the type `builtin`:

     ```bash
     type = builtin
     ```

3. Save and close the file.

---

### **Step 4: Define the Remote Host**

Specify the destination server to receive Auditd logs.

1. Edit the remote server configuration:

   ```bash
   sudo nano /etc/audisp/audisp-remote.conf
   ```

2. Configure the following parameters:
   - **`remote_server`**: Enter the IP address or hostname of the remote server.

     ```bash
     remote_server = <REMOTE_HOST_IP>
     ```

   - **`port`**: Use the default port (`60`) or a custom port:

     ```bash
     port = 60
     ```

   - **`transport`**: Set to `tcp` for reliable transmission:

     ```bash
     transport = tcp
     ```

   - **`format`**: Specify the format (`encrypted` for secure transmission or `ascii` for plaintext):

     ```bash
     format = ascii
     ```

3. Save and close the file.

---

### **Step 5: Adjust SELinux and Firewall Rules**

#### Update SELinux Policy

If SELinux is enforcing, allow Auditd to send logs to a remote host:

```bash
sudo setsebool -P auditd_network_connect 1
```

#### Configure Firewall Rules

Ensure the source system can connect to the remote host on the specified port (default: `60`):

1. Add a firewall rule:

   ```bash
   sudo firewall-cmd --add-port=60/tcp --permanent
   ```

2. Reload the firewall:

   ```bash
   sudo firewall-cmd --reload
   ```

---

### **Step 6: Configure the Remote Log Server**

The remote server must be set up to receive and store Auditd logs. This can be achieved using `auditd` or a syslog server like `rsyslog` or `syslog-ng`.

#### Option 1: Using Auditd

1. Install Auditd on the remote server:

   ```bash
   sudo dnf install -y audit audit-libs
   ```

2. Edit the `auditd.conf` file:

   ```bash
   sudo nano /etc/audit/auditd.conf
   ```

3. Update the `local_events` parameter to disable local logging if only remote logs are needed:

   ```bash
   local_events = no
   ```

4. Save and close the file.

5. Start the Auditd service:

   ```bash
   sudo systemctl enable auditd
   sudo systemctl start auditd
   ```

#### Option 2: Using rsyslog

1. Install rsyslog:

   ```bash
   sudo dnf install -y rsyslog
   ```

2. Enable TCP reception:

   ```bash
   sudo nano /etc/rsyslog.conf
   ```

3. Uncomment or add the following lines:

   ```bash
   $ModLoad imtcp
   $InputTCPServerRun 514
   ```

4. Restart rsyslog:

   ```bash
   sudo systemctl restart rsyslog
   ```

---

### **Step 7: Test the Configuration**

1. On the source system, restart Auditd to apply changes:

   ```bash
   sudo systemctl restart auditd
   ```

2. Generate a test log entry on the source system:

   ```bash
   sudo auditctl -w /etc/passwd -p wa -k test_rule
   sudo echo "test entry" >> /etc/passwd
   ```

3. Check the remote server for the log entry:
   - For Auditd:

     ```bash
     sudo ausearch -k test_rule
     ```

   - For rsyslog:

     ```bash
     sudo tail -f /var/log/messages
     ```

---

### **Step 8: Securing the Setup**

#### Enable Encryption

For secure transmission, configure the `audisp-remote` plugin to use encryption:

1. Set `format = encrypted` in `/etc/audisp/audisp-remote.conf`.
2. Ensure both source and remote hosts have proper SSL/TLS certificates.

#### Implement Network Security

- Use a VPN or SSH tunneling to secure the connection between source and remote hosts.
- Restrict access to the remote log server by allowing only specific IPs.

---

### **Step 9: Troubleshooting**

1. **Logs Not Transferring**:
   - Check the Auditd status:

     ```bash
     sudo systemctl status auditd
     ```

   - Verify the connection to the remote server:

     ```bash
     telnet <REMOTE_HOST_IP> 60
     ```

2. **SELinux or Firewall Blocks**:
   - Confirm SELinux settings:

     ```bash
     getsebool auditd_network_connect
     ```

   - Validate firewall rules:

     ```bash
     sudo firewall-cmd --list-all
     ```

3. **Configuration Errors**:
   - Check logs for errors:

     ```bash
     sudo tail -f /var/log/audit/audit.log
     ```

---

### **Conclusion**

Transferring Auditd logs to a remote host enhances security, ensures log integrity, and simplifies centralized monitoring. By following this step-by-step guide, you’ve configured Auditd on AlmaLinux to forward logs securely and efficiently.

Implement encryption and network restrictions to safeguard sensitive data during transmission. With a centralized log management system, you can maintain compliance and improve incident response capabilities.
