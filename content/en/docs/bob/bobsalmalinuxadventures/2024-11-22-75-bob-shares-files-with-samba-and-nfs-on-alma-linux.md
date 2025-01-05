---
draft: false
title: Bob Shares Files with Samba and NFS on AlmaLinux
linkTitle: Files with Samba and NFS
keywords:
  - file sharing
description: Bob decided to configure Samba for Windows-compatible sharing and NFS (Network File System) for Linux-based systems.
date: 2024-11-25
url: bob-shares-files-samba-nfs-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 750
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next task was to set up **file sharing** on AlmaLinux. His manager needed a shared folder for team collaboration that could be accessed by Windows, Linux, and macOS systems. Bob decided to configure **Samba** for Windows-compatible sharing and **NFS (Network File System)** for Linux-based systems.

> *“File sharing makes teamwork seamless—let’s get everyone on the same page!”* Bob said, ready to master Samba and NFS.

---

### **Chapter Outline: "Bob Shares Files with Samba and NFS"**

1. **Introduction: Why File Sharing Matters**
   - Use cases for Samba and NFS.
   - Key differences between the two protocols.

2. **Setting Up Samba for Windows-Compatible Sharing**
   - Installing and configuring Samba.
   - Creating a shared folder with access control.

3. **Configuring NFS for Linux-Compatible Sharing**
   - Installing and configuring NFS.
   - Exporting directories and setting permissions.

4. **Testing and Troubleshooting File Sharing**
   - Connecting to Samba shares from Windows and Linux.
   - Mounting NFS shares on Linux clients.
   - Diagnosing common file-sharing issues.

5. **Conclusion: Bob Reflects on File Sharing Mastery**

---

### **Part 1: Introduction: Why File Sharing Matters**

Bob discovered that file sharing protocols allow systems to access and manage shared resources efficiently.

#### **Key Differences Between Samba and NFS**

- **Samba**:
  - Compatible with Windows, Linux, and macOS.
  - Uses the SMB/CIFS protocol.
- **NFS**:
  - Designed for Linux and Unix systems.
  - Provides high-performance, native file sharing.

> *“With Samba and NFS, I can meet everyone’s needs!”* Bob said.

---

### **Part 2: Setting Up Samba for Windows-Compatible Sharing**

#### **Step 1: Installing Samba**

- Install Samba on AlmaLinux:

  ```bash
  sudo dnf install -y samba samba-client
  ```

- Enable and start the Samba service:

  ```bash
  sudo systemctl enable smb --now
  sudo systemctl enable nmb --now
  ```

#### **Step 2: Creating a Shared Folder**

- Create the directory for sharing:

  ```bash
  sudo mkdir -p /srv/samba/shared
  ```

- Set permissions:

  ```bash
  sudo chmod 2775 /srv/samba/shared
  sudo chown nobody:nobody /srv/samba/shared
  ```

#### **Step 3: Configuring Samba**

- Edit the Samba configuration file:

  ```bash
  sudo nano /etc/samba/smb.conf
  ```

- Add the shared folder configuration:

  ```plaintext
  [Shared]
  path = /srv/samba/shared
  browseable = yes
  writable = yes
  guest ok = yes
  read only = no
  ```

  Save the file and restart Samba:

  ```bash
  sudo systemctl restart smb
  ```

#### **Step 4: Testing Samba**

- Check the Samba configuration:

  ```bash
  testparm
  ```

- From a Windows client, Bob connected to the share by entering the server’s IP in File Explorer:

  ```plaintext
  \\192.168.1.10\Shared
  ```

> *“My Samba share is live—Windows users can now access files easily!”* Bob said.

---

### **Part 3: Configuring NFS for Linux-Compatible Sharing**

#### **Step 1: Installing NFS**

- Install the NFS server package:

  ```bash
  sudo dnf install -y nfs-utils
  ```

- Enable and start the NFS service:

  ```bash
  sudo systemctl enable nfs-server --now
  ```

#### **Step 2: Creating an Exported Directory**

- Create the shared directory:

  ```bash
  sudo mkdir -p /srv/nfs/shared
  ```

- Set permissions:

  ```bash
  sudo chmod 777 /srv/nfs/shared
  ```

#### **Step 3: Configuring Exports**

- Edit the `/etc/exports` file:

  ```bash
  sudo nano /etc/exports
  ```

- Add the export configuration:

  ```plaintext
  /srv/nfs/shared 192.168.1.0/24(rw,sync,no_root_squash)
  ```

- Apply the changes:

  ```bash
  sudo exportfs -r
  ```

#### **Step 4: Testing NFS**

- From a Linux client, Bob mounted the NFS share:

  ```bash
  sudo mount 192.168.1.10:/srv/nfs/shared /mnt
  ```

- Verify the mount:

  ```bash
  df -h | grep /mnt
  ```

> *“The NFS share is up and running—Linux systems can now collaborate seamlessly!”* Bob said.

---

### **Part 4: Testing and Troubleshooting File Sharing**

#### **Testing Samba on Linux**

- Bob tested Samba on Linux using the `smbclient` command:

  ```bash
  smbclient -L //192.168.1.10
  ```

- To connect:

  ```bash
  smbclient //192.168.1.10/Shared -U guest
  ```

#### **Diagnosing Common Samba Issues**

1. **Firewall blocking access**:
   - Allow Samba through the firewall:

     ```bash
     sudo firewall-cmd --permanent --add-service=samba
     sudo firewall-cmd --reload
     ```

2. **Authentication errors**:
   - Ensure correct permissions on the shared folder.

---

#### **Testing NFS**

- Bob tested NFS by listing exported directories:

  ```bash
  showmount -e 192.168.1.10
  ```

#### **Diagnosing Common NFS Issues**

1. **Permission denied**:
   - Ensure the client’s IP is allowed in `/etc/exports`.

2. **Mount errors**:
   - Check that the NFS service is running:

     ```bash
     sudo systemctl status nfs-server
     ```

---

### **Conclusion: Bob Reflects on File Sharing Mastery**

Bob successfully configured Samba and NFS, enabling seamless file sharing for his team. He felt confident managing shared resources for both Windows and Linux environments.

> Next, Bob plans to explore **Advanced Networking with AlmaLinux**, including VLANs and bridging.
