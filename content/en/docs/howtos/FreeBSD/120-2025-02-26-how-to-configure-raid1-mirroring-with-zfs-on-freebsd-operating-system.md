---
draft: true
title:
linkTitle:
translationKey:
description:
slug:
date:
weight: 0
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
# How to Configure RAID1 (Mirroring) with ZFS on FreeBSD Operating System

Data integrity and redundancy are critical aspects of any storage system, particularly for servers and mission-critical workstations. The Z File System (ZFS) integrated into FreeBSD provides native support for various RAID configurations, including RAID1 (mirroring), which maintains identical copies of data across multiple disks. This redundancy ensures that if one disk fails, your data remains accessible and intact.

This comprehensive guide will walk you through the process of configuring RAID1 with ZFS on FreeBSD, from planning and preparation to verification and maintenance. Whether you're setting up a new system or adding redundancy to an existing one, you'll learn how to leverage ZFS's powerful features to create a robust storage solution.

## Understanding ZFS RAID1 (Mirroring)

Before diving into the technical steps, let's understand what ZFS RAID1 offers:

### Key Benefits of ZFS Mirroring

1. **Data Redundancy**: Every block of data is written to multiple disks simultaneously, providing protection against disk failures.

2. **Read Performance**: ZFS can read from any disk in the mirror, potentially improving read performance through load balancing.

3. **Self-Healing**: ZFS's checksum verification can detect corrupted data blocks and repair them using redundant copies from other disks.

4. **Hot Spares**: You can designate spare drives that will automatically replace failed drives in a mirror.

5. **No RAID Controller**: Unlike hardware RAID, ZFS provides software RAID functionality without requiring expensive RAID controller cards.

### Mirroring vs. Other ZFS RAID Levels

ZFS supports various RAID configurations, including:

- **Mirror (RAID1)**: Provides redundancy with at least two disks, but no capacity increase beyond a single disk.
- **RAIDZ1 (Similar to RAID5)**: Provides single-disk redundancy with better storage efficiency.
- **RAIDZ2 (Similar to RAID6)**: Provides two-disk redundancy for enhanced protection.
- **RAIDZ3**: Provides three-disk redundancy for maximum protection.

Mirroring is often preferred for its simplicity, performance, and reliability, especially for smaller configurations (2-4 disks). While it requires more raw storage (50% efficiency with two disks), the performance benefits and lower rebuild stress make it an excellent choice for many scenarios.

## Prerequisites

Before configuring ZFS RAID1, ensure you have:

1. **FreeBSD Installation**: A working FreeBSD system (this guide uses FreeBSD 13.2-RELEASE)
2. **Multiple Disks**: At least two identical or similarly sized disks (larger capacities are better)
3. **Root Access**: Administrative privileges on your FreeBSD system
4. **Disk Identification**: Knowledge of your disk device names

## Planning Your ZFS Mirror Configuration

Careful planning before implementation will save you time and potential headaches later.

### Identifying Your Disks

First, identify the disks you'll use in your mirror. In FreeBSD, disks are typically named:

- **SATA/SAS disks**: `/dev/ada0`, `/dev/ada1`, etc.
- **NVMe disks**: `/dev/nvme0`, `/dev/nvme1`, etc.
- **USB disks**: `/dev/da0`, `/dev/da1`, etc.

Use the following commands to identify your disks:

```bash
# List all disks
geom disk list

# For more detailed information
camcontrol devlist

# For NVMe drives
nvmecontrol devlist
```

### Dataset Planning

Consider how you want to organize your data. ZFS uses a hierarchical dataset structure that allows you to:

- Create multiple filesystems with different properties
- Set quotas and reservations
- Apply compression, deduplication, and other features at different levels

For a basic mirror setup, you might have:

- A root pool (if installing on ZFS)
- A data pool for user data
- Separate datasets for different types of data (documents, media, backups, etc.)

## Setting Up a ZFS Mirror During FreeBSD Installation

If you're installing a new FreeBSD system, you can configure ZFS mirroring during the installation process.

### During FreeBSD Installation

