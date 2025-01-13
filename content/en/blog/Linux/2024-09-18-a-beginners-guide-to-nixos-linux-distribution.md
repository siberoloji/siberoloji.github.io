---
draft: false

title:  'A Beginner’s Guide to NixOS Linux Distribution'
date: '2024-09-18T23:51:38+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'While it’s not as widely known as some other distros, NixOS Linux offers an innovative way to manage your system with a focus on reproducibility and isolation. ' 
 
url:  /a-beginners-guide-to-nixos-linux-distribution/ 
featured_image: /images/nixoslinuxillustration1.webp
categories:
    - 'Linux Distributions'
tags:
    - linux
    - 'linux distributions'
    - 'linux distros'
    - nixos
---
When it comes to Linux distributions, the options are numerous. Whether you’re looking for something user-friendly like Ubuntu or highly customizable like Arch, there’s a flavor for every type of user. However, there’s a Linux distribution that stands out due to its unique approach to package management and system configuration—**NixOS**. While it’s not as widely known as some other distros, NixOS Linux offers an innovative way to manage your system with a focus on reproducibility and isolation. In this blog post, we’ll explore NixOS and explain why beginners might find it interesting, despite its initially steep learning curve.

## What is NixOS?

NixOS is a **Linux distribution** that is built around the **Nix package manager**, which uses a purely functional approach to package management. Unlike most other Linux distributions that rely on traditional package managers like `apt` (Debian/Ubuntu) or `pacman` (Arch), NixOS takes a fundamentally different approach.

The core philosophy behind NixOS is that the entire system configuration is **declarative**. This means that you describe the state of your system in a single configuration file, and NixOS will ensure that your system matches that description. This brings several advantages, including the ability to easily **roll back changes**, maintain reproducibility across machines, and isolate dependencies.

Key Features of NixOS

Before diving into how to get started with NixOS, let’s look at some of its standout features:
* **Declarative System Configuration**: Instead of manually installing packages and tweaking configurations, you describe your system in a file (usually `/etc/nixos/configuration.nix`). This file contains everything from installed packages to system services and user settings.

* **Reproducibility**: Because your entire system is described in a single configuration file, you can easily recreate the same environment on different machines. This is particularly useful for developers who want consistent environments across multiple systems.

* **Atomic Upgrades and Rollbacks**: NixOS allows for atomic system upgrades, meaning that changes are applied all at once. If something goes wrong, you can roll back to the previous system state with ease, ensuring a stable system at all times.

* **Isolation of Packages**: Each package in NixOS is installed in isolation, reducing the risk of conflicts between different versions of libraries or software.

* **Functional Package Management**: The Nix package manager builds packages in a purely functional way, ensuring that they don’t interfere with each other. This prevents issues like "dependency hell" that are common in other distributions.

* **Sandboxed Builds**: NixOS builds all packages in an isolated environment, ensuring that the build process is independent of the state of the system, leading to more reliable builds.
## Why Should Beginners Consider NixOS?

At first glance, NixOS might not seem like the most beginner-friendly distribution. Its unconventional approach can be intimidating, especially for those who are new to Linux. However, NixOS offers several benefits that make it worth considering, even for beginners:
* **Learning Through Experimentation**: NixOS’s declarative nature forces you to think about how your system is configured, helping you learn the inner workings of Linux and package management in the process. While there’s a learning curve, the structured nature of NixOS helps you avoid the chaos of misconfigured systems.

* **Easily Reversible Changes**: One of the biggest challenges for beginners is dealing with a system that becomes unstable due to package conflicts or bad configurations. With NixOS, every change is reversible, which provides a safety net for experimentation. If something goes wrong, you can roll back to a previous configuration.

* **Consistent Environments**: For users who want to learn Linux while also exploring development environments, NixOS offers a reliable way to maintain consistent systems. You can easily replicate the same setup across different machines, which is great for development, testing, and learning.

* **Comprehensive Documentation**: NixOS comes with a well-documented <a href="https://nixos.org/manual/">manual</a>, which guides you through everything from installation to advanced configurations. The strong community support and active development make it easier for newcomers to find help when needed.

* **Flexible for Different Use Cases**: Whether you’re using NixOS as a desktop system, server, or even for development environments, its flexible nature allows you to tailor it to your needs.
## Getting Started with NixOS

Here’s a step-by-step guide on how to get started with NixOS, from downloading the ISO to configuring your system.

Step 1: Downloading the NixOS ISO

The first step is to download the NixOS ISO image. NixOS provides two main editions:
* **NixOS Graphical ISO**: This comes with a desktop environment like GNOME or KDE, making it easier for beginners who want to jump straight into a graphical user interface.

