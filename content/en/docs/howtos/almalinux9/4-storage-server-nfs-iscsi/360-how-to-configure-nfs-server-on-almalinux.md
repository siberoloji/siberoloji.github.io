---
title: How to Configure NFS Server on AlmaLinux
description: Learn how to set up an NFS server on AlmaLinux with this comprehensive guide. Step-by-step instructions for installation, configuration, testing, and best practices.
date: 2024-12-11
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 360
translationKey: how-to-configure-nfs-server-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: configure-nfs-server-almalinux
---
### How to Configure NFS Server on AlmaLinux

The **Network File System (NFS)** is a distributed file system protocol that allows multiple systems to share directories and files over a network. With NFS, you can centralize storage for easier management and provide seamless access to shared resources. Setting up an **NFS server** on **AlmaLinux** is a straightforward process, and it can be a vital part of an organization's infrastructure.

This guide explains how to configure an NFS server on AlmaLinux, covering installation, configuration, and best practices to ensure optimal performance and security.

---

### What is NFS?

The **Network File System (NFS)** is a protocol originally developed by Sun Microsystems that enables remote access to files as if they were local. It is widely used in UNIX-like operating systems, including Linux, to enable file sharing across a network.

Key features of NFS include:

- **Seamless File Access**: Files shared via NFS appear as local directories.
- **Centralized Storage**: Simplifies file management and backups.
- **Interoperability**: Supports sharing between different operating systems.

---

### Benefits of Using an NFS Server

1. **Centralized Data**: Consolidate storage for easier management.
2. **Scalability**: Share files across multiple systems without duplication.
3. **Cost Efficiency**: Reduce storage costs by leveraging centralized resources.
4. **Cross-Platform Support**: Compatible with most UNIX-based systems.

---

### Prerequisites

To configure an NFS server on AlmaLinux, ensure the following:

1. An AlmaLinux system with administrative (root or sudo) privileges.
2. A static IP address for the server.
3. Basic knowledge of Linux command-line operations.

---

### Step 1: Install the NFS Server Package

1. **Update the System**

   Before installing the NFS server, update your system packages:

   ```bash
   sudo dnf update -y
   ```

2. **Install the NFS Utilities**

   Install the required NFS server package:

   ```bash
   sudo dnf install nfs-utils -y
   ```

3. **Enable and Start the NFS Services**

   Enable and start the necessary NFS services:

   ```bash
   sudo systemctl enable nfs-server
   sudo systemctl start nfs-server
   ```

   Verify that the NFS server is running:

   ```bash
   sudo systemctl status nfs-server
   ```

---

### Step 2: Create and Configure the Shared Directory

1. **Create a Directory to Share**

   Create the directory you want to share over NFS. For example:

   ```bash
   sudo mkdir -p /srv/nfs/shared
   ```

2. **Set Permissions**

   Assign appropriate ownership and permissions to the directory. In most cases, you'll set the owner to `nobody` and the group to `nogroup` for general access:

   ```bash
   sudo chown nobody:nogroup /srv/nfs/shared
   sudo chmod 755 /srv/nfs/shared
   ```

3. **Add Files (Optional)**

   Populate the directory with files for clients to access:

   ```bash
   echo "Welcome to the NFS share!" | sudo tee /srv/nfs/shared/welcome.txt
   ```

---

### Step 3: Configure the NFS Exports

The **exports file** defines which directories to share and the permissions for accessing them.

1. **Edit the Exports File**

   Open the `/etc/exports` file in a text editor:

   ```bash
   sudo vim /etc/exports
   ```

2. **Add an Export Entry**

   Add an entry for the directory you want to share. For example:

   ```plaintext
   /srv/nfs/shared 192.168.1.0/24(rw,sync,no_subtree_check)
   ```

   - **`/srv/nfs/shared`**: The shared directory path.
   - **`192.168.1.0/24`**: The network allowed to access the share.
   - **`rw`**: Grants read and write access.
   - **`sync`**: Ensures data is written to disk before the server responds.
   - **`no_subtree_check`**: Disables subtree checking for better performance.

