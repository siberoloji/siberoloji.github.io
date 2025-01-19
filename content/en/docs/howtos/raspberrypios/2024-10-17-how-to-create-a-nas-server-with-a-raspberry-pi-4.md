---
draft: false
title: How to Create a NAS Server with a Raspberry Pi 4
linkTitle: Create NAS Server
translationKey: how-to-create-a-nas-server-with-a-raspberry-pi-4
weight: 10
description: In this detailed guide, we’ll walk you through the process of setting up a NAS server using a Raspberry Pi 4.
date: 2024-10-17T16:48:44+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /how-to-create-a-nas-server-with-a-raspberry-pi-4/
featured_image: /images/raspberrypi.webp
categories:
    - Raspberry Pi
tags:
    - raspberry pi
---
In today’s digital world, the need for centralized storage solutions is growing. Whether you want to store media files, backups, or documents, a Network Attached Storage (NAS) server offers a convenient way to access files across devices on a local network or even remotely. While commercial NAS devices are available, they can be expensive. Fortunately, with a Raspberry Pi 4, you can build your own budget-friendly NAS server.

In this detailed guide, we’ll walk you through the process of setting up a NAS server using a Raspberry Pi 4. By the end, you’ll have a fully functional NAS that can be accessed from various devices in your home or office.

What is a NAS Server?

A Network Attached Storage (NAS) server is a specialized device connected to a network, providing centralized data storage and file sharing across devices. With a NAS, multiple users can access and share data seamlessly over the network. NAS servers are commonly used for:

* **Media streaming** (movies, music, photos)

* **Backup storage** for computers and mobile devices

* **File sharing** within a home or office network

* **Remote access** to files from anywhere in the world
Creating a NAS server with a Raspberry Pi 4 is cost-effective, energy-efficient, and customizable, making it ideal for personal use or small-scale business environments.

Why Raspberry Pi 4?

The Raspberry Pi 4 is an excellent candidate for a NAS server due to its improved hardware compared to earlier models. Key features include:

* **Quad-core 64-bit processor**: Provides better performance for handling network traffic and file management.

* **Up to 8GB RAM**: Ample memory for managing multiple users and file operations.

* **Gigabit Ethernet port**: Enables fast and stable file transfer across your local network.

* **USB 3.0 ports**: Essential for connecting external storage devices such as hard drives or SSDs, providing high-speed data access.
The Raspberry Pi 4 also runs on low power, which is ideal for a NAS server that might need to stay online 24/7.

What You Will Need

Before starting, make sure you have the following components ready:

* **Raspberry Pi 4** (4GB or 8GB model recommended for better performance)

* **MicroSD card** (16GB or more) for the Raspberry Pi’s operating system

* **External USB hard drive or SSD** (to store your files)

* **USB 3.0 powered hub** (optional but recommended if using multiple hard drives)

* **Raspberry Pi 4 power supply** (official or high-quality third-party)

* **Ethernet cable** to connect the Pi to your router

* **Keyboard, mouse, and monitor** for initial setup (optional if using headless configuration)

* **Raspberry Pi OS** (Debian-based, previously known as Raspbian)
Now, let's proceed with the step-by-step process to create your NAS server.

Step 1: Set Up Raspberry Pi 4

#### 1.1 Install Raspberry Pi OS

* Download the latest **Raspberry Pi OS** from the official Raspberry Pi website.

* Use software like **Raspberry Pi Imager** or **Balena Etcher** to write the OS image to your MicroSD card.

* Insert the MicroSD card into your Raspberry Pi 4 and power it on. If using a keyboard, mouse, and monitor, proceed with the standard installation. If setting up headless (without peripherals), you can enable **SSH** access before inserting the SD card by creating an empty file named `ssh` in the boot partition of the SD card.

#### 1.2 Update and Upgrade

Once Raspberry Pi OS is installed and running, it’s important to update your system. Open a terminal window and enter the following commands:

```bash
sudo apt update
sudo apt upgrade
```

This ensures that you have the latest software updates and security patches.

Step 2: Install and Configure Samba for File Sharing

