---
title: Bob Ventures into Edge Computing with Kubernetes
linkTitle: Edge Computing with Kubernetes
description: In this chapter, Bob will learn how to extend Kubernetes to edge devices, leveraging lightweight distributions like **K3s** and tools for managing workloads at the edge while ensuring efficient communication with the central cloud cluster.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 320
toc: true
keywords:
  - Edge Computing with Kubernetes
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-ventures-edge-computing-kubernetes-alma-linux
---
Let’s dive into Chapter 32, *"Bob Ventures into Edge Computing with Kubernetes!"*. In this chapter, Bob will learn how to extend Kubernetes to edge devices, leveraging lightweight distributions like **K3s** and tools for managing workloads at the edge while ensuring efficient communication with the central cloud cluster.

---

## **1. Introduction: What Is Edge Computing?**

Bob discovers that **edge computing** involves running workloads closer to the data source—such as IoT devices or remote servers—to reduce latency and bandwidth usage. His task is to manage Kubernetes workloads on edge devices while maintaining synchronization with his central cluster.

> *“Kubernetes on tiny edge devices? Let’s see how far this can go!”* Bob says, intrigued by the possibilities.

---

## **2. Setting Up Lightweight Kubernetes with K3s**

Bob starts with **K3s**, a lightweight Kubernetes distribution optimized for edge devices.

- **Installing K3s on an Edge Device**:
  - Bob installs K3s on a Raspberry Pi:

    ```bash
    curl -sfL https://get.k3s.io | sh -
    ```

  - He confirms the installation:

    ```bash
    kubectl get nodes
    ```

- **Configuring the K3s Agent**:
  - Bob adds a second Raspberry Pi as a K3s agent, connecting it to the master node:

    ```bash
    curl -sfL https://get.k3s.io | K3S_URL=https://<master-node-ip>:6443 K3S_TOKEN=<node-token> sh -
    ```

> *“K3s brings the power of Kubernetes to resource-constrained devices!”* Bob says, impressed by its efficiency.

---

## **3. Managing Edge Clusters with KubeEdge**

To integrate edge devices with his central cluster, Bob sets up **KubeEdge**.

- **Installing KubeEdge**:
  - Bob installs the **cloudcore** component on his central cluster:

    ```bash
    wget https://github.com/kubeedge/kubeedge/releases/download/v1.11.0/kubeedge-v1.11.0-linux-amd64.tar.gz
    tar -xvf kubeedge-v1.11.0-linux-amd64.tar.gz
    cd kubeedge-v1.11.0
    ./cloudcore --config cloudcore.yaml
    ```

  - On the edge device, he installs **edgecore** to communicate with the central cluster:

    ```bash
    ./edgecore --config edgecore.yaml
    ```

- **Registering Edge Nodes**:
  - Bob registers the edge node with the central Kubernetes API server.

> *“KubeEdge bridges my edge devices and cloud infrastructure seamlessly!”* Bob says.

---

## **4. Deploying Workloads to Edge Devices**

Bob deploys an application specifically for his edge devices.

- **Writing an Edge Deployment YAML**:
  - Bob creates a deployment targeting the edge node:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: edge-app
    spec:
      replicas: 1
      template:
        spec:
          containers:
          - name: edge-container
            image: nginx
          nodeSelector:
            node-role.kubernetes.io/edge: ""
    ```

- **Applying the Deployment**:

  ```bash
  kubectl apply -f edge-app.yaml
  ```

- **Testing the App**:
  - Bob confirms the app is running on the edge device:

    ```bash
    kubectl get pods -o wide
    ```

> *“Deploying apps directly to edge nodes is so cool!”* Bob says, excited.

---

## **5. Synchronizing Edge and Cloud Workloads**

To ensure smooth communication between edge and cloud, Bob configures **message buses**.

- **Using MQTT for Edge-Cloud Communication**:
  - Bob sets up an MQTT broker on the cloud cluster and configures edge devices to publish data:

    ```bash
    sudo apt-get install mosquitto mosquitto-clients
    mosquitto_pub -t "edge/topic" -m "Hello from Edge"
    mosquitto_sub -t "edge/topic"
    ```

- **Deploying a Cloud Listener**:
  - He writes a Python script to process data from edge devices:

    ```python
    import paho.mqtt.client as mqtt
    def on_message(client, userdata, message):
        print(f"Message received: {message.payload.decode()}")
    client = mqtt.Client()
    client.connect("mqtt-broker-ip")
    client.subscribe("edge/topic")
    client.on_message = on_message
    client.loop_forever()
    ```

> *“With MQTT, my edge devices and cloud cluster are perfectly in sync!”* Bob says.

---

## **6. Using Helm Charts for Edge Workloads**

Bob automates edge workload deployment with **Helm**.

- **Creating a Helm Chart**:
  - Bob generates a chart for his edge app:

    ```bash
    helm create edge-app
    ```

- **Customizing Values**:
  - He updates the `values.yaml` file for edge-specific configurations:

    ```yaml
    replicaCount: 1
    image:
      repository: nginx
      tag: latest
    nodeSelector:
      node-role.kubernetes.io/edge: ""
    ```

- **Deploying the Chart**:

  ```bash
  helm install edge-app ./edge-app
  ```

> *“Helm simplifies edge deployment workflows!”* Bob says, appreciating the convenience.

---

## **7. Monitoring Edge Devices**

Bob ensures his edge workloads are performing optimally.

- **Using Prometheus and Grafana**:
  - Bob sets up Prometheus to scrape metrics from edge nodes.
  - He creates Grafana dashboards to monitor CPU, memory, and network usage on edge devices.

- **Deploying Node-Exporter**:
  - Bob installs Node-Exporter on edge nodes for detailed metrics:

    ```bash
    kubectl apply -f https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter.yaml
    ```

> *“Now I can monitor my edge devices as easily as my cloud cluster!”* Bob says.

---

## **8. Implementing Offline Mode for Edge Nodes**

Bob configures edge nodes to operate independently during network outages.

- **Enabling Edge Autonomy**:
  - Bob configures KubeEdge to allow local control of workloads:

    ```yaml
    edgeCore:
      enableOffline: true
    ```

- **Testing Offline Mode**:
  - He disconnects the edge device and verifies it continues running workloads seamlessly.

> *“Edge autonomy ensures my devices are reliable, even without connectivity!”* Bob says.

---

## **9. Securing Edge Workloads**

Bob ensures secure communication between edge nodes and the cloud.

- **Enabling mTLS**:
  - Bob configures mutual TLS (mTLS) for edge-to-cloud communication.

- **Hardening Edge Nodes**:
  - He applies Kubernetes **PodSecurityPolicies** and restricts access to edge nodes.

> *“Security is non-negotiable for edge computing!”* Bob notes.

---

## **10. Conclusion: Bob’s Edge Computing Mastery**

With K3s, KubeEdge, Helm, and robust monitoring, Bob has mastered deploying and managing workloads on edge devices. His Kubernetes infrastructure now extends to the farthest reaches, from cloud to edge.

> Next, Bob plans to explore **service mesh patterns for advanced traffic control** using tools like Istio and Linkerd.

*Stay tuned for the next chapter: "Bob Explores Service Mesh Patterns in Kubernetes!"*
