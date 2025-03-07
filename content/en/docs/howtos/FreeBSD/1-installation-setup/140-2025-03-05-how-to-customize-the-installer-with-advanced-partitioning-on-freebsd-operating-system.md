---
draft: false
title: How to Customize the Installer with Advanced Partitioning
linkTitle: How to Customize the Installer with Advanced Partitioning
translationKey: how-to-customize-the-installer-with-advanced-partitioning
description: This article provides a step-by-step guide on how to customize the FreeBSD installer with advanced partitioning options
url: how-to-customize-the-installer-with-advanced-partitioning-on-freebsd
date: 2025-03-05
weight: 140
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful, open-source operating system known for its performance, security, and advanced networking features. One of the crucial steps in setting up FreeBSD is partitioning your storage device. By default, FreeBSD's installer provides a guided partitioning method, but for users who require more control over their system's storage layout, advanced partitioning is essential. This guide will walk you through customizing the FreeBSD installer with advanced partitioning options to optimize your system.

## Understanding FreeBSD Partitioning

Before diving into the installation process, it's important to understand how FreeBSD handles partitions. Unlike Linux, which primarily uses GUID Partition Table (GPT) or Master Boot Record (MBR), FreeBSD employs its own partitioning scheme, often within GPT.

### Partitioning Schemes in FreeBSD

1. **MBR (Master Boot Record)** – An older partitioning scheme limited to four primary partitions.
2. **GPT (GUID Partition Table)** – A modern partitioning scheme supporting multiple partitions and large disk sizes.
3. **BSD Labels (Disk Slices)** – FreeBSD organizes partitions inside slices using labels (e.g., ada0s1a, ada0s1b).

FreeBSD recommends using GPT due to its flexibility and support for advanced features such as UEFI booting.

## Customizing the Installer with Advanced Partitioning

### Step 1: Booting into the FreeBSD Installer

To begin the installation process:

1. Download the latest FreeBSD ISO from the [official website](https://www.freebsd.org/).
2. Create a bootable USB using tools like `dd`, `Rufus`, or `balenaEtcher`.
3. Boot your machine from the USB and select **Install FreeBSD**.

### Step 2: Choosing Manual Partitioning

After selecting your keyboard layout and hostname, the installer will prompt you to choose a partitioning method:

- **Auto (UFS)** – Automatically sets up partitions using UFS.
- **Auto (ZFS)** – Sets up partitions with ZFS.
- **Manual** – Allows full control over partitioning.

Select **Manual** to proceed with advanced partitioning.

### Step 3: Selecting the Disk

The next screen will list all available disks (e.g., `ada0`, `da0`). Choose the disk you want to install FreeBSD on.

### Step 4: Creating the Partition Table

If the disk is new or needs reformatting, select **Create a Partition Scheme**. Choose **GPT** unless you specifically need MBR.

### Step 5: Adding Partitions

Now you will manually create the necessary partitions. Below is a recommended setup:

| Mount Point | Partition Type | Size | Description |
|------------|--------------|------|-------------|
| `/`        | FreeBSD UFS  | 10G  | Root filesystem |
| `swap`     | FreeBSD Swap | 4G   | Swap space |
| `/var`     | FreeBSD UFS  | 10G  | System logs & temporary files |
| `/usr`     | FreeBSD UFS  | 50G  | User applications |
| `/home`    | FreeBSD UFS  | Remainder | User files |

#### Adding Partitions via the Installer

1. **Select Create** and choose the partition type.
2. **Set the size** of the partition.
3. **Specify the mount point** (e.g., `/`, `/usr`, `/var`).
4. **Repeat** the process for each required partition.

For swap space, select **FreeBSD Swap** as the type. The recommended size is 2x the system RAM, but it can be adjusted based on workload requirements.

### Step 6: Configuring File System Options

FreeBSD supports different file systems:

- **UFS (Unix File System)** – The default and most commonly used file system.
- **ZFS (Zettabyte File System)** – Ideal for servers and storage-intensive workloads.

For most users, UFS is a solid choice, but if you want ZFS features like snapshots and data integrity checks, select ZFS during setup.

### Step 7: Reviewing and Committing Changes

Once all partitions are created, review the configuration and select **Finish**. The installer will format the partitions and proceed with copying system files.

## Post-Installation Configurations

After installation is complete, FreeBSD will prompt for additional configurations:

1. **Set the root password** – Choose a strong password.
2. **Configure networking** – Set up a wired or wireless connection.
3. **Enable system services** – Choose services like SSH and NTP.
4. **Create a user account** – Add a non-root user for daily operations.

Once configuration is complete, reboot the system and remove the installation media.

## Verifying Partition Layout

After booting into your new FreeBSD system, verify the partition setup using:

```sh
gpart show
```

This command displays the partition table and confirms that the layout matches your manual configuration.

To check disk usage:

```sh
df -h
```

This provides an overview of mounted partitions and available space.

## Optimizing Your FreeBSD Installation

### 1. Enabling Soft Updates for UFS

Soft Updates improve performance and crash recovery for UFS:

```sh
tunefs -n enable /dev/ada0p2
```

### 2. Setting Up Periodic TRIM (For SSDs)

If you’re using an SSD, enable TRIM for longevity:

```sh
echo 'vfs.zfs.trim_enable=1' >> /etc/sysctl.conf
```

### 3. Automating Swap Management

To enable swap encryption and automatic resizing, edit `/etc/rc.conf`:

```sh
swapfile="/swapfile"
swapfile_size="4G"
```

## Conclusion

Advanced partitioning on FreeBSD allows for greater flexibility and optimization, catering to specific use cases such as server setups, development environments, or security-focused installations. By understanding FreeBSD’s partitioning scheme and using manual partitioning during installation, you gain complete control over disk layout, performance, and file system choices. Whether setting up a personal workstation or a high-performance server, mastering partitioning is a key step in leveraging FreeBSD’s full potential.
