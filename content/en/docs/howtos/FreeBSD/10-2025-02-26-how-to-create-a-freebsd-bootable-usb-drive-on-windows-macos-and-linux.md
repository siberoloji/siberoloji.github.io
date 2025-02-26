---
draft: false
title: How to Create a FreeBSD Bootable USB Drive on Windows, macOS, and Linux
linkTitle: Create a FreeBSD Bootable USB Drive
translationKey: how-to-create-a-freebsd-bootable-usb-drive-on-windows-macos-and-linux
description: A step-by-step guide on how to create a bootable USB drive for FreeBSD on Windows, macOS, and Linux.
url: how-to-create-a-freebsd-bootable-usb-drive-on-windows-macos-and-linux
date: 
weight: 10
keywords:
  - FreeBSD
  - bootable USB
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
## **How to Create a FreeBSD Bootable USB Drive on Windows, macOS, and Linux**

Creating a FreeBSD bootable USB drive is essential for installing or testing the FreeBSD operating system. Whether you're using Windows, macOS, or Linux, this guide will walk you through the step-by-step process of creating a bootable USB drive for FreeBSD. By the end of this tutorial, you’ll be able to prepare a FreeBSD installation USB and boot it on your system.

---

### **Prerequisites**

Before proceeding, ensure you have the following:

- A USB drive (at least **4GB** recommended)
- FreeBSD **ISO image** (downloadable from the [official FreeBSD website](https://www.freebsd.org/))
- A tool to write the ISO to the USB drive (varies by OS)

---

## **Creating a FreeBSD Bootable USB on Windows**

Windows users can create a FreeBSD bootable USB drive using **Rufus** or **Win32 Disk Imager**.

### **Method 1: Using Rufus (Recommended)**

1. **Download Rufus**  
   Download and install [Rufus](https://rufus.ie/) on your Windows PC.

2. **Insert USB Drive**  
   Plug in your USB drive (ensure you back up any data, as it will be erased).

3. **Select the FreeBSD ISO**  
   - Open Rufus and select your USB drive under **Device**.
   - Click **Select** and choose the FreeBSD ISO file.

4. **Set Boot Parameters**  
   - **Partition scheme**: Choose **MBR** (for BIOS/UEFI) or **GPT** (for UEFI-only).
   - **File system**: Select **FAT32** (recommended for maximum compatibility).

5. **Create Bootable USB**  
   - Click **Start** and choose **Write in DD Image mode**.
   - Confirm when prompted.
   - Wait for the process to complete.

6. **Eject and Use**  
   - Click **Close** once finished.
   - Safely eject your USB drive.

---

### **Method 2: Using Win32 Disk Imager**

1. **Download and Install**  
   Install [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/).

2. **Insert USB Drive**  
   Connect the USB to your PC.

3. **Write FreeBSD ISO**  
   - Select the downloaded FreeBSD ISO.
   - Choose your USB drive.
   - Click **Write** to start the process.

4. **Eject USB**  
   Once the process completes, safely remove the USB.

---

## **Creating a FreeBSD Bootable USB on macOS**

macOS users can use the **Terminal** and the `dd` command.

### **Steps to Create a Bootable USB on macOS**

1. **Download FreeBSD ISO**  
   Save the FreeBSD image file to your Mac.

2. **Insert USB Drive**  
   Plug in the USB drive and check its identifier by running:

   ```sh
   diskutil list
   ```

   Look for `/dev/diskX` (where `X` is the number assigned to your USB).

3. **Unmount the USB**  

   ```sh
   diskutil unmountDisk /dev/diskX
   ```

4. **Write the FreeBSD Image**  
   Run the following command to write the ISO:

   ```sh
   sudo dd if=/path/to/freebsd.iso of=/dev/diskX bs=1m
   ```

   Replace `/path/to/freebsd.iso` with the actual path of your FreeBSD ISO.

5. **Wait for Completion**  
   - The process may take a few minutes.
   - You won’t see progress, but you can check by pressing `Ctrl+T`.

6. **Eject USB Drive**  
   Once done, remove the USB safely:

   ```sh
   diskutil eject /dev/diskX
   ```

---

## **Creating a FreeBSD Bootable USB on Linux**

Linux users can use the `dd` command or `Etcher`.

### **Method 1: Using the dd Command (Recommended)**

1. **Download FreeBSD ISO**  
   Ensure you have the FreeBSD ISO file downloaded.

2. **Identify USB Drive**  
   Insert the USB and run:

   ```sh
   lsblk
   ```

   Find the device name (e.g., `/dev/sdb`).

3. **Unmount USB Drive**  

   ```sh
   sudo umount /dev/sdb*
   ```

4. **Write FreeBSD ISO**  

   ```sh
   sudo dd if=/path/to/freebsd.iso of=/dev/sdb bs=4M status=progress
   ```

   Ensure `/dev/sdb` is correct.

5. **Sync and Eject**  

   ```sh
   sync
   sudo eject /dev/sdb
   ```

---

### **Method 2: Using Etcher**

1. **Download Etcher**  
   Install [Balena Etcher](https://www.balena.io/etcher/).

2. **Insert USB Drive**  
   Plug the USB into your computer.

3. **Select ISO and USB**  
   Open Etcher, choose your FreeBSD ISO, and select the USB drive.

4. **Flash and Validate**  
   Click **Flash** to start the process.

5. **Eject USB**  
   Once completed, remove the USB safely.

---

## **Booting from the FreeBSD Bootable USB**

Now that you have created a bootable USB, follow these steps to boot into FreeBSD:

1. **Restart Your Computer**  
   Insert the USB and restart the system.

2. **Enter BIOS/UEFI**  
   - Press **F2, F12, DEL, or ESC** (varies by manufacturer) during boot.

3. **Select Boot Device**  
   Navigate to **Boot Options** and choose your USB drive.

4. **Boot into FreeBSD Installer**  
   Once booted, follow the FreeBSD installation instructions.

---

## **Conclusion**

Creating a FreeBSD bootable USB drive is simple using different tools on Windows, macOS, and Linux. Whether using **Rufus, dd, Win32 Disk Imager, or Etcher**, you can quickly prepare a bootable drive and install FreeBSD on your system.

Would you like more tips on FreeBSD installation? Let me know in the comments! 🚀