We will use **Samba** to enable file sharing across different devices. Samba is a popular software suite that allows file and print sharing between Linux and Windows devices.

#### 2.1 Install Samba

To install Samba, run the following command:

```bash
sudo apt install samba samba-common-bin
```

#### 2.2 Create a Directory for File Storage

Create a folder where you will store your shared files. For example, let’s create a folder named `shared` in the `/home/pi` directory:

```bash
mkdir /home/pi/shared
```

#### 2.3 Configure Samba

Next, we need to edit Samba’s configuration file to specify the settings for file sharing. Open the configuration file using a text editor:

```bash
sudo nano /etc/samba/smb.conf
```

Scroll to the bottom of the file and add the following configuration:

```bash
[Shared]
   comment = Shared Folder
   path = /home/pi/shared
   browseable = yes
   writeable = yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   public = no
```

This configuration will create a shared folder that’s accessible over the network. The permissions allow read and write access to the folder.

#### 2.4 Create Samba User

To secure your NAS server, create a Samba user who can access the shared files. Use the following command to add a user (replace `pi` with your username if necessary):

```bash
sudo smbpasswd -a pi
```

You’ll be prompted to set a password for the user. Once done, restart the Samba service to apply the changes:

```bash
sudo systemctl restart smbd
```

Step 3: Mount External Hard Drive

A NAS server typically relies on an external hard drive to store files. Let’s mount your external drive to the Raspberry Pi 4.

#### 3.1 Identify the External Drive

First, plug your external hard drive into one of the USB 3.0 ports on the Raspberry Pi 4. To find the drive’s name, run:

```bash
sudo fdisk -l
```

Look for your external hard drive in the list (it’s typically named `/dev/sda1` or similar).

#### 3.2 Mount the Drive

Create a mount point for the drive:

```bash
sudo mkdir /mnt/external
```

Mount the drive to this directory:

```bash
sudo mount /dev/sda1 /mnt/external
```

To make the mount permanent (i.e., mounted automatically at boot), you need to add the drive to the `/etc/fstab` file. Open the file:

```bash
sudo nano /etc/fstab
```

Add the following line at the bottom:

```bash
/dev/sda1 /mnt/external auto defaults 0 0
```

Save and exit. Now, your external drive will be mounted automatically on startup.

Step 4: Configure Access to NAS from Other Devices

#### 4.1 Access NAS from Windows

On a Windows computer, open **File Explorer** and type the Raspberry Pi’s IP address in the address bar, like so:

```bash
\\192.168.X.XXX
```

You will be prompted to enter your Samba username and password. After authentication, you’ll have access to the shared folder.

#### 4.2 Access NAS from macOS

On a macOS device, open **Finder**, press `Cmd + K`, and enter the Raspberry Pi’s IP address like this:

```bash
smb://192.168.X.XXX
```

You’ll be asked for the Samba credentials, and once authenticated, the shared folder will be accessible.

Step 5: Optional - Set Up Remote Access

If you want to access your NAS server remotely, outside your home or office network, you can set up remote access via **OpenVPN** or **WireGuard**. Additionally, **dynamic DNS (DDNS)** can help you manage your NAS server’s IP address if it changes periodically.

Step 6: Optimize Your NAS Setup

While the basic setup is complete, there are several optimizations and improvements you can make:

* **Add more storage**: Connect additional external drives to expand your storage capacity. You can even set up a RAID configuration for redundancy.

* **Automatic backups**: Use software like **rsync** to automate backups to your NAS.

* **Media streaming**: Install media server software like **Plex** or **Emby** on your Raspberry Pi for streaming videos and music to your devices.
Conclusion

Building a NAS server with a Raspberry Pi 4 is a cost-effective and powerful way to create a personal cloud for storing and sharing files across your home or office network. With Samba, you can easily access files from Windows, macOS, or Linux devices, making it a flexible solution for your storage needs.

By following this guide, you’ll have a fully functional NAS server that can be further customized with additional storage, automated backups, or media streaming capabilities. Whether for personal use or a small business, a Raspberry Pi 4 NAS server offers performance, scalability, and convenience at an affordable price.
