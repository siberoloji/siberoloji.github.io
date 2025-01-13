---
draft: false

title:  'Void Linux: Take Control Your Distribution'
date: '2024-09-18T23:44:06+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'While Void Linux might seem intimidating for beginners, it offers several advantages, such as being lightweight, fast, and designed to give you a lean, customized system.' 
 
url:  /a-beginners-guide-to-void-linux-distribution/ 
featured_image: /images/voidlinuxillustration1.webp
categories:
    - 'Linux Distributions'
tags:
    - linux
    - 'linux distributions'
    - 'linux distros'
    - 'void linux'
---
Linux distributions have come a long way in offering a range of options to suit different user needs. Among these, Void Linux stands out as a unique, independent, and flexible distribution, often favored by users who want more control over their system. While Void Linux might seem intimidating for beginners, it offers several advantages, such as being lightweight, fast, and designed to give you a lean, customized system. In this article, we will cover what Void Linux is, its features, and how beginners can get started with it.

## What is Void Linux?

Void Linux is an independent, general-purpose Linux distribution that is entirely developed from scratch, meaning it doesn’t derive from other distributions like Ubuntu, Debian, or Arch. It was created by Juan Romero Pardines in 2008, originally as a personal project, and has since gained traction within the Linux community.

Void is known for its minimalist design and for providing users with a lightweight, customizable system. The philosophy behind Void Linux is to give users as much control over their operating system as possible, which makes it popular among advanced users, but also a great learning platform for beginners who want to deepen their knowledge of Linux.

Key Features of Void Linux

Before diving into how you can get started with Void Linux, let’s look at some key features that make it unique:
* **Independent Development**: Unlike many popular distributions, Void Linux is not based on any other Linux distribution. It was built from the ground up, making it unique in its architecture, package management system, and approach to stability.

* **Runit as Init System**: One of the standout features of Void Linux is its use of the **runit** init system, rather than the more common systemd used by many other distributions. Runit is a lightweight, fast, and easy-to-understand init system, which is responsible for initializing your system’s processes.

* **XBPS (X Binary Package System)**: Void Linux uses its own package manager, XBPS, which is fast and flexible. It allows users to install, update, and manage packages in an efficient way. This is different from more common package managers like `apt` (Debian/Ubuntu) or `pacman` (Arch).

* **Rolling Release**: Void Linux follows a rolling release model, meaning that once you install it, you will continue to receive updates for your system indefinitely, without needing to reinstall or upgrade major versions.

* **Multilib Support**: Void Linux supports both 32-bit and 64-bit systems, as well as ARM architecture. This means it can run on a wide range of devices, from older hardware to modern desktop systems and even embedded devices.

* **Customizable and Lightweight**: Void comes with minimal bloat, giving you the freedom to install only the software you need. This makes it lightweight and customizable, perfect for users who want full control over their system configuration.
## Why Should Beginners Consider Void Linux?

At first glance, Void Linux might not seem like the best choice for beginners due to its minimalism and focus on user control. However, there are several reasons why it can be a great learning experience for those who are new to Linux:
* **Learn by Doing**: Void Linux encourages you to learn how Linux works by giving you the tools to configure and customize your system. The learning curve might be steeper compared to beginner-friendly distributions like Ubuntu, but you’ll gain a deeper understanding of the inner workings of Linux.

* **No Bloatware**: Many beginner-friendly distributions come with pre-installed software that you may never use. Void Linux, on the other hand, comes with a bare minimum installation, allowing you to install only what you need. This gives you a streamlined and fast system right from the start.

* **Stable and Fast**: Void’s use of the runit init system and XBPS package manager makes it incredibly fast and responsive. The lack of unnecessary background processes and services means that your system is lightweight and efficient.

* **Rolling Release Model**: For beginners, the rolling release model can be appealing because you won’t need to worry about upgrading to a new version of the operating system every six months or a year. As long as you keep your system updated, you’ll always be running the latest version of Void Linux.

* **Good Documentation and Community Support**: Void Linux has a well-maintained <a href="https://docs.voidlinux.org/">official documentation</a>, which covers installation, package management, configuration, and troubleshooting. Additionally, Void has an active community that is willing to help newcomers, making it a more approachable distribution for beginners.
## Getting Started with Void Linux

Here’s a step-by-step guide to help you get started with Void Linux, from downloading the ISO to performing a basic setup.

Step 1: Downloading Void Linux

The first step is to download the Void Linux ISO image. Void offers different flavors, including options for both **glibc** (the GNU C library) and **musl** (an alternative lightweight C library). For beginners, it’s recommended to start with the glibc version as it is more widely compatible with existing Linux software.

You can download Void Linux from the <a href="https://voidlinux.org/download/">official website</a>, where you’ll find options for different architectures (x86, x86_64, ARM) and desktop environments such as Xfce, LXQt, and Cinnamon. If you prefer a more minimal installation, you can opt for the **base** image, which installs the bare minimum system and lets you build it up from there.

Step 2: Creating a Bootable USB

Once you’ve downloaded the ISO, the next step is to create a bootable USB drive. Tools like **Rufus** (for Windows) or **Etcher** (for Linux and macOS) can be used to create the bootable media. Select the Void Linux ISO, choose the USB drive, and let the software handle the rest.

Step 3: Installing Void Linux
* **Booting from USB**: Insert the USB into your system and reboot. Enter your BIOS or UEFI settings (usually by pressing F2, F12, or Delete during startup) and select the USB drive as the boot device.

* **Partitioning the Disk**: The Void Linux installer is a text-based interface, which might seem intimidating at first, but it’s quite simple to follow. You’ll need to partition your hard drive if you want to dual boot or do a clean installation. Tools like `fdisk` and `cfdisk` are available to help with this process.

* **Select Bootloader**: Void offers options for bootloaders like GRUB, which is the most common, or you can opt to install your own.

* **Install Base System**: The installer will allow you to install the base system. If you’re using a flavor with a desktop environment, it will install that as well.

* **Setting up Users**: After the installation, you’ll be prompted to set up your user account and password. Make sure to set a strong root password and create a user account for daily use.
Step 4: Post-Installation Setup

Once Void Linux is installed, you’ll need to set up a few things before getting started:
* **Network Configuration**: If you have Ethernet, Void should detect it automatically. For Wi-Fi, you may need to install and configure packages like **wpa_supplicant** and **NetworkManager** to get connected.

* **Installing Software**: Void Linux doesn’t come pre-installed with a lot of software, so you’ll need to install your preferred applications using XBPS. For example, to install Firefox, you would run:

```cpp
  sudo xbps-install -S firefox```
* **Desktop Environment**: If you installed the base version, you’ll need to set up a desktop environment or window manager. Popular options include Xfce, LXQt, and i3. To install Xfce, for example:

```cpp
  sudo xbps-install -S xfce4 xfce4-goodies
```
* **Updating Your System**: To keep your system up-to-date, run the following command periodically:

```cpp
  sudo xbps-install -Su```

## Conclusion

Void Linux might seem daunting for beginners at first glance, but it offers a rewarding learning experience for those who want to dive deeper into Linux. With its lightweight design, fast performance, and rolling release model, Void Linux gives you a flexible system that can be tailored to your needs. By following this guide, you can get started with Void Linux and begin exploring its many features.
