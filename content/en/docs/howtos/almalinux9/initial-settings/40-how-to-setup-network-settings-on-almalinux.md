---
title: How to Set up Network Settings on AlmaLinux
description: This guide provides a detailed walkthrough on setting up and manipulating network settings on AlmaLinux.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Network Settings
type: docs
prev: null
next: null
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 40
toc: true
keywords:
  - AlmaLinux
  - network settings on AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
url: setup-network-settings-almalinux
---
AlmaLinux, a popular open-source alternative to CentOS, is widely recognized for its stability, reliability, and flexibility in server environments. System administrators must manage network settings efficiently to ensure seamless communication between devices and optimize network performance. This guide provides a detailed walkthrough on setting up and manipulating network settings on AlmaLinux.

---

#### **Introduction to Network Configuration on AlmaLinux**

Networking is the backbone of any system that needs connectivity to the outside world, whether for internet access, file sharing, or remote management. AlmaLinux, like many Linux distributions, uses `NetworkManager` as its default network configuration tool. Additionally, administrators can use CLI tools like `nmcli` or modify configuration files directly for more granular control.

By the end of this guide, you will know how to:

- Configure a network interface.
- Set up static IP addresses.
- Manipulate DNS settings.
- Enable network bonding or bridging.
- Troubleshoot common network issues.

---

### **Step 1: Checking the Network Configuration**

Before making changes, it's essential to assess the current network settings. You can do this using either the command line or GUI tools.

#### **Command Line Method:**

1. Open a terminal session.
2. Use the `ip` command to check the active network interfaces:

   ```bash
   ip addr show
   ```

3. To get detailed information about all connections managed by `NetworkManager`, use:

   ```bash
   nmcli connection show
   ```

#### **GUI Method:**

If you have the GNOME desktop environment installed, navigate to **Settings > Network** to view and manage connections.

---

### **Step 2: Configuring Network Interfaces**

Network interfaces can be set up either dynamically (using DHCP) or statically. Below is how to achieve both.

#### **Configuring DHCP (Dynamic Host Configuration Protocol):**

1. Identify the network interface (e.g., `eth0`, `ens33`) using the `ip addr` command.
2. Use `nmcli` to set the interface to use DHCP:

   ```bash
   nmcli con mod "Connection Name" ipv4.method auto
   nmcli con up "Connection Name"
   ```

   Replace `"Connection Name"` with the actual connection name.

#### **Setting a Static IP Address:**

1. Use `nmcli` to modify the connection:

   ```bash
   nmcli con mod "Connection Name" ipv4.addresses 192.168.1.100/24
   nmcli con mod "Connection Name" ipv4.gateway 192.168.1.1
   nmcli con mod "Connection Name" ipv4.dns "8.8.8.8,8.8.4.4"
   nmcli con mod "Connection Name" ipv4.method manual
   ```

2. Bring the connection back online:

   ```bash
   nmcli con up "Connection Name"
   ```

#### **Manual Configuration via Configuration Files:**

Alternatively, you can configure network settings directly by editing the configuration files in `/etc/sysconfig/network-scripts/`. Each interface has a corresponding file named `ifcfg-<interface>`. For example:

```bash
sudo nano /etc/sysconfig/network-scripts/ifcfg-ens33
```

A typical static IP configuration might look like this:

```bash
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.1.100
PREFIX=24
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
DEVICE=ens33
```

After saving the changes, restart the network service:

```bash
sudo systemctl restart network
```

---

### **Step 3: Managing DNS Settings**

DNS (Domain Name System) is essential for resolving domain names to IP addresses. To configure DNS on AlmaLinux:

#### **Via `nmcli`:**

```bash
nmcli con mod "Connection Name" ipv4.dns "8.8.8.8,8.8.4.4"
nmcli con up "Connection Name"
```

#### **Manual Configuration:**

Edit the `/etc/resolv.conf` file (though this is often managed dynamically by `NetworkManager`):

```bash
sudo nano /etc/resolv.conf
```

Add your preferred DNS servers:

```plaintext
nameserver 8.8.8.8
nameserver 8.8.4.4
```

To make changes persistent, disable dynamic updates by `NetworkManager`:

```bash
sudo nano /etc/NetworkManager/NetworkManager.conf
```

Add or modify the following line:

```plaintext
dns=none
```

Restart the service:

```bash
sudo systemctl restart NetworkManager
```

---

### **Step 4: Advanced Network Configurations**

#### **Network Bonding:**

Network bonding aggregates multiple network interfaces to improve redundancy and throughput.

1. Install necessary tools:

   ```bash
   sudo yum install teamd
   ```

2. Create a new bonded connection:

   ```bash
   nmcli con add type bond ifname bond0 mode active-backup
   ```

3. Add slave interfaces:

   ```bash
   nmcli con add type ethernet slave-type bond ifname ens33 master bond0
   nmcli con add type ethernet slave-type bond ifname ens34 master bond0
   ```

4. Configure the bond interface with an IP:

   ```bash
   nmcli con mod bond0 ipv4.addresses 192.168.1.100/24 ipv4.method manual
   nmcli con up bond0
   ```

#### **Bridging Interfaces:**

Bridging is often used in virtualization to allow VMs to access the network.

1. Create a bridge interface:

   ```bash
   nmcli con add type bridge ifname br0
   ```

2. Add a slave interface to the bridge:

   ```bash
   nmcli con add type ethernet slave-type bridge ifname ens33 master br0
   ```

3. Set IP for the bridge:

   ```bash
   nmcli con mod br0 ipv4.addresses 192.168.1.200/24 ipv4.method manual
   nmcli con up br0
   ```

---

### **Step 5: Troubleshooting Common Issues**

#### **1. Connection Not Working:**

- Ensure the network service is running:

  ```bash
  sudo systemctl status NetworkManager
  ```

- Restart the network service if necessary:

  ```bash
  sudo systemctl restart NetworkManager
  ```

#### **2. IP Conflicts:**

- Check for duplicate IP addresses on the network using `arp-scan`:

  ```bash
  sudo yum install arp-scan
  sudo arp-scan --localnet
  ```

#### **3. DNS Resolution Fails:**

- Verify the contents of `/etc/resolv.conf`.
- Ensure the DNS servers are reachable using `ping`:

  ```bash
  ping 8.8.8.8
  ```

#### **4. Interface Does Not Come Up:**

- Confirm the interface is enabled:

  ```bash
  nmcli device status
  ```

- Bring the interface online:

  ```bash
  nmcli con up "Connection Name"
  ```

---

### **Conclusion**

Setting up and manipulating network settings on AlmaLinux requires a good understanding of basic and advanced network configuration techniques. Whether configuring a simple DHCP connection or implementing network bonding for redundancy, AlmaLinux provides a robust and flexible set of tools to meet your needs. By mastering `nmcli`, understanding configuration files, and utilizing troubleshooting strategies, you can ensure optimal network performance in your AlmaLinux environment.

Remember to document your network setup and backup configuration files before making significant changes to avoid downtime or misconfigurations.