3. **Export the Shares**

   Apply the changes by exporting the shares:

   ```bash
   sudo exportfs -a
   ```

4. **Verify the Exported Shares**

   Check the list of exported directories:

   ```bash
   sudo exportfs -v
   ```

---

### Step 4: Configure Firewall Rules

Ensure the firewall allows NFS traffic.

1. **Allow NFS Service**

   Add NFS to the firewall rules:

   ```bash
   sudo firewall-cmd --add-service=nfs --permanent
   sudo firewall-cmd --reload
   ```

2. **Verify Firewall Settings**

   Confirm that the NFS service is allowed:

   ```bash
   sudo firewall-cmd --list-all
   ```

---

### Step 5: Test the NFS Server

1. **Install NFS Utilities on a Client System**

   On the client system, ensure the NFS utilities are installed:

   ```bash
   sudo dnf install nfs-utils -y
   ```

2. **Create a Mount Point**

   Create a directory to mount the shared NFS directory:

   ```bash
   sudo mkdir -p /mnt/nfs/shared
   ```

3. **Mount the NFS Share**

   Use the `mount` command to connect to the NFS share. Replace `<server-ip>` with the IP address of the NFS server:

   ```bash
   sudo mount <server-ip>:/srv/nfs/shared /mnt/nfs/shared
   ```

4. **Verify the Mount**

   Check if the NFS share is mounted successfully:

   ```bash
   df -h
   ```

   Navigate to the mounted directory to ensure access:

   ```bash
   ls /mnt/nfs/shared
   ```

5. **Make the Mount Persistent**

   To mount the NFS share automatically at boot, add the following line to the `/etc/fstab` file on the client:

   ```plaintext
   <server-ip>:/srv/nfs/shared  /mnt/nfs/shared  nfs  defaults  0  0
   ```

---

### Step 6: Secure the NFS Server

1. **Restrict Access**

   Use CIDR notation or specific IP addresses in the `/etc/exports` file to limit access to trusted networks or systems.

   Example:

   ```plaintext
   /srv/nfs/shared 192.168.1.10(rw,sync,no_subtree_check)
   ```

2. **Enable SELinux for NFS**

   AlmaLinux uses SELinux by default. Configure SELinux for NFS sharing:

   ```bash
   sudo setsebool -P nfs_export_all_rw 1
   ```

3. **Use Strong Authentication**

   Consider enabling Kerberos for secure authentication in environments requiring high security.

---

### Troubleshooting Tips

1. **Clients Cannot Access the NFS Share**
   - Verify that the NFS server is running:

     ```bash
     sudo systemctl status nfs-server
     ```

   - Check firewall rules and ensure the client is allowed.

2. **Mount Fails**
   - Ensure the shared directory is correctly exported:

     ```bash
     sudo exportfs -v
     ```

   - Verify network connectivity between the client and server.

3. **Performance Issues**
   - Use the `sync` and `async` options appropriately in `/etc/exports` to balance reliability and speed.
   - Monitor NFS performance with tools like `nfsstat`.

---

### Best Practices for NFS Server Configuration

1. **Monitor Usage**: Regularly monitor NFS server performance to identify bottlenecks.
2. **Backup Shared Data**: Protect shared data with regular backups.
3. **Use Secure Connections**: Implement Kerberos or VPNs for secure access in untrusted networks.
4. **Limit Permissions**: Use read-only (`ro`) exports where write access is not required.

---

### Conclusion

Configuring an **NFS server** on AlmaLinux is a powerful way to centralize file sharing and streamline data access across your network. By following this guide, you’ve learned how to install and configure the NFS server, set up exports, secure the system, and test the configuration.

With proper setup and maintenance, an NFS server can significantly enhance the efficiency and reliability of your network infrastructure. For advanced setups or troubleshooting, consider exploring the [official NFS documentation](https://nfs.sourceforge.net/) or the AlmaLinux community forums.

---
