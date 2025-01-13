---
title: How to Enable TPM 2.0 on KVM on AlmaLinux
description: Learn how to enable TPM 2.0 for KVM VMs on AlmaLinux with this step-by-step guide.
date: 2024-12-11
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Enable TPM 2.0
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 520

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: enable-tpm-2-0-kvm-almalinux
---
### How to Enable TPM 2.0 on KVM on AlmaLinux

#### Introduction

Trusted Platform Module (TPM) 2.0 is a hardware-based security feature that enhances the security of systems by providing encryption keys, device authentication, and secure boot. Enabling TPM 2.0 in virtualized environments has become increasingly important for compliance with modern operating systems like Windows 11, which mandates TPM for installation.

In this guide, we will explore how to enable TPM 2.0 for virtual machines (VMs) running on KVM (Kernel-based Virtual Machine) in AlmaLinux. This detailed walkthrough covers the prerequisites, configuration steps, and troubleshooting tips for successfully integrating TPM 2.0 in your virtualized environment.

---

### What is TPM 2.0?

TPM 2.0 is the second-generation Trusted Platform Module, providing enhanced security features compared to its predecessor. It supports:

- **Cryptographic Operations**: Handles secure key generation and storage.
- **Platform Integrity**: Ensures the integrity of the system during boot through secure measurements.
- **Secure Boot**: Protects against unauthorized firmware and operating system changes.
- **Compliance**: Required for running modern operating systems like Windows 11.

In a KVM environment, TPM can be emulated using the `swtpm` package, which provides software-based TPM features for virtual machines.

---

### Prerequisites

Before enabling TPM 2.0, ensure the following requirements are met:

1. **Host System**:
   - AlmaLinux 8 or newer installed.
   - KVM, QEMU, and libvirt configured and operational.

2. **TPM Support**:
   - Install the `swtpm` package for software-based TPM emulation.

3. **VM Compatibility**:
   - A guest operating system that supports TPM 2.0, such as Windows 11 or Linux distributions with TPM support.

4. **Permissions**:
   - Administrative privileges to configure virtualization settings.

---

### Step-by-Step Guide to Enable TPM 2.0 on KVM on AlmaLinux

#### Step 1: Install Required Packages

Ensure the necessary virtualization tools and TPM emulator are installed:

```bash
sudo dnf install qemu-kvm libvirt virt-manager swtpm -y
```

- **qemu-kvm**: Provides the KVM hypervisor.
- **libvirt**: Manages virtual machines.
- **virt-manager**: GUI for managing VMs.
- **swtpm**: Software TPM emulator.

Start and enable the libvirt service:

```bash
sudo systemctl enable --now libvirtd
```

#### Step 2: Verify TPM Support

Verify that `swtpm` is installed and working:

```bash
swtpm --version
```

Check for the TPM library files on your system:

```bash
ls /usr/share/swtpm
```

#### Step 3: Create a New Virtual Machine

Use `virt-manager` or `virt-install` to create a new virtual machine. This VM will later be configured to use TPM 2.0.

- **Using virt-manager**:
  1. Open `virt-manager` and click **Create a new virtual machine**.
  2. Select the installation source (ISO file or PXE boot).
  3. Configure memory, CPU, and storage.

- **Using virt-install**:

   ```bash
   virt-install \
   --name my-tpm-vm \
   --memory 4096 \
   --vcpus 4 \
   --disk size=40 \
   --cdrom /path/to/os.iso \
   --os-variant detect=on
   ```

Do not finalize the configuration yet; proceed to enable TPM.

#### Step 4: Enable TPM 2.0 for the VM

1. **Edit the VM’s XML Configuration**:

   ```bash
   virsh edit <vm-name>
   ```

2. **Add TPM Device Configuration**:
   Locate the `<devices>` section in the XML file and add the following TPM configuration:

   ```xml
   <tpm model='tpm-tis'>
       <backend type='emulator' version='2.0'>
           <options/>
       </backend>
   </tpm>
   ```

3. **Set Emulator for Software TPM**:
   Ensure that the TPM emulator points to the `swtpm` backend for proper functionality.

4. **Save and Exit**:
   Save the XML file and close the editor.

#### Step 5: Start the Virtual Machine

Start the VM and verify that TPM 2.0 is active:

```bash
virsh start <vm-name>
```

Inside the VM’s operating system, check for the presence of TPM:

- **Windows**: Open `tpm.msc` from the Run dialog to view the TPM status.
- **Linux**: Use the `tpm2-tools` package to query TPM functionality:

   ```bash
   sudo tpm2_getcap properties-fixed
   ```

#### Step 6: Secure the TPM Emulator

By default, the `swtpm` emulator does not persist data. To ensure TPM data persists across reboots:

1. Create a directory to store TPM data:

   ```bash
   sudo mkdir -p /var/lib/libvirt/swtpm/<vm-name>
   ```

2. Modify the XML configuration to use the new path:

   ```xml
   <tpm model='tpm-tis'>
       <backend type='emulator' version='2.0'>
           <path>/var/lib/libvirt/swtpm/<vm-name></path>
       </backend>
   </tpm>
   ```

---

### Troubleshooting Tips

1. **TPM Device Not Detected in VM**:
   - Ensure the `swtpm` package is correctly installed.
   - Double-check the XML configuration for errors.

2. **Unsupported TPM Version**:
   - Verify that the `version='2.0'` attribute is correctly specified in the XML file.

3. **Secure Boot Issues**:
   - Ensure the operating system and VM are configured for UEFI and Secure Boot compatibility.

4. **TPM Emulator Fails to Start**:
   - Restart the `libvirtd` service:

     ```bash
     sudo systemctl restart libvirtd
     ```

   - Check the libvirt logs for error messages:

     ```bash
     sudo journalctl -u libvirtd
     ```

---

### Best Practices for Using TPM 2.0 on KVM

- **Backup TPM Data**: Securely back up the TPM emulator directory for disaster recovery.
- **Enable Secure Boot**: Combine TPM with UEFI Secure Boot for enhanced system integrity.
- **Monitor VM Security**: Regularly review and update security policies for VMs using TPM.
- **Document Configuration Changes**: Keep detailed records of XML modifications for future reference.

---

### Conclusion

Enabling TPM 2.0 for KVM virtual machines on AlmaLinux ensures compliance with modern operating system requirements and enhances the security of your virtualized environment. By leveraging the `swtpm` emulator and configuring libvirt, you can provide robust hardware-based security features for your VMs.

This guide has provided a comprehensive walkthrough to set up and manage TPM 2.0 in KVM. Whether you're deploying secure applications or meeting compliance requirements, TPM is an essential component of any virtualized infrastructure.
