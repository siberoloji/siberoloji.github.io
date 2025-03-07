---
draft: false
title: How to Enable Full-Disk Encryption with GELI During FreeBSD Installation
linkTitle: How to Enable Full-Disk Encryption with GELI During FreeBSD Installation
translationKey: how-to-enable-full-disk-encryption-with-geli-during-freebsd-installation
description: How to Enable Full-Disk Encryption with GELI During FreeBSD Installation
url: how-to-enable-full-disk-encryption-with-geli-during-freebsd-installation
date: 2025-02-26
weight: 80
keywords:
  - FreeBSD
  - GELI
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

Full-disk encryption is a crucial security measure that protects your data from unauthorized access if your computer is lost, stolen, or improperly decommissioned. FreeBSD provides robust disk encryption through GELI (GEOM-based disk encryption), which allows you to encrypt partitions or entire disks with strong cryptographic algorithms.

This guide will walk you through the process of setting up GELI encryption during a fresh FreeBSD installation, ensuring your system is secure from the very beginning.

## Prerequisites

Before starting, you'll need:

- A FreeBSD installation media (USB drive or DVD)
- Backup of any important data if you're converting an existing system
- A strong passphrase that you won't forget
- At least 30 minutes of uninterrupted time

## Understanding GELI Encryption

GELI is FreeBSD's native encryption subsystem that operates at the GEOM level (FreeBSD's modular disk transformation framework). It provides:

- AES-XTS encryption with keys up to 256 bits
- Optional data authentication
- Multiple keys for the same encrypted device
- Resistance against brute-force attacks

When you encrypt a disk with GELI, a special metadata section is created at the end of the provider, containing information about the encryption algorithms and other parameters. The actual data on the disk is completely encrypted and cannot be accessed without the correct passphrase or key files.

## Step-by-Step Installation Process

### 1. Boot from Installation Media

- Insert your FreeBSD installation media and boot from it
- Select "Install" from the initial menu
- Proceed through the initial setup screens (keymap selection, hostname setup)

### 2. Partition Selection

When you reach the "Partitioning" section of the installer:

1. Select "Shell" to access the command line
2. You'll be using this shell to set up the encrypted partitions before continuing with the installation

### 3. Identify Your Disk

First, identify the disk you want to encrypt:

```bash
# List available disks
gpart show
```

Note the disk name (e.g., `ada0` for SATA drives, `da0` for USB drives, or `nvd0` for NVMe drives). For this guide, we'll use `ada0` as an example.

### 4. Create a GPT Partition Scheme

```bash
# Initialize the GPT partition table
gpart create -s gpt ada0

# Create a boot partition (unencrypted)
gpart add -t freebsd-boot -l boot -b 40 -s 512K ada0

# Create the partition for the encrypted system
gpart add -t freebsd-ufs -l system -s 40G ada0

# If needed, create a swap partition
gpart add -t freebsd-swap -l swap -s 8G ada0

# Add any additional data partitions as needed
gpart add -t freebsd-ufs -l data ada0
```

### 5. Install the Boot Code

```bash
gpart bootcode -b /boot/pmbr -p /boot/gptboot -i 1 ada0
```

### 6. Set Up GELI Encryption

Now, set up encryption on the system partition:

```bash
# Initialize GELI on the system partition
geli init -b -s 4096 -e AES-XTS -l 256 -J - /dev/ada0p2

# Attach the initialized GELI provider
geli attach /dev/ada0p2
```

You'll be prompted to enter a passphrase. Choose a strong passphrase that is:

- At least 12 characters long
- Contains uppercase and lowercase letters, numbers, and symbols
- Not used for any other accounts
- Memorable to you but difficult to guess

For additional security, you can add the `-B` flag to also create a backup file of the GELI metadata. This is recommended:

```bash
geli init -b -B /tmp/ada0p2.eli -s 4096 -e AES-XTS -l 256 -J - /dev/ada0p2
```

If you opted to encrypt the swap partition as well:

```bash
# Initialize GELI on the swap partition with a random key
geli onetime -e AES-XTS -l 128 -s 4096 /dev/ada0p3
```

