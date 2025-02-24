---
draft: false
title: How to Set Up Network Routing with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Network Routing
translationKey: how-to-set-up-network-routing-with-cinnamon-desktop-on-linux-mint
description: This guide walks you through setting up and managing network routing on Linux Mint with the Cinnamon desktop environment, using both GUI and command-line tools.
url: how-to-set-up-network-routing-with-cinnamon-desktop-on-linux-mint
weight: 240
date: 2025-02-24
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - network routing
featured_image: /images/linuxmint1.webp
---
Linux Mint is one of the most popular distributions in the Linux ecosystem, known for its stability, user-friendliness, and strong community support. If you're using Linux Mint with the Cinnamon desktop environment and need to configure network routing, whether for home networking, advanced networking setups, or security purposes, this guide will walk you through the process.

This article provides a step-by-step tutorial on setting up and managing network routing using both the graphical user interface (GUI) and command-line tools available in Linux Mint.

## Understanding Network Routing

Network routing is the process of selecting paths in a network along which to send data. In Linux Mint, routing helps determine how data packets travel between your device and other networks, including the internet. The system uses a routing table to manage these routes, and it can be modified to improve connectivity, security, or network performance.

## Checking Your Current Network Configuration

Before setting up or modifying routing on Linux Mint, it is important to check your existing network configuration. Open a terminal and run the following command:

```bash
ip route show
```

or

```bash
route -n
```

This will display the routing table, showing details such as default gateway, connected interfaces, and specific routes to various destinations.

## Setting Up Static Routes Using the GUI

Cinnamon Desktop offers a graphical way to configure networking settings, including static routes. Here's how to do it:

1. **Open Network Settings:** Click on the network icon in the system tray (usually located in the bottom-right corner), and select "Network Settings."
2. **Select Your Connection:** Click on the wired or wireless connection you want to modify.
3. **Go to IPv4 Settings:** Under the "IPv4" tab, switch from "Automatic (DHCP)" to "Manual."
4. **Add a Route:** Scroll down to the "Routes" section and click "Add."
   - Enter the destination network (e.g., `192.168.1.0`)
   - Specify the subnet mask (e.g., `255.255.255.0` or CIDR notation `/24`)
   - Enter the gateway (e.g., `192.168.1.1`)
   - Select "Use this connection only for resources on its network" if necessary.
5. **Save and Apply Changes:** Click "Save" and restart your network connection.

This method is user-friendly and does not require command-line interaction, making it ideal for less technical users.

## Configuring Routing via the Command Line

For advanced users who prefer command-line control, routing can be set up using terminal commands.

### Adding a Static Route

To add a static route, use the `ip route add` command:

```bash
sudo ip route add 192.168.2.0/24 via 192.168.1.1 dev eth0
```

Explanation:

- `192.168.2.0/24` is the destination network.
- `via 192.168.1.1` specifies the gateway.
- `dev eth0` tells the system which network interface to use.

### Deleting a Route

If you need to remove a static route, use:

```bash
sudo ip route del 192.168.2.0/24
```

### Setting the Default Gateway

To configure or change the default gateway, run:

```bash
sudo ip route add default via 192.168.1.1
```

To check if the default gateway is set correctly, use:

```bash
ip route
```

### Making Routes Persistent

By default, the `ip route add` command only lasts until the next reboot. To make the changes permanent:

1. Edit the network interfaces file:

   ```bash
   sudo nano /etc/network/interfaces
   ```

2. Add the following lines for static routes:

   ```plaintext
   iface eth0 inet static
       address 192.168.1.100
       netmask 255.255.255.0
       gateway 192.168.1.1
       up ip route add 192.168.2.0/24 via 192.168.1.1
   ```

3. Save and exit the file (`CTRL + X`, then `Y` and `Enter`).
4. Restart the networking service:

   ```bash
   sudo systemctl restart networking
   ```

Alternatively, if using `Netplan` (on newer Linux Mint versions):

1. Edit the Netplan configuration file:

   ```bash
   sudo nano /etc/netplan/01-network-manager-all.yaml
   ```

2. Add a static route:

   ```yaml
   network:
     version: 2
     renderer: NetworkManager
     ethernets:
       eth0:
         addresses:
           - 192.168.1.100/24
         gateway4: 192.168.1.1
         routes:
           - to: 192.168.2.0/24
             via: 192.168.1.1
   ```

3. Apply the changes:

   ```bash
   sudo netplan apply
   ```

## Verifying and Troubleshooting Routing

After setting up routing, it is essential to verify that the routes are working as expected.

### Checking the Routing Table

Run:

```bash
ip route show
```

or

```bash
netstat -rn
```

### Testing Connectivity

Use the `ping` command to test connectivity between networks:

```bash
ping 192.168.2.1
```

If the ping fails, check the following:

- Ensure the correct gateway is set.
- Verify that the network interface is up (`ip link show`).
- Check firewall settings (`sudo ufw status`).

## Conclusion

Setting up network routing on Linux Mint with the Cinnamon Desktop is straightforward using either the GUI or the command line. While the GUI is more beginner-friendly, the command-line approach provides greater flexibility and control. Ensuring proper configuration and persistence of routing rules can help optimize network performance and connectivity. Whether you're setting up a home network or managing a more complex infrastructure, mastering these routing techniques can greatly enhance your Linux Mint networking experience.
