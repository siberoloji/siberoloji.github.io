---
title: How to Use External Storage with Podman on AlmaLinux
linkTitle: External Storage with Podman
description: This blog will guide you through setting up and managing external storage with Podman on AlmaLinux.
date: 2024-12-11
weight: 590
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
url: external-storage-podman-almalinux
---
Podman has gained popularity for managing containers without a daemon process and its ability to run rootless containers, making it secure and reliable. When deploying containers in production or development environments, managing persistent storage is a common requirement. By default, containers are ephemeral, meaning their data is lost once they are stopped or removed. Using external storage with Podman on AlmaLinux ensures that your data persists, even when the container lifecycle ends.

This blog will guide you through setting up and managing external storage with Podman on AlmaLinux.

---

## Introduction to Podman, AlmaLinux, and External Storage

### What is Podman?

Podman is an OCI-compliant container management tool designed to run containers without a daemon. Unlike Docker, Podman operates in a rootless mode by default, offering better security. It also supports rootful mode for users requiring elevated privileges.

### Why AlmaLinux?

AlmaLinux is a stable, community-driven distribution designed for enterprise workloads. Its compatibility with RHEL ensures that enterprise features like SELinux and robust networking are supported, making it an excellent host for Podman.

### Why External Storage?

Containers often need persistent storage to maintain data between container restarts or replacements. External storage allows:

- **Persistence:** Store data outside of the container lifecycle.
- **Scalability:** Share storage between multiple containers.
- **Flexibility:** Use local disks or network-attached storage systems.

---

## Prerequisites

Before proceeding, ensure you have the following:

1. **AlmaLinux Installation:** A system running AlmaLinux with sudo access.
2. **Podman Installed:** Install Podman using:

   ```bash
   sudo dnf install -y podman
   ```

3. **Root or Rootless User:** Depending on whether you are running containers in rootless or rootful mode.
4. **External Storage Prepared:** An external disk, NFS share, or a storage directory ready for use.

---

## Types of External Storage Supported by Podman

Podman supports multiple external storage configurations:

1. **Bind Mounts:**
   - Map a host directory or file directly into the container.
   - Suitable for local storage scenarios.

2. **Named Volumes:**
   - Managed by Podman.
   - Stored under `/var/lib/containers/storage/volumes` for rootful containers or `$HOME/.local/share/containers/storage/volumes` for rootless containers.

3. **Network-Attached Storage (NAS):**
   - Use NFS, CIFS, or other protocols to mount remote storage.
   - Ideal for shared data across multiple hosts.

4. **Block Devices:**
   - Attach raw block storage devices directly to containers.
   - Common in scenarios requiring high-performance I/O.

---

## Setting Up External Storage

### Example: Setting Up an NFS Share

If you’re using an NFS share as external storage, follow these steps:

1. **Install NFS Utilities:**

   ```bash
   sudo dnf install -y nfs-utils
   ```

2. **Mount the NFS Share:**
   Mount the NFS share to a directory on your AlmaLinux host:

   ```bash
   sudo mkdir -p /mnt/nfs_share
   sudo mount -t nfs <nfs-server-ip>:/path/to/share /mnt/nfs_share
   ```

3. **Make the Mount Persistent:**
   Add the following entry to `/etc/fstab`:

   ```
   <nfs-server-ip>:/path/to/share /mnt/nfs_share nfs defaults 0 0
   ```

---

## Mounting External Volumes to Podman Containers

### Step 1: Bind Mount a Host Directory

Bind mounts map a host directory to a container. For example, to mount `/mnt/nfs_share` into a container:

```bash
podman run -d --name webserver -v /mnt/nfs_share:/usr/share/nginx/html:Z -p 8080:80 nginx
```

- `-v /mnt/nfs_share:/usr/share/nginx/html`: Maps the host directory to the container path.
- `:Z`: Configures SELinux to allow container access to the directory.

### Step 2: Test the Volume

Access the container to verify the volume:

```bash
podman exec -it webserver ls /usr/share/nginx/html
```

Add or remove files in `/mnt/nfs_share` on the host, and confirm they appear inside the container.

---

## Using Named Volumes

Podman supports named volumes for managing container data. These volumes are managed by Podman itself and are ideal for isolated or portable setups.

### Step 1: Create a Named Volume

Create a named volume using:

```bash
podman volume create my_volume
```

### Step 2: Attach the Volume to a Container

Use the named volume in a container:

```bash
podman run -d --name db -v my_volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root mariadb
```

Here, `my_volume` is mounted to `/var/lib/mysql` inside the container.

### Step 3: Inspect the Volume

Inspect the volume’s metadata:

```bash
podman volume inspect my_volume
```

---

## Inspecting and Managing Volumes

### List All Volumes

To list all named volumes:

```bash
podman volume ls
```

### Remove a Volume

Remove an unused volume:

```bash
podman volume rm my_volume
```

---

## Troubleshooting Common Issues

### 1. **SELinux Permission Denied**

If SELinux blocks access to bind-mounted volumes, ensure the directory has the correct SELinux context:

```bash
sudo chcon -Rt svirt_sandbox_file_t /mnt/nfs_share
```

Alternatively, use the `:Z` or `:z` option with the `-v` flag when running the container.

### 2. **Container Cannot Access NFS Share**

- Ensure the NFS share is mounted correctly on the host.
- Verify that the container user has permission to access the directory.
- Check the firewall settings on the NFS server and client.

### 3. **Volume Not Persisting**

Named volumes are persistent unless explicitly removed. Ensure the container is using the correct volume path.

---

## Conclusion

Using external storage with Podman on AlmaLinux provides flexibility, scalability, and persistence for containerized applications. Whether you’re using bind mounts for local directories, named volumes for portability, or network-attached storage for shared environments, Podman makes it straightforward to integrate external storage.

By following this guide, you can effectively set up and manage external storage for your containers, ensuring data persistence and improved workflows. Experiment with different storage options to find the setup that best fits your environment.

If you have questions or insights, feel free to share them in the comments below. Happy containerizing!
