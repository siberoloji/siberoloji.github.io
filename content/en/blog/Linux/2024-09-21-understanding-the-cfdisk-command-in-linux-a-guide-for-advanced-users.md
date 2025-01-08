---
draft: false

title:  'Understanding the cfdisk Command in Linux: A Guide for Advanced Users'
date: '2024-09-21T17:58:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /understanding-the-cfdisk-command-in-linux-a-guide-for-advanced-users/
 
featured_image: /images/linuxcommandsillustration1.webp
categories:
    - 'Linux Fundamentals'
tags:
    - cfdisk
    - linux
    - 'linux fundamentals'
    - os
---


Disk partitioning is an essential task in Linux, especially for system administrators or users managing multiple drives. One of the tools available for partition management is the `cfdisk` command, a simple yet powerful text-based partition editor. While graphical partition editors like GParted provide a user-friendly interface, `cfdisk` offers greater control through the command line, making it ideal for advanced users who prefer working without a graphical environment.



In this blog post, we’ll explore the `cfdisk` command in detail, discussing its use cases, advantages, and practical examples to help you master disk partitioning tasks on Linux.
## What is `cfdisk`?



`cfdisk` stands for **curses-based fdisk**. It is a simplified version of the more traditional `fdisk` command but with a menu-driven interface based on the curses library. This allows users to interactively manage disk partitions in a text-based environment.



`cfdisk` is particularly useful for those who find `fdisk`'s command-line interface too complex or want a faster way to create, delete, and modify partitions. While it lacks some of the advanced features of `parted`, it is perfect for common partitioning tasks such as:


* Creating partitions

* Deleting partitions

* Changing partition types (e.g., setting a partition as Linux, swap, or NTFS)

* Setting partitions as bootable




`cfdisk` operates on block devices such as `/dev/sda`, `/dev/nvme0n1`, or `/dev/mmcblk0`, and changes are only committed when you write them to the disk. Until that point, no data is altered, making it a relatively safe tool to experiment with.
## Installing `cfdisk`



Before you begin, ensure that `cfdisk` is installed on your system. Most Linux distributions include `cfdisk` by default, but if it is missing, you can install it using your package manager.



For **Debian/Ubuntu** systems:


```bash
sudo apt-get install util-linux```



For **Fedora**:


```bash
sudo dnf install util-linux```



For **Arch Linux**:


```bash
sudo pacman -S util-linux```



The `cfdisk` tool is part of the `util-linux` package, which is widely available on almost all Linux distributions.
## Basic Usage and Interface



To begin working with `cfdisk`, you need to specify the disk you want to manage. For example, to work on the first disk (`/dev/sda`), run the following command:


```bash
sudo cfdisk /dev/sda
```



This command will open an interactive text-based interface where you can perform various partitioning tasks.



Key Sections of the Interface:


* **Disk Information**: At the top of the screen, you’ll see information about the disk you’re working on, including the size of the disk and the partition table type (e.g., DOS or GPT).

* **Partition Table**: Below the disk information is a list of current partitions on the disk. Each partition is displayed with its start and end points, size, file system type, and label.

* **Menu Options**: At the bottom, you’ll find a menu that provides options such as **Create**, **Delete**, **Type**, **Write**, and **Quit**. You can navigate through these options using the arrow keys and select them by pressing **Enter**.

## Working with Partition Tables



Before creating or modifying partitions, you must ensure that the partition table is correctly set up. `cfdisk` supports both **DOS** and **GPT** partition tables.



Creating a New Partition Table



To create a new partition table:


* Open `cfdisk` on the disk you want to partition: `sudo cfdisk /dev/sda`

* Use the arrow keys to select the **[Label]** option, which allows you to create a new partition table.

* Select either **gpt** or **dos** depending on your requirements:



* **GPT** (GUID Partition Table) is suitable for disks larger than 2 TB or when using UEFI boot.

* **DOS** is more common for legacy BIOS systems and smaller disks.




Choosing the correct partition table is crucial for compatibility with your system’s boot method.
## Creating Partitions with `cfdisk`



