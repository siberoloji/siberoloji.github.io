---
title: How to Understand Podman Networking Basics on AlmaLinux
linkTitle: Podman Networking Basics
description: In this blog post, we’ll delve into Podman networking basics, with a focus on AlmaLinux.
date: 2024-12-11
weight: 620
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
url: understand-podman-networking-basics-almalinux
---
Podman is an increasingly popular container management tool, offering a secure and daemonless alternative to Docker. One of its key features is robust and flexible networking capabilities, which are critical for containerized applications that need to communicate with each other or external services. Networking in Podman allows containers to connect internally, access external resources, or expose services to users.

In this blog post, we’ll delve into Podman networking basics, with a focus on AlmaLinux. You’ll learn about default networking modes, configuring custom networks, and troubleshooting common networking issues.

---

## Table of Contents

1. [Introduction to Podman and Networking](#introduction-to-podman-and-networking)
2. [Networking Modes in Podman](#networking-modes-in-podman)
   - Host Network Mode
   - Bridge Network Mode
   - None Network Mode
3. [Setting Up Bridge Networks](#setting-up-bridge-networks)
4. [Connecting Containers to Custom Networks](#connecting-containers-to-custom-networks)
5. [Exposing Container Services to the Host](#exposing-container-services-to-the-host)
6. [DNS and Hostname Configuration](#dns-and-hostname-configuration)
7. [Troubleshooting Networking Issues](#troubleshooting-networking-issues)
8. [Conclusion](#conclusion)

---

## Introduction to Podman and Networking

### What is Podman?

Podman is a container engine designed to run, manage, and build containers without requiring a central daemon. Its rootless architecture makes it secure, and its compatibility with Docker commands allows seamless transitions for developers familiar with Docker.

### Why AlmaLinux?

AlmaLinux is an enterprise-grade, RHEL-compatible Linux distribution known for its stability and community-driven development. Combining AlmaLinux and Podman provides a powerful platform for containerized applications.

### Networking in Podman

Networking in Podman allows containers to communicate with each other, the host system, and external networks. Podman uses CNI (Container Network Interface) plugins for its networking stack, enabling flexible and scalable configurations.

---

## Networking Modes in Podman

Podman provides three primary networking modes. Each mode has specific use cases depending on your application requirements.

### 1. **Host Network Mode**

In this mode, containers share the host’s network stack. There’s no isolation between the container and host, meaning the container can use the host’s IP address and ports directly.

#### Use Cases

- Applications requiring high network performance.
- Scenarios where container isolation is not a priority.

#### Example

Run a container in host mode:

```bash
podman run --network host -d nginx
```

- The container shares the host’s network namespace.
- Ports do not need explicit mapping.

### 2. **Bridge Network Mode (Default)**

Bridge mode creates an isolated virtual network for containers. Containers communicate with each other via the bridge but require port mapping to communicate with the host or external networks.

#### Use Cases

- Containers needing network isolation.
- Applications requiring explicit port mapping.

#### Example

Run a container in bridge mode:

```bash
podman run -d -p 8080:80 nginx
```

- Maps port 80 inside the container to port 8080 on the host.
- Containers can access the external network through NAT.

### 3. **None Network Mode**

The `none` mode disables networking entirely. Containers operate without any network stack.

#### Use Cases

- Completely isolated tasks, such as data processing.
- Scenarios where network connectivity is unnecessary.

#### Example

Run a container with no network:

```bash
podman run --network none -d nginx
```

- The container cannot communicate with other containers, the host, or external networks.

---

## Setting Up Bridge Networks

### Step 1: View Default Networks

List the available networks on your AlmaLinux host:

```bash
podman network ls
```

The output shows default networks like `podman` and `bridge`.

### Step 2: Create a Custom Bridge Network

Create a new network for better isolation and control:

```bash
podman network create my-bridge-network
```

The command creates a new bridge network named `my-bridge-network`.

### Step 3: Inspect the Network

Inspect the network configuration:

```bash
podman network inspect my-bridge-network
```

This displays details like subnet, gateway, and network options.

---

## Connecting Containers to Custom Networks

### Step 1: Run a Container on the Custom Network

Run a container and attach it to the custom network:

```bash
podman run --network my-bridge-network -d --name my-nginx nginx
```

- The container is attached to `my-bridge-network`.
- It can communicate with other containers on the same network.

### Step 2: Add Additional Containers to the Network

Run another container on the same network:

```bash
podman run --network my-bridge-network -d --name my-app alpine sleep 1000
```

### Step 3: Test Container-to-Container Communication

Use `ping` to test communication:

1. Enter the `my-app` container:

   ```bash
   podman exec -it my-app /bin/sh
   ```

2. Ping the `my-nginx` container by name:

   ```bash
   ping my-nginx
   ```

Containers on the same network should communicate without issues.

---

## Exposing Container Services to the Host

To make services accessible from the host system, map container ports to host ports using the `-p` flag.

### Example: Expose an Nginx Web Server

Run an Nginx container and expose it on port 8080:

```bash
podman run -d -p 8080:80 nginx
```

Access the service in a browser:

```text
http://localhost:8080
```

---

## DNS and Hostname Configuration

Podman provides DNS resolution for containers on the same network. You can also customize DNS and hostname settings.

### Step 1: Set a Custom Hostname

Run a container with a specific hostname:

```bash
podman run --hostname my-nginx -d nginx
```

The container’s hostname will be set to `my-nginx`.

### Step 2: Use Custom DNS Servers

Specify DNS servers using the `--dns` flag:

```bash
podman run --dns 8.8.8.8 -d nginx
```

This configures the container to use Google’s public DNS server.

---

## Troubleshooting Networking Issues

### 1. **Container Cannot Access External Network**

- Check the host’s firewall rules to ensure outbound traffic is allowed.
- Ensure the container has the correct DNS settings:

  ```bash
  podman run --dns 8.8.8.8 -d my-container
  ```

### 2. **Host Cannot Access Container Services**

- Verify that ports are correctly mapped using `podman ps`.
- Ensure SELinux is not blocking traffic:

  ```bash
  sudo setenforce 0
  ```

  (For testing only; configure proper SELinux policies for production.)

### 3. **Containers Cannot Communicate**

- Ensure the containers are on the same network:

  ```bash
  podman network inspect my-bridge-network
  ```

### 4. **Firewall Blocking Traffic**

Allow necessary ports using `firewalld`:

```bash
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

## Conclusion

Networking is a foundational aspect of managing containers effectively. Podman, with its robust networking capabilities, enables AlmaLinux users to create isolated, high-performance, and secure container environments. By understanding the various network modes and configurations, you can design solutions tailored to your specific application needs.

Experiment with bridge networks, DNS settings, and port mappings to gain mastery over Podman’s networking features. With these skills, you’ll be well-equipped to build scalable and reliable containerized systems.

Feel free to leave your thoughts or questions in the comments below. Happy containerizing!
