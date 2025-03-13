---
title: How to Enable GPU Passthrough on KVM with AlmaLinux
description: Learn how to configure GPU passthrough on KVM with AlmaLinux. A step-by-step guide to enable high-performance virtualization with minimal setup.
date: 2024-12-11
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Enable GPU Passthrough on KVM
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 530
translationKey: how-to-enable-gpu-passthrough-on-kvm-with-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: enable-gpu-passthrough-kvm-almalinux
---
#### Introduction

GPU passthrough allows a physical GPU to be directly assigned to a virtual machine (VM) in a KVM (Kernel-based Virtual Machine) environment. This feature is crucial for high-performance tasks such as gaming, 3D rendering, video editing, and machine learning, as it enables the VM to utilize the full power of the GPU. AlmaLinux, a stable and robust enterprise-grade Linux distribution, provides a reliable platform for setting up GPU passthrough.

In this guide, we will explain how to configure GPU passthrough on KVM with AlmaLinux. By the end of this tutorial, you will have a VM capable of leveraging your GPU’s full potential.

---

### What is GPU Passthrough?

GPU passthrough is a virtualization feature that dedicates a host machine's physical GPU to a guest VM, enabling near-native performance. It is commonly used in scenarios where high-performance graphics or compute power is required, such as:

- **Gaming on VMs**: Running modern games in a virtualized environment.
- **Machine Learning**: Utilizing GPU acceleration for training and inference.
- **3D Rendering**: Running graphics-intensive applications within a VM.

GPU passthrough requires hardware virtualization support (Intel VT-d or AMD IOMMU), a compatible GPU, and proper configuration of the host system.

---

### Prerequisites

Before starting, ensure the following requirements are met:

1. **Hardware Support**:
   - A CPU with hardware virtualization support (Intel VT-x/VT-d or AMD-V/IOMMU).
   - A GPU that supports passthrough (NVIDIA or AMD).

2. **Host System**:
   - AlmaLinux 8 or newer installed.
   - KVM, QEMU, and libvirt configured and operational.

3. **Permissions**:
   - Administrative privileges to configure virtualization and hardware.

4. **BIOS/UEFI Configuration**:
   - Enable virtualization extensions (Intel VT-d or AMD IOMMU) in BIOS/UEFI.

5. **Additional Tools**:
   - `virt-manager` for GUI management of VMs.
   - `pciutils` for identifying hardware devices.

---

### Step-by-Step Guide to Configure GPU Passthrough on KVM with AlmaLinux

#### Step 1: Enable IOMMU in BIOS/UEFI

1. Restart your system and access the BIOS/UEFI settings.
2. Locate the virtualization options and enable Intel VT-d or AMD IOMMU.
3. Save the changes and reboot into AlmaLinux.

#### Step 2: Enable IOMMU on AlmaLinux

1. Edit the GRUB configuration file:

   ```bash
   sudo nano /etc/default/grub
   ```

2. Add the following parameters to the `GRUB_CMDLINE_LINUX` line:
   - For Intel:

     ```bash
     intel_iommu=on iommu=pt
     ```

   - For AMD:

     ```bash
     amd_iommu=on iommu=pt
     ```

3. Update GRUB and reboot:

   ```bash
   sudo grub2-mkconfig -o /boot/grub2/grub.cfg
   sudo reboot
   ```

#### Step 3: Verify IOMMU is Enabled

After rebooting, verify that IOMMU is enabled:

```bash
dmesg | grep -e DMAR -e IOMMU
```

You should see lines indicating that IOMMU is enabled.

#### Step 4: Identify the GPU and Bind it to the VFIO Driver

1. List all PCI devices and identify your GPU:

   ```bash
   lspci -nn
   ```

   Look for entries related to your GPU (e.g., NVIDIA or AMD).

2. Note the GPU's PCI ID (e.g., `0000:01:00.0` for the GPU and `0000:01:00.1` for the audio device).

3. Bind the GPU to the VFIO driver:
   - Create a configuration file:

     ```bash
     sudo nano /etc/modprobe.d/vfio.conf
     ```

   - Add the following line, replacing `<PCI-ID>` with your GPU's ID:

     ```bash
     options vfio-pci ids=<GPU-ID>,<Audio-ID>
     ```

4. Update the initramfs and reboot:

   ```bash
   sudo dracut -f --kver $(uname -r)
   sudo reboot
   ```

#### Step 5: Verify GPU Binding

After rebooting, verify that the GPU is bound to the VFIO driver:

```bash
lspci -nnk -d <GPU-ID>
```

The output should show `vfio-pci` as the driver in use.

#### Step 6: Create a Virtual Machine with GPU Passthrough

1. Open `virt-manager` and create a new VM or edit an existing one.
2. Configure the VM settings:
   - **CPU**: Set the CPU mode to "host-passthrough" for better performance.
   - **GPU**:
     1. Go to the **Add Hardware** section.
     2. Select **PCI Host Device** and add your GPU and its associated audio device.
   - **Display**: Disable SPICE or VNC and set the display to `None`.

3. Install the operating system on the VM (e.g., Windows 10 or Linux).

#### Step 7: Install GPU Drivers in the VM

1. Boot into the guest operating system.
2. Install the appropriate GPU drivers (NVIDIA or AMD).
3. Reboot the VM to apply the changes.

#### Step 8: Test GPU Passthrough

Run a graphics-intensive application or benchmark tool in the VM to confirm that GPU passthrough is working as expected.

---

### Troubleshooting Tips

1. **GPU Not Detected in VM**:
   - Verify that the GPU is correctly bound to the VFIO driver.
   - Check the VM’s XML configuration to ensure the GPU is assigned.

2. **IOMMU Errors**:
   - Ensure that virtualization extensions are enabled in the BIOS/UEFI.
   - Verify that IOMMU is enabled in the GRUB configuration.

3. **Host System Crashes or Freezes**:
   - Check for hardware compatibility issues.
   - Ensure that the GPU is not being used by the host (e.g., use an integrated GPU for the host).

4. **Performance Issues**:
   - Use a dedicated GPU for the VM and an integrated GPU for the host.
   - Ensure that the CPU is in "host-passthrough" mode for optimal performance.

---

### Best Practices for GPU Passthrough on KVM

- **Use Compatible Hardware**: Verify that your GPU supports virtualization and is not restricted by the manufacturer (e.g., some NVIDIA consumer GPUs have limitations for passthrough).
- **Backup Configurations**: Keep a backup of your VM’s XML configuration and GRUB settings for easy recovery.
- **Allocate Sufficient Resources**: Ensure the VM has enough CPU cores, memory, and disk space for optimal performance.
- **Update Drivers**: Regularly update GPU drivers in the guest OS for compatibility and performance improvements.

---

### Conclusion

GPU passthrough on KVM with AlmaLinux unlocks the full potential of your hardware, enabling high-performance applications in a virtualized environment. By following the steps outlined in this guide, you can configure GPU passthrough for your VMs, providing near-native performance for tasks like gaming, rendering, and machine learning.

Whether you’re setting up a powerful gaming VM or a high-performance computing environment, AlmaLinux and KVM offer a reliable platform for GPU passthrough. With proper configuration and hardware, you can achieve excellent results tailored to your needs.
