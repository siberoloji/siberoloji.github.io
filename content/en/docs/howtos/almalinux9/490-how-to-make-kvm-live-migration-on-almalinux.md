---
title: How to Make KVM Live Migration on AlmaLinux
description: Discover how to configure and execute KVM live migration on AlmaLinux. A step-by-step guide for seamless virtual machine transfer between hosts.
date: 2024-12-11
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: Make KVM Live Migration
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 490
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: kvm-live-migration-almalinux
---
#### Introduction

Live migration is a critical feature in virtualized environments, enabling seamless transfer of running virtual machines (VMs) between host servers with minimal downtime. This capability is essential for system maintenance, load balancing, and disaster recovery. AlmaLinux, a robust and community-driven enterprise-grade Linux distribution, offers an ideal platform for implementing KVM live migration.

This guide walks you through the process of configuring and performing KVM live migration on AlmaLinux. From setting up your environment to executing the migration, we’ll cover every step in detail to help you achieve smooth and efficient results.

---

### What is KVM Live Migration?

KVM live migration involves transferring a running VM from one physical host to another without significant disruption to its operation. This feature is commonly used for:

- **Hardware Maintenance**: Moving VMs away from a host that requires updates or repairs.
- **Load Balancing**: Redistributing VMs across hosts to optimize resource usage.
- **Disaster Recovery**: Quickly migrating workloads during emergencies.

Live migration requires the source and destination hosts to share certain configurations, such as storage and networking, and demands proper setup for secure and efficient operation.

---

### Prerequisites

To perform live migration on AlmaLinux, ensure the following prerequisites are met:

1. **Hosts Configuration**:
   - Two or more physical servers with similar hardware configurations.
   - AlmaLinux installed and configured on all participating hosts.

2. **Shared Storage**:
   - A shared storage system (e.g., NFS, GlusterFS, or iSCSI) accessible to all hosts.

3. **Network**:
   - Hosts connected via a high-speed network to minimize latency during migration.

4. **Virtualization Tools**:
   - KVM, libvirt, and related packages installed on all hosts.

5. **Permissions**:
   - Administrative privileges on all hosts.

6. **Time Synchronization**:
   - Synchronize the system clocks using tools like `chronyd` or `ntpd`.

---

### Step-by-Step Guide to KVM Live Migration on AlmaLinux

#### Step 1: Install Required Packages

Ensure all required virtualization tools are installed on both source and destination hosts:

```bash
sudo dnf install qemu-kvm libvirt virt-manager -y
```

Start and enable the libvirt service:

```bash
sudo systemctl enable --now libvirtd
```

Verify that KVM is installed and functional:

```bash
virsh version
```

#### Step 2: Configure Shared Storage

Shared storage is essential for live migration, as both hosts need access to the same VM disk files.

- **Setup NFS (Example)**:
  1. Install the NFS server on the storage host:

     ```bash
     sudo dnf install nfs-utils -y
     ```

  2. Configure the `/etc/exports` file to share the directory:

     ```bash
     /var/lib/libvirt/images *(rw,sync,no_root_squash)
     ```

  3. Start and enable the NFS service:

     ```bash
     sudo systemctl enable --now nfs-server
     ```

  4. Mount the shared storage on both source and destination hosts:

     ```bash
     sudo mount <storage-host-ip>:/var/lib/libvirt/images /var/lib/libvirt/images
     ```

#### Step 3: Configure Passwordless SSH Access

For secure communication, configure passwordless SSH access between the hosts:

```bash
ssh-keygen -t rsa
ssh-copy-id <destination-host-ip>
```

Test the connection to ensure it works without a password prompt:

```bash
ssh <destination-host-ip>
```

#### Step 4: Configure Libvirt for Migration

Edit the `libvirtd.conf` file on both hosts to allow migrations:

```bash
sudo nano /etc/libvirt/libvirtd.conf
```

Uncomment and set the following parameters:

```conf
listen_tls = 0
listen_tcp = 1
tcp_port = "16509"
auth_tcp = "none"
```

Restart the libvirt service:

```bash
sudo systemctl restart libvirtd
```

#### Step 5: Configure the Firewall

Open the necessary ports for migration on both hosts:

```bash
sudo firewall-cmd --add-port=16509/tcp --permanent
sudo firewall-cmd --add-port=49152-49216/tcp --permanent
sudo firewall-cmd --reload
```

#### Step 6: Perform Live Migration

Use the `virsh` command to perform the migration. First, list the running VMs on the source host:

```bash
virsh list
```

Execute the migration command:

```bash
virsh migrate --live <vm-name> qemu+tcp://<destination-host-ip>/system
```

Monitor the migration progress and verify that the VM is running on the destination host:

```bash
virsh list
```

---

### Troubleshooting Tips

1. **Migration Fails**:
   - Verify network connectivity between the hosts.
   - Ensure both hosts have access to the shared storage.
   - Check for configuration mismatches in `libvirtd.conf`.

2. **Firewall Issues**:
   - Ensure the correct ports are open on both hosts using `firewall-cmd --list-all`.

3. **Slow Migration**:
   - Use a high-speed network for migration to reduce latency.
   - Optimize the VM's memory allocation for faster data transfer.

4. **Storage Access Errors**:
   - Double-check the shared storage configuration and mount points.

---

### Best Practices for KVM Live Migration

- **Use Shared Storage**: Ensure reliable shared storage for consistent access to VM disk files.
- **Secure SSH Communication**: Use SSH keys and restrict access to trusted hosts only.
- **Monitor Resources**: Keep an eye on CPU, memory, and network usage during migration to avoid resource exhaustion.
- **Plan Maintenance Windows**: Schedule live migrations during low-traffic periods to minimize potential disruption.

---

### Conclusion

KVM live migration on AlmaLinux provides an efficient way to manage virtualized workloads with minimal downtime. Whether for hardware maintenance, load balancing, or disaster recovery, mastering live migration ensures greater flexibility and reliability in managing your IT environment.

By following the steps outlined in this guide, you’ve configured your AlmaLinux hosts to support live migration and performed your first migration successfully. With its enterprise-ready features and strong community support, AlmaLinux is an excellent choice for virtualization projects.
