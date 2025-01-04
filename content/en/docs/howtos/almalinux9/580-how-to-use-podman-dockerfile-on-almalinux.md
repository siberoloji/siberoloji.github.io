---
title: How to Use Dockerfiles with Podman on AlmaLinux
linkTitle: Dockerfiles with Podman
description: In this blog post, we’ll dive into the steps to use Dockerfiles with Podman on AlmaLinux.
date: 2024-12-11
weight: 580
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
url: dockerfiles-podman-almalinux
---
Podman is an increasingly popular alternative to Docker for managing containers, and it is fully compatible with OCI (Open Container Initiative) standards. If you’re running AlmaLinux, a community-supported, enterprise-grade Linux distribution, you can leverage Podman to build, manage, and deploy containers efficiently using Dockerfiles. In this blog post, we’ll dive into the steps to use Dockerfiles with Podman on AlmaLinux.

---

## Introduction to Podman and AlmaLinux

Podman is a container management tool that provides a seamless alternative to Docker. It offers daemonless and rootless operation, which enhances security by running containers without requiring root privileges. AlmaLinux, an enterprise-ready Linux distribution, is a perfect host for Podman due to its stability and compatibility with RHEL ecosystems.

When using Podman on AlmaLinux, Dockerfiles are your go-to tool for automating container image creation. They define the necessary steps to build an image, allowing you to replicate environments and workflows efficiently.

---

## Understanding Dockerfiles

A Dockerfile is a text file containing instructions to automate the process of creating a container image. Each line in the Dockerfile represents a step in the build process. Here’s an example:

```dockerfile
# Use an official base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Add a file to the container
COPY myapp /usr/src/myapp

# Set the working directory
WORKDIR /usr/src/myapp

# Define the command to run
CMD ["./start.sh"]
```

The Dockerfile is the foundation for creating customized container images tailored to specific applications.

---

## Prerequisites

Before proceeding, ensure you have the following:

1. **AlmaLinux Installed:** A working installation of AlmaLinux with a non-root user having `sudo` privileges.
2. **Podman Installed:** Installed and configured Podman (steps below).
3. **Basic Dockerfile Knowledge:** Familiarity with Dockerfile syntax is helpful but not required.

---

## Installing Podman on AlmaLinux

To start using Dockerfiles with Podman, you must install Podman on your AlmaLinux system.

### Step 1: Update the System

Update your package manager to ensure you have the latest software versions:

```bash
sudo dnf update -y
```

### Step 2: Install Podman

Install Podman using the default AlmaLinux repository:

```bash
sudo dnf install -y podman
```

### Step 3: Verify the Installation

Check the installed version to ensure Podman is set up correctly:

```bash
podman --version
```

---

## Creating a Dockerfile

Let’s create a Dockerfile to demonstrate building a simple image with Podman.

### Step 1: Set Up a Workspace

Create a directory for your project:

```bash
mkdir ~/podman-dockerfile-demo
cd ~/podman-dockerfile-demo
```

### Step 2: Write the Dockerfile

Create a `Dockerfile` in the project directory:

```bash
nano Dockerfile
```

Add the following content to the Dockerfile:

```dockerfile
# Start with an official base image
FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache curl

# Copy a script into the container
COPY test.sh /usr/local/bin/test.sh

# Grant execute permissions
RUN chmod +x /usr/local/bin/test.sh

# Set the default command
CMD ["test.sh"]
```

### Step 3: Create the Script File

Create a script file named `test.sh` in the same directory:

```bash
nano test.sh
```

Add the following content:

```bash
#!/bin/sh
echo "Hello from Podman container!"
```

Make the script executable:

```bash
chmod +x test.sh
```

---

## Building Images Using Podman

Once the Dockerfile is ready, you can use Podman to build the image.

### Step 1: Build the Image

Run the following command to build the image:

```bash
podman build -t my-podman-image .
```

- `-t my-podman-image`: Tags the image with the name `my-podman-image`.
- `.`: Specifies the current directory as the context.

You’ll see output logs as Podman processes each instruction in the Dockerfile.

### Step 2: Verify the Image

After the build completes, list the available images:

```bash
podman images
```

The output will show the new image `my-podman-image` along with its size and creation time.

---

## Running Containers from the Image

Now that the image is built, you can use it to run containers.

### Step 1: Run the Container

Run a container using the newly created image:

```bash
podman run --rm my-podman-image
```

The `--rm` flag removes the container after it stops. The output should display:

```
Hello from Podman container!
```

### Step 2: Run in Detached Mode

To keep the container running in the background, use:

```bash
podman run -d --name my-running-container my-podman-image
```

Verify that the container is running:

```bash
podman ps
```

---

## Managing and Inspecting Images and Containers

### Listing Images

To see all locally available images, use:

```bash
podman images
```

### Inspecting an Image

To view detailed metadata about an image, run:

```bash
podman inspect my-podman-image
```

### Stopping and Removing Containers

Stop a running container:

```bash
podman stop my-running-container
```

Remove a container:

```bash
podman rm my-running-container
```

---

## Troubleshooting Common Issues

### 1. **Error: Permission Denied**

If you encounter a "permission denied" error, ensure you’re running Podman in rootless mode and have the necessary permissions:

```bash
sudo usermod -aG podman $USER
newgrp podman
```

### 2. **Build Fails Due to Network Issues**

Check your network connection and ensure you can reach the Docker registry. If using a proxy, configure Podman to work with it by setting the `http_proxy` environment variable.

### 3. **SELinux Denials**

If SELinux blocks access, inspect logs for details:

```bash
sudo ausearch -m avc -ts recent
```

Temporarily set SELinux to permissive mode for debugging:

```bash
sudo setenforce 0
```

---

## Conclusion

Using Dockerfiles with Podman on AlmaLinux is an efficient way to build and manage container images. This guide has shown you how to create a Dockerfile, build an image with Podman, and run containers from that image. With Podman’s compatibility with Dockerfile syntax and AlmaLinux’s enterprise-grade stability, you have a powerful platform for containerization.

By mastering these steps, you’ll be well-equipped to streamline your workflows, automate container deployments, and take full advantage of Podman’s capabilities. Whether you’re new to containers or transitioning from Docker, Podman offers a secure and flexible environment for modern development. 

Let us know about your experiences with Podman and AlmaLinux in the comments below!
