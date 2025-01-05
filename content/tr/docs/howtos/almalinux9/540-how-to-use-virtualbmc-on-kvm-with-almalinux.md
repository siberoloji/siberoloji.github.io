---
title: How to Use VirtualBMC on KVM with AlmaLinux
description: Learn how to set up and use VirtualBMC on KVM with AlmaLinux. A step-by-step guide to managing virtual machines with IPMI-based tools.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Use VirtualBMC on KVM
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 540
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: virtualbmc-kvm-almalinux
---
#### Introduction

As virtualization continues to grow in popularity, tools that enhance the management and functionality of virtualized environments are becoming essential. VirtualBMC (Virtual Baseboard Management Controller) is one such tool. It simulates the functionality of a physical BMC, enabling administrators to manage virtual machines (VMs) as though they were physical servers through protocols like Intelligent Platform Management Interface (IPMI).

In this blog post, we’ll explore how to set up and use VirtualBMC (vBMC) on KVM with AlmaLinux. From installation to configuration and practical use cases, we’ll cover everything you need to know to integrate vBMC into your virtualized infrastructure.

---

### What is VirtualBMC?

VirtualBMC is an OpenStack project that provides a software-based implementation of a Baseboard Management Controller. BMCs are typically used in physical servers for out-of-band management tasks like power cycling, monitoring hardware health, or accessing consoles. With VirtualBMC, similar capabilities can be extended to KVM-based virtual machines, enabling:

- **Remote Management**: Control and manage VMs remotely using IPMI.
- **Integration with Automation Tools**: Streamline workflows with tools like Ansible or OpenStack Ironic.
- **Enhanced Testing Environments**: Simulate physical server environments in a virtualized setup.

---

### Prerequisites

Before diving into the setup process, ensure the following prerequisites are met:

1. **Host System**:
   - AlmaLinux 8 or newer installed.
   - KVM, QEMU, and libvirt configured and operational.

2. **Network**:
   - Network configuration that supports communication between the vBMC and the client tools.

3. **Virtualization Tools**:
   - `virt-manager` or `virsh` for managing VMs.
   - `VirtualBMC` package for implementing BMC functionality.

4. **Permissions**:
   - Administrative privileges to install packages and configure the environment.

---

### Step-by-Step Guide to Using VirtualBMC on KVM

#### Step 1: Install VirtualBMC

1. Install VirtualBMC using pip:

   ```bash
   sudo dnf install python3-pip -y
   sudo pip3 install virtualbmc
   ```

2. Verify the installation:

   ```bash
   vbmc --version
   ```

---

#### Step 2: Configure VirtualBMC

1. **Create a Configuration Directory**:
   VirtualBMC stores its configuration files in `/etc/virtualbmc` or the user’s home directory by default. Ensure the directory exists:

   ```bash
   mkdir -p ~/.vbmc
   ```

2. **Set Up Libvirt**:
   Ensure libvirt is installed and running:

   ```bash
   sudo dnf install libvirt libvirt-python -y
   sudo systemctl enable --now libvirtd
   ```

3. **Check Available VMs**:
   List the VMs on your host to identify the one you want to manage:

   ```bash
   virsh list --all
   ```

4. **Add a VM to VirtualBMC**:
   Use the `vbmc` command to associate a VM with a virtual BMC:

   ```bash
   vbmc add <vm-name> --port <port-number>
   ```

   - Replace `<vm-name>` with the name of the VM (as listed by `virsh`).
   - Replace `<port-number>` with an unused port (e.g., 6230).

   Example:

   ```bash
   vbmc add my-vm --port 6230
   ```

5. **Start the VirtualBMC Service**:
   Start the vBMC instance for the configured VM:

   ```bash
   vbmc start <vm-name>
   ```

6. **Verify the vBMC Instance**:
   List all vBMC instances to ensure your configuration is active:

   ```bash
   vbmc list
   ```

---

#### Step 3: Use IPMI to Manage the VM

Once the VirtualBMC instance is running, you can use IPMI tools to manage the VM.

