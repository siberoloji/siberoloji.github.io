---
draft: false
title: "AlmaLinux 9: How to Install with Prepared Installation Disk"
date: 2024-10-02T21:31:19+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-install-with-prepared-installation-disk/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - Installation
  - how-to guides
  - linux how-to
---


AlmaLinux has quickly become a popular choice for those seeking a stable, enterprise-grade Linux distribution. As a 1:1 binary compatible fork of Red Hat Enterprise Linux (RHEL), it offers a robust and reliable platform for various applications. In this comprehensive guide, we'll walk you through the process of installing AlmaLinux 9 using a prepared installation disk.



## Prerequisites



Before we begin, ensure you have the following:


* A computer with at least 2GB of RAM (4GB recommended for GUI installations)

* 20GB of free disk space (more is recommended for production use)

* A prepared AlmaLinux 9 installation disk (USB drive or DVD)

* Internet connection (optional, but recommended for updates during installation)




## Step 1: Obtaining the Installation Media



If you haven't already prepared your installation media, you'll need to:


* Visit the official AlmaLinux website (https://almalinux.org/)

* Navigate to the Downloads section

* Choose AlmaLinux 9 and select the appropriate ISO file (usually the DVD ISO)

* Download the ISO file

* Create a bootable USB drive or burn the ISO to a DVD




There are various tools available for creating bootable USB drives, such as Rufus for Windows or dd for Linux systems.



## Step 2: Booting from the Installation Media


* Insert your prepared installation disk (USB or DVD) into your computer

* Restart your computer

* Access your computer's boot menu (usually by pressing F12, F2, or Del during startup)

* Select the installation media as the boot device

* When the AlmaLinux boot menu appears, select "Install AlmaLinux 9"




## Step 3: Language Selection



The first screen you'll encounter is the language selection. Choose your preferred language for the installation process and click "Continue."



## Step 4: Installation Summary



You'll now see the Installation Summary screen, which provides an overview of various installation options. We'll go through each section:



Localization


* **Keyboard**: Set your keyboard layout

* **Language Support**: Add additional language support if needed

* **Time &amp; Date**: Set your time zone and configure NTP (Network Time Protocol) if desired




Software


* **Installation Source**: This should be set to "Local media" by default

* **Software Selection**: Choose your base environment (e.g., Server with GUI, Minimal Install, Workstation)




System


* **Installation Destination**: Select the drive where you want to install AlmaLinux

* **KDUMP**: Enable or disable the kernel crash dumping mechanism

* **Network &amp; Host Name**: Configure network settings and set your system's hostname




User Settings


* **Root Password**: Set a strong password for the root account

* **User Creation**: Create a non-root user account (recommended)




## Step 5: Installation Destination



Click on "Installation Destination" to configure your disk partitioning:


* Select the disk(s) you want to use for installation

* Choose between "Automatic" or "Custom" partitioning



* For most users, "Automatic" is sufficient

* If you need specific partitioning schemes, select "Custom"



* If using "Custom," create the following partitions at minimum:



* /boot (1GB)

* / (root, allocate remaining space)

* swap (typically 1.5x your RAM size, up to 8GB)



* Click "Done" when finished




## Step 6: Software Selection



Click on "Software Selection" to choose your desired installation type:


* Select a base environment (e.g., "Server with GUI" or "Minimal Install")

* Choose additional software packages if needed

* Click "Done" to confirm your selection




## Step 7: Network &amp; Host Name



Configure your network settings:


* Click on "Network &amp; Host Name"

* Set your desired hostname

* Toggle the network adapter to "ON" if you want to configure it during installation

* Configure IPv4/IPv6 settings as needed

* Click "Done" to save your settings




## Step 8: Begin Installation



Once you've configured all necessary options:


* Review the Installation Summary screen

* Click "Begin Installation" to start the process




## Step 9: User Settings



While the installation is running:


* Set the root password when prompted

* Create a non-root user account (recommended for daily use)




## Step 10: Complete Installation


* Wait for the installation to complete (this may take several minutes)

* Click "Reboot" when prompted

* Remove the installation media before the system restarts




## Post-Installation Steps



After your system reboots:


* Log in using your created user account

* Open a terminal and run `sudo dnf update` to ensure your system is up-to-date

* Install any additional software you need using `sudo dnf install <package-name>`

* Configure your firewall settings using `firewall-cmd` if necessary

* Set up any additional users or groups as needed




## Troubleshooting Common Issues



Here are some common issues you might encounter during installation and how to resolve them:


* **Boot media not recognized**: Ensure your BIOS/UEFI settings allow booting from USB/DVD and that the installation media is properly created.

* **Network not detected**: Check your network cable connection or Wi-Fi adapter. You may need to load additional drivers during installation.

* **Partitioning errors**: If using custom partitioning, ensure you've allocated enough space for each partition and that you've included all necessary mount points.

* **Package installation failures**: This could be due to corrupt installation media. Try re-downloading the ISO and creating a new installation disk.




## Conclusion



Congratulations! You've successfully installed AlmaLinux 9 on your system. AlmaLinux offers a stable, secure, and free enterprise-grade operating system that's perfect for servers, workstations, and development environments.



Remember to keep your system updated regularly using `sudo dnf update` and explore the wealth of software available in the AlmaLinux repositories. If you encounter any issues or need community support, don't hesitate to visit the official AlmaLinux forums or documentation.



AlmaLinux 9 provides a solid foundation for your computing needs, whether you're running a web server, developing software, or using it as a daily driver. Enjoy your new AlmaLinux 9 installation!
