---
draft: false
title: How to Install FreeBSD Alongside Linux (e.g., Ubuntu) on FreeBSD Operating System
linkTitle: How to Install FreeBSD Alongside Linux (e.g., Ubuntu) on FreeBSD Operating System
translationKey: how-to-install-freebsd-alongside-linux-eg-ubuntu-on-freebsd-operating-system
description: How to Install FreeBSD Alongside Linux (e.g., Ubuntu) on FreeBSD Operating System
url: how-to-install-freebsd-alongside-linux-eg-ubuntu-on-freebsd-operating-system
date: 2025-03-05
weight: 160
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Installing FreeBSD alongside Linux, such as Ubuntu, in a dual-boot setup can be an excellent way to enjoy the benefits of both operating systems on a single machine. While FreeBSD offers powerful features like the ZFS file system and jails for virtualization, Linux distributions like Ubuntu provide extensive software repositories and community support. This guide will walk you through the step-by-step process of setting up a dual-boot system with FreeBSD and Ubuntu.

---

## Prerequisites

Before beginning the installation process, make sure you have the following:

1. **A computer with a FreeBSD installation** (or plan to install it)
2. **Ubuntu ISO** downloaded from the [official website](https://ubuntu.com/download)
3. **A bootable USB drive** (at least 8GB)
4. **A partitioning tool** (like GParted or FreeBSD’s built-in utilities)
5. **A backup of important data** (to prevent data loss in case of errors)
6. **Access to the FreeBSD bootloader**

---

## Step 1: Prepare Your FreeBSD System

### Check Disk Space

Before installing Ubuntu alongside FreeBSD, you need to check if there is enough space available for the new OS. You can check this using:

```sh
gpart show
```

Look for available unallocated space or consider resizing existing partitions.

### Resize FreeBSD Partition (If Needed)

If your FreeBSD installation takes up the entire disk, you’ll need to shrink it to make space for Ubuntu. You can do this with the following command:

```sh
gpart resize -i <partition_number> -s <new_size> ada0
```

*Replace `<partition_number>` with the correct partition number and `<new_size>` with the desired size.*

After resizing, create a new partition for Ubuntu using:

```sh
gpart add -t linux-data -s <size>G ada0
```

---

## Step 2: Create a Bootable USB Drive

To install Ubuntu, create a bootable USB using `dd` on FreeBSD:

```sh
dd if=/path/to/ubuntu.iso of=/dev/da0 bs=4M status=progress
```

*Replace `/dev/da0` with the correct USB device name.*

Alternatively, you can use a tool like `rufus` on Windows or `balenaEtcher` on macOS.

---

## Step 3: Boot Into Ubuntu Installer

1. Insert the bootable USB into your machine.
2. Restart your system and enter the BIOS/UEFI settings (usually by pressing `F2`, `F12`, or `DEL`).
3. Change the boot order to prioritize the USB drive.
4. Save changes and restart to boot into the Ubuntu installer.

---

## Step 4: Install Ubuntu Alongside FreeBSD

1. **Choose "Try Ubuntu" or "Install Ubuntu"**
   - If you want to test Ubuntu before installing, choose "Try Ubuntu."
   - Otherwise, proceed with "Install Ubuntu."

2. **Select "Something Else" in Installation Type**
   - The installer will show available partitions.
   - Locate the Linux partition you created earlier.
   - Select it and format it as `ext4`.
   - Choose a mount point (`/`).

3. **Set Up Swap (Optional)**
   - If you want a swap partition, create a small partition (equal to RAM size) and format it as `swap`.

4. **Install the Bootloader**
   - **Important:** Ubuntu uses GRUB by default, but you should avoid installing it over the FreeBSD bootloader.
   - Instead, install GRUB on the Ubuntu partition (e.g., `/dev/sdaX`).

5. **Complete the Installation**
   - Follow the on-screen instructions to finish the Ubuntu installation.
   - Restart when prompted.

---

## Step 5: Configure the FreeBSD Bootloader

By default, FreeBSD uses `boot0` or `beastie` bootloader, which does not recognize Ubuntu. You will need to manually configure the bootloader to detect Linux.

### Add Ubuntu to FreeBSD Bootloader

1. Edit the FreeBSD boot configuration file:

```sh
vi /boot/loader.conf
```

2. Add the following lines to detect Ubuntu:

```sh
beastie_disable="YES"
loader_logo="beastie"
```

3. Modify `/boot/boot0.cfg` or use `gpart` to set boot options:

```sh
gpart set -a active -i <ubuntu_partition_number> ada0
```

4. Reboot and test the setup:

```sh
shutdown -r now
```

When you restart, you should see both FreeBSD and Ubuntu as boot options.

---

## Step 6: Configure GRUB (If Needed)

If you want GRUB to handle booting FreeBSD instead of the FreeBSD bootloader, follow these steps:

1. Boot into Ubuntu and open a terminal.
2. Update GRUB to detect FreeBSD:

```sh
sudo update-grub
```

3. Restart your system and ensure that FreeBSD appears in the GRUB menu.

---

## Conclusion

Setting up a dual-boot system with FreeBSD and Ubuntu allows you to take advantage of both operating systems’ strengths. By carefully partitioning your disk, installing Ubuntu without overwriting the FreeBSD bootloader, and configuring boot options properly, you can switch between the two systems seamlessly. Whether you prefer the robust stability of FreeBSD or the vast software ecosystem of Ubuntu, this setup offers the best of both worlds.

By following these steps, you now have a fully functional dual-boot system. Enjoy your FreeBSD and Linux experience!