Once the partition table is set, you can begin creating partitions. Here’s an example where we create three partitions:


* A root partition (`/`) of 50 GB

* A swap partition of 8 GB

* A home partition (`/home`) with the remaining space



* **Create Root Partition**:* In the `cfdisk` interface, select **[New]** to create a new partition.

* Choose the size of the partition. For this example, enter **50G** for the root partition.

* After setting the size, you'll be prompted to choose whether the partition should be **Primary** or **Logical**. For the first partition on a DOS table, select **Primary**.

* Now, mark the partition as bootable by selecting **[Bootable]**. This is required for the partition from which you will boot your system.



* **Create Swap Partition**:* After creating the root partition, select **[New]** again to create another partition.

* Enter **8G** as the size of this partition for the swap area.

* Use the **[Type]** option to change the partition type to **82 (Linux swap)**.



* **Create Home Partition**:* Finally, use the remaining space to create the home partition. Select **[New]** and assign the remaining size.

* No special settings are required for the home partition unless you want to change the file system type.

Example:



After completing these steps, the partition table might look something like this:


```bash
/dev/sda1   50G   Linux filesystem
/dev/sda2   8G    Linux swap
/dev/sda3   Remaining size  Linux filesystem
```



Once the partitions are set, navigate to **[Write]** to commit your changes to disk. `cfdisk` will ask you to type "yes" to confirm that you want to write the changes. Afterward, you can quit the program by selecting **[Quit]**.
## Deleting and Modifying Partitions



Deleting a Partition



If you need to delete a partition, use the **[Delete]** option in the `cfdisk` interface:


* Select the partition you want to delete using the arrow keys.

* Select **[Delete]**, and the partition will be removed from the partition table.




Deleted partitions remain uncommitted until you choose to write the changes. This gives you the flexibility to undo changes before they are final.



Changing Partition Types



Sometimes you might want to change the type of an existing partition (e.g., setting a partition as **swap** or **EFI system**). Use the **[Type]** option to assign a different type to the selected partition.



For example:


```bash
Type -> 82 (Linux swap)```



or


```bash
Type -> EF00 (EFI system)```
## Practical `cfdisk` Use Cases



1. Preparing a Disk for Linux Installation



When installing a new Linux distribution, partitioning is often required. Using `cfdisk`, you can easily create partitions for **root**, **home**, **swap**, and **boot** partitions before installation.


```bash
sudo cfdisk /dev/sda
```



Then create the necessary partitions (e.g., `/`, `/boot`, `/home`, swap) and set the appropriate types and bootable flags.



2. Partitioning a New External Drive



Suppose you have a new external drive (`/dev/sdb`) that you want to partition for use as a backup drive. Using `cfdisk`, you can create a large partition and set the partition type to **Linux filesystem** for ext4 formatting later.


```bash
sudo cfdisk /dev/sdb
```



Create a partition with the desired size and write the changes. Once done, format the partition using the `mkfs` command:


```bash
sudo mkfs.ext4 /dev/sdb1```
## Advantages and Limitations of `cfdisk`



Advantages:


* **Intuitive Interface**: The text-based interface is easy to navigate compared to `fdisk`.

* **Safe to Use**: Until changes are written to disk, `cfdisk` does not modify your data.

* **Wide Compatibility**: Supports both DOS and GPT partition tables.




Limitations:


* **Limited Features**: Compared to `parted`, `cfdisk` lacks advanced features such as resizing partitions or aligning them to sector boundaries.

* **Non-Graphical**: While more user-friendly than `fdisk`, it still requires working in a text-based interface, which might not be ideal for all users.

## Conclusion



The `cfdisk` command is a straightforward yet powerful tool for managing partitions in Linux. For advanced users, it offers an efficient way to perform common partitioning tasks without the complexity of `fdisk` or the need for a full graphical interface. Whether you’re setting up a new disk, preparing for an installation, or managing storage on a server, `cfdisk` provides a reliable method to create, delete, and modify partitions with ease.



By mastering `cfdisk`, you gain the ability to handle disk management tasks in almost any environment, from desktop setups to headless servers.
