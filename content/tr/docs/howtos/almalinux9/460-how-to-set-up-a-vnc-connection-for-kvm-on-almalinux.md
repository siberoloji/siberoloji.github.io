---
title: How to Set Up a VNC Connection for KVM on AlmaLinux
description: Learn how to configure VNC for KVM virtual machines on AlmaLinux. This step-by-step guide covers setup, firewall configuration, and secure connections.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Set Up a VNC Connection for KVM
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 460
toc: true
keywords:
   - AlmaLinux
   - VNC
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: set-vnc-connection-kvm-almalinux
---
### How to Set Up a VNC Connection for KVM on AlmaLinux: A Step-by-Step Guide

Virtual Network Computing (VNC) is a popular protocol that allows you to remotely access and control virtual machines (VMs) hosted on a Kernel-based Virtual Machine (KVM) hypervisor. By setting up a VNC connection on AlmaLinux, you can manage your VMs from anywhere with a graphical interface, making it easier to configure, monitor, and control virtualized environments.

In this guide, we’ll walk you through the process of configuring a VNC connection for KVM on AlmaLinux, ensuring you have seamless remote access to your virtual machines.

---

### **Why Use VNC for KVM?**

VNC provides a straightforward way to interact with virtual machines hosted on KVM. Unlike SSH, which is command-line-based, VNC offers a graphical user interface (GUI) that mimics physical access to a machine.

**Benefits of VNC with KVM:**

1. Access VMs with a graphical desktop environment.
2. Perform tasks such as OS installation, configuration, and application testing.
3. Manage VMs remotely from any device with a VNC client.

---

### **Step 1: Prerequisites**

Before starting, ensure the following prerequisites are met:

1. **KVM Installed**:
   - KVM, QEMU, and libvirt must be installed and running on AlmaLinux. Follow our guide on [How to Install KVM on AlmaLinux](/how-to-install-kvm-almalinux/) if needed.

2. **VNC Viewer Installed**:
   - Install a VNC viewer on your client machine (e.g., **TigerVNC**, **RealVNC**, or **TightVNC**).

3. **Administrative Access**:
   - Root or sudo privileges on the host machine.

4. **Network Setup**:
   - Ensure the host and client machines are connected to the same network or the host is accessible via its public IP.

---

### **Step 2: Configure KVM for VNC Access**

By default, KVM provides VNC access to its virtual machines. This requires enabling and configuring VNC in the VM settings.

#### 1. **Verify VNC Dependencies**

Ensure `qemu-kvm` and `libvirt` are installed:

```bash
sudo dnf install -y qemu-kvm libvirt libvirt-devel
```

Start and enable the libvirt service:

```bash
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

---

### **Step 3: Enable VNC for a Virtual Machine**

You can configure VNC access for a VM using either Virt-Manager (GUI) or `virsh` (CLI).

#### Using Virt-Manager (GUI)

1. Launch Virt-Manager:

   ```bash
   virt-manager
   ```

2. Open the VM’s settings:
   - Right-click the VM and select **Open**.
   - Go to the **Display** section.
3. Ensure the **VNC** protocol is selected under the **Graphics** tab.
4. Configure the port:
   - Leave the port set to **Auto** (recommended) or specify a fixed port for easier connection.
5. Save the settings and restart the VM.

#### Using `virsh` (CLI)

1. Edit the VM configuration:

   ```bash
   sudo virsh edit <vm-name>
   ```

2. Locate the `<graphics>` section and ensure it is configured for VNC:

   ```xml
   <graphics type='vnc' port='-1' autoport='yes' listen='0.0.0.0'>
     <listen type='address' address='0.0.0.0'/>
   </graphics>
   ```

   - `port='-1'`: Automatically assigns an available VNC port.
   - `listen='0.0.0.0'`: Allows connections from any network interface.
3. Save the changes and restart the VM:

   ```bash
   sudo virsh destroy <vm-name>
   sudo virsh start <vm-name>
   ```

---

### **Step 4: Configure the Firewall**

Ensure your firewall allows incoming VNC connections (default port range: 5900-5999).

1. Add the firewall rule:

   ```bash
   sudo firewall-cmd --add-service=vnc-server --permanent
   sudo firewall-cmd --reload
   ```

2. Verify the firewall rules:

   ```bash
   sudo firewall-cmd --list-all
   ```

---

### **Step 5: Connect to the VM Using a VNC Viewer**

Once the VM is configured for VNC, you can connect to it using a VNC viewer.

#### Identify the VNC Port

1. Use `virsh` to check the VNC display port:

   ```bash
   sudo virsh vncdisplay <vm-name>
   ```

   Example output:

   ```plaintext
   :1
   ```

   The display `:1` corresponds to VNC port `5901`.

#### Use a VNC Viewer

1. Open your VNC viewer application on the client machine.
2. Enter the connection details:
   - **Host**: IP address of the KVM host (e.g., `192.168.1.100`).
   - **Port**: VNC port (`5901` for `:1`).
   - Full connection string example: `192.168.1.100:5901`.
3. Authenticate if required and connect to the VM.

---

### **Step 6: Secure the VNC Connection**

For secure environments, you can tunnel VNC traffic over SSH to prevent unauthorized access.

#### 1. Create an SSH Tunnel

On the client machine, set up an SSH tunnel to the host:

```bash
ssh -L 5901:localhost:5901 user@<host-ip>
```

#### 2. Connect via VNC

Point your VNC viewer to `localhost:5901` instead of the host IP.

---

### **Step 7: Troubleshooting Common Issues**

1. **Issue: "Unable to Connect to VNC Server"**
   - Ensure the VM is running:

     ```bash
     sudo virsh list --all
     ```

   - Verify the firewall rules are correct:

     ```bash
     sudo firewall-cmd --list-all
     ```

2. **Issue: "Connection Refused"**
   - Check if the VNC port is open:

     ```bash
     sudo netstat -tuln | grep 59
     ```

   - Verify the `listen` setting in the `<graphics>` section of the VM configuration.

3. **Issue: Slow Performance**
   - Ensure the network connection between the host and client is stable.
   - Use a lighter desktop environment on the VM for better responsiveness.

4. **Issue: "Black Screen" on VNC Viewer**
   - Ensure the VM has a running graphical desktop environment (e.g., GNOME, XFCE).
   - Verify the guest drivers are installed.

---

### **Step 8: Advanced Configuration**

For larger environments, consider using advanced tools:

1. **Cockpit with Virtual Machines Plugin**:
   - Install Cockpit for web-based VM management:

     ```bash
     sudo dnf install cockpit cockpit-machines
     sudo systemctl enable --now cockpit.socket
     ```

   - Access Cockpit at `https://<host-ip>:9090`.

2. **Custom VNC Ports**:
   - Assign static VNC ports to specific VMs for better organization.

---

### **Conclusion**

Setting up a VNC connection for KVM virtual machines on AlmaLinux is a practical way to manage virtual environments with a graphical interface. By following the steps outlined in this guide, you can enable VNC access, configure your firewall, and securely connect to your VMs from any location.

Whether you’re a beginner or an experienced sysadmin, this guide equips you with the knowledge to efficiently manage KVM virtual machines on AlmaLinux. Embrace the power of VNC for streamlined virtualization management today.
