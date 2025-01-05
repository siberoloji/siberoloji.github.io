---
title: Setting Up Time Synchronization and Secure Shell on AlmaLinux 9
description: We'll cover how to set up NTP (Network Time Protocol) for precise timekeeping and configure SSH (Secure Shell) for secure remote management on AlmaLinux 9.
linkTitle: Time Synchronization
date: 2024-11-28
type: blog
draft: false
toc: true
tags:
  - ntp
  - ssh
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

featured_image: /images/almalinux.webp
sidebar:
  open: true
keywords:
  - Time Synchronization
  - secure shell
url: setting-time-synchronization-secure-shell-almalinux-9
---
#### **Introduction**

Time synchronization and secure access are critical for maintaining server accuracy and preventing unauthorized access. In this guide, we'll cover how to set up **NTP (Network Time Protocol)** for precise timekeeping and configure **SSH (Secure Shell)** for secure remote management on AlmaLinux 9.

By the end of this post, you’ll ensure your server operates on accurate time and is protected by best SSH practices.

---

## **Part 1: Configuring Time Synchronization (NTP)**

Proper time synchronization is essential for tasks like logging, authentication, and cluster management. AlmaLinux uses **Chrony** as its default NTP service.

---

### **Step 1: Install Chrony**

Chrony provides an efficient and accurate way to keep your server clock synchronized.

1. **Install Chrony**:

   ```bash
   sudo dnf install -y chrony
   ```

2. **Enable and start the service**:

   ```bash
   sudo systemctl enable chronyd --now
   ```

3. **Verify service status**:

   ```bash
   systemctl status chronyd
   ```

---

### **Step 2: Configure Chrony**

By default, Chrony uses public NTP servers. You can customize this configuration as needed.

1. **Edit the Chrony configuration file**:

   ```bash
   sudo nano /etc/chrony.conf
   ```

   - Replace or add NTP servers:

     ```plaintext
     server 0.pool.ntp.org iburst
     server 1.pool.ntp.org iburst
     ```

   - Save the file and restart Chrony:

     ```bash
     sudo systemctl restart chronyd
     ```

2. **Verify synchronization**:

   ```bash
   chronyc sources -v
   ```

---

### **Step 3: Test and Monitor**

Ensure your time synchronization works correctly:

1. **Check the current time**:

   ```bash
   timedatectl
   ```

2. **Force synchronization** (optional):

   ```bash
   sudo chronyc -a makestep
   ```

---

## **Part 2: Configuring Secure Shell (SSH)**

SSH is the backbone of remote server management. Setting it up with best practices enhances both usability and security.

---

### **Step 1: Basic SSH Setup**

1. **Install OpenSSH (if not installed)**:

   ```bash
   sudo dnf install -y openssh-server
   ```

2. **Enable and start SSH**:

   ```bash
   sudo systemctl enable sshd --now
   ```

3. **Check SSH service status**:

   ```bash
   systemctl status sshd
   ```

---

### **Step 2: Secure SSH Access**

Securing your SSH setup helps protect your server from brute force attacks and unauthorized access.

1. **Edit SSH configuration**:

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. **Apply the following changes**:
   - Disable root login:

     ```plaintext
     PermitRootLogin no
     ```

   - Set a shorter authentication timeout:

     ```plaintext
     LoginGraceTime 30
     ```

   - Specify allowed users (optional):

     ```plaintext
     AllowUsers newuser
     ```

3. **Restart SSH**:

   ```bash
   sudo systemctl restart sshd
   ```

---

### **Step 3: Enable SSH Key Authentication**

Using SSH key pairs eliminates the need for passwords and enhances security.

1. **Generate an SSH key on your local machine**:

   ```bash
   ssh-keygen -t rsa -b 4096
   ```

2. **Copy the public key to the server**:

   ```bash
   ssh-copy-id newuser@<server-ip>
   ```

3. **Log in using the key**:

   ```bash
   ssh newuser@<server-ip>
   ```

4. **Disable password authentication** (optional):
   - Edit `/etc/ssh/sshd_config`:

     ```plaintext
     PasswordAuthentication no
     ```

   - Restart SSH:

     ```bash
     sudo systemctl restart sshd
     ```

---

### **Step 4: Advanced SSH Features**

1. **Chroot for SFTP Users**:
   - Create a group for SFTP users:

     ```bash
     sudo groupadd sftpgroup
     ```

   - Restrict SFTP users to their home directories:
     - Update `/etc/ssh/sshd_config`:

       ```plaintext
       Match Group sftpgroup
         ChrootDirectory /home/%u
         ForceCommand internal-sftp
       ```

2. **Port Forwarding**:
   - Forward a local port to a remote server:

     ```bash
     ssh -L 8080:localhost:80 user@remote-host
     ```

3. **Parallel SSH with `pssh`**:
   - Install `pssh`:

     ```bash
     sudo dnf install -y pssh
     ```

   - Run commands on multiple servers:

     ```bash
     pssh -h hosts.txt -i "uptime"
     ```

---

#### **Conclusion**

With NTP configured, your AlmaLinux server is now time-synced and ready for reliable logging and authentication. Secure SSH access ensures only authorized users can manage the system remotely.

---

#### **What’s Next?**

In the next post, we’ll explore **local network configuration** using **Dnsmasq** for DNS and DHCP services. This will enable seamless local name resolution and dynamic IP allocation.
