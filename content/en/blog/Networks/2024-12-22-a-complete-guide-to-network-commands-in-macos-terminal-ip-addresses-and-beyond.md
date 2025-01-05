---
title: "A Complete Guide to Network Commands in MacOS Terminal: IP Addresses and Beyond"
linkTitle: Network Commands in MacOS
description: This comprehensive guide will walk you through the most useful Terminal commands for viewing IP addresses and managing network connections on MacOS.
date: 2024-12-22
draft: false
toc: true
keywords:
  - Network Commands in MacOS
tags:
  - mac terminal
  - network
categories:
  - MAC/iOS
type: blog
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

featured_image: /images/zsh-terminal-illustration.svg
url: ""


---
For Mac users who want to dive into network diagnostics and management through the Terminal, understanding the essential networking commands is crucial. This comprehensive guide will walk you through the most useful Terminal commands for viewing IP addresses and managing network connections on MacOS.

## Viewing IP Addresses

### Checking Your Local IP Address

The most straightforward way to view your IP address is using the `ifconfig` command. While this command is considered legacy on Linux systems, it remains fully functional on MacOS:

```bash
ifconfig
```

This command displays information about all network interfaces. However, it provides a lot of information that might be overwhelming. To filter for just your primary interface (usually en0 for Wi-Fi or en1 for Ethernet):

```bash
ifconfig en0 | grep inet
```

A more modern alternative is the `ip` command:

```bash
ipconfig getifaddr en0
```

### Finding Your Public IP Address

Your public IP address (the one visible to the internet) can be checked using curl commands:

```bash
curl ifconfig.me
```

or

```bash
curl ipecho.net/plain
```

## Essential Network Diagnostic Commands

### 1. Network Statistics with netstat

The `netstat` command provides network statistics and information:

```bash
# View all active connections
netstat -an

# View routing table
netstat -r

# Display network interface statistics
netstat -i
```

### 2. Testing Connectivity with ping

The `ping` command sends ICMP echo requests to test network connectivity:

```bash
# Basic ping
ping www.google.com

# Limit to specific number of pings
ping -c 5 www.google.com
```

### 3. Tracing Network Routes

Use `traceroute` to see the path packets take to reach a destination:

```bash
traceroute www.google.com
```

### 4. DNS Lookups

The `dig` command provides detailed DNS information:

```bash
# Basic DNS lookup
dig www.google.com

# Short answer only
dig +short www.google.com

# Reverse DNS lookup
dig -x 8.8.8.8
```

## Advanced Network Management

### 1. Network Service Management

MacOS provides the `networksetup` command for advanced network configuration:

```bash
# List all network services
networksetup -listallnetworkservices

# Get Wi-Fi information
networksetup -getinfo "Wi-Fi"

# Turn Wi-Fi off/on
networksetup -setairportpower en0 off
networksetup -setairportpower en0 on
```

### 2. Wi-Fi Specific Commands

The `airport` command (a symbolic link must be created first) provides detailed Wi-Fi information:

```bash
# Create symbolic link (only needs to be done once)
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

# Scan for available networks
airport -s

# Get current Wi-Fi status
airport -I
```

### 3. Network Port Information

Use `lsof` to list open network ports and the processes using them:

```bash
# List all network connections
sudo lsof -i

# List processes listening on specific ports
sudo lsof -i :80
```

## Troubleshooting Network Issues

### 1. Flushing DNS Cache

When experiencing DNS-related issues, clearing the DNS cache can help:

```bash
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

### 2. Network Interface Reset

If you're having network connectivity issues, you can reset the network interface:

```bash
sudo ifconfig en0 down
sudo ifconfig en0 up
```

### 3. Checking Network Hardware Status

For detailed information about your network hardware:

```bash
system_profiler SPNetworkDataType
```

## Best Practices and Tips

1. **Regular Monitoring**: Make it a habit to check network statistics periodically using commands like `netstat` and `ifconfig` to understand your network's normal behavior.

2. **Security Awareness**: When using commands that show network information, be cautious about sharing the output as it may contain sensitive information about your network configuration.

3. **Documentation**: Keep a record of useful commands and their outputs when your network is functioning correctly. This provides a baseline for comparison when troubleshooting issues.

4. **Permission Management**: Many network commands require administrator privileges. Always use `sudo` with caution and only when necessary.

## Conclusion

Understanding and effectively using Terminal network commands on MacOS is an essential skill for any system administrator or power user. These commands provide detailed insights into your network configuration and are invaluable for troubleshooting connectivity issues. While the graphical interface provides basic network information, the Terminal offers more detailed control and diagnostic capabilities.

Remember that networking is complex, and these commands are just the beginning. As you become more comfortable with these basic commands, you can explore more advanced networking tools and concepts to better manage and troubleshoot your network connections.
