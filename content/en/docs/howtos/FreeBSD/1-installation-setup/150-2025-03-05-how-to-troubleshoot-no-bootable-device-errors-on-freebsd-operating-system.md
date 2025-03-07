---
draft: false
title: How to Troubleshoot "No Bootable Device" Errors on FreeBSD Operating System
linkTitle: How to Troubleshoot "No Bootable Device" Errors
translationKey: how-to-troubleshoot-no-bootable-device-errors-on-freebsd
description: How to Troubleshoot "No Bootable Device" Errors on FreeBSD Operating System
url: how-to-troubleshoot-no-bootable-device-errors-on-freebsd-operating-system
date: 2025-03-05
weight: 150
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Encountering a "No Bootable Device" error on FreeBSD can be frustrating, particularly if you rely on the system for critical tasks. This error typically occurs when the system fails to locate a valid bootloader or operating system during the startup process. Various factors can contribute to this issue, including misconfigured BIOS/UEFI settings, disk corruption, missing bootloader, or hardware failure.

In this guide, we will explore the potential causes of the "No Bootable Device" error on FreeBSD and provide step-by-step troubleshooting methods to resolve it.

## Common Causes of "No Bootable Device" Error

Before diving into solutions, it is important to understand the common causes behind this error:

1. **Incorrect Boot Order** – The system's firmware might be set to boot from an incorrect disk or device.
2. **Corrupt Bootloader** – The FreeBSD bootloader might be missing or damaged due to improper system shutdown, failed updates, or disk corruption.
3. **Damaged File System or Partition Table** – A corrupted or missing partition table can prevent FreeBSD from booting.
4. **Failed Disk Drive** – A faulty or failing disk can lead to a "No Bootable Device" error.
5. **BIOS/UEFI Misconfiguration** – Boot settings may not be properly configured for FreeBSD, particularly when switching between BIOS and UEFI boot modes.
6. **GRUB or Bootloader Conflicts** – If FreeBSD is part of a dual-boot system, bootloader conflicts may cause boot failures.

Now that we have identified the possible causes, let’s move on to troubleshooting steps.

## Step 1: Verify BIOS/UEFI Boot Settings

1. **Access BIOS/UEFI Setup:**
   - Restart your computer and press the appropriate key to enter the BIOS/UEFI settings (common keys include `F2`, `F12`, `Esc`, or `Del`).
   - If you’re unsure, consult your motherboard’s manual or search for your system’s BIOS access key.

2. **Check Boot Order:**
   - Navigate to the Boot Configuration section.
   - Ensure that the boot drive containing FreeBSD is set as the primary boot device.
   - If the correct drive is missing, check if it is detected under the storage settings.

3. **BIOS/UEFI Mode Verification:**
   - If your system supports both UEFI and Legacy (BIOS) boot modes, make sure you are using the correct mode.
   - If FreeBSD was installed in UEFI mode, ensure that UEFI is enabled.
   - If FreeBSD was installed in Legacy mode, ensure that Legacy/CSM boot is enabled.

## Step 2: Check If the Hard Drive Is Recognized

1. **Boot Into BIOS and Verify Disk Detection:**
   - If your hard drive does not appear in the BIOS, it might be disconnected, faulty, or misconfigured.
   - Try reseating the SATA or NVMe cable and ensure power connections are secure.

2. **Boot Using a Live USB/CD:**
   - Download a FreeBSD live image and create a bootable USB using tools like `dd`, `Rufus`, or `balenaEtcher`.
   - Boot into the FreeBSD live environment and run the following command to check if the disk is detected:

     ```sh
     gpart show
     ```

   - If the disk is missing, it might be a hardware failure.
   - If the disk is present but the FreeBSD partition is missing, the partition table may be corrupted.

## Step 3: Repair the Bootloader

If your disk is recognized but FreeBSD does not boot, the bootloader might be missing or damaged.

1. **Reinstall the FreeBSD Bootloader:**
   - Boot into a FreeBSD live environment.
   - Identify your root disk (e.g., `ada0`, `da0`, `nvme0`):

     ```sh
     gpart show
     ```

   - Reinstall the bootloader:

     ```sh
     gpart bootcode -b /boot/boot0 ada0
     ```

   - If using GPT partitioning, reinstall the GPT bootloader:

     ```sh
     gpart bootcode -p /boot/gptboot -i 1 ada0
     ```

   - Reboot and check if the issue is resolved.

## Step 4: Check and Repair File System

A corrupted file system can prevent FreeBSD from booting. Running a file system check can help identify and fix issues.

1. **Boot into a Live Environment:**
   - Use a FreeBSD installation or recovery disk.

2. **Run `fsck` to Repair the File System:**
   - First, check the partitions:

     ```sh
     gpart show
     ```

   - Then, run `fsck` on each FreeBSD partition:

     ```sh
     fsck -y /dev/ada0p2
     ```

   - Replace `ada0p2` with the appropriate partition.
   - Reboot and check if FreeBSD starts successfully.

## Step 5: Rebuild Partition Table (Advanced)

If the partition table is missing or corrupted, you may need to rebuild it.

1. **Backup Important Data:** If possible, create a backup before proceeding.

2. **Recreate the Partition Table:**
   - Identify the affected disk:

     ```sh
     gpart destroy -F ada0
     ```

   - Recreate partitions:

     ```sh
     gpart create -s gpt ada0
     gpart add -t freebsd-boot -s 512k ada0
     gpart add -t freebsd-ufs -s 20G ada0
     gpart add -t freebsd-swap -s 2G ada0
     ```

   - Install the bootloader again (refer to Step 3).
   - Restore data if possible.

## Step 6: Check for Hardware Issues

1. **Test Your Hard Drive:**
   - Use `smartctl` to check for hardware issues:

     ```sh
     smartctl -a /dev/ada0
     ```

   - Look for errors indicating drive failure.
   - If issues persist, consider replacing the hard drive.

2. **Test RAM and Other Components:**
   - Use `memtest86+` to check for faulty RAM.
   - Verify cables and connections to ensure everything is properly seated.

## Conclusion

The "No Bootable Device" error on FreeBSD can stem from multiple causes, including BIOS misconfiguration, bootloader corruption, or disk failure. By systematically checking each component—from BIOS settings and boot order to disk integrity and bootloader configuration—you can identify and resolve the issue efficiently.

If none of these steps resolve the issue, consider reinstalling FreeBSD while preserving critical data. Keeping backups and regularly maintaining your system can prevent future boot issues. Hopefully, this guide has helped you troubleshoot and recover your FreeBSD installation successfully.
