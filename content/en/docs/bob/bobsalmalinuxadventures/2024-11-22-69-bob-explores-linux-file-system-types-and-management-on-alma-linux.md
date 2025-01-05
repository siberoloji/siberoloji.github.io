---
draft: false
title: Linux File System Types and Management on AlmaLinux
linkTitle: Linux File System Types
keywords:
  - Linux File System
description: Bob needed to understand the Linux file system, its types, and how to manage partitions, mounts, and attributes.
date: 2024-11-25
url: linux-file-system-types-management-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 690
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s manager tasked him with organizing and managing the server’s storage effectively. To do so, Bob needed to understand the **Linux file system**, its types, and how to manage partitions, mounts, and attributes.

> *“The file system is the skeleton of my server—it’s time to learn every bone!”* Bob declared as he dove into this essential topic.

---

### **Chapter Outline: "Bob Explores Linux File System Types and Management"**

1. **Introduction: Why File Systems Matter**
   - Overview of Linux file system types and their use cases.
   - Exploring the File Hierarchy Standard (FHS).

2. **Understanding File System Types**
   - Popular Linux file systems: ext4, xfs, btrfs, etc.
   - When to choose each file system.

3. **Creating and Managing Partitions**
   - Partitioning a disk with `fdisk` and `parted`.
   - Formatting partitions with `mkfs`.

4. **Mounting and Unmounting File Systems**
   - Temporary mounting with `mount`.
   - Persistent mounts with `/etc/fstab`.

5. **Exploring Advanced File System Features**
   - File attributes with `lsattr` and `chattr`.
   - Managing quotas and permissions.

6. **Monitoring and Maintaining File Systems**
   - Checking usage with `df` and `du`.
   - Repairing file systems with `fsck`.

7. **Conclusion: Bob Reflects on File System Mastery**

---

### **Part 1: Introduction: Why File Systems Matter**

Bob learned that the **file system** is the structure used by an operating system to organize and store files on a disk. A well-maintained file system ensures data reliability, security, and performance.

#### **Key Concepts**

- **File Hierarchy Standard (FHS)**: Defines the standard layout of directories (e.g., `/home`, `/var`, `/etc`).
- **Mount Points**: Locations where file systems are made accessible (e.g., `/mnt/data`).

> *“A well-organized file system is like a clean desk—everything is where it should be!”* Bob thought.

---

### **Part 2: Understanding File System Types**

Bob explored the most common file systems used on Linux:

#### **Popular Linux File Systems**

1. **ext4**:
   - Default file system for many Linux distributions.
   - Reliable and widely supported.
2. **xfs**:
   - High-performance file system, especially for large files.
   - Default in AlmaLinux for `/` partitions.
3. **btrfs**:
   - Advanced features like snapshots and compression.
   - Ideal for modern systems requiring scalability.

#### **Choosing a File System**

- **ext4** for general-purpose servers.
- **xfs** for high-performance workloads.
- **btrfs** for advanced features like snapshots.

> *“Each file system has its strengths—pick the right tool for the job!”* Bob said.

---

### **Part 3: Creating and Managing Partitions**

#### **Step 1: Partitioning a Disk with `fdisk`**

Bob needed to create a new partition on a secondary disk (`/dev/sdb`).

- Launch `fdisk`:

  ```bash
  sudo fdisk /dev/sdb
  ```

- Use the following commands:
  - `n`: Create a new partition.
  - `p`: Make it a primary partition.
  - Enter defaults for partition size.
  - `w`: Write changes to the disk.

#### **Step 2: Formatting the Partition**

After creating the partition, Bob formatted it with the **ext4** file system:

- Format the partition:

  ```bash
  sudo mkfs.ext4 /dev/sdb1
  ```

- Verify the file system:

  ```bash
  sudo blkid /dev/sdb1
  ```

> *“A clean, formatted partition is ready to use!”* Bob said.

---

### **Part 4: Mounting and Unmounting File Systems**

#### **Step 1: Temporary Mounting**

Bob mounted the new partition to a directory:

- Create a mount point:

  ```bash
  sudo mkdir /mnt/data
  ```

- Mount the partition:

  ```bash
  sudo mount /dev/sdb1 /mnt/data
  ```

- Verify the mount:

  ```bash
  df -h | grep /mnt/data
  ```

#### **Step 2: Persistent Mounts with `/etc/fstab`**

To ensure the partition was mounted at boot, Bob edited `/etc/fstab`:

- Find the UUID of the partition:

  ```bash
  sudo blkid /dev/sdb1
  ```

- Add an entry to `/etc/fstab`:

  ```plaintext
  UUID=your-uuid-here /mnt/data ext4 defaults 0 2
  ```

- Test the configuration:

  ```bash
  sudo mount -a
  ```

> *“Persistent mounts make sure my file systems are always available!”* Bob noted.

---

### **Part 5: Exploring Advanced File System Features**

#### **File Attributes with `lsattr` and `chattr`**

Bob explored advanced file attributes:

- List attributes of a file:

  ```bash
  lsattr file.txt
  ```

- Make a file immutable (cannot be modified or deleted):

  ```bash
  sudo chattr +i file.txt
  ```

> *“Immutability is great for protecting critical files!”* Bob said.

#### **Managing Quotas**

Bob set quotas to limit disk usage for users:

- Install quota tools:

  ```bash
  sudo dnf install -y quota
  ```

- Enable quotas on a file system by adding `usrquota` or `grpquota` to `/etc/fstab`.

- Assign quotas to a user:

  ```bash
  sudo edquota -u username
  ```

> *“Quotas prevent anyone from hogging resources!”* Bob said.

---

### **Part 6: Monitoring and Maintaining File Systems**

#### **Checking Disk Usage**

Bob monitored disk usage with:

- **`df`** for file system-level stats:

  ```bash
  df -h
  ```

- **`du`** for directory-level stats:

  ```bash
  du -sh /var/log
  ```

#### **Repairing File Systems with `fsck`**

Bob used `fsck` to repair a corrupted file system:

- Unmount the file system:

  ```bash
  sudo umount /dev/sdb1
  ```

- Run `fsck`:

  ```bash
  sudo fsck /dev/sdb1
  ```

> *“A healthy file system keeps everything running smoothly!”* Bob said.

---

### **Conclusion: Bob Reflects on File System Mastery**

By mastering file system management, Bob could now handle partitions, mounts, attributes, and maintenance with ease. His confidence as a sysadmin grew as he organized his server like a pro.

> Next, Bob plans to explore **Advanced Bash Scripting** on AlmaLinux.
