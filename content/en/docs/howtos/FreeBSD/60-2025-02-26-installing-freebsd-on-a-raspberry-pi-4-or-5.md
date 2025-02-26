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
Installing FreeBSD on a Raspberry Pi 4 or 5 allows you to explore a robust, Unix-like operating system on versatile hardware. This guide provides a comprehensive walkthrough for setting up FreeBSD on these devices, covering preparation, installation, and post-installation steps.

**Table of Contents**

1. **Introduction to FreeBSD and Raspberry Pi**
2. **Prerequisites**
3. **Downloading the FreeBSD Image**
4. **Preparing the Storage Medium**
5. **Modifying Configuration Files**
6. **Booting the Raspberry Pi**
7. **Initial System Configuration**
8. **Network Setup**
9. **Updating the System**
10. **Installing Additional Packages**
11. **Enabling Graphical Interface**
12. **Setting Up External Storage**
13. **Configuring System Services**
14. **Performance Optimization**
15. **Troubleshooting Common Issues**
16. **Frequently Asked Questions (FAQs)**

## 1. Introduction to FreeBSD and Raspberry Pi

FreeBSD is an open-source operating system derived from the Berkeley Software Distribution (BSD), renowned for its performance, advanced networking features, and security. The Raspberry Pi 4 and 5 are compact, affordable single-board computers popular among hobbyists and professionals for various applications, from simple educational tools to complex server setups. Combining FreeBSD with Raspberry Pi hardware offers a powerful platform for learning and development.

## 2. Prerequisites

Before beginning the installation, ensure you have the following:

- **Hardware:**
  - Raspberry Pi 4 or 5
  - MicroSD card (minimum 8GB recommended)
  - Power supply compatible with your Raspberry Pi
  - HDMI monitor and cable
  - USB keyboard and mouse
  - (Optional) Ethernet cable for network connectivity

- **Software:**
  - Computer with an SD card reader
  - Image writing tool (e.g., `dd` for Unix-like systems or balenaEtcher for cross-platform use)

## 3. Downloading the FreeBSD Image

Obtain the latest FreeBSD image suitable for the Raspberry Pi from the official FreeBSD release page. For Raspberry Pi 4, download the `FreeBSD-14.0-RELEASE-arm64-aarch64-RPI.img.xz` file. For Raspberry Pi 5, ensure you have the appropriate image, as support may vary. Refer to the FreeBSD Wiki for the most recent information on Raspberry Pi 5 support. citeturn0search1

## 4. Preparing the Storage Medium

1. **Insert the MicroSD Card:**
   - Connect the MicroSD card to your computer using an SD card reader.

2. **Write the FreeBSD Image:**
   - **On Unix-like Systems:**
     - Open a terminal and navigate to the directory containing the downloaded image.
     - Use the `dd` command to write the image to the MicroSD card:
       ```sh
       xz -dc FreeBSD-14.0-RELEASE-arm64-aarch64-RPI.img.xz | sudo dd of=/dev/rdiskX bs=64M status=progress
       ```
       Replace `/dev/rdiskX` with the appropriate device identifier for your MicroSD card.
   - **On Windows or macOS:**
     - Utilize balenaEtcher to select the image file and target device, then proceed with flashing.

## 5. Modifying Configuration Files

After writing the image, modify the configuration files to ensure proper booting:

1. **Mount the Boot Partition:**
   - Eject and reinsert the MicroSD card to mount the boot partition automatically.

2. **Edit `config.txt`:**
   - Open the `config.txt` file located in the boot partition.
   - For Raspberry Pi 4, add or modify the following lines to set the HDMI output to 1080p:
     ```sh
     hdmi_group=1
     hdmi_mode=16
     ```
   - For Raspberry Pi 5, additional configurations may be necessary. Refer to the FreeBSD Wiki for detailed instructions. citeturn0search1

3. **Save and Unmount:**
   - Save the changes and safely eject the MicroSD card from your computer.

## 6. Booting the Raspberry Pi

1. **Insert the MicroSD Card:**
   - Place the prepared MicroSD card into the Raspberry Pi's card slot.

2. **Connect Peripherals:**
   - Attach the HDMI monitor, keyboard, mouse, and network cable (if using wired networking).

3. **Power Up:**
   - Connect the power supply to boot the Raspberry Pi.

Upon successful boot, you should see the FreeBSD login prompt on the screen.

## 7. Initial System Configuration

1. **Login:**
   - Use the default `root` user.
   - Set a password for the `root` account:
     ```sh
     passwd
     ```

2. **Create a New User:**
   - Add a regular user account:
     ```sh
     adduser
     ```
   - Follow the prompts to set up the new user.

3. **Configure `sudo`:**
   - Install the `sudo` package:
     ```sh
     pkg install sudo
     ```
   - Add the new user to the `wheel` group to grant administrative privileges:
     ```sh
     pw usermod [username] -G wheel
 