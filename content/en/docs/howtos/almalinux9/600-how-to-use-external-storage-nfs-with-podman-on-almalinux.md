---
title: How to Use External Storage (NFS) with Podman on AlmaLinux
linkTitle: External Storage (NFS) with Podman
description: In this blog, we’ll explore how to use NFS as external storage with Podman on AlmaLinux.
date: 2024-12-11
weight: 600
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
url: external-storage-nfs-podman-almalinux
---
Podman has emerged as a secure, efficient, and flexible alternative to Docker for managing containers. It is fully compatible with the OCI (Open Container Initiative) standards and provides robust features for rootless and rootful container management. When running containerized workloads, ensuring persistent data storage is crucial. Network File System (NFS) is a powerful solution for external storage that allows multiple systems to share files seamlessly.

In this blog, we’ll explore how to use NFS as external storage with Podman on AlmaLinux. This step-by-step guide covers installation, configuration, and troubleshooting to ensure a smooth experience.

---

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Introduction to NFS, Podman, and AlmaLinux](#introduction-to-nfs-podman-and-almalinux)
  - [What is NFS?](#what-is-nfs)
  - [Why Use Podman?](#why-use-podman)
  - [Why AlmaLinux?](#why-almalinux)
- [Advantages of Using NFS with Podman](#advantages-of-using-nfs-with-podman)
- [Prerequisites](#prerequisites)
- [Setting Up the NFS Server](#setting-up-the-nfs-server)
  - [Step 1: Install NFS Server](#step-1-install-nfs-server)
  - [Step 2: Create a Shared Directory](#step-2-create-a-shared-directory)
  - [Step 3: Configure the NFS Export](#step-3-configure-the-nfs-export)
  - [Step 4: Start and Enable NFS](#step-4-start-and-enable-nfs)
- [Configuring the NFS Client on AlmaLinux](#configuring-the-nfs-client-on-almalinux)
  - [Step 1: Install NFS Utilities](#step-1-install-nfs-utilities)
  - [Step 2: Create a Mount Point](#step-2-create-a-mount-point)
  - [Step 3: Mount the NFS Share](#step-3-mount-the-nfs-share)
  - [Step 4: Configure Persistent Mounting](#step-4-configure-persistent-mounting)
- [Mounting NFS Storage to a Podman Container](#mounting-nfs-storage-to-a-podman-container)
  - [Step 1: Create a Container with NFS Volume](#step-1-create-a-container-with-nfs-volume)
  - [Step 2: Verify the Mount Inside the Container](#step-2-verify-the-mount-inside-the-container)
- [Testing the Configuration](#testing-the-configuration)
- [Security Considerations](#security-considerations)
- [Troubleshooting Common Issues](#troubleshooting-common-issues)
  - [1. **Permission Denied**](#1-permission-denied)
  - [2. **Mount Fails**](#2-mount-fails)
  - [3. **Files Not Visible in the Container**](#3-files-not-visible-in-the-container)
- [Conclusion](#conclusion)

---

## Introduction to NFS, Podman, and AlmaLinux

### What is NFS?

Network File System (NFS) is a protocol that allows systems to share directories over a network. It is widely used in enterprise environments for shared storage and enables containers to persist and share data across hosts.

### Why Use Podman?

Podman, a daemonless container engine, allows users to run containers securely without requiring elevated privileges. Its rootless mode and compatibility with Docker commands make it an excellent choice for modern containerized workloads.

### Why AlmaLinux?

AlmaLinux is an open-source, community-driven distribution designed for enterprise environments. Its compatibility with RHEL and focus on security and stability make it an ideal host for running Podman and managing shared NFS storage.

---

## Advantages of Using NFS with Podman

- **Data Persistence:** Store container data externally to ensure it persists across container restarts or deletions.
- **Scalability:** Share data between multiple containers or systems.
- **Centralized Management:** Manage storage from a single NFS server for consistent backups and access.
- **Cost-Effective:** Utilize existing infrastructure for shared storage.

---

## Prerequisites

Before proceeding, ensure the following:

1. **NFS Server Available:** An NFS server with a shared directory accessible from the AlmaLinux host.
2. **AlmaLinux with Podman Installed:** Install Podman using:

   ```bash
   sudo dnf install -y podman
   ```

3. **Basic Linux Knowledge:** Familiarity with terminal commands and file permissions.

---

## Setting Up the NFS Server

If you don’t have an NFS server set up yet, follow these steps:

### Step 1: Install NFS Server

On the server machine, install the NFS server package:

```bash
sudo dnf install -y nfs-utils
```

### Step 2: Create a Shared Directory

Create a directory to be shared over NFS:

```bash
sudo mkdir -p /srv/nfs/share
sudo chown -R nfsnobody:nfsnobody /srv/nfs/share
sudo chmod 755 /srv/nfs/share
```

### Step 3: Configure the NFS Export

Add the directory to the `/etc/exports` file:

```bash
sudo nano /etc/exports
```

Add the following line to share the directory:

```
/srv/nfs/share 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
```

- `192.168.1.0/24`: Limits access to systems in the specified subnet.
- `rw`: Allows read and write access.
- `sync`: Ensures changes are written to disk immediately.
- `no_root_squash`: Prevents root access to the shared directory from being mapped to the `nfsnobody` user.

Save and exit.

### Step 4: Start and Enable NFS

Start and enable the NFS server:

```bash
sudo systemctl enable --now nfs-server
sudo exportfs -arv
```

Verify the NFS server is running:

```bash
sudo systemctl status nfs-server
```

---

## Configuring the NFS Client on AlmaLinux

Now configure the AlmaLinux system to access the NFS share.

### Step 1: Install NFS Utilities

Install the required utilities:

```bash
sudo dnf install -y nfs-utils
```

### Step 2: Create a Mount Point

Create a directory to mount the NFS share:

```bash
sudo mkdir -p /mnt/nfs_share
```

### Step 3: Mount the NFS Share

Mount the NFS share temporarily:

```bash
sudo mount -t nfs <nfs-server-ip>:/srv/nfs/share /mnt/nfs_share
```

Replace `<nfs-server-ip>` with the IP address of your NFS server.

Verify the mount:

```bash
df -h
```

You should see the NFS share listed.

### Step 4: Configure Persistent Mounting

To ensure the NFS share mounts automatically after a reboot, add an entry to `/etc/fstab`:

```bash
<nfs-server-ip>:/srv/nfs/share /mnt/nfs_share nfs defaults 0 0
```

---

## Mounting NFS Storage to a Podman Container

### Step 1: Create a Container with NFS Volume

Run a container and mount the NFS storage using the `-v` flag:

```bash
podman run -d --name nginx-server -v /mnt/nfs_share:/usr/share/nginx/html:Z -p 8080:80 nginx
```

- `/mnt/nfs_share:/usr/share/nginx/html`: Maps the NFS mount to the container's `html` directory.
- `:Z`: Configures SELinux context for the volume.

### Step 2: Verify the Mount Inside the Container

Access the container:

```bash
podman exec -it nginx-server /bin/bash
```

Check the contents of `/usr/share/nginx/html`:

```bash
ls -l /usr/share/nginx/html
```

Files added to `/mnt/nfs_share` on the host should appear in the container.

---

## Testing the Configuration

1. **Add Files to the NFS Share:**
   Create a test file on the host in the NFS share:

   ```bash
   echo "Hello, NFS and Podman!" > /mnt/nfs_share/index.html
   ```

2. **Access the Web Server:**
   Open a browser and navigate to `http://<host-ip>:8080`. You should see the contents of `index.html`.

---

## Security Considerations

- **SELinux Contexts:**
  Ensure proper SELinux contexts using `:Z` or `chcon` commands:

  ```bash
  sudo chcon -Rt svirt_sandbox_file_t /mnt/nfs_share
  ```

- **Firewall Rules:**
  Allow NFS-related ports through the firewall on both the server and client:

  ```bash
  sudo firewall-cmd --add-service=nfs --permanent
  sudo firewall-cmd --reload
  ```

- **Restrict Access:**
  Use IP-based restrictions in `/etc/exports` to limit access to trusted systems.

---

## Troubleshooting Common Issues

### 1. **Permission Denied**

- Ensure the NFS share has the correct permissions.
- Verify SELinux contexts using `ls -Z`.

### 2. **Mount Fails**

- Check the NFS server’s status and ensure the export is correctly configured.
- Test connectivity to the server:

  ```bash
  ping <nfs-server-ip>
  ```

### 3. **Files Not Visible in the Container**

- Confirm the NFS share is mounted on the host.
- Restart the container to ensure the volume is properly mounted.

---

## Conclusion

Using NFS with Podman on AlmaLinux enables persistent, scalable, and centralized storage for containerized workloads. By following this guide, you can set up an NFS server, configure AlmaLinux as a client, and integrate NFS storage into Podman containers. This setup is ideal for applications requiring shared storage across multiple containers or hosts.

With proper configuration and security measures, NFS with Podman provides a robust solution for enterprise-grade storage in containerized environments. Experiment with this setup and optimize it for your specific needs.

Let us know your thoughts or questions in the comments below. Happy containerizing!
