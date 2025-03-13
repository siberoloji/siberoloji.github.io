---
draft: true
title: How to Mount and Unmount Drives with Cinnamon Desktop on Linux Mint
linkTitle: How to Mount and Unmount Drives
translationKey: how-to-mount-and-unmount-drives-with-cinnamon-desktop-on-linux-mint
description: Learn how to mount and unmount drives in Linux Mint with Cinnamon, a popular Linux desktop environment.
url: how-to-mount-and-unmount-drives-with-cinnamon-desktop-on-linux-mint
weight: 40
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
  - mounting drives
  - unmounting drives
featured_image: /images/linuxmint1.webp
---
Linux Mint is one of the most popular Linux distributions, known for its user-friendly interface and stability. Among its various editions, the Cinnamon desktop environment stands out for its elegance, ease of use, and efficiency. One of the common tasks users need to perform is mounting and unmounting drives, whether they are USB flash drives, external hard drives, or additional internal storage.

This guide will walk you through the process of mounting and unmounting drives in Linux Mint using the Cinnamon desktop environment. We will cover both GUI and command-line methods to ensure you have multiple ways to manage your storage devices effectively.

---

## **Understanding Drive Mounting and Unmounting**

Before diving into the steps, let's clarify what mounting and unmounting mean in Linux:

- **Mounting**: When you connect a storage device to your system, it needs to be attached to a directory in the filesystem so that you can access its contents. This process is called mounting.
- **Unmounting**: Before removing a storage device, you need to safely detach it from the filesystem to prevent data loss or corruption. This is known as unmounting.

Now, let’s explore how to perform these actions in Linux Mint Cinnamon.

---

## **Mounting Drives Using the Graphical User Interface (GUI)**

Cinnamon provides an intuitive graphical interface to handle drive mounting easily.

### **Automatically Mounted Drives**

By default, Linux Mint automatically mounts removable media such as USB drives and external hard disks when connected. You will typically find these drives in **File Manager (Nemo)** under the **Devices** section on the left panel.

1. **Connect Your Drive**: Insert your USB drive or plug in your external hard disk.
2. **Open File Manager (Nemo)**: Press `Super` (Windows key) and search for **Files**, or click on the **Files** icon from the panel.
3. **Locate the Drive**: The new drive should appear under **Devices** in the left sidebar.
4. **Access the Drive**: Click on the drive name, and it will automatically mount, allowing you to browse its contents.

### **Manually Mounting a Drive in Cinnamon**

If a drive is not automatically mounted, you can manually do so:

1. **Open File Manager (Nemo)**.
2. **Find the Unmounted Drive**: If a drive appears grayed out under **Devices**, it means it is not yet mounted.
3. **Click on the Drive**: Simply clicking on the drive will trigger Cinnamon to mount it and make it accessible.

For external or additional internal drives, you may want to configure automatic mounting, which we will discuss later.

---

## **Unmounting Drives Using the GUI**

Before removing a drive, always unmount it properly to avoid data corruption.

1. **Open File Manager (Nemo)**.
2. **Locate the Drive** under **Devices**.
3. **Right-click on the Drive** and select **Eject** or **Unmount**.
4. **Wait for Confirmation**: Cinnamon will notify you when it is safe to remove the device.

Alternatively, you can click the small eject icon next to the drive’s name in Nemo.

---

## **Mounting and Unmounting Drives Using the Terminal**

For those who prefer command-line operations, mounting and unmounting drives via the terminal offers more control and flexibility.

### **Checking Available Drives**

To see a list of connected storage devices, open a terminal (`Ctrl + Alt + T`) and run:

```bash
lsblk
```

This will display a list of drives and partitions. Identify the one you want to mount, such as `/dev/sdb1`.

### **Manually Mounting a Drive**

1. **Create a Mount Point** (if not already available):

   ```bash
   sudo mkdir -p /mnt/mydrive
   ```

2. **Mount the Drive**:

   ```bash
   sudo mount /dev/sdb1 /mnt/mydrive
   ```

3. **Verify the Mount**:

   ```bash
   df -h
   ```

You should see `/dev/sdb1` listed and mounted under `/mnt/mydrive`.

### **Unmounting a Drive via Terminal**

Before physically removing the drive, unmount it with:

```bash
sudo umount /mnt/mydrive
```

or using the device path:

```bash
sudo umount /dev/sdb1
```

To ensure it's unmounted, check:

```bash
lsblk
```

If the device is no longer listed as mounted, it is safe to remove.

---

## **Enabling Automatic Mounting for External Drives**

If you frequently use an external drive, you might want it to mount automatically. You can achieve this using the `disks` utility.

1. **Open Disks**: Search for **Disks** in the application menu.
2. **Select the Drive**: Choose the external drive from the left panel.
3. **Click on the Gear Icon** below the volume and select **Edit Mount Options**.
4. **Enable Automatic Mounting**: Toggle **Mount at startup** and ensure the appropriate settings are selected.
5. **Click OK** and restart your system to test the automatic mounting.

Alternatively, you can add an entry to `/etc/fstab` for persistent automatic mounting.

---

## **Troubleshooting Common Issues**

### **Drive Not Appearing in File Manager**

- Run `lsblk` or `fdisk -l` to check if the system detects the drive.
- Try mounting it manually using the `mount` command.

### **Unmounting Error: Device is Busy**

- If you see an error stating "target is busy," check what is using the drive:

  ```bash
  lsof +D /mnt/mydrive
  ```
  
  Kill the processes using the drive before unmounting:
  
  ```bash
  sudo fuser -km /mnt/mydrive
  sudo umount /mnt/mydrive
  ```

### **File System Issues**

- If a drive fails to mount, it may have filesystem errors. Check and repair it with:
  
  ```bash
  sudo fsck -y /dev/sdb1
  ```

---

## **Conclusion**

Mounting and unmounting drives in Linux Mint with Cinnamon is a straightforward process, whether using the graphical interface or the command line. The GUI method in **File Manager (Nemo)** is convenient for everyday use, while the terminal method provides flexibility for advanced users. Understanding these concepts ensures safe and efficient management of external and internal storage devices on your Linux system.

By following these steps, you can confidently handle drive mounting and unmounting, ensuring your data remains accessible and protected. If you encounter any issues, Linux Mint’s active community forums are a great place to seek further assistance.
