---
title: How to Set Up SFTP-only with Chroot on AlmaLinux
description: This guide will walk you through configuring SFTP-only access with Chroot on AlmaLinux, ensuring a secure and isolated file transfer environment.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SFTP-only with Chroot


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 170

keywords:
  - AlmaLinux
  - Chroot on AlmaLinux

featured_image: /images/almalinux.webp
url: set-sftp-chroot-almalinux
---
**Secure File Transfer Protocol (SFTP)** is a secure way to transfer files over a network, leveraging SSH for encryption and authentication. Setting up an **SFTP-only environment with Chroot** enhances security by restricting users to specific directories and preventing them from accessing sensitive areas of the server. This guide will walk you through configuring SFTP-only access with Chroot on AlmaLinux, ensuring a secure and isolated file transfer environment.

---

### **1. What is SFTP and Chroot?**

#### **SFTP**
SFTP is a secure file transfer protocol that uses SSH to encrypt communications. Unlike FTP, which transfers data in plaintext, SFTP ensures that files and credentials are protected during transmission.

#### **Chroot**
Chroot, short for "change root," confines a user or process to a specific directory, creating a "jail" environment. When a user logs in, they can only access their designated directory and its subdirectories, effectively isolating them from the rest of the system.

---

### **2. Prerequisites**

Before setting up SFTP with Chroot, ensure the following:
1. **AlmaLinux Server:** A running instance with administrative privileges.
2. **OpenSSH Installed:** Verify that the SSH server is installed and running:
   ```bash
   sudo dnf install openssh-server -y
   sudo systemctl start sshd
   sudo systemctl enable sshd
   ```
3. **User Accounts:** Create or identify users who will have SFTP access.

---

### **3. Step-by-Step Setup**

#### **Step 1: Install and Configure SSH**
Ensure OpenSSH is installed and up-to-date:
```bash
sudo dnf update -y
sudo dnf install openssh-server -y
```

#### **Step 2: Create the SFTP Group**
Create a dedicated group for SFTP users:
```bash
sudo groupadd sftpusers
```

#### **Step 3: Create SFTP-Only Users**
Create a user and assign them to the SFTP group:
```bash
sudo useradd -m -s /sbin/nologin -G sftpusers sftpuser
```
- `-m`: Creates a home directory for the user.
- `-s /sbin/nologin`: Prevents SSH shell access.
- `-G sftpusers`: Adds the user to the SFTP group.

Set a password for the user:
```bash
sudo passwd sftpuser
```

#### **Step 4: Configure the SSH Server for SFTP**
Edit the SSH server configuration file:
```bash
sudo nano /etc/ssh/sshd_config
```

Add or modify the following lines at the end of the file:
```plaintext
# SFTP-only Configuration
Match Group sftpusers
    ChrootDirectory %h
    ForceCommand internal-sftp
    AllowTcpForwarding no
    X11Forwarding no
```

- `Match Group sftpusers`: Applies the rules to the SFTP group.
- `ChrootDirectory %h`: Restricts users to their home directory (`%h` represents the user’s home directory).
- `ForceCommand internal-sftp`: Restricts users to SFTP-only access.
- `AllowTcpForwarding no` and `X11Forwarding no`: Disable unnecessary features for added security.

Save and close the file.

#### **Step 5: Set Permissions on User Directories**
Set the ownership and permissions for the Chroot environment:
```bash
sudo chown root:root /home/sftpuser
sudo chmod 755 /home/sftpuser
```

Create a subdirectory for file storage:
```bash
sudo mkdir /home/sftpuser/uploads
sudo chown sftpuser:sftpusers /home/sftpuser/uploads
```

This ensures that the user can upload files only within the designated `uploads` directory.

#### **Step 6: Restart the SSH Service**
Apply the changes by restarting the SSH service:
```bash
sudo systemctl restart sshd
```

---

### **4. Testing the Configuration**

1. **Connect via SFTP:**
   From a client machine, connect to the server using an SFTP client:
   ```bash
   sftp sftpuser@server-ip
   ```

2. **Verify Access Restrictions:**
   - Ensure the user can only access the `uploads` directory and cannot navigate outside their Chroot environment.
   - Attempting SSH shell access should result in a "permission denied" error.

---

### **5. Advanced Configurations**

#### **1. Limit File Upload Sizes**
To limit upload sizes, modify the user’s shell limits:
```bash
sudo nano /etc/security/limits.conf
```
Add the following lines:
```plaintext
sftpuser hard fsize 10485760  # 10MB limit
```

#### **2. Enable Logging for SFTP Sessions**
Enable logging to track user activities:
1. Edit the SSH configuration file to include:
   ```plaintext
   Subsystem sftp /usr/libexec/openssh/sftp-server -l INFO
   ```
2. Restart SSH:
   ```bash
   sudo systemctl restart sshd
   ```

Logs will be available in `/var/log/secure`.

---

### **6. Troubleshooting Common Issues**

1. **SFTP Login Fails:**
   - Verify the user’s home directory ownership:
     ```bash
     sudo chown root:root /home/sftpuser
     ```
   - Check for typos in `/etc/ssh/sshd_config`.

2. **Permission Denied for File Uploads:**
   Ensure the `uploads` directory is writable by the user:
   ```bash
   sudo chmod 755 /home/sftpuser/uploads
   sudo chown sftpuser:sftpusers /home/sftpuser/uploads
   ```

3. **ChrootDirectory Error:**
   Verify that the Chroot directory permissions meet SSH requirements:
   ```bash
   sudo chmod 755 /home/sftpuser
   sudo chown root:root /home/sftpuser
   ```

---

### **7. Security Best Practices**

1. **Restrict User Access:**
   Ensure users are confined to their designated directories and have minimal permissions.
2. **Enable Two-Factor Authentication (2FA):**
   Add an extra layer of security by enabling 2FA for SFTP users.
3. **Monitor Logs Regularly:**
   Review `/var/log/secure` for suspicious activities.
4. **Use a Non-Standard SSH Port:**
   Change the default SSH port in `/etc/ssh/sshd_config` to reduce automated attacks:
   ```plaintext
   Port 2222
   ```

---

### **Conclusion**

Configuring SFTP-only access with Chroot on AlmaLinux is a powerful way to secure your server and ensure users can only access their designated directories. By following this guide, you can set up a robust file transfer environment that prioritizes security and usability. Implementing advanced configurations and adhering to security best practices will further enhance your server's protection.