1. Boot from the FreeBSD installation media
2. Proceed through the initial setup screens
3. When you reach the "Partitioning" section, choose "Shell"
4. Use the following commands to set up a mirrored root pool:

```bash
# Create a mirrored ZFS root pool
zpool create -f -o altroot=/mnt -o cachefile=/tmp/zpool.cache \
  -O compression=lz4 -O atime=off -O mountpoint=/ \
  zroot mirror /dev/ada0 /dev/ada1

# Export and import the pool to the alternate root
zpool export zroot
zpool import -o altroot=/mnt -o cachefile=/tmp/zpool.cache zroot

# Create necessary datasets
zfs create -o mountpoint=/tmp -o exec=on -o setuid=off zroot/tmp
zfs create -o mountpoint=/usr -o canmount=off zroot/usr
zfs create zroot/usr/home
zfs create -o setuid=off zroot/usr/ports
zfs create zroot/usr/src
zfs create -o mountpoint=/var -o canmount=off zroot/var
zfs create -o exec=off -o setuid=off zroot/var/audit
zfs create -o exec=off -o setuid=off zroot/var/crash
zfs create -o exec=off -o setuid=off zroot/var/log
zfs create -o exec=on -o setuid=off zroot/var/mail
zfs create -o exec=off -o setuid=off zroot/var/tmp

# Set properties to prevent the dataset from mounting until FreeBSD is ready
zfs set mountpoint=legacy zroot
zfs set mountpoint=/tmp zroot/tmp
zfs set mountpoint=/usr zroot/usr
zfs set mountpoint=/var zroot/var

# Create a swap partition
zfs create -V 4G -o org.freebsd:swap=on -o checksum=off -o compression=off \
  -o mountpoint=none zroot/swap

# Return to the installer
exit
```

5. Continue with the installation as normal, but when prompted for filesystem selection, choose "Shell" again and run:

```bash
cp /tmp/zpool.cache /mnt/boot/zfs/
exit
```

6. Complete the installation process

## Setting Up a ZFS Mirror on an Existing FreeBSD System

If you already have FreeBSD installed and want to add a mirrored data pool:

### Creating a Mirrored Data Pool

```bash
# Create a mirrored ZFS data pool
zpool create datapool mirror /dev/ada2 /dev/ada3 -f

# Create datasets as needed
zfs create datapool/documents
zfs create datapool/media
zfs create datapool/backups

# Set properties as desired
zfs set compression=lz4 datapool/documents
zfs set compression=off datapool/media  # Often media files are already compressed
zfs set compression=gzip-9 datapool/backups  # Higher compression for backups
```

### Converting a Single Disk to a Mirror

If you already have a ZFS pool on a single disk and want to add redundancy:

```bash
# Attach a second disk to create a mirror
zpool attach poolname /dev/existingdisk /dev/newdisk
```

For example, to mirror an existing pool called "datapool" on `/dev/ada2` with a new disk `/dev/ada3`:

```bash
zpool attach datapool /dev/ada2 /dev/ada3
```

The resilver (synchronization) process will begin immediately, copying all data to the new disk.

## Monitoring and Verifying Your ZFS Mirror

After setting up your mirror, it's essential to verify that everything is working correctly.

### Check Pool Status

```bash
# Display basic pool status
zpool status

# For more detailed information
zpool status -v
```

The output should show your pool with a RAID1 (mirror) configuration and a status of "ONLINE" for all disks.

### Monitor Resilver Progress

If you've just attached a disk to create a mirror, you can monitor the resilver progress:

```bash
zpool status -v
```

Look for the "scan:" line, which will show the progress, estimated time remaining, and current speed.

### Verify Data Integrity

ZFS includes built-in scrubbing functionality that verifies all data against checksums:

```bash
# Start a scrub operation
zpool scrub datapool

# Check scrub status
zpool status datapool
```

It's recommended to perform regular scrubs (weekly or monthly) to ensure data integrity.

## Maintaining Your ZFS Mirror

Proper maintenance ensures the long-term reliability of your ZFS mirror.

### Handling Disk Failures

If a disk fails, ZFS will automatically detect the failure and continue operating from the healthy disk. To replace the failed disk:

