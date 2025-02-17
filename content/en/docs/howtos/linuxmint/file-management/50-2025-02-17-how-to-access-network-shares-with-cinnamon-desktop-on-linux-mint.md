---
draft: false
title: How to Access Network Shares with Cinnamon Desktop on Linux Mint
linkTitle: How to Access Network Shares
translationKey: how-to-access-network-shares-with-cinnamon-desktop-on-linux-mint
description: A guide to accessing network shares on Linux Mint with the Cinnamon desktop environment.
url: how-to-access-network-shares-with-cinnamon-desktop-on-linux-mint
weight: 50
date: 2025-02-17
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - network shares
featured_image: /images/linuxmint1.webp
---
Accessing network shares is essential for users who work in multi-device environments, allowing seamless file sharing between computers over a network. If you're using Linux Mint with the Cinnamon desktop environment, you have several ways to access network shares, whether from Windows, another Linux system, or a NAS (Network-Attached Storage). This guide will walk you through the various methods step-by-step to ensure you can access your shared files efficiently.

## Understanding Network Shares

Network shares allow computers to share files and folders over a local network. They are commonly based on:

- **SMB/CIFS (Server Message Block/Common Internet File System)** – Used by Windows and also supported by Linux.
- **NFS (Network File System)** – Primarily used in Unix/Linux environments.
- **FTP/SFTP (File Transfer Protocol/Secure File Transfer Protocol)** – Used for remote file access over networks.

For most Linux Mint users, **SMB/CIFS** is the preferred method when accessing shares from Windows-based systems or Samba servers.

---

## Method 1: Accessing Network Shares via File Manager

### Step 1: Open Nemo File Manager

Linux Mint's Cinnamon desktop environment uses **Nemo** as the default file manager. It includes built-in support for SMB and NFS network shares.

1. Open **Nemo** by clicking on the file manager icon in the taskbar or by pressing `Super + E`.
2. In the left panel, click on **Network**.
3. If network discovery is enabled, you should see shared devices and folders listed automatically.

### Step 2: Manually Connect to a Network Share

If your network share does not appear automatically:

1. In Nemo, click on the **File** menu and select **Connect to Server**.
2. In the "Server Address" field, enter the appropriate address:
   - For SMB/CIFS shares: `smb://<server-ip>/<share-name>` (e.g., `smb://192.168.1.10/shared_folder`)
   - For NFS shares: `nfs://<server-ip>/<share-path>`
3. Click **Connect**.
4. If prompted, enter your username and password for the network share.
5. Once connected, the shared folder will appear in Nemo, and you can access files as if they were on your local machine.

---

## Method 2: Mounting Network Shares Automatically

If you frequently use network shares, you may want to mount them permanently so they are available every time you boot your system.

### Step 1: Install Required Packages

Ensure that the required packages are installed:

```bash
sudo apt update
sudo apt install cifs-utils nfs-common
```

### Step 2: Create a Mount Point

Create a directory where the network share will be mounted:

```bash
sudo mkdir -p /mnt/network_share
```

### Step 3: Edit the fstab File for Persistent Mounting

Open the `/etc/fstab` file in a text editor:

```bash
sudo nano /etc/fstab
```

Add an entry for your network share:

For SMB/CIFS:

```bash
//192.168.1.10/shared_folder /mnt/network_share cifs credentials=/home/your_user/.smbcredentials,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0
```

For NFS:

```bash
192.168.1.10:/shared_folder /mnt/network_share nfs defaults 0 0
```

Save and exit (`Ctrl + X`, then `Y` and `Enter`).

### Step 4: Create a Credentials File (For SMB)

If your network share requires authentication, create a credentials file:

```bash
echo "username=your_user" > ~/.smbcredentials
echo "password=your_password" >> ~/.smbcredentials
chmod 600 ~/.smbcredentials
```

### Step 5: Mount the Network Share

Run the following command to apply the changes:

```bash
sudo mount -a
```

Now, the network share should be accessible at `/mnt/network_share` and will be automatically mounted on boot.

---

## Method 3: Accessing Shares via Command Line

For users who prefer the terminal, the `smbclient` and `mount` commands provide an alternative way to access network shares.

### Using `smbclient` (For Browsing SMB Shares)

To check available shared folders on a remote server:

```bash
smbclient -L //192.168.1.10 -U your_user
```

To connect to a share interactively:

```bash
smbclient //192.168.1.10/shared_folder -U your_user
```

### Using `mount` Command (For SMB/CIFS Shares)

To manually mount an SMB share:

```bash
sudo mount -t cifs //192.168.1.10/shared_folder /mnt/network_share -o username=your_user,password=your_password
```

To unmount:

```bash
sudo umount /mnt/network_share
```

---

## Troubleshooting Network Share Access

### Issue 1: Unable to See Network Shares in Nemo

- Ensure that **Samba and CIFS utilities** are installed:

  ```bash
  sudo apt install samba cifs-utils
  ```

- Restart the **Nemo** file manager:

  ```bash
  nemo -q
  ```

- Restart the **avahi-daemon** (for network discovery):

  ```bash
  sudo systemctl restart avahi-daemon
  ```

### Issue 2: Authentication Failure

- Ensure that your credentials are correct.
- If using SMB, try forcing SMB version 2 or 3:

  ```bash
  sudo mount -t cifs //192.168.1.10/shared_folder /mnt/network_share -o username=your_user,password=your_password,vers=3.0
  ```

### Issue 3: Slow Network Performance

- Check your network speed with:

  ```bash
  iperf3 -c <server-ip>
  ```

- Try using NFS instead of SMB if accessing a Linux server.

---

## Conclusion

Linux Mint's Cinnamon desktop provides multiple ways to access network shares, whether through the **Nemo** file manager, automatic mounts, or the command line. The method you choose depends on your workflow—whether you need quick access or a persistent setup. By following the steps outlined above, you should be able to connect to and manage network shares efficiently.

If you encounter any issues, checking permissions, authentication settings, and network configurations will often resolve the problem. With the right setup, accessing files across different systems can be as seamless as working with local folders!
