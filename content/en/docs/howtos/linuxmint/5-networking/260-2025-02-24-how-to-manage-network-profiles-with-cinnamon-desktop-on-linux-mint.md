---
draft: false
title: How to Manage Network Profiles with Cinnamon Desktop on Linux Mint
linkTitle: Manage Network Profiles
translationKey: manage-network-profiles-with-cinnamon-desktop-on-linux-mint
description: Learn how to manage network profiles on Linux Mint using Cinnamon Desktop, covering tools like Network Manager, nmcli, and third-party solutions.
url: manage-network-profiles-with-cinnamon-desktop-on-linux-mint
weight: 260
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
  - network profiles
featured_image: /images/linuxmint1.webp
---
Linux Mint, particularly with the Cinnamon desktop environment, is a user-friendly and powerful operating system that provides a rich set of networking features. Managing network profiles efficiently can help users switch between different networks without manually configuring settings each time. This is especially useful for those who work in multiple locations, use both wired and wireless connections, or require specific network configurations for different tasks.

This guide will explore how to manage network profiles on Linux Mint using Cinnamon Desktop, covering tools like Network Manager, nmcli, and third-party solutions.

## Understanding Network Profiles in Linux Mint

A network profile stores specific network configurations such as IP addresses, DNS settings, Wi-Fi credentials, and proxy configurations. These profiles allow seamless switching between different networks, making it easier to manage multiple connections without manually reconfiguring settings.

Cinnamon Desktop relies on **Network Manager**, a tool that handles all network connections, including Wi-Fi, Ethernet, VPN, and mobile broadband. Through the Network Manager GUI and CLI tools, you can create, edit, and manage network profiles efficiently.

---

## Managing Network Profiles via the GUI

### 1. **Accessing Network Manager**

Network Manager is integrated into the Cinnamon settings and can be accessed via:

- **System Tray**: Click on the network icon in the bottom-right corner of the screen.
- **System Settings**: Go to **Menu > Preferences > Network Connections**.

### 2. **Creating a New Network Profile**

To create a new network profile:

1. Open **Network Connections**.
2. Click on the `+` (Add) button.
3. Choose the type of connection (e.g., Wi-Fi, Ethernet, VPN).
4. Enter the necessary details, such as SSID (for Wi-Fi) or IP configurations.
5. Click **Save**.

### 3. **Editing Existing Profiles**

To modify a saved network profile:

1. Open **Network Connections**.
2. Select the network profile you want to edit.
3. Click **Edit** and adjust settings like IP addresses, DNS, or security credentials.
4. Click **Save** to apply changes.

### 4. **Switching Between Network Profiles**

To switch profiles:

- Click the network icon in the system tray.
- Select the preferred network from the list of available connections.
- If necessary, enter the password for a secured network.

---

## Managing Network Profiles via Terminal (nmcli)

For advanced users, `nmcli` (Network Manager Command Line Interface) provides a powerful way to manage network profiles from the terminal.

### 1. **Listing Available Network Profiles**

To see a list of saved network profiles, run:

```bash
nmcli connection show
```

This will display all saved connections along with their UUIDs and connection types.

### 2. **Creating a New Network Profile**

For an Ethernet connection with a static IP:

```bash
nmcli connection add type ethernet ifname eth0 con-name Office static ip4 192.168.1.100/24 gw4 192.168.1.1
```

For a Wi-Fi connection:

```bash
nmcli connection add type wifi ifname wlan0 con-name Home ssid MyWiFi
nmcli connection modify Home wifi-sec.key-mgmt wpa-psk wifi-sec.psk "mypassword"
```

### 3. **Editing an Existing Profile**

Modify an existing connection (e.g., changing the DNS server):

```bash
nmcli connection modify Home ipv4.dns "8.8.8.8,8.8.4.4"
```

### 4. **Switching Between Network Profiles**

To activate a specific network profile:

```bash
nmcli connection up Office
```

To deactivate:

```bash
nmcli connection down Home
```

### 5. **Deleting a Network Profile**

```bash
nmcli connection delete Home
```

---

## Using Third-Party Tools for Network Profile Management

While Network Manager and nmcli are robust solutions, additional tools can enhance network profile management:

### **1. TLP for Power-Efficient Networking**

[TLP](https://linrunner.de/tlp/) optimizes power management and network settings, particularly useful for laptops switching between battery and AC power.

Install TLP:

```bash
sudo apt install tlp tlp-rdw
```

### **2. Wicd (Alternative to Network Manager)**

[Wicd](https://wicd.sourceforge.io/) is a lightweight network manager alternative, but it lacks some advanced features of Network Manager.

```bash
sudo apt install wicd
```

---

## Automating Network Profile Switching

For users who frequently switch between home, office, or public networks, automation can be beneficial.

### **1. Using Network Manager Dispatcher Scripts**

Network Manager supports dispatcher scripts that run automatically when a network change occurs. You can create a script to adjust settings based on the active network.

1. Create a script:

```bash
sudo nano /etc/NetworkManager/dispatcher.d/99-autoswitch
```

2. Add the following script:

```bash
#!/bin/bash
INTERFACE=$1
STATUS=$2

if [ "$STATUS" == "up" ]; then
    case "$INTERFACE" in
        eth0)
            nmcli connection up Office
            ;;
        wlan0)
            nmcli connection up Home
            ;;
    esac
fi
```

3. Make it executable:

```bash
sudo chmod +x /etc/NetworkManager/dispatcher.d/99-autoswitch
```

This script will automatically switch to the appropriate network profile when the respective interface comes online.

---

## Troubleshooting Network Profiles

If you experience issues managing network profiles, try the following:

### **1. Restart Network Manager**

```bash
sudo systemctl restart NetworkManager
```

### **2. Check Network Logs**

```bash
journalctl -u NetworkManager --since "1 hour ago"
```

### **3. Reset Network Settings**

```bash
rm -rf ~/.config/network-manager/
```

Then reboot your system to regenerate network configurations.

---

## Conclusion

Managing network profiles on Linux Mint with Cinnamon Desktop is straightforward using **Network Manager**. Whether through the GUI or command line with `nmcli`, users can efficiently create, modify, and switch between network profiles. For automation, Network Manager dispatcher scripts can streamline network transitions. Additionally, third-party tools like TLP and Wicd offer further enhancements for power users.

By implementing these strategies, you can ensure seamless network management on Linux Mint, optimizing your workflow and connectivity across different environments. Happy networking!