```bash
# Replace a failed disk
zpool replace datapool /dev/ada2 /dev/ada4
```

If the disk had a permanent device ID (using glabel or the `/dev/diskid/` path), you can physically replace it and run:

```bash
zpool replace datapool failed_disk
```

### Adding a Hot Spare

You can designate a hot spare disk that will automatically replace a failed disk:

```bash
# Add a hot spare
zpool add datapool spare /dev/ada4
```

### Regular Maintenance Tasks

Implement these maintenance practices for optimal reliability:

1. **Weekly Scrubs**: Schedule weekly or monthly data integrity checks:

```bash
# Add to crontab for automatic weekly scrubs
echo "0 1 * * 0 root /sbin/zpool scrub datapool" >> /etc/crontab
```

2. **Email Notifications**: Configure ZFS to send email notifications for critical events:

```bash
# Install mail transfer agent
pkg install postfix

# Configure ZFS Event Daemon (ZED)
echo 'zfs_enable="YES"' >> /etc/rc.conf
sysrc zfsd_enable=YES
service zfsd start
```

3. **Monitor ZFS Pool Health**: Use monitoring tools like Nagios, Zabbix, or simple scripts to alert you of potential issues.

## Advanced ZFS Mirror Configurations

As you become more comfortable with ZFS, consider these advanced configurations:

### Multiple Mirror vdevs

For larger storage requirements, you can create multiple mirror vdevs in a single pool for increased capacity:

```bash
# Create a pool with two mirror vdevs
zpool create bigpool mirror /dev/ada0 /dev/ada1 mirror /dev/ada2 /dev/ada3
```

This provides the redundancy of mirroring while increasing the total capacity.

### L2ARC and ZIL

For performance improvements, consider adding:

1. **L2ARC (Level 2 Adaptive Read Cache)**: A fast SSD to cache frequently read data:

```bash
zpool add datapool cache /dev/ada4
```

2. **ZIL (ZFS Intent Log)**: A separate device for the ZFS Intent Log to improve synchronous write performance:

```bash
zpool add datapool log /dev/ada5
```

### Data Encryption

FreeBSD 13.0 and later support native ZFS encryption:

```bash
# Create an encrypted dataset
zfs create -o encryption=on -o keyformat=passphrase datapool/encrypted
```

## Performance Tuning for ZFS Mirrors

Optimize your ZFS mirror performance with these tuning parameters:

### Memory Allocation

ZFS performs best with adequate memory for the ARC (Adaptive Replacement Cache):

```bash
# Set minimum and maximum ARC size in /boot/loader.conf
echo "vfs.zfs.arc_min=1G" >> /boot/loader.conf
echo "vfs.zfs.arc_max=4G" >> /boot/loader.conf  # Adjust based on available RAM
```

### Prefetch Settings

For many workloads, disabling prefetch can improve performance:

```bash
echo "vfs.zfs.prefetch_disable=1" >> /boot/loader.conf
```

### Recordsize Optimization

Set recordsize based on your workload:

```bash
# For databases (smaller recordsize)
zfs set recordsize=8K datapool/database

# For large files like videos (larger recordsize)
zfs set recordsize=1M datapool/videos
```

## Conclusion

Configuring ZFS RAID1 (mirroring) on FreeBSD provides robust data protection and performance benefits through redundancy. The process is straightforward, whether performed during initial installation or on an existing system.

The key advantages of ZFS mirroring include:

- Built-in data integrity verification and automatic repair
- Improved read performance through load balancing
- Simple expansion by attaching additional mirrors
- No need for specialized hardware RAID controllers
- Advanced features like snapshots, clones, and compression

By following the steps in this guide and implementing proper maintenance practices, you'll create a reliable storage system that protects your valuable data from disk failures and corruption.

Remember that while ZFS mirroring provides excellent protection against disk failures, it's not a substitute for proper backups. Always maintain regular backups of your important data to external media or remote locations for comprehensive data protection.

With ZFS mirroring in place, you can enjoy the peace of mind that comes from knowing your data is safe, even when hardware fails. Whether you're running a small business server or a personal workstation, ZFS mirroring on FreeBSD is a powerful tool for data reliability and peace of mind.