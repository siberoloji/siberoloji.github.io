---
title: How to Access Services on Podman Containers on AlmaLinux
linkTitle: Services on Podman Containers
description: This blog post will guide you through configuring and accessing services hosted on Podman containers in AlmaLinux.
date: 2024-12-11
weight: 570
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
url: access-services-podman-containers-almalinux
---
Podman has become a popular choice for running containerized workloads due to its rootless and daemonless architecture. When using Podman on AlmaLinux, a powerful, stable, and enterprise-grade Linux distribution, accessing services running inside containers is a common requirement. This blog post will guide you through configuring and accessing services hosted on Podman containers in AlmaLinux.

---

## Introduction to Podman and AlmaLinux

Podman, short for **Pod Manager**, is a container engine that adheres to the OCI (Open Container Initiative) standards. It provides developers with a powerful platform to build, manage, and run containers without requiring root privileges. AlmaLinux, on the other hand, is a stable and secure Linux distribution, making it an ideal host for containers in production environments.

Combining Podman with AlmaLinux allows you to manage and expose services securely and efficiently. Whether you're hosting a web server, database, or custom application, Podman offers robust networking capabilities to meet your needs.

---

## Prerequisites

Before diving into the process, ensure the following prerequisites are met:

1. **Updated AlmaLinux Installation:** Ensure your AlmaLinux system is updated with the latest patches:

   ```bash
   sudo dnf update -y
   ```

2. **Podman Installed:** Podman must be installed on your system. Install it using:

   ```bash
   sudo dnf install -y podman
   ```

3. **Basic Networking Knowledge:** Familiarity with concepts like ports, firewalls, and networking modes is helpful.

---

## Setting Up Services in Podman Containers

### Example: Running an Nginx Web Server

To demonstrate, we’ll run an Nginx web server in a Podman container:

1. Pull the Nginx container image:

   ```bash
   podman pull docker.io/library/nginx:latest
   ```

2. Run the Nginx container:

   ```bash
   podman run -d --name my-nginx -p 8080:80 nginx:latest
   ```

   - `-d`: Runs the container in detached mode.
   - `--name my-nginx`: Assigns a name to the container for easier management.
   - `-p 8080:80`: Maps port `80` inside the container to port `8080` on the host.

3. Verify the container is running:

   ```bash
   podman ps
   ```

   The output will display the running container and its port mappings.

---

## Accessing Services via Ports

### Step 1: Test Locally

On your AlmaLinux host, you can test access to the service using `curl` or a web browser. Since we mapped port `8080` to the Nginx container, you can run:

```bash
curl http://localhost:8080
```

You should see the Nginx welcome page as the response.

### Step 2: Access Remotely

If you want to access the service from another machine on the network:

1. **Find the Host IP Address:**
   Use the `ip addr` command to find your AlmaLinux host's IP address.

   ```bash
   ip addr
   ```

   Look for the IP address associated with your primary network interface.

2. **Adjust Firewall Rules:**
   Ensure that your firewall allows traffic to the mapped port (`8080`). Add the necessary rule using `firewalld`:

   ```bash
   sudo firewall-cmd --add-port=8080/tcp --permanent
   sudo firewall-cmd --reload
   ```

3. **Access from a Remote Machine:**
   Open a browser or use `curl` from another system and navigate to:

   ```
   http://<AlmaLinux-IP>:8080
   ```

---

## Working with Network Modes in Podman

Podman supports multiple network modes to cater to different use cases. Here’s a breakdown:

### 1. **Bridge Mode (Default)**

Bridge mode creates an isolated network for containers. In this mode:

- Containers can communicate with the host and other containers on the same network.
- You must explicitly map container ports to host ports for external access.

This is the default network mode when running containers with the `-p` flag.

### 2. **Host Mode**

Host mode allows the container to share the host’s network stack. No port mapping is required because the container uses the host’s ports directly. To run a container in host mode:

```bash
podman run --network host -d my-container
```

### 3. **None**

The `none` network mode disables all networking for the container. This is useful for isolated tasks.

```bash
podman run --network none -d my-container
```

### 4. **Custom Networks**

You can create and manage custom Podman networks for better control over container communication. For example:

1. Create a custom network:

   ```bash
   podman network create my-net
   ```

2. Run containers on the custom network:

   ```bash
   podman run --network my-net -d my-container
   ```

3. List available networks:

   ```bash
   podman network ls
   ```

---

## Using Podman Generate Systemd for Persistent Services

If you want your Podman containers to start automatically with your AlmaLinux system, you can use `podman generate systemd` to create systemd service files.

### Step 1: Generate the Service File

Run the following command to generate a systemd service file for your container:

```bash
podman generate systemd --name my-nginx > ~/.config/systemd/user/my-nginx.service
```

### Step 2: Enable and Start the Service

Enable and start the service with systemd:

```bash
systemctl --user enable my-nginx
systemctl --user start my-nginx
```

### Step 3: Verify the Service

Check the service status:

```bash
systemctl --user status my-nginx
```

With this setup, your container will automatically restart after system reboots, ensuring uninterrupted access to services.

---

## Troubleshooting Common Issues

### 1. **Cannot Access Service Externally**

- Verify that the container is running and the port is mapped:

  ```bash
  podman ps
  ```

- Check firewall rules to ensure the port is open.
- Ensure SELinux is not blocking access by checking logs:

  ```bash
  sudo ausearch -m avc -ts recent
  ```

### 2. **Port Conflicts**

If the port on the host is already in use, Podman will fail to start the container. Use a different port or stop the conflicting service.

```bash
podman run -d -p 9090:80 nginx:latest
```

### 3. **Network Issues**

If containers cannot communicate with each other or the host, ensure they are on the correct network and review `podman network ls`.

---

## Conclusion

Accessing services on Podman containers running on AlmaLinux is a straightforward process when you understand port mappings, networking modes, and firewall configurations. Whether you’re hosting a simple web server or deploying complex containerized applications, Podman’s flexibility and AlmaLinux’s stability make a powerful combination.

By following the steps in this guide, you can confidently expose, manage, and access services hosted on Podman containers. Experiment with networking modes and automation techniques like systemd to tailor the setup to your requirements.

For further assistance or to share your experiences, feel free to leave a comment below. Happy containerizing!
