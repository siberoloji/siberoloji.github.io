---
draft: false

title:  'AlmaLinux 9: How to Create an Installation Disk'
date: '2024-10-02T21:27:42+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-create-an-installation-disk/
 
featured_image: /images/almalinux.webp
categories:
    - 'Linux How-to'
tags:
    - 'alma linux'
    - 'create installation disk'
    - 'how-to guides'
    - linux
    - 'linux how-to'
---


AlmaLinux is a popular, community-driven open-source Linux distribution that offers a stable, secure, and reliable alternative to CentOS. After CentOS shifted to its new rolling release model (CentOS Stream), AlmaLinux has become a go-to choice for users who need a Red Hat Enterprise Linux (RHEL) compatible operating system. AlmaLinux 9 brings several improvements in performance, security, and usability, making it an excellent choice for both server and desktop environments.



One of the first steps in setting up AlmaLinux is creating an installation disk. In this blog post, we’ll guide you through the process of creating an AlmaLinux 9 installation disk. Whether you're a Linux beginner or an experienced user, this guide will cover everything you need, from downloading the ISO file to writing it onto a USB drive, ensuring you’re ready to install AlmaLinux 9 on your system.





## Prerequisites



Before we dive into the steps for creating an installation disk for AlmaLinux 9, let’s cover the prerequisites you'll need:


* **A USB drive**: At least 4 GB of storage space (preferably 8 GB or more).

* **AlmaLinux 9 ISO file**: You will need to download the official AlmaLinux 9 ISO.

* **Disk writing software**: Tools like **Etcher**, **Rufus**, or the Linux `dd` command can be used to write the ISO file onto your USB drive.

* **A computer for creating the disk**: Running Windows, macOS, or another Linux distribution.




Downloading the AlmaLinux 9 ISO



The first step is to download the AlmaLinux 9 ISO file from the official website.


* **Go to the AlmaLinux website**: Visit <a href="https://almalinux.org">https://almalinux.org</a> and navigate to the **Downloads** section.

* **Select the appropriate ISO**: AlmaLinux 9 is available for different architectures. If you’re using a standard PC, select the x86_64 architecture. For servers, you might want to choose the minimal ISO, while for desktops, the full installation ISO is recommended.

* **Download the ISO**: Choose a mirror close to your location to download the ISO faster.






## Step-by-Step Guide to Creating an AlmaLinux 9 Installation Disk



Step 1: Prepare Your USB Drive



Before we write the AlmaLinux 9 ISO file to the USB drive, make sure your USB drive is properly prepared.


* **Back up your data**: Writing the ISO file to the USB drive will erase all the data currently on the drive. If you have important files on it, be sure to back them up elsewhere before proceeding.

* **Format the USB drive**: Although many disk-writing tools will format the drive for you, it’s a good idea to format it manually before starting. You can use your operating system’s built-in disk utility for this.



#### On Windows:


* Insert the USB drive.

* Open **File Explorer** and right-click on the USB drive.

* Select **Format**, choose the **FAT32** or **NTFS** file system, and click **Start**.



#### On macOS:


* Insert the USB drive.

* Open **Disk Utility** (you can find this in **Applications** &gt; **Utilities**).

* Select the USB drive from the sidebar and click **Erase**. Set the format to **MS-DOS (FAT)** or **exFAT**, then click **Erase**.



#### On Linux:


* Insert the USB drive.

* Use the `gparted` utility to format the drive. If you don't have it installed, you can install it via your package manager (`sudo apt install gparted` on Ubuntu, for example).

* Select the drive and format it to **FAT32** or **NTFS**.




Step 2: Use Disk Writing Software to Write the ISO



There are several tools you can use to create an installation disk for AlmaLinux 9. The tool you choose will depend on the operating system you’re using. Here, we’ll cover instructions for three common tools: **Etcher**, **Rufus**, and the **dd** command.




#### Option 1: Using Etcher (Cross-platform: Windows, macOS, and Linux)



Etcher is a user-friendly tool that works on Windows, macOS, and Linux. It's highly recommended for beginners due to its simple interface.


