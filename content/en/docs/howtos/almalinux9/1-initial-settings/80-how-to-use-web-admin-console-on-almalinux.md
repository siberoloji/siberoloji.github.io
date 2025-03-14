---
title: How to Use Web Admin Console on AlmaLinux
description: In this article, we’ll walk you through the process of setting up and using the Web Admin Console on AlmaLinux.
date: 2024-12-04
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Web Admin Console
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 80
translationKey: how-to-use-web-admin-console-on-almalinux
keywords:
  - AlmaLinux
  - Web Admin Console

featured_image: /images/almalinux.webp
url: web-admin-console-almalinux
---
AlmaLinux, a community-driven Linux distribution, has become a popular choice for users looking for a stable and secure operating system. Its compatibility with Red Hat Enterprise Linux (RHEL) makes it ideal for enterprise environments. One of the tools that simplifies managing AlmaLinux servers is the **Web Admin Console**. This browser-based interface allows administrators to manage system settings, monitor performance, and configure services without needing to rely solely on the command line.

In this article, we’ll walk you through the process of setting up and using the Web Admin Console on AlmaLinux, helping you streamline server administration tasks with ease.

---

### What Is the Web Admin Console?

The Web Admin Console, commonly powered by **Cockpit**, is a lightweight and user-friendly web-based interface for server management. Cockpit provides an intuitive dashboard where you can perform tasks such as:

- Viewing system logs and resource usage.
- Managing user accounts and permissions.
- Configuring network settings.
- Installing and updating software packages.
- Monitoring and starting/stopping services.

It is especially useful for system administrators who prefer a graphical interface or need quick, remote access to manage servers.

---

### Why Use the Web Admin Console on AlmaLinux?

While AlmaLinux is robust and reliable, its command-line-centric nature can be daunting for beginners. The Web Admin Console bridges this gap, offering:

1. **Ease of Use**: No steep learning curve for managing basic system operations.
2. **Efficiency**: Centralized interface for real-time monitoring and quick system adjustments.
3. **Remote Management**: Access your server from any device with a browser.
4. **Security**: Supports HTTPS for secure communications.

---

### Step-by-Step Guide to Setting Up and Using the Web Admin Console on AlmaLinux

#### Step 1: Ensure Your AlmaLinux System is Updated

Before installing the Web Admin Console, ensure your system is up to date. Open a terminal and run the following commands:

```bash
sudo dnf update -y
```

This will update all installed packages to their latest versions.

---

#### Step 2: Install Cockpit on AlmaLinux

The Web Admin Console on AlmaLinux is powered by Cockpit, which is included in AlmaLinux’s default repositories. To install it, use the following command:

```bash
sudo dnf install cockpit -y
```

Once the installation is complete, you need to start and enable the Cockpit service:

```bash
sudo systemctl enable --now cockpit.socket
```

The `--now` flag ensures that the service starts immediately after being enabled.

---

#### Step 3: Configure Firewall Settings

To access the Web Admin Console remotely, ensure that the appropriate firewall rules are in place. By default, Cockpit listens on port `9090`. You’ll need to allow traffic on this port:

```bash
sudo firewall-cmd --permanent --add-service=cockpit
sudo firewall-cmd --reload
```

This ensures that the Web Admin Console is accessible from other devices on your network.

---

#### Step 4: Access the Web Admin Console

With Cockpit installed and the firewall configured, you can now access the Web Admin Console. Open your web browser and navigate to:

```text
https://<your-server-ip>:9090
```

For example, if your server’s IP address is `192.168.1.100`, type:

```text
https://192.168.1.100:9090
```

When accessing the console for the first time, you might encounter a browser warning about an untrusted SSL certificate. This is normal since Cockpit uses a self-signed certificate. You can proceed by accepting the warning.

---

#### Step 5: Log In to the Web Admin Console

You’ll be prompted to log in with your server’s credentials. Use the username and password of a user with administrative privileges. If your AlmaLinux server is integrated with Active Directory or other authentication mechanisms, you can use those credentials as well.

---

### Navigating the Web Admin Console: Key Features

Once logged in, you’ll see a dashboard displaying an overview of your ### How to Use Web Admin Console on AlmaLinux: A Step-by-Step Guide

AlmaLinux, a community-driven Linux distribution, has become a popular choice for users looking for a stable and secure operating system. Its compatibility with Red Hat Enterprise Linux (RHEL) makes it ideal for enterprise environments. One of the tools that simplifies managing AlmaLinux servers is the **Web Admin Console**. This browser-based interface allows administrators to manage system settings, monitor performance, and configure services without needing to rely solely on the command line.

In this article, we’ll walk you through the process of setting up and using the Web Admin Console on AlmaLinux, helping you streamline server administration tasks with ease.

---

AlmaLinux continues to shine as a go-to choice for enterprises, and tools like the Web Admin Console ensure that managing servers doesn’t have to be a daunting task. Whether you’re a seasoned sysadmin or just starting, this tool is worth exploring.system. Below are some key features of the Web Admin Console:

#### 1. **System Status**

- View CPU, memory, and disk usage in real-time.
- Monitor system uptime and running processes.

#### 2. **Service Management**

- Start, stop, enable, or disable services directly from the interface.
- View logs for specific services for troubleshooting.

#### 3. **Networking**

- Configure IP addresses, routes, and DNS settings.
- Manage network interfaces and monitor traffic.

#### 4. **User Management**

- Add or remove user accounts.
- Change user roles and reset passwords.

#### 5. **Software Management**

- Install or remove packages with a few clicks.
- Update system software and check for available updates.

#### 6. **Terminal Access**

- Access a built-in web terminal for advanced command-line operations.

---

### Tips for Using the Web Admin Console Effectively

1. **Secure Your Connection**: Replace the default self-signed certificate with a trusted SSL certificate for enhanced security.
2. **Enable Two-Factor Authentication (2FA)**: If applicable, add an extra layer of protection to your login process.
3. **Monitor Logs Regularly**: Use the console’s logging feature to stay ahead of potential issues by catching warning signs early.
4. **Limit Access**: Restrict access to the Web Admin Console by configuring IP whitelists or setting up a VPN.

---

### Troubleshooting Common Issues

1. **Unable to Access Cockpit:**
   - Verify that the service is running: `sudo systemctl status cockpit.socket`.
   - Check firewall rules to ensure port `9090` is open.

2. **Browser Warnings:**
   - Import a valid SSL certificate to eliminate warnings about insecure connections.

3. **Performance Issues:**
   - Ensure your server meets the hardware requirements to run both AlmaLinux and Cockpit efficiently.

---

### Conclusion

The Web Admin Console on AlmaLinux, powered by Cockpit, is an invaluable tool for both novice and experienced administrators. Its graphical interface simplifies server management, providing a centralized platform for monitoring and configuring system resources, services, and more. By following the steps outlined in this guide, you’ll be able to set up and use the Web Admin Console with confidence, streamlining your administrative tasks and improving efficiency.

AlmaLinux continues to shine as a go-to choice for enterprises, and tools like the Web Admin Console ensure that managing servers doesn’t have to be a daunting task. Whether you’re a seasoned sysadmin or just starting, this tool is worth exploring.
