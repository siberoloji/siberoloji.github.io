---
title: How to Create KVM Virtual Machines Using GUI on AlmaLinux
description: Learn how to create KVM virtual machines on AlmaLinux using Virt-Manager. This step-by-step guide covers setup, configuration, and advanced features for GUI-based KVM management.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Create KVM Virtual Machines Using GUI
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 430
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: create-kvm-virtual-machines-gui-almalinux
---
### How to Create KVM Virtual Machines Using GUI on AlmaLinux

Kernel-based Virtual Machine (KVM) is a powerful and efficient virtualization technology available on Linux. While KVM provides robust command-line tools for managing virtual machines (VMs), not everyone is comfortable working exclusively with a terminal. Fortunately, tools like **Virt-Manager** offer a user-friendly graphical user interface (GUI) to create and manage VMs on AlmaLinux.

In this guide, we’ll walk you through the step-by-step process of creating KVM virtual machines on AlmaLinux using a GUI, from installing the necessary tools to configuring and launching your first VM.

---

### **Why Use Virt-Manager for KVM?**

Virt-Manager (Virtual Machine Manager) simplifies the process of managing KVM virtual machines. It provides a clean interface for tasks like:

- **Creating Virtual Machines**: A step-by-step wizard for creating VMs.
- **Managing Resources**: Allocate CPU, memory, and storage for your VMs.
- **Monitoring Performance**: View real-time CPU, memory, and network statistics.
- **Network Configuration**: Easily manage NAT, bridged, or isolated networking.

---

### **Step 1: Prerequisites**

Before you start, ensure the following requirements are met:

1. **System Requirements**:
   - AlmaLinux 8 or later.
   - A 64-bit processor with virtualization support (Intel VT-x or AMD-V).
   - At least 4 GB of RAM and adequate disk space.

2. **Verify Virtualization Support**:
   Check if your CPU supports virtualization:
   ```bash
   lscpu | grep Virtualization
   ```
   Ensure virtualization is enabled in the BIOS/UEFI settings if the above command does not show `VT-x` (Intel) or `AMD-V` (AMD).

3. **Administrative Access**:
   Root or sudo access is required to install and configure the necessary packages.

---

### **Step 2: Install KVM and Virt-Manager**

To create and manage KVM virtual machines using a GUI, you need to install KVM, Virt-Manager, and related packages.

1. **Update Your System**:
   Run the following command to ensure your system is up to date:
   ```bash
   sudo dnf update -y
   ```

2. **Install KVM and Virt-Manager**:
   Install the required packages:
   ```bash
   sudo dnf install -y qemu-kvm libvirt libvirt-devel virt-install virt-manager
   ```

3. **Start and Enable Libvirt**:
   Enable the libvirt service to start at boot and launch it immediately:
   ```bash
   sudo systemctl enable libvirtd
   sudo systemctl start libvirtd
   ```

4. **Verify Installation**:
   Check if the KVM modules are loaded:
   ```bash
   lsmod | grep kvm
   ```
   You should see `kvm_intel` (for Intel CPUs) or `kvm_amd` (for AMD CPUs).

---

### **Step 3: Launch Virt-Manager**

1. **Start Virt-Manager**:
   Open Virt-Manager by running the following command:
   ```bash
   virt-manager
   ```
   Alternatively, search for “Virtual Machine Manager” in your desktop environment’s application menu.

2. **Connect to the Hypervisor**:
   When Virt-Manager launches, it automatically connects to the local hypervisor (`QEMU/KVM`). If it doesn’t, click **File > Add Connection**, select `QEMU/KVM`, and click **Connect**.

---

### **Step 4: Create a Virtual Machine Using Virt-Manager**

Now that the environment is set up, let’s create a new virtual machine.

1. **Start the New Virtual Machine Wizard**:
   - In the Virt-Manager interface, click the **Create a new virtual machine** button.

2. **Choose Installation Method**:
   - Select **Local install media (ISO image or CDROM)** and click **Forward**.

3. **Provide Installation Media**:
   - Click **Browse** to locate the ISO file of the operating system you want to install (e.g., AlmaLinux, CentOS, or Ubuntu).
   - Virt-Manager may automatically detect the OS variant based on the ISO. If not, manually select the appropriate OS variant.

4. **Allocate Memory and CPUs**:
   - Assign resources for the VM. For example:
     - Memory: 2048 MB (2 GB) for lightweight VMs.
     - CPUs: 2 for balanced performance.
   - Adjust these values based on your host system's available resources.

5. **Create a Virtual Disk**:
   - Set the size of the virtual disk (e.g., 20 GB).
   - Choose the disk format. `qcow2` is recommended for efficient storage.

6. **Configure Network**:
   - By default, Virt-Manager uses NAT for networking, allowing the VM to access external networks through the host.
   - For more advanced setups, you can use a bridged or isolated network.

7. **Finalize the Setup**:
   - Review the VM configuration and make any necessary changes.
   - Click **Finish** to create the VM and launch the installation process.

---

### **Step 5: Install the Operating System on the Virtual Machine**

1. **Follow the OS Installation Wizard**:
   - Once the VM is launched, it will boot from the ISO file, starting the operating system installation process.
   - Follow the on-screen instructions to install the OS.

2. **Set Up Storage and Network**:
   - During the installation, configure storage partitions and network settings as required.

3. **Complete the Installation**:
   - After the installation finishes, remove the ISO from the VM to prevent it from booting into the installer again.
   - Restart the VM to boot into the newly installed operating system.

---

### **Step 6: Managing the Virtual Machine**

After creating the virtual machine, you can manage it using Virt-Manager:

1. **Starting and Stopping VMs**:
   - Start a VM by selecting it in Virt-Manager and clicking **Run**.
   - Shut down or suspend the VM using the **Pause** or **Shut Down** buttons.

2. **Editing VM Settings**:
   - To modify CPU, memory, or storage settings, right-click the VM in Virt-Manager and select **Open** or **Details**.

3. **Deleting a VM**:
   - To delete a VM, right-click it in Virt-Manager and select **Delete**. Ensure you also delete associated disk files if no longer needed.

---

### **Step 7: Advanced Features**

1. **Using Snapshots**:
   - Snapshots allow you to save the state of a VM and revert to it later. In Virt-Manager, go to the **Snapshots** tab and click **Take Snapshot**.

2. **Network Customization**:
   - For advanced networking, configure bridges or isolated networks using the **Edit > Connection Details** menu.

3. **Performance Optimization**:
   - Use VirtIO drivers for improved disk and network performance.

---

### **Step 8: Troubleshooting Common Issues**

1. **Issue: "KVM Not Found"**:
   - Ensure the KVM modules are loaded:
     ```bash
     sudo modprobe kvm
     ```

2. **Issue: Virtual Machine Won’t Start**:
   - Check for errors in the system log:
     ```bash
     sudo journalctl -xe
     ```

3. **Issue: Network Not Working**:
   - Verify that the `virbr0` interface is active:
     ```bash
     sudo virsh net-list
     ```

4. **Issue: Poor Performance**:
   - Ensure the VM uses VirtIO for disk and network devices for optimal performance.

---

### **Conclusion**

Creating KVM virtual machines using a GUI on AlmaLinux is an intuitive process with Virt-Manager. This guide has shown you how to install the necessary tools, configure the environment, and create your first VM step-by-step. Whether you’re setting up a development environment or exploring virtualization, Virt-Manager simplifies KVM management and makes it accessible for users of all experience levels.

By following this guide, you can confidently create and manage virtual machines on AlmaLinux using the GUI. Start leveraging KVM’s power and flexibility today!
