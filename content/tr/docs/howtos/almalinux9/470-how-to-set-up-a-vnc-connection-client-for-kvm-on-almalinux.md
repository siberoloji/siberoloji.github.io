---
title: How to Set Up a VNC Client for KVM on AlmaLinux
description: Learn how to configure and use a VNC client to manage KVM virtual machines on AlmaLinux. This guide covers installation, connection, and security.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Set Up a VNC Client for KVM
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 470
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: set-vnc-client-kvm-almalinux
---
### How to Set Up a VNC Connection Client for KVM on AlmaLinux: A Comprehensive Guide

Virtual Network Computing (VNC) is a powerful protocol that allows users to remotely access and control virtual machines (VMs) hosted on a Kernel-based Virtual Machine (KVM) hypervisor. By configuring a VNC client on AlmaLinux, you can remotely manage VMs with a graphical interface, making it ideal for both novice and experienced users.

This guide provides a detailed walkthrough on setting up a VNC connection client for KVM on AlmaLinux, from installation to configuration and troubleshooting.

---

### **Why Use a VNC Client for KVM?**

A VNC client enables you to access and interact with virtual machines as if you were directly connected to them. This is especially useful for tasks like installing operating systems, managing graphical applications, or troubleshooting guest environments.

**Benefits of a VNC Client for KVM:**

- Access VMs with a full graphical interface.
- Perform administrative tasks remotely.
- Simplify interaction with guest operating systems.
- Manage multiple VMs from a single interface.

---

### **Step 1: Prerequisites**

Before setting up a VNC client for KVM on AlmaLinux, ensure the following prerequisites are met:

1. **Host Setup**:
   - A KVM hypervisor is installed and configured on the host system.
   - The virtual machine you want to access is configured to use VNC. (Refer to our guide on [Setting Up VNC for KVM on AlmaLinux](#).)

2. **Client System**:
   - Access to a system where you’ll install the VNC client.
   - A stable network connection to the KVM host.

3. **Network Configuration**:
   - The firewall on the KVM host must allow VNC connections (default port range: 5900–5999).

---

### **Step 2: Install a VNC Client on AlmaLinux**

There are several VNC client applications available. Here, we’ll cover the installation of **TigerVNC** and **Remmina**, two popular choices.

#### **Option 1: Install TigerVNC**

TigerVNC is a lightweight, easy-to-use VNC client.

1. Install TigerVNC:

   ```bash
   sudo dnf install -y tigervnc
   ```

2. Verify the installation:

   ```bash
   vncviewer --version
   ```

#### **Option 2: Install Remmina**

Remmina is a versatile remote desktop client that supports multiple protocols, including VNC and RDP.

1. Install Remmina and its plugins:

   ```bash
   sudo dnf install -y remmina remmina-plugins-vnc
   ```

2. Launch Remmina:

   ```bash
   remmina
   ```

---

### **Step 3: Configure VNC Access to KVM Virtual Machines**

#### **1. Identify the VNC Port**

To connect to a specific VM, you need to know its VNC display port.

1. Use `virsh` to find the VNC port:

   ```bash
   sudo virsh vncdisplay <vm-name>
   ```

   Example output:

   ```plaintext
   :1
   ```

2. Calculate the VNC port:
   - Add the display number (`:1`) to the default VNC base port (`5900`).
   - Example: `5900 + 1 = 5901`.

#### **2. Check the Host’s IP Address**

On the KVM host, find the IP address to use for the VNC connection:

```bash
ip addr
```

Example output:

```plaintext
192.168.1.100
```

---

### **Step 4: Connect to the VM Using a VNC Client**

#### **Using TigerVNC**

1. Launch TigerVNC:

   ```bash
   vncviewer
   ```

2. Enter the VNC server address:
   - Format: `<host-ip>:<port>`.
   - Example: `192.168.1.100:5901`.

3. Click **Connect**. If authentication is enabled, provide the required password.

#### **Using Remmina**

1. Open Remmina.
2. Create a new connection:
   - **Protocol**: VNC.
   - **Server**: `<host-ip>:<port>`.
   - Example: `192.168.1.100:5901`.
3. Save the connection and click **Connect**.

---

### **Step 5: Secure the VNC Connection**

By default, VNC connections are not encrypted. To secure your connection, use SSH tunneling.

#### **Set Up SSH Tunneling**

1. On the client machine, create an SSH tunnel:

   ```bash
   ssh -L 5901:localhost:5901 user@192.168.1.100
   ```

   - Replace `user` with your username on the KVM host.
   - Replace `192.168.1.100` with the KVM host’s IP address.

2. Point the VNC client to `localhost:5901` instead of the host IP.

---

### **Step 6: Troubleshooting Common Issues**

#### **1. Unable to Connect to VNC Server**

- Verify the VM is running:

  ```bash
  sudo virsh list --all
  ```

- Check the firewall rules on the host:

  ```bash
  sudo firewall-cmd --list-all
  ```

#### **2. Incorrect VNC Port**

- Ensure the correct port is being used:

  ```bash
  sudo virsh vncdisplay <vm-name>
  ```

#### **3. Black Screen**

- Ensure the VM is running a graphical desktop environment.
- Verify the VNC server configuration in the VM’s `<graphics>` section:

  ```xml
  <graphics type='vnc' port='-1' autoport='yes' listen='0.0.0.0'>
  ```

#### **4. Connection Timeout**

- Check if the VNC server is listening on the expected port:

  ```bash
  sudo netstat -tuln | grep 59
  ```

---

### **Step 7: Advanced Configuration**

#### **Set a Password for VNC Connections**

1. Edit the VM configuration:

   ```bash
   sudo virsh edit <vm-name>
   ```

2. Add a `<password>` element under the `<graphics>` section:

   ```xml
   <graphics type='vnc' port='-1' autoport='yes' listen='0.0.0.0' passwd='yourpassword'/>
   ```

#### **Use Cockpit for GUI Management**

Cockpit provides a modern web interface for managing VMs with integrated VNC.

1. Install Cockpit:

   ```bash
   sudo dnf install cockpit cockpit-machines -y
   ```

2. Start Cockpit:

   ```bash
   sudo systemctl enable --now cockpit.socket
   ```

3. Access Cockpit:
   Navigate to `https://<host-ip>:9090` in a browser, log in, and use the **Virtual Machines** tab.

---

### **Conclusion**

Setting up a VNC client for KVM on AlmaLinux is an essential skill for managing virtual machines remotely. Whether you use TigerVNC, Remmina, or a web-based tool like Cockpit, VNC offers a flexible and user-friendly way to interact with your VMs.

This guide has provided a step-by-step approach to installing and configuring a VNC client, connecting to KVM virtual machines, and securing your connections. By mastering these techniques, you can efficiently manage virtual environments from any location.
