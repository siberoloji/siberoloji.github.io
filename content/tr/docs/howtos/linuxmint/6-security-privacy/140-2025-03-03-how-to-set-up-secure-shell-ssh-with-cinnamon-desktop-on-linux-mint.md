---
draft: true
title: How to Set Up Secure Shell (SSH) with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Secure Shell (SSH)
translationKey: how-to-set-up-secure-shell-ssh-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up Secure Shell (SSH) on Linux Mint with the Cinnamon desktop.
url: how-to-set-up-secure-shell-ssh-with-cinnamon-desktop-on-linux-mint
weight: 140
date: 2025-03-03
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - secure shell
featured_image: /images/linuxmint1.webp
---
In today's interconnected world, securing your communications and remote access to systems is more important than ever. Secure Shell (SSH) is a cryptographic network protocol that allows secure data communication, remote command-line login, remote command execution, and other secure network services between two networked computers. If you're using Linux Mint with the Cinnamon desktop environment, setting up SSH can be a straightforward process that significantly enhances your system's security and functionality.

This guide will walk you through the steps to set up SSH on Linux Mint with the Cinnamon desktop, covering everything from installation to configuration and best practices for securing your SSH server.

## Table of Contents

1. **Introduction to SSH**
2. **Why Use SSH?**
3. **Prerequisites**
4. **Step 1: Installing OpenSSH Server**
5. **Step 2: Configuring the SSH Server**
6. **Step 3: Connecting to the SSH Server**
7. **Step 4: Securing Your SSH Server**
8. **Step 5: Using SSH Keys for Authentication**
9. **Step 6: Managing SSH Service**
10. **Conclusion**

## 1. Introduction to SSH

SSH, or Secure Shell, is a protocol that provides a secure channel over an unsecured network. It is widely used by system administrators to control web servers, access remote machines, and perform secure file transfers. SSH uses encryption to ensure that all communications between the client and server are secure, making it an essential tool for anyone managing Linux systems.

## 2. Why Use SSH?

- **Security**: SSH encrypts all data transmitted between the client and server, protecting against eavesdropping, connection hijacking, and other attacks.
- **Remote Access**: SSH allows you to access and manage your system from anywhere in the world, provided you have an internet connection.
- **File Transfers**: SSH can be used to securely transfer files between systems using tools like `scp` and `sftp`.
- **Automation**: SSH is often used in scripts and automated tasks to perform remote commands without manual intervention.

## 3. Prerequisites

Before we dive into the setup process, ensure you have the following:

- A machine running Linux Mint with the Cinnamon desktop environment.
- Administrative privileges (sudo access) on the machine.
- A basic understanding of the Linux command line.

## 4. Step 1: Installing OpenSSH Server

The first step in setting up SSH is to install the OpenSSH server software. OpenSSH is the most widely used implementation of the SSH protocol and is available in the default repositories of Linux Mint.

1. **Open a Terminal**: You can open a terminal by pressing `Ctrl + Alt + T` or by searching for "Terminal" in the Cinnamon menu.

2. **Update Your Package List**: Before installing any new software, it's a good idea to update your package list to ensure you have the latest versions available.

   ```bash
   sudo apt update
   ```

3. **Install the OpenSSH Server**: Use the following command to install the OpenSSH server package.

   ```bash
   sudo apt install openssh-server
   ```

4. **Verify the Installation**: Once the installation is complete, you can verify that the SSH service is running by checking its status.

   ```bash
   sudo systemctl status ssh
   ```

   You should see an output indicating that the SSH service is active and running.

## 5. Step 2: Configuring the SSH Server

With the OpenSSH server installed, the next step is to configure it to meet your specific needs. The main configuration file for the SSH server is located at `/etc/ssh/sshd_config`.

1. **Backup the Configuration File**: Before making any changes, it's a good practice to create a backup of the original configuration file.

   ```bash
   sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
   ```

2. **Edit the Configuration File**: Open the configuration file in your preferred text editor. For this example, we'll use `nano`.

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

3. **Common Configuration Options**:

   - **Change the Default SSH Port**: By default, SSH listens on port 22. Changing this to a non-standard port can help reduce the number of automated attacks.

     ```bash
     Port 2222
     ```

   - **Disable Root Login**: Allowing root login over SSH can be a security risk. It's recommended to disable this and use a regular user account with sudo privileges instead.

     ```bash
     PermitRootLogin no
     ```

   - **Limit User Access**: You can specify which users or groups are allowed to connect via SSH.

     ```bash
     AllowUsers yourusername
     ```

   - **Enable Public Key Authentication**: This is more secure than password-based authentication and will be covered in more detail later.

     ```bash
     PubkeyAuthentication yes
     ```

4. **Save and Exit**: After making your changes, save the file and exit the text editor. If you're using `nano`, you can do this by pressing `Ctrl + X`, then `Y`, and `Enter`.

5. **Restart the SSH Service**: To apply the changes, restart the SSH service.

   ```bash
   sudo systemctl restart ssh
   ```

