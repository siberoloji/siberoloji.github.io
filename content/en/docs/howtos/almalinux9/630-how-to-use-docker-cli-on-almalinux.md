---
title: How to Use Docker CLI on AlmaLinux
linkTitle: Use Docker CLI
description: Learn how to use Docker CLI on AlmaLinux with this comprehensive guide. From installation to managing containers, images, and networks, master Docker on AlmaLinux.
date: 2024-12-12
weight: 630
url: how-to-use-docker-cli-almalinux
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
   - docker cli
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
Containers have revolutionized the way developers build, test, and deploy applications. Among container technologies, Docker remains a popular choice for its simplicity, flexibility, and powerful features. AlmaLinux, a community-driven distribution forked from CentOS, offers a stable environment for running Docker. If you're new to Docker CLI (Command-Line Interface) or AlmaLinux, this guide will walk you through the process of using Docker CLI effectively.

---

### **Understanding Docker and AlmaLinux**

Before diving into Docker CLI, let's briefly understand its importance and why AlmaLinux is a great choice for hosting Docker containers.

#### **What is Docker?**

Docker is a platform that allows developers to build, ship, and run applications in isolated environments called containers. Containers are lightweight, portable, and ensure consistency across development and production environments.

#### **Why AlmaLinux?**

AlmaLinux is a robust and open-source Linux distribution designed to provide enterprise-grade performance. As a successor to CentOS, it’s compatible with Red Hat Enterprise Linux (RHEL), making it a reliable choice for deploying containerized applications.

---

### **Prerequisites for Using Docker CLI on AlmaLinux**

Before you start using Docker CLI, ensure the following:  

1. **AlmaLinux installed** on your system.  
2. **Docker installed and configured.**  
3. A basic understanding of Linux terminal commands.  

#### **Installing Docker on AlmaLinux**

If Docker isn’t already installed, follow these steps to set it up:

1. **Update the System:**  

   ```bash
   sudo dnf update -y
   ```

2. **Add Docker Repository:**  

   ```bash
   sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
   ```

3. **Install Docker Engine:**  

   ```bash
   sudo dnf install docker-ce docker-ce-cli containerd.io -y
   ```

4. **Start and Enable Docker Service:**  

   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

5. **Verify Installation:**  

   ```bash
   docker --version
   ```

Once Docker is installed, you’re ready to use the Docker CLI.

---

### **Getting Started with Docker CLI**

Docker CLI is the primary interface for interacting with Docker. It allows you to manage containers, images, networks, and volumes directly from the terminal.

#### **Basic Docker CLI Commands**

Here’s an overview of some essential Docker commands:

- **`docker run`:** Create and run a container.  
- **`docker ps`:** List running containers.  
- **`docker images`:** List available images.  
- **`docker stop`:** Stop a running container.  
- **`docker rm`:** Remove a container.  
- **`docker rmi`:** Remove an image.

Let’s explore these commands with examples.

---

### **1. Running Your First Docker Container**

To start a container, use the `docker run` command:  

```bash
docker run hello-world
```

This command downloads the `hello-world` image (if not already available) and runs a container. It’s a great way to verify your Docker installation.

#### **Explanation:**  

- **`docker run`:** Executes the container.  
- **`hello-world`:** Specifies the image to run.

---

### **2. Listing Containers**

To view running containers, use the `docker ps` command:

```bash
docker ps
```

#### **Options:**

- **`-a`:** Show all containers (including stopped ones).  
- **`-q`:** Display only container IDs.  

Example:  

```bash
docker ps -a
```

This will display a detailed list of all containers.

---

### **3. Managing Images**

Images are the building blocks of containers. You can manage them using Docker CLI commands:

#### **Pulling an Image**

Download an image from Docker Hub:

```bash
docker pull ubuntu
```

#### **Listing Images**

View all downloaded images:

```bash
docker images
```

#### **Removing an Image**

Delete an unused image:

```bash
docker rmi ubuntu
```

---

### **4. Managing Containers**

Docker CLI makes container management straightforward.

#### **Stopping a Container**

To stop a running container, use its container ID or name:

```bash
docker stop <container-id>
```

#### **Removing a Container**

Delete a stopped container:

```bash
docker rm <container-id>
```

---

### **5. Creating Persistent Storage with Volumes**

Volumes are used to store data persistently across container restarts.  

#### **Creating a Volume**

```bash
docker volume create my_volume
```

#### **Using a Volume**

Mount a volume when running a container:

```bash
docker run -v my_volume:/data ubuntu
```

---

### **6. Networking with Docker CLI**

Docker provides powerful networking options for container communication.

#### **Listing Networks**

```bash
docker network ls
```

#### **Creating a Network**

```bash
docker network create my_network
```

#### **Connecting a Container to a Network**

```bash
docker network connect my_network <container-id>
```

---

### **7. Docker Compose: Enhancing CLI Efficiency**

For complex applications requiring multiple containers, use **Docker Compose**. It simplifies the management of multi-container environments using a YAML configuration file.

#### **Installing Docker Compose**

```bash
sudo dnf install docker-compose
```

#### **Running a Compose File**

Navigate to the directory containing `docker-compose.yml` and run:

```bash
docker-compose up
```

---

### **8. Best Practices for Using Docker CLI on AlmaLinux**

1. **Use Descriptive Names:**  
   Name your containers and volumes for better identification:

   ```bash
   docker run --name my_container ubuntu
   ```

2. **Leverage Aliases:**  
   Simplify frequently used commands by creating shell aliases:

   ```bash
   alias dps='docker ps -a'
   ```

3. **Clean Up Unused Resources:**  
   Remove dangling images and stopped containers to free up space:

   ```bash
   docker system prune
   ```

4. **Enable Non-Root Access:**  
   Add your user to the Docker group for rootless access:

   ```bash
   sudo usermod -aG docker $USER
   ```

   Log out and log back in for the changes to take effect.

5. **Regular Updates:**  
   Keep Docker and AlmaLinux updated to access the latest features and security patches.

---

### **Conclusion**

Using Docker CLI on AlmaLinux unlocks a world of opportunities for developers and system administrators. By mastering the commands and best practices outlined in this guide, you can efficiently manage containers, images, networks, and volumes. AlmaLinux’s stability and Docker’s flexibility make a formidable combination for deploying scalable and reliable applications.

Start experimenting with Docker CLI today and see how it transforms your workflow. Whether you’re running simple containers or orchestrating complex systems, the power of Docker CLI will be your trusted ally.
