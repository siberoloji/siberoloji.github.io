---
draft: false
title: How to Set Up Network Storage with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Network Storage
translationKey: how-to-set-up-network-storage-with-cinnamon-desktop-on-linux-mint
description: Setting up network storage on Linux Mint with the Cinnamon desktop is an efficient way to share files across multiple devices, access data remotely, and improve collaboration
url: how-to-set-up-network-storage-with-cinnamon-desktop-on-linux-mint
weight: 120
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Nwtwork Storage
featured_image: /images/linuxmint1.webp
---
Setting up network storage on **Linux Mint with the Cinnamon desktop** is an efficient way to share files across multiple devices, access data remotely, and improve collaboration. Whether you want to connect to a **NAS (Network-Attached Storage)** device or simply share folders between Linux, Windows, or macOS systems, Cinnamon provides built-in tools to make the process seamless.  

In this guide, we’ll walk you through setting up network storage on Linux Mint using Samba, NFS, and SSHFS, covering both **connecting to network storage** and **sharing your own storage over the network**.  

---

## **1. Understanding Network Storage Options in Linux Mint**  

Before we begin, it’s important to understand the different ways you can set up network storage:  

- **Samba (SMB/CIFS):** Best for sharing files between Linux, Windows, and macOS systems.  
- **NFS (Network File System):** Ideal for Linux-to-Linux file sharing.  
- **SSHFS (SSH File System):** Secure option using SSH tunneling, best for remote access.  
- **FTP/WebDAV:** Alternative protocols for remote file access over the internet.  

---

## **2. Installing Necessary Packages for Network Storage**  

Linux Mint comes with built-in support for network sharing, but some services need to be installed manually.  

### **Install Samba for Windows and macOS Sharing**  

Samba allows your Linux system to communicate with Windows file shares:  

```bash
sudo apt update
sudo apt install samba smbclient cifs-utils
```

### **Install NFS for Linux-to-Linux File Sharing**  

For efficient sharing between Linux systems, install NFS support:  

```bash
sudo apt install nfs-common nfs-kernel-server
```

### **Install SSHFS for Secure Remote Storage**  

SSHFS allows you to mount remote directories securely over SSH:  

```bash
sudo apt install sshfs
```

---

## **3. Connecting to Network Storage on Linux Mint Cinnamon**  

### **A. Accessing Windows or macOS Shares via Samba (SMB/CIFS)**  

1. **Open the File Manager (Nemo)** and click on **Other Locations** in the sidebar.  
2. In the **Connect to Server** field, enter your Samba share address:  

   ```
   smb://[SERVER_IP]/[SHARE_NAME]
   ```

   Example:  

   ```
   smb://192.168.1.100/shared_folder
   ```

3. Click **Connect**, enter your username/password if prompted, and mount the share.  
4. If you want to mount the share permanently, create a mount point and edit **/etc/fstab**:  

   ```bash
   sudo mkdir /mnt/network_share
   echo "//192.168.1.100/shared_folder /mnt/network_share cifs username=user,password=pass,iocharset=utf8,sec=ntlm 0 0" | sudo tee -a /etc/fstab
   sudo mount -a
   ```

---

### **B. Connecting to NFS Shares (Linux to Linux)**  

1. Create a directory to mount the NFS share:  

   ```bash
   sudo mkdir /mnt/nfs_share
   ```

2. Mount the NFS share manually:  

   ```bash
   sudo mount -t nfs 192.168.1.200:/shared_folder /mnt/nfs_share
   ```

3. To make the mount permanent, add this line to **/etc/fstab**:  

   ```
   192.168.1.200:/shared_folder /mnt/nfs_share nfs defaults 0 0
   ```

4. Reload fstab:  

   ```bash
   sudo mount -a
   ```

---

### **C. Mounting Remote Storage Securely with SSHFS**  

1. Create a mount point:  

   ```bash
   mkdir ~/remote_storage
   ```

2. Mount the remote storage via SSH:  

   ```bash
   sshfs user@192.168.1.150:/remote_folder ~/remote_storage
   ```

3. To unmount:  

   ```bash
   fusermount -u ~/remote_storage
   ```

4. To auto-mount at boot, add this line to **/etc/fstab**:  

   ```
   user@192.168.1.150:/remote_folder /home/yourusername/remote_storage fuse.sshfs defaults 0 0
   ```

---

## **4. Setting Up Network Storage for Sharing on Linux Mint**  

### **A. Setting Up Samba to Share Folders**  

1. Open the terminal and edit the Samba configuration file:  

   ```bash
   sudo nano /etc/samba/smb.conf
   ```

2. Add a shared folder entry at the bottom:  

   ```
   [Shared]
   path = /home/yourusername/shared
   browseable = yes
   writable = yes
   read only = no
   guest ok = yes
   force user = yourusername
   ```

3. Create the shared folder:  

   ```bash
   mkdir ~/shared
   chmod 777 ~/shared
   ```

4. Restart Samba:  

   ```bash
   sudo systemctl restart smbd
   ```

5. Access the share from Windows by navigating to `\\192.168.1.100\Shared`.

---

### **B. Setting Up an NFS Server**  

1. Edit the NFS export file:  

   ```bash
   sudo nano /etc/exports
   ```

2. Add a share configuration:  

   ```
   /home/yourusername/shared 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
   ```

3. Apply changes and restart NFS:  

   ```bash
   sudo exportfs -ra
   sudo systemctl restart nfs-kernel-server
   ```

---

## **5. Troubleshooting Network Storage Issues**  

### **A. Checking Samba Services**  

If Samba isn’t working, restart the service and check its status:  

```bash
sudo systemctl restart smbd
sudo systemctl status smbd
```

### **B. Verifying Mount Points**  

If your storage isn’t mounting, run:  

```bash
df -h
mount | grep cifs
```

### **C. Debugging Permissions Issues**  

Ensure the correct permissions for shared folders:  

```bash
sudo chmod -R 777 /path/to/shared_folder
```

---

## **Conclusion**  

Setting up network storage on **Linux Mint with the Cinnamon desktop** allows seamless file sharing across different operating systems. Whether you use **Samba for Windows compatibility, NFS for Linux-to-Linux sharing, or SSHFS for secure remote access**, Linux Mint provides all the necessary tools to configure and manage network storage efficiently.  

By following this guide, you should now be able to connect to network storage, share your own files, and troubleshoot common issues. If you need additional features like cloud storage integration, consider using **Nextcloud or Syncthing** for more flexibility.  
