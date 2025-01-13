---
title: Mastering NFS 4 ACLs on AlmaLinux
description: Learn how to configure and manage NFS 4 ACLs on AlmaLinux. This step-by-step guide covers installation, setup, and advanced usage tips for efficient file-sharing.
date: 2024-12-10
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: NFS 4 ACL Tool
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 380

keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: nfs-4-acl-tool-almalinux
---
The Network File System (NFS) is a powerful tool for sharing files between Linux systems. AlmaLinux, a popular and stable distribution derived from the RHEL ecosystem, fully supports NFS and its accompanying Access Control Lists (ACLs). NFSv4 ACLs provide granular file permissions beyond traditional Unix permissions, allowing administrators to tailor access with precision.

This guide will walk you through the steps to use the NFS 4 ACL tool effectively on AlmaLinux. We'll explore prerequisites, installation, configuration, and troubleshooting to help you leverage this feature for optimized file-sharing management.

---

### **Understanding NFS 4 ACLs**

NFSv4 ACLs extend traditional Unix file permissions, allowing for more detailed and complex rules. While traditional permissions only offer read, write, and execute permissions for owner, group, and others, NFSv4 ACLs introduce advanced controls such as inheritance and fine-grained user permissions.

Key Benefits:

1. **Granularity:** Define permissions for specific users or groups.
2. **Inheritance:** Automatically apply permissions to child objects.
3. **Compatibility:** Compatible with modern file systems like XFS and ext4.

---

### **Prerequisites**

Before proceeding, ensure the following prerequisites are met:

1. **System Requirements:**
   - AlmaLinux 8 or later.
   - Administrative (root or sudo) access to the server.

2. **Installed Packages:**
   - NFS utilities (`nfs-utils` package).
   - ACL tools (`acl` package).

3. **Network Setup:**
   - Ensure both the client and server systems are on the same network and can communicate effectively.

4. **Filesystem Support:**
   - The target filesystem (e.g., XFS or ext4) must support ACLs.

---

### **Step 1: Installing Required Packages**

To manage NFS 4 ACLs, install the necessary packages:

```bash
sudo dnf install nfs-utils acl -y
```

This command installs tools needed to configure and verify ACLs on AlmaLinux.

---

### **Step 2: Configuring the NFS Server**

1. **Exporting the Directory:**
   - Edit the `/etc/exports` file to specify the directory to be shared:

     ```bash
     /shared_directory client_ip(rw,sync,no_root_squash,fsid=0)
     ```

   - Replace `/shared_directory` with the directory path and `client_ip` with the client’s IP address or subnet.

2. **Enable ACL Support:**
   - Ensure the target filesystem is mounted with ACL support. Add the `acl` option in `/etc/fstab`:

     ```bash
     UUID=xyz /shared_directory xfs defaults,acl 0 0
     ```

   - Remount the filesystem:

     ```bash
     sudo mount -o remount,acl /shared_directory
     ```

3. **Restart NFS Services:**
   Restart the NFS server to apply changes:

   ```bash
   sudo systemctl restart nfs-server
   ```

---

### **Step 3: Setting ACLs on the Server**

Use the `setfacl` command to define ACLs:

- **Granting Permissions:**

  ```bash
  sudo setfacl -m u:username:rw /shared_directory
  ```

  This grants `read` and `write` permissions to `username`.

- **Verifying Permissions:**
  Use the `getfacl` command to confirm ACLs:

  ```bash
  getfacl /shared_directory
  ```

- **Setting Default ACLs:**
  To ensure new files inherit permissions:

  ```bash
  sudo setfacl -d -m u:username:rwx /shared_directory
  ```

---

### **Step 4: Configuring the NFS Client**

1. **Mounting the NFS Share:**
   On the client machine, mount the NFS share:

   ```bash
   sudo mount -t nfs4 server_ip:/ /mnt
   ```

2. **Ensuring ACL Functionality:**
   Verify that the ACLs are accessible:

   ```bash
   getfacl /mnt/shared_directory
   ```

---

### **Step 5: Troubleshooting Common Issues**

- **Issue: "Operation Not Permitted" when Setting ACLs**
  - Ensure the filesystem is mounted with ACL support.
  - Verify user privileges.

- **Issue: NFS Share Not Mounting**
  - Check network connectivity between the client and server.
  - Confirm NFS services are running:

    ```bash
    sudo systemctl status nfs-server
    ```

- **Issue: ACLs Not Persisting**
  - Confirm the ACL options in `/etc/fstab` are correctly configured.

---

### **Advanced Tips**

1. **Using Recursive ACLs:**
   Apply ACLs recursively to an entire directory structure:

   ```bash
   sudo setfacl -R -m u:username:rw /shared_directory
   ```

2. **Auditing Permissions:**
   Use `ls -l` and `getfacl` together to compare traditional and ACL permissions.

3. **Backup ACLs:**
   Backup existing ACL settings:

   ```bash
   getfacl -R /shared_directory > acl_backup.txt
   ```

   Restore ACLs from backup:

   ```bash
   setfacl --restore=acl_backup.txt
   ```

---

### **Conclusion**

The NFS 4 ACL tool on AlmaLinux offers administrators unparalleled control over file access permissions, enabling secure and precise management. By following the steps outlined in this guide, you can confidently configure and use NFSv4 ACLs for enhanced file-sharing solutions. Remember to regularly audit permissions and ensure your network is securely configured to prevent unauthorized access.

Mastering NFS 4 ACLs is not only an essential skill for Linux administrators but also a cornerstone for establishing robust and reliable enterprise-level file-sharing systems.
