---
title: Enable Integrated DHCP Feature in Dnsmasq and Configure DHCP Server on AlmaLinux
description: This article will provide a step-by-step guide on enabling the integrated DHCP feature in Dnsmasq and configuring it as a DHCP server on AlmaLinux.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Configure a Dnsmasq DHCP Server
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 240
keywords:
  - AlmaLinux
  - dnsmasq
featured_image: /images/almalinux.webp
url: configure-dnsmasq-dhcp-server-almalinux
---
**Introduction**

Dnsmasq is a lightweight, versatile tool commonly used for DNS caching and as a DHCP server. It is widely adopted in small to medium-sized network environments because of its simplicity and efficiency. AlmaLinux, an enterprise-grade Linux distribution derived from Red Hat Enterprise Linux (RHEL), is ideal for deploying Dnsmasq as a DHCP server. By enabling Dnsmasq's integrated DHCP feature, you can streamline network configurations, efficiently allocate IP addresses, and manage DNS queries simultaneously.

This article will provide a step-by-step guide on enabling the integrated DHCP feature in Dnsmasq and configuring it as a DHCP server on AlmaLinux.

---

## Table of Contents

1. **Prerequisites**
2. **Installing Dnsmasq on AlmaLinux**
3. **Configuring Dnsmasq for DHCP**
4. **Understanding the Configuration File**
5. **Starting and Enabling the Dnsmasq Service**
6. **Testing the DHCP Server**
7. **Troubleshooting Common Issues**
8. **Conclusion**

---

## 1. Prerequisites

Before starting, ensure you meet the following prerequisites:

- **AlmaLinux Installed**: A running instance of AlmaLinux with root or sudo access.
- **Network Information**: Have details of your network, including the IP range, gateway, and DNS servers.
- **Firewall Access**: Ensure the firewall allows DHCP traffic (UDP ports 67 and 68).

---

## 2. Installing Dnsmasq on AlmaLinux

Dnsmasq is available in AlmaLinux's default package repositories. Follow these steps to install it:

1. **Update System Packages**:
   Open a terminal and update the system packages to ensure all dependencies are up to date:

   ```bash
   sudo dnf update -y
   ```

2. **Install Dnsmasq**:
   Install the Dnsmasq package using the following command:

   ```bash
   sudo dnf install dnsmasq -y
   ```

3. **Verify Installation**:
   Check if Dnsmasq is installed correctly:

   ```bash
   dnsmasq --version
   ```

   You should see the version details of Dnsmasq.

---

## 3. Configuring Dnsmasq for DHCP

Once Dnsmasq is installed, you need to configure it to enable the DHCP feature. Dnsmasq uses a single configuration file located at `/etc/dnsmasq.conf`.

1. **Backup the Configuration File**:
   It's a good practice to back up the original configuration file before making changes:

   ```bash
   sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
   ```

2. **Edit the Configuration File**:
   Open the configuration file in your preferred text editor:

   ```bash
   sudo nano /etc/dnsmasq.conf
   ```

   Uncomment and modify the following lines to enable the DHCP server:

   - **Define the DHCP Range**:
     Specify the range of IP addresses to allocate to clients:

     ```bash
     dhcp-range=192.168.1.100,192.168.1.200,12h
     ```

     Here:
     - `192.168.1.100` and `192.168.1.200` define the start and end of the IP range.
     - `12h` specifies the lease time (12 hours in this example).

   - **Set the Default Gateway (Optional)**:
     If your network has a specific gateway, define it:

     ```bash
     dhcp-option=3,192.168.1.1
     ```

   - **Specify DNS Servers (Optional)**:
     Define DNS servers for clients:

     ```bash
     dhcp-option=6,8.8.8.8,8.8.4.4
     ```

3. **Save and Exit**:
   Save the changes and exit the editor. For `nano`, press `Ctrl+O` to save, then `Ctrl+X` to exit.

---

## 4. Understanding the Configuration File

### Key Sections of `/etc/dnsmasq.conf`

- **`dhcp-range`**: Defines the range of IP addresses and the lease duration.
- **`dhcp-option`**: Configures network options such as gateways and DNS servers.
- **`log-queries` (Optional)**: Enables logging for DNS and DHCP queries for debugging purposes:

  ```bash
  log-queries
  log-dhcp
  ```

Dnsmasq’s configuration is straightforward, making it an excellent choice for small networks.

---

## 5. Starting and Enabling the Dnsmasq Service

Once the configuration is complete, follow these steps to start and enable Dnsmasq:

1. **Start the Service**:

   ```bash
   sudo systemctl start dnsmasq
   ```

2. **Enable the Service at Boot**:

   ```bash
   sudo systemctl enable dnsmasq
   ```

3. **Verify Service Status**:
   Check the status to ensure Dnsmasq is running:

   ```bash
   sudo systemctl status dnsmasq
   ```

   The output should indicate that the service is active and running.

---

## 6. Testing the DHCP Server

To confirm that the DHCP server is functioning correctly:

1. **Restart a Client Machine**:
   Restart a device on the same network and set it to obtain an IP address automatically.

2. **Check Allocated IP**:
   Verify that the client received an IP address within the defined range.

3. **Monitor Logs**:
   Use the following command to monitor DHCP allocation in real-time:

   ```bash
   sudo tail -f /var/log/messages
   ```

   Look for entries indicating DHCPDISCOVER and DHCPOFFER transactions.

---

## 7. Troubleshooting Common Issues

### Issue 1: Dnsmasq Fails to Start

- **Solution**: Check the configuration file for syntax errors:

  ```bash
  sudo dnsmasq --test
  ```

### Issue 2: No IP Address Assigned

- **Solution**:
  - Verify that the firewall allows DHCP traffic:

    ```bash
    sudo firewall-cmd --add-service=dhcp --permanent
    sudo firewall-cmd --reload
    ```

  - Ensure no other DHCP server is running on the network.

### Issue 3: Conflicting IP Address

- **Solution**: Ensure the IP range specified in `dhcp-range` does not overlap with statically assigned IP addresses.

---

## 8. Conclusion

By following this guide, you’ve successfully enabled the integrated DHCP feature in Dnsmasq and configured it as a DHCP server on AlmaLinux. Dnsmasq’s lightweight design and simplicity make it an ideal choice for small to medium-sized networks, offering robust DNS and DHCP capabilities in a single package.

Regularly monitor logs and update configurations as your network evolves to ensure optimal performance. With Dnsmasq properly configured, you can efficiently manage IP address allocation and DNS queries, streamlining your network administration tasks.

For more advanced configurations, such as PXE boot or VLAN support, refer to the [official Dnsmasq documentation](http://www.thekelleys.org.uk/dnsmasq/doc.html).