## 6. Step 3: Connecting to the SSH Server

Now that your SSH server is up and running, you can connect to it from another machine using an SSH client.

1. **From a Linux or macOS Machine**: Open a terminal and use the `ssh` command followed by the username and IP address of the server.

   ```bash
   ssh yourusername@192.168.1.100 -p 2222
   ```

   Replace `yourusername` with your actual username, `192.168.1.100` with the IP address of your Linux Mint machine, and `2222` with the port number you configured (if you changed it from the default).

2. **From a Windows Machine**: You can use an SSH client like PuTTY. Enter the IP address and port number in the PuTTY configuration window, then click "Open" to initiate the connection.

3. **First-Time Connection**: The first time you connect to a new SSH server, you'll be prompted to accept the server's fingerprint. Type `yes` and press `Enter` to continue.

4. **Enter Your Password**: If you're using password authentication, you'll be prompted to enter your password. Once authenticated, you'll have access to the remote shell.

## 7. Step 4: Securing Your SSH Server

While SSH is inherently secure, there are additional steps you can take to further harden your SSH server against potential attacks.

1. **Use Strong Passwords**: Ensure that all user accounts on your system have strong, unique passwords. Consider using a password manager to generate and store complex passwords.

2. **Fail2Ban**: Fail2Ban is a tool that can help protect your SSH server by automatically banning IP addresses that exhibit suspicious behavior, such as repeated failed login attempts.

   - **Install Fail2Ban**:

     ```bash
     sudo apt install fail2ban
     ```

   - **Configure Fail2Ban for SSH**: Fail2Ban comes with a default configuration for SSH, but you can customize it by creating a local copy of the configuration file.

     ```bash
     sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
     sudo nano /etc/fail2ban/jail.local
     ```

     Look for the `[sshd]` section and adjust the settings as needed. For example, you can increase the `bantime` to ban IP addresses for a longer period.

   - **Restart Fail2Ban**: After making changes, restart the Fail2Ban service.

     ```bash
     sudo systemctl restart fail2ban
     ```

3. **Disable Password Authentication**: Once you've set up SSH key authentication (covered in the next section), you can disable password authentication entirely to prevent brute-force attacks.

   ```bash
   PasswordAuthentication no
   ```

   Make sure to test your SSH key authentication before disabling password authentication to avoid locking yourself out.

## 8. Step 5: Using SSH Keys for Authentication

SSH keys provide a more secure way to authenticate than passwords. They are also more convenient, as you don't need to type a password every time you connect.

1. **Generate an SSH Key Pair**: On your local machine, generate a new SSH key pair using the `ssh-keygen` command.

   ```bash
   ssh-keygen -t rsa -b 4096
   ```

   You'll be prompted to choose a location to save the keys and optionally set a passphrase for added security.

2. **Copy the Public Key to the Server**: Use the `ssh-copy-id` command to copy your public key to the SSH server.

   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa.pub yourusername@192.168.1.100 -p 2222
   ```

   Replace `yourusername` and `192.168.1.100` with your actual username and server IP address.

3. **Test the SSH Key Authentication**: Try connecting to the server again using SSH. This time, you should be logged in without being prompted for a password.

   ```bash
   ssh yourusername@192.168.1.100 -p 2222
   ```

4. **Disable Password Authentication**: Once you've confirmed that SSH key authentication works, you can disable password authentication by editing the SSH configuration file as described earlier.

## 9. Step 6: Managing SSH Service

Managing the SSH service is an important part of maintaining a secure and reliable system.

1. **Start the SSH Service**: If the SSH service is not running, you can start it with the following command.

   ```bash
   sudo systemctl start ssh
   ```

2. **Stop the SSH Service**: To stop the SSH service, use the following command.

   ```bash
   sudo systemctl stop ssh
   ```

3. **Enable SSH on Boot**: To ensure that the SSH service starts automatically at boot, enable it with the following command.

   ```bash
   sudo systemctl enable ssh
   ```

4. **Disable SSH on Boot**: If you no longer want the SSH service to start automatically, you can disable it.

   ```bash
   sudo systemctl disable ssh
   ```

5. **Check SSH Service Status**: You can check the status of the SSH service at any time to ensure it's running correctly.

   ```bash
   sudo systemctl status ssh
   ```

## 10. Conclusion

Setting up SSH on Linux Mint with the Cinnamon desktop environment is a straightforward process that can greatly enhance the security and functionality of your system. By following the steps outlined in this guide, you can install, configure, and secure your SSH server, allowing you to remotely access and manage your system with confidence.

Remember that security is an ongoing process. Regularly review your SSH configuration, keep your system and software up to date, and follow best practices to ensure that your SSH server remains secure against potential threats.

Whether you're a system administrator managing multiple servers or a home user looking to access your machine remotely, SSH is an invaluable tool that provides a secure and efficient way to connect to your systems. With the knowledge gained from this guide, you're well-equipped to set up and manage SSH on Linux Mint with the Cinnamon desktop.
