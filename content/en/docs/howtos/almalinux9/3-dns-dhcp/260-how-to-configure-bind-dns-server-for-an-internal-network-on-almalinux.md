---
title: How to Configure BIND DNS Server for an Internal Network on AlmaLinux
description: In this comprehensive guide, we’ll cover the step-by-step process to install, configure, and optimize BIND for your internal network on AlmaLinux.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
  - dns server
categories:
  - Linux
  - Linux How-to
linkTitle: DNS Server for an Internal Network


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 260

keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: configure-bind-dns-server-internal-network-almalinux
---
Configuring a **BIND DNS Server** for an internal network is essential for managing domain name resolution within a private organization or network. It helps ensure faster lookups, reduced external dependencies, and the ability to create custom internal domains for resources. AlmaLinux, with its enterprise-grade stability, is an excellent choice for hosting an internal DNS server using BIND (Berkeley Internet Name Domain).

In this comprehensive guide, we’ll cover the step-by-step process to install, configure, and optimize BIND for your internal network on AlmaLinux.

---

### What Is BIND?

BIND is one of the most widely used DNS server software globally, known for its versatility and scalability. It can function as:
1. **Authoritative DNS Server**: Maintains DNS records for a domain.
2. **Caching DNS Resolver**: Caches DNS query results to reduce resolution time.
3. **Recursive DNS Server**: Resolves queries by contacting other DNS servers.

For an internal network, BIND is configured as an **authoritative DNS server** to manage domain name resolution locally.

---

### Why Use BIND for an Internal Network?

- **Local Name Resolution**: Simplifies access to internal resources with custom domain names.
- **Performance**: Reduces query time by caching frequently accessed records.
- **Security**: Limits DNS queries to trusted clients within the network.
- **Flexibility**: Offers granular control over DNS zones and records.

---

### Prerequisites

Before configuring BIND, ensure:
1. **AlmaLinux is Installed**: Your system should have AlmaLinux 8 or later.
2. **Root Privileges**: Administrative access is required.
3. **Static IP Address**: Assign a static IP to the server hosting BIND.

---

### Step 1: Install BIND on AlmaLinux

#### Step 1.1: Update the System
Always ensure the system is up-to-date:
```bash
sudo dnf update -y
```

#### Step 1.2: Install BIND and Utilities
Install BIND and its management tools:
```bash
sudo dnf install bind bind-utils -y
```

#### Step 1.3: Verify Installation
Check the installed version to confirm:
```bash
named -v
```

---

### Step 2: Configure BIND for Internal Network

BIND’s main configuration file is located at `/etc/named.conf`. Additional zone files reside in `/var/named/`.

#### Step 2.1: Backup the Default Configuration
Before making changes, create a backup:
```bash
sudo cp /etc/named.conf /etc/named.conf.bak
```

#### Step 2.2: Edit `/etc/named.conf`
Open the configuration file for editing:
```bash
sudo nano /etc/named.conf
```

Make the following changes:

1. **Restrict Query Access**:
   Limit DNS queries to the internal network:
   ```conf
   options {
       listen-on port 53 { 127.0.0.1; 192.168.1.1; }; # Replace with your server's IP
       allow-query { localhost; 192.168.1.0/24; };   # Replace with your network range
       recursion yes;
   };
   ```

2. **Define an Internal Zone**:
   Add a zone definition for your internal domain:
   ```conf
   zone "internal.local" IN {
       type master;
       file "/var/named/internal.local.zone";
   };
   ```

#### Step 2.3: Save and Exit
Save the changes (Ctrl + O) and exit (Ctrl + X).

---

### Step 3: Create a Zone File for the Internal Domain

#### Step 3.1: Create the Zone File
Create the zone file in `/var/named/`:
```bash
sudo nano /var/named/internal.local.zone
```

