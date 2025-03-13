---
draft: true
title: How to Install Applications from Flatpak on Linux Mint
linkTitle: Install applications from Flatpak
translationKey: how-to-install-applications-from-flatpak-on-linux-mint
description: How to install applications from Flatpak on Linux Mint using various methods, including the Software Manager, GDebi, DPKG, and APT.
url: how-to-install-applications-from-flatpak-on-linux-mint
weight: 70
date: 2025-02-05
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Flatpak
  - Software Manager
  - GDebi
  - DPKG
  - APT
featured_image: /images/linuxmint1.webp
---
## Introduction

Linux Mint is renowned for its user-friendly interface, stability, and ease of use, making it a popular choice among both beginners and experienced Linux users. One of the key aspects of managing any Linux system is installing and managing software. While Linux Mint comes with its own Software Manager and APT package manager, there's another versatile option: Flatpak.

Flatpak is a universal package management system that allows you to install and run applications in a sandboxed environment. This means applications are isolated from the rest of the system, enhancing security and compatibility across different Linux distributions. For Linux Mint users, integrating Flatpak opens up access to a broader range of applications, often with the latest updates that may not be available in the default repositories.

In this guide, we'll walk you through the process of installing applications from Flatpak on Linux Mint, covering everything from setup to troubleshooting common issues.

## What is Flatpak?

Flatpak is a software utility designed to distribute and run applications in isolated environments, known as sandboxes. Unlike traditional package managers like APT (used in Debian-based systems like Ubuntu and Linux Mint) or Snap (developed by Canonical), Flatpak is distribution-agnostic. This means you can install and run the same Flatpak application on different Linux distributions without modification.

### Key Features of Flatpak

- **Sandboxing:** Applications run in an isolated environment, reducing security risks.
- **Cross-Distribution Compatibility:** Install the same application on Fedora, Ubuntu, Arch, and Linux Mint without changes.
- **Latest Software Versions:** Developers can push updates directly to users, bypassing distribution-specific repositories.
- **Central Repository (Flathub):** A vast library of applications maintained in one place.

Flatpak's design focuses on security, simplicity, and accessibility, making it an excellent tool for Linux Mint users who want up-to-date applications without compromising system stability.

## Why Use Flatpak on Linux Mint?

While Linux Mint's Software Manager and APT repositories cover most software needs, Flatpak offers several advantages:

1. **Access to Latest Versions:** Some applications in APT repositories lag behind the latest releases. Flatpak often provides the most current versions directly from developers.
2. **Enhanced Security:** Applications are sandboxed, minimizing the risk of affecting other system components.
3. **Broader Application Availability:** Some applications are only available on Flathub, the primary Flatpak repository.
4. **Consistency Across Distros:** If you use multiple Linux distributions, Flatpak provides a consistent method for installing and managing applications.

## Prerequisites: Preparing Linux Mint for Flatpak

Before you start installing applications via Flatpak, ensure your system is ready:

1. **Update Your System:**

   ```bash
   sudo apt update && sudo apt upgrade
   ```

2. **Check if Flatpak is Installed:**
   Linux Mint 18.3 and later come with Flatpak pre-installed. To verify:

   ```bash
   flatpak --version
   ```

   If Flatpak is installed, you'll see the version number.

3. **Install Flatpak (if not present):**

   ```bash
   sudo apt install flatpak
   ```

4. **Integrate Flatpak with Software Manager:**
   To enable Flatpak support in the Linux Mint Software Manager:

   ```bash
   sudo apt install gnome-software-plugin-flatpak
   ```

## Step-by-Step Guide to Installing Applications via Flatpak

### Step 1: Installing Flatpak (if necessary)

If Flatpak isn't already installed, use the command:

```bash
sudo apt install flatpak
```

Verify the installation:

```bash
flatpak --version
```

### Step 2: Adding the Flathub Repository

Flathub is the main repository for Flatpak applications. To add it:

```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

This command ensures access to a wide range of applications.

### Step 3: Searching for Applications

You can search for applications using the terminal:

```bash
flatpak search <application-name>
```

For example, to search for VLC:

```bash
flatpak search vlc
```

Alternatively, use the Software Manager, where Flatpak apps are now integrated.

### Step 4: Installing Applications

To install an application from Flathub:

```bash
flatpak install flathub <application-ID>
```

Example:

```bash
flatpak install flathub org.videolan.VLC
```

Follow the prompts to complete the installation.

### Step 5: Running Flatpak Applications

After installation, run the application using:

```bash
flatpak run <application-ID>
```

Example:

```bash
flatpak run org.videolan.VLC
```

Alternatively, find the application in your system's application menu.

## Managing Flatpak Applications

### Updating Flatpak Applications

To update all installed Flatpak apps:

```bash
flatpak update
```

To update a specific application:

```bash
flatpak update <application-ID>
```

### Listing Installed Flatpak Applications

To see all Flatpak applications on your system:

```bash
flatpak list
```

### Removing Flatpak Applications

To uninstall an application:

```bash
flatpak uninstall <application-ID>
```

Example:

```bash
flatpak uninstall org.videolan.VLC
```

## Troubleshooting Common Issues

- **Flatpak Command Not Found:** Ensure Flatpak is installed. Reinstall if necessary:

  ```bash
  sudo apt install flatpak
  ```

- **Permission Issues:** Some apps may require additional permissions. Use Flatseal, a GUI for managing Flatpak permissions:

  ```bash
  flatpak install flathub com.github.tchx84.Flatseal
  ```

- **Application Won’t Launch:** Try running the app from the terminal to view error messages:

  ```bash
  flatpak run <application-ID>
  ```

## Conclusion

Flatpak provides Linux Mint users with a powerful, flexible way to install and manage applications. With its emphasis on security, up-to-date software, and cross-distribution compatibility, Flatpak is an excellent complement to Mint's native package management tools.

By following this guide, you should now be able to set up Flatpak, install applications, and manage them effectively. Explore Flathub to discover a vast library of applications that can enhance your Linux Mint experience.
