---
title: How to SSH File Transfer from Windows to AlmaLinux
description: This guide walks through several methods for SSH file transfer from Windows to AlmaLinux.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH File Transfer from Windows
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 150
toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
url: ssh-file-transfer-windows-almalinux
---
Securely transferring files between a Windows machine and an AlmaLinux server can be accomplished using SSH (Secure Shell). SSH provides an encrypted connection to ensure data integrity and security. Windows users can utilize tools like **WinSCP**, **PuTTY**, or native PowerShell commands to perform file transfers. This guide walks through several methods for SSH file transfer from Windows to AlmaLinux.

---

### 1. Prerequisites

Before initiating file transfers:

1. **AlmaLinux Server:**
   - Ensure the SSH server (`sshd`) is installed and running:

     ```bash
     sudo dnf install openssh-server -y
     sudo systemctl start sshd
     sudo systemctl enable sshd
     ```

   - Confirm that SSH is accessible:

     ```bash
     ssh username@server-ip
     ```

2. **Windows System:**
   - Install a tool for SSH file transfers, such as **WinSCP** or **PuTTY** (both free).
   - Ensure the AlmaLinux server's IP address or hostname is reachable from Windows.

3. **Network Configuration:**
   - Open port 22 (default SSH port) on the AlmaLinux server firewall:

     ```bash
     sudo firewall-cmd --permanent --add-service=ssh
     sudo firewall-cmd --reload
     ```

---

### 2. Method 1: Using WinSCP

#### Step 1: Install WinSCP

1. Download **WinSCP** from the [official website](https://winscp.net/).
2. Install it on your Windows system.

#### Step 2: Connect to AlmaLinux

1. Open WinSCP and create a new session:
   - **File Protocol:** SFTP (or SCP).
   - **Host Name:** AlmaLinux server's IP address or hostname.
   - **Port Number:** 22 (default SSH port).
   - **User Name:** Your AlmaLinux username.
   - **Password:** Your password or SSH key (if configured).

2. Click **Login** to establish the connection.

#### Step 3: Transfer Files

- **Upload Files:** Drag and drop files from the left panel (Windows) to the right panel (AlmaLinux).
- **Download Files:** Drag files from the AlmaLinux panel to your local Windows directory.
- **Change Permissions:** Right-click a file on the server to modify permissions.

#### Additional Features

- Synchronize directories for batch file transfers.
- Configure saved sessions for quick access.

---

### 3. Method 2: Using PuTTY (PSCP)

PuTTY's SCP client (`pscp`) enables command-line file transfers.

#### Step 1: Download PuTTY Tools

1. Download PuTTY from the [official site](https://www.putty.org/).
2. Ensure the **pscp.exe** file is added to your system's PATH environment variable for easy command-line access.

#### Step 2: Use PSCP to Transfer Files

1. Open the Windows Command Prompt or PowerShell.
2. To copy a file from Windows to AlmaLinux:

   ```bash
   pscp C:\path\to\file.txt username@server-ip:/remote/directory/
   ```

3. To copy a file from AlmaLinux to Windows:

   ```bash
   pscp username@server-ip:/remote/directory/file.txt C:\local\path\
   ```

#### Advantages

- Lightweight and fast for single-file transfers.
- Integrates well with scripts for automation.

---

### 4. Method 3: Native PowerShell SCP

Windows 10 and later versions include an OpenSSH client, allowing SCP commands directly in PowerShell.

#### Step 1: Verify OpenSSH Client Installation

1. Open PowerShell and run:

   ```bash
   ssh
   ```

   If SSH commands are unavailable, install the OpenSSH client:
   - Go to **Settings > Apps > Optional Features**.
   - Search for **OpenSSH Client** and install it.

#### Step 2: Use SCP for File Transfers

1. To upload a file to AlmaLinux:

   ```bash
   scp C:\path\to\file.txt username@server-ip:/remote/directory/
   ```

2. To download a file from AlmaLinux:

   ```bash
   scp username@server-ip:/remote/directory/file.txt C:\local\path\
   ```

#### Advantages

- No additional software required.
- Familiar syntax for users of Unix-based systems.

---

### 5. Method 4: Using FileZilla

**FileZilla** is a graphical SFTP client supporting SSH file transfers.

### Step 1: Install FileZilla**

1. Download FileZilla from the [official website](https://filezilla-project.org/).
2. Install it on your Windows system.

### Step 2: Configure the Connection**

1. Open FileZilla and go to **File > Site Manager**.
2. Create a new site with the following details:
   - **Protocol:** SFTP - SSH File Transfer Protocol.
   - **Host:** AlmaLinux server's IP address.
   - **Port:** 22.
   - **Logon Type:** Normal or Key File.
   - **User:** AlmaLinux username.
   - **Password:** Password or path to your private SSH key.

3. Click **Connect** to access your AlmaLinux server.

### Step 3: Transfer Files

- Use the drag-and-drop interface to transfer files between Windows and AlmaLinux.
- Monitor transfer progress in the FileZilla transfer queue.

---

### **6. Best Practices for Secure File Transfers**

1. **Use Strong Passwords:** Ensure all accounts use complex, unique passwords.
2. **Enable SSH Key Authentication:** Replace password-based authentication with SSH keys for enhanced security.
3. **Limit SSH Access:** Restrict SSH access to specific IP addresses.

   ```bash
   sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
   sudo firewall-cmd --reload
   ```

4. **Change the Default SSH Port:** Reduce exposure to brute-force attacks by using a non-standard port.

---

### **7. Troubleshooting Common Issues**

1. **Connection Timeout:**
   - Verify network connectivity with `ping server-ip`.
   - Check that port 22 is open on the server firewall.

2. **Authentication Failures:**
   - Ensure the correct username and password are used.
   - If using keys, confirm the key pair matches and permissions are set properly.

3. **Transfer Interruptions:**
   - Use `rsync` for large files to resume transfers automatically:

     ```bash
     rsync -avz -e ssh C:\path\to\file.txt username@server-ip:/remote/directory/
     ```

---

### **Conclusion**

Transferring files between Windows and AlmaLinux using SSH ensures secure and efficient communication. With tools like WinSCP, PuTTY, FileZilla, or native SCP commands, you can choose a method that best suits your workflow. By following the steps and best practices outlined in this guide, you’ll be able to perform secure file transfers confidently.
