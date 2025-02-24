---
draft: false
title: How to Configure Network Addressing with Cinnamon Desktop on Linux Mint
linkTitle: How to Configure Network Addressing
translationKey: how-to-configure-network-addressing-with-cinnamon-desktop-on-linux-mint
description: Learn how to configure network addressing on Linux Mint with the Cinnamon Desktop to manage network settings effectively.
url: how-to-configure-network-addressing-with-cinnamon-desktop-on-linux-mint
weight: 250
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
  - network addressing
featured_image: /images/linuxmint1.webp
---
Linux Mint, with its Cinnamon desktop environment, is a popular Linux distribution known for its ease of use and elegant interface. Whether you are setting up a home network, managing a business setup, or simply want to customize your internet settings, configuring network addressing correctly is essential. In this guide, we will walk you through the process of configuring network addressing on Linux Mint using the Cinnamon desktop.

## Understanding Network Addressing

Before we begin with the actual configuration, it’s important to understand the basic concepts of network addressing:

- **Dynamic Host Configuration Protocol (DHCP):** This is a network management protocol where IP addresses are assigned dynamically by a DHCP server. This method is the default in most networks and is ideal for home users who do not need fixed IP addresses.
- **Static IP Addressing:** This involves manually assigning an IP address, subnet mask, gateway, and DNS settings. It is useful for servers, printers, or any device that needs a fixed address.
- **IPv4 and IPv6:** IPv4 addresses are the traditional numeric addresses (e.g., 192.168.1.100), whereas IPv6 addresses are alphanumeric and provide a larger addressing space.

## Checking Your Current Network Configuration

Before making any changes, it’s good practice to check the current network configuration.

### Using the Terminal

Open a terminal (Press `Ctrl + Alt + T`) and enter:

```bash
ip a
```

This will list all network interfaces and their assigned IP addresses.

Alternatively, you can use:

```bash
nmcli device show
```

This command provides a detailed view of your network interfaces, including their MAC address, IP configuration, and DNS settings.

## Configuring Network Addressing Using the GUI (Network Manager)

Linux Mint Cinnamon provides an intuitive GUI tool to configure network settings via the **Network Manager**.

### Steps to Set a Static IP Address

1. **Open the Network Settings:**
   - Click on the **Network** icon in the system tray (bottom-right corner).
   - Select **Network Settings**.

2. **Choose Your Network Connection:**
   - If you are using a wired connection, select **Wired**.
   - If you are on Wi-Fi, select your active **Wi-Fi connection**.

3. **Edit the Connection:**
   - Click on the settings (gear) icon next to your active connection.

4. **Go to IPv4 Settings:**
   - In the pop-up window, select the **IPv4** tab.

5. **Change from Automatic (DHCP) to Manual:**
   - Change the **Method** from **Automatic (DHCP)** to **Manual**.
   - Click **Add** and enter the following:
     - **Address:** Enter the desired static IP (e.g., 192.168.1.150)
     - **Netmask:** Typically 255.255.255.0 for home networks
     - **Gateway:** Usually the router’s IP address (e.g., 192.168.1.1)
     - **DNS Servers:** Enter one or more DNS servers (e.g., 8.8.8.8 for Google DNS, 1.1.1.1 for Cloudflare DNS)

6. **Save and Apply Changes:**
   - Click **Save** and then toggle the network connection off and back on to apply changes.

7. **Verify the Changes:**
   - Open the terminal and use the `ip a` or `nmcli device show` command to check if the static IP is assigned.

## Configuring Network Addressing Using the Terminal

For users who prefer working with the command line, network settings can also be configured using the `nmcli` command.

### Setting a Static IP Address via Terminal

1. **List Available Connections:**

   ```bash
   nmcli connection show
   ```

   Identify the name of your active connection (e.g., `Wired connection 1`).

2. **Set a Static IP Address:**

   ```bash
   nmcli connection modify "Wired connection 1" ipv4.addresses 192.168.1.150/24
   nmcli connection modify "Wired connection 1" ipv4.gateway 192.168.1.1
   nmcli connection modify "Wired connection 1" ipv4.dns "8.8.8.8 1.1.1.1"
   nmcli connection modify "Wired connection 1" ipv4.method manual
   ```

3. **Apply Changes and Restart the Connection:**

   ```bash
   nmcli connection down "Wired connection 1"
   nmcli connection up "Wired connection 1"
   ```

4. **Verify the Configuration:**

   ```bash
   ip a
   ```

## Configuring DHCP (Reverting to Automatic Addressing)

If you ever need to revert to DHCP, you can do so via the GUI by selecting **Automatic (DHCP)** in the Network Manager settings or using the terminal:

```bash
nmcli connection modify "Wired connection 1" ipv4.method auto
nmcli connection down "Wired connection 1"
nmcli connection up "Wired connection 1"
```

## Additional Network Configuration Tips

- **Handling Multiple Network Interfaces:** If you have both wired and wireless connections, ensure they are properly configured to avoid conflicts.
- **Checking DNS Resolution:** If you experience slow browsing, try changing your DNS servers using the steps above.
- **Using `resolv.conf`:** In some cases, you might need to manually edit `/etc/resolv.conf` to add custom DNS servers.

  ```bash
  sudo nano /etc/resolv.conf
  ```

  Add the following lines:

  ```bash
  nameserver 8.8.8.8
  nameserver 1.1.1.1
  ```

  Save and exit (`Ctrl + X`, then `Y` and `Enter`).

## Conclusion

Configuring network addressing on Linux Mint Cinnamon is straightforward whether you use the GUI or the terminal. While DHCP is the default and recommended setting for most users, a static IP address can be beneficial for specific use cases like running a local server or improving network stability. By following the steps in this guide, you can effectively manage your network settings and ensure seamless connectivity.

If you encounter any issues, tools like `ping`, `traceroute`, and `nslookup` can help diagnose network problems. Happy networking!
