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
# How to Install FreeBSD on a Virtual Machine (VirtualBox/VMware) on FreeBSD Operating System

Virtualization has become an essential technology for system administrators, developers, and even casual users who want to experiment with different operating systems without dedicated hardware. For FreeBSD users who want to test new versions, create development environments, or run multiple instances for various purposes, setting up FreeBSD as a guest within FreeBSD presents a powerful solution.

This comprehensive guide will walk you through the process of installing FreeBSD as a guest operating system inside VirtualBox or VMware Workstation/Fusion while running FreeBSD as your host system. We'll cover everything from preparing your host system to post-installation configurations that optimize your virtualized FreeBSD experience.

## Prerequisites

Before beginning the installation process, ensure you have:

- A FreeBSD system with sufficient resources (at least 4GB RAM and 20GB free disk space)
- Administrative (root) privileges on your host system
- FreeBSD installation ISO (downloaded and verified)
- Virtualization software installed (VirtualBox or VMware)

Let's start by preparing your host system and installing the necessary virtualization software.

## Setting Up the Host System

### Installing VirtualBox on FreeBSD

VirtualBox is an open-source virtualization platform that works well on FreeBSD. To install VirtualBox:

```bash
# Update your package repository
pkg update

# Install VirtualBox and required kernel modules
pkg install virtualbox-ose virtualbox-ose-kmod

# Load the VirtualBox kernel module
kldload vboxdrv

# To automatically load the module at boot time, add to /boot/loader.conf
echo 'vboxdrv_load="YES"' >> /boot/loader.conf

# Add your user to the vboxusers group
pw groupmod vboxusers -m yourusername
```

After installation, log out and back in for the group changes to take effect.

### Installing VMware on FreeBSD

VMware Workstation Player or VMware Fusion can also be used on FreeBSD, though the installation process is slightly more involved:

1. Download the VMware bundle for FreeBSD from the VMware website
2. Install dependencies:

```bash
pkg install gcc gmake kernel-headers
```

3. Make the installer executable and run it:

```bash
chmod +x VMware-bundle-filename.bundle
./VMware-bundle-filename.bundle
```

4. Follow the on-screen instructions to complete the installation

With your virtualization software installed, you're ready to create a virtual machine for FreeBSD.

## Downloading FreeBSD Installation Media

If you haven't already done so, download the latest FreeBSD ISO from the official website:

```bash
# Create a directory for the ISO
mkdir -p ~/Downloads/FreeBSD

# Download the latest FreeBSD release (adjust version as needed)
cd ~/Downloads/FreeBSD
fetch https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/13.2/FreeBSD-13.2-RELEASE-amd64-disc1.iso

# Verify the checksum
fetch https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/13.2/CHECKSUM.SHA256-FreeBSD-13.2-RELEASE-amd64
sha256 FreeBSD-13.2-RELEASE-amd64-disc1.iso
```

Compare the SHA256 checksum output with the one listed in the CHECKSUM file to ensure integrity.

## Creating a Virtual Machine in VirtualBox

Now, let's create a new virtual machine in VirtualBox:

1. Launch VirtualBox from the terminal or application menu:

```bash
VirtualBox
```

2. Click "New" to create a new virtual machine

3. Enter the following details:
   - Name: FreeBSD-13.2 (or your preferred name)
   - Machine Folder: (leave default or choose your preferred location)
   - Type: BSD
   - Version: FreeBSD (64-bit)

4. Assign memory (RAM) to the virtual machine:
   - Recommended: 2048 MB (2GB) minimum
   - Allocate more if your host system has sufficient resources

5. Create a virtual hard disk:
   - Select "Create a virtual hard disk now"
   - Recommended size: 20 GB minimum
   - Type: VDI (VirtualBox Disk Image)
   - Storage: Dynamically allocated (saves space on your host)

6. Review your settings and click "Create"

7. Configure additional settings for optimal performance:
   - Select your new VM and click "Settings"
   - System > Processor: Assign 2 or more CPU cores if available
   - Display > Video Memory: 16 MB or higher
   - Network > Adapter 1: NAT (default) or Bridged Adapter for direct network access
   - Storage: Click the empty optical drive, then the disk icon on the right to select your FreeBSD ISO file

8. Click "OK" to save the configuration

## Creating a Virtual Machine in VMware

If you're using VMware instead, the process is similar:

1. Launch VMware Workstation/Fusion

2. Click "Create a New Virtual Machine" or "File > New Virtual Machine"

3. Select "Custom" setup and proceed through the wizard

4. When prompted for the guest operating system, select:
   - Operating System: Other
   - Version: FreeBSD 64-bit

5. Name your virtual machine and set its location

6. Configure processor and memory:
   - Processors: 1 or 2 cores (more if available)
   - Memory: 2048 MB (2GB) minimum

7. Configure networking (NAT is recommended for beginners)

8. Create a new virtual disk:
   - Disk type: SCSI (recommended)
   - Disk size: 20 GB minimum
   - Select "Store virtual disk as a single file"

9. Review your settings and click "Finish"

10. Before starting, go to VM settings to mount the FreeBSD ISO:
    - Select CD/DVD drive
    - Select "Use ISO image file" and browse to your FreeBSD ISO

## Installing FreeBSD on the Virtual Machine

With your virtual machine configured, you're ready to install FreeBSD:

1. Start the virtual machine by selecting it and clicking "Start"

2. The virtual machine will boot from the FreeBSD installation ISO

3. At the FreeBSD boot menu, press Enter to boot multi-user

4. Select your language and keyboard layout

5. When presented with the "Welcome" screen, select "Install"

