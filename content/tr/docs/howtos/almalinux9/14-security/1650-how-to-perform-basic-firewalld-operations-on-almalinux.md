---
title: How to Make Firewalld Basic Operations on AlmaLinux
linkTitle: Firewalld Basic Operations
description: Learn the essential Firewalld operations on AlmaLinux, including adding services, managing ports, configuring zones, and testing your firewall rules for enhanced security.
date: 2025-01-08T10:36:32.549Z
weight: 1650
url: firewalld-basic-operations-almalinux
translationKey: how-to-perform-basic-firewalld-operations-on-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - firewalld
featured_image: /images/almalinux.webp
---
AlmaLinux has quickly become a popular choice for enterprise-grade servers and personal projects. As with any modern Linux distribution, effective firewall management is crucial to ensuring the security of your system. One of the most powerful tools available for managing firewalls on AlmaLinux is **Firewalld**. This blog will guide you through the basic operations of Firewalld, including its configuration and common use cases. Whether you're a seasoned system administrator or a beginner, these instructions will help you secure your system effectively.  

---

### **What is Firewalld?**  

Firewalld is a dynamic firewall management tool for Linux systems that supports network/firewall zones. It simplifies managing complex firewall rules by abstracting them into zones and services. Instead of managing rules manually with `iptables`, Firewalld provides a more user-friendly approach that integrates well with modern networking environments.  

**Key Features of Firewalld:**  

- Supports zone-based management for granular rule application.  
- Works seamlessly with IPv4, IPv6, and Ethernet bridges.  
- Includes pre-configured service definitions for common applications like HTTP, HTTPS, and SSH.  
- Allows runtime changes without disrupting active connections.  

---

### **Installing and Enabling Firewalld on AlmaLinux**  

Firewalld is typically pre-installed on AlmaLinux. However, if it's not installed or has been removed, follow these steps:  

1. **Install Firewalld:**  

   ```bash
   sudo dnf install firewalld -y
   ```  

2. **Enable Firewalld at Startup:**  
   To ensure Firewalld starts automatically on system boot, run:  

   ```bash
   sudo systemctl enable firewalld
   ```  

3. **Start Firewalld:**  
   If Firewalld is not already running, start it using:  

   ```bash
   sudo systemctl start firewalld
   ```  

4. **Verify Firewalld Status:**  
   Confirm that Firewalld is active and running:  

   ```bash
   sudo systemctl status firewalld
   ```  

---

### **Understanding Firewalld Zones**  

Firewalld organizes rules into **zones**, which define trust levels for network connections. Each network interface is assigned to a specific zone. By default, new connections are placed in the `public` zone.  

**Common Firewalld Zones:**  

- **Drop:** All incoming connections are dropped without notification.  
- **Block:** Incoming connections are rejected with an ICMP error message.  
- **Public:** For networks where you don’t trust other devices entirely.  
- **Home:** For trusted home networks.  
- **Work:** For office networks.  
- **Trusted:** All incoming connections are allowed.  

To view all available zones:  

```bash
sudo firewall-cmd --get-zones
```  

To check the default zone:  

```bash
sudo firewall-cmd --get-default-zone
```  

---

### **Basic Firewalld Operations**  

#### **1. Adding and Removing Services**  

Firewalld comes with pre-configured services like HTTP, HTTPS, and SSH. Adding these services to a zone simplifies managing access to your server.  

**Add a Service to a Zone:**  
For example, to allow HTTP traffic in the `public` zone:  

```bash
sudo firewall-cmd --zone=public --add-service=http --permanent
```  

The `--permanent` flag ensures the change persists after a reboot. Omit it if you only want a temporary change.  

**Remove a Service from a Zone:**  
To disallow HTTP traffic:  

```bash
sudo firewall-cmd --zone=public --remove-service=http --permanent
```  

**Reload Firewalld to Apply Changes:**  

```bash
sudo firewall-cmd --reload
```  

#### **2. Adding and Removing Ports**  

Sometimes, you need to allow or block specific ports rather than services.  

**Allow a Port:**  
For example, to allow traffic on port 8080:  

```bash
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
```  

**Remove a Port:**  
To remove access to port 8080:  

```bash
sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
```  

#### **3. Listing Active Rules**  

You can list the active rules in a specific zone to understand the current configuration.  

```bash
sudo firewall-cmd --list-all --zone=public
```  

#### **4. Assigning a Zone to an Interface**  

To assign a network interface (e.g., `eth0`) to the `trusted` zone:  

```bash
sudo firewall-cmd --zone=trusted --change-interface=eth0 --permanent
```  

#### **5. Changing the Default Zone**  

The default zone determines how new connections are handled. To set the default zone to `home`:  

```bash
sudo firewall-cmd --set-default-zone=home
```  

---

### **Testing and Verifying Firewalld Rules**  

It’s essential to test your Firewalld configuration to ensure that the intended rules are in place and functioning.  

**1. Check Open Ports:**  
Use the `ss` command to verify which ports are open:  

```bash
ss -tuln
```  

**2. Simulate Connections:**  
To test if specific ports or services are accessible, you can use tools like `telnet`, `nc`, or even browser-based checks.  

**3. View Firewalld Logs:**  
Logs provide insights into blocked or allowed connections:  

```bash
sudo journalctl -u firewalld
```  

---

### **Advanced Firewalld Tips**  

#### **Temporary Rules for Testing**  

If you’re unsure about a rule, you can add it temporarily (without the `--permanent` flag). These changes will be discarded after a reboot or Firewalld reload.  

#### **Rich Rules**  

For more granular control, Firewalld supports **rich rules**, which allow complex rule definitions. For example:  

```bash
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept'
```  

#### **Backing Up and Restoring Firewalld Configuration**  

To back up your Firewalld settings:  

```bash
sudo firewall-cmd --runtime-to-permanent
```  

This saves runtime changes to the permanent configuration.  

---

### **Conclusion**  

Managing Firewalld on AlmaLinux doesn’t have to be complicated. By mastering basic operations like adding services, managing ports, and configuring zones, you can enhance the security of your system with ease. Firewalld’s flexibility and power make it a valuable tool for any Linux administrator.  

As you grow more comfortable with Firewalld, consider exploring advanced features like rich rules and integration with scripts for automated firewall management. With the right configuration, your AlmaLinux server will remain robust and secure against unauthorized access.  

If you have questions or need further assistance, feel free to leave a comment below!  
