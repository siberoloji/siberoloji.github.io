---
title: How to Configure Xrdp Server on AlmaLinux
linkTitle: Configure Xrdp Server
description: This article will guide you through the step-by-step process of installing and configuring an Xrdp server on AlmaLinux.
date: 2025-01-08T11:38:40.113Z
weight: 1870
url: configure-xrdp-server-almalinux
translationKey: configure-xrdp-server-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - xrdp server
featured_image: /images/almalinux.webp
---
Xrdp is an open-source Remote Desktop Protocol (RDP) server that allows users to access a graphical desktop environment on a Linux server from a remote machine using any RDP client. Configuring Xrdp on AlmaLinux provides a seamless way to manage your server with a graphical interface, making it particularly useful for those who prefer GUI over CLI or need remote desktop access for specific applications.

This article will guide you through the step-by-step process of installing and configuring an Xrdp server on AlmaLinux.

---

### **Why Use Xrdp on AlmaLinux?**

There are several advantages to using Xrdp:

1. **Cross-Platform Compatibility**: Connect from any device with an RDP client, including Windows, macOS, and Linux.
2. **Ease of Use**: Provides a graphical interface for easier server management.
3. **Secure Access**: Supports encryption and SSH tunneling for secure connections.
4. **Efficient Resource Usage**: Lightweight and faster compared to some other remote desktop solutions.

---

### **Prerequisites**

Before starting, ensure you have the following:

1. **AlmaLinux Installed**: A clean installation of AlmaLinux 8 or 9.
2. **Root or Sudo Privileges**: Required for installing and configuring software.
3. **Desktop Environment**: GNOME, XFCE, or another desktop environment must be installed on the server.

---

### **Step 1: Update Your AlmaLinux System**

Start by updating your system to ensure all packages and dependencies are up-to-date:

```bash
sudo dnf update -y
```

---

### **Step 2: Install a Desktop Environment**

If your AlmaLinux server doesn’t already have a graphical desktop environment, you need to install one. GNOME is the default choice for AlmaLinux, but you can also use lightweight environments like XFCE.

#### Install GNOME Desktop Environment

Run the following command to install GNOME:

```bash
sudo dnf groupinstall -y "Server with GUI"
```

#### Set the Graphical Target

Ensure the system starts in graphical mode:

```bash
sudo systemctl set-default graphical.target
```

Reboot the server to apply changes:

```bash
sudo reboot
```

---

### **Step 3: Install Xrdp**

Xrdp is available in the EPEL (Extra Packages for Enterprise Linux) repository. First, enable EPEL:

```bash
sudo dnf install -y epel-release
```

Next, install Xrdp:

```bash
sudo dnf install -y xrdp
```

Verify the installation by checking the version:

```bash
xrdp --version
```

---

### **Step 4: Start and Enable the Xrdp Service**

After installing Xrdp, start the service and enable it to run at boot:

```bash
sudo systemctl start xrdp
sudo systemctl enable xrdp
```

Check the status of the Xrdp service:

```bash
sudo systemctl status xrdp
```

If the service is running, you should see an output indicating that Xrdp is active.

---

### **Step 5: Configure Firewall Rules**

To allow RDP connections to your server, open port `3389`, which is the default port for Xrdp.

#### Open Port 3389

Run the following commands to update the firewall:

```bash
sudo firewall-cmd --permanent --add-port=3389/tcp
sudo firewall-cmd --reload
```

---

### **Step 6: Configure Xrdp for Your Desktop Environment**

By default, Xrdp uses the `Xvnc` backend to connect users to the desktop environment. For a smoother experience with GNOME or XFCE, configure Xrdp to use the appropriate session.

#### Configure GNOME Session

Edit the Xrdp startup script for the GNOME session:

```bash
sudo nano /etc/xrdp/startwm.sh
```

Replace the existing content with the following:

