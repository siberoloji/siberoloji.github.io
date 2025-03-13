---
title: How to Install Podman on AlmaLinux
linkTitle: Install Podman
description: This guide provides a comprehensive walkthrough for installing and configuring Podman on AlmaLinux.
date: 2024-12-11
weight: 550
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
translationKey: how-to-install-podman-on-almalinux
featured_image: /images/almalinux.webp
url: install-podman-almalinux
---
Podman is an innovative container management tool designed to operate without a central daemon, enabling users to run containers securely and efficiently. Unlike Docker, Podman uses a daemonless architecture, allowing containers to run as regular processes and eliminating the need for root privileges. AlmaLinux, a stable and community-driven Linux distribution, is an excellent choice for hosting Podman due to its compatibility and performance. This guide provides a comprehensive walkthrough for installing and configuring Podman on AlmaLinux.

### Prerequisites

Before you begin the installation process, ensure you meet the following requirements:

1. **A fresh AlmaLinux installation**: The guide assumes you are running AlmaLinux 8 or later.
2. **Sudo privileges**: Administrative access is necessary for installation.
3. **Internet connection**: Required to download and install necessary packages.

### Step 1: Update Your System

Updating your system ensures compatibility and security. Open a terminal and execute:

```bash
sudo dnf update -y
```

This command updates all installed packages to their latest versions. Regular updates are essential for maintaining a secure and functional system.

### Step 2: Install Podman

Podman is available in AlmaLinux’s default repositories, making the installation process straightforward. Follow these steps:

1. **Enable the Extras repository**:
   The Extras repository often contains Podman packages. Ensure it is enabled by running:

   ```bash
   sudo dnf config-manager --set-enabled extras
   ```

2. **Install Podman**:
   Install Podman using the following command:

   ```bash
   sudo dnf install -y podman
   ```

3. **Verify the installation**:
   After installation, confirm the version of Podman installed:

   ```bash
   podman --version
   ```

   This output verifies that Podman is correctly installed.

### Step 3: Configure Podman for Rootless Operation (Optional)

One of Podman’s primary features is its ability to run containers without root privileges. Configure rootless mode with these steps:

1. **Create and modify groups**:
   While Podman does not require a specific group, using a management group can simplify permissions. Create and assign the group:

   ```bash
   sudo groupadd podman
   sudo usermod -aG podman $USER
   ```

   Log out and log back in for the changes to take effect.

2. **Set subuid and subgid mappings**:
   Configure user namespaces by updating the `/etc/subuid` and `/etc/subgid` files:

   ```bash
   echo "$USER:100000:65536" | sudo tee -a /etc/subuid /etc/subgid
   ```

3. **Test rootless functionality**:
   Run a test container:

   ```bash
   podman run --rm -it alpine:latest /bin/sh
   ```

   If successful, you will enter a shell inside the container. Use `exit` to return to the host.

### Step 4: Set Up Podman Networking

Podman uses `slirp4netns` for rootless networking. Verify its installation:

```bash
sudo dnf install -y slirp4netns
```

To enable advanced networking, create a Podman network:

```bash
podman network create mynetwork
```

This creates a network named `mynetwork` for container communication.

### Step 5: Run Your First Container

With Podman installed, you can start running containers. Follow this example to deploy an Nginx container:

1. **Download the Nginx image**:

   ```bash
   podman pull nginx:latest
   ```

2. **Start the Nginx container**:

   ```bash
   podman run --name mynginx -d -p 8080:80 nginx:latest
   ```

   This command runs Nginx in detached mode (`-d`) and maps port 8080 on the host to port 80 in the container.

3. **Access the containerized service**:
   Open a web browser and navigate to `http://localhost:8080`. You should see the default Nginx page.

4. **Stop and remove the container**:
   Stop the container:

   ```bash
   podman stop mynginx
   ```

   Remove the container:

   ```bash
   podman rm mynginx
   ```

### Step 6: Manage Containers and Images

Podman includes various commands to manage containers and images. Here are some commonly used commands:

- **List running containers**:

  ```bash
  podman ps
  ```

- **List all containers** (including stopped):

  ```bash
  podman ps -a
  ```

- **List images**:

  ```bash
  podman images
  ```

- **Remove an image**:

  ```bash
  podman rmi <image_id>
  ```

### Step 7: Advanced Configuration

Podman supports advanced features such as multi-container setups and systemd integration. Consider the following configurations:

1. **Use Podman Compose**:
   Podman supports `docker-compose` files via `podman-compose`. Install it with:

   ```bash
   sudo dnf install -y podman-compose
   ```

   Use `podman-compose` to manage complex container environments.

2. **Generate systemd service files**:
   Automate container startup with systemd integration. Generate a service file:

   ```bash
   podman generate systemd --name mynginx > mynginx.service
   ```

   Move the service file to `/etc/systemd/system/` and enable it:

   ```bash
   sudo systemctl enable mynginx.service
   sudo systemctl start mynginx.service
   ```

### Troubleshooting

If issues arise, these troubleshooting steps can help:

- **View logs**:

  ```bash
  podman logs <container_name>
  ```

- **Inspect containers**:

  ```bash
  podman inspect <container_name>
  ```

- **Debug networking**:
  Inspect network configurations:

  ```bash
  podman network inspect
  ```

### Conclusion

Podman is a versatile container management tool that offers robust security and flexibility. AlmaLinux provides an ideal platform for deploying Podman due to its reliability and support. By following this guide, you have set up Podman to manage and run containers effectively. With its advanced features and rootless architecture, Podman is a powerful alternative to traditional containerization tools.
