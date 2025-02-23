---
draft: false
title: Using chntpw on Kali Linux
linkTitle: chntpw
translationKey: using-chntpw-on-kali-linux
weight: 710
description: Learn how to use chntpw on Kali Linux to reset Windows passwords by modifying the SAM database. Explore its features, installation, and ethical considerations.
date: 2025-02-23
url: using-chntpw-on-kali-linux
tags:
  - kali tools
categories:
  - Kali linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords: 
featured_image: /images/kalilinux2.webp
---
## Introduction

For penetration testers and cybersecurity professionals, Kali Linux offers a vast array of tools for security auditing and digital forensics. One such tool is `chntpw`, a powerful utility used to reset Windows user passwords by modifying the Security Accounts Manager (SAM) database. This guide will delve into how `chntpw` works, how to install and use it effectively, and some precautions and limitations to consider.

## What is chntpw?

`chntpw` (Change NT Password) is a command-line tool that allows users to reset or remove Windows user passwords by directly editing the Windows registry files. It works by modifying the SAM file, which stores password hashes and user account details. Unlike traditional brute-force attacks, `chntpw` does not attempt to crack the password; instead, it directly removes or resets it.

### Key Features

- Reset or remove user passwords
- Edit user privileges
- Unlock locked accounts
- Modify Windows registry entries
- Works offline by editing system files

## Installing chntpw on Kali Linux

Kali Linux often comes with `chntpw` pre-installed. However, if it is missing or you need to reinstall it, follow these steps:

### Step 1: Update Your System

Before installing any software, it is good practice to update your system to ensure you have the latest packages:

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install chntpw

To install `chntpw`, use the following command:

```bash
sudo apt install chntpw -y
```

Once installed, you can verify its availability by running:

```bash
chntpw -h
```

This should display the help menu with usage instructions.

## Locating the SAM File

Windows stores user authentication details in the SAM file, which is located in the following directory:

```
C:\Windows\System32\config\SAM
```

To modify this file, you need access to the system drive. If you are using `chntpw` from a Kali Linux live USB or dual-boot environment, you must mount the Windows partition.

### Step 1: Identify the Windows Partition

Use the following command to list available partitions:

```bash
lsblk
```

or

```bash
fdisk -l
```

Typically, the Windows partition is labeled `ntfs`. Once identified, mount it:

```bash
sudo mkdir /mnt/windows
sudo mount /dev/sdX# /mnt/windows
```

Replace `/dev/sdX#` with the correct partition identifier.

### Step 2: Navigate to the SAM File

Once the partition is mounted, navigate to the Windows registry directory:

```bash
cd /mnt/windows/Windows/System32/config
```

## Resetting a Windows Password with chntpw

### Step 1: Load the SAM Database

Run `chntpw` with the SAM file as input:

```bash
sudo chntpw -i SAM
```

This opens an interactive session where you can manage user accounts.

### Step 2: Select a User Account

After running the command, a list of user accounts appears. Identify the username you want to modify and enter the corresponding user number.

### Step 3: Reset the Password

Once you select the user, a menu will appear with options such as:

- Clear (remove) user password
- Edit user properties
- Exit without changes

To reset the password, choose the option to clear the password (usually option `1`). This will remove the password without requiring a new one.

### Step 4: Save Changes and Exit

After making changes, save them and exit by pressing `q`, followed by `y` to confirm the modifications.

## Alternative chntpw Commands

Apart from interactive mode, `chntpw` can also be used in a non-interactive manner. For example, to reset a password without opening the interactive shell, use:

```bash
sudo chntpw -u "username" SAM
```

To remove the password of a specific user, use:

```bash
sudo chntpw -u "username" -r SAM
```

## Unlocking a Locked or Disabled Account

If a Windows account is locked due to multiple failed login attempts, `chntpw` can unlock it. Use the following command:

```bash
sudo chntpw -u "username" -E SAM
```

This will reset the lockout flag and re-enable the account.

## Limitations and Precautions

While `chntpw` is a powerful tool, there are some limitations and considerations to keep in mind:

1. **Encrypted Drives:** If Windows uses BitLocker encryption, `chntpw` will not work unless the drive is first decrypted.
2. **User Privileges:** If the user account has additional security policies, simply resetting the password may not grant full access.
3. **Windows Versions:** `chntpw` works on most Windows versions, including Windows 7, 8, 10, and 11, but functionality may vary slightly.
4. **Data Integrity Risks:** Modifying the SAM file improperly can corrupt the Windows registry, leading to system instability.
5. **Ethical Use:** Resetting passwords without permission is illegal and unethical. This tool should only be used for authorized purposes, such as recovering lost access to your own systems.

## Alternative Tools

While `chntpw` is a reliable choice, other tools offer similar functionality:

- **Offline NT Password & Registry Editor** – A bootable utility that includes `chntpw`
- **John the Ripper** – A password cracking tool that can be used to recover NTLM hashes
- **Lazesoft Recovery Suite** – A GUI-based tool for password recovery

## Conclusion

`chntpw` is an essential tool in any cybersecurity toolkit for resetting Windows passwords and managing user accounts. Its ability to bypass authentication by modifying the SAM file makes it a powerful option for system recovery. However, ethical considerations must always be a priority when using such tools.

By following this guide, you now have a solid understanding of how to install, use, and troubleshoot `chntpw` on Kali Linux. Whether you are a security researcher, system administrator, or ethical hacker, knowing how to use `chntpw` can be invaluable in various recovery and security testing scenarios.

If you found this guide helpful, feel free to explore more security tools in Kali Linux, and remember to use them responsibly!
