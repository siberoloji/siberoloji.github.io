---
title: File Transfer with SSH on AlmaLinux
description: This guide will walk you through how to use SSH for file transfers on AlmaLinux, detailing the setup, commands, and best practices.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: File Transfer with SSH


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 140

keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: file-transfer-ssh-almalinux
---
Transferring files securely between systems is a critical task for developers, system administrators, and IT professionals. SSH (Secure Shell) provides a secure and efficient way to transfer files using protocols like SCP (Secure Copy Protocol) and SFTP (SSH File Transfer Protocol). This guide will walk you through how to use SSH for file transfers on AlmaLinux, detailing the setup, commands, and best practices.

---

### **1. What is SSH and How Does it Facilitate File Transfer?**

SSH is a cryptographic protocol that secures communication over an unsecured network. Along with its primary use for remote system access, SSH supports file transfers through:

- **SCP (Secure Copy Protocol):** A straightforward way to transfer files securely between systems.
- **SFTP (SSH File Transfer Protocol):** A more feature-rich file transfer protocol built into SSH.

Both methods encrypt the data during transfer, ensuring confidentiality and integrity.

---

### **2. Prerequisites for SSH File Transfers**

Before transferring files:

1. Ensure that **OpenSSH Server** is installed and running on the remote AlmaLinux system:

   ```bash
   sudo dnf install openssh-server -y
   sudo systemctl start sshd
   sudo systemctl enable sshd
   ```

2. The SSH client must be installed on the local system (most Linux distributions include this by default).
3. The systems must have network connectivity and firewall access for SSH (default port: 22).

---

### **3. Using SCP for File Transfers**

#### **What is SCP?**

SCP is a command-line tool that allows secure file copying between local and remote systems. It uses the SSH protocol to encrypt both the data and authentication.

#### **Basic SCP Syntax**

The basic structure of the SCP command is:

```bash
scp [options] source destination
```

#### **Examples of SCP Commands**

1. **Copy a File from Local to Remote:**

   ```bash
   scp file.txt username@remote-ip:/remote/path/
   ```

   - `file.txt`: The local file to transfer.
   - `username`: SSH user on the remote system.
   - `remote-ip`: IP address or hostname of the remote system.
   - `/remote/path/`: Destination directory on the remote system.

2. **Copy a File from Remote to Local:**

   ```bash
   scp username@remote-ip:/remote/path/file.txt /local/path/
   ```

3. **Copy a Directory Recursively:**
   Use the `-r` flag to copy directories:

   ```bash
   scp -r /local/directory username@remote-ip:/remote/path/
   ```

4. **Using a Custom SSH Port:**
   If the remote system uses a non-standard SSH port (e.g., 2222):

   ```bash
   scp -P 2222 file.txt username@remote-ip:/remote/path/
   ```

---

### **4. Using SFTP for File Transfers**

#### **What is SFTP?**

SFTP provides a secure method to transfer files, similar to FTP, but encrypted with SSH. It allows browsing remote directories, resuming transfers, and changing file permissions.

#### **Starting an SFTP Session**

Connect to a remote system using:

```bash
sftp username@remote-ip
```

Once connected, you can use various commands within the SFTP prompt:

#### **Common SFTP Commands**

1. **List Files:**

   ```bash
   ls
   ```

2. **Navigate Directories:**
   - Change local directory:

     ```bash
     lcd /local/path/
     ```

   - Change remote directory:

     ```bash
     cd /remote/path/
     ```

3. **Upload Files:**

   ```bash
   put localfile.txt /remote/path/
   ```

4. **Download Files:**

   ```bash
   get /remote/path/file.txt /local/path/
   ```

5. **Download/Upload Directories:**
   Use the `-r` flag with `get` or `put` to transfer directories.

6. **Exit SFTP:**

   ```bash
   exit
   ```

---

### **5. Automating File Transfers with SSH Keys**

For frequent file transfers, you can configure **password-less authentication** using SSH keys. This eliminates the need to enter a password for every transfer.

#### **Generate an SSH Key Pair**

On the local system, generate a key pair:

```bash
ssh-keygen
```

Save the key pair to the default location (`~/.ssh/id_rsa`).

#### **Copy the Public Key to the Remote System**

Transfer the public key to the remote system:

```bash
ssh-copy-id username@remote-ip
```

Now, you can use SCP or SFTP without entering a password.

---

### **6. Securing SSH File Transfers**

To ensure secure file transfers:

1. **Use Strong Passwords or SSH Keys:** Passwords should be complex, and SSH keys are a preferred alternative.
2. **Restrict SSH Access:** Limit SSH to specific IP addresses using firewall rules.

   ```bash
   sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
   sudo firewall-cmd --reload
   ```

3. **Change the Default SSH Port:** Modify the SSH port in `/etc/ssh/sshd_config` to reduce exposure to automated attacks.

---

### **7. Advanced SSH File Transfer Techniques**

1. **Compress Files During Transfer:**
   Use the `-C` flag with SCP to compress files during transfer:

   ```bash
   scp -C largefile.tar.gz username@remote-ip:/remote/path/
   ```

2. **Batch File Transfers with Rsync:**
   For advanced synchronization and large file transfers, use **rsync** over SSH:

   ```bash
   rsync -avz -e "ssh -p 22" /local/path/ username@remote-ip:/remote/path/
   ```

3. **Limit Transfer Speed:**
   Use the `-l` flag with SCP to control bandwidth:

   ```bash
   scp -l 1000 file.txt username@remote-ip:/remote/path/
   ```

---

### **8. Troubleshooting SSH File Transfers**

1. **Authentication Failures:**
   - Verify the username and IP address.
   - Ensure the SSH key is added using `ssh-add` if using key-based authentication.

2. **Connection Timeout:**
   - Test connectivity with `ping` or `telnet`.
   - Check the firewall settings on the remote system.

3. **Permission Issues:**
   Ensure the user has write permissions on the destination directory.

---

### **Conclusion**

File transfers using SSH on AlmaLinux are secure, efficient, and versatile. Whether you prefer the simplicity of SCP or the advanced features of SFTP, mastering these tools can significantly streamline your workflows. By following this guide and implementing security best practices, you can confidently transfer files between systems with ease.