```bash
#!/bin/sh
unset DBUS_SESSION_BUS_ADDRESS
exec /usr/bin/gnome-session
```

Save the file and exit.

#### Configure XFCE Session (Optional)

If you installed XFCE instead of GNOME, update the startup script:

```bash
sudo nano /etc/xrdp/startwm.sh
```

Replace the content with:

```bash
#!/bin/sh
unset DBUS_SESSION_BUS_ADDRESS
exec startxfce4
```

Save the file and exit.

---

### **Step 7: Secure Xrdp with SELinux**

If SELinux is enabled on your system, you need to configure it to allow Xrdp connections.

#### Allow Xrdp with SELinux

Run the following command to allow Xrdp through SELinux:

```bash
sudo setsebool -P xrdp_connect_all_unconfined 1
```

If you encounter issues, check the SELinux logs for denials and create custom policies as needed.

---

### **Step 8: Test the Xrdp Connection**

With Xrdp configured and running, it’s time to test the connection from a remote machine.

1. **Open an RDP Client**: Use any RDP client (e.g., Remote Desktop Connection on Windows, Remmina on Linux).
2. **Enter the Server Address**: Specify your server’s IP address or hostname, followed by the default port `3389` (e.g., `192.168.1.100:3389`).
3. **Authenticate**: Enter the username and password of a user account on the AlmaLinux server.

Once authenticated, you should see the desktop environment.

---

### **Step 9: Optimize Xrdp Performance**

For better performance, especially on slow networks, consider the following optimizations:

1. **Reduce Screen Resolution**:
   Use a lower resolution in your RDP client settings to reduce bandwidth usage.

2. **Switch to a Lightweight Desktop**:
   XFCE or MATE consumes fewer resources than GNOME, making it ideal for servers with limited resources.

3. **Enable Compression**:
   Some RDP clients allow you to enable compression for faster connections.

---

### **Step 10: Enhance Security for Xrdp**

While Xrdp is functional after installation, securing the server is crucial to prevent unauthorized access.

#### Restrict Access by IP

Limit access to trusted IP addresses using the firewall:

```bash
sudo firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='192.168.1.0/24' port protocol='tcp' port='3389' accept"
sudo firewall-cmd --reload
```

Replace `192.168.1.0/24` with your trusted IP range.

#### Use SSH Tunneling

For encrypted connections, use SSH tunneling. Run the following command on your local machine:

```bash
ssh -L 3389:localhost:3389 user@server_ip
```

Then connect to `localhost:3389` using your RDP client.

#### Change the Default Port

To reduce the risk of unauthorized access, change the default port in the Xrdp configuration:

```bash
sudo nano /etc/xrdp/xrdp.ini
```

Locate the line that specifies `port=3389` and change it to another port (e.g., `port=3390`).

Restart Xrdp to apply the changes:

```bash
sudo systemctl restart xrdp
```

---

### **Troubleshooting Xrdp**

Here are common issues and their solutions:

1. **Black Screen After Login**:
   - Ensure the desktop environment is correctly configured in `/etc/xrdp/startwm.sh`.
   - Check if the user has proper permissions to the graphical session.

2. **Connection Refused**:
   - Verify that the Xrdp service is running: `sudo systemctl status xrdp`.
   - Ensure port `3389` is open in the firewall.

3. **Session Logs Out Immediately**:
   - Check for errors in the Xrdp logs: `/var/log/xrdp.log` and `/var/log/xrdp-sesman.log`.

---

### **Conclusion**

Setting up and configuring Xrdp on AlmaLinux provides a reliable way to remotely access a graphical desktop environment. By following this guide, you’ve installed Xrdp, configured it for your desktop environment, secured it with best practices, and optimized its performance.

Whether you’re managing a server, running graphical applications, or providing remote desktop access for users, Xrdp offers a flexible and efficient solution. With AlmaLinux’s stability and Xrdp’s ease of use, you’re ready to leverage the power of remote desktop connectivity.
