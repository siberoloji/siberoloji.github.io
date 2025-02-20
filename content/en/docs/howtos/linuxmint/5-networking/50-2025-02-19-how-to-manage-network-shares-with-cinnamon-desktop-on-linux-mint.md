---
draft: false
title: How to Manage Network Shares with Cinnamon Desktop on Linux Mint
linkTitle: Network Shares
translationKey: how-to-manage-network-shares-with-cinnamon-desktop-on-linux-mint
description: Learn how to manage network shares with the Cinnamon desktop on Linux Mint. Access shared folders, mount Samba shares, set up a Samba server, use NFS for Linux-to-Linux sharing, and troubleshoot common issues.
url: how-to-manage-network-shares-with-cinnamon-desktop-on-linux-mint
weight: 50
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
  - Network Shares
  - Cinnamon Desktop
  - Samba
  - NFS
  - SSHFS
  - File Sharing
  - Nemo
  - Mount Samba Shares
  - Samba Server
  - NFS Server
featured_image: /images/linuxmint1.webp
---
Linux Mint is a popular, user-friendly Linux distribution that offers a polished desktop experience. The Cinnamon desktop environment, which is the default for Linux Mint, provides a smooth interface for managing network shares, making file sharing easy across multiple devices.  

If you're looking to set up and manage network shares efficiently on Linux Mint with Cinnamon, this guide will take you through everything you need to know, from connecting to shared folders to setting up your own network shares.  

---

## **1. Understanding Network Shares in Linux Mint**  

Network shares allow users to access and share files across different systems in a network. The most common protocols used for network sharing in Linux Mint are:  

- **Samba (SMB/CIFS)** – Primarily used for sharing files with Windows and Linux machines.  
- **NFS (Network File System)** – Ideal for sharing files between Linux-based systems.  
- **SSHFS (SSH File System)** – A secure way to access remote files via SSH.  

The Cinnamon desktop provides tools that simplify accessing and managing network shares, but some configurations may require additional steps.  

---

## **2. Accessing Network Shares in Cinnamon File Manager**  

Cinnamon uses **Nemo**, its default file manager, which comes with built-in network browsing capabilities. Here's how you can access a shared folder on a network:  

### **Step 1: Open Nemo and Browse Network**  

1. Open **Nemo** (File Manager).  
2. In the left sidebar, click on **"Network"**.  
3. Wait a few moments while the system detects available network devices.  

### **Step 2: Connect to a Shared Folder**  

1. Double-click on the networked computer or device.  
2. If required, enter your username and password.  
3. Choose to remember the password for the session or permanently.  
4. Click **Connect**, and the shared folder will open.  

💡 **Tip:** If you know the network share path (e.g., `smb://192.168.1.100/shared-folder`), you can enter it directly in Nemo’s address bar.  

---

## **3. Mounting Samba (SMB) Shares in Linux Mint**  

Samba is the go-to solution for sharing files between Linux and Windows machines.  

### **Step 1: Install Samba and CIFS Utilities**  

If Samba is not installed, install it by running:  

```bash
sudo apt update
sudo apt install samba smbclient cifs-utils
```

### **Step 2: Mount a Samba Share Temporarily**  

You can mount a shared folder manually using the `mount` command:  

```bash
sudo mount -t cifs -o username=yourusername,password=yourpassword //192.168.1.100/shared-folder /mnt/shared
```

Replace `yourusername` and `yourpassword` with your network credentials, and ensure `/mnt/shared` exists (`sudo mkdir -p /mnt/shared`).  

### **Step 3: Auto-Mount Samba Share on Boot**  

To mount a Samba share at boot, edit the `/etc/fstab` file:  

```bash
sudo nano /etc/fstab
```

Add this line at the bottom:  

```bash
//192.168.1.100/shared-folder /mnt/shared cifs username=yourusername,password=yourpassword,iocharset=utf8,sec=ntlm 0 0
```

Save (`Ctrl + X`, then `Y`, then `Enter`) and apply changes:  

```bash
sudo mount -a
```

💡 **Tip:** To store credentials securely, create a `/etc/samba/credentials` file and reference it in `/etc/fstab`.  

---

## **4. Sharing Folders Over the Network (Samba Server Setup)**  

If you want to share a folder from your Linux Mint system, follow these steps:  

### **Step 1: Install Samba Server**  

If not installed, set it up with:  

```bash
sudo apt install samba
```

### **Step 2: Configure Samba Sharing**  

1. Open **Nemo** and right-click on the folder you want to share.  
2. Select **Properties > Share** tab.  
3. Check **"Share this folder"** and name your share.  
4. Enable **"Allow others to create and delete files"** if needed.  
5. Click **"Modify Share"**, and when prompted, install `libnss-winbind`.  

Alternatively, you can edit the Samba configuration manually:  

```bash
sudo nano /etc/samba/smb.conf
```

Add:  

```ini
[SharedFolder]
   path = /home/yourusername/SharedFolder
   read only = no
   browsable = yes
   guest ok = yes
```

Save and restart Samba:  

```bash
sudo systemctl restart smbd
```

### **Step 3: Create a Samba User**  

Run:  

```bash
sudo smbpasswd -a yourusername
```

Now, your folder is accessible via `smb://your-mint-pc/SharedFolder`.  

---

## **5. Using NFS for Linux-to-Linux Sharing**  

If you are sharing files between Linux systems, NFS is a great alternative.  

### **Step 1: Install NFS Server**  

On the server (Linux Mint sharing files):  

```bash
sudo apt install nfs-kernel-server
```

Create a shared directory and set permissions:  

```bash
sudo mkdir -p /mnt/nfs-share
sudo chmod 777 /mnt/nfs-share
```

Edit the exports file:  

```bash
sudo nano /etc/exports
```

Add:  

```ini
/mnt/nfs-share 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
```

Apply changes:  

```bash
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```

### **Step 2: Mount NFS Share on Client**  

On the client machine:  

```bash
sudo apt install nfs-common
sudo mount 192.168.1.100:/mnt/nfs-share /mnt/nfs-client
```

For auto-mounting, add this to `/etc/fstab`:  

```ini
192.168.1.100:/mnt/nfs-share /mnt/nfs-client nfs defaults 0 0
```

---

## **6. Troubleshooting Network Shares in Cinnamon**  

If you experience issues, try these solutions:  

### **Network Share Not Showing?**  

- Ensure the share is active:  

  ```bash
  sudo systemctl status smbd
  ```

- Check firewall settings:  

  ```bash
  sudo ufw allow Samba
  ```

### **Permission Errors?**  

- Verify user access:  

  ```bash
  ls -ld /mnt/shared-folder
  ```

- Adjust permissions:  

  ```bash
  sudo chmod -R 777 /mnt/shared-folder
  ```

### **Auto-Mount Not Working?**  

- Ensure `mount -a` runs without errors.  
- Check `/etc/fstab` syntax with:  

  ```bash
  sudo mount -a
  ```

---

## **Conclusion**  

Managing network shares on Linux Mint with Cinnamon is straightforward with the right tools. Whether you're accessing Windows SMB shares, sharing files via Samba, or using NFS for Linux-to-Linux connections, Linux Mint provides a seamless experience.  

By setting up auto-mounting and troubleshooting common issues, you ensure a smooth file-sharing environment for personal or professional use. Happy sharing! 🚀  

---

Let me know if you need additional details! 😊
