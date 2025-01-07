---
title: How to Configure Linux, Mac, and Windows Proxy Clients on AlmaLinux
linkTitle: Linux, Mac, and Windows Proxy Clients
description: In this article, we’ll provide a step-by-step guide on how to configure Linux, Mac, and Windows clients to use a proxy server hosted on AlmaLinux.
date: 2024-12-28
weight: 1360
url: configure-linux-mac-windows-proxy-clients-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux


featured_image: /images/almalinux.webp
---
Proxy servers are indispensable tools for optimizing network performance, enhancing security, and controlling internet usage. Once you’ve set up a proxy server on AlmaLinux, the next step is configuring clients to route their traffic through the proxy. Proper configuration ensures seamless communication between devices and the proxy server, regardless of the operating system.

In this article, we’ll provide a step-by-step guide on how to configure **Linux**, **Mac**, and **Windows** clients to use a proxy server hosted on AlmaLinux.

---

### **Why Use a Proxy Server?**

Proxy servers act as intermediaries between client devices and the internet. By configuring clients to use a proxy, you gain the following benefits:

1. **Bandwidth Optimization:** Cache frequently accessed resources to reduce data consumption.
2. **Enhanced Security:** Mask client IP addresses, filter content, and inspect traffic.
3. **Access Control:** Restrict or monitor internet access for users or devices.
4. **Improved Speed:** Accelerate browsing by caching static content locally.

---

### **Prerequisites**

Before configuring clients, ensure the following:

1. A **proxy server** (e.g., Squid) is installed and configured on AlmaLinux.
2. The proxy server’s IP address (e.g., `192.168.1.100`) and port number (e.g., `3128`) are known.
3. Clients have access to the proxy server on the network.

---

### **Step 1: Configure Linux Proxy Clients**

Linux systems can be configured to use a proxy in various ways, depending on the desktop environment and command-line tools.

#### **1.1 Configure Proxy via GNOME Desktop Environment**

1. Open the **Settings** application.
2. Navigate to **Network** or **Wi-Fi**, depending on your connection type.
3. Scroll to the **Proxy** section and select **Manual**.
4. Enter the proxy server’s IP address and port for HTTP, HTTPS, and FTP.
   - For example:
     - HTTP Proxy: `192.168.1.100`
     - Port: `3128`
5. Save the settings and close the window.

#### **1.2 Configure Proxy for Command-Line Tools**

For command-line utilities such as `curl` or `wget`, you can configure the proxy by setting environment variables:

1. Open a terminal and edit the shell profile file:

   ```bash
   nano ~/.bashrc
   ```

2. Add the following lines:

   ```bash
   export http_proxy="http://192.168.1.100:3128"
   export https_proxy="http://192.168.1.100:3128"
   export ftp_proxy="http://192.168.1.100:3128"
   export no_proxy="localhost,127.0.0.1"
   ```

   - `no_proxy` specifies addresses to bypass the proxy.
3. Apply the changes:

   ```bash
   source ~/.bashrc
   ```

#### **1.3 Configure Proxy for APT Package Manager (Debian/Ubuntu)**

To use a proxy with APT:

1. Edit the configuration file:

   ```bash
   sudo nano /etc/apt/apt.conf.d/95proxies
   ```

2. Add the following lines:

   ```text
   Acquire::http::Proxy "http://192.168.1.100:3128/";
   Acquire::https::Proxy "http://192.168.1.100:3128/";
   ```

3. Save the file and exit.

#### **1.4 Verify Proxy Configuration**

Test the proxy settings using `curl` or `wget`:

```bash
curl -I http://example.com
```

If the response headers indicate the proxy is being used, the configuration is successful.

---

### **Step 2: Configure Mac Proxy Clients**

Mac systems allow proxy configuration through the **System Preferences** interface or using the command line.

#### **2.1 Configure Proxy via System Preferences**

1. Open **System Preferences** and go to **Network**.
2. Select your active connection (Wi-Fi or Ethernet) and click **Advanced**.
3. Navigate to the **Proxies** tab.
4. Check the boxes for the proxy types you want to configure (e.g., HTTP, HTTPS, FTP).
5. Enter the proxy server’s IP address and port.
   - Example:
     - Server: `192.168.1.100`
     - Port: `3128`
