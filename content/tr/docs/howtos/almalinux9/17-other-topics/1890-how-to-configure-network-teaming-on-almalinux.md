---
title: How to Configure Network Teaming on AlmaLinux
linkTitle: Configure Network Teaming
description: This guide will walk you through the step-by-step process of configuring network teaming on AlmaLinux.
date: 2025-01-08T11:41:47.691Z
weight: 1890
url: configure-network-teaming-almalinux
translationKey: configure-network-teaming-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - network teaming
featured_image: /images/almalinux.webp
---
Network teaming is a method of combining multiple network interfaces into a single logical interface for improved performance, fault tolerance, and redundancy. Unlike traditional bonding, network teaming provides a more flexible and modern approach to network management, with support for advanced load balancing and failover capabilities. AlmaLinux, a stable and secure enterprise-grade Linux distribution, fully supports network teaming, making it a great choice for deploying reliable network setups.

This guide will walk you through the step-by-step process of configuring network teaming on AlmaLinux.

---

### **Why Configure Network Teaming?**

Network teaming provides several benefits, including:

1. **High Availability**: Ensures uninterrupted network connectivity by automatically redirecting traffic to a healthy interface in case of failure.
2. **Improved Performance**: Combines the bandwidth of multiple network interfaces for increased throughput.
3. **Scalability**: Allows for dynamic addition or removal of interfaces without service disruption.
4. **Advanced Modes**: Supports multiple operational modes, including active-backup, load balancing, and round-robin.

---

### **Prerequisites**

Before you start, ensure the following:

1. **AlmaLinux Installed**: A clean or existing installation of AlmaLinux with administrative access.
2. **Multiple Network Interfaces**: At least two physical or virtual NICs (Network Interface Cards) for teaming.
3. **Root or Sudo Access**: Required for network configuration.
4. **Stable Internet Connection**: To download and install necessary packages.

---

### **Step 1: Update the System**

Begin by updating your system to ensure all packages are up-to-date:

```bash
sudo dnf update -y
```

This ensures you have the latest bug fixes and features.

---

### **Step 2: Install Required Tools**

Network teaming on AlmaLinux uses the `NetworkManager` utility, which is installed by default. However, you should verify its presence and install the necessary tools for managing network configurations.

#### Verify NetworkManager

Ensure that `NetworkManager` is installed and running:

```bash
sudo systemctl status NetworkManager
```

If it’s not installed, you can install it using:

```bash
sudo dnf install -y NetworkManager
```

#### Install nmcli (Optional)

The `nmcli` command-line tool is used for managing network configurations. It’s included with `NetworkManager`, but verify its availability:

```bash
nmcli --version
```

---

### **Step 3: Identify Network Interfaces**

Identify the network interfaces you want to include in the team. Use the `ip` command to list all network interfaces:

```bash
ip link show
```

You’ll see a list of interfaces, such as:

```
1: lo: <LOOPBACK,UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
```

Identify the NICs (e.g., `enp0s3` and `enp0s8`) that you want to include in the team.

---

### **Step 4: Create a Network Team**

Create a new network team interface using the `nmcli` command.

#### Create the Team Interface

Run the following command to create a new team interface:

```bash
sudo nmcli connection add type team con-name team0 ifname team0 config '{"runner": {"name": "activebackup"}}'
```

- `team0`: The name of the team interface.
- `activebackup`: The teaming mode. Other options include `loadbalance`, `broadcast`, and `roundrobin`.

---

### **Step 5: Add Network Interfaces to the Team**

Add the physical interfaces to the team interface.

#### Add an Interface

Add each interface (e.g., `enp0s3` and `enp0s8`) to the team:

```bash
sudo nmcli connection add type team-slave con-name team0-slave1 ifname enp0s3 master team0
sudo nmcli connection add type team-slave con-name team0-slave2 ifname enp0s8 master team0
```

- `team0-slave1` and `team0-slave2`: Connection names for the slave interfaces.
- `enp0s3` and `enp0s8`: Physical NICs being added to the team.

---

### **Step 6: Configure IP Address for the Team**

Assign an IP address to the team interface.

#### Static IP Address

To assign a static IP, use the following command:

```bash
sudo nmcli connection modify team0 ipv4.addresses 192.168.1.100/24 ipv4.method manual
```

Replace `192.168.1.100/24` with the appropriate IP address and subnet mask for your network.

#### Dynamic IP Address (DHCP)

To configure the team interface to use DHCP:

```bash
sudo nmcli connection modify team0 ipv4.method auto
```

---

### **Step 7: Bring Up the Team Interface**

Activate the team interface to apply the configuration:

```bash
sudo nmcli connection up team0
```

Activate the slave interfaces:

```bash
sudo nmcli connection up team0-slave1
sudo nmcli connection up team0-slave2
```

Verify the status of the team interface:

```bash
nmcli connection show team0
```

---

### **Step 8: Verify Network Teaming**

To ensure the team is working correctly, use the following commands:

#### Check Team Status

View the team configuration and status:

```bash
sudo teamdctl team0 state
```

The output provides detailed information about the team, including active interfaces and the runner mode.

#### Check Connectivity

Ping an external host to verify connectivity:

```bash
ping -c 4 8.8.8.8
```

#### Simulate Failover

Test the failover mechanism by disconnecting one of the physical interfaces and observing if traffic continues through the remaining interface.

---

### **Step 9: Make the Configuration Persistent**

The configurations created using `nmcli` are automatically saved and persist across reboots. To confirm, restart the server:

```bash
sudo reboot
```

After the reboot, check if the team interface is active:

```bash
nmcli connection show team0
```

---

### **Step 10: Advanced Teaming Modes**

Network teaming supports multiple modes. Here’s an overview:

1. **activebackup**:
   - Only one interface is active at a time.
   - Provides redundancy and failover capabilities.

2. **loadbalance**:
   - Distributes traffic across all interfaces based on load.

3. **broadcast**:
   - Sends all traffic through all interfaces.

4. **roundrobin**:
   - Cycles through interfaces for each packet.

To change the mode, modify the team configuration:

```bash
sudo nmcli connection modify team0 team.config '{"runner": {"name": "loadbalance"}}'
```

Restart the interface:

```bash
sudo nmcli connection up team0
```

---

### **Troubleshooting**

1. **Team Interface Fails to Activate**:
   - Ensure all slave interfaces are properly connected and not in use by other connections.

2. **No Internet Access**:
   - Verify the IP configuration (static or DHCP).
   - Check the firewall settings to ensure the team interface is allowed.

3. **Failover Not Working**:
   - Use `sudo teamdctl team0 state` to check the status of each interface.

4. **Conflicts with Bonding**:
   - Remove any existing bonding configurations before setting up teaming.

---

### **Conclusion**

Network teaming on AlmaLinux provides a reliable and scalable way to improve network performance and ensure high availability. By combining multiple NICs into a single logical interface, you gain enhanced redundancy and load balancing capabilities. Whether you’re setting up a server for enterprise applications or personal use, teaming ensures robust and efficient network connectivity.

With this guide, you’ve learned how to configure network teaming using `nmcli`, set up advanced modes, and troubleshoot common issues. AlmaLinux’s stability and support for modern networking tools make it an excellent platform for deploying network teaming solutions. Happy networking!
