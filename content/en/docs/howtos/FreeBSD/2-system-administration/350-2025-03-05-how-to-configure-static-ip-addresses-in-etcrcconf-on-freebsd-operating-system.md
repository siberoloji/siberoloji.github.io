---
draft: false
title: How to Configure Static IP Addresses in `/etc/rc.conf` on FreeBSD Operating System
linkTitle: How to Configure Static IP Addresses in `/etc/rc.conf`
translationKey: how-to-configure-static-ip-addresses-in-etcrcconf-on-freebsd-operating-system
description: This article explains how to configure static IP addresses in FreeBSD using the `/etc/rc.conf` file.
url: how-to-configure-static-ip-addresses-in-etcrcconf-on-freebsd-operating-system
date: 2023-03-05
weight: 350
keywords:
  - FreeBSD
  - static IP address
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful, open-source Unix-like operating system known for its robustness, scalability, and advanced networking capabilities. One of the fundamental tasks when setting up a FreeBSD system is configuring network interfaces, particularly assigning static IP addresses. Unlike dynamic IP addresses, which are assigned by a DHCP server and can change over time, static IP addresses remain constant, making them essential for servers, network devices, and other systems where a consistent network identity is required.

In FreeBSD, network configuration is primarily managed through the `/etc/rc.conf` file. This file contains system configuration settings that are read during the boot process, making it the ideal place to define static IP addresses. In this blog post, we’ll walk you through the process of configuring static IP addresses in `/etc/rc.conf` on FreeBSD, covering everything from identifying network interfaces to troubleshooting common issues.

---

## Table of Contents

1. **Understanding FreeBSD Network Interfaces**
2. **Identifying Your Network Interface**
3. **Configuring a Static IP Address in `/etc/rc.conf`**
4. **Additional Network Configuration Options**
5. **Applying and Testing the Configuration**
6. **Troubleshooting Common Issues**
7. **Conclusion**

---

## 1. Understanding FreeBSD Network Interfaces

Before diving into the configuration, it’s important to understand how FreeBSD handles network interfaces. Each network interface on a FreeBSD system is represented by a driver-specific name. For example:

- **em0**: Intel PRO/1000 Ethernet adapter
- **igb0**: Intel Gigabit Ethernet adapter
- **re0**: Realtek Ethernet adapter
- **vtnet0**: Virtual network interface in a virtualized environment (e.g., bhyve or VMware)

These interfaces are automatically detected during the boot process, and their configuration is defined in `/etc/rc.conf`. By default, FreeBSD attempts to obtain an IP address via DHCP, but you can override this behavior by specifying a static IP address.

---

## 2. Identifying Your Network Interface

To configure a static IP address, you first need to identify the name of the network interface you want to configure. You can do this using the `ifconfig` command:

```bash
ifconfig
```

This command will display a list of all network interfaces on your system, along with their current configuration. Look for the interface that is connected to your network. For example, you might see output like this:

```bash
em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
    options=209b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM>
    inet 192.168.1.100 netmask 0xffffff00 broadcast 192.168.1.255
    ether 00:1a:4b:12:34:56
    media: Ethernet autoselect (1000baseT <full-duplex>)
    status: active
```

In this example, `em0` is the network interface, and it currently has an IP address of `192.168.1.100`. Take note of the interface name, as you’ll need it for the next step.

---

## 3. Configuring a Static IP Address in `/etc/rc.conf`

The `/etc/rc.conf` file is the primary location for system configuration settings in FreeBSD. To configure a static IP address, you’ll need to add or modify entries in this file. Open the file in your preferred text editor (e.g., `vi`, `ee`, or `nano`):

```bash
sudo vi /etc/rc.conf
```

### Basic Static IP Configuration

To assign a static IP address to an interface, add the following lines to `/etc/rc.conf`:

```bash
ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0"
defaultrouter="192.168.1.1"
```

Here’s what each line does:

