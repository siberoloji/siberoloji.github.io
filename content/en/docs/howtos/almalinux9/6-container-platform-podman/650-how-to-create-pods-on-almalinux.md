---
title: How to Create Pods on AlmaLinux
linkTitle: Create Pods
description: "Learn how to create pods on AlmaLinux using Podman and Kubernetes. This guide covers installation, pod creation, management, and best practices for scalable containerized applications. "
date: 2024-12-12
weight: 650
url: create-pods-almalinux
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
---
The concept of pods is foundational in containerized environments, particularly in Kubernetes and similar ecosystems. Pods serve as the smallest deployable units, encapsulating one or more containers that share storage, network, and a common context. AlmaLinux, an enterprise-grade Linux distribution, provides a stable and reliable platform to create and manage pods using container engines like Podman or Kubernetes.

This guide will explore how to create pods on AlmaLinux, providing detailed instructions and insights into using tools like Podman and Kubernetes to set up and manage pods efficiently.

---

## **Understanding Pods**

Before diving into the technical aspects, let’s clarify what a pod is and why it’s important.

### **What is a Pod?**

A pod is a logical grouping of one or more containers that share:

- **Network:** Containers in a pod share the same IP address and port space.
- **Storage:** Containers can share data through mounted volumes.
- **Lifecycle:** Pods are treated as a single unit for management tasks such as scaling and deployment.

### **Why Pods?**

Pods allow developers to bundle tightly coupled containers, such as a web server and a logging service, enabling better resource sharing, communication, and management.

---

## **Setting Up the Environment on AlmaLinux**

To create pods on AlmaLinux, you need a container engine like Podman or a container orchestration system like Kubernetes.

### **Prerequisites**

1. AlmaLinux installed and updated.
2. Basic knowledge of Linux terminal commands.
3. Administrative privileges (sudo access).

---

### **Step 1: Install Podman**

Podman is a daemonless container engine that is an excellent choice for managing pods on AlmaLinux.

#### **Install Podman**

Run the following commands to install Podman:

```bash
sudo dnf update -y
sudo dnf install podman -y
```

#### **Verify Installation**

Check the installed version of Podman:

```bash
podman --version
```

---

### **Step 2: Create Your First Pod with Podman**

Creating pods with Podman is straightforward and involves just a few commands.

#### **1. Create a Pod**

To create a pod, use the `podman pod create` command:

```bash
podman pod create --name my-pod --publish 8080:80
```

##### **Explanation of Parameters:**

- **`--name my-pod`**: Assigns a name to the pod for easier reference.
- **`--publish 8080:80`**: Maps port 80 inside the pod to port 8080 on the host.

#### **2. Verify the Pod**

To see the created pod, use:

```bash
podman pod ps
```

#### **3. Inspect the Pod**

To view detailed information about the pod, run:

```bash
podman pod inspect my-pod
```

---

### **Step 3: Add Containers to the Pod**

Once the pod is created, you can add containers to it.

#### **1. Add a Container to the Pod**

Use the `podman run` command to add a container to the pod:

```bash
podman run -dt --pod my-pod nginx:latest
```

##### **Explanation of Parameters:**

- **`-dt`**: Runs the container in detached mode.
- **`--pod my-pod`**: Specifies the pod to which the container should be added.
- **`nginx:latest`**: The container image to use.

#### **2. List Containers in the Pod**

To view all containers in a specific pod, use:

```bash
podman ps --pod
```

---

### **Step 4: Manage the Pod**

After creating the pod and adding containers, you can manage it using Podman commands.

#### **1. Start and Stop a Pod**

To start the pod:

```bash
podman pod start my-pod
```

To stop the pod:

```bash
podman pod stop my-pod
```

#### **2. Restart a Pod**

```bash
podman pod restart my-pod
```

#### **3. Remove a Pod**

To delete a pod and its containers:

```bash
podman pod rm my-pod -f
```

---

### **Step 5: Creating Pods with Kubernetes**

For users who prefer Kubernetes for orchestrating containerized applications, pods can be defined in YAML files and deployed to a Kubernetes cluster.

#### **1. Install Kubernetes**

If you don’t have Kubernetes installed, set it up on AlmaLinux:

```bash
sudo dnf install kubernetes -y
```

#### **2. Create a Pod Definition File**

Write a YAML file to define your pod. Save it as `pod-definition.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-k8s-pod
  labels:
    app: my-app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
    ports:
    - containerPort: 80
```

#### **3. Apply the Pod Configuration**

Deploy the pod using the `kubectl` command:

```bash
kubectl apply -f pod-definition.yaml
```

#### **4. Verify the Pod**

To check the status of the pod, use:

```bash
kubectl get pods
```

#### **5. Inspect the Pod**

View detailed information about the pod:

```bash
kubectl describe pod my-k8s-pod
```

#### **6. Delete the Pod**

To remove the pod:

```bash
kubectl delete pod my-k8s-pod
```

---

### **Comparing Podman and Kubernetes for Pods**

| Feature                | Podman                          | Kubernetes                     |
|------------------------|----------------------------------|--------------------------------|
| **Ease of Use**         | Simple, command-line based     | Requires YAML configurations  |
| **Orchestration**       | Limited to single host         | Multi-node orchestration       |
| **Use Case**            | Development, small setups      | Production-grade deployments  |

Choose Podman for lightweight, local environments and Kubernetes for large-scale orchestration.

---

### **Best Practices for Creating Pods**

1. **Use Descriptive Names:** Assign meaningful names to your pods for easier management.
2. **Define Resource Limits:** Set CPU and memory limits to prevent overuse.
3. **Leverage Volumes:** Use shared volumes for persistent data storage between containers.
4. **Secure Your Pods:** Use non-root users and apply security contexts.
5. **Monitor Performance:** Regularly inspect pod logs and metrics to identify bottlenecks.

---

### **Conclusion**

Creating and managing pods on AlmaLinux is a powerful way to optimize containerized applications. Whether you’re using Podman for simplicity or Kubernetes for large-scale deployments, AlmaLinux provides a stable and secure foundation.

By following this guide, you can confidently create and manage pods, enabling you to build scalable, efficient, and secure containerized environments. Start experimenting today and harness the full potential of pods on AlmaLinux!
