---
draft: true
title: How to Configure Network Discovery with Cinnamon Desktop on Linux Mint
linkTitle: Configure Network Discovery
translationKey: how-to-configure-network-discovery-with-cinnamon-desktop-on-linux-mint
description: 
url: how-to-configure-network-discovery-with-cinnamon-desktop-on-linux-mint
weight: 280
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
  - network discovery
featured_image: /images/linuxmint1.webp
---
Network discovery is an essential feature for users who want to share files, printers, and other resources over a local network. In Linux Mint with the Cinnamon desktop environment, configuring network discovery ensures seamless communication between devices. This guide will walk you through enabling and configuring network discovery on Linux Mint using Cinnamon.

## Why Enable Network Discovery?

Network discovery allows devices on the same network to detect each other, making it easier to share files and resources. This is particularly useful in home and office environments where multiple devices need to communicate without manual configuration.

## Prerequisites

Before proceeding with the configuration, ensure the following:

- You have Linux Mint installed with the Cinnamon desktop environment.
- You have administrative privileges (sudo access).
- Your system is connected to a network via Ethernet or Wi-Fi.
- Samba and necessary networking tools are installed.

## Step 1: Install Required Packages

Linux Mint generally comes with essential networking tools pre-installed. However, you may need to install Samba, which is crucial for network file sharing.

Open a terminal and run:

```bash
sudo apt update && sudo apt install samba smbclient gvfs-backends
```

These packages ensure that your system can discover and access shared folders on the network.

## Step 2: Enable and Start Samba Services

Once Samba is installed, enable and start its services:

```bash
sudo systemctl enable smbd
sudo systemctl start smbd
```

To check if the services are running, use:

```bash
systemctl status smbd
```

## Step 3: Configure Firewall Rules

If you have the firewall enabled, you must allow Samba traffic:

```bash
sudo ufw allow Samba
sudo ufw reload
```

To verify the firewall rules:

```bash
sudo ufw status
```

This ensures that your system can communicate over the network without restrictions.

## Step 4: Enable Network Discovery in Cinnamon

1. Open **File Manager (Nemo)**.
2. Click on **Other Locations** in the left sidebar.
3. If your network discovery settings are correct, you should see shared computers and devices listed.
4. If devices are not visible, proceed with further configurations.

## Step 5: Modify Samba Configuration File

Sometimes, manually tweaking the Samba configuration file is necessary.

1. Open the Samba configuration file:

   ```bash
   sudo nano /etc/samba/smb.conf
   ```

2. Locate the `[global]` section and add or modify the following lines:

   ```ini
   workgroup = WORKGROUP
   server string = Linux Mint Samba Server
   netbios name = linuxmint
   security = user
   interfaces = lo eth0 wlan0
   bind interfaces only = yes
   ```

3. Save the file (Ctrl + X, then Y, and Enter).
4. Restart Samba:

   ```bash
   sudo systemctl restart smbd
   ```

## Step 6: Enable and Configure Avahi (mDNS)

Linux Mint uses Avahi for mDNS (Multicast DNS) service discovery, which helps in detecting network devices.

1. Install Avahi if not already installed:

   ```bash
   sudo apt install avahi-daemon
   ```

2. Enable and start the Avahi service:

   ```bash
   sudo systemctl enable avahi-daemon
   sudo systemctl start avahi-daemon
   ```

3. Verify its status:

   ```bash
   systemctl status avahi-daemon
   ```

## Step 7: Configure User Permissions for Shared Folders

To share a specific folder, follow these steps:

1. Right-click on the folder you want to share.
2. Select **Properties** > **Sharing**.
3. Click **Share this folder** and set necessary permissions.
4. If prompted, install `nemo-share`:

   ```bash
   sudo apt install nemo-share
   ```

5. Restart Nemo for changes to take effect:

   ```bash
   nemo --quit
   ```

## Step 8: Access Network Shares from Another Device

To verify that network discovery is working, access your shared folders from another Linux, Windows, or macOS machine:

- **On Linux:** Open **File Manager**, click **Other Locations**, and look for your Linux Mint machine.
- **On Windows:** Open **File Explorer**, type `\\linuxmint` in the address bar, and press Enter.
- **On macOS:** Open **Finder**, click **Go** > **Connect to Server**, and enter `smb://linuxmint`.

## Step 9: Troubleshooting Common Issues

If network discovery is not working, try the following:

### 1. Check Network Connection

Ensure your device is on the same network. Run:

```bash
ip a
```

### 2. Restart Networking Services

```bash
sudo systemctl restart networking.service
sudo systemctl restart smbd nmbd avahi-daemon
```

### 3. Verify Samba Configuration

Run:

```bash
testparm
```

Fix any errors that appear.

### 4. Check Firewall Rules

If access is still restricted, try:

```bash
sudo ufw disable
```

If it works after disabling the firewall, re-enable it and adjust rules.

## Conclusion

Configuring network discovery on Linux Mint with the Cinnamon desktop enhances local networking capabilities, making file sharing and resource access easier. By following the steps outlined in this guide, you can successfully enable and troubleshoot network discovery, ensuring smooth connectivity across your devices.
