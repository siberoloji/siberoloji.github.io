---
draft: false

title:  'AlmaLinux 9: How to Use SCP with SSH for Advanced File Operations'
date: '2024-10-04T17:40:49+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-use-scp-with-ssh-for-advanced-file-operations/
 
featured_image: /images/almalinux.webp
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux how-to'
---
In modern Linux environments, secure file transfers between systems are crucial for efficient system administration and data management. **SCP (Secure Copy Protocol)** is a command-line utility that allows you to securely transfer files between a local machine and a remote server using **SSH (Secure Shell)**. By leveraging SSH encryption, SCP ensures that your data remains secure during transmission. In this blog post, we will explore how to use SCP for basic and advanced file operations in **AlmaLinux 9**, covering multiple scenarios and examples.
Table of Contents
* Introduction to SCP and SSH

* Why Use SCP for File Transfers?

* Basic SCP Commands for File Transfer

* Advanced SCP Examples* Transferring Directories Recursively

* Using SCP with Different SSH Ports

* SCP with Wildcards for Multiple Files

* SCP with Rate Limits for Bandwidth Control

* Preserving File Permissions and Timestamps

* Automating SCP Operations with SSH Key Authentication

* Common SCP Errors and Troubleshooting

* Conclusion

1. Introduction to SCP and SSH

**SCP (Secure Copy Protocol)** is a method for securely transferring files between local and remote systems. It uses **SSH (Secure Shell)** to encrypt both the commands and the data, ensuring that the transmission remains secure and protected from eavesdropping.

By default, SCP uses the same SSH port (port 22) and authentication methods, making it easy to integrate into any existing SSH setup. SCP is particularly useful when you need to transfer files securely between servers or download/upload data from your local machine to a remote one.
2. Why Use SCP for File Transfers?

SCP offers several advantages for secure file transfers in AlmaLinux 9:
* **Security**: As SCP relies on SSH, all data is encrypted during transmission, ensuring that sensitive information is protected.

* **Simplicity**: SCP uses a familiar syntax similar to basic file copying commands, making it easy to learn and use.

* **Cross-Platform Compatibility**: SCP works on a variety of operating systems that support SSH, including Linux, macOS, and Windows (via tools like PuTTY or OpenSSH).
In environments where secure data transfers are a priority, SCP is a highly reliable tool for moving files between systems.
3. Basic SCP Commands for File Transfer

Let’s start with some basic examples of how to use SCP in AlmaLinux 9.
#### Copying a File from Local to Remote

To copy a file from your local machine to a remote server, use the following syntax:
```bash
scp /path/to/local/file user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/```

This command securely transfers the file `report.txt` to the `/home/admin/backup/` directory on the remote server.
#### Copying a File from Remote to Local

To copy a file from a remote server to your local machine:
```bash
scp user@remote_host:/path/to/remote/file /path/to/local/directory
```

Example:
```bash
scp admin@192.168.1.10:/home/admin/backup/report.txt /home/user/Documents/```

This command downloads the `report.txt` file from the remote server to your local `Documents` folder.
4. Advanced SCP Examples

Once you are familiar with the basic SCP commands, you can extend its functionality with advanced use cases. Below are some powerful examples that demonstrate SCP’s versatility.
#### 1. Transferring Directories Recursively

To copy an entire directory (including subdirectories and files), you can use the `-r` (recursive) option:
```bash
scp -r /path/to/local/directory user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp -r /home/user/Documents/project admin@192.168.1.10:/home/admin/backup/```

This will transfer the `project` directory and all its contents to the remote server.
#### 2. Using SCP with Different SSH Ports

By default, SCP connects over SSH port 22, but if your SSH server is configured to use a different port, use the `-P` option to specify the port:
```bash
scp -P 2022 /path/to/local/file user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp -P 2022 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/```

Here, SCP will connect to the remote server on port **2022**.
#### 3. SCP with Wildcards for Multiple Files

You can use wildcards to copy multiple files matching a pattern. For example, to copy all `.txt` files from a local directory to a remote server:
```bash
scp /path/to/local/*.txt user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp /home/user/Documents/*.txt admin@192.168.1.10:/home/admin/backup/```

This command transfers all `.txt` files in the `Documents` folder to the remote server.
#### 4. SCP with Rate Limits for Bandwidth Control

If you’re working with limited bandwidth or need to prevent SCP from consuming too much network bandwidth, you can use the `-l` option to limit the transfer speed in **Kbits per second**:
```bash
scp -l 1000 /path/to/local/file user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp -l 5000 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/```

This command limits the transfer rate to **5000 Kbps** (5 Mbps).
#### 5. Preserving File Permissions and Timestamps

To ensure that file permissions, timestamps, and ownership are preserved during the transfer, use the `-p` option:
```bash
scp -p /path/to/local/file user@remote_host:/path/to/remote/directory
```

Example:
```bash
scp -p /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/```

This command copies the file and preserves its original metadata (ownership, permissions, etc.).
5. Automating SCP Operations with SSH Key Authentication

To streamline SCP operations, especially for repetitive tasks, you can configure **SSH key authentication** to allow password-less login. This is particularly useful for automation scripts and cron jobs.
#### Step 1: Generate SSH Key Pair

On the local machine, generate an SSH key pair:
```bash
ssh-keygen -t rsa -b 4096```

This creates a public/private key pair. By default, the keys are stored in `~/.ssh/id_rsa` (private) and `~/.ssh/id_rsa.pub` (public).
#### Step 2: Copy the Public Key to the Remote Server

Use `ssh-copy-id` to transfer the public key to the remote server:
```bash
ssh-copy-id user@remote_host```

Once the public key is installed, SCP will no longer require a password for transfers between the two systems.
6. Common SCP Errors and Troubleshooting

Here are a few common SCP issues and how to resolve them:
#### 1. **Permission Denied**
* **Cause**: Incorrect file permissions or missing SSH key.

* **Solution**: Ensure that you have the proper permissions for the destination directory and that the SSH key is correctly installed on the remote server.

#### 2. **Connection Refused**
* **Cause**: The SSH service might not be running, or the firewall could be blocking the connection.

* **Solution**: Verify that SSH is running on the remote server and that the correct port is open in the firewall.

#### 3. **File Not Found**
* **Cause**: The path to the file is incorrect.

* **Solution**: Double-check the file paths on both the local and remote machines to ensure they are correct.

7. Conclusion

SCP is an incredibly useful and secure tool for file transfers between local and remote systems in **AlmaLinux 9**. Whether you need to transfer individual files, directories, or automate secure file operations using SSH keys, SCP provides a robust solution. By mastering both basic and advanced SCP options, you can handle a wide variety of use cases efficiently and securely.

With its integration into the SSH ecosystem, SCP remains an essential tool for system administrators, developers, and anyone working in a distributed or networked environment.
