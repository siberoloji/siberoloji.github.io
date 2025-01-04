---
title: Bob Deploys Edge AI Workloads with Kubernetes on AlmaLinux
linkTitle: Edge AI Workloads with Kubernetes
description: "Bob will explore how to deploy and manage machine learning applications on edge devices using Kubernetes. "
date: 2024-11-20
draft: false
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
weight: 390
toc: true
keywords:
  - Edge AI Workloads with Kubernetes
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-deploys-edge-ai-workloads-kubernetes-alma-linux
---
Let’s dive into Chapter 39, *"Bob Deploys Edge AI Workloads with Kubernetes!"*. In this chapter, Bob will explore how to deploy and manage machine learning applications on edge devices using Kubernetes. He’ll learn to balance resource constraints, optimize latency, and ensure seamless integration with central systems.

---

## **1. Introduction: The Rise of Edge AI**

Bob’s company is adopting **Edge AI** to process data closer to its source, such as cameras, sensors, and IoT devices. This minimizes latency, reduces bandwidth costs, and enables real-time decision-making. Bob’s mission is to deploy AI workloads to edge devices while integrating with the central Kubernetes cluster.

> *“AI at the edge—faster insights with less overhead. Let’s make it happen!”* Bob says, ready to jump in.

---

## **2. Setting Up Edge Kubernetes with K3s**

Bob begins by deploying a lightweight Kubernetes distribution, **K3s**, on edge devices.

- **Installing K3s on an Edge Device**:
  - Bob installs K3s on a Raspberry Pi:

    ```bash
    curl -sfL https://get.k3s.io | sh -
    ```

- **Joining Multiple Devices**:
  - He adds additional edge nodes:

    ```bash
    curl -sfL https://get.k3s.io | K3S_URL=https://<master-node-ip>:6443 K3S_TOKEN=<node-token> sh -
    ```

- **Verifying the Cluster**:

  ```bash
  kubectl get nodes
  ```

> *“K3s makes Kubernetes manageable even for resource-constrained edge devices!”* Bob says.

---

## **3. Deploying a Pretrained AI Model**

Bob deploys a pretrained machine learning model to the edge.

- **Preparing the Model**:
  - Bob saves a TensorFlow model (`object-detection`) in a container image.

- **Writing a Deployment YAML**:
  - He creates a deployment for the model:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: object-detection
    spec:
      replicas: 1
      template:
        spec:
          containers:
          - name: object-detection
            image: myrepo/object-detection:latest
            resources:
              limits:
                memory: "512Mi"
                cpu: "500m"
    ```

- **Deploying the Model**:

  ```bash
  kubectl apply -f object-detection.yaml
  ```

> *“My AI model is running at the edge—right where it’s needed!”* Bob says, excited.

---

## **4. Using NVIDIA GPUs for AI Workloads**

Bob learns how to leverage GPUs on edge devices to accelerate AI inference.

- **Installing the NVIDIA GPU Operator**:
  - Bob deploys the NVIDIA GPU operator for GPU-enabled devices:

    ```bash
    kubectl apply -f https://github.com/NVIDIA/gpu-operator/releases/latest/download/gpu-operator.yaml
    ```

- **Modifying the Deployment**:
  - He updates the deployment to use GPU resources:

    ```yaml
    resources:
      limits:
        nvidia.com/gpu: 1
    ```

> *“With GPU acceleration, my model runs faster than ever!”* Bob says.

---

## **5. Integrating with Message Brokers**

To enable real-time communication between edge AI workloads and the central cluster, Bob uses **MQTT**.

- **Installing an MQTT Broker**:
  - Bob sets up Mosquitto as the message broker:

    ```bash
    helm repo add eclipse-mosquitto https://eclipse-mosquitto.github.io/charts
    helm install mosquitto eclipse-mosquitto/mosquitto
    ```

- **Configuring the Model to Publish Results**:
  - The AI model sends predictions to the MQTT broker:

    ```python
    import paho.mqtt.client as mqtt

    client = mqtt.Client()
    client.connect("mqtt-broker-ip")
    client.publish("predictions", "AI prediction result")
    ```

- **Subscribing to Predictions**:
  - Bob subscribes to results from the central cluster:

    ```bash
    mosquitto_sub -h mqtt-broker-ip -t predictions
    ```

> *“MQTT keeps my edge and cloud perfectly synchronized!”* Bob says.

---

## **6. Managing Edge-Central Communication with KubeEdge**

Bob uses **KubeEdge** to extend Kubernetes capabilities to edge devices.

- **Installing KubeEdge**:
  - Bob sets up the **cloudcore** on his central cluster:

    ```bash
    ./cloudcore --config cloudcore.yaml
    ```

  - He installs **edgecore** on the edge devices:

    ```bash
    ./edgecore --config edgecore.yaml
    ```

- **Synchronizing Workloads**:
  - Bob deploys an app from the central cluster to the edge:

    ```bash
    kubectl apply -f edge-app.yaml
    ```

> *“KubeEdge bridges my edge devices and central cluster seamlessly!”* Bob says.

---

## **7. Monitoring AI Workloads**

Bob ensures his AI workloads are running efficiently at the edge.

- **Using Node Exporter**:
  - Bob installs Node Exporter on edge devices for detailed metrics:

    ```bash
    kubectl apply -f https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter.yaml
    ```

- **Creating Dashboards**:
  - He visualizes edge metrics in Grafana:

    ```bash
    kubectl port-forward svc/grafana 3000:3000
    ```

> *“Monitoring helps me keep edge workloads optimized and reliable!”* Bob says.

---

## **8. Deploying Real-Time Video Analytics**

Bob tries real-time video analytics for object detection at the edge.

- **Deploying a Video Processing App**:
  - Bob deploys an app to analyze video streams using OpenCV:

    ```bash
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: video-analytics
    spec:
      replicas: 1
      template:
        spec:
          containers:
          - name: video-analytics
            image: myrepo/video-analytics:latest
            env:
            - name: VIDEO_STREAM
              value: "rtsp://camera-ip/stream"
    ```

- **Viewing Results**:
  - The app outputs detection results to an MQTT topic.

> *“Real-time video analytics on edge devices—this feels like sci-fi!”* Bob says.

---

## **9. Securing Edge AI Workloads**

Bob ensures secure communication and access control for edge AI workloads.

- **Enabling Mutual TLS**:
  - Bob configures mutual TLS (mTLS) for secure connections between edge and cloud.
- **Restricting Resource Access**:
  - He uses RBAC to control who can deploy workloads to edge devices.

> *“Security is just as important at the edge as in the cloud!”* Bob says.

---

## **10. Conclusion: Bob’s Edge AI Breakthrough**

With K3s, KubeEdge, MQTT, and GPU optimization, Bob has built a robust environment for deploying and managing AI workloads on edge devices. His system is fast, efficient, and ready for real-world applications.

> Next, Bob plans to explore **data encryption and secure storage in Kubernetes**, ensuring sensitive information remains protected.

*Stay tuned for the next chapter: "Bob Secures Data with Encryption in Kubernetes!"*
