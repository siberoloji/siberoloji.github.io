---
title: How to Install and Configure Dnsmasq on AlmaLinux
description: In this comprehensive guide, we’ll explore how to install and configure Dnsmasq on AlmaLinux, ensuring optimal performance and security for your network.
date: 2024-12-09
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Install and Configure Dnsmasq
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 230
toc: true
keywords:
   - AlmaLinux
   - Dnsmasq
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: install-configure-dnsmasq-almalinux
---
Dnsmasq is a lightweight and versatile DNS forwarder and DHCP server. It’s ideal for small networks, providing a simple solution to manage DNS queries and distribute IP addresses. For AlmaLinux, a stable and enterprise-ready Linux distribution, Dnsmasq can be an essential tool for network administrators who need efficient name resolution and DHCP services.

In this comprehensive guide, we’ll explore how to install and configure Dnsmasq on AlmaLinux, ensuring optimal performance and security for your network.

---

### What Is Dnsmasq?

Dnsmasq is a compact and easy-to-configure software package that provides DNS caching, forwarding, and DHCP services. It’s widely used in small to medium-sized networks because of its simplicity and flexibility.

Key features of Dnsmasq include:

- **DNS Forwarding**: Resolves DNS queries by forwarding them to upstream servers.
- **DNS Caching**: Reduces latency by caching DNS responses.
- **DHCP Services**: Assigns IP addresses to devices on a network.
- **TFTP Integration**: Facilitates PXE booting for network devices.

---

### Why Use Dnsmasq on AlmaLinux?

Dnsmasq is a great fit for AlmaLinux users due to its:

- **Lightweight Design**: Minimal resource usage, perfect for small-scale deployments.
- **Ease of Use**: Simple configuration compared to full-scale DNS servers like BIND.
- **Versatility**: Combines DNS and DHCP functionalities in a single package.

---

### Step-by-Step Guide to Installing and Configuring Dnsmasq on AlmaLinux

#### Prerequisites

Before you begin:

1. Ensure AlmaLinux is installed and updated:

   ```bash
   sudo dnf update
   ```

2. Have root or `sudo` privileges.

---

### 1. **Install Dnsmasq**

Dnsmasq is available in the AlmaLinux default repositories, making installation straightforward.

1. **Install the package**:

   ```bash
   sudo dnf install dnsmasq
   ```

2. **Verify the installation**:
   Check the installed version:

   ```bash
   dnsmasq --version
   ```

---

### 2. **Backup the Default Configuration File**

It’s always a good idea to back up the default configuration file before making changes.

1. **Create a backup**:

   ```bash
   sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
   ```

2. Open the original configuration file for editing:

   ```bash
   sudo nano /etc/dnsmasq.conf
   ```

---

### 3. **Configure Dnsmasq**

#### Step 1: Set Up DNS Forwarding

Dnsmasq forwards unresolved DNS queries to upstream servers.

1. Add upstream DNS servers in the configuration file:

   ```bash
   server=8.8.8.8
   server=8.8.4.4
   ```

   These are Google’s public DNS servers. Replace them with your preferred DNS servers if needed.

2. Enable caching for faster responses:

   ```bash
   cache-size=1000
   ```

---

#### Step 2: Configure DHCP Services

Dnsmasq can assign IP addresses dynamically to devices on your network.

1. Define the network range for DHCP:

   ```bash
   dhcp-range=192.168.1.50,192.168.1.150,12h
   ```

   Explanation:
   - `192.168.1.50` to `192.168.1.150`: Range of IP addresses to be distributed.
   - `12h`: Lease time for assigned IP addresses (12 hours).

2. Specify a default gateway (optional):

   ```bash
   dhcp-option=3,192.168.1.1
   ```

3. Specify DNS servers for DHCP clients:

   ```bash
   dhcp-option=6,8.8.8.8,8.8.4.4
   ```

---

#### Step 3: Configure Hostnames

You can map static IP addresses to hostnames for specific devices.

1. Add entries in `/etc/hosts`:

   ```bash
   192.168.1.100 device1.local
   192.168.1.101 device2.local
   ```

2. Ensure Dnsmasq reads the `/etc/hosts` file:

   ```bash
   expand-hosts
   domain=local
   ```

---

### 4. **Enable and Start Dnsmasq**

Once configuration is complete, enable and start the Dnsmasq service.

1. **Enable Dnsmasq to start at boot**:

   ```bash
   sudo systemctl enable dnsmasq
   ```

2. **Start the service**:

   ```bash
   sudo systemctl start dnsmasq
   ```

3. **Check the service status**:

   ```bash
   sudo systemctl status dnsmasq
   ```

---

### 5. **Configure Firewall Rules**

If a firewall is enabled, you’ll need to allow DNS and DHCP traffic.

1. Allow DNS (port 53) and DHCP (port 67):

   ```bash
   sudo firewall-cmd --add-service=dns --permanent
   sudo firewall-cmd --add-service=dhcp --permanent
   ```

2. Reload the firewall:

   ```bash
   sudo firewall-cmd --reload
   ```

---

### 6. **Test Your Configuration**

#### Test DNS Resolution

1. Use `dig` or `nslookup` to query a domain:

   ```bash
   dig google.com @127.0.0.1
   ```

2. Check the cache by repeating the query:

   ```bash
   dig google.com @127.0.0.1
   ```

#### Test DHCP

1. Connect a device to the network and check its IP address.
2. Verify the lease in the Dnsmasq logs:

   ```bash
   sudo tail -f /var/log/messages
   ```

---

### Advanced Configuration Options

#### 1. **Block Ads with Dnsmasq**

You can block ads by redirecting unwanted domains to a non-existent address.

1. Add entries in the configuration file:

   ```bash
   address=/ads.example.com/0.0.0.0
   ```

2. Reload the service:

   ```bash
   sudo systemctl restart dnsmasq
   ```

#### 2. **PXE Boot with Dnsmasq**

Dnsmasq can support PXE booting for network devices.

1. Enable TFTP:

   ```bash
   enable-tftp
   tftp-root=/var/lib/tftpboot
   ```

2. Specify the boot file:

   ```bash
   dhcp-boot=pxelinux.0
   ```

---

### Troubleshooting Common Issues

#### Issue 1: "Dnsmasq Service Fails to Start"

- **Cause**: Configuration errors.
- **Solution**: Check the logs for details:

  ```bash
  sudo journalctl -xe
  ```

#### Issue 2: "DHCP Not Assigning IP Addresses"

- **Cause**: Firewall rules blocking DHCP.
- **Solution**: Ensure port 67 is open on the firewall.

#### Issue 3: "DNS Queries Not Resolving"

- **Cause**: Incorrect upstream DNS servers.
- **Solution**: Test the upstream servers with `dig`.

---

### Benefits of Using Dnsmasq

1. **Simplicity**: Easy to configure compared to other DNS/DHCP servers.
2. **Efficiency**: Low resource usage, making it ideal for small environments.
3. **Flexibility**: Supports custom DNS entries, PXE booting, and ad blocking.

---

### Conclusion

Dnsmasq is a lightweight and powerful tool for managing DNS and DHCP services on AlmaLinux. Whether you’re running a home lab, small business network, or development environment, Dnsmasq provides a reliable and efficient solution.

By following this guide, you can install, configure, and optimize Dnsmasq to suit your specific needs. If you have any tips, questions, or experiences to share, feel free to leave a comment below. Happy networking!