6. In the "Partitioning" section, you have several options:
   - For beginners: Choose "Auto (UFS)" for a simple setup
   - For advanced users: Select "Manual" for custom partitioning
   - For ZFS enthusiasts: Choose "Auto (ZFS)" for advanced features

7. If you selected "Auto (UFS)":
   - Select the virtual disk (usually da0 or ada0)
   - Confirm the entire disk will be used

8. Set a strong root password when prompted

9. Configure network settings:
   - IPv4 Configuration: Yes
   - DHCP: Yes (for automatic IP assignment)
   - IPv6 Configuration: Optional
   - Set a hostname for your virtual FreeBSD machine

10. Select your timezone

11. Choose services to start at boot:
    - Recommended: sshd, ntpd, dumpdev

12. Add a regular user account when prompted (recommended)

13. When configuration is complete, select "Exit" and then "Exit Install"

14. Choose "Reboot" to restart into your new FreeBSD system

15. When prompted, remove the installation media:
    - In VirtualBox: Devices > Optical Drives > Remove disk from virtual drive
    - In VMware: VM > Removable Devices > CD/DVD > Disconnect

## Post-Installation Configuration

After the system reboots, log in with the user account you created (or as root). Now it's time to optimize your virtual FreeBSD installation:

### System Updates

First, update the system to ensure you have the latest security patches:

```bash
# As root or with sudo
freebsd-update fetch
freebsd-update install
```

### Installing Guest Additions/Tools

To improve performance and enable features like shared folders and better mouse integration, install the guest additions:

#### For VirtualBox:

```bash
# Install VirtualBox Guest Additions
pkg install virtualbox-ose-additions

# Enable required services
echo 'vboxguest_enable="YES"' >> /etc/rc.conf
echo 'vboxservice_enable="YES"' >> /etc/rc.conf
```

#### For VMware:

```bash
# Install VMware Tools
pkg install open-vm-tools

# Enable the service
echo 'vmware_guest_vmblock_enable="YES"' >> /etc/rc.conf
echo 'vmware_guest_vmhgfs_enable="YES"' >> /etc/rc.conf
echo 'vmware_guest_vmmemctl_enable="YES"' >> /etc/rc.conf
echo 'vmware_guest_vmxnet_enable="YES"' >> /etc/rc.conf
echo 'vmware_guestd_enable="YES"' >> /etc/rc.conf
```

After installing the guest additions, reboot the virtual machine for the changes to take effect:

```bash
shutdown -r now
```

### Installing Essential Software

Install some essential software to make your FreeBSD virtual machine more useful:

```bash
# Update package repository
pkg update

# Install common utilities
pkg install vim-console bash tmux git rsync wget curl sudo
```

### Setting Up Shared Folders (Optional)

If you want to share files between your host and guest FreeBSD systems:

#### For VirtualBox:

1. Power off the VM
2. In VirtualBox settings, go to "Shared Folders"
3. Add a new shared folder and set automount
4. Start the VM again
5. Mount the shared folder:

```bash
# Create mount point
mkdir -p /mnt/shared

# Mount the shared folder
mount -t vboxvfs sharename /mnt/shared
```

#### For VMware:

1. In VMware settings, configure a shared folder
2. In the guest FreeBSD system:

```bash
# Create mount point
mkdir -p /mnt/hgfs

# Mount shared folders
mount -t vmhgfs .host:/ /mnt/hgfs
```

To make the mount permanent, add it to /etc/fstab, but be careful to include the proper options to prevent boot problems if the shared folder is unavailable.

## Performance Tuning

For better performance, consider these optimizations:

### Memory Management

```bash
# Add to /etc/sysctl.conf
echo "vm.defer_swapspace_pageouts=1" >> /etc/sysctl.conf
echo "vm.swap_idle_enabled=0" >> /etc/sysctl.conf
```

### Filesystem Tuning

For UFS filesystems, add these mount options in /etc/fstab:

```
noatime,softdep
```

For example:
```
/dev/ada0p2    /    ufs    rw,noatime,softdep    1    1
```

### Disk I/O Scheduler

If your virtual disk performance seems slow:

```bash
# Add to /boot/loader.conf
echo 'vfs.zfs.prefetch_disable=1' >> /boot/loader.conf  # If using ZFS
```

## Snapshot and Backup Strategy

One of the main advantages of virtual machines is the ability to take snapshots:

### VirtualBox Snapshots

1. From the VirtualBox Manager, select your VM
2. Click "Machine" > "Take Snapshot"
3. Give the snapshot a name and description
4. Click "OK"

### VMware Snapshots

1. With the VM powered on, select "VM" > "Snapshot" > "Take Snapshot"
2. Name the snapshot and add an optional description
3. Click "Take Snapshot"

For additional protection, consider setting up periodic backups of your virtual machine files from your host system.

## Conclusion

Installing FreeBSD in a virtual machine on a FreeBSD host gives you tremendous flexibility for testing, development, and learning. The virtualized environment allows you to experiment freely without risking your main system, create multiple instances with different configurations, and easily restore to known-good states using snapshots.

This approach is particularly valuable for:

- Testing software installations before deploying to production
- Developing and testing FreeBSD ports and packages
- Learning system administration in a safe environment
- Creating isolated environments for specific applications
- Testing compatibility with different FreeBSD versions

By following this guide, you've created a fully functional FreeBSD virtual machine that can be customized for your specific needs. The post-installation optimizations ensure that your virtual FreeBSD system runs efficiently within the constraints of virtualization.

As you become more comfortable with FreeBSD virtualization, you might want to explore more advanced topics like PCI passthrough, VM clustering, or even nested virtualization. The combination of FreeBSD's robustness and the flexibility of virtual machines creates a powerful platform for both learning and production use.