#### Step 3.2: Add DNS Records
Define DNS records for the internal network:
```conf
$TTL 86400
@   IN  SOA     ns1.internal.local. admin.internal.local. (
            2023120901 ; Serial
            3600       ; Refresh
            1800       ; Retry
            1209600    ; Expire
            86400 );    ; Minimum TTL

    IN  NS      ns1.internal.local.
    IN  NS      ns2.internal.local.

ns1 IN  A       192.168.1.1    ; Replace with your DNS server IP
ns2 IN  A       192.168.1.2    ; Optional secondary DNS
www IN  A       192.168.1.10   ; Example internal web server
db  IN  A       192.168.1.20   ; Example internal database server
```

#### Step 3.3: Set File Permissions
Ensure the zone file has the correct ownership and permissions:
```bash
sudo chown root:named /var/named/internal.local.zone
sudo chmod 640 /var/named/internal.local.zone
```

---

### Step 4: Enable and Start the BIND Service

#### Step 4.1: Enable BIND to Start at Boot
```bash
sudo systemctl enable named
```

#### Step 4.2: Start the Service
```bash
sudo systemctl start named
```

#### Step 4.3: Check the Service Status
Verify that BIND is running:
```bash
sudo systemctl status named
```

---

### Step 5: Configure the Firewall

#### Step 5.1: Allow DNS Traffic
Open port 53 for DNS traffic:
```bash
sudo firewall-cmd --add-service=dns --permanent
sudo firewall-cmd --reload
```

#### Step 5.2: Verify Firewall Rules
Check that DNS is allowed:
```bash
sudo firewall-cmd --list-all
```

---

### Step 6: Test the Internal DNS Server

#### Step 6.1: Test with `dig`
Query the internal domain to test:
```bash
dig @192.168.1.1 www.internal.local
```

#### Step 6.2: Test with `nslookup`
Alternatively, use `nslookup`:
```bash
nslookup www.internal.local 192.168.1.1
```

#### Step 6.3: Check Logs
Monitor DNS activity in the logs:
```bash
sudo tail -f /var/log/messages
```

---

### Advanced Configuration Options

#### Option 1: Add Reverse Lookup Zones
Enable reverse DNS lookups by creating a reverse zone file.

1. **Add a Reverse Zone in `/etc/named.conf`**:
   ```conf
   zone "1.168.192.in-addr.arpa" IN {
       type master;
       file "/var/named/192.168.1.rev";
   };
   ```

2. **Create the Reverse Zone File**:
   ```bash
   sudo nano /var/named/192.168.1.rev
   ```

   Add the following records:
   ```conf
   $TTL 86400
   @   IN  SOA     ns1.internal.local. admin.internal.local. (
               2023120901 ; Serial
               3600       ; Refresh
               1800       ; Retry
               1209600    ; Expire
               86400 );    ; Minimum TTL

       IN  NS      ns1.internal.local.
   1   IN  PTR     ns1.internal.local.
   10  IN  PTR     www.internal.local.
   20  IN  PTR     db.internal.local.
   ```

3. **Restart BIND**:
   ```bash
   sudo systemctl restart named
   ```

#### Option 2: Set Up a Secondary DNS Server
Add redundancy by configuring a secondary DNS server. Update the primary server’s configuration to allow zone transfers:
```conf
allow-transfer { 192.168.1.2; }; # Secondary server IP
```

---

### Troubleshooting Common Issues

#### Issue 1: "DNS Server Not Responding"
- **Cause**: Firewall or incorrect `allow-query` settings.
- **Solution**: Ensure the firewall allows DNS traffic and `allow-query` includes your network range.

#### Issue 2: "Zone File Errors"
- **Cause**: Syntax errors in the zone file.
- **Solution**: Validate the zone file:
  ```bash
  named-checkzone internal.local /var/named/internal.local.zone
  ```

#### Issue 3: "BIND Service Fails to Start"
- **Cause**: Errors in `/etc/named.conf`.
- **Solution**: Check the configuration file:
  ```bash
  named-checkconf
  ```

---

### Conclusion

Configuring BIND DNS for an internal network on AlmaLinux provides a robust and efficient way to manage name resolution for private resources. By following this guide, you can install, configure, and test BIND to ensure reliable DNS services for your network. With advanced options like reverse lookups and secondary servers, you can further enhance functionality and redundancy.

If you have any questions or additional tips, feel free to share them in the comments below. Happy networking!
