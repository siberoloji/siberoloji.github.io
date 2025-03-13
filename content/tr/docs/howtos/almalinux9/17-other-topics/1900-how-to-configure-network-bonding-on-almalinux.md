---
title: How to Configure Network Bonding on AlmaLinux
linkTitle: Configure Network Bonding
description: This guide explains how to configure network bonding on AlmaLinux, step by step.
date: 2025-01-08T11:42:54.222Z
weight: 1900
url: configure-network-bonding-almalinux
translationKey: configure-network-bonding-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - network bonding
featured_image: /images/almalinux.webp
---
Network bonding is a method of combining multiple network interfaces into a single logical interface to increase bandwidth, improve redundancy, and ensure high availability. It is particularly useful in server environments where uninterrupted network connectivity is critical. AlmaLinux, a robust enterprise-grade Linux distribution, provides built-in support for network bonding, making it a preferred choice for setting up reliable and scalable network configurations.

This guide explains how to configure network bonding on AlmaLinux, step by step.

---

### **Why Use Network Bonding?**

Network bonding offers several advantages:

1. **Increased Bandwidth**: Combines the bandwidth of multiple network interfaces.
2. **High Availability**: Provides fault tolerance by redirecting traffic to functional interfaces if one fails.
3. **Load Balancing**: Distributes traffic evenly across interfaces, optimizing performance.
4. **Simplified Configuration**: Offers centralized management for multiple physical interfaces.

---

### **Prerequisites**

Before you begin, ensure you have the following:

1. **AlmaLinux Installed**: A fresh or existing AlmaLinux installation with administrative access.
2. **Multiple Network Interfaces**: At least two NICs (Network Interface Cards) for bonding.
3. **Root or Sudo Access**: Required for network configuration.
4. **Stable Internet Connection**: For installing necessary packages.

---

### **Step 1: Update Your System**

Always start by updating your system to ensure you have the latest updates and bug fixes:

```bash
sudo dnf update -y
```

This ensures the latest network management tools are available.

---

### **Step 2: Verify Network Interfaces**

Identify the network interfaces you want to include in the bond. Use the `ip` command to list all available interfaces:

```bash
ip link show
```

You’ll see a list of interfaces like this:

```
1: lo: <LOOPBACK,UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
```

Note the names of the interfaces you plan to bond (e.g., `enp0s3` and `enp0s8`).

---

### **Step 3: Install Required Tools**

Ensure the `NetworkManager` package is installed. It simplifies managing network configurations, including bonding:

```bash
sudo dnf install -y NetworkManager
```

---

### **Step 4: Create a Bond Interface**

Create a bond interface using `nmcli`, the command-line tool for managing networks.

#### Add the Bond Interface

Run the following command to create a bond interface named `bond0`:

```bash
sudo nmcli connection add type bond con-name bond0 ifname bond0 mode active-backup
```

- `bond0`: The name of the bond interface.
- `active-backup`: The bonding mode. Other modes include `balance-rr`, `balance-xor`, and `802.3ad`.

---

### **Step 5: Add Slave Interfaces to the Bond**

Add the physical interfaces (e.g., `enp0s3` and `enp0s8`) as slaves to the bond:

```bash
sudo nmcli connection add type bond-slave con-name bond0-slave1 ifname enp0s3 master bond0
sudo nmcli connection add type bond-slave con-name bond0-slave2 ifname enp0s8 master bond0
```

- `bond0-slave1` and `bond0-slave2`: Names for the slave connections.
- `enp0s3` and `enp0s8`: Names of the physical interfaces.

---

### **Step 6: Configure IP Address for the Bond**

Assign an IP address to the bond interface. You can configure either a static IP address or use DHCP.

#### Static IP Address

To assign a static IP, use the following command:

```bash
sudo nmcli connection modify bond0 ipv4.addresses 192.168.1.100/24 ipv4.method manual
sudo nmcli connection modify bond0 ipv4.gateway 192.168.1.1
sudo nmcli connection modify bond0 ipv4.dns 8.8.8.8
```

Replace `192.168.1.100/24` with your desired IP address and subnet mask, `192.168.1.1` with your gateway, and `8.8.8.8` with your preferred DNS server.

#### Dynamic IP Address (DHCP)

To use DHCP:

```bash
sudo nmcli connection modify bond0 ipv4.method auto
```

---

### **Step 7: Activate the Bond Interface**

Activate the bond and slave interfaces to apply the configuration:

```bash
sudo nmcli connection up bond0
sudo nmcli connection up bond0-slave1
sudo nmcli connection up bond0-slave2
```

Verify the status of the bond interface:

```bash
nmcli connection show bond0
```

---

### **Step 8: Verify Network Bonding**

#### Check Bond Status

Use the following command to verify the bond status and its slave interfaces:

```bash
cat /proc/net/bonding/bond0
```

The output provides detailed information, including:

- Active bonding mode.
- Status of slave interfaces.
- Link status of each interface.

#### Check Connectivity

Test network connectivity by pinging an external host:

```bash
ping -c 4 8.8.8.8
```

#### Test Failover

Simulate a failover by disconnecting one of the physical interfaces and observing if traffic continues through the remaining interface.

---

### **Step 9: Make the Configuration Persistent**

The `nmcli` tool automatically saves the configurations, ensuring they persist across reboots. To confirm, restart your system:

```bash
sudo reboot
```

After the reboot, verify that the bond interface is active:

```bash
nmcli connection show bond0
```

---

### **Step 10: Advanced Bonding Modes**

AlmaLinux supports several bonding modes. Here’s a summary of the most common ones:

1. **active-backup**:
   - Only one interface is active at a time.
   - Provides fault tolerance and failover capabilities.

2. **balance-rr**:
   - Sends packets in a round-robin fashion across all interfaces.
   - Increases throughput but requires switch support.

3. **balance-xor**:
   - Distributes traffic based on the source and destination MAC addresses.
   - Requires switch support.

4. **802.3ad (LACP)**:
   - Implements the IEEE 802.3ad Link Aggregation Control Protocol.
   - Provides high performance and fault tolerance but requires switch support.

5. **broadcast**:
   - Sends all traffic to all interfaces.
   - Useful for specific use cases like network redundancy.

To change the bonding mode, modify the bond configuration:

```bash
sudo nmcli connection modify bond0 bond.options "mode=802.3ad"
```

Restart the bond interface:

```bash
sudo nmcli connection up bond0
```

---

### **Step 11: Troubleshooting**

Here are common issues and their solutions:

1. **Bond Interface Fails to Activate**:
   - Ensure all slave interfaces are not managed by other connections.
   - Check for typos in interface names.

2. **No Internet Connectivity**:
   - Verify the IP address, gateway, and DNS configuration.
   - Ensure the bond interface is properly linked to the network.

3. **Failover Not Working**:
   - Confirm the bonding mode supports failover.
   - Check the status of slave interfaces in `/proc/net/bonding/bond0`.

4. **Switch Configuration Issues**:
   - For modes like `802.3ad`, ensure your network switch supports and is configured for link aggregation.

---

### **Conclusion**

Configuring network bonding on AlmaLinux enhances network reliability and performance, making it an essential skill for system administrators. By following this guide, you’ve successfully set up a bonded network interface, optimized for high availability, failover, and load balancing. Whether you’re managing enterprise servers or personal projects, network bonding ensures a robust and efficient network infrastructure.

With AlmaLinux’s stability and built-in support for bonding, you can confidently deploy reliable network configurations to meet your specific requirements.
