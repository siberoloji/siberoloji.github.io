---
title: How to Enable Nested KVM Settings on AlmaLinux
description: Learn how to configure nested KVM settings on AlmaLinux with this step-by-step guide. Enable advanced virtualization features for testing.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Nested KVM Settings
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 480
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: enable-nested-kvm-settings-almalinux
---
#### Introduction

As virtualization gains momentum in modern IT environments, Kernel-based Virtual Machine (KVM) is a go-to choice for developers and administrators managing virtualized systems. AlmaLinux, a robust CentOS alternative, provides an ideal environment for setting up and configuring KVM. One powerful feature of KVM is nested virtualization, which allows you to run virtual machines (VMs) inside other VMs—a feature vital for testing, sandboxing, or multi-layered development environments.

In this guide, we will explore how to enable nested KVM settings on AlmaLinux. We'll cover prerequisites, step-by-step instructions, and troubleshooting tips to ensure a smooth configuration.

---

### What is Nested Virtualization?

Nested virtualization enables a VM to act as a hypervisor, running other VMs within it. This setup is commonly used for:

- **Testing hypervisor configurations** without needing physical hardware.
- **Training and development**, where multiple VM environments simulate real-world scenarios.
- **Software development and CI/CD pipelines** that involve multiple virtual environments.

KVM’s nested feature is hardware-dependent, requiring specific CPU support for virtualization extensions like Intel VT-x or AMD-V.

---

### Prerequisites

Before diving into the configuration, ensure the following requirements are met:

1. **Hardware Support**:
   - A processor with hardware virtualization extensions (Intel VT-x or AMD-V).
   - Nested virtualization capability enabled in the BIOS/UEFI.

2. **Operating System**:
   - AlmaLinux 8 or newer.
   - The latest kernel version for better compatibility.

3. **Packages**:
   - KVM modules installed (`kvm` and `qemu-kvm`).
   - Virtualization management tools (`virt-manager`, `libvirt`).

4. **Permissions**:
   - Administrative privileges to edit kernel modules and configurations.

---

### Step-by-Step Guide to Enable Nested KVM on AlmaLinux

#### Step 1: Verify Virtualization Support

Confirm your processor supports virtualization and nested capabilities:

```bash
grep -E "vmx|svm" /proc/cpuinfo
```

- **Output Explanation**:
  - `vmx`: Indicates Intel VT-x support.
  - `svm`: Indicates AMD-V support.

If neither appears, check your BIOS/UEFI settings to enable hardware virtualization.

#### Step 2: Install Required Packages

Ensure you have the necessary virtualization tools:

```bash
sudo dnf install qemu-kvm libvirt virt-manager -y
```

- **qemu-kvm**: Provides the KVM hypervisor.
- **libvirt**: Manages virtual machines.
- **virt-manager**: Offers a graphical interface to manage VMs.

Enable and start the `libvirtd` service:

```bash
sudo systemctl enable --now libvirtd
```

#### Step 3: Check and Load KVM Modules

Verify that the KVM modules are loaded:

```bash
lsmod | grep kvm
```

- `kvm_intel` or `kvm_amd` should be listed, depending on your processor type.

If not, load the appropriate module:

```bash
sudo modprobe kvm_intel    # For Intel processors
sudo modprobe kvm_amd      # For AMD processors
```

#### Step 4: Enable Nested Virtualization

Edit the KVM module options to enable nested support.

For Intel processors:

```bash
sudo echo "options kvm_intel nested=1" > /etc/modprobe.d/kvm_intel.conf
```

For AMD processors:

```bash
sudo echo "options kvm_amd nested=1" > /etc/modprobe.d/kvm_amd.conf
```

Update the module settings:

```bash
sudo modprobe -r kvm_intel
sudo modprobe kvm_intel
```

(Replace `kvm_intel` with `kvm_amd` for AMD CPUs.)

#### Step 5: Verify Nested Virtualization

Check if nested virtualization is enabled:

```bash
cat /sys/module/kvm_intel/parameters/nested    # For Intel
cat /sys/module/kvm_amd/parameters/nested     # For AMD
```

If the output is `Y`, nested virtualization is enabled.

#### Step 6: Configure Guest VMs for Nested Virtualization

To use nested virtualization, create or modify your guest VM configuration. Using `virt-manager`:

1. Open the VM settings in `virt-manager`.
2. Navigate to **Processor** settings.
3. Enable **Copy host CPU configuration**.
4. Ensure that virtualization extensions are visible to the guest.

Alternatively, update the VM's XML configuration:

```bash
sudo virsh edit <vm-name>
```

Add the following to the `<cpu>` section:

```xml
<cpu mode='host-passthrough'/>
```

Restart the VM for the changes to take effect.

---

### Troubleshooting Tips

1. **KVM Modules Fail to Load**:
   - Ensure that virtualization is enabled in the BIOS/UEFI.
   - Verify hardware compatibility for nested virtualization.

2. **Nested Feature Not Enabled**:
   - Double-check `/etc/modprobe.d/` configuration files for syntax errors.
   - Reload the kernel modules.

3. **Performance Issues**:
   - Nested virtualization incurs overhead; ensure sufficient CPU and memory resources for the host and guest VMs.

4. **libvirt Errors**:
   - Restart the `libvirtd` service:

     ```bash
     sudo systemctl restart libvirtd
     ```

---

### Conclusion

Setting up nested KVM on AlmaLinux is an invaluable skill for IT professionals, developers, and educators who rely on virtualized environments for testing and development. By following this guide, you’ve configured your system for optimal performance with nested virtualization.

From enabling hardware support to tweaking VM settings, the process ensures a robust and flexible setup tailored to your needs. AlmaLinux’s stability and compatibility with enterprise-grade features like KVM make it an excellent choice for virtualization projects.

Now, you can confidently create multi-layered virtual environments to advance your goals in testing, development, or training.
