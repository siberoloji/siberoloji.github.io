---
title: How to Get a Free RHEL Developer Subscription
description: In this comprehensive guide, we'll walk through the process of obtaining a free RHEL Developer Subscription and installing RHEL 9.6 on Oracle VirtualBox.
linkTitle: RHEL Developer Subscription
date: 2024-11-24
type: blog
draft: false

tags:
  - rhel
  - developer subscription
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

featured_image: /images/redhatlinuxillustration1.webp
url: free-rhel-developer-subscription
keywords:
  - RHEL Developer Subscription
---
Red Hat Enterprise Linux (RHEL) is one of the most popular enterprise Linux distributions, known for its stability, security, and extensive support. While RHEL is typically a paid subscription-based operating system, Red Hat offers a free Developer Subscription that allows developers to access RHEL for development and testing purposes. In this comprehensive guide, we'll walk through the process of obtaining a free RHEL Developer Subscription and installing RHEL 9.6 on Oracle VirtualBox.

## Prerequisites

Before we begin, ensure you have:

- A computer with at least 4GB RAM (8GB recommended)
- 20GB of free disk space
- Oracle VirtualBox installed on your system
- A stable internet connection
- A valid email address for Red Hat account registration

## Part 1: Obtaining a Free RHEL Developer Subscription

1. **Create a Red Hat Account**
   - Visit the Red Hat Developer website (developers.redhat.com)
   - Click on the "Join Red Hat Developer" or "Register" button
   - Fill in your personal information, including name, email, and company (if applicable)
   - Accept the terms and conditions
   - Verify your email address through the confirmation link

2. **Activate Developer Subscription**
   - Log in to your Red Hat Developer account
   - Navigate to the "Downloads" section
   - The Developer Subscription should be automatically activated upon account creation
   - You can verify your subscription status in the "Subscriptions" section of your account

## Part 2: Downloading RHEL 9.6

1. **Access the Download Portal**
   - Log in to the Red Hat Customer Portal
   - Navigate to the "Downloads" section
   - Select "Red Hat Enterprise Linux 9.6"

2. **Choose the Appropriate ISO**
   - Look for "Red Hat Enterprise Linux 9.6 Binary DVD"
   - Select the appropriate architecture (x86_64 for most users)
   - Download the ISO file (approximately 8-9GB)
   - Save the checksum for verification

3. **Verify the ISO Download**
   - On Linux/Mac, use the following command:

     ```bash
     sha256sum rhel-9.6-x86_64-dvd.iso
     ```

   - On Windows, use PowerShell:

     ```powershell
     Get-FileHash rhel-9.6-x86_64-dvd.iso -Algorithm SHA256
     ```

   - Compare the output with the checksum from the download page

## Part 3: Setting Up VirtualBox

1. **Create a New Virtual Machine**
   - Open VirtualBox
   - Click "New" to create a new VM
   - Name: "RHEL 9.6"
   - Type: "Linux"
   - Version: "Red Hat (64-bit)"
   - Allocate at least 4GB RAM (4096 MB)
   - Create a new virtual hard disk (VDI format)
   - Allocate at least 20GB storage (dynamically allocated)

2. **Configure VM Settings**
   - Select the new VM and click "Settings"
   - Under "System":
     - Enable EFI (if needed)
     - Set boot order (optical drive first)
   - Under "Display":
     - Allocate 128MB video memory
     - Enable 3D acceleration
   - Under "Network":
     - Ensure "NAT" is selected for network adapter
   - Under "Storage":
     - Add the RHEL 9.6 ISO to the optical drive

## Part 4: Installing RHEL 9.6

1. **Start the Installation**
   - Start the virtual machine
   - Select "Install Red Hat Enterprise Linux 9.6" from the boot menu
   - Choose your language preference

2. **Configure Installation Settings**
   - **Installation Destination**:
     - Select the virtual disk
     - Choose "Automatic" partitioning
   - **Network & Hostname**:
     - Enable network adapter
     - Set hostname if desired
   - **Software Selection**:
     - Choose "Server with GUI" for desktop environment
     - Select additional packages as needed
   - **Time & Date**:
     - Set your timezone
   - **Root Password**:
     - Set a strong root password
   - **Create User**:
     - Create an administrative user
     - Enable "Make this user administrator"

3. **Complete Installation**
   - Click "Begin Installation"
   - Wait for the installation to complete (15-30 minutes)
   - Remove the installation media
   - Reboot the virtual machine

## Part 5: Post-Installation Steps

1. **Register Your System**
   - Open terminal
   - Run the subscription-manager:

     ```bash
     sudo subscription-manager register --username <your-username>
     ```

   - Enter your Red Hat portal password
   - Attach the subscription:

     ```bash
     sudo subscription-manager attach --auto
     ```

2. **Update the System**
   - Update package lists:

     ```bash
     sudo dnf check-update
     ```

   - Install all updates:

     ```bash
     sudo dnf update -y
     ```

3. **Install VirtualBox Guest Additions**
   - Install required packages:

     ```bash
     sudo dnf install gcc kernel-devel kernel-headers make bzip2 perl
     ```

   - Mount Guest Additions CD from VirtualBox menu
   - Run the installer:

     ```bash
     sudo /run/media/$USER/VBoxLinuxAdditions.run
     ```

   - Reboot the virtual machine

## Troubleshooting Common Issues

1. **Registration Fails**
   - Verify your internet connection
   - Ensure your Red Hat credentials are correct
   - Check if your system time is accurate

2. **VirtualBox Performance Issues**
   - Increase RAM allocation if possible
   - Enable hardware virtualization in BIOS
   - Update VirtualBox to the latest version

3. **Network Problems**
   - Verify network adapter settings in VirtualBox
   - Check firewall settings
   - Ensure proxy settings are correct if using one

## Conclusion

You now have a fully functional RHEL 9.6 development environment running in VirtualBox. This setup allows you to explore RHEL's features, test applications, and develop software in a controlled environment. Remember to keep your system updated and maintain regular backups of your virtual machine.

The Developer Subscription provides access to most RHEL features and Red Hat's extensive documentation. While it's free for development use, remember that it's not licensed for production environments. For production deployments, you'll need to purchase an appropriate subscription from Red Hat.
