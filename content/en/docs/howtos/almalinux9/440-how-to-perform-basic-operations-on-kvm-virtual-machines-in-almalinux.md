---
title: Basic KVM Virtual Machine Operations on AlmaLinux
description: Learn how to manage KVM virtual machines on AlmaLinux. This guide covers starting, stopping, resizing, networking, snapshots, and troubleshooting.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Basic KVM Operations
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 440
toc: true
keywords:
   - AlmaLinux
   - KVM
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: basic-kvm-virtual-machine-operations-almalinux
---
### How to Perform Basic Operations on KVM Virtual Machines in AlmaLinux

Kernel-based Virtual Machine (KVM) is a powerful open-source virtualization platform that transforms AlmaLinux into a robust hypervisor capable of running multiple virtual machines (VMs). Whether you're managing a home lab or an enterprise environment, understanding how to perform basic operations on KVM VMs is crucial for smooth system administration.

In this guide, we’ll cover essential operations for KVM virtual machines on AlmaLinux, including starting, stopping, managing storage, networking, snapshots, and troubleshooting common issues.

---

### **Why Choose KVM on AlmaLinux?**

KVM’s integration into the Linux kernel makes it one of the most efficient and reliable virtualization solutions available. By running KVM on AlmaLinux, users benefit from a stable, enterprise-grade operating system and robust hypervisor capabilities.

Key advantages include:

- Native performance for VMs.
- Comprehensive management tools like `virsh` (CLI) and Virt-Manager (GUI).
- Scalability and flexibility for diverse workloads.

---

### **Prerequisites**

Before managing KVM VMs, ensure your environment is set up:

1. **KVM Installed**:
   - KVM and required tools like libvirt and Virt-Manager should be installed. Refer to our guide on [Installing KVM on AlmaLinux](/how-to-install-kvm-almalinux/).

2. **Virtual Machines Created**:
   - At least one VM must already exist. If not, refer to our guide on [Creating KVM Virtual Machines](/create-kvm-virtual-machines-almalinux-complete-guide/).

3. **Access**:
   - Root or sudo privileges on the host system.

---

### **Step 1: Start and Stop Virtual Machines**

Managing VM power states is one of the fundamental operations.

#### Using `virsh` (Command Line Interface)

1. **List Available VMs**:
   To see all VMs:

   ```bash
   sudo virsh list --all
   ```

   Output:

   ```plaintext
   Id   Name      State
   -------------------------
   -    testvm    shut off
   ```

2. **Start a VM**:

   ```bash
   sudo virsh start testvm
   ```

3. **Stop a VM**:
   Gracefully shut down the VM:

   ```bash
   sudo virsh shutdown testvm
   ```

4. **Force Stop a VM**:
   If the VM doesn’t respond to shutdown:

   ```bash
   sudo virsh destroy testvm
   ```

#### Using Virt-Manager (GUI)

1. Launch Virt-Manager:

   ```bash
   virt-manager
   ```

2. Select the VM, then click **Start** to boot it or **Shut Down** to power it off.

---

### **Step 2: Access the VM Console**

#### Using `virsh`

To access the VM console via CLI:

```bash
sudo virsh console testvm
```

To exit the console, press `Ctrl+]`.

#### Using Virt-Manager

In Virt-Manager, right-click the VM and select **Open**, then interact with the VM via the graphical console.

---

### **Step 3: Manage VM Resources**

As workloads evolve, you may need to adjust VM resources like CPU, memory, and disk.

#### Adjust CPU and Memory

Using `virsh`:

1. Edit the VM configuration:

   ```bash
   sudo virsh edit testvm
   ```

2. Modify `<memory>` and `<vcpu>` values:

   ```xml
   <memory unit='MiB'>2048</memory>
   <vcpu placement='static'>2</vcpu>
   ```

Using Virt-Manager:

1. Right-click the VM, select **Details**, and navigate to the **Memory** or **Processors** tabs.
2. Adjust the values and save changes.

#### Expand Virtual Disk

Using `qemu-img`:

1. Resize the disk:

   ```bash
   sudo qemu-img resize /var/lib/libvirt/images/testvm.qcow2 +10G
   ```

2. Resize the partition inside the VM using a partition manager.

---

### **Step 4: Manage VM Networking**

#### List Available Networks

```bash
sudo virsh net-list --all
```

#### Attach a Network to a VM

1. Edit the VM:

   ```bash
   sudo virsh edit testvm
   ```

2. Add a `<interface>` section:

   ```xml
   <interface type='network'>
     <source network='default'/>
   </interface>
   ```

#### Using Virt-Manager

1. Open the VM’s details, then navigate to the **NIC** section.
2. Choose a network (e.g., NAT, Bridged) and save changes.

---

### **Step 5: Snapshots**

Snapshots capture the state of a VM at a particular moment, allowing you to revert changes if needed.

#### Create a Snapshot

Using `virsh`:

```bash
sudo virsh snapshot-create-as testvm snapshot1 "Initial snapshot"
```

Using Virt-Manager:

1. Open the VM, go to the **Snapshots** tab.
2. Click **Take Snapshot**, provide a name, and save.

#### List Snapshots

```bash
sudo virsh snapshot-list testvm
```

#### Revert to a Snapshot

```bash
sudo virsh snapshot-revert testvm snapshot1
```

---

### **Step 6: Backup and Restore VMs**

#### Backup a VM

Export the VM to an XML file:

```bash
sudo virsh dumpxml testvm > testvm.xml
```

Backup the disk image:

```bash
sudo cp /var/lib/libvirt/images/testvm.qcow2 /backup/testvm.qcow2
```

#### Restore a VM

1. Recreate the VM from the XML file:

   ```bash
   sudo virsh define testvm.xml
   ```

2. Restore the disk image to its original location.

---

### **Step 7: Troubleshooting Common Issues**

1. **Issue: VM Won’t Start**
   - Check logs for errors:

     ```bash
     sudo journalctl -xe
     ```

   - Verify resources (CPU, memory, disk).

2. **Issue: Network Connectivity Issues**
   - Ensure the network is active:

     ```bash
     sudo virsh net-list
     ```

   - Restart the network:

     ```bash
     sudo virsh net-start default
     ```

3. **Issue: Disk Space Exhaustion**
   - Check disk usage:

     ```bash
     df -h
     ```

   - Expand storage or move disk images to a larger volume.

---

### **Step 8: Monitoring Virtual Machines**

Use `virt-top` to monitor resource usage:

```bash
sudo virt-top
```

In Virt-Manager, select a VM and view real-time statistics for CPU, memory, and disk.

---

### **Conclusion**

Managing KVM virtual machines on AlmaLinux is straightforward once you master basic operations like starting, stopping, resizing, networking, and snapshots. Tools like `virsh` and Virt-Manager provide both flexibility and convenience, making KVM an ideal choice for virtualization.

With this guide, you can confidently handle routine tasks and ensure your virtualized environment operates smoothly. Whether you're hosting development environments, testing applications, or running production workloads, KVM on AlmaLinux is a powerful solution.
