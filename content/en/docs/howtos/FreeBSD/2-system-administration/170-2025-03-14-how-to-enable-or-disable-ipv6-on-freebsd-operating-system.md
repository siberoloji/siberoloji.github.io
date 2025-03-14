---
draft: false
title: How to Enable or Disable IPv6 on FreeBSD Operating System
linkTitle: How to Enable or Disable IPv6 on FreeBSD
translationKey: how-to-enable-or-disable-ipv6-on-freebsd-operating-system
description: Learn how to enable or disable IPv6 on FreeBSD.
url: how-to-enable-or-disable-ipv6-on-freebsd-operating-system
date: 2025-03-14
weight: 170
keywords:
  - FreeBSD
  - IPv6
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD, known for its stability and performance as a server operating system, comes with comprehensive IPv6 support out of the box. While IPv6 is enabled by default in most FreeBSD installations, there may be scenarios where system administrators need to either disable it for security or compatibility reasons, or ensure it's properly configured for modern network environments.

This guide explores the various methods to enable or disable IPv6 on FreeBSD systems, covering both temporary changes and permanent configurations that persist across reboots.

## Understanding IPv6 in FreeBSD

FreeBSD has included IPv6 support in its networking stack since FreeBSD 4.0. The implementation is based on the KAME IPv6 stack, which is known for its completeness and standards compliance. By default, most FreeBSD installations will have IPv6 enabled on all network interfaces, configured to use stateless address autoconfiguration (SLAAC) when available.

IPv6 functionality in FreeBSD is controlled through several mechanisms:

- Kernel configuration options
- System control (sysctl) variables
- Network interface configuration files
- Firewall rules

## Checking IPv6 Status

Before making any changes, it's important to verify the current state of IPv6 on your FreeBSD system.

### Checking IPv6 Kernel Support

First, confirm whether your kernel has IPv6 support built in:

```sh
sysctl net.inet6 | head -1
```

If you see output like `net.inet6.ip6.forwarding: 0`, IPv6 is supported in your kernel.

### Listing IPv6 Addresses

To see all currently assigned IPv6 addresses:

```sh
ifconfig | grep "inet6"
```

This will display all network interfaces with IPv6 addresses, including the link-local addresses (beginning with `fe80:`) that are automatically configured.

## Disabling IPv6 on FreeBSD

There are several approaches to disabling IPv6 on FreeBSD, depending on your specific requirements and how permanent you want the change to be.

### Method 1: Temporary Disable with sysctl

To temporarily disable IPv6 until the next reboot, you can use the sysctl command:

```sh
# Disable IPv6 on all interfaces
sudo sysctl net.inet6.ip6.accept_rtadv=0
sudo sysctl net.inet6.ip6.auto_linklocal=0
```

This disables router advertisement processing and automatic link-local address configuration, effectively turning off most IPv6 functionality. However, these changes will not persist after a system reboot.

### Method 2: Permanent Disable via /etc/rc.conf

For a permanent solution that persists across reboots, add the following lines to your `/etc/rc.conf` file:

```sh
# Disable IPv6 globally
ipv6_activate_all_interfaces="NO"
ipv6_enable="NO"
```

Additionally, for each network interface where you want to disable IPv6, add a specific configuration line. For example, for the `em0` interface:

```sh
ifconfig_em0_ipv6="inet6 -ifdisabled"
```

Or, to completely prevent any IPv6 configuration:

```sh
ifconfig_em0_ipv6="NONE"
```

### Method 3: Using /etc/sysctl.conf for Permanent System Control Settings

To make the sysctl changes permanent, add them to `/etc/sysctl.conf`:

```sh
# Disable IPv6 functionality
net.inet6.ip6.accept_rtadv=0
net.inet6.ip6.auto_linklocal=0
```

### Method 4: Using devd to Disable IPv6 on New Interfaces

If you want to disable IPv6 on interfaces as they appear (useful for removable devices or virtual machines), create a devd configuration file:

Create a file `/usr/local/etc/devd/no_ipv6.conf` with the following content:

```sh
notify 30 {
    match "system"      "IFNET";
    match "type"        "ATTACH";
    action "ifconfig $subsystem inet6 -ifdisabled";
};
```

Then restart the devd service:

```sh
sudo service devd restart
```

### Method 5: Disabling IPv6 in the Kernel

