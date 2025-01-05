---
title: How to Configure iSCSI Target with Targetcli on AlmaLinux
description: Learn how to configure iSCSI targets using Targetcli on AlmaLinux.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Configure iSCSI Target
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 390
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: configure-iscsi-target-targetcli-almalinux
---
### How to Configure iSCSI Target Using Targetcli on AlmaLinux

The iSCSI (Internet Small Computer Systems Interface) protocol allows users to access storage devices over a network as if they were local. On AlmaLinux, configuring an iSCSI target is straightforward with the **targetcli** tool, a modern and user-friendly interface for setting up storage backends. 

This guide provides a step-by-step tutorial on configuring an iSCSI target using Targetcli on AlmaLinux. We’ll cover prerequisites, installation, configuration, and testing to ensure your setup works seamlessly.

---

### **Understanding iSCSI and Targetcli**

Before diving into the setup, let’s understand the key components:

- **iSCSI Target**: A storage device (or logical unit) shared over a network.
- **iSCSI Initiator**: A client accessing the target device.
- **Targetcli**: A command-line utility that simplifies configuring the Linux kernel’s built-in target subsystem.

Benefits of iSCSI include:
- Centralized storage management.
- Easy scalability and flexibility.
- Compatibility with various operating systems.

---

### **Step 1: Prerequisites**

Before configuring an iSCSI target, ensure the following:

1. **AlmaLinux Requirements:**
   - AlmaLinux 8 or later.
   - Root or sudo access.

2. **Networking Requirements:**
   - A static IP address for the target server.
   - A secure and stable network connection.

3. **Storage Setup:**
   - A block storage device or file to be shared.

4. **Software Packages:**
   - The **targetcli** utility installed on the target server.
   - iSCSI initiator tools for testing the configuration.

---

### **Step 2: Installing Targetcli**

To install Targetcli, run the following commands:

```bash
sudo dnf install targetcli -y
```

Verify the installation:

```bash
targetcli --version
```

---

### **Step 3: Configuring the iSCSI Target**

1. **Start Targetcli:**
   Launch the Targetcli shell:
   ```bash
   sudo targetcli
   ```

2. **Create a Backstore:**
   A backstore is the storage resource that will be exported to clients. You can create one using a block device or file.

   - For a block device (e.g., `/dev/sdb`):
     ```bash
     /backstores/block create name=block1 dev=/dev/sdb
     ```

   - For a file-based backstore:
     ```bash
     /backstores/fileio create name=file1 file_or_dev=/srv/iscsi/file1.img size=10G
     ```

3. **Create an iSCSI Target:**
   Create an iSCSI target with a unique name:
   ```bash
   /iscsi create iqn.2024-12.com.example:target1
   ```

   The **IQN** (iSCSI Qualified Name) must be unique and follow the standard format (e.g., `iqn.YYYY-MM.domain:identifier`).

4. **Add a LUN (Logical Unit Number):**
   Link the backstore to the target as a LUN:
   ```bash
   /iscsi/iqn.2024-12.com.example:target1/tpg1/luns create /backstores/block/block1
   ```

5. **Configure Network Access:**
   Define which clients can access the target by setting up an ACL (Access Control List):
   ```bash
   /iscsi/iqn.2024-12.com.example:target1/tpg1/acls create iqn.2024-12.com.example:initiator1
   ```

   Replace `initiator1` with the IQN of the client.

6. **Enable Listening on the Network Interface:**
   Ensure the portal listens on the desired IP address and port:
   ```bash
   /iscsi/iqn.2024-12.com.example:target1/tpg1/portals create 192.168.1.100 3260
   ```

   Replace `192.168.1.100` with your server’s IP address.

7. **Save the Configuration:**
   Save the current configuration:
   ```bash
   saveconfig
   ```

---

### **Step 4: Enable and Start iSCSI Services**

Enable and start the iSCSI service:

```bash
sudo systemctl enable target
sudo systemctl start target
```

Check the service status:

```bash
sudo systemctl status target
```

---

### **Step 5: Configuring the iSCSI Initiator (Client)**

On the client machine, install the iSCSI initiator tools:

```bash
sudo dnf install iscsi-initiator-utils -y
```

Edit the initiator name in `/etc/iscsi/initiatorname.iscsi` to match the ACL configured on the target server.

Discover the iSCSI target:

```bash
sudo iscsiadm -m discovery -t sendtargets -p 192.168.1.100
```

Log in to the target:

```bash
sudo iscsiadm -m node -T iqn.2024-12.com.example:target1 -p 192.168.1.100 --login
```

Verify that the iSCSI device is available:

```bash
lsblk
```

---

### **Step 6: Testing and Verification**

To ensure the iSCSI target is functional:
1. On the client, format the device:
   ```bash
   sudo mkfs.ext4 /dev/sdX
   ```

2. Mount the device:
   ```bash
   sudo mount /dev/sdX /mnt
   ```

3. Test read and write operations to confirm connectivity.

---

### **Step 7: Troubleshooting**

1. **Issue: Targetcli Fails to Start**
   - Check for SELinux restrictions and disable temporarily for testing:
     ```bash
     sudo setenforce 0
     ```

2. **Issue: Client Cannot Discover Target**
   - Ensure the target server’s firewall allows iSCSI traffic on port 3260:
     ```bash
     sudo firewall-cmd --add-port=3260/tcp --permanent
     sudo firewall-cmd --reload
     ```

3. **Issue: ACL Errors**
   - Verify that the client’s IQN matches the ACL configured on the target server.

---

### **Conclusion**

Configuring an iSCSI target using Targetcli on AlmaLinux is an efficient way to share storage over a network. This guide has walked you through the entire process, from installation to testing, ensuring a reliable and functional setup. By following these steps, you can set up a robust storage solution that simplifies access and management for clients.

Whether for personal or enterprise use, mastering Targetcli empowers you to deploy scalable and flexible storage systems with ease.
