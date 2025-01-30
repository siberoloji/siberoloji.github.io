---
title: Building Your Local Network with DNSmasq and DHCP on AlmaLinux 9
description: In this guide, we’ll set up Dnsmasq to act as a DNS server and DHCP server to simplify local network management.
linkTitle: DNSmasq and DHCP
date: 2024-11-28
type: blog
draft: false

tags:
  - AlmaLinux
  - DHCP
  - DNSmasq
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
featured_image: /images/almalinux.webp

keywords:
  - DNSmasq
  - DHCP
url: building-local-network-dnsmasq-dhcp-almalinux-9
---
#### **Introduction**

Managing local networks can be challenging without proper tools. Enter **Dnsmasq**, a lightweight and versatile solution for providing DNS and DHCP services on a single server. By leveraging Dnsmasq on AlmaLinux 9, you can efficiently configure and manage your network for both name resolution and dynamic IP allocation.

In this guide, we’ll set up Dnsmasq to act as a **DNS server** and **DHCP server** to simplify local network management.

---

## **Part 1: Installing and Configuring Dnsmasq**

Dnsmasq is a streamlined tool that combines DNS caching and DHCP management, making it ideal for small-to-medium networks.

---

### **Step 1: Install Dnsmasq**

1. **Install the package**:

   ```bash
   sudo dnf install -y dnsmasq
   ```

2. **Enable and start the service**:

   ```bash
   sudo systemctl enable dnsmasq --now
   ```

3. **Verify the installation**:

   ```bash
   systemctl status dnsmasq
   ```

---

### **Step 2: Configure Dnsmasq**

Dnsmasq’s configuration file is located at `/etc/dnsmasq.conf`. Here’s how to customize it for your network:

1. **Edit the configuration file**:

   ```bash
   sudo nano /etc/dnsmasq.conf
   ```

2. **Add or update the following settings**:
   - **Enable DNS caching**:

     ```plaintext
     cache-size=1000
     ```

   - **Specify a local DNS domain**:

     ```plaintext
     domain=localdomain
     ```

   - **Set the DHCP range and lease time**:

     ```plaintext
     dhcp-range=192.168.1.50,192.168.1.100,12h
     ```

   - **Assign static IPs using MAC addresses** (optional):

     ```plaintext
     dhcp-host=00:11:22:33:44:55,192.168.1.10
     ```

3. **Save and close the file**, then restart Dnsmasq:

   ```bash
   sudo systemctl restart dnsmasq
   ```

---

### **Step 3: Test Dnsmasq Configuration**

1. **Verify DNS functionality**:
   - Query a domain:

     ```bash
     dig example.com
     ```

   - Check cached responses:

     ```bash
     dig example.com
     ```

2. **Verify DHCP functionality**:
   - On a client, release and renew the IP address:

     ```bash
     sudo dhclient -r && sudo dhclient
     ```

3. **Check assigned IPs**:
   - View leases on the server:

     ```bash
     cat /var/lib/misc/dnsmasq.leases
     ```

---

## **Part 2: Advanced Configuration for DNS and DHCP**

Dnsmasq supports additional features to enhance your local network.

---

### **Step 1: Configure Custom Hostnames**

1. **Edit the `/etc/hosts` file**:

   ```bash
   sudo nano /etc/hosts
   ```

2. **Add custom hostname mappings**:

   ```plaintext
   192.168.1.10 server1.localdomain server1
   192.168.1.11 server2.localdomain server2
   ```

3. **Restart Dnsmasq**:

   ```bash
   sudo systemctl restart dnsmasq
   ```

---

### **Step 2: Integrate with External DNS Servers**

1. **Edit `/etc/dnsmasq.conf`** to specify upstream DNS servers:

   ```plaintext
   server=8.8.8.8
   server=8.8.4.4
   ```

2. **Clear the DNS cache**:

   ```bash
   sudo systemctl restart dnsmasq
   ```

---

### **Step 3: Troubleshooting Dnsmasq**

1. **Check logs for issues**:

   ```bash
   sudo journalctl -u dnsmasq
   ```

2. **Test configuration syntax**:

   ```bash
   sudo dnsmasq --test
   ```

3. **Ensure no port conflicts**:
   - Stop conflicting services:

     ```bash
     sudo systemctl stop systemd-resolved
     ```

---

## **Part 3: Secure and Optimize Dnsmasq**

---

### **Step 1: Restrict DNS Queries**

1. **Limit queries to internal clients**:
   - Add the following to `/etc/dnsmasq.conf`:

     ```plaintext
     interface=eth0
     bind-interfaces
     ```

2. **Restart Dnsmasq**:

   ```bash
   sudo systemctl restart dnsmasq
   ```

---

### **Step 2: Enable Logging**

1. **Enable detailed logging for troubleshooting**:
   - Add to `/etc/dnsmasq.conf`:

     ```plaintext
     log-queries
     log-facility=/var/log/dnsmasq.log
     ```

2. **View logs**:

   ```bash
   tail -f /var/log/dnsmasq.log
   ```

---

### **Step 3: Optimize for Performance**

1. **Increase cache size**:
   - Update `/etc/dnsmasq.conf`:

     ```plaintext
     cache-size=2000
     ```

2. **Enable asynchronous DNS processing**:
   - Add:

     ```plaintext
     dns-forward-max=150
     ```

---

#### **Conclusion**

With Dnsmasq configured, you now have a lightweight and efficient solution for managing DNS and DHCP services on your AlmaLinux 9 server. This setup is perfect for small to medium networks, offering a robust way to handle name resolution and IP allocation.

---

#### **What’s Next?**

In the next post, we’ll delve deeper into **configuring a full-fledged DNS server using BIND** to manage internal and external domains with greater control.