- `ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0"`: This line assigns the static IP address `192.168.1.100` with a subnet mask of `255.255.255.0` to the `em0` interface.
- `defaultrouter="192.168.1.1"`: This line specifies the default gateway (router) for the network.

### Advanced Configuration Options

Depending on your network setup, you may need to configure additional options. Here are some common examples:

#### Setting DNS Servers

To configure DNS servers, edit the `/etc/resolv.conf` file:

```bash
nameserver 8.8.8.8
nameserver 8.8.4.4
```

These lines specify Google’s public DNS servers. Replace them with your preferred DNS servers.

#### Enabling IPv6

If you want to configure an IPv6 address, you can add the following line to `/etc/rc.conf`:

```bash
ifconfig_em0_ipv6="inet6 2001:db8::1 prefixlen 64"
```

#### Disabling DHCP

If the interface was previously configured to use DHCP, make sure to remove or comment out any `dhclient` entries in `/etc/rc.conf`. For example:

```bash
# ifconfig_em0="DHCP"
```

---

## 4. Additional Network Configuration Options

FreeBSD provides a variety of options for fine-tuning network settings. Here are a few additional configurations you might find useful:

### Hostname

To set the system’s hostname, add the following line to `/etc/rc.conf`:

```bash
hostname="freebsd-server"
```

### Static Routes

If you need to define static routes, use the `static_routes` and `route_*` variables. For example:

```bash
static_routes="net1 net2"
route_net1="-net 10.0.0.0/8 192.168.1.254"
route_net2="-net 172.16.0.0/12 192.168.1.254"
```

### MTU (Maximum Transmission Unit)

To set a custom MTU for an interface, use the `mtu` option:

```bash
ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0 mtu 9000"
```

---

## 5. Applying and Testing the Configuration

Once you’ve made the necessary changes to `/etc/rc.conf`, you’ll need to apply the configuration. You can do this by restarting the networking service or rebooting the system.

### Restarting the Networking Service

To apply the changes without rebooting, run the following command:

```bash
sudo service netif restart
sudo service routing restart
```

### Testing the Configuration

After applying the configuration, verify that the static IP address has been assigned correctly:

```bash
ifconfig em0
```

You should see the static IP address you configured. Next, test network connectivity by pinging an external host:

```bash
ping -c 4 google.com
```

If the ping is successful, your static IP configuration is working correctly.

---

## 6. Troubleshooting Common Issues

While configuring a static IP address is generally straightforward, you may encounter issues. Here are some common problems and their solutions:

### Issue 1: Interface Not Found

If the interface name you configured doesn’t match the actual interface, the configuration will fail. Double-check the interface name using `ifconfig`.

### Issue 2: No Internet Connectivity

If you can’t reach the internet, ensure that:

- The `defaultrouter` is correctly set.
- The DNS servers are properly configured in `/etc/resolv.conf`.
- There are no firewall rules blocking traffic.

### Issue 3: Conflicting DHCP Configuration

If the interface was previously configured to use DHCP, make sure to disable it by removing or commenting out any `dhclient` entries in `/etc/rc.conf`.

### Issue 4: Incorrect Subnet Mask

An incorrect subnet mask can prevent communication with other devices on the network. Verify that the subnet mask matches your network’s configuration.

---

## 7. Conclusion

Configuring a static IP address in FreeBSD is a fundamental skill that’s essential for managing servers and network devices. By editing the `/etc/rc.conf` file, you can define static IP addresses, gateways, and other network settings that persist across reboots. While the process is straightforward, it’s important to double-check your configuration to avoid common pitfalls like incorrect interface names or subnet masks.

Whether you’re setting up a web server, a database server, or a network appliance, understanding how to configure static IP addresses in FreeBSD will help you build a stable and reliable network environment. With the steps outlined in this guide, you should be well-equipped to manage your FreeBSD system’s network configuration with confidence.

---

If you found this guide helpful, feel free to share it with others who might benefit from it. For more in-depth tutorials and tips on FreeBSD and other open-source technologies, stay tuned to our blog!
