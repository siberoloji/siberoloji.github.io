---
draft: false
title: How to Set Up a Swap Partition or File on FreeBSD
linkTitle: How to Set Up a Swap Partition or File
translationKey: how-to-set-up-a-swap-partition-or-file
description: How to set up a swap partition or file on FreeBSD
url: how-to-set-up-a-swap-partition-or-file
date: 2025-03-14
weight: 140
keywords:
  - FreeBSD
  - swap
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Swap space plays a critical role in system performance by providing virtual memory when the physical RAM is exhausted. In FreeBSD, swap space can be configured as either a dedicated partition or a swap file. This guide will walk you through setting up both methods, explaining their advantages and best practices.

## Understanding Swap Space in FreeBSD

Swap space is used as an overflow when the system’s RAM is full. It allows processes to continue running by temporarily moving less frequently used data from RAM to disk. However, swap is significantly slower than RAM, so it should only be used as a backup rather than a primary memory resource.

By default, FreeBSD configures swap space during installation, but you may need to add or adjust swap later. The two main ways to configure swap in FreeBSD are:

1. **Swap Partition** – A dedicated partition on a disk
2. **Swap File** – A file within an existing filesystem that acts as swap

Each approach has its pros and cons:

- A **swap partition** offers better performance and reliability but requires dedicated disk space.
- A **swap file** is more flexible, as it can be resized or removed as needed without modifying disk partitions.

Let’s go through the steps to configure both methods.

## Setting Up a Swap Partition

### 1. Check Existing Swap Space

Before adding swap, check the currently available swap space:

```sh
swapinfo -h
```

Or use:

```sh
gstat
```

If you need additional swap space, follow these steps to add a swap partition.

### 2. Identify Available Disk Space

List available disks and partitions using:

```sh
gpart show
```

Identify an unused partition or free space where you can create a new swap partition.

### 3. Create a Swap Partition

If you have free space, create a new swap partition using `gpart` (replace `ada0` with your disk name):

```sh
gpart add -t freebsd-swap -s 4G ada0
```

This creates a 4GB swap partition on `ada0`.

### 4. Enable the Swap Partition

Activate the swap partition with:

```sh
swapon /dev/ada0p2
```

Replace `ada0p2` with your actual swap partition name.

### 5. Make Swap Persistent Across Reboots

To ensure the swap partition is enabled on reboot, add an entry to `/etc/fstab`:

```sh
echo "/dev/ada0p2 none swap sw 0 0" >> /etc/fstab
```

## Setting Up a Swap File

A swap file is useful when you need extra swap space but cannot modify partitions.

### 1. Create a Swap File

Choose a location for the swap file, such as `/usr/swapfile`, and create it:

```sh
dd if=/dev/zero of=/usr/swapfile bs=1M count=4096
```

This command creates a 4GB swap file.

### 2. Set Correct Permissions

Ensure only root can access the swap file:

```sh
chmod 600 /usr/swapfile
```

### 3. Configure the Swap File

Format the file for use as swap:

```sh
mdconfig -a -t vnode -f /usr/swapfile -u 0
mkswap /dev/md0
```

Activate it:

```sh
swapon /dev/md0
```

### 4. Make the Swap File Persistent

To automatically enable the swap file on reboot, add the following line to `/etc/rc.conf`:

```sh
swapfile="/usr/swapfile"
```

Alternatively, add this entry to `/etc/fstab`:

```sh
/usr/swapfile none swap sw,file 0 0
```

## Managing and Monitoring Swap Usage

Once your swap space is configured, you can monitor its usage with:

```sh
swapinfo -h
```

Or use:

```sh
top
```

To deactivate swap, use:

```sh
swapoff /dev/md0  # For swap file
swapoff /dev/ada0p2  # For swap partition
```

To remove a swap file permanently:

```sh
rm /usr/swapfile
```

## Best Practices for Swap Configuration

- **Prefer swap partitions** for better performance on systems with predictable workloads.
- **Use swap files** for flexibility on systems where disk partitioning is constrained.
- **Avoid excessive swap usage** as it can degrade performance; add more RAM if swapping is frequent.
- **Ensure adequate swap space**—a common rule is 1.5x to 2x RAM, but modern systems may require less.

## Conclusion

Setting up swap space on FreeBSD is straightforward, whether using a dedicated partition or a swap file. Swap partitions offer better performance, while swap files provide flexibility. By following the steps outlined in this guide, you can efficiently manage swap space on your FreeBSD system to ensure smooth performance under memory-intensive workloads.