* **Download Etcher**: Visit <a href="https://www.balena.io/etcher/">https://www.balena.io/etcher/</a> and download the installer for your operating system.

* **Install Etcher**: Run the installer and follow the prompts to install it on your system.

* **Open Etcher**: Once installed, open the application.

* **Select the AlmaLinux ISO**: Click on **Flash from file** and browse to the location where you downloaded the AlmaLinux 9 ISO.

* **Choose your USB drive**: Insert your USB drive and select it in Etcher.

* **Start flashing**: Click **Flash!** to begin the process. Etcher will write the ISO file to the USB drive and automatically verify the contents once the process is complete.

* **Eject the USB**: Once the flashing process is finished, you’ll be notified. You can now safely eject the USB drive.





#### Option 2: Using Rufus (Windows)



Rufus is a lightweight tool for creating bootable USB drives on Windows. It's fast and reliable, making it a popular choice among Windows users.


* **Download Rufus**: Visit <a href="https://rufus.ie">https://rufus.ie</a> and download the latest version.

* **Open Rufus**: Run the executable file (no installation required).

* **Select the USB drive**: Rufus will automatically detect your USB drive. Make sure the correct drive is selected.

* **Select the AlmaLinux ISO**: Click **Select** and browse to where you downloaded the AlmaLinux 9 ISO.

* **Partition scheme**: Rufus will set the partition scheme to **GPT** by default, which is suitable for UEFI systems. If you’re installing on an older BIOS system, you may need to switch it to **MBR**.

* **File system**: Choose **FAT32** or **NTFS**.

* **Start the process**: Click **Start**. Rufus will write the ISO to the USB drive and notify you when it’s finished.

* **Eject the USB drive**: Once Rufus has completed the process, safely eject your USB drive.





#### Option 3: Using the `dd` Command (Linux)



For experienced Linux users, the `dd` command is a powerful way to write ISO files to USB drives.


* **Insert your USB drive**: Identify the device path for your USB drive using the `lsblk` command. The device will typically be something like `/dev/sdb` or `/dev/sdc`.

* **Write the ISO**: Open a terminal and use the following command to write the ISO file to the USB drive. Be very careful with this command, as using the wrong device path can overwrite important data.



```bash
   sudo dd if=/path/to/almalinux9.iso of=/dev/sdX bs=4M status=progress &amp;&amp; sync```



Replace `/path/to/almalinux9.iso` with the path to the downloaded ISO file, and `/dev/sdX` with the device path for your USB drive.


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* **Wait for the process to complete**: The `dd` command will take some time to complete, and there won't be much visual feedback. Once it finishes, you’ll see a message indicating the number of bytes written.

* **Eject the USB drive**: Use the following command to safely eject the USB drive:



```bash
   sudo eject /dev/sdX```





## Step 3: Boot from the USB Drive



Once you’ve created your AlmaLinux 9 installation disk, it’s time to boot from it and begin the installation process.


* **Insert the USB drive**: Plug the USB drive into the computer where you want to install AlmaLinux 9.

* **Restart your computer**: Reboot the system and enter the **BIOS** or **UEFI** settings by pressing a key like `F2`, `F10`, or `Delete` during startup (the specific key depends on your computer's manufacturer).

* **Select the USB drive as the boot device**: In the BIOS/UEFI menu, find the **Boot Order** or **Boot Device** settings and select the USB drive as the first boot option.

* **Save and exit**: Save your settings and exit the BIOS. Your computer will now boot from the USB drive and begin the AlmaLinux 9 installation process.






## Conclusion



Creating an installation disk for AlmaLinux 9 is a straightforward process, whether you’re using Windows, macOS, or Linux. With the right tools and a few steps, you’ll have a bootable USB drive ready to install AlmaLinux 9 on your system. This powerful, enterprise-ready Linux distribution offers a robust solution for users and organizations seeking a stable, RHEL-compatible environment.



Once you’ve successfully booted from the USB drive, you can proceed with the installation and enjoy the many features and benefits AlmaLinux 9 has to offer. Whether you're setting up a server, desktop, or virtual machine, AlmaLinux 9 provides a secure and reliable operating system that’s well-suited for a wide range of use cases.
