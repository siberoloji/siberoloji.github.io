---
title: How to Add Podman Container Images on AlmaLinux
linkTitle: Podman Container Images
description: This blog post will guide you step-by-step on adding Podman container images to AlmaLinux.
date: 2024-12-11
weight: 560
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
url: add-podman-container-images-almalinux
---
Podman is a containerization platform that allows developers and administrators to run and manage containers without needing a daemon process. Unlike Docker, Podman operates in a rootless manner by default, enhancing security and flexibility. AlmaLinux, a community-driven, free, and open-source Linux distribution, is highly compatible with enterprise use cases, making it an excellent choice for running Podman. This blog post will guide you step-by-step on adding Podman container images to AlmaLinux.

---

## Introduction to Podman and AlmaLinux

### What is Podman?

Podman is a powerful tool for managing OCI (Open Container Initiative) containers and images. It is widely regarded as a more secure alternative to Docker, thanks to its daemonless and rootless architecture. With Podman, you can build, run, and manage containers and even create Kubernetes YAML configurations.

### Why AlmaLinux?

AlmaLinux, a successor to CentOS, is a robust and reliable platform suited for enterprise applications. Its stability and compatibility with Red Hat Enterprise Linux (RHEL) make it an ideal environment for running containers.

Combining Podman with AlmaLinux creates a powerful, secure, and efficient system for modern containerized workloads.

---

## Prerequisites

Before you begin, ensure the following:

1. **AlmaLinux System Ready:** You have an up-to-date AlmaLinux system with sudo privileges.
2. **Stable Internet Connection:** Required to install Podman and fetch container images.
3. **SELinux Considerations:** SELinux should be in a permissive or enforcing state.
4. **Basic Linux Knowledge:** Familiarity with terminal commands and containerization concepts.

---

## Installing Podman on AlmaLinux

### Step 1: Update Your System

Begin by updating your AlmaLinux system to ensure you have the latest software and security patches:

```bash
sudo dnf update -y
```

### Step 2: Install Podman

Podman is available in the default AlmaLinux repositories. Use the following command to install it:

```bash
sudo dnf install -y podman
```

### Step 3: Verify Installation

After the installation, confirm that Podman is installed by checking its version:

```bash
podman --version
```

You should see output similar to:

```bash
podman version 4.x.x
```

### Step 4: Enable Rootless Mode (Optional)

For added security, consider running Podman in rootless mode. Simply switch to a non-root user to leverage this feature.

```bash
sudo usermod -aG podman $USER
newgrp podman
```

---

## Fetching Container Images with Podman

Podman allows you to pull container images from registries such as Docker Hub, Quay.io, or private registries.

### Step 1: Search for Images

Use the `podman search` command to find images:

```bash
podman search httpd
```

This will display a list of available images related to the `httpd` web server.

### Step 2: Pull Images

To pull an image, use the `podman pull` command:

```bash
podman pull docker.io/library/httpd:latest
```

The image will be downloaded and stored locally. You can specify versions (tags) using the `:tag` syntax.

---

## Adding Podman Container Images

There are various ways to add images to Podman on AlmaLinux:

### Option 1: Pulling from Public Registries

The most common method is to pull images from public registries like Docker Hub. This was demonstrated in the previous section.

```bash
podman pull docker.io/library/nginx:latest
```

### Option 2: Importing from Local Files

If you have an image saved as a TAR file, you can import it using the `podman load` command:

```bash
podman load < /path/to/image.tar
```

The image will be added to your local Podman image repository.

### Option 3: Building Images from Dockerfiles

You can create a custom image by building it from a `Dockerfile`. Here's how:

1. Create a `Dockerfile`:

```dockerfile
FROM alpine:latest
RUN apk add --no-cache nginx
CMD ["nginx", "-g", "daemon off;"]
```

2. Build the image:

```bash
podman build -t my-nginx .
```

This will create an image named `my-nginx`.

### Option 4: Using Private Registries

If your organization uses a private registry, authenticate and pull images as follows:

1. Log in to the registry:

```bash
podman login myregistry.example.com
```

2. Pull an image:

```bash
podman pull myregistry.example.com/myimage:latest
```

---

## Managing and Inspecting Images

### Listing Images

To view all locally stored images, run:

```bash
podman images
```

The output will display the repository, tags, and size of each image.

### Inspecting Image Metadata

For detailed information about an image, use:

```bash
podman inspect <image-id>
```

This command outputs JSON data containing configuration details.

### Tagging Images

To tag an image for easier identification:

```bash
podman tag <image-id> mytaggedimage:v1
```

### Removing Images

To delete unused images, use:

```bash
podman rmi <image-id>
```

---

## Troubleshooting Common Issues

### 1. **Network Issues While Pulling Images**

- Ensure your firewall is not blocking access to container registries.
- Check DNS resolution and registry availability.

```bash
ping docker.io
```

### 2. **SELinux Denials**

If SELinux causes permission issues, review logs with:

```bash
sudo ausearch -m avc -ts recent
```

You can temporarily set SELinux to permissive mode for troubleshooting:

```bash
sudo setenforce 0
```

### 3. **Rootless Mode Problems**

Ensure your user is added to the `podman` group and restart your session.

```bash
sudo usermod -aG podman $USER
newgrp podman
```

---

## Conclusion

Adding Podman container images on AlmaLinux is a straightforward process. By following the steps outlined in this guide, you can set up Podman, pull container images, and manage them efficiently. AlmaLinux and Podman together provide a secure and flexible environment for containerized workloads, whether for development, testing, or production.

If you're new to containers or looking to transition from Docker, Podman offers a compelling alternative that integrates seamlessly with AlmaLinux. Take the first step towards mastering Podman today!

---

By following this guide, you'll have a fully functional Podman setup on AlmaLinux, empowering you to take full advantage of containerization. Have questions or tips to share? Drop them in the comments below!