* **NixOS Minimal ISO**: This is a command-line-only installation that’s best suited for advanced users or those who want to build their system from scratch.
You can download the appropriate version from the <a href="https://nixos.org/download.html">official NixOS website</a>. For beginners, it’s recommended to start with the **Graphical ISO** for a smoother experience.

Step 2: Creating a Bootable USB

Once you’ve downloaded the ISO, you’ll need to create a bootable USB drive. There are several tools available for this task:
* **Rufus** (Windows)

* **Etcher** (Windows, macOS, Linux)

* **dd** (Linux command-line tool)
Choose your tool and create the bootable USB by selecting the NixOS ISO file and the target USB drive.

Step 3: Booting and Installing NixOS
* **Boot from USB**: Insert the bootable USB into your machine and restart it. Enter your BIOS/UEFI settings (usually by pressing F2, F12, or Delete during startup) and set the USB drive as the primary boot device.

* **Choose Installation Mode**: If you’re using the graphical ISO, you’ll be greeted by a desktop environment where you can open a terminal and start the installation. For the minimal ISO, you’ll be dropped into a command-line interface.

* **Partitioning the Disk**: Before you can install NixOS, you’ll need to partition your disk. You can use tools like `fdisk`, `cfdisk`, or `parted` to create the necessary partitions (typically, a boot partition, root partition, and swap).

* **Mount the Partitions**: Once the partitions are created, mount them to the appropriate locations:

```cpp
   mount /dev/sda2 /mnt
   mkdir /mnt/boot
   mount /dev/sda1 /mnt/boot```
<!-- wp:list {"ordered":true,"start":5} -->
<ol start="5" class="wp-block-list">* **Generate the Configuration File**: NixOS uses a configuration file to define your system. Generate this file by running:

```cpp
   nixos-generate-config --root /mnt```

This will create two files: `/mnt/etc/nixos/configuration.nix` (where you define your system) and `/mnt/etc/nixos/hardware-configuration.nix` (which is auto-generated based on your hardware).
<!-- wp:list {"ordered":true,"start":6} -->
<ol start="6" class="wp-block-list">* **Edit the Configuration**: Open `/mnt/etc/nixos/configuration.nix` in your favorite text editor and make any necessary changes. For example, you can define which desktop environment you want to install or which services to enable. The file is well-commented, so it’s easy to understand what each section does. For example, to install GNOME, add this line:

```cpp
   services.xserver.desktopManager.gnome.enable = true;
```
<!-- wp:list {"ordered":true,"start":7} -->
<ol start="7" class="wp-block-list">* **Install NixOS**: Once the configuration is ready, run the installation command:

```cpp
   nixos-install
```

This will install NixOS based on the configuration file you edited.
<!-- wp:list {"ordered":true,"start":8} -->
<ol start="8" class="wp-block-list">* **Set a Root Password**: During installation, you’ll be prompted to set a root password for your system. Make sure to set a strong password.

* **Reboot**: After the installation is complete, reboot your system by running:

```cpp
   reboot```

Don’t forget to remove the USB drive during the reboot to avoid booting back into the installer.

Step 4: Post-Installation Setup

After installation, your system should boot into the desktop environment or command-line interface, depending on your configuration. From here, you can start using your new NixOS system, but there are a few things you might want to do to finalize your setup:
* **Update Your System**: NixOS uses channels to provide updates. To update your system, first switch to the stable channel:

```cpp
  sudo nix-channel --add https://nixos.org/channels/nixos-21.11 nixpkgs
  sudo nix-channel --update```

Then, run the following command to apply updates:
```cpp
  sudo nixos-rebuild switch
```
* **Install Additional Software**: You can install software using the `nix-env` command. For example, to install Firefox:

```cpp
  nix-env -iA nixpkgs.firefox```
* **Experiment with the Configuration File**: One of the joys of NixOS is that you can continue modifying your system configuration through the `configuration.nix` file. As you get more comfortable, you can add new services, software, and customizations.
## Conclusion

NixOS offers a unique approach to Linux that can seem daunting at first, but its declarative configuration and rollback capabilities make it an excellent choice for beginners who want to

learn more about system management and package isolation. The ability to reproduce your environment on different machines, combined with the ease of undoing changes, provides a safe environment for learning. By following this guide, you can get started with NixOS and begin exploring its powerful features.

<a href="https://www.siberoloji.com/a-list-of-popular-linux-distributions/" target="_blank" rel="noopener" title="">Linux Distributions List</a>
