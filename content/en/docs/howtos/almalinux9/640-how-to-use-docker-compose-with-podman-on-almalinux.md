---
title: How to Use Docker Compose with Podman on AlmaLinux
linkTitle: Docker Compose with Podman
description: Learn how to use Docker Compose with Podman on AlmaLinux. This guide covers installation, configuration, and best practices for managing multi-container applications.
date: 2024-12-12
weight: 640
url: docker-compose-podman-almalinux
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
---
As containerization becomes integral to modern development workflows, tools like Docker Compose and Podman are gaining popularity for managing containerized applications. While Docker Compose is traditionally associated with Docker, it can also work with Podman, a daemonless container engine. AlmaLinux, a stable, community-driven operating system, offers an excellent environment for combining these technologies. This guide will walk you through the process of using Docker Compose with Podman on AlmaLinux.

---

### **Why Use Docker Compose with Podman on AlmaLinux?**

#### **What is Docker Compose?**

Docker Compose is a tool for defining and managing multi-container applications using a simple YAML configuration file. It simplifies the orchestration of complex setups by allowing you to start, stop, and manage containers with a single command.

#### **What is Podman?**

Podman is a lightweight, daemonless container engine that is compatible with Docker images and commands. Unlike Docker, Podman does not require a background service, making it more secure and resource-efficient.

#### **Why AlmaLinux?**

AlmaLinux provides enterprise-grade stability and compatibility with Red Hat Enterprise Linux (RHEL), making it a robust choice for containerized workloads.

Combining Docker Compose with Podman on AlmaLinux allows you to benefit from the simplicity of Compose and the flexibility of Podman.

---

### **Prerequisites**

Before we begin, ensure you have:  

1. AlmaLinux installed and updated.
2. Basic knowledge of the Linux command line.
3. Podman installed and configured.
4. Podman-Docker and Docker Compose installed.

---

### **Step 1: Install Podman and Required Tools**

#### **Install Podman**

First, update your system and install Podman:  

```bash
sudo dnf update -y
sudo dnf install podman -y
```

Verify the installation:  

```bash
podman --version
```

#### **Install Podman-Docker**

The Podman-Docker package enables Podman to work with Docker commands, making it easier to use Docker Compose. Install it using:  

```bash
sudo dnf install podman-docker -y
```

This package sets up Docker CLI compatibility with Podman.

---

### **Step 2: Install Docker Compose**

Docker Compose is a standalone tool that needs to be downloaded separately.

1. **Download Docker Compose**  
   Determine the latest version of Docker Compose from the [GitHub releases page](https://github.com/docker/compose/releases). Replace `vX.Y.Z` in the command below with the latest version:

   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/download/vX.Y.Z/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   ```

2. **Make Docker Compose Executable**  

   ```bash
   sudo chmod +x /usr/local/bin/docker-compose
   ```

3. **Verify the Installation**  

   ```bash
   docker-compose --version
   ```

---

### **Step 3: Configure Podman for Docker Compose**

To ensure Docker Compose works with Podman, some configurations are needed.

#### **Create a Podman Socket**

Docker Compose relies on a Docker socket, typically found at `/var/run/docker.sock`. Podman can create a compatible socket using the `podman.sock` service.

1. **Enable Podman Socket:**  

   ```bash
   systemctl --user enable --now podman.socket
   ```

2. **Verify the Socket:**  

   ```bash
   systemctl --user status podman.socket
   ```

3. **Expose the Socket:**  
   Export the `DOCKER_HOST` environment variable so Docker Compose uses the Podman socket:  

   ```bash
   export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
   ```

   Add this line to your shell configuration file (`~/.bashrc` or `~/.zshrc`) to make it persistent.

---

### **Step 4: Create a Docker Compose File**

Docker Compose uses a YAML file to define containerized applications. Here’s an example `docker-compose.yml` file for a basic multi-container setup:

```yaml
version: '3.9'

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    networks:
      - app-network

  app:
    image: python:3.9-slim
    volumes:
      - ./app:/app
    networks:
      - app-network
    command: python /app/app.py

networks:
  app-network:
    driver: bridge
```

In this example:

- **`web`** runs an Nginx container and maps port 8080 to 80.
- **`app`** runs a Python application container.
- **`networks`** defines a shared network for inter-container communication.

Save the file as `docker-compose.yml` in your project directory.

---

### **Step 5: Run Docker Compose with Podman**

Navigate to the directory containing the `docker-compose.yml` file and run:

```bash
docker-compose up
```

This command builds and starts all defined services. You should see output confirming that the containers are running.

#### **Check Running Containers**

You can use Podman or Docker commands to verify the running containers:

```bash
podman ps
```

or

```bash
docker ps
```

#### **Stop the Containers**

To stop the containers, use:

```bash
docker-compose down
```

---

### **Step 6: Advanced Configuration**

#### **Using Environment Variables**

Environment variables can be used to configure sensitive or environment-specific details in the `docker-compose.yml` file. Create a `.env` file in the project directory:

```env
APP_PORT=8080
```

Modify `docker-compose.yml` to use the variable:

```yaml
ports:
  - "${APP_PORT}:80"
```

#### **Building Custom Images**

You can use Compose to build images from a Dockerfile:

```yaml
services:
  custom-service:
    build:
      context: .
      dockerfile: Dockerfile
```

Run `docker-compose up` to build and start the service.

---

### **Step 7: Troubleshooting Common Issues**

#### **Error: "Cannot connect to the Docker daemon"**

This error indicates the Podman socket isn’t properly configured. Verify the `DOCKER_HOST` variable and restart the Podman socket service:

```bash
systemctl --user restart podman.socket
```

#### **Slow Startup or Networking Issues**

Ensure the `app-network` is properly configured and containers are connected to the network. You can inspect the network using:

```bash
podman network inspect app-network
```

---

### **Best Practices for Using Docker Compose with Podman**

1. **Use Persistent Storage:**  
   Mount volumes to persist data beyond the container lifecycle.

2. **Keep Compose Files Organized:**  
   Break down complex setups into multiple Compose files for better manageability.

3. **Monitor Containers:**  
   Use Podman’s built-in tools to inspect logs and monitor container performance.

4. **Regular Updates:**  
   Keep Podman, Podman-Docker, and Docker Compose updated for new features and security patches.

5. **Security Considerations:**  
   Use non-root users and namespaces to enhance security.

---

### **Conclusion**

Docker Compose and Podman together offer a powerful way to manage multi-container applications on AlmaLinux. With Podman’s daemonless architecture and Docker Compose’s simplicity, you can create robust, scalable, and secure containerized environments. AlmaLinux provides a solid foundation for running these tools, making it an excellent choice for modern container workflows.

Whether you're deploying a simple web server or orchestrating a complex microservices architecture, this guide equips you with the knowledge to get started efficiently. Experiment with different configurations and unlock the full potential of containerization on AlmaLinux!