1. **Install IPMI Tools**:

   ```bash
   sudo dnf install ipmitool -y
   ```

2. **Check Power Status**:
   Use the IPMI command to query the power status of the VM:

   ```bash
   ipmitool -I lanplus -H <host-ip> -p <port-number> -U admin -P password power status
   ```

3. **Power On the VM**:

   ```bash
   ipmitool -I lanplus -H <host-ip> -p <port-number> -U admin -P password power on
   ```

4. **Power Off the VM**:

   ```bash
   ipmitool -I lanplus -H <host-ip> -p <port-number> -U admin -P password power off
   ```

5. **Reset the VM**:

   ```bash
   ipmitool -I lanplus -H <host-ip> -p <port-number> -U admin -P password power reset
   ```

---

#### Step 4: Automate vBMC Management with Systemd

To ensure vBMC starts automatically on boot, you can configure it as a systemd service.

1. **Create a Systemd Service File**:
   Create a service file for vBMC:

   ```bash
   sudo nano /etc/systemd/system/vbmc.service
   ```

2. **Add the Following Content**:

   ```ini
   [Unit]
   Description=Virtual BMC Service
   After=network.target

   [Service]
   Type=simple
   User=root
   ExecStart=/usr/local/bin/vbmcd

   [Install]
   WantedBy=multi-user.target
   ```

3. **Enable and Start the Service**:

   ```bash
   sudo systemctl enable vbmc.service
   sudo systemctl start vbmc.service
   ```

---

#### Step 5: Monitor and Manage vBMC

VirtualBMC includes several commands for monitoring and managing instances:

- **List All vBMC Instances**:

  ```bash
  vbmc list
  ```

- **Show Details of a Specific Instance**:

  ```bash
  vbmc show <vm-name>
  ```

- **Stop a vBMC Instance**:

  ```bash
  vbmc stop <vm-name>
  ```

- **Remove a vBMC Instance**:

  ```bash
  vbmc delete <vm-name>
  ```

---

### Use Cases for VirtualBMC

1. **Testing and Development**:
   Simulate physical server environments for testing automation tools like OpenStack Ironic.

2. **Remote Management**:
   Control VMs in a way that mimics managing physical servers.

3. **Learning and Experimentation**:
   Practice IPMI-based management workflows in a virtualized environment.

4. **Integration with Automation Tools**:
   Use tools like Ansible to automate VM management via IPMI commands.

---

### Troubleshooting Tips

1. **vBMC Fails to Start**:
   - Ensure that the libvirt service is running:

     ```bash
     sudo systemctl restart libvirtd
     ```

2. **IPMI Commands Time Out**:
   - Verify that the port specified in `vbmc add` is not blocked by the firewall:

     ```bash
     sudo firewall-cmd --add-port=<port-number>/tcp --permanent
     sudo firewall-cmd --reload
     ```

3. **VM Not Found by vBMC**:
   - Double-check the VM name using `virsh list --all`.

4. **Authentication Issues**:
   - Ensure you’re using the correct username and password (`admin`/`password` by default).

---

### Best Practices for Using VirtualBMC

- **Secure IPMI Access**: Restrict access to the vBMC ports using firewalls or network policies.
- **Monitor Logs**: Check the vBMC logs for troubleshooting:

  ```bash
  journalctl -u vbmc.service
  ```

- **Keep Software Updated**: Regularly update VirtualBMC and related tools to ensure compatibility and security.
- **Automate Tasks**: Leverage automation tools like Ansible to streamline vBMC management.

---

### Conclusion

VirtualBMC on KVM with AlmaLinux provides a powerful way to manage virtual machines as if they were physical servers. Whether you’re testing automation workflows, managing VMs remotely, or simulating a hardware environment, VirtualBMC offers a versatile and easy-to-use solution.

By following this guide, you’ve set up VirtualBMC, associated it with your VMs, and learned how to manage them using IPMI commands. This setup enhances the functionality and flexibility of your virtualized infrastructure, making it suitable for both production and development environments.
