---
draft: false
title: How to Configure File Sharing with Cinnamon Desktop on Linux Mint
linkTitle: How to Configure File Sharing
translationKey: how-to-configure-file-sharing-with-cinnamon-desktop-on-linux-mint
description: Learn how to configure file sharing on Linux Mint Cinnamon using Samba, NFS, and SSH for seamless file transfers across different devices on your network.
url: how-to-configure-file-sharing-with-cinnamon-desktop-on-linux-mint
weight: 200
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
  - file sharing
featured_image: /images/linuxmint1.webp
---

Linux Mint, particularly with the Cinnamon desktop environment, offers a user-friendly experience with powerful customization and system management options. One essential feature is **file sharing**, allowing users to transfer files between different computers within the same network easily. Whether you're sharing files between Linux machines, with Windows, or even with macOS, Cinnamon provides various ways to configure this.  

In this guide, we'll go through different methods to set up and configure file sharing on Linux Mint Cinnamon, ensuring a smooth and secure experience.

---

## **1. Understanding File Sharing on Linux Mint**  

Before diving into the configuration, it's important to understand the basic file-sharing protocols supported by Linux Mint:  

- **Samba (SMB/CIFS)** – Best for sharing files with Windows and macOS.  
- **NFS (Network File System)** – Ideal for Linux-to-Linux file sharing.  
- **SSH (Secure Shell)** – Secure method for accessing files remotely.  

Among these, **Samba** is the most commonly used option because it provides cross-platform compatibility.

---

## **2. Installing Samba for File Sharing**  

By default, Linux Mint does not come with Samba pre-installed. To set it up, follow these steps:

### **Step 1: Install Samba**  

Open the terminal and enter the following command:  

```bash
sudo apt update && sudo apt install samba
```

Once installed, you can verify the version using:  

```bash
smbd --version
```

---

## **3. Configuring Samba for File Sharing**  

### **Step 1: Create a Shared Directory**  

Choose a folder to share or create a new one:  

```bash
mkdir ~/PublicShare
chmod 777 ~/PublicShare
```

The `chmod 777` command ensures that all users on the system can access the folder.

### **Step 2: Edit Samba Configuration**  

Samba's settings are stored in `/etc/samba/smb.conf`. To modify them:  

```bash
sudo nano /etc/samba/smb.conf
```

Scroll to the bottom of the file and add the following configuration:

```
[PublicShare]
   path = /home/yourusername/PublicShare
   browseable = yes
   writable = yes
   guest ok = yes
   read only = no
```

Replace `yourusername` with your actual Linux Mint username. Save the file (`CTRL + X`, then `Y`, then `Enter`).

### **Step 3: Restart Samba**  

For the changes to take effect, restart the Samba service:  

```bash
sudo systemctl restart smbd
sudo systemctl restart nmbd
```

---

## **4. Setting Up Samba User Permissions**  

If you want to restrict access, you can create a Samba user:

```bash
sudo smbpasswd -a yourusername
```

After setting the password, ensure that your user has access by modifying the Samba config:

```
   valid users = yourusername
```

Restart Samba again:

```bash
sudo systemctl restart smbd
```

---

## **5. Accessing Shared Files from Another Computer**  

Once Samba is configured, you can access shared files from other computers:

- **From another Linux machine:**  
  Open **Files Manager** and enter `smb://your-linux-mint-ip/PublicShare` in the address bar.

- **From a Windows computer:**  
  Press `Win + R`, type `\\your-linux-mint-ip\PublicShare`, and press Enter.

- **From macOS:**  
  Open Finder and click **Go > Connect to Server**, then enter `smb://your-linux-mint-ip/PublicShare`.

To find your Linux Mint IP address, run:

```bash
ip a | grep inet
```

---

## **6. Configuring Firewall for Samba**  

If you are unable to access shared folders, your firewall might be blocking Samba. Allow it through the firewall:

```bash
sudo ufw allow samba
```

Then check the firewall status:

```bash
sudo ufw status
```

If necessary, enable the firewall:

```bash
sudo ufw enable
```

---

## **7. Alternative Method: NFS for Linux-to-Linux Sharing**  

For Linux-only file sharing, NFS can be a better option:

### **Step 1: Install NFS**

```bash
sudo apt install nfs-kernel-server
```

### **Step 2: Configure NFS**

Edit the NFS export file:

```bash
sudo nano /etc/exports
```

Add the following line:

```
/home/yourusername/PublicShare 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
```

Then restart NFS:

```bash
sudo systemctl restart nfs-kernel-server
```

On the client machine, mount the NFS share:

```bash
sudo mount your-linux-mint-ip:/home/yourusername/PublicShare /mnt
```

---

## **8. Secure File Sharing with SSH (SFTP)**  

If security is a priority, SSH file sharing is an excellent choice.

### **Step 1: Install OpenSSH Server**

```bash
sudo apt install openssh-server
```

### **Step 2: Enable and Start the Service**

```bash
sudo systemctl enable ssh
sudo systemctl start ssh
```

### **Step 3: Transfer Files Using SFTP**

On a client machine, use:

```bash
sftp yourusername@your-linux-mint-ip
```

For GUI users, tools like **FileZilla** or **WinSCP** can simplify SFTP file transfers.

---

## **9. Troubleshooting Common Issues**  

If file sharing doesn’t work, check:

- **Samba Service Status:**  

  ```bash
  sudo systemctl status smbd
  ```

- **Firewall Rules:**  

  ```bash
  sudo ufw status
  ```

- **Check Shared Folder Permissions:**  

  ```bash
  ls -ld /home/yourusername/PublicShare
  ```

---

## **10. Conclusion**  

Configuring file sharing on Linux Mint Cinnamon is straightforward, whether you're using **Samba, NFS, or SSH**. For Windows compatibility, **Samba is the best choice**, while **NFS is ideal for Linux-to-Linux sharing**. If security is a concern, **SSH/SFTP is recommended**.

By following the steps outlined above, you should be able to share files seamlessly across different devices on your network.
