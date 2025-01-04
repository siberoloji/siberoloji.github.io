---
draft: false
title: Bob Explores Linux Containers with Podman on AlmaLinux
linkTitle: Linux Containers with Podman
keywords:
  - Linux Containers with Podman
description: Containers allow for lightweight, portable applications, and Bob knew mastering them would future-proof his sysadmin skills.
date: 2024-12-09
url: bob-explores-linux-containers-podman-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 800
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to dive into **Linux containers** using **Podman**, a daemonless container engine built for running, managing, and building containers. Containers allow for lightweight, portable applications, and Bob knew mastering them would future-proof his sysadmin skills.

> *“Containers are the future of IT—let’s get started with Podman!”* Bob said enthusiastically.

---

### **Chapter Outline: "Bob Explores Linux Containers with Podman"**

1. **Introduction: What Are Containers?**
   - Overview of containerization.
   - Podman vs. Docker.

2. **Installing and Setting Up Podman**
   - Installing Podman on AlmaLinux.
   - Configuring Podman for rootless operation.

3. **Running and Managing Containers**
   - Pulling container images.
   - Running and stopping containers.

4. **Building Custom Container Images**
   - Writing a `Dockerfile`.
   - Building images with Podman.

5. **Using Pods for Multi-Container Applications**
   - Understanding pods in Podman.
   - Creating and managing pods.

6. **Persisting Data with Volumes**
   - Creating and attaching volumes.
   - Backing up container data.

7. **Networking and Port Management**
   - Exposing ports for containerized services.
   - Configuring container networks.

8. **Automating Containers with Systemd**
   - Generating Systemd service files for containers.
   - Managing containers as services.

9. **Conclusion: Bob Reflects on Container Mastery**

---

### **Part 1: Introduction: What Are Containers?**

Bob learned that containers are lightweight, portable environments for running applications. Unlike virtual machines, containers share the host kernel, making them faster to start and use fewer resources.

#### **Why Podman?**

- **Daemonless**: Runs without a central daemon, unlike Docker.
- **Rootless Mode**: Allows non-root users to run containers securely.
- **Docker-Compatible**: Supports Dockerfiles and images.

> *“With Podman, I get the power of Docker without the baggage!”* Bob said.

---

### **Part 2: Installing and Setting Up Podman**

#### **Step 1: Installing Podman**

- Install Podman:

  ```bash
  sudo dnf install -y podman
  ```

- Verify the installation:

  ```bash
  podman --version
  ```

#### **Step 2: Configuring Rootless Podman**

Bob configured Podman to run without root privileges for added security:

```bash
sudo sysctl user.max_user_namespaces=28633
```

- Log in as a regular user and test Podman:

  ```bash
  podman info
  ```

> *“Podman is ready to go—time to run my first container!”* Bob said.

---

### **Part 3: Running and Managing Containers**

#### **Step 1: Pulling Container Images**

- Search for an image:

  ```bash
  podman search nginx
  ```

- Pull the official `nginx` image:

  ```bash
  podman pull docker.io/library/nginx
  ```

#### **Step 2: Running a Container**

- Run the `nginx` container:

  ```bash
  podman run -d --name webserver -p 8080:80 nginx
  ```

- Check the running container:

  ```bash
  podman ps
  ```

- Access the containerized web server in a browser:

  ```plaintext
  http://<server-ip>:8080
  ```

#### **Step 3: Stopping and Removing Containers**

- Stop the container:

  ```bash
  podman stop webserver
  ```

- Remove the container:

  ```bash
  podman rm webserver
  ```

> *“Containers make deploying services quick and easy!”* Bob said.

---

### **Part 4: Building Custom Container Images**

#### **Step 1: Writing a `Dockerfile`**

Bob created a `Dockerfile` to build a custom `nginx` image:

```bash
nano Dockerfile
```

- Example `Dockerfile` content:

  ```plaintext
  FROM nginx:latest
  COPY index.html /usr/share/nginx/html/index.html
  ```

#### **Step 2: Building the Image**

- Build the image with Podman:

  ```bash
  podman build -t custom-nginx .
  ```

- Verify the image:

  ```bash
  podman images
  ```

> *“With custom images, I can tailor containers to my exact needs!”* Bob said.

---

### **Part 5: Using Pods for Multi-Container Applications**

#### **Step 1: Understanding Pods**

Bob learned that a **pod** groups multiple containers to share networking and storage.

#### **Step 2: Creating and Managing Pods**

- Create a pod:

  ```bash
  podman pod create --name mypod -p 8080:80
  ```

- Add containers to the pod:

  ```bash
  podman run -d --pod mypod nginx
  podman run -d --pod mypod redis
  ```

- List pod containers:

  ```bash
  podman ps --pod
  ```

> *“Pods make managing multi-container apps a breeze!”* Bob said.

---

### **Part 6: Persisting Data with Volumes**

#### **Step 1: Creating a Volume**

- Create a volume:

  ```bash
  podman volume create nginx-data
  ```

#### **Step 2: Attaching the Volume**

- Run a container with the volume:

  ```bash
  podman run -d --name webserver -v nginx-data:/usr/share/nginx/html nginx
  ```

#### **Step 3: Backing Up Container Data**

- Back up the volume:

  ```bash
  podman volume inspect nginx-data
  podman run --rm -v nginx-data:/data -v $(pwd):/backup busybox tar czvf /backup/nginx-data-backup.tar.gz /data
  ```

> *“Volumes keep my data safe even if containers are recreated!”* Bob noted.

---

### **Part 7: Networking and Port Management**

#### **Exposing Ports**

Bob exposed a container’s ports to make it accessible from outside:

```bash
podman run -d --name webserver -p 8080:80 nginx
```

#### **Configuring Container Networks**

- List networks:

  ```bash
  podman network ls
  ```

- Create a custom network:

  ```bash
  podman network create mynetwork
  ```

- Run a container on the custom network:

  ```bash
  podman run -d --name webserver --network mynetwork nginx
  ```

---

### **Part 8: Automating Containers with Systemd**

#### **Step 1: Generating Systemd Service Files**

- Generate a Systemd unit file for a container:

  ```bash
  podman generate systemd --name webserver --files
  ```

- Copy the generated file to the system directory:

  ```bash
  sudo cp container-webserver.service /etc/systemd/system/
  ```

#### **Step 2: Managing Containers as Services**

- Enable and start the service:

  ```bash
  sudo systemctl enable container-webserver
  sudo systemctl start container-webserver
  ```

> *“With Systemd, I can manage containers just like regular services!”* Bob said.

---

### **Conclusion: Bob Reflects on Container Mastery**

Bob successfully learned to deploy, manage, and automate containers using Podman. With lightweight and portable containers, he was confident his AlmaLinux server was future-proofed for modern applications.

> Next, Bob plans to explore **Configuring Advanced Monitoring with Prometheus and Grafana** on AlmaLinux.

