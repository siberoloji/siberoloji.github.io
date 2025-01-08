---
title: How to Configure VNC Server on AlmaLinux
linkTitle: Configure VNC Server
description: This guide provides a detailed walkthrough for setting up and configuring a VNC server on AlmaLinux.
date: 2025-01-08T11:36:43.115Z
weight: 1860
url: configure-vnc-server-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - vnc server
featured_image: /images/almalinux.webp
---
A Virtual Network Computing (VNC) server allows users to remotely access and control a graphical desktop environment on a server using a VNC client. Configuring a VNC server on AlmaLinux can make managing a server easier, especially for users more comfortable with graphical interfaces. This guide provides a detailed walkthrough for setting up and configuring a VNC server on AlmaLinux.

---

### **Why Use a VNC Server on AlmaLinux?**

Using a VNC server on AlmaLinux offers several benefits:

1. **Remote Accessibility**: Access your server's desktop environment from anywhere.
2. **Ease of Use**: Simplifies server management for users who prefer GUI over CLI.
3. **Multiple User Sessions**: Supports simultaneous connections for different users.
4. **Secure Access**: Can be secured with SSH tunneling for encrypted remote connections.

---

### **Prerequisites**

Before proceeding, ensure you have the following:

1. **AlmaLinux Installed**: A clean installation of AlmaLinux with root or sudo access.
2. **GUI Installed**: GNOME or another desktop environment installed. (If not, follow the guide to install GNOME.)
3. **Stable Internet Connection**: Required for package downloads and remote access.
4. **VNC Client**: A VNC client like [TigerVNC Viewer](https://tigervnc.org/) installed on your local machine for testing.

---

### **Step 1: Update the System**

Start by updating your AlmaLinux system to ensure all packages are up to date:

```bash
sudo dnf update -y
```

This ensures you have the latest versions of the software and dependencies.

---

### **Step 2: Install the VNC Server**

AlmaLinux supports the TigerVNC server, which is reliable and widely used.

#### Install TigerVNC Server
Run the following command to install the TigerVNC server:

```bash
sudo dnf install -y tigervnc-server
```

---

### **Step 3: Create a VNC User**

It's recommended to create a dedicated user for the VNC session to avoid running it as the root user.

#### Add a New User
Create a new user (e.g., `vncuser`) and set a password:

```bash
sudo adduser vncuser
sudo passwd vncuser
```

#### Assign User Permissions
Ensure the user has access to the graphical desktop environment. For GNOME, no additional configuration is usually required.

---

### **Step 4: Configure the VNC Server**

Each VNC user needs a configuration file to define their VNC session.

#### Create a VNC Configuration File
Create a VNC configuration file for the user. Replace `vncuser` with your username:

```bash
sudo nano /etc/systemd/system/vncserver@:1.service
```

Add the following content to the file:

```plaintext
[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target

[Service]
Type=forking
User=vncuser
Group=vncuser
WorkingDirectory=/home/vncuser

ExecStart=/usr/bin/vncserver :1 -geometry 1280x1024 -depth 24
ExecStop=/usr/bin/vncserver -kill :1

[Install]
WantedBy=multi-user.target
```

- `:1` specifies the display number for the VNC session (e.g., `:1` means port `5901`, `:2` means port `5902`).
- Adjust the geometry and depth parameters as needed for your screen resolution.

Save and exit the file.

#### Reload the Systemd Daemon
Reload the systemd configuration to recognize the new service:

```bash
sudo systemctl daemon-reload
```

---

### **Step 5: Set Up a VNC Password**

Switch to the `vncuser` account:

```bash
sudo su - vncuser
```

Set a VNC password for the user by running:

```bash
vncpasswd
```

You'll be prompted to enter and confirm a password. You can also set a "view-only" password if needed, but it's optional.

Exit the `vncuser` account:

```bash
exit
```

---

### **Step 6: Start and Enable the VNC Service**

Start the VNC server service:

```bash
sudo systemctl start vncserver@:1
```

Enable the service to start automatically on boot:

```bash
sudo systemctl enable vncserver@:1
```

Verify the status of the service:

```bash
sudo systemctl status vncserver@:1
```

---

### **Step 7: Configure the Firewall**

To allow VNC connections, open the required ports in the firewall. By default, VNC uses port `5900` + display number. For display `:1`, the port is `5901`.

#### Open VNC Ports
Run the following command to open port `5901`:

```bash
sudo firewall-cmd --permanent --add-port=5901/tcp
sudo firewall-cmd --reload
```

If you are using multiple VNC sessions, open additional ports as needed (e.g., `5902` for `:2`).

---

### **Step 8: Secure the Connection with SSH Tunneling**

VNC connections are not encrypted by default. For secure access, use SSH tunneling.

#### Create an SSH Tunnel
On your local machine, establish an SSH tunnel to the server. Replace `user`, `server_ip`, and `5901` with appropriate values:

```bash
ssh -L 5901:localhost:5901 user@server_ip
```

This command forwards the local port `5901` to the server's port `5901` securely.

#### Connect via VNC Client
Open your VNC client and connect to `localhost:5901`. The SSH tunnel encrypts the connection, ensuring secure remote access.

---

### **Step 9: Access the VNC Server**

With the VNC server configured and running, you can connect from your local machine using a VNC client:

1. **Open Your VNC Client**: Launch your preferred VNC client.
2. **Enter the Server Address**: Use `<server_ip>:1` if connecting directly or `localhost:1` if using SSH tunneling.
3. **Authenticate**: Enter the VNC password you set earlier.
4. **Access the Desktop**: You’ll be presented with the graphical desktop environment.

---

### **Step 10: Manage and Troubleshoot the VNC Server**

#### Stopping the VNC Server
To stop a VNC session, use:

```bash
sudo systemctl stop vncserver@:1
```

#### Restarting the VNC Server
To restart the VNC server:

```bash
sudo systemctl restart vncserver@:1
```

#### Logs for Debugging
If you encounter issues, check the VNC server logs for details:

```bash
cat /home/vncuser/.vnc/*.log
```

---

### **Step 11: Optimizing the VNC Server**

To improve the performance of your VNC server, consider the following:

1. **Adjust Resolution**: Use a lower resolution for faster performance on slower connections. Modify the `-geometry` setting in the service file.
2. **Disable Unnecessary Effects**: For GNOME, disable animations to reduce resource usage.
3. **Use a Lightweight Desktop Environment**: If GNOME is too resource-intensive, consider using a lightweight desktop environment like XFCE or MATE.

---

### **Conclusion**

Configuring a VNC server on AlmaLinux provides a convenient way to manage your server using a graphical interface. By following this guide, you’ve installed and configured the TigerVNC server, set up user-specific VNC sessions, secured the connection with SSH tunneling, and optimized the setup for better performance.

AlmaLinux's stability, combined with VNC's remote desktop capabilities, creates a powerful and flexible system for remote management. Whether you’re administering a server or running graphical applications, the VNC server makes it easier to work efficiently and securely.