### 7. Create Filesystems on the Encrypted Partitions

Now create UFS filesystems on the encrypted partitions:

```bash
# Create a filesystem on the encrypted system partition
newfs -U -L rootfs /dev/ada0p2.eli

# Mount the filesystem for installation
mount /dev/ada0p2.eli /mnt
```

If you have additional encrypted partitions, create filesystems on them as well.

### 8. Exit to the Installer

Type `exit` to return to the FreeBSD installer.

### 9. Select Manual Partitioning

In the installer's partitioning section:

- Choose "Manual" partitioning
- When prompted for the root filesystem, specify `/dev/ada0p2.eli`
- For any additional partitions, assign their mount points to the corresponding encrypted devices

### 10. Complete the Installation

Proceed with the rest of the installation as normal:

- Select components to install
- Configure network
- Set the root password
- Add users
- Final configuration

### 11. Configure System for GELI on Boot

Before rebooting, perform some additional configuration:

1. Choose "Shell" again from the installer menu
2. Edit /mnt/boot/loader.conf:

```bash
echo 'geom_eli_load="YES"' >> /mnt/boot/loader.conf
echo 'vfs.root.mountfrom="ufs:/dev/ada0p2.eli"' >> /mnt/boot/loader.conf
```

3. Edit /mnt/etc/fstab to ensure the encrypted partitions are properly mounted:

```bash
# For the root filesystem
echo '/dev/ada0p2.eli    /    ufs    rw    1    1' > /mnt/etc/fstab

# For encrypted swap (if applicable)
echo '/dev/ada0p3.eli    none    swap    sw    0    0' >> /mnt/etc/fstab

# For additional encrypted partitions (if applicable)
echo '/dev/ada0p4.eli    /data    ufs    rw    2    2' >> /mnt/etc/fstab
```

4. If you created a GELI backup file, save it somewhere safe (not on the encrypted disk itself):

```bash
# Copy to a USB drive or other external media
cp /tmp/ada0p2.eli /mnt/root/
```

5. Exit the shell and return to the installer

### 12. Complete the Installation and Reboot

- Select "Complete" to finish the installation
- When asked if you want to perform additional configuration, select "No"
- Choose "Reboot" to restart the system

## Post-Installation Verification

After the system reboots:

1. You should be prompted for the GELI passphrase early in the boot process
2. After entering the correct passphrase, the system should continue booting normally
3. Verify the encryption is working by checking the mounted filesystems:

```bash
geli status
mount | grep eli
```

## Additional Security Considerations

### Key Files

For enhanced security, you can use key files in addition to or instead of a passphrase:

```bash
# Generate a key file
dd if=/dev/random of=/root/keyfile bs=64 count=1

# Initialize GELI with the key file
geli init -b -s 4096 -e AES-XTS -l 256 -k /root/keyfile -J - /dev/adaXpY

# Store the key file on a separate USB drive
```

### Regular Backups of GELI Metadata

Always keep backups of your GELI metadata in a secure location. If this metadata is corrupted, you won't be able to access your encrypted data even with the correct passphrase.

```bash
# Back up GELI metadata
geli backup /dev/ada0p2 /path/to/safe/storage/ada0p2.eli
```

### Emergency Recovery Preparations

Create a FreeBSD rescue USB with the GELI utilities in case you need to recover your system:

1. Use another FreeBSD system to create a bootable USB
2. Include your GELI metadata backups on the USB
3. Document the recovery process for reference

## Conclusion

GELI encryption in FreeBSD provides a robust security layer that protects your data from unauthorized physical access. By implementing full-disk encryption during the installation process, you ensure that your system is secure from its first boot.

Remember that while encryption protects your data when the system is powered off, it doesn't protect against all threats. Maintain good security practices, keep your system updated, and implement additional security measures as appropriate for your threat model.

The small performance impact of encryption is a worthwhile trade-off for the significant security benefits it provides, especially for laptops and systems in physically insecure locations.

With these steps, you've successfully set up a FreeBSD system with full-disk encryption, giving you confidence that your data remains protected even if your physical hardware is compromised.
