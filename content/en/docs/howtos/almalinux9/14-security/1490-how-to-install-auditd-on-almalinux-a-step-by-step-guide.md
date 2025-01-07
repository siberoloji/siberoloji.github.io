---
title: "How to Install Auditd on AlmaLinux: Step-by-Step Guide"
linkTitle: Install Auditd
description: Learn how to install and configure Auditd on AlmaLinux for system monitoring and security. Follow our comprehensive guide to set up audit rules and analyze logs effectively.
date: 2025-01-07T09:29:36.762Z
weight: 1490
url: install-auditd-almalinux-step-step-guide
draft: false
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

## **Introduction**

Auditd (Audit Daemon) is a vital tool for system administrators looking to enhance the security and accountability of their Linux systems. It provides comprehensive auditing capabilities, enabling the monitoring and recording of system activities for compliance, troubleshooting, and security purposes. AlmaLinux, a powerful, RHEL-compatible Linux distribution, offers a stable environment for deploying Auditd.

In this guide, we’ll walk you through the installation, configuration, and basic usage of Auditd on AlmaLinux. By the end of this tutorial, you’ll be equipped to track and analyze system events effectively.

---

### **What is Auditd?**

Auditd is the user-space component of the Linux Auditing System. It records security-relevant events, helping administrators:

- Track user actions.
- Detect unauthorized access attempts.
- Monitor file modifications.
- Ensure compliance with standards like PCI DSS, HIPAA, and GDPR.

The audit framework operates at the kernel level, ensuring minimal performance overhead while capturing extensive system activity.

---

### **Prerequisites**

Before proceeding, ensure the following:

1. **AlmaLinux server**: This guide is tested on AlmaLinux 8 but applies to similar RHEL-based systems.
2. **Sudo privileges**: Administrative rights are required to install and configure Auditd.
3. **Internet connection**: Necessary for downloading packages.

---

### **Step 1: Update Your AlmaLinux System**

Keeping your system up to date ensures compatibility and security. Update the package manager cache and system packages:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

Reboot the system if updates require it:

```bash
sudo reboot
```

---

### **Step 2: Install Auditd**

Auditd is included in AlmaLinux’s default repositories, making installation straightforward.

1. Install Auditd using the `dnf` package manager:

   ```bash
   sudo dnf install -y audit audit-libs
   ```

2. Verify the installation:

   ```bash
   auditctl -v
   ```

   This should display the installed version of Auditd.

---

### **Step 3: Enable and Start Auditd Service**

To begin monitoring system events, enable and start the Auditd service:

1. Enable Auditd to start on boot:

   ```bash
   sudo systemctl enable auditd
   ```

2. Start the Auditd service:

   ```bash
   sudo systemctl start auditd
   ```

3. Check the service status to ensure it’s running:

   ```bash
   sudo systemctl status auditd
   ```

The output should confirm that the Auditd service is active.

---

### **Step 4: Verify Auditd Default Configuration**

Auditd’s default configuration file is located at `/etc/audit/auditd.conf`. This file controls various aspects of how Auditd operates.

1. Open the configuration file for review:

   ```bash
   sudo nano /etc/audit/auditd.conf
   ```

2. Key parameters to check:
   - **`log_file`**: Location of the audit logs (default: `/var/log/audit/audit.log`).
   - **`max_log_file`**: Maximum size of a log file in MB (default: `8`).
   - **`log_format`**: Format of the logs (default: `RAW`).

3. Save any changes and restart Auditd to apply them:

   ```bash
   sudo systemctl restart auditd
   ```

---

### **Step 5: Understanding Audit Rules**

Audit rules define what events the Audit Daemon monitors. Rules can be temporary (active until reboot) or permanent (persist across reboots).

#### Temporary Rules

Temporary rules are added using the `auditctl` command. For example:

- Monitor a specific file:

  ```bash
  sudo auditctl -w /etc/passwd -p wa -k passwd_changes
  ```

  This monitors the `/etc/passwd` file for write and attribute changes, tagging events with the key `passwd_changes`.

- List active rules:

  ```bash
  sudo auditctl -l
  ```

- Delete a specific rule:

  ```bash
  sudo auditctl -W /etc/passwd
  ```

#### Permanent Rules

Permanent rules are saved in `/etc/audit/rules.d/audit.rules`. To add a permanent rule:

1. Open the rules file:

   ```bash
   sudo nano /etc/audit/rules.d/audit.rules
   ```

2. Add the desired rule, for example:

   ```bash
   -w /etc/passwd -p wa -k passwd_changes
   ```

3. Save the file and restart Auditd:

   ```bash
   sudo systemctl restart auditd
   ```

---

### **Step 6: Using Auditd Logs**

Audit logs are stored in `/var/log/audit/audit.log`. These logs provide detailed information about monitored events.

- View the latest log entries:

  ```bash
  sudo tail -f /var/log/audit/audit.log
  ```

- Search logs using `ausearch`:

  ```bash
  sudo ausearch -k passwd_changes
  ```

  This retrieves logs associated with the `passwd_changes` key.

- Generate detailed reports using `aureport`:

  ```bash
  sudo aureport
  ```

  Examples of specific reports:
  - Failed logins:

    ```bash
    sudo aureport -l --failed
    ```

  - File access events:

    ```bash
    sudo aureport -f
    ```

---

### **Step 7: Advanced Configuration**

#### Monitoring User Activity

Monitor all commands run by a specific user:

1. Add a rule to track the user’s commands:

   ```bash
   sudo auditctl -a always,exit -F arch=b64 -S execve -F uid=1001 -k user_commands
   ```

   Replace `1001` with the user ID of the target user.

2. Review captured events:

   ```bash
   sudo ausearch -k user_commands
   ```

#### Monitoring Sensitive Files

Track changes to critical configuration files:

1. Add a rule for a file or directory:

   ```bash
   sudo auditctl -w /etc/ssh/sshd_config -p wa -k ssh_config_changes
   ```

2. Review logs for changes:

   ```bash
   sudo ausearch -k ssh_config_changes
   ```

---

### **Step 8: Troubleshooting Auditd**

1. **Auditd Service Fails to Start**:
   - Check logs for errors:

     ```bash
     sudo journalctl -u auditd
     ```

2. **No Logs Recorded**:
   - Ensure rules are active:

     ```bash
     sudo auditctl -l
     ```

3. **Log Size Exceeds Limit**:
   - Rotate logs using `logrotate` or adjust `max_log_file` in `auditd.conf`.

4. **Configuration Errors**:
   - Validate the rules syntax:

     ```bash
     sudo augenrules --check
     ```

---

### **Step 9: Best Practices for Using Auditd**

1. **Define Specific Rules**:
   Focus on critical areas like sensitive files, user activities, and authentication events.

2. **Rotate Logs Regularly**:
   Use log rotation to prevent disk space issues:

   ```bash
   sudo logrotate /etc/logrotate.d/audit
   ```

3. **Analyze Logs Periodically**:
   Review logs using `ausearch` and `aureport` to identify anomalies.

4. **Backup Audit Configurations**:
   Save a backup of your rules and configuration files for disaster recovery.

---

### **Conclusion**

Auditd is an essential tool for monitoring and securing your AlmaLinux system. By following this guide, you’ve installed Auditd, configured its rules, and learned how to analyze audit logs. These steps enable you to track system activities, detect potential breaches, and maintain compliance with regulatory requirements.

Explore Auditd’s advanced capabilities to create a tailored monitoring strategy for your infrastructure. Regular audits and proactive analysis will enhance your system’s security and performance.
