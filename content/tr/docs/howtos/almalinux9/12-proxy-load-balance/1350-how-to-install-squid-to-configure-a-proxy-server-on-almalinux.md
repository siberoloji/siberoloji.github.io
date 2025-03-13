---
title: How to Install Squid to Configure a Proxy Server on AlmaLinux
linkTitle: Install Squid to Configure a Proxy Server
description: This guide provides a step-by-step process to install and configure Squid Proxy Server on AlmaLinux.
date: 2024-12-23
weight: 1350
url: install-squid-configure-proxy-server-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: install-squid-configure-proxy-server-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
---
Proxy servers play a vital role in managing and optimizing network traffic, improving security, and controlling internet access. One of the most popular tools for setting up a proxy server is **Squid**, an open-source, high-performance caching proxy. Squid supports various protocols like HTTP, HTTPS, and FTP, making it ideal for businesses, educational institutions, and individuals seeking to improve their network's efficiency.

This guide provides a step-by-step process to install and configure Squid Proxy Server on AlmaLinux.

---

### **What is Squid Proxy Server?**

**Squid Proxy Server** acts as an intermediary between client devices and the internet. It intercepts requests, caches content, and enforces access policies. Some of its key features include:

- **Web caching:** Reducing bandwidth consumption by storing frequently accessed content.
- **Access control:** Restricting access to certain resources based on rules.
- **Content filtering:** Blocking specific websites or types of content.
- **Enhanced security:** Hiding client IP addresses and inspecting HTTPS traffic.

With Squid, network administrators can optimize internet usage, monitor traffic, and safeguard network security.

---

### **Benefits of Setting Up a Proxy Server with Squid**

Implementing Squid Proxy Server offers several advantages:

1. **Bandwidth Savings:** Reduces data consumption by caching repetitive requests.
2. **Improved Speed:** Decreases load times for frequently visited sites.
3. **Access Control:** Manages who can access specific resources on the internet.
4. **Enhanced Privacy:** Masks the client’s IP address from external servers.
5. **Monitoring:** Tracks user activity and provides detailed logging.

---

### **Prerequisites for Installing Squid on AlmaLinux**

Before proceeding with the installation, ensure:

1. You have a server running **AlmaLinux** with sudo or root access.
2. Your system is updated.
3. Basic knowledge of terminal commands and networking.

---

### **Step 1: Update AlmaLinux**

Begin by updating your system to ensure all packages and dependencies are up to date:

```bash
sudo dnf update -y
```

---

### **Step 2: Install Squid**

Install Squid using the default package manager, `dnf`:

```bash
sudo dnf install squid -y
```

Verify the installation by checking the version:

```bash
squid -v
```

Once installed, Squid’s configuration files are stored in the following locations:

- **Main configuration file:** `/etc/squid/squid.conf`
- **Access logs:** `/var/log/squid/access.log`
- **Cache logs:** `/var/log/squid/cache.log`

---

### **Step 3: Start and Enable Squid**

Start the Squid service:

```bash
sudo systemctl start squid
```

Enable Squid to start on boot:

```bash
sudo systemctl enable squid
```

Check the service status to confirm it’s running:

```bash
sudo systemctl status squid
```

---

### **Step 4: Configure Squid**

Squid’s behavior is controlled through its main configuration file. Open it with a text editor:

```bash
sudo nano /etc/squid/squid.conf
```

#### **Step 4.1: Define Access Control Lists (ACLs)**

Access Control Lists (ACLs) specify which devices or networks can use the proxy. Add the following lines to allow specific IP ranges:

```text
acl localnet src 192.168.1.0/24
http_access allow localnet
```

Replace `192.168.1.0/24` with your local network’s IP range.

#### **Step 4.2: Change the Listening Port**

By default, Squid listens on port **3128**. You can change this by modifying:

```text
http_port 3128
```

For example, to use port **8080**:

```text
http_port 8080
```

#### **Step 4.3: Configure Caching**

Set cache size and directory to optimize performance. Locate the `cache_dir` directive and adjust the settings:

