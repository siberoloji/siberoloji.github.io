---
title: How to Use Podman Containers by Common Users on AlmaLinux
linkTitle: Podman Containers by Common Users
description: Learn how common users can set up and manage Podman containers on AlmaLinux. This guide covers installation, rootless setup, basic commands, networking, and best practices.
date: 2024-12-12
weight: 660
url: podman-containers-common-users-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-use-podman-containers-by-common-users-on-almalinux
keywords:
  - AlmaLinux
  - Podman Containers by Common Users

featured_image: /images/almalinux.webp
---
Containerization has revolutionized software development, making it easier to deploy, scale, and manage applications. Among container engines, **Podman** has emerged as a popular alternative to Docker, offering a daemonless, rootless, and secure way to manage containers. AlmaLinux, a community-driven Linux distribution with enterprise-grade reliability, is an excellent platform for running Podman containers.

This guide explains how common users can set up and use Podman on AlmaLinux, providing detailed instructions, examples, and best practices.

---

## **Why Choose Podman on AlmaLinux?**

Before diving into the details, let’s explore why Podman and AlmaLinux are a perfect match for containerization:

- **Podman’s Advantages:**  
  - No daemon required, which reduces system resource usage.  
  - Rootless mode enhances security by allowing users to run containers without administrative privileges.  
  - Compatibility with Docker CLI commands makes migration seamless.

- **AlmaLinux’s Benefits:**  
  - Enterprise-grade stability and compatibility with Red Hat Enterprise Linux (RHEL).  
  - A community-driven and open-source Linux distribution.  

---

## **Setting Up Podman on AlmaLinux**

### **Step 1: Install Podman**

First, install Podman on your AlmaLinux system. Ensure your system is up to date:

```bash
sudo dnf update -y
sudo dnf install podman -y
```

#### **Verify Installation**

After installation, confirm the Podman version:

```bash
podman --version
```

---

### **Step 2: Rootless Podman Setup**

One of Podman’s standout features is its rootless mode, allowing common users to manage containers without requiring elevated privileges.

#### **Enable User Namespace**

Rootless containers rely on Linux user namespaces. Ensure they are enabled:

```bash
sysctl user.max_user_namespaces
```

If the output is `0`, enable it by adding the following line to `/etc/sysctl.conf`:

```bash
user.max_user_namespaces=28633
```

Apply the changes:

```bash
sudo sysctl --system
```

#### **Test Rootless Mode**

Log in as a non-root user and run a test container:

```bash
podman run --rm -it alpine sh
```

This command pulls the `alpine` image, runs it interactively, and deletes it after exiting.

---

## **Basic Podman Commands for Common Users**

Here’s how to use Podman for common container operations:

### **1. Pulling Images**

Download container images from registries like Docker Hub:

```bash
podman pull nginx
```

#### **View Downloaded Images**

List all downloaded images:

```bash
podman images
```

---

### **2. Running Containers**

Start a container using the downloaded image:

```bash
podman run -d --name my-nginx -p 8080:80 nginx
```

#### **Explanation:**

- **`-d`**: Runs the container in detached mode.
- **`--name my-nginx`**: Assigns a name to the container.
- **`-p 8080:80`**: Maps port 8080 on the host to port 80 inside the container.

Visit `http://localhost:8080` in your browser to see the Nginx welcome page.

---

### **3. Managing Containers**

#### **List Running Containers**

To view all active containers:

```bash
podman ps
```

#### **List All Containers (Including Stopped Ones)**

```bash
podman ps -a
```

#### **Stop a Container**

```bash
podman stop my-nginx
```

#### **Remove a Container**

```bash
podman rm my-nginx
```

---

### **4. Inspecting Containers**

For detailed information about a container:

```bash
podman inspect my-nginx
```

#### **View Container Logs**

To check the logs of a container:

```bash
podman logs my-nginx
```

---

### **5. Using Volumes for Persistent Data**

Containers are ephemeral by design, meaning data is lost when the container stops. Volumes help persist data beyond the container lifecycle.

#### **Create a Volume**

```bash
podman volume create my-volume
```

#### **Run a Container with a Volume**

```bash
podman run -d --name my-nginx -p 8080:80 -v my-volume:/usr/share/nginx/html nginx
```

You can now store persistent data in the `my-volume` directory.

---

## **Working with Podman Networks**

Containers often need to communicate with each other or the outside world. Podman’s networking capabilities make this seamless.

### **Create a Network**

```bash
podman network create my-network
```

### **Connect a Container to a Network**

Run a container and attach it to the created network:

```bash
podman run -d --name my-container --network my-network alpine
```

### **Inspect the Network**

View details about the network:

```bash
podman network inspect my-network
```

---

## **Podman Compose for Multi-Container Applications**

Podman supports Docker Compose files via **Podman Compose**, allowing users to orchestrate multiple containers easily.

### **Install Podman Compose**

Install the Python-based Podman Compose tool:

```bash
pip3 install podman-compose
```

### **Create a `docker-compose.yml` File**

Here’s an example for a web application:

```yaml
version: '3.9'

services:
  web:
    image: nginx
    ports:
      - "8080:80"

  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
```

### **Run the Compose File**

Navigate to the directory containing the file and run:

```bash
podman-compose up
```

Use `podman-compose down` to stop and remove the containers.

---

## **Rootless Security Best Practices**

Running containers without root privileges enhances security, but additional measures can further safeguard your environment:

1. **Use Non-Root Users Inside Containers**  
   Ensure containers don’t run as root by specifying a user in the Dockerfile or container configuration.

2. **Limit Resources**  
   Prevent containers from consuming excessive resources by setting limits:

   ```bash
   podman run -d --memory 512m --cpus 1 nginx
   ```

3. **Scan Images for Vulnerabilities**  
   Use tools like Skopeo or Trivy to analyze container images for security flaws.

---

## **Troubleshooting Common Issues**

### **1. Container Fails to Start**

Check the logs for errors:

```bash
podman logs <container-name>
```

### **2. Image Not Found**

Ensure the image name and tag are correct. Pull the latest version if needed:

```bash
podman pull <image-name>
```

### **3. Podman Command Not Found**

Ensure Podman is installed and accessible in your PATH. If not, re-install it using:

```bash
sudo dnf install podman -y
```

---

## **Best Practices for Common Users**

1. **Use Podman Aliases:** Simplify commands with aliases, e.g., `alias pps='podman ps'`.
2. **Clean Up Unused Resources:** Remove dangling images and stopped containers:

   ```bash
   podman system prune
   ```

3. **Keep Podman Updated:** Regular updates ensure you have the latest features and security fixes.
4. **Enable Logs for Debugging:** Always review logs to understand container behavior.

---

## **Conclusion**

Podman on AlmaLinux offers a secure, efficient, and user-friendly platform for running containers, even for non-root users. Its compatibility with Docker commands, rootless mode, and robust features make it an excellent choice for developers, sysadmins, and everyday users.

By following this guide, you now have the tools and knowledge to set up, run, and manage Podman containers on AlmaLinux. Experiment with different configurations, explore multi-container setups, and embrace the power of containerization in your workflows!
