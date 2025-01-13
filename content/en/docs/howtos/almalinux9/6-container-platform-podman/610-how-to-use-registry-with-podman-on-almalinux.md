---
title: How to Use Registry with Podman on AlmaLinux
linkTitle: Use Registry with Podman
description: In this blog post, we’ll explore how to use a registry with Podman on AlmaLinux.
date: 2024-12-11
weight: 610
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: registry-podman-almalinux
---
Podman has emerged as a strong alternative to Docker for managing containers, thanks to its secure and rootless architecture. When working with containerized environments, managing images efficiently is critical. A container image registry allows you to store, retrieve, and share container images seamlessly across environments. Whether you're setting up a private registry for internal use or interacting with public registries, Podman provides all the necessary tools.

In this blog post, we’ll explore how to use a registry with Podman on AlmaLinux. This guide includes setup, configuration, and usage of both private and public registries to streamline your container workflows.

---

## Introduction to Podman, AlmaLinux, and Container Registries

### What is Podman?

Podman is an OCI-compliant container engine that allows users to create, run, and manage containers without requiring a daemon. Its rootless design makes it a secure option for containerized environments.

### Why AlmaLinux?

AlmaLinux, a community-driven, RHEL-compatible distribution, is an excellent choice for hosting Podman. It offers stability, security, and enterprise-grade performance.

### What is a Container Registry?

A container registry is a repository where container images are stored, organized, and distributed. Public registries like Docker Hub and Quay.io are widely used, but private registries provide more control, security, and customization.

---

## Benefits of Using a Registry

Using a container registry with Podman offers several advantages:

1. **Centralized Image Management:** Organize and manage container images efficiently.
2. **Version Control:** Use tags to manage different versions of images.
3. **Security:** Private registries allow tighter control over who can access your images.
4. **Scalability:** Distribute images across multiple hosts and environments.
5. **Collaboration:** Share container images easily within teams or organizations.

---

## Prerequisites

Before diving into the details, ensure the following:

1. **AlmaLinux Installed:** A running AlmaLinux system with sudo privileges.
2. **Podman Installed:** Install Podman using:

   ```bash
   sudo dnf install -y podman
   ```

3. **Network Access:** Ensure the system has network access to connect to registries or set up a private registry.
4. **Basic Knowledge of Containers:** Familiarity with container concepts and Podman commands.

---

## Using Public Registries with Podman

Public registries like Docker Hub, Quay.io, and Red Hat Container Catalog are commonly used for storing and sharing container images.

### Step 1: Search for an Image

To search for images on a public registry, use the `podman search` command:

```bash
podman search nginx
```

The output will list images matching the search term, along with details like name and description.

### Step 2: Pull an Image

To pull an image from a public registry, use the `podman pull` command:

```bash
podman pull docker.io/library/nginx:latest
```

- `docker.io/library/nginx`: Specifies the image name from Docker Hub.
- `:latest`: Indicates the tag version. Default is `latest` if omitted.

### Step 3: Run a Container

Run a container using the pulled image:

```bash
podman run -d --name webserver -p 8080:80 nginx
```

Access the containerized service by navigating to `http://localhost:8080` in your browser.

---

## Setting Up a Private Registry on AlmaLinux

Private registries are essential for secure and internal image management. Here’s how to set one up using `docker-distribution`.

### Step 1: Install the Required Packages

Install the container image for a private registry:

```bash
sudo podman pull docker.io/library/registry:2
```

### Step 2: Run the Registry

Run a private registry container:

```bash
podman run -d --name registry -p 5000:5000 -v /opt/registry:/var/lib/registry registry:2
```

- `-p 5000:5000`: Exposes the registry on port 5000.
- `-v /opt/registry:/var/lib/registry`: Persists registry data to the host.

### Step 3: Verify the Registry

Check that the registry is running:

```bash
podman ps
```

Test the registry using `curl`:

```bash
curl http://localhost:5000/v2/
```

The response `{} (empty JSON)` confirms that the registry is operational.

---

## Pushing Images to a Registry

### Step 1: Tag the Image

Before pushing an image to a registry, tag it with the registry’s URL:

```bash
podman tag nginx:latest localhost:5000/my-nginx
```

### Step 2: Push the Image

Push the image to the private registry:

```bash
podman push localhost:5000/my-nginx
```

Check the registry’s content:

```bash
curl http://localhost:5000/v2/_catalog
```

The output should list `my-nginx`.

---

## Pulling Images from a Registry

### Step 1: Pull an Image

To pull an image from the private registry:

```bash
podman pull localhost:5000/my-nginx
```

### Step 2: Run a Container from the Pulled Image

Run a container from the pulled image:

```bash
podman run -d --name test-nginx -p 8081:80 localhost:5000/my-nginx
```

Visit `http://localhost:8081` to verify that the container is running.

---

## Securing Your Registry

### Step 1: Enable Authentication

To add authentication to your registry, configure basic HTTP authentication.

1. Install `httpd-tools`:

   ```bash
   sudo dnf install -y httpd-tools
   ```

2. Create a password file:

   ```bash
   htpasswd -Bc /opt/registry/auth/htpasswd admin
   ```

### Step 2: Secure with SSL

Use SSL to encrypt communications:

1. Generate an SSL certificate (or use a trusted CA certificate).
2. Configure Podman to use the certificate when accessing the registry.

---

## Troubleshooting Common Issues

### 1. **Image Push Fails**

- Verify that the registry is running.
- Ensure the image is tagged with the correct registry URL.

### 2. **Cannot Access Registry**

- Check the firewall settings:

  ```bash
  sudo firewall-cmd --add-port=5000/tcp --permanent
  sudo firewall-cmd --reload
  ```

- Confirm the registry container is running.

### 3. **Authentication Issues**

- Ensure the `htpasswd` file is correctly configured.
- Restart the registry container after making changes.

---

## Conclusion

Using a registry with Podman on AlmaLinux enhances your container workflow by providing centralized image storage and management. Whether leveraging public registries for community-maintained images or deploying a private registry for internal use, Podman offers the flexibility to handle various scenarios.

By following the steps in this guide, you can confidently interact with public registries, set up a private registry, and secure your containerized environments. Experiment with these tools to optimize your container infrastructure.

Let us know your thoughts or questions in the comments below. Happy containerizing!
