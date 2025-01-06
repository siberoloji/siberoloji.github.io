---
draft: false
title: Bob Masters Linux Virtualization with KVM on AlmaLinux
linkTitle: Virtualization with KVM
keywords:
  - Virtualization with KVM
description: Virtualization allows a single physical server to run multiple isolated operating systems, making it a cornerstone of modern IT infrastructure.
date: 2024-12-10
url: bob-masters-linux-virtualization-kvm-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 830


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to set up **virtual machines (VMs)** using **KVM (Kernel-based Virtual Machine)** on AlmaLinux. Virtualization allows a single physical server to run multiple isolated operating systems, making it a cornerstone of modern IT infrastructure.

> *“One server, many VMs—time to master virtualization!”* Bob said, diving into KVM.

---

### **Chapter Outline: "Bob Masters Linux Virtualization with KVM"**

1. **Introduction: What Is KVM?**
   - Overview of virtualization.
   - Why KVM is a powerful choice for Linux.

2. **Setting Up KVM on AlmaLinux**
   - Installing and configuring KVM and related tools.
   - Verifying hardware virtualization support.

3. **Creating and Managing Virtual Machines**
   - Using `virt-manager` for a graphical interface.
   - Managing VMs with `virsh`.

4. **Configuring Networking for VMs**
   - Setting up bridged networking.
   - Configuring NAT for VMs.

5. **Optimizing VM Performance**
   - Allocating resources effectively.
   - Using VirtIO for better disk and network performance.

6. **Backing Up and Restoring VMs**
   - Snapshot management.
   - Exporting and importing VM configurations.

7. **Conclusion: Bob Reflects on Virtualization Mastery**

---

### **Part 1: Introduction: What Is KVM?**

Bob discovered that **KVM** is a full virtualization solution integrated into the Linux kernel. It turns Linux into a hypervisor, allowing multiple guest operating systems to run on a single machine.

#### **Key Features of KVM**

- Open-source and tightly integrated with Linux.
- Supports a wide range of guest operating systems.
- Optimized for performance with VirtIO drivers.

> *“KVM is powerful, and it’s free—what’s not to love?”* Bob said.

---

### **Part 2: Setting Up KVM on AlmaLinux**

#### **Step 1: Verifying Hardware Virtualization Support**

- Check if the CPU supports virtualization:

  ```bash
  lscpu | grep Virtualization
  ```

- Ensure the virtualization extensions are enabled in the BIOS.

#### **Step 2: Installing KVM and Tools**

- Install KVM, `qemu`, and virtualization tools:

  ```bash
  sudo dnf install -y @virt virt-install qemu-kvm virt-manager libvirt libvirt-client
  ```

- Enable and start the libvirt daemon:

  ```bash
  sudo systemctl enable libvirtd --now
  ```

#### **Step 3: Verifying the Installation**

- Verify that KVM is active:

  ```bash
  sudo lsmod | grep kvm
  ```

- Check the virtualization environment:

  ```bash
  sudo virsh list --all
  ```

> *“KVM is ready—time to create my first VM!”* Bob said.

---

### **Part 3: Creating and Managing Virtual Machines**

#### **Step 1: Using `virt-manager`**

Bob used the graphical **Virtual Machine Manager** to create his first VM.

- Launch `virt-manager`:

  ```bash
  virt-manager
  ```

- Create a new VM:
  1. Click **New Virtual Machine**.
  2. Select an ISO file for the guest OS.
  3. Allocate CPU, memory, and disk resources.
  4. Complete the setup and start the VM.

#### **Step 2: Managing VMs with `virsh`**

Bob learned to use the `virsh` CLI for VM management.

- Create a new VM:

  ```bash
  sudo virt-install \
    --name testvm \
    --vcpus 2 \
    --memory 2048 \
    --disk size=10 \
    --cdrom /path/to/iso \
    --os-variant detect=on
  ```

- Start and stop VMs:

  ```bash
  sudo virsh start testvm
  sudo virsh shutdown testvm
  ```

- List all VMs:

  ```bash
  sudo virsh list --all
  ```

> *“I can manage VMs with a GUI or CLI—versatility at its best!”* Bob noted.

---

### **Part 4: Configuring Networking for VMs**

#### **Step 1: Setting Up Bridged Networking**

- Create a bridge interface:

  ```bash
  sudo nmcli connection add type bridge ifname br0
  ```

- Attach the physical NIC to the bridge:

  ```bash
  sudo nmcli connection add type bridge-slave ifname enp0s3 master br0
  ```

- Assign an IP to the bridge:

  ```bash
  sudo nmcli connection modify br0 ipv4.addresses 192.168.1.100/24 ipv4.method manual
  ```

- Restart the network:

  ```bash
  sudo systemctl restart NetworkManager
  ```

- Attach the VM to the bridge:

  ```bash
  sudo virsh attach-interface --domain testvm --type bridge --source br0 --model virtio --config
  ```

#### **Step 2: Configuring NAT for VMs**

- Use the default NAT network provided by libvirt:

  ```bash
  sudo virsh net-start default
  sudo virsh net-autostart default
  ```

---

### **Part 5: Optimizing VM Performance**

#### **Step 1: Allocating Resources Effectively**

- Adjust CPU and memory for a running VM:

  ```bash
  sudo virsh setvcpus testvm 4 --live
  sudo virsh setmem testvm 4096M --live
  ```

#### **Step 2: Using VirtIO for Improved Performance**

Bob configured VirtIO drivers for faster disk and network performance:

- Set the disk interface to VirtIO in `virt-manager`.
- Use a VirtIO network adapter for faster network throughput.

> *“With VirtIO, my VMs run smoother than ever!”* Bob said.

---

### **Part 6: Backing Up and Restoring VMs**

#### **Step 1: Managing Snapshots**

- Create a snapshot:

  ```bash
  sudo virsh snapshot-create-as --domain testvm snapshot1 --description "Before update"
  ```

- Revert to a snapshot:

  ```bash
  sudo virsh snapshot-revert --domain testvm snapshot1
  ```

#### **Step 2: Exporting and Importing VMs**

- Export a VM:

  ```bash
  sudo virsh dumpxml testvm > testvm.xml
  sudo tar -czf testvm-backup.tar.gz /var/lib/libvirt/images/testvm.img testvm.xml
  ```

- Import a VM:

  ```bash
  sudo virsh define testvm.xml
  sudo virsh start testvm
  ```

> *“Backups ensure my VMs are safe from accidental changes!”* Bob said.

---

### **Conclusion: Bob Reflects on Virtualization Mastery**

Bob successfully deployed, managed, and optimized virtual machines on AlmaLinux using KVM. With tools like `virt-manager` and `virsh`, he could create flexible environments for testing, development, and production.

> Next, Bob plans to explore **Automating Infrastructure with Ansible** on AlmaLinux.