6. If the proxy requires authentication, enter the username and password.
7. Click **OK** to save the settings.

#### **2.2 Configure Proxy via Terminal**

1. Open the **Terminal** application.
2. Use the `networksetup` command to configure the proxy:

   ```bash
   sudo networksetup -setwebproxy Wi-Fi 192.168.1.100 3128
   sudo networksetup -setsecurewebproxy Wi-Fi 192.168.1.100 3128
   ```

   Replace `Wi-Fi` with the name of your network interface.

3. To verify the settings, use:

   ```bash
   networksetup -getwebproxy Wi-Fi
   ```

#### **2.3 Bypass Proxy for Specific Domains**

To exclude certain domains from using the proxy:

1. In the **Proxies** tab of **System Preferences**, add domains to the **Bypass proxy settings for these Hosts & Domains** section.
2. Save the settings.

---

### **Step 3: Configure Windows Proxy Clients**

Windows offers multiple methods for configuring proxy settings, depending on your version and requirements.

#### **3.1 Configure Proxy via Windows Settings**

1. Open the **Settings** app.
2. Navigate to **Network & Internet** > **Proxy**.
3. In the **Manual proxy setup** section:
   - Enable the toggle for **Use a proxy server**.
   - Enter the proxy server’s IP address (`192.168.1.100`) and port (`3128`).
   - Optionally, specify addresses to bypass the proxy in the **Don’t use the proxy server for** field.
4. Save the settings.

#### **3.2 Configure Proxy via Internet Options**

1. Open the **Control Panel** and go to **Internet Options**.
2. In the **Connections** tab, click **LAN settings**.
3. Enable the checkbox for **Use a proxy server for your LAN**.
4. Enter the proxy server’s IP address and port.
5. Click **Advanced** to configure separate proxies for HTTP, HTTPS, FTP, and bypass settings.

#### **3.3 Configure Proxy via Command Prompt**

1. Open **Command Prompt** with administrative privileges.
2. Use the `netsh` command to set the proxy:

   ```bash
   netsh winhttp set proxy 192.168.1.100:3128
   ```

3. To verify the configuration:

   ```bash
   netsh winhttp show proxy
   ```

#### **3.4 Configure Proxy via Group Policy (For Enterprises)**

1. Open the **Group Policy Editor** (`gpedit.msc`).
2. Navigate to **User Configuration** > **Administrative Templates** > **Windows Components** > **Internet Explorer** > **Proxy Settings**.
3. Enable the proxy settings and specify the server details.

---

### **Step 4: Verify Proxy Connectivity on All Clients**

To ensure the proxy configuration is working correctly on all platforms:

1. Open a browser and attempt to visit a website.
2. Check if the request is routed through the proxy by monitoring the **access.log** on the AlmaLinux proxy server:

   ```bash
   sudo tail -f /var/log/squid/access.log
   ```

Look for entries corresponding to the client’s IP address.

---

### **Advanced Proxy Configurations**

#### **1. Authentication**

If the proxy server requires authentication:

- Linux: Add `http_proxy` credentials:  

  ```bash
  export http_proxy="http://username:password@192.168.1.100:3128"
  ```

- Mac: Enable authentication in the **Proxies** tab.
- Windows: Provide the username and password when prompted.

#### **2. PAC File Configuration**

Proxy Auto-Configuration (PAC) files dynamically define proxy rules. Host the PAC file on the AlmaLinux server and provide its URL to clients.

#### **3. DNS Resolution**

Ensure that DNS settings on all clients are consistent with the proxy server to avoid connectivity issues.

---

### **Conclusion**

Configuring Linux, Mac, and Windows clients to use a proxy server hosted on AlmaLinux is a straightforward process that enhances network management, security, and efficiency. By following the steps outlined in this guide, you can ensure seamless integration of devices into your proxy environment.

Whether for personal use, educational purposes, or corporate networks, proxies offer unparalleled control over internet access and resource optimization.
