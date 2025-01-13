---
title: How to Configure iSCSI Initiator on AlmaLinux
description: Learn how to configure an iSCSI initiator on AlmaLinux. This detailed guide covers setup, discovery, and troubleshooting for seamless network storage access.
date: 2024-12-11
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Configure iSCSI Initiator
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 400

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: configure-iscsi-initiator-almalinux
---
Here’s a detailed blog post on configuring an iSCSI initiator on AlmaLinux. This step-by-step guide ensures you can seamlessly connect to an iSCSI target.

---

### How to Configure iSCSI Initiator on AlmaLinux

The iSCSI (Internet Small Computer Systems Interface) protocol is a popular solution for accessing shared storage over a network, offering flexibility and scalability for modern IT environments. Configuring an iSCSI initiator on AlmaLinux allows your system to act as a client, accessing storage devices provided by an iSCSI target.

In this guide, we’ll walk through the steps to set up an iSCSI initiator on AlmaLinux, including prerequisites, configuration, and troubleshooting.

---

### **What is an iSCSI Initiator?**

An **iSCSI initiator** is a client that connects to an iSCSI target (a shared storage device) over an IP network. By using iSCSI, initiators can treat remote storage as if it were locally attached, making it ideal for data-intensive environments like databases, virtualization, and backup solutions.

---

### **Step 1: Prerequisites**

Before starting, ensure the following:

1. **System Requirements:**
   - AlmaLinux 8 or later.
   - Root or sudo access to the system.

2. **Networking:**
   - The iSCSI target server must be accessible via the network.
   - Firewall rules on both the initiator and target must allow iSCSI traffic (TCP port 3260).

3. **iSCSI Target:**
   - Ensure the target is already configured. Refer to our [iSCSI Target Setup Guide](configure-iscsi-target-targetcli-almalinux) for assistance.

---

### **Step 2: Install iSCSI Initiator Utilities**

Install the required tools to configure the iSCSI initiator:

```bash
sudo dnf install iscsi-initiator-utils -y
```

Verify the installation:

```bash
iscsiadm --version
```

The command should return the installed version of the iSCSI utilities.

---

### **Step 3: Configure the Initiator Name**

Each iSCSI initiator must have a unique IQN (iSCSI Qualified Name). By default, AlmaLinux generates an IQN during installation. You can verify or edit it in the configuration file:

```bash
sudo nano /etc/iscsi/initiatorname.iscsi
```

The file should look like this:

```plaintext
InitiatorName=iqn.2024-12.com.example:initiator1
```

Modify the **InitiatorName** as needed, ensuring it is unique and matches the format `iqn.YYYY-MM.domain:identifier`.

Save and close the file.

---

### **Step 4: Discover Available iSCSI Targets**

Discover the targets available on the iSCSI server. Replace `<target_server_ip>` with the IP address of the iSCSI target server:

```bash
sudo iscsiadm -m discovery -t sendtargets -p <target_server_ip>
```

The output will list available targets, for example:

```plaintext
192.168.1.100:3260,1 iqn.2024-12.com.example:target1
```

---

### **Step 5: Log In to the iSCSI Target**

To connect to the discovered target, use the following command:

```bash
sudo iscsiadm -m node -T iqn.2024-12.com.example:target1 -p 192.168.1.100 --login
```

Replace:

- `iqn.2024-12.com.example:target1` with the target's IQN.
- `192.168.1.100` with the target server’s IP.

Once logged in, the system maps the remote storage to a local block device (e.g., `/dev/sdX`).

---

### **Step 6: Verify the Connection**

Confirm that the connection was successful:

1. **Check Active Sessions:**

   ```bash
   sudo iscsiadm -m session
   ```

   The output should list the active session.

2. **List Attached Devices:**

   ```bash
   lsblk
   ```

   Look for a new device, such as `/dev/sdb` or `/dev/sdc`.

---

### **Step 7: Configure Persistent Connections**

By default, iSCSI connections are not persistent across reboots. To make them persistent:

1. Enable the iSCSI service:

   ```bash
   sudo systemctl enable iscsid
   sudo systemctl start iscsid
   ```

2. Update the iSCSI node configuration:

   ```bash
   sudo iscsiadm -m node -T iqn.2024-12.com.example:target1 -p 192.168.1.100 --op update -n node.startup -v automatic
   ```

---

### **Step 8: Format and Mount the iSCSI Device**

Once connected, the iSCSI device behaves like a locally attached disk. To use it:

1. format the Device:**

   ```bash
   sudo mkfs.ext4 /dev/sdX
   ```

   Replace `/dev/sdX` with the appropriate device name.

2. **Create a Mount Point:**

   ```bash
   sudo mkdir /mnt/iscsi
   ```

3. **Mount the Device:**

   ```bash
   sudo mount /dev/sdX /mnt/iscsi
   ```

4. **Verify the Mount:**

   ```bash
   df -h
   ```

   The iSCSI device should appear in the output.

---

### **Step 9: Add the Mount to Fstab**

To ensure the iSCSI device is mounted automatically on reboot, add an entry to `/etc/fstab`:

```plaintext
/dev/sdX /mnt/iscsi ext4 _netdev 0 0
```

The `_netdev` option ensures the filesystem is mounted only after the network is available.

---

### **Troubleshooting Common Issues**

1. **Issue: Cannot Discover Targets**
   - Ensure the target server is reachable:

     ```bash
     ping <target_server_ip>
     ```

   - Check the firewall on both the initiator and target:

     ```bash
     sudo firewall-cmd --add-port=3260/tcp --permanent
     sudo firewall-cmd --reload
     ```

2. **Issue: iSCSI Device Not Appearing**
   - Check for errors in the system logs:

     ```bash
     sudo journalctl -xe
     ```

3. **Issue: Connection Lost After Reboot**
   - Ensure the `iscsid` service is enabled and running:

     ```bash
     sudo systemctl enable iscsid
     sudo systemctl start iscsid
     ```

---

### **Conclusion**

Configuring an iSCSI initiator on AlmaLinux is an essential skill for managing centralized storage in enterprise environments. By following this guide, you can connect your AlmaLinux system to an iSCSI target, format and mount the storage, and ensure persistent connections across reboots.

With iSCSI, you can unlock the potential of network-based storage for applications requiring flexibility, scalability, and reliability.
