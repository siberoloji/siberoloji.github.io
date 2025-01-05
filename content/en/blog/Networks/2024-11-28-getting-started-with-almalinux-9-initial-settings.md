---
title: Getting Started with AlmaLinux 9 Initial Settings
description: In this guide, we'll walk you through the fundamental initial settings for AlmaLinux 9 to ensure your system is ready for action.
linkTitle: AlmaLinux 9 Initial Settings
date: 2024-11-28
type: blog
draft: false
toc: true
tags:
  - AlmaLinux
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

featured_image: /images/almalinux.webp


keywords:
  - almalinux
url: started-almalinux-9-initial-settings
---
#### **Introduction**

AlmaLinux 9 is a robust and versatile Linux distribution designed to meet the needs of enterprises and individuals alike. Whether you're setting up a server for hosting applications, managing networks, or personal projects, configuring the system with essential initial settings is critical for a secure and efficient environment.

In this guide, we'll walk you through the **fundamental initial settings** for AlmaLinux 9 to ensure your system is ready for action.

---

#### **Step 1: Add a New User**

When installing AlmaLinux, you typically create a root user. While powerful, root access should be minimized to enhance security. Start by creating a non-root user with sudo privileges.

1. **Add a new user**:

   ```bash
   sudo adduser newuser
   ```

2. **Set a password for the user**:

   ```bash
   sudo passwd newuser
   ```

3. **Grant sudo privileges**:

   ```bash
   sudo usermod -aG wheel newuser
   ```

4. **Verify sudo access**:
   - Switch to the new user:

     ```bash
     su - newuser
     ```

   - Run a command requiring sudo:

     ```bash
     sudo dnf update
     ```

---

#### **Step 2: Set Up Firewall and SELinux**

AlmaLinux comes with **firewalld** and **SELinux** for enhanced security. Configuring these properly ensures your system is protected from unauthorized access.

1. **Enable and start the firewall**:

   ```bash
   sudo systemctl enable firewalld --now
   ```

2. **Allow essential services** (e.g., SSH and HTTP):

   ```bash
   sudo firewall-cmd --permanent --add-service=ssh
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --reload
   ```

3. **Check SELinux status**:

   ```bash
   sestatus
   ```

4. **Modify SELinux mode (optional)**:
   - If enforcing causes issues with some applications, switch to permissive:

     ```bash
     sudo setenforce 0
     sudo sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
     ```

---

#### **Step 3: Configure Network Settings**

Properly setting up your network is essential, especially for servers requiring static IPs.

1. **Set a static IP using `nmcli`**:

   ```bash
   nmcli connection modify eth0 ipv4.addresses 192.168.1.100/24 ipv4.gateway 192.168.1.1 ipv4.dns 8.8.8.8 ipv4.method manual
   nmcli connection up eth0
   ```

2. **Verify network configuration**:

   ```bash
   ip addr
   ```

---

#### **Step 4: Enable or Disable Services**

Managing services ensures your system runs only what it needs, improving performance and security.

1. **List all services**:

   ```bash
   systemctl list-unit-files
   ```

2. **Enable a critical service** (e.g., SSH):

   ```bash
   sudo systemctl enable sshd --now
   ```

3. **Disable unnecessary services**:

   ```bash
   sudo systemctl disable <service_name> --now
   ```

---

#### **Step 5: Update the System and Add Repositories**

Keeping your system up-to-date ensures you have the latest security patches and features.

1. **Update AlmaLinux**:

   ```bash
   sudo dnf update -y
   ```

2. **Enable additional repositories (e.g., EPEL)**:

   ```bash
   sudo dnf install -y epel-release
   ```

---

#### **Step 6: Use the Web Admin Console**

AlmaLinux includes **Cockpit**, a powerful web-based admin console for managing your server.

1. **Install Cockpit**:

   ```bash
   sudo dnf install -y cockpit
   sudo systemctl enable cockpit.socket --now
   ```

2. **Access the console**:
   - Open a browser and navigate to:

     ```plaintext
     https://<server-ip>:9090
     ```

   - Log in using your server credentials.

---

#### **Step 7: Customize Vim and Sudo Settings**

Finally, personalizing your environment improves productivity.

1. **Set up Vim preferences**:
   - Create or edit `~/.vimrc`:

     ```plaintext
     set number
     syntax on
     set expandtab
     set shiftwidth=4
     ```

2. **Customize sudo behavior**:
   - Edit `/etc/sudoers` (using `visudo`) to modify timeout or logging:

     ```plaintext
     Defaults timestamp_timeout=15
     ```

---

#### **Conclusion**

By completing these steps, you’ve laid a solid foundation for working with AlmaLinux 9. From user management to securing your system with firewalls and SELinux, these configurations prepare your server for advanced setups like application hosting, networking, or virtualization.

---

#### **What’s Next?**

In the next post, we’ll dive into **time synchronization (NTP)** and **secure shell configurations (SSH)** to ensure your server is synchronized and accessible securely.

Stay tuned, and don’t forget to share your experiences and tips in the comments below!
