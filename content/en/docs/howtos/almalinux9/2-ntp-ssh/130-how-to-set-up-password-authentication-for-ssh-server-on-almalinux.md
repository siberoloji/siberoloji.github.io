---
title: How to Set Up Password Authentication for SSH Server on AlmaLinux
description: This guide will show you how to set up password authentication for your SSH server on AlmaLinux.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Password Authentication for SSH Server
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 130

keywords:
  - AlmaLinux
  - password authentication

featured_image: /images/almalinux.webp
url: set-password-authentication-ssh-server-almalinux
---
SSH (Secure Shell) is a foundational tool for securely accessing and managing remote servers. While public key authentication is recommended for enhanced security, **password authentication** is a straightforward and commonly used method for SSH access, especially for smaller deployments or testing environments. This guide will show you how to set up password authentication for your SSH server on AlmaLinux.

---

### **1. What is Password Authentication in SSH?**

Password authentication allows users to access an SSH server by entering a username and password. It’s simpler than key-based authentication but can be less secure if not configured properly. Strengthening your password policies and enabling other security measures can mitigate risks.

---

### **2. Prerequisites**

Before setting up password authentication:

1. Ensure **AlmaLinux** is installed and up-to-date.
2. Have administrative access (root or a user with `sudo` privileges).
3. Open access to your SSH server's default port (22) or the custom port being used.

---

### **3. Step-by-Step Guide to Enable Password Authentication**

#### **Step 1: Install the OpenSSH Server**

If SSH isn’t already installed, you can install it using the package manager:

```bash
sudo dnf install openssh-server -y
```

Start and enable the SSH service:

```bash
sudo systemctl start sshd
sudo systemctl enable sshd
```

Check the SSH service status to ensure it’s running:

```bash
sudo systemctl status sshd
```

#### **Step 2: Configure SSH to Allow Password Authentication**

The SSH server configuration file is located at `/etc/ssh/sshd_config`. Edit this file to enable password authentication:

```bash
sudo nano /etc/ssh/sshd_config
```

Look for the following lines in the file:

```plaintext
#PasswordAuthentication yes
```

Uncomment the line and ensure it reads:

```plaintext
PasswordAuthentication yes
```

Also, ensure the `ChallengeResponseAuthentication` is set to `no` to avoid conflicts:

```plaintext
ChallengeResponseAuthentication no
```

If the `PermitRootLogin` setting is present, it’s recommended to disable root login for security reasons:

```plaintext
PermitRootLogin no
```

Save and close the file.

#### **Step 3: Restart the SSH Service**

After modifying the configuration file, restart the SSH service to apply the changes:

```bash
sudo systemctl restart sshd
```

---

### **4. Verifying Password Authentication**

#### **Step 1: Test SSH Login**

From a remote system, try logging into your server using SSH:

```bash
ssh username@server-ip
```

When prompted, enter your password. If the configuration is correct, you should be able to log in.

#### **Step 2: Debugging Login Issues**

If the login fails:

1. Confirm that the username and password are correct.
2. Check for errors in the SSH logs on the server:

   ```bash
   sudo journalctl -u sshd
   ```

3. Verify the firewall settings to ensure port 22 (or your custom port) is open.

---

### **5. Securing Password Authentication**

While password authentication is convenient, it’s inherently less secure than key-based authentication. Follow these best practices to improve its security:

#### **1. Use Strong Passwords**

Encourage users to set strong passwords that combine letters, numbers, and special characters. Consider installing a password quality checker:

```bash
sudo dnf install cracklib-dicts
```

#### **2. Limit Login Attempts**

Install and configure tools like **Fail2Ban** to block repeated failed login attempts:

```bash
sudo dnf install fail2ban -y
```

Configure a basic SSH filter in `/etc/fail2ban/jail.local`:

```plaintext
[sshd]
enabled = true
maxretry = 5
bantime = 3600
```

Restart the Fail2Ban service:

```bash
sudo systemctl restart fail2ban
```

#### **3. Change the Default SSH Port**

Using a non-standard port for SSH can reduce automated attacks:

1. Edit the SSH configuration file:

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Change the port:

   ```plaintext
   Port 2222
   ```

3. Update the firewall to allow the new port:

   ```bash
   sudo firewall-cmd --permanent --add-port=2222/tcp
   sudo firewall-cmd --reload
   ```

#### **4. Allow Access Only from Specific IPs**

Restrict SSH access to known IP ranges using firewall rules:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

#### **5. Enable Two-Factor Authentication (Optional)**

For added security, configure two-factor authentication (2FA) using a tool like Google Authenticator:

```bash
sudo dnf install google-authenticator -y
```

---

### **6. Troubleshooting Common Issues**

1. **SSH Service Not Running:**  
   Check the service status:

   ```bash
   sudo systemctl status sshd
   ```

2. **Authentication Fails:**  
   Verify the settings in `/etc/ssh/sshd_config` and ensure there are no typos.

3. **Firewall Blocking SSH:**  
   Ensure the firewall allows SSH traffic:

   ```bash
   sudo firewall-cmd --permanent --add-service=ssh
   sudo firewall-cmd --reload
   ```

4. **Connection Timeout:**  
   Test network connectivity to the server using `ping` or `telnet`.

---

### **Conclusion**

Setting up password authentication for an SSH server on AlmaLinux is straightforward and provides a simple method for secure remote access. While convenient, it’s crucial to pair it with strong security measures like limiting login attempts, using strong passwords, and enabling two-factor authentication where possible. By following the steps and best practices outlined in this guide, you can confidently configure and secure your SSH server.
