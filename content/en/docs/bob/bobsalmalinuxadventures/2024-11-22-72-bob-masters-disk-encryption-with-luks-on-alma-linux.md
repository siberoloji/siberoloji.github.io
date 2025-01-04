---
draft: false
title: Bob Masters Disk Encryption with LUKS on AlmaLinux
linkTitle: Disk Encryption with LUKS
keywords:
  - Disk Encryption with LUKS
description: The importance of protecting data at rest, especially on portable devices or backup drives. Bob decided to use *LUKS the standard for disk encryption on Linux.
date: 2024-11-25
url: bob-masters-disk-encryption-luks-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 720
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next task was to implement **disk encryption** to secure sensitive data. His manager emphasized the importance of protecting data at rest, especially on portable devices or backup drives. Bob decided to use **LUKS (Linux Unified Key Setup)**, the standard for disk encryption on Linux.

> *“If the data’s locked tight, no one can get to it without the key!”* Bob said, determined to safeguard his systems.

---

### **Chapter Outline: "Bob Masters Disk Encryption with LUKS"**

1. **Introduction: Why Disk Encryption?**
   - The importance of securing data at rest.
   - Overview of LUKS and its features.

2. **Preparing a Disk for Encryption**
   - Identifying the target device.
   - Ensuring the disk is unmounted and data is backed up.

3. **Setting Up LUKS Encryption**
   - Initializing LUKS on the disk.
   - Creating and verifying a passphrase.

4. **Formatting and Mounting the Encrypted Disk**
   - Creating a file system within the encrypted container.
   - Mounting the encrypted disk.

5. **Automating the Unlock Process**
   - Using a key file for automated decryption.
   - Configuring `/etc/crypttab` and `/etc/fstab`.

6. **Maintaining and Troubleshooting LUKS**
   - Adding, removing, and changing passphrases.
   - Backing up and restoring LUKS headers.

7. **Conclusion: Bob Reflects on Secure Storage**

---

### **Part 1: Introduction: Why Disk Encryption?**

Bob learned that disk encryption protects sensitive data by encrypting it at the block device level. Even if the disk is stolen, the data remains inaccessible without the encryption key.

#### **Benefits of LUKS**

- **Secure**: AES encryption ensures data safety.
- **Integrated**: Works seamlessly with Linux tools.
- **Flexible**: Supports multiple passphrases for recovery.

> *“Encryption is like a vault for my data. Time to set it up!”* Bob said.

---

### **Part 2: Preparing a Disk for Encryption**

Bob identified an unused disk (`/dev/sdb`) for encryption. Before proceeding, he ensured there was no important data on the disk.

#### **Step 1: Verifying the Disk**

- List available disks:

  ```bash
  lsblk
  ```

  Example output:

  ```plaintext
  NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
  sda      8:0    0   500G  0 disk
  └─sda1   8:1    0   500G  0 part /
  sdb      8:16   0   100G  0 disk
  ```

#### **Step 2: Unmounting the Disk**

- Ensure the disk is unmounted:

  ```bash
  sudo umount /dev/sdb
  ```

#### **Step 3: Installing Required Tools**

- Install the `cryptsetup` package:

  ```bash
  sudo dnf install -y cryptsetup
  ```

> *“The disk is ready for encryption—let’s lock it down!”* Bob said.

---

### **Part 3: Setting Up LUKS Encryption**

#### **Step 1: Initializing LUKS on the Disk**

Bob initialized LUKS on `/dev/sdb`:

```bash
sudo cryptsetup luksFormat /dev/sdb
```

- Bob was prompted to confirm the operation and enter a passphrase. He chose a strong passphrase to secure the disk.

> *“The disk is now encrypted—time to unlock it!”* Bob said.

#### **Step 2: Opening the Encrypted Disk**

Bob unlocked the disk, creating a mapped device:

```bash
sudo cryptsetup luksOpen /dev/sdb encrypted_disk
```

- This created a device at `/dev/mapper/encrypted_disk`.

---

### **Part 4: Formatting and Mounting the Encrypted Disk**

#### **Step 1: Creating a File System**

Bob formatted the unlocked device with an `ext4` file system:

```bash
sudo mkfs.ext4 /dev/mapper/encrypted_disk
```

#### **Step 2: Mounting the Disk**

Bob created a mount point and mounted the disk:

```bash
sudo mkdir /mnt/secure
sudo mount /dev/mapper/encrypted_disk /mnt/secure
```

- Verify the mount:

  ```bash
  df -h | grep /mnt/secure
  ```

#### **Step 3: Testing the Setup**

Bob copied a test file to the encrypted disk:

```bash
echo "Sensitive data" | sudo tee /mnt/secure/testfile.txt
```

He unmounted and locked the disk:

```bash
sudo umount /mnt/secure
sudo cryptsetup luksClose encrypted_disk
```

> *“Data stored securely—mission accomplished!”* Bob said.

---

### **Part 5: Automating the Unlock Process**

Bob wanted the encrypted disk to unlock automatically at boot using a key file.

#### **Step 1: Creating a Key File**

- Generate a random key file:

  ```bash
  sudo dd if=/dev/urandom of=/root/luks-key bs=1 count=4096
  sudo chmod 600 /root/luks-key
  ```

- Add the key to LUKS:

  ```bash
  sudo cryptsetup luksAddKey /dev/sdb /root/luks-key
  ```

#### **Step 2: Configuring `/etc/crypttab`**

Bob edited `/etc/crypttab` to configure automatic unlocking:

```plaintext
encrypted_disk /dev/sdb /root/luks-key
```

#### **Step 3: Adding to `/etc/fstab`**

Bob added the mount point to `/etc/fstab`:

```plaintext
/dev/mapper/encrypted_disk /mnt/secure ext4 defaults 0 2
```

- Test the configuration:

  ```bash
  sudo mount -a
  ```

> *“The disk unlocks automatically—no need to type the passphrase every time!”* Bob said.

---

### **Part 6: Maintaining and Troubleshooting LUKS**

#### **Adding, Removing, or Changing Passphrases**

- Add a new passphrase:

  ```bash
  sudo cryptsetup luksAddKey /dev/sdb
  ```

- Remove an old passphrase:

  ```bash
  sudo cryptsetup luksRemoveKey /dev/sdb
  ```

#### **Backing Up the LUKS Header**

Bob backed up the LUKS header for recovery:

```bash
sudo cryptsetup luksHeaderBackup /dev/sdb --header-backup-file /root/luks-header.img
```

To restore the header:

```bash
sudo cryptsetup luksHeaderRestore /dev/sdb --header-backup-file /root/luks-header.img
```

> *“A LUKS header backup is my insurance policy!”* Bob said.

---

### **Conclusion: Bob Reflects on Secure Storage**

Bob successfully encrypted his disk, ensuring sensitive data was protected even if the physical device was lost or stolen. By automating decryption and maintaining backups, he felt confident in his ability to manage secure storage.

> Next, Bob plans to explore **Kernel Management on AlmaLinux**.
