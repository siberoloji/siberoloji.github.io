---
title: How to Set Up VNC Client noVNC on AlmaLinux
linkTitle: Set Up VNC Client noVNC
description: In this guide, we’ll walk you through the step-by-step process of setting up noVNC on AlmaLinux
date: 2025-01-08T11:39:57.475Z
weight: 1880
url: set-vnc-client-novnc-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - novnc
featured_image: /images/almalinux.webp
---
noVNC is a browser-based VNC (Virtual Network Computing) client that provides remote desktop access without requiring additional software on the client machine. By utilizing modern web technologies like HTML5 and WebSockets, noVNC allows users to connect to a VNC server directly from a web browser, making it a lightweight, platform-independent, and convenient solution for remote desktop management.

In this guide, we’ll walk you through the step-by-step process of setting up noVNC on AlmaLinux, a robust and secure enterprise-grade Linux distribution.

---

### **Why Choose noVNC?**

noVNC offers several advantages over traditional VNC clients:

1. **Browser-Based**: Eliminates the need to install standalone VNC client software.
2. **Cross-Platform Compatibility**: Works on any modern web browser, regardless of the operating system.
3. **Lightweight**: Requires minimal resources, making it ideal for resource-constrained environments.
4. **Convenient for Remote Access**: Provides instant access to remote desktops via a URL.

---

### **Prerequisites**

Before we begin, ensure you have the following:

1. **AlmaLinux Installed**: A fresh or existing installation of AlmaLinux with administrative access.
2. **VNC Server Configured**: A working VNC server, such as TigerVNC, installed and configured on your server.
3. **Root or Sudo Access**: Required for software installation and configuration.
4. **Stable Internet Connection**: For downloading packages and accessing the noVNC client.

---

### **Step 1: Update Your AlmaLinux System**

As always, start by updating your system to ensure you have the latest packages and security patches:

```bash
sudo dnf update -y
```

---

### **Step 2: Install Required Dependencies**

noVNC requires several dependencies, including Python and web server tools, to function correctly.

#### Install Python and pip
Install Python 3 and pip:

```bash
sudo dnf install -y python3 python3-pip
```

Verify the installation:

```bash
python3 --version
pip3 --version
```

#### Install Websockify
Websockify acts as a bridge between noVNC and the VNC server, enabling the use of WebSockets. Install it using pip:

```bash
sudo pip3 install websockify
```

---

### **Step 3: Download and Set Up noVNC**

#### Clone the noVNC Repository
Download the latest noVNC source code from its GitHub repository:

```bash
git clone https://github.com/novnc/noVNC.git
```

Move into the noVNC directory:

```bash
cd noVNC
```

#### Verify the Files
Ensure the `utils` directory exists, as it contains important scripts such as `novnc_proxy`:

```bash
ls utils/
```

---

### **Step 4: Configure and Start the VNC Server**

Ensure that a VNC server (e.g., TigerVNC) is installed and running. If you don’t have one installed, you can install and configure TigerVNC as follows:

```bash
sudo dnf install -y tigervnc-server
```

#### Start a VNC Session
Start a VNC session for a user (e.g., `vncuser`):

```bash
vncserver :1
```

- `:1` indicates display 1, which corresponds to port `5901`.
- Set a VNC password when prompted.

To stop the VNC server:

```bash
vncserver -kill :1
```

For detailed configuration, refer to the [How to Configure VNC Server on AlmaLinux](#) guide.

---

### **Step 5: Run noVNC**

#### Start the Websockify Proxy
To connect noVNC to the VNC server, start the Websockify proxy. Replace `5901` with the port your VNC server is running on:

```bash
./utils/novnc_proxy --vnc localhost:5901
```

The output will display the URL to access noVNC, typically:

```
http://0.0.0.0:6080
```

Here:
- `6080` is the default port for noVNC.
- The URL allows you to access the VNC server from any modern browser.

#### Test the Connection
Open a web browser and navigate to:

```
http://<server-ip>:6080
```

Replace `<server-ip>` with the IP address of your AlmaLinux server. Enter the VNC password when prompted to access the remote desktop.

---

### **Step 6: Set Up noVNC as a Service**

To ensure noVNC runs automatically on boot, set it up as a systemd service.

#### Create a Service File
Create a systemd service file for noVNC:

```bash
sudo nano /etc/systemd/system/novnc.service
```

Add the following content to the file:

```plaintext
[Unit]
Description=noVNC Server
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/python3 /path/to/noVNC/utils/novnc_proxy --vnc localhost:5901
Restart=always

[Install]
WantedBy=multi-user.target
```

Replace `/path/to/noVNC` with the path to your noVNC directory.

#### Reload Systemd and Start the Service
Reload the systemd daemon to recognize the new service:

```bash
sudo systemctl daemon-reload
```

Start and enable the noVNC service:

```bash
sudo systemctl start novnc
sudo systemctl enable novnc
```

Check the status of the service:

```bash
sudo systemctl status novnc
```

---

### **Step 7: Configure the Firewall**

To allow access to the noVNC web client, open port `6080` in the firewall:

```bash
sudo firewall-cmd --permanent --add-port=6080/tcp
sudo firewall-cmd --reload
```

---

### **Step 8: Secure noVNC with SSL**

For secure access, configure noVNC to use SSL encryption.

#### Generate an SSL Certificate
Use OpenSSL to generate a self-signed SSL certificate:

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/novnc.key -out /etc/ssl/certs/novnc.crt
```

- Enter the required details when prompted.
- This generates `novnc.key` and `novnc.crt` in the specified directories.

#### Modify the noVNC Service
Update the noVNC service file to include SSL:

```plaintext
ExecStart=/usr/bin/python3 /path/to/noVNC/utils/novnc_proxy --vnc localhost:5901 --cert /etc/ssl/certs/novnc.crt --key /etc/ssl/private/novnc.key
```

Reload and restart the service:

```bash
sudo systemctl daemon-reload
sudo systemctl restart novnc
```

#### Test Secure Access
Access the noVNC client using `https`:

```
https://<server-ip>:6080
```

---

### **Step 9: Access noVNC from a Browser**

1. **Open the URL**: Navigate to the noVNC URL displayed during setup.
2. **Enter the VNC Password**: Provide the password set during VNC server configuration.
3. **Start the Session**: Once authenticated, you’ll see the remote desktop interface.

---

### **Step 10: Troubleshooting noVNC**

#### Common Issues and Fixes

1. **Black Screen After Login**:
   - Ensure the VNC server is running: `vncserver :1`.
   - Check if the VNC server is using the correct desktop environment.

2. **Cannot Access noVNC Web Interface**:
   - Verify the noVNC service is running: `sudo systemctl status novnc`.
   - Ensure port `6080` is open in the firewall.

3. **Connection Refused**:
   - Confirm that Websockify is correctly linked to the VNC server (`localhost:5901`).

4. **SSL Errors**:
   - Verify the paths to the SSL certificate and key in the service file.
   - Test SSL connectivity using a browser.

---

### **Conclusion**

By setting up noVNC on AlmaLinux, you’ve enabled a powerful, browser-based solution for remote desktop access. This configuration allows you to manage your server graphically from any device without the need for additional software. With steps for securing the connection via SSL, setting up a systemd service, and optimizing performance, this guide ensures a robust and reliable noVNC deployment.

noVNC’s lightweight and platform-independent design, combined with AlmaLinux’s stability, makes this setup ideal for both personal and enterprise environments. Enjoy the convenience of managing your server from anywhere!
