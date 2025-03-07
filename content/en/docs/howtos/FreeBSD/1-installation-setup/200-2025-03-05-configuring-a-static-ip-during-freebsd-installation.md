---
draft: false
title: Configuring a Static IP During FreeBSD Installation
linkTitle: Configuring a Static IP
translationKey: configuring-a-static-ip-during-freebsd-installation
description: Learn how to configure a static IP address during FreeBSD installation.
url: configuring-a-static-ip-during-freebsd-installation
date: 2025-03-05
weight: 200
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
## Introduction

Network configuration is a critical step in server and workstation setup, and FreeBSD offers robust networking capabilities. While dynamic IP assignment works for many scenarios, system administrators and power users often require a static IP address for consistent network identification. This guide will walk you through the process of configuring a static IP address during the FreeBSD installation process, ensuring a smooth and controlled network setup.

## Understanding Static IP Configuration in FreeBSD

Before diving into the configuration process, it's essential to understand what a static IP address means and why you might need one. A static IP address is a fixed numerical label assigned to a network interface that doesn't change automatically. Unlike dynamic IP addresses assigned by DHCP, static IPs remain constant, which is crucial for:

- Servers hosting critical services
- Network infrastructure devices
- Machines requiring consistent remote access
- Development and testing environments
- Specific network configurations with predefined IP requirements

## Prerequisites for Static IP Configuration

Before beginning the installation, you'll need to gather the following network information:

1. **IP Address**: The specific IP address you want to assign to your FreeBSD system
2. **Subnet Mask**: Defines the network segment (typically 255.255.255.0 for most local networks)
3. **Default Gateway**: The IP address of your network's router
4. **DNS Servers**: IP addresses of DNS servers for name resolution
5. **Network Interface Name**: The identifier for your network adapter (e.g., em0, re0, igb0)

## Step-by-Step Static IP Configuration During FreeBSD Installation

### 1. Initiating the Installation Process

1. Boot from the FreeBSD installation media (DVD or USB)
2. Select "Install" from the initial menu
3. Choose your preferred language and keyboard layout
4. Proceed through initial installation steps until you reach the network configuration screen

### 2. Network Interface Selection

- During the installation, you'll be presented with available network interfaces
- Identify the interface you want to configure (use `ifconfig` if unsure)
- Select the appropriate interface for static IP configuration

### 3. Manual Network Configuration

When prompted for network configuration, choose the manual setup option. You'll be asked to input the following details:

- **IPv4 Address**: Enter your desired static IP address
- **Subnet Mask**: Input the appropriate subnet mask
- **Default Router**: Provide the gateway IP address
- **DNS Configuration**: Add one or more DNS server IP addresses

### 4. Configuration Methods

FreeBSD offers multiple methods for static IP configuration:

#### Method 1: rc.conf Configuration

Edit `/etc/rc.conf` to manually set network parameters:

```shell
ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0"
defaultrouter="192.168.1.1"
```

#### Method 2: Network Interface Configuration File

Create or modify `/etc/ifconfig.em0` with network details:

```shell
inet 192.168.1.100 netmask 255.255.255.0
```

### 5. DNS Configuration

Configure DNS servers in `/etc/resolv.conf`:

```shell
nameserver 8.8.8.8
nameserver 8.8.4.4
```

## Advanced Configuration Considerations

### Multiple Network Interfaces

If your system has multiple network interfaces, you can configure each separately in `rc.conf` or individual interface configuration files.

### VLAN Support

FreeBSD provides robust VLAN configuration capabilities. For tagged network configurations, use syntax like:

```shell
ifconfig_em0_2="inet 192.168.2.100 netmask 255.255.255.0 vlan 2"
```

### IPv6 Configuration

While this guide focuses on IPv4, FreeBSD also supports comprehensive IPv6 static IP configuration using similar methods.

## Common Troubleshooting Tips

1. **Verify Interface Names**: Use `ifconfig -a` to confirm exact interface names
2. **Check Network Configuration**: After installation, verify settings with `ifconfig`
3. **Test Connectivity**: Use `ping` to verify network connectivity
4. **Review Logs**: Check `/var/log/messages` for potential network configuration issues

## Security Recommendations

- Limit network exposure by configuring firewall rules
- Use `ipfw` or `pf` for additional network security
- Regularly update system and network configurations

## Conclusion

Configuring a static IP during FreeBSD installation provides precise control over network settings. By following this comprehensive guide, you can ensure a reliable and consistent network configuration tailored to your specific requirements.

## Additional Resources

- FreeBSD Handbook: Networking Configuration
- FreeBSD Manual Pages: ifconfig(8), rc.conf(5)
- Official FreeBSD Documentation

### Quick Reference Checklist

- [ ] Gather network information beforehand
- [ ] Select correct network interface
- [ ] Input static IP details during installation
- [ ] Verify configuration post-installation
- [ ] Configure additional network settings as needed

By understanding and implementing these steps, you'll successfully configure a static IP address during your FreeBSD installation, setting a solid foundation for your network infrastructure.