For a more comprehensive approach, you can disable IPv6 support in the kernel. Create a custom kernel configuration file in `/usr/src/sys/amd64/conf/` (assuming you're using amd64 architecture) that excludes IPv6 support:

```sh
include GENERIC
nooptions INET6
```

Then build and install the new kernel:

```sh
cd /usr/src
sudo make buildkernel KERNCONF=NOIPV6
sudo make installkernel KERNCONF=NOIPV6
```

This method requires rebuilding the kernel and is more invasive than the previous approaches, so it should be used only when absolutely necessary.

## Enabling IPv6 on FreeBSD

If you need to enable IPv6 on a system where it has been disabled, or configure it properly for your network, follow these steps.

### Method 1: Basic IPv6 Enabling via /etc/rc.conf

To enable basic IPv6 support that persists across reboots, add these lines to `/etc/rc.conf`:

```sh
# Enable IPv6 globally
ipv6_activate_all_interfaces="YES"
ipv6_enable="YES"
```

For specific interface configuration (e.g., for interface em0):

```sh
ifconfig_em0_ipv6="inet6 accept_rtadv"
```

This enables IPv6 and router advertisement processing, which allows automatic configuration in networks with IPv6 routers.

### Method 2: Static IPv6 Configuration

For a static IPv6 address configuration on an interface:

```sh
ifconfig_em0_ipv6="inet6 2001:db8:1234:5678::10 prefixlen 64"
ipv6_defaultrouter="fe80::1%em0"
```

Replace `2001:db8:1234:5678::10` with your actual IPv6 address and adjust the prefix length as needed. The `ipv6_defaultrouter` specifies the default gateway for IPv6 traffic.

### Method 3: DHCPv6 Configuration

If your network uses DHCPv6 for address assignment:

```sh
ifconfig_em0_ipv6="inet6 dhcp"
```

This instructs the interface to request an IPv6 address via DHCPv6.

### Method 4: Enabling Router Advertisement Processing

To enable the system to process router advertisements and configure IPv6 automatically:

```sh
# Enable router advertisement processing
sudo sysctl net.inet6.ip6.accept_rtadv=1
```

For a permanent change, add to `/etc/sysctl.conf`:

```sh
net.inet6.ip6.accept_rtadv=1
```

## Testing IPv6 Connectivity

After configuring IPv6, it's important to verify that it's working correctly.

### Basic Connectivity Tests

Test local IPv6 functionality:

```sh
ping6 ::1
```

This pings the IPv6 loopback address, which should always work if IPv6 is enabled.

Test link-local connectivity to a router:

```sh
ping6 fe80::1%em0
```

Replace `fe80::1` with your router's link-local address and `em0` with your interface name.

### Internet Connectivity Tests

To test global IPv6 connectivity:

```sh
ping6 ipv6.google.com
```

Or:

```sh
traceroute6 ipv6.google.com
```

## Advanced IPv6 Configuration

### IPv6 Privacy Extensions

FreeBSD supports IPv6 privacy extensions (RFC 4941), which generate temporary addresses to enhance privacy:

```sh
# Enable privacy extensions in /etc/rc.conf
ipv6_privacy="YES"
```

And in `/etc/sysctl.conf`:

```sh
net.inet6.ip6.use_tempaddr=1
net.inet6.ip6.prefer_tempaddr=1
```

### IPv6 Firewall Configuration

FreeBSD's pf firewall can be configured to filter IPv6 traffic. Edit `/etc/pf.conf` to include IPv6 rules:

```sh
# Allow all IPv6 traffic on the loopback interface
pass quick on lo0 inet6 all

# Allow ICMPv6 (necessary for proper IPv6 operation)
pass inet6 proto ipv6-icmp all

# Default deny
block in all
block out all

# Allow established connections
pass inet6 from any to any flags S/SA keep state
```

After editing, reload the firewall:

```sh
sudo service pf reload
```

## Troubleshooting IPv6 Issues

### Common Problems and Solutions

1. **No IPv6 address assigned**: Check router advertisements with `rtsol -Dv em0` or DHCPv6 with `dhclient -6 -d em0`

2. **Cannot reach IPv6 sites**: Verify routing with `netstat -rn -f inet6` and check for firewalls blocking IPv6 traffic

3. **Interface shows "inet6 no_radr"**: This indicates router advertisements are disabled. Enable with `ifconfig em0 inet6 accept_rtadv`

### Useful Diagnostic Commands

```sh
# View routing table for IPv6
netstat -rn -f inet6

# Check IPv6 neighbor discovery cache
ndp -a

# Monitor IPv6 packets
tcpdump -i em0 ip6

# Test DNS resolution for IPv6
host -t AAAA freebsd.org
```

## Conclusion

FreeBSD offers flexible and comprehensive support for IPv6, whether you need to enable it for modern network connectivity or disable it for specific security or compatibility reasons. By understanding the various configuration methods—from simple interface settings to kernel-level options—system administrators can tailor IPv6 functionality precisely to their needs.

For most current deployments, enabling IPv6 is recommended to future-proof your infrastructure and take advantage of the benefits of the larger address space and improved protocol features. However, FreeBSD's flexibility allows for disabling IPv6 when necessary without compromising system stability.

Remember to test your configuration thoroughly after making changes, especially in production environments, to ensure network services remain accessible and secure.
