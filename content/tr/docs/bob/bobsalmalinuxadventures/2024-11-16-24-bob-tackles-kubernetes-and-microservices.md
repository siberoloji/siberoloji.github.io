---
title: Bob Tackles Kubernetes and Microservices on AlmaLinux
linkTitle: Kubernetes and Microservices
description: Bob will learn the basics of Kubernetes, explore how it orchestrates containerized applications, and deploy his first microservices architecture using AlmaLinux as the foundation.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 240
toc: true
keywords:
  - Kubernetes and Microservices on AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-tackles-kubernetes-microservices-alma-linux
---
Let’s dive into Chapter 24, *"Bob Tackles Kubernetes and Microservices!"*. In this chapter, Bob will learn the basics of Kubernetes, explore how it orchestrates containerized applications, and deploy his first microservices architecture using AlmaLinux as the foundation.

---

## **1. Introduction: Bob’s Kubernetes Challenge**

Bob’s containerized workloads are running smoothly, but his manager has heard about **Kubernetes**, a powerful tool for managing and scaling containers. Bob is tasked with learning how to use Kubernetes to deploy a microservices architecture. This means understanding concepts like pods, services, and deployments—all while keeping things simple and efficient.

> *“Containers are cool, but Kubernetes seems like the ultimate power-up!”* Bob says, ready to embrace the challenge.

---

## **2. Installing Kubernetes on AlmaLinux**

Bob starts by setting up a Kubernetes cluster on his AlmaLinux system.

- **Installing `kubeadm`**:
  - Kubernetes provides a tool called `kubeadm` to simplify cluster setup. Bob installs the necessary tools:

    ```bash
    sudo dnf install -y kubeadm kubelet kubectl --disableexcludes=kubernetes
    ```

- **Enabling the `kubelet` Service**:
  - Bob starts and enables the Kubernetes node service:

    ```bash
    sudo systemctl enable --now kubelet
    ```

- **Initializing the Cluster**:
  - Bob initializes the master node with `kubeadm`:

    ```bash
    sudo kubeadm init --pod-network-cidr=192.168.0.0/16
    ```

    This sets up a basic Kubernetes cluster with a defined pod network.

- **Setting Up `kubectl`**:
  - To manage the cluster, Bob configures `kubectl`:

    ```bash
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    ```

> *“The Kubernetes cluster is live—this is going to be fun!”* Bob says, feeling proud of his setup.

---

## **3. Deploying a Pod in Kubernetes**

Bob learns that **pods** are the smallest units in Kubernetes, representing one or more containers running together.

- **Creating a Pod Configuration**:
  - Bob writes a simple YAML file, `nginx-pod.yaml`, to deploy an Nginx container:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx-pod
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
    ```

- **Deploying the Pod**:
  - Bob uses `kubectl` to apply the configuration:

    ```bash
    kubectl apply -f nginx-pod.yaml
    ```

- **Checking Pod Status**:
  - To verify the pod is running, Bob checks its status:

    ```bash
    kubectl get pods
    ```

> *“The pod is running—Kubernetes feels like magic already!”* Bob says, excited by the simplicity.

---

## **4. Exposing a Pod with a Service**

To make the Nginx pod accessible, Bob creates a **service** to expose it.

- **Creating a Service Configuration**:
  - Bob writes a YAML file, `nginx-service.yaml`:

    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: nginx-service
    spec:
      selector:
        app: nginx
      ports:
      - protocol: TCP
        port: 80
        targetPort: 80
      type: NodePort
    ```

- **Applying the Service**:

  ```bash
  kubectl apply -f nginx-service.yaml
  ```

- **Accessing the Service**:
  - Bob finds the service’s NodePort with:

    ```bash
    kubectl get svc
    ```

  - He accesses the Nginx service in his browser using `<node-ip>:<node-port>`.

> *“Now my pod is live and accessible—this is getting exciting!”* Bob says.

---

## **5. Creating a Deployment for Scaling**

Bob learns that **deployments** are the Kubernetes way to manage scaling and updates for pods.

- **Writing a Deployment Configuration**:
  - Bob creates `nginx-deployment.yaml` to deploy and scale Nginx pods:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deployment
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: nginx
      template:
        metadata:
          labels:
            app: nginx
        spec:
          containers:
          - name: nginx
            image: nginx:latest
            ports:
            - containerPort: 80
    ```

- **Applying the Deployment**:

  ```bash
  kubectl apply -f nginx-deployment.yaml
  ```

- **Scaling the Deployment**:
  - Bob scales the deployment to 5 replicas:

    ```bash
    kubectl scale deployment nginx-deployment --replicas=5
    ```

> *“Scaling pods up and down is so easy with Kubernetes!”* Bob notes, appreciating the flexibility.

---

## **6. Monitoring Kubernetes with the Dashboard**

To keep an eye on his cluster, Bob installs the Kubernetes **dashboard**.

- **Deploying the Dashboard**:

  ```bash
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.1/aio/deploy/recommended.yaml
  ```

- **Starting the Dashboard**:
  - Bob accesses the dashboard using `kubectl proxy` and a browser:

    ```bash
    kubectl proxy
    ```

    URL: [http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

> *“The dashboard makes it so easy to manage and visualize my cluster!”* Bob says, loving the user-friendly interface.

---

## **7. Exploring Microservices with Kubernetes**

Bob decides to deploy a simple **microservices** architecture using Kubernetes.

- **Creating Two Services**:
  - Bob deploys a frontend service using Nginx and a backend service using Python Flask:
    - Frontend YAML:

      ```yaml
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: frontend
      spec:
        replicas: 2
        selector:
          matchLabels:
            app: frontend
        template:
          metadata:
            labels:
              app: frontend
          spec:
            containers:
            - name: frontend
              image: nginx
      ```

    - Backend YAML:

      ```yaml
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: backend
      spec:
        replicas: 2
        selector:
          matchLabels:
            app: backend
        template:
          metadata:
            labels:
              app: backend
          spec:
            containers:
            - name: backend
              image: python:3.8
              command: ["python", "-m", "http.server", "5000"]
      ```

- **Linking Services with Kubernetes Networking**:
  - Bob ensures the backend is accessible to the frontend by creating Kubernetes **ClusterIP** services for internal communication.

> *“With Kubernetes, running microservices feels seamless!”* Bob says, impressed by the architecture.

---

## **8. Conclusion: Bob Masters Kubernetes Basics**

With pods, services, deployments, and microservices in place, Bob has taken his first big step into Kubernetes. He’s excited to use these skills to manage even larger, more complex workloads in the future.

> Next up, Bob plans to explore **persistent storage in Kubernetes**, ensuring his data survives container restarts.

*Stay tuned for the next chapter: "Bob Explores Persistent Storage in Kubernetes!"*
