---
draft: false
title: How to Install BIND9 DNS Server on Raspberry Pi OS
linkTitle: Install BIND9
translationKey: how-to-install-bind9-dns-server-on-raspberry-pi-os-debian-12-bookworm
weight: 30
description: How to Install a DNS Server on Raspberry Pi OS
date: 2025-01-19
url: install-bind9-dns-server-raspberry-pi-os
tags:
  - Raspberry Pi
categories:
  - Raspberry Pi
  - How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Raspberry Pi OS
featured_image: /images/raspberrypi.webp
---
Raspberry Pi is a versatile, cost-effective device widely used for various projects, from home automation to learning new technologies. One such project involves setting up a **Domain Name System (DNS)** server. A DNS server translates domain names (e.g., `example.com`) into IP addresses, enabling easier and more user-friendly web navigation. By running your own DNS server on Raspberry Pi OS, you can manage your network more efficiently, enhance privacy, and improve performance by caching frequent DNS queries.

This guide walks you through installing and configuring a DNS server on **Raspberry Pi OS Debian 12 Bookworm** using **BIND9**, one of the most popular and reliable DNS server software packages.

---

## Prerequisites

Before diving into the installation process, ensure you have the following:

1. **A Raspberry Pi** running **Raspberry Pi OS Debian 12 Bookworm**.
2. A stable internet connection.
3. Access to the terminal with `sudo` privileges.
4. Basic understanding of Linux commands.

---

## Step 1: Update and Upgrade Your System

To start, ensure your Raspberry Pi OS is up-to-date. Open a terminal and run:

```bash
sudo apt update && sudo apt upgrade -y
```

This command updates the package lists and installs the latest versions of the available software. Keeping your system updated ensures compatibility and security.

---

## Step 2: Install BIND9 DNS Server

The **BIND9** package is readily available in the Debian repository. Install it using:

```bash
sudo apt install bind9 -y
```

Once the installation is complete, verify that the BIND9 service is running:

```bash
sudo systemctl status bind9
```

You should see the service status as `active (running)`.

---

## Step 3: Configure the BIND9 Server

The configuration of BIND9 involves editing a few files to define how the server will function. Here are the essential steps:

### 3.1 Edit the Main Configuration File

The primary configuration file for BIND9 is located at `/etc/bind/named.conf.options`. Open it using a text editor like `nano`:

```bash
sudo nano /etc/bind/named.conf.options
```

Uncomment and modify the following lines to set up a basic caching DNS server:

```bash
options {
    directory "/var/cache/bind";

    recursion yes;  // Enables recursive queries
    allow-query { any; };  // Allow queries from any IP address
    forwarders {
        8.8.8.8;  // Google DNS
        8.8.4.4;
    };
    dnssec-validation auto;

    listen-on-v6 { any; };  // Allow IPv6 connections
};
```

Save the file by pressing `CTRL+O`, followed by `Enter`, and then `CTRL+X` to exit.

### 3.2 Configure a Local Zone (Optional)

If you want to create a custom DNS zone for internal use, edit the `/etc/bind/named.conf.local` file:

```bash
sudo nano /etc/bind/named.conf.local
```

Add the following lines to define a zone:

```bash
zone "example.local" {
    type master;
    file "/etc/bind/db.example.local";
};
```

Next, create the zone file:

```bash
sudo cp /etc/bind/db.local /etc/bind/db.example.local
sudo nano /etc/bind/db.example.local
```

Update the placeholder content with your local DNS entries. For example:

```bash
$TTL    604800
@       IN      SOA     example.local. admin.example.local. (
                          1         ; Serial
                          604800    ; Refresh
                          86400     ; Retry
                          2419200   ; Expire
                          604800 )  ; Negative Cache TTL
;

@       IN      NS      example.local.
@       IN      A       192.168.1.100  ; IP of the Raspberry Pi
www     IN      A       192.168.1.101  ; Example local web server
```

Save and close the file. Then, check the configuration for errors:

```bash
sudo named-checkconf
sudo named-checkzone example.local /etc/bind/db.example.local
```

If no errors are reported, the configuration is correct.

---

## Step 4: Adjust Firewall Settings

To ensure your DNS server is accessible, allow DNS traffic through the firewall. Use `ufw` (Uncomplicated Firewall) to manage rules:

```bash
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw reload
```

If `ufw` is not installed, you can add rules using `iptables` or another preferred firewall management tool.

---

## Step 5: Restart and Enable the DNS Server

Restart the BIND9 service to apply the changes:

```bash
sudo systemctl restart bind9
```

Enable it to start automatically on boot:

```bash
sudo systemctl enable bind9
```

---

## Step 6: Test the DNS Server

To confirm your DNS server is functioning correctly, use the `dig` command (part of the `dnsutils` package). First, install the package if it’s not already present:

```bash
sudo apt install dnsutils -y
```

Then, query your DNS server:

```bash
dig @localhost example.local
```

The output should include an **ANSWER SECTION** with the IP address you configured in the zone file.

---

## Step 7: Configure Clients to Use the DNS Server

Finally, set up devices on your network to use the Raspberry Pi DNS server. On most operating systems, you can specify the DNS server in the network settings:

- Use the Raspberry Pi’s IP address (e.g., `192.168.1.100`) as the primary DNS server.
- Test the setup by visiting websites or resolving local domains.

---

## Troubleshooting Tips

1. **Check Service Logs**: If the DNS server doesn’t work as expected, review logs using:

   ```bash
   sudo journalctl -u bind9
   ```

2. **Verify Port Availability**: Ensure no other service is using port 53:

   ```bash
   sudo netstat -tuln | grep :53
   ```

3. **Restart Services**: If you make configuration changes, restart BIND9 to apply them:

   ```bash
   sudo systemctl restart bind9
   ```

4. **Correct File Permissions**: Ensure zone files have the correct permissions:

   ```bash
   sudo chown bind:bind /etc/bind/db.example.local
   ```

---

## Conclusion

Setting up a DNS server on Raspberry Pi OS Debian 12 Bookworm using BIND9 is a rewarding project that enhances your network’s functionality and performance. By following this guide, you’ve created a versatile DNS server capable of caching queries, hosting local zones, and supporting both IPv4 and IPv6.

This setup can serve as a foundation for further customization, such as integrating DNS-over-HTTPS (DoH) for enhanced privacy or creating more complex zone configurations. With your Raspberry Pi-powered DNS server, you have full control over your network's DNS traffic.
