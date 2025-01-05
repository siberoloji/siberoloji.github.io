---
title: "Creating a Bootable USB: in Windows, Linux and macOS"
description: This guide will walk you through creating a bootable USB for each of these Linux, Windows, MacOS, providing you with the tools and knowledge to complete the task efficiently.
date: 2024-11-15
draft: false
tags:
  - bootable usb
  - boot usb
categories:
  - Linux
linkTitle: Creating a Bootable USB
type: blog
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 0
toc: true
keywords: ""
excludeSearch: false
sidebar:
  open: true
url: creating-bootable-usb-windows-linux-macos
---
Creating a bootable USB drive is an essential skill for anyone looking to install or repair operating systems on computers. Whether you're using Windows, Linux, or macOS, the process can vary slightly, but the underlying principles remain the same. This guide will walk you through creating a bootable USB for each of these operating systems, providing you with the tools and knowledge to complete the task efficiently.

## Understanding Bootable USB Drives

A **bootable USB drive** is a USB flash drive that contains an operating system installation file or utility that allows a computer to boot from it. This is particularly useful for installing operating systems, running live environments, or performing system recovery tasks. 

### Requirements

Before we delve into the specifics for each operating system, here are some common requirements:

- **USB Flash Drive**: At least 8GB for Windows and macOS installations; 16GB is recommended for Linux distributions.
- **ISO File**: The installation image of the operating system you wish to install.
- **Computer**: A working computer with a USB port and internet access to download necessary software.

## Creating a Bootable USB in Windows

Windows provides several methods to create a bootable USB drive. The most popular tools include the Media Creation Tool and Rufus.

### Method 1: Using Media Creation Tool

1. **Download the Media Creation Tool** from Microsoft’s official website.
2. **Insert your USB drive** into your computer.
3. Open the Media Creation Tool and accept the license terms.
4. Choose “Create installation media (USB flash drive, DVD, or ISO file) for another PC” and click Next.
5. Select your preferred language, edition, and architecture (64-bit or 32-bit).
6. Choose “USB flash drive” as the media to use and select your USB drive from the list.
7. Click Next, and the tool will download Windows files and create a bootable USB drive.

### Method 2: Using Rufus

Rufus is another popular option for creating bootable USB drives.

1. **Download Rufus** from its official website.
2. Insert your USB drive into your computer.
3. Open Rufus; it should automatically detect your USB drive.
4. Under “Boot selection,” click “Select” and choose your ISO file.
5. Ensure that the partition scheme is set correctly (MBR for BIOS or UEFI-CSM; GPT for UEFI).
6. Click Start and wait for Rufus to create your bootable USB.

## Creating a Bootable USB in Linux

Linux users can utilize various tools to create bootable USB drives, with UNetbootin and dd being among the most popular.

### Method 1: Using UNetbootin

1. **Install UNetbootin** via your package manager or download it from its website.
2. Insert your USB drive into your computer.
3. Launch UNetbootin.
4. Select “Diskimage” and browse to your ISO file.
5. Make sure “USB Drive” is selected as the type and choose your USB drive from the dropdown menu.
6. Click OK to start creating the bootable USB.

### Method 2: Using dd Command

For advanced users, the `dd` command offers a powerful way to create bootable drives.

1. Open a terminal window.
2. Identify your USB device using `lsblk` or `fdisk -l`.
3. Unmount the USB drive if it is mounted using `umount /dev/sdX` (replace `X` with your device letter).
4. Use the following command:

   ```bash
   sudo dd if=/path/to/your.iso of=/dev/sdX bs=4M status=progress
   ```

5. Wait for the process to complete; it may take several minutes.

> **Warning:** Be extremely careful with `dd`, as it can overwrite any disk without warning.

## Creating a Bootable USB in macOS

Creating a bootable USB on macOS can be done using Disk Utility or third-party applications like UNetbootin or WinDiskWriter.

### Method 1: Using Disk Utility

1. **Download the ISO file** of the operating system you want to install (e.g., Windows).
2. Insert your USB drive into your Mac.
3. Open **Disk Utility** (found in Applications > Utilities).
4. Select your USB drive from the list on the left and click “Erase.”
5. Format it as **ExFAT** or **MS-DOS (FAT)** depending on compatibility needs.
6. Once formatted, open Terminal and use:

   ```bash
   sudo dd if=/path/to/your.iso of=/dev/diskN bs=1m
   ```

   Replace `N` with your actual disk number (found in Disk Utility).

### Method 2: Using WinDiskWriter

For creating a Windows bootable USB on macOS:

1. Download **WinDiskWriter** from its official site.
2. Insert your USB drive into your Mac.
3. Open WinDiskWriter and select your Windows ISO file.
4. Choose your target USB device from the list.
5. Click “Start” to begin writing the ISO to the USB drive.

## Final Steps After Creation

Once you have created a bootable USB drive using any of these methods:

- Safely eject the USB drive from your computer.
- Insert it into the target machine where you wish to install or repair an operating system.
- Restart the machine and enter BIOS/UEFI settings (usually by pressing F2, F12, DEL, or ESC during startup).
- Set your machine to boot from the USB device first.

## Troubleshooting Tips

- If your computer does not recognize the bootable USB:
  - Ensure that you have selected the correct boot order in BIOS/UEFI settings.
  - Verify that you have created a proper bootable disk using one of the methods outlined above.

- If installation fails:
  - Check if the ISO file is corrupted by verifying its checksum against official sources.

## Conclusion

Creating a bootable USB drive is an invaluable skill that can save time and effort when installing or repairing operating systems across different platforms—Windows, Linux, and macOS alike. By following this guide, you should be able to successfully create a bootable USB regardless of which operating system you're working with.

With practice, this process will become second nature, allowing you to efficiently manage installations on multiple machines as needed. Whether you're preparing for a fresh install or troubleshooting an existing setup, having a reliable bootable USB at hand can make all the difference in ensuring smooth operations in today’s tech landscape.

Citations:

[1] <https://dev.to/techunrestricted/windiskwriter-creating-a-bootable-usb-with-windows-on-macos-4c30>

[2] <https://www.reddit.com/r/buildapc/comments/18xkoo8/trying_to_make_a_bootable_usb_for_windows_on_a/>

[3] <https://www.acronis.com/en-us/blog/posts/usb-boot/>

[4] <https://www.zdnet.com/article/how-to-create-a-bootable-linux-usb-drive/>

[5] <https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/interactively_installing_rhel_from_installation_media/assembly_creating-a-bootable-installation-medium_rhel-installer>

[6] <https://www.tecmint.com/linux-bootable-usb-creators/>

[7] <https://ubuntu.com/tutorials/create-a-usb-stick-on-macos>

[8] <https://www.youtube.com/watch?v=b7b-NREKTp4>