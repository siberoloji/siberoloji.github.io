---
draft: true
title: How to Configure Proxy Settings with Cinnamon Desktop on Linux Mint
linkTitle: Configure Proxy Settings
translationKey: how-to-configure-proxy-settings-with-cinnamon-desktop-on-linux-mint
description: Learn how to configure proxy settings on Linux Mint Cinnamon using the GUI, environment variables, and terminal commands for system-wide use.
url: how-to-configure-proxy-settings-with-cinnamon-desktop-on-linux-mint
weight: 40
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Cinnamon Desktop
  - Proxy Settings
featured_image: /images/linuxmint1.webp
---
Linux Mint, known for its user-friendly interface and stability, is a popular choice among Linux users. If you are using the Cinnamon Desktop environment and need to configure proxy settings, whether for privacy, security, or accessing restricted content, this guide will help you set up a proxy on your Linux Mint system.

### **Why Use a Proxy on Linux Mint?**  

A proxy server acts as an intermediary between your computer and the internet. Configuring a proxy in Linux Mint can help you:  

- Improve privacy by masking your IP address  
- Bypass geo-restrictions on websites and services  
- Enhance security by filtering harmful content  
- Control network access in a corporate or institutional setting  

### **Methods to Configure Proxy Settings in Linux Mint Cinnamon**  

There are multiple ways to configure proxy settings on Linux Mint Cinnamon, including:  

1. **Using the Cinnamon GUI (Graphical Interface)**  
2. **Configuring Proxy via Environment Variables**  
3. **Using a Proxy with Specific Applications**  
4. **Setting up Proxy via Terminal for System-wide Use**  

Let’s go through each method in detail.

---

## **1. Configuring Proxy Settings via Cinnamon Desktop GUI**  

The Cinnamon Desktop environment provides a graphical interface to configure proxy settings easily.

### **Step 1: Open Network Proxy Settings**  

1. Click on the **Menu** button in the bottom-left corner.  
2. Search for **Network** and open the **Network** settings.  
3. In the **Network Settings** window, locate the **Network Proxy** tab on the left side.

### **Step 2: Choose a Proxy Configuration Method**  

You will see three main options:  

- **None**: No proxy is used (default).  
- **Manual**: Allows you to enter proxy server details manually.  
- **Automatic**: Uses a PAC (Proxy Auto-Configuration) file.

#### **Manual Proxy Setup**  

1. Select **Manual**.  
2. Enter the proxy server details for different protocols:  
   - **HTTP Proxy**: Enter the server address and port (e.g., `192.168.1.1:8080`).  
   - **HTTPS Proxy**: Enter details if different from HTTP.  
   - **FTP Proxy**: Used for FTP connections.  
   - **Socks Host**: If using a SOCKS proxy, enter the host and port.  
3. If authentication is required, enable the **"Use authentication"** option and enter your username and password.  
4. Click **Apply system-wide** to ensure the settings are used across the system.

#### **Automatic Proxy Setup (PAC File)**  

1. Select **Automatic**.  
2. Enter the URL of the PAC file provided by your network administrator.  
3. Click **Apply system-wide** to activate the settings.

---

## **2. Configuring Proxy via Environment Variables**  

Another way to configure a proxy is by setting environment variables. This method is useful if you need the proxy to work in the terminal and command-line applications.

### **Step 1: Edit Bash Profile or Environment File**  

To apply the proxy settings for all users, edit the `/etc/environment` file:  

```bash
sudo nano /etc/environment
```

Add the following lines, replacing `<proxy_address>` and `<port>` with your actual proxy server details:

```bash
http_proxy="http://<proxy_address>:<port>/"
https_proxy="https://<proxy_address>:<port>/"
ftp_proxy="ftp://<proxy_address>:<port>/"
no_proxy="localhost,127.0.0.1"
```

Save the file (`CTRL+X`, then `Y`, then `ENTER`).

### **Step 2: Apply Changes**  

For the changes to take effect, reboot your system or reload the environment variables:

```bash
source /etc/environment
```

---

## **3. Configuring Proxy for Specific Applications**  

Some applications require proxy settings to be configured separately. Here are a few examples:

### **1. Firefox Browser**  

1. Open Firefox.  
2. Go to **Settings** → **General**.  
3. Scroll down to **Network Settings** and click **Settings**.  
4. Select **Manual proxy configuration** and enter your proxy details.  
5. Click **OK** to apply changes.

### **2. Google Chrome & Chromium**  

For Chrome or Chromium-based browsers, start them with a proxy command:  

```bash
google-chrome --proxy-server="http://<proxy_address>:<port>"
```

Alternatively, install a Chrome extension like **"Proxy SwitchyOmega"** for easier management.

### **3. APT Package Manager (for Installing Software via Terminal)**  

If you use `apt` to install software, configure its proxy settings:  

```bash
sudo nano /etc/apt/apt.conf.d/proxy
```

Add:

```bash
Acquire::http::Proxy "http://<proxy_address>:<port>/";
Acquire::https::Proxy "https://<proxy_address>:<port>/";
```

Save and exit.

---

## **4. Setting Up Proxy via Terminal for System-wide Use**  

If you prefer using the terminal to configure the proxy system-wide, you can use these commands.

### **Setting Proxy Temporarily in Terminal**  

For a temporary proxy (session-based), run:

```bash
export http_proxy="http://<proxy_address>:<port>/"
export https_proxy="https://<proxy_address>:<port>/"
export ftp_proxy="ftp://<proxy_address>:<port>/"
export no_proxy="localhost,127.0.0.1"
```

This setting is only active for the current terminal session.

### **Setting Proxy Permanently**  

To make the changes permanent, add the export commands to the `.bashrc` or `.bash_profile` file:

```bash
nano ~/.bashrc
```

Add:

```bash
export http_proxy="http://<proxy_address>:<port>/"
export https_proxy="https://<proxy_address>:<port>/"
export ftp_proxy="ftp://<proxy_address>:<port>/"
export no_proxy="localhost,127.0.0.1"
```

Save the file and reload the settings:

```bash
source ~/.bashrc
```

---

## **Testing Proxy Configuration**  

After configuring your proxy, test if it’s working.

### **1. Check IP Address via Terminal**  

Run:

```bash
curl ifconfig.me
```

This will return your public IP. If the proxy is configured correctly, it should display the proxy server's IP instead of your real one.

### **2. Verify Proxy in Web Browser**  

Visit [https://whatismyipaddress.com/](https://whatismyipaddress.com/) in your browser to confirm your IP address has changed.

### **3. Test APT Proxy Configuration**  

Run:

```bash
sudo apt update
```

If it fetches package lists successfully, the proxy settings are correctly configured.

---

## **Conclusion**  

Setting up a proxy on Linux Mint Cinnamon can be done through the graphical settings, environment variables, or individual applications. Whether you need a proxy for privacy, security, or bypassing restrictions, following these methods will ensure you have a smooth browsing and networking experience.

Would you like to automate proxy switching or troubleshoot common proxy issues? Let me know in the comments! 🚀
