---
draft: false
title: How to Install dnsmasq DNS Server on Raspberry Pi OS
linkTitle: Install dnsmasq DNS Server
translationKey: how-to-install-dnsmasq-dns-server-on-raspberry-pi
weight: 40
description: This comprehensive guide will walk you through the process of installing and configuring dnsmasq a lightweight DNS forwarder ideal for small-scale networks.
date: 2025-01-19
url: install-dnsmasq-dns-server-raspberry-pi-os
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
Setting up a Domain Name System (DNS) server on your Raspberry Pi running Raspberry Pi OS Debian 12 Bookworm can significantly enhance your network's efficiency by reducing lookup times and improving overall connectivity. This comprehensive guide will walk you through the process of installing and configuring `dnsmasq`, a lightweight DNS forwarder ideal for small-scale networks.

## Prequisites

Before we begin, ensure you have the following:

- **Raspberry Pi**: Model 2, 3, or 4.
- **Operating System**: Raspberry Pi OS Debian 12 Bookworm.
- **Network Connection**: A stable internet connection via Ethernet or Wi-Fi.
- **Static IP Address**: It's recommended to assign a static IP to your Raspberry Pi to ensure consistent network identification.

### Step 1: Update Your System

Start by updating your package lists and upgrading existing packages to their latest versions. Open a terminal and execute:

```bash
sudo apt update
sudo apt upgrade -y
```

This ensures that your system has the latest security patches and software updates.

### Step 2: Install `dnsmasq`

`dnsmasq` is a lightweight DNS forwarder and DHCP server designed for small networks. Install it using:

```bash
sudo apt install dnsmasq -y
```

### Step 3: Configure `dnsmasq`

After installation, you'll need to configure `dnsmasq` to function as your DNS server. Follow these steps:

1. **Backup the Original Configuration**: It's good practice to keep a backup of the original configuration file.

   ```bash
   sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
   ```

2. **Edit the Configuration File**: Open the `dnsmasq` configuration file in a text editor:

   ```bash
   sudo nano /etc/dnsmasq.conf
   ```

3. **Modify the Following Settings**:

   - **Prevent Forwarding of Plain Names**: Uncomment the `domain-needed` line to avoid forwarding incomplete domain names.

     ```ini
     domain-needed
     ```

   - **Block Private IP Reverse Lookups**: Uncomment the `bogus-priv` line to block reverse lookups for private IP ranges.

     ```ini
     bogus-priv
     ```

   - **Specify Upstream DNS Servers**: Add your preferred upstream DNS servers. For example, to use Google's DNS servers:

     ```ini
     server=8.8.8.8
     server=8.8.4.4
     ```

   - **Set Cache Size**: Increase the cache size to improve performance.

     ```ini
     cache-size=1000
     ```

4. **Save and Exit**: After making the changes, save the file by pressing `CTRL + X`, then `Y`, and press `Enter`.

### Step 4: Restart and Enable `dnsmasq`

To apply the changes, restart the `dnsmasq` service:

```bash
sudo systemctl restart dnsmasq
```

Enable `dnsmasq` to start on boot:

```bash
sudo systemctl enable dnsmasq
```

### Step 5: Configure Network Manager for a Static IP

With the release of Raspberry Pi OS Bookworm, networking is managed by NetworkManager. To assign a static IP address:

1. **List Network Interfaces**: Identify your network connection name.

   ```bash
   nmcli connection show
   ```

   Look for the interface, typically named `Wired connection 1` for Ethernet or your Wi-Fi SSID.

2. **Set Static IP Address**: Replace `CONNECTION_NAME` with your actual connection name.

   ```bash
   sudo nmcli connection modify "CONNECTION_NAME" ipv4.addresses 192.168.1.100/24 ipv4.method manual
   ```

3. **Set Gateway and DNS**: Assuming your router's IP is `192.168.1.1`:

   ```bash
   sudo nmcli connection modify "CONNECTION_NAME" ipv4.gateway 192.168.1.1
   sudo nmcli connection modify "CONNECTION_NAME" ipv4.dns "192.168.1.1,8.8.8.8"
   ```

4. **Apply Changes**: Bring the connection down and up to apply changes.

   ```bash
   sudo nmcli connection down "CONNECTION_NAME" && sudo nmcli connection up "CONNECTION_NAME"
   ```

### Step 6: Test the DNS Server

To verify that your Raspberry Pi is correctly resolving DNS queries:

1. **Install `dnsutils`**: If not already installed, to use the `dig` command.

   ```bash
   sudo apt install dnsutils -y
   ```

2. **Perform a Test Query**: Use the `dig` command to test DNS resolution.

   ```bash
   dig example.com @localhost
   ```

Check the output for a valid response and note the query time. Subsequent queries should be faster due to caching.

### Step 7: Configure Client Devices

To utilize your Raspberry Pi as the DNS server, configure other devices on your network to use its static IP address as their primary DNS server. This setting is typically found in the network configuration section of each device.

## Conclusion

By following this guide, you’ve successfully transformed your Raspberry Pi running Debian 12 Bookworm into a lightweight and efficient DNS server using `dnsmasq`. This setup allows your network to benefit from faster domain lookups, a reduced dependency on external DNS servers, and improved overall network performance.

Key benefits of this configuration include:

- **Local Caching**: Frequently accessed domains are cached, speeding up subsequent requests.
- **Customizability**: You can add custom DNS records or override specific domain names for your local network.
- **Reduced Bandwidth**: Cached responses reduce the need for repeated queries to external DNS servers.

To further enhance your setup, consider the following:

1. **Monitoring Logs**: Check `/var/log/syslog` for `dnsmasq` logs to monitor DNS queries and ensure everything is running smoothly.
2. **Security Enhancements**: Implement firewall rules using `ufw` or `iptables` to restrict access to the DNS server to devices within your local network.
3. **Advanced DNS Features**: Explore additional `dnsmasq` options, such as DHCP integration or filtering specific domains.

With this DNS server in place, your Raspberry Pi not only becomes a central hub for managing network queries but also a powerful tool for improving your network’s efficiency. Whether for personal use or small-scale enterprise projects, this setup ensures a robust and reliable DNS service. Happy networking!
