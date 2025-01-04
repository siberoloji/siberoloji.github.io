---
title: Mastering DNS Configurations with BIND on AlmaLinux 9
description: In this guide, we’ll cover how to set up and configure BIND DNS Server on AlmaLinux 9 for both internal and external networks.
linkTitle: DNS Configurations with BIND
date: 2024-11-28
type: blog
draft: false
toc: true
tags:
  - bind dns server
  - AlmaLinux
categories:
  - Linux
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
featured_image: /images/almalinux.webp
sidebar:
  open: true
url: mastering-dns-configurations-bind-almalinux-9
---
#### **Introduction**

For administrators managing networks with complex DNS requirements, **BIND (Berkeley Internet Name Domain)** is a powerful and versatile DNS server. It allows you to configure internal and external DNS services, manage zone files, and implement advanced features like split DNS.

In this guide, we’ll cover how to set up and configure **BIND DNS Server** on AlmaLinux 9 for both internal and external networks.

---

## **Part 1: Installing and Setting Up BIND**

---

### **Step 1: Install BIND**

1. **Install BIND and related packages**:

   ```bash
   sudo dnf install -y bind bind-utils
   ```

2. **Enable and start the service**:

   ```bash
   sudo systemctl enable named --now
   ```

3. **Verify installation**:

   ```bash
   systemctl status named
   ```

---

### **Step 2: Configure BIND for a Local Network**

The primary configuration file for BIND is located at `/etc/named.conf`.

1. **Edit `/etc/named.conf`**:

   ```bash
   sudo nano /etc/named.conf
   ```

2. **Modify the following settings**:
   - Restrict access to local clients:

     ```plaintext
     options {
         listen-on port 53 { 127.0.0.1; 192.168.1.0/24; };
         allow-query { localhost; 192.168.1.0/24; };
         recursion yes;
     };
     ```

   - Add logging for queries (optional):

     ```plaintext
     logging {
         channel default_debug {
             file "data/named.run";
             severity dynamic;
         };
     };
     ```

3. **Restart BIND**:

   ```bash
   sudo systemctl restart named
   ```

---

### **Step 3: Create a Zone for Internal DNS**

Zones are a critical part of DNS. You’ll define a zone file for managing your local network’s DNS records.

1. **Edit `/etc/named.conf` to add a zone**:

   ```plaintext
   zone "localdomain" IN {
       type master;
       file "/var/named/localdomain.zone";
       allow-update { none; };
   };
   ```

2. **Create the zone file**:

   ```bash
   sudo nano /var/named/localdomain.zone
   ```

3. **Add the following content**:

   ```plaintext
   $TTL 86400
   @   IN  SOA     ns1.localdomain. admin.localdomain. (
               2023112701 ; Serial
               3600       ; Refresh
               1800       ; Retry
               604800     ; Expire
               86400 )    ; Minimum TTL
   @   IN  NS      ns1.localdomain.
   ns1 IN  A       192.168.1.10
   server1 IN A    192.168.1.11
   server2 IN A    192.168.1.12
   ```

4. **Set permissions for the zone file**:

   ```bash
   sudo chown root:named /var/named/localdomain.zone
   sudo chmod 640 /var/named/localdomain.zone
   ```

5. **Verify configuration**:

   ```bash
   sudo named-checkconf
   sudo named-checkzone localdomain /var/named/localdomain.zone
   ```

6. **Restart BIND**:

   ```bash
   sudo systemctl restart named
   ```

---

## **Part 2: Configuring BIND for External Networks**

For public-facing DNS, ensure you configure BIND with security and scalability in mind.

---

### **Step 1: Add an External Zone**

1. **Edit `/etc/named.conf`**:

   ```plaintext
   zone "example.com" IN {
       type master;
       file "/var/named/example.com.zone";
       allow-update { none; };
   };
   ```

2. **Create the external zone file**:

   ```bash
   sudo nano /var/named/example.com.zone
   ```

3. **Add the following records**:

   ```plaintext
   $TTL 86400
   @   IN  SOA     ns1.example.com. admin.example.com. (
               2023112701 ; Serial
               3600       ; Refresh
               1800       ; Retry
               604800     ; Expire
               86400 )    ; Minimum TTL
   @   IN  NS      ns1.example.com.
   ns1 IN  A       203.0.113.10
   www IN  A       203.0.113.20
   mail IN A       203.0.113.30
   @   IN  MX 10   mail.example.com.
   ```

4. **Test and reload BIND**:

   ```bash
   sudo named-checkzone example.com /var/named/example.com.zone
   sudo systemctl reload named
   ```

---

### **Step 2: Secure the DNS Server**

1. **Enable DNSSEC**:
   - Generate keys:

     ```bash
     sudo dnssec-keygen -a RSASHA256 -b 2048 -n ZONE example.com
     ```

   - Add the generated keys to the zone file.

2. **Chroot the BIND server**:

   ```bash
   sudo dnf install -y bind-chroot
   sudo systemctl enable named-chroot --now
   ```

---

### **Step 3: Test Your DNS Setup**

1. **Query a record locally**:

   ```bash
   dig @localhost server1.localdomain
   ```

2. **Query a public record**:

   ```bash
   dig @203.0.113.10 www.example.com
   ```

3. **Test external queries from another machine**:

   ```bash
   dig @<bind-server-ip> example.com
   ```

---

## **Part 3: Advanced BIND Features**

---

### **Step 1: Configure Split DNS**

Split DNS allows internal and external users to access different views of the same domain.

1. **Edit `/etc/named.conf`**:

   ```plaintext
   view "internal" {
       match-clients { 192.168.1.0/24; };
       zone "example.com" IN {
           type master;
           file "/var/named/internal.example.com.zone";
       };
   };

   view "external" {
       match-clients { any; };
       zone "example.com" IN {
           type master;
           file "/var/named/external.example.com.zone";
       };
   };
   ```

2. **Create separate zone files for internal and external views**.

---

### **Step 2: Configure Aliases (CNAME)**

1. **Add CNAME records to a zone file**:

   ```plaintext
   blog IN CNAME www
   ftp  IN CNAME server1
   ```

2. **Restart BIND**:

   ```bash
   sudo systemctl restart named
   ```

---

#### **Conclusion**

BIND provides unparalleled flexibility for DNS management, whether for internal name resolution or public-facing services. By mastering zones, securing configurations, and leveraging advanced features like split DNS, you can effectively manage any network's DNS needs.

---

#### **What’s Next?**

In the next post, we’ll explore **DHCP configuration on AlmaLinux 9**, focusing on dynamic and static IP address management.