```text
cache_dir ufs /var/spool/squid 10000 16 256
```

- `ufs` is the storage type.
- `/var/spool/squid` is the cache directory.
- `10000` is the cache size in MB.

#### **Step 4.4: Restrict Access to Specific Websites**

Block websites by adding them to a file and linking it in the configuration:

1. Create a file for blocked sites:

   ```bash
   sudo nano /etc/squid/blocked_sites.txt
   ```

2. Add the domains you want to block:

   ```text
   example.com
   badsite.com
   ```

3. Reference this file in `squid.conf`:

   ```text
   acl blocked_sites dstdomain "/etc/squid/blocked_sites.txt"
   http_access deny blocked_sites
   ```

---

### **Step 5: Apply Changes and Restart Squid**

After making changes to the configuration file, restart the Squid service to apply them:

```bash
sudo systemctl restart squid
```

Verify Squid’s syntax before restarting to ensure there are no errors:

```bash
sudo squid -k parse
```

---

### **Step 6: Configure Clients to Use the Proxy**

To route client traffic through Squid, configure the proxy settings on client devices.

#### for Windows:**

1. Open **Control Panel** > **Internet Options**.
2. Navigate to the **Connections** tab and click **LAN settings**.
3. Check the box for **Use a proxy server** and enter the server’s IP address and port (e.g., 3128).

#### for Linux:**

Set the proxy settings in the network manager or use the terminal:

```bash
export http_proxy="http://<server-ip>:3128"
export https_proxy="http://<server-ip>:3128"
```

---

### **Step 7: Monitor Squid Proxy Logs**

Squid provides logs that help monitor traffic and troubleshoot issues. Use these commands to view logs:

- Access logs:

  ```bash
  sudo tail -f /var/log/squid/access.log
  ```

- Cache logs:

  ```bash
  sudo tail -f /var/log/squid/cache.log
  ```

Logs provide insights into client activity, blocked sites, and overall proxy performance.

---

### **Step 8: Enhance Squid with Authentication**

Add user authentication to restrict proxy usage. Squid supports **basic HTTP authentication**.

1. Install the required package:

   ```bash
   sudo dnf install httpd-tools -y
   ```

2. Create a password file and add users:

   ```bash
   sudo htpasswd -c /etc/squid/passwd username
   ```

   Replace `username` with the desired username. You’ll be prompted to set a password.

3. Configure Squid to use the password file. Add the following lines to `squid.conf`:

   ```text
   auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/passwd
   auth_param basic children 5
   auth_param basic realm Squid Proxy
   auth_param basic credentialsttl 2 hours
   acl authenticated proxy_auth REQUIRED
   http_access allow authenticated
   ```

4. Restart Squid to apply the changes:

   ```bash
   sudo systemctl restart squid
   ```

Now, users will need to provide a username and password to use the proxy.

---

### **Step 9: Test Your Proxy Server**

Use a web browser or a command-line tool to test the proxy:

```bash
curl -x http://<server-ip>:3128 http://example.com
```

Replace `<server-ip>` with your server’s IP address. If the proxy is working correctly, the page will load through Squid.

---

### **Advanced Squid Configurations**

#### **1. SSL Interception**

Squid can intercept HTTPS traffic for content filtering and monitoring. However, this requires generating and deploying SSL certificates.

#### **2. Bandwidth Limitation**

You can set bandwidth restrictions to ensure fair usage:

```text
delay_pools 1
delay_class 1 2
delay_parameters 1 64000/64000 8000/8000
delay_access 1 allow all
```

#### **3. Reverse Proxy**

Squid can act as a reverse proxy to cache and serve content for backend web servers. This improves performance and reduces server load.

---

### **Conclusion**

Setting up a Squid Proxy Server on AlmaLinux is a straightforward process that can significantly enhance network efficiency, security, and control. By following this guide, you’ve learned how to install, configure, and optimize Squid for your specific needs.

Whether you're managing a corporate network, school, or personal setup, Squid provides the tools to monitor, secure, and improve internet usage.
