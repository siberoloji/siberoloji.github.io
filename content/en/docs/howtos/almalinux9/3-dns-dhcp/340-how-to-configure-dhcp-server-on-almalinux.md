---
title: How to Configure a DHCP Server on AlmaLinux
description: Learn how to set up a DHCP server on AlmaLinux with this step-by-step guide. Automate IP address assignments and optimize network efficiency with DHCP.
date: 2024-12-11
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Configure a DHCP Server
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 340
translationKey: how-to-configure-dhcp-server-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: configure-dhcp-server-almalinux
---
### How to Configure DHCP Server on AlmaLinux

Dynamic Host Configuration Protocol (DHCP) is a crucial service in any networked environment, automating the assignment of IP addresses to client devices. Setting up a **DHCP server** on **AlmaLinux**, a robust and reliable Linux distribution, allows you to streamline IP management, reduce errors, and ensure efficient network operations.

This guide will walk you through configuring a DHCP server on AlmaLinux step by step, explaining each concept in detail to make the process straightforward.

---

### What is a DHCP Server?

A **DHCP server** assigns IP addresses and other network configuration parameters to devices on a network automatically. Instead of manually configuring IP settings for every device, the DHCP server dynamically provides:

- IP addresses
- Subnet masks
- Default gateway addresses
- DNS server addresses
- Lease durations

---

### Benefits of Using a DHCP Server

1. **Efficiency**: Automatically assigns and manages IP addresses, reducing administrative workload.
2. **Minimized Errors**: Avoids conflicts caused by manually assigned IPs.
3. **Scalability**: Adapts easily to networks of any size.
4. **Centralized Management**: Simplifies network reconfiguration and troubleshooting.

---

### Prerequisites

Before setting up the DHCP server, ensure the following:

1. **AlmaLinux** installed and updated.
2. Root or sudo access to the server.
3. Basic understanding of IP addressing and subnetting.
4. A network interface configured with a static IP address.

---

### Step 1: Install the DHCP Server Package

1. Update your system to ensure all packages are current:

   ```bash
   sudo dnf update -y
   ```

2. Install the DHCP server package:

   ```bash
   sudo dnf install dhcp-server -y
   ```

3. Verify the installation:

   ```bash
   rpm -q dhcp-server
   ```

---

### Step 2: Configure the DHCP Server

The main configuration file for the DHCP server is `/etc/dhcp/dhcpd.conf`. By default, this file may not exist, but a sample configuration file (`/usr/share/doc/dhcp-server/dhcpd.conf.example`) is available.

1. **Create the Configuration File**  
   Copy the example configuration file to `/etc/dhcp/dhcpd.conf`:

   ```bash
   sudo cp /usr/share/doc/dhcp-server/dhcpd.conf.example /etc/dhcp/dhcpd.conf
   ```

2. **Edit the Configuration File**  
   Open the configuration file for editing:

   ```bash
   sudo vim /etc/dhcp/dhcpd.conf
   ```

   Add or modify the following settings based on your network:

   ```plaintext
   option domain-name "example.com";
   option domain-name-servers 8.8.8.8, 8.8.4.4;

   default-lease-time 600;
   max-lease-time 7200;

   subnet 192.168.1.0 netmask 255.255.255.0 {
       range 192.168.1.100 192.168.1.200;
       option routers 192.168.1.1;
       option subnet-mask 255.255.255.0;
       option broadcast-address 192.168.1.255;
   }
   ```

   - **`option domain-name`**: Specifies the domain name for your network.
   - **`option domain-name-servers`**: Specifies DNS servers for the clients.
   - **`default-lease-time` and `max-lease-time`**: Set the minimum and maximum lease duration in seconds.
   - **`subnet`**: Defines the IP range and network parameters for the DHCP server.

3. **Set Permissions**  
   Ensure the configuration file is owned by root and has the correct permissions:

   ```bash
   sudo chown root:root /etc/dhcp/dhcpd.conf
   sudo chmod 644 /etc/dhcp/dhcpd.conf
   ```

---

### Step 3: Configure the DHCP Server to Listen on a Network Interface

The DHCP server needs to know which network interface it should listen on. By default, it listens on all interfaces, but you can specify a particular interface.

1. Edit the DHCP server configuration file:

   ```bash
   sudo vim /etc/sysconfig/dhcpd
   ```

2. Add or modify the following line, replacing `eth0` with the name of your network interface:

   ```plaintext
   DHCPD_INTERFACE="eth0"
   ```

   You can determine your network interface name using the `ip addr` command.

---

### Step 4: Start and Enable the DHCP Service

1. **Start the DHCP service**:

   ```bash
   sudo systemctl start dhcpd
   ```

2. **Enable the service to start on boot**:

   ```bash
   sudo systemctl enable dhcpd
   ```

3. **Check the service status**:

   ```bash
   sudo systemctl status dhcpd
   ```

   Ensure the output shows the service is active and running.

---

### Step 5: Configure Firewall Rules

Ensure your server’s firewall allows DHCP traffic (UDP ports 67 and 68):

1. Add the DHCP service to the firewall rules:

   ```bash
   sudo firewall-cmd --add-service=dhcp --permanent
   sudo firewall-cmd --reload
   ```

2. Verify the rules:

   ```bash
   sudo firewall-cmd --list-all
   ```

---

### Step 6: Test the DHCP Server

1. **Verify the Configuration**  
   Check the syntax of the DHCP configuration file:

   ```bash
   sudo dhcpd -t -cf /etc/dhcp/dhcpd.conf
   ```

   Correct any errors before proceeding.

2. **Test Client Connectivity**  
   Connect a client device to the network and set its IP configuration to DHCP. Verify that it receives an IP address from the configured range.

3. **Monitor Leases**  
   Check the lease assignments in the lease file:

   ```bash
   sudo cat /var/lib/dhcpd/dhcpd.leases
   ```

   This file logs all issued leases and their details.

---

### Step 7: Troubleshooting Tips

1. **Service Fails to Start**  
   - Check the logs for errors:
     ```bash
     sudo journalctl -u dhcpd
     ```
   - Verify the syntax of `/etc/dhcp/dhcpd.conf`.

2. **No IP Address Assigned**  
   - Confirm the DHCP service is running.
   - Ensure the client is on the same network segment as the DHCP server.
   - Verify firewall rules and that the correct interface is specified.

3. **Conflict or Overlapping IPs**  
   - Ensure no other DHCP servers are active on the same network.
   - Confirm that static IPs are outside the DHCP range.

---

### Best Practices for Configuring a DHCP Server

1. **Reserve IPs for Critical Devices**  
   Use DHCP reservations to assign fixed IP addresses to critical devices like servers or printers.

2. **Use DNS for Dynamic Updates**  
   Integrate DHCP with DNS to dynamically update DNS records for clients.

3. **Monitor Lease Usage**  
   Regularly review the lease file to ensure optimal usage of the IP range.

4. **Secure the Network**  
   Limit access to the network to prevent unauthorized devices from using DHCP.

5. **Backup Configurations**  
   Maintain backups of the DHCP configuration file for quick recovery.

---

### Conclusion

Configuring a **DHCP server** on AlmaLinux is a straightforward process that brings automation and efficiency to your network management. By following this guide, you’ve learned how to install, configure, and test a DHCP server, as well as troubleshoot common issues.

A well-configured DHCP server ensures smooth network operations, minimizes manual errors, and provides scalability for growing networks. With these skills, you can effectively manage your network’s IP assignments and improve overall reliability.

For further reading and support, explore the [AlmaLinux documentation](https://almalinux.org) or engage with the AlmaLinux community forums.

---
