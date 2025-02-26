---
draft: false
title: Installing FreeBSD in UEFI Mode with Secure Boot
linkTitle: Installing FreeBSD in UEFI
translationKey: installing-freebsd-in-uefi-mode-with-secure-boot
description: This guide provides a step-by-step walkthrough for installing FreeBSD in UEFI mode with Secure Boot, enhancing system security and reliability.
url: installing-freebsd-in-uefi-mode-with-secure-boot
date: 2025-02-26
weight: 20
keywords:
  - FreeBSD
  - UEFI mode installation
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Installing FreeBSD in UEFI mode with Secure Boot involves several steps to ensure a secure and functional system. This guide provides a comprehensive walkthrough, from understanding the prerequisites to configuring Secure Boot on your FreeBSD installation.

## **Prerequisites**

Before beginning the installation, ensure you have the following:

- **UEFI-Compatible Hardware**: A system with UEFI firmware is essential.
- **FreeBSD Installation Media**: Download the latest FreeBSD release from the official website and create a bootable USB drive.
- **Understanding of Secure Boot**: Familiarize yourself with Secure Boot, a UEFI feature that ensures only signed and trusted software is executed during the boot process.

## **Step 1: Prepare the Installation Media**

1. **Download FreeBSD**: Obtain the latest FreeBSD ISO image suitable for your architecture.
2. **Create a Bootable USB Drive**: Use tools like `dd` on Unix-like systems or Rufus on Windows to write the ISO image to a USB drive.

## **Step 2: Configure UEFI Firmware Settings**

1. **Access UEFI Settings**: Restart your computer and enter the UEFI setup (commonly accessed by pressing keys like F2, F10, or Delete during startup).
2. **Disable Secure Boot Temporarily**: Navigate to the Secure Boot settings and disable it. This allows the initial installation of FreeBSD.
3. **Enable UEFI Boot Mode**: Ensure that the firmware is set to boot in UEFI mode rather than Legacy/BIOS mode.

## **Step 3: Install FreeBSD**

1. **Boot from Installation Media**: Insert the bootable USB drive and select it as the boot device in the UEFI boot menu.
2. **Proceed with Installation**: Follow the FreeBSD installer prompts to set up your system. When partitioning:
   - **Create an EFI System Partition (ESP)**: Allocate a partition (typically 200 MB) and format it as FAT32.
   - **Mount the ESP**: Mount this partition to `/boot/efi` during installation.
3. **Complete Installation**: Finish the installation process and reboot the system.

## **Step 4: Configure Secure Boot on FreeBSD**

After installing FreeBSD, you'll need to set up Secure Boot:

1. **Install Required Packages**: Boot into your new FreeBSD system and install the `uefisign` utility, which is used for signing EFI binaries.
2. **Generate Secure Boot Keys**:
   - **Create a Private Key and Certificate**: Use OpenSSL to generate a private key and a corresponding X.509 certificate.
   - **Enroll the Key**: Access your UEFI firmware settings and enroll the generated public key. This process varies by manufacturer; refer to your motherboard's manual for specific instructions.
3. **Sign the FreeBSD Bootloader**:
   - **Locate the Bootloader**: The FreeBSD UEFI bootloader is typically located at `/boot/loader.efi`.
   - **Sign the Bootloader**: Use the `uefisign` utility to sign `loader.efi` with your private key.
   - **Copy Signed Bootloader to ESP**: Place the signed `loader.efi` into the EFI System Partition, usually under `/boot/efi/EFI/FreeBSD/`.
4. **Re-enable Secure Boot**: After signing and placing the bootloader:
   - **Access UEFI Settings**: Restart your system and enter the UEFI setup.
   - **Enable Secure Boot**: Navigate to the Secure Boot settings and enable it.
5. **Reboot the System**: Exit the UEFI setup and allow the system to boot. If configured correctly, FreeBSD will boot successfully with Secure Boot enabled.

## **Troubleshooting Tips**

- **Boot Failures**: If the system fails to boot after enabling Secure Boot, ensure that the bootloader is correctly signed and that the public key is properly enrolled in the UEFI firmware.
- **UEFI Firmware Variations**: UEFI interfaces can differ between manufacturers. Consult your hardware's documentation for specific instructions related to Secure Boot and key management.

## **Conclusion**

Setting up FreeBSD with UEFI and Secure Boot enhances your system's security by ensuring that only trusted software is executed during boot. While the process involves several detailed steps, following this guide will help you achieve a secure and reliable FreeBSD installation.

## **Frequently Asked Questions**

1. **Can I install FreeBSD in UEFI mode without Secure Boot?**
   - Yes, FreeBSD can be installed in UEFI mode without enabling Secure Boot. Secure Boot is an optional security feature.

2. **Is Secure Boot supported by default in FreeBSD?**
   - As of the latest releases, FreeBSD supports Secure Boot, but it requires manual configuration, including signing the bootloader and enrolling keys.

3. **What tools are needed to sign the FreeBSD bootloader?**
   - The `uefisign` utility is used to sign EFI binaries in FreeBSD. Additionally, OpenSSL is used to generate keys and certificates.

4. **Do I need to disable Secure Boot to install FreeBSD?**
   - Initially, it's recommended to disable Secure Boot during the installation process. After configuring and signing the bootloader, Secure Boot can be re-enabled.

5. **Where can I find more information on FreeBSD and Secure Boot?**
   - The [FreeBSD UEFI Secure Boot](https://freebsdfoundation.org/freebsd-uefi-secure-boot/) page provides detailed information and guidance.

6. **What should I do if my system doesn't boot after enabling Secure Boot?**
   - Double-check that the bootloader is correctly signed and that the public key is properly enrolled in the UEFI firmware. If issues persist, consult your hardware's documentation or seek assistance from the FreeBSD community.
