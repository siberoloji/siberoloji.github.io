---
title: How to Set Up UEFI Boot for KVM Virtual Machines on AlmaLinux
description: Learn to configure UEFI boot for KVM virtual machines on AlmaLinux with this step-by-step guide. Includes prerequisites, setup, and troubleshooting tips.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Set Up UEFI Boot for KVM
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 510
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: set-uefi-boot-kvm-virtual-machines-almalinux
---
#### Introduction

Modern virtualized environments demand advanced booting features to match the capabilities of physical hardware. Unified Extensible Firmware Interface (UEFI) is the modern replacement for the traditional BIOS, providing faster boot times, better security, and support for large disks and advanced features. When setting up virtual machines (VMs) on AlmaLinux using KVM (Kernel-based Virtual Machine), enabling UEFI boot allows you to harness these benefits in your virtualized infrastructure.

This guide explains the steps to set up UEFI boot for KVM virtual machines on AlmaLinux. We’ll cover the prerequisites, detailed configuration, and troubleshooting tips to ensure a seamless setup.

---

### What is UEFI Boot?

UEFI is a firmware interface that initializes hardware during boot and provides runtime services for operating systems and programs. It is more advanced than the traditional BIOS and supports:
- **Faster Boot Times**: Due to optimized hardware initialization.
- **Secure Boot**: Prevents unauthorized code from running during startup.
- **Support for GPT**: Enables booting from disks larger than 2 TB.
- **Compatibility**: Works with legacy systems while enabling modern features.

By setting up UEFI boot in KVM, you can create virtual machines with these advanced boot capabilities, making them more efficient and compatible with modern operating systems.

---

### Prerequisites

Before setting up UEFI boot, ensure the following requirements are met:

1. **Host System**:
   - AlmaLinux 8 or newer installed.
   - KVM, QEMU, and libvirt configured and operational.

2. **UEFI Firmware**:
   - Install the `edk2-ovmf` package for UEFI support in KVM.

3. **Permissions**:
   - Administrative privileges to configure virtualization settings.

4. **VM Compatibility**:
   - An operating system ISO compatible with UEFI, such as Windows 10 or AlmaLinux.

---

### Step-by-Step Guide to Set Up UEFI Boot for KVM VMs on AlmaLinux

#### Step 1: Install and Configure Required Packages
Ensure the necessary virtualization tools and UEFI firmware are installed:
```bash
sudo dnf install qemu-kvm libvirt virt-manager edk2-ovmf -y
```

- **qemu-kvm**: Provides the KVM hypervisor.
- **libvirt**: Manages virtual machines.
- **virt-manager**: Offers a GUI for managing VMs.
- **edk2-ovmf**: Provides UEFI firmware files for KVM.

Verify that KVM is working:
```bash
virsh version
```

#### Step 2: Create a New Storage Pool for UEFI Firmware (Optional)
The `edk2-ovmf` package provides UEFI firmware files stored in `/usr/share/edk2/`. To make them accessible to all VMs, you can create a dedicated storage pool.

1. **Define the storage pool**:
   ```bash
   virsh pool-define-as uefi-firmware dir --target /usr/share/edk2/
   ```
2. **Build and start the pool**:
   ```bash
   virsh pool-build uefi-firmware
   virsh pool-start uefi-firmware
   ```
3. **Autostart the pool**:
   ```bash
   virsh pool-autostart uefi-firmware
   ```

#### Step 3: Create a New Virtual Machine
Use `virt-manager` or `virt-install` to create a new VM.

- **Using virt-manager**:
  1. Open `virt-manager` and click **Create a new virtual machine**.
  2. Select the installation source (ISO file or PXE boot).
  3. Configure memory, CPU, and storage.

- **Using virt-install**:
   ```bash
   virt-install \
   --name my-uefi-vm \
   --memory 2048 \
   --vcpus 2 \
   --disk size=20 \
   --cdrom /path/to/os.iso \
   --os-variant detect=on
   ```

Do not finalize the VM configuration yet; proceed to the UEFI-specific settings.

#### Step 4: Enable UEFI Boot for the VM
1. **Access the VM’s XML Configuration**:
   ```bash
   virsh edit <vm-name>
   ```

2. **Add UEFI Firmware**:
   Locate the `<os>` section and add the UEFI loader:
   ```xml
   <os>
       <type arch='x86_64' machine='pc-q35-6.2'>hvm</type>
       <loader readonly='yes' type='pflash'>/usr/share/edk2/ovmf/OVMF_CODE.fd</loader>
       <nvram>/var/lib/libvirt/nvram/<vm-name>.fd</nvram>
   </os>
   ```

3. **Specify the Machine Type**:
   Modify the `<type>` element to use the `q35` machine type, which supports UEFI.

4. **Save and Exit**:
   Save the file and close the editor. Restart the VM to apply changes.

#### Step 5: Install the Operating System
Boot the VM and proceed with the operating system installation:
1. During installation, ensure the disk is partitioned using GPT instead of MBR.
2. If the OS supports Secure Boot, you can enable it during the installation or post-installation configuration.

#### Step 6: Test UEFI Boot
Once the installation is complete, reboot the VM and verify that it boots using UEFI firmware:
- Access the UEFI shell during boot if needed by pressing `ESC` or `F2`.
- Check the boot logs in `virt-manager` or via `virsh` to confirm the UEFI loader is initialized.

---

### Troubleshooting Tips

1. **VM Fails to Boot**:
   - Ensure the `<loader>` path is correct.
   - Verify that the UEFI firmware package (`edk2-ovmf`) is installed.

2. **No UEFI Option in virt-manager**:
   - Check if `virt-manager` is up-to-date:
     ```bash
     sudo dnf update virt-manager
     ```
   - Ensure the `edk2-ovmf` package is installed.

3. **Secure Boot Issues**:
   - Ensure the OS supports Secure Boot.
   - Disable Secure Boot in the UEFI settings if not needed.

4. **Incorrect Disk Partitioning**:
   - During OS installation, ensure you select GPT partitioning.

5. **Invalid Machine Type**:
   - Use the `q35` machine type in the VM XML configuration.

---

### Best Practices for UEFI Boot in KVM VMs

- **Update Firmware**: Regularly update the UEFI firmware files for better compatibility and security.
- **Enable Secure Boot Carefully**: Secure Boot can enhance security but may require additional configuration for non-standard operating systems.
- **Test New Configurations**: Test UEFI boot on non-production VMs before applying it to critical workloads.
- **Document Configurations**: Keep a record of changes made to the VM XML files for troubleshooting and replication.

---

### Conclusion

Enabling UEFI boot for KVM virtual machines on AlmaLinux provides a modern and efficient boot environment that supports advanced features like Secure Boot and GPT partitioning. By following the steps outlined in this guide, you can configure UEFI boot for your VMs, enhancing their performance, compatibility, and security.

Whether you’re deploying new VMs or upgrading existing ones, UEFI is a worthwhile addition to your virtualized infrastructure. AlmaLinux, paired with KVM and libvirt, makes it straightforward to implement and manage UEFI boot in your environment.
