---
title: Bob Deploys Edge Analytics with Kubernetes on AlmaLinux
linkTitle: Edge Analytics with Kubernetes
description: How to use Kubernetes for deploying analytics workloads at the edge, enabling near real-time insights from data collected by sensors and devices in remote locations.
date: 2024-11-21
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
weight: 460
toc: true
keywords:
  - Edge Analytics with Kubernetes
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-deploys-edge-analytics-kubernetes-alma-linux
---
Let’s dive into Chapter 46, *"Bob Deploys Edge Analytics with Kubernetes!"*. In this chapter, Bob explores how to use Kubernetes for deploying analytics workloads at the edge, enabling near real-time insights from data collected by sensors and devices in remote locations.

---

## **1. Introduction: Why Edge Analytics?**

Bob’s team needs to analyze data from IoT sensors in real time at the edge. By processing data locally, they can reduce latency, minimize bandwidth costs, and enable faster decision-making.

> *“Analyzing data at the edge keeps things efficient and responsive—let’s build it!”* Bob says, excited to tackle the challenge.

---

## **2. Setting Up Edge Kubernetes with K3s**

Bob begins by deploying a lightweight Kubernetes distribution, **K3s**, on edge devices.

- **Installing K3s**:
  - Bob installs K3s on a Raspberry Pi:

    ```bash
    curl -sfL https://get.k3s.io | sh -
    ```

- **Adding Edge Nodes**:
  - He joins additional edge devices to the cluster:

    ```bash
    curl -sfL https://get.k3s.io | K3S_URL=https://<master-ip>:6443 K3S_TOKEN=<node-token> sh -
    ```

- **Verifying the Cluster**:

  ```bash
  kubectl get nodes
  ```

> *“K3s is lightweight and perfect for edge analytics!”* Bob says.

---

## **3. Deploying a Data Stream Processor**

Bob sets up **Apache Flink** for real-time data processing at the edge.

- **Installing Flink**:
  - Bob deploys Flink on K3s:

    ```bash
    helm repo add flink https://apache.github.io/flink-kubernetes-operator/
    helm install flink flink/flink
    ```

- **Creating a Flink Job**:
  - Bob writes a Flink job to process sensor data:

    ```java
    StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
    DataStream<String> stream = env.socketTextStream("mqtt-broker-ip", 1883);
    stream.map(data -> "Processed: " + data).print();
    env.execute("Edge Analytics Processor");
    ```

- **Running the Job**:

  ```bash
  ./bin/flink run -m kubernetes-cluster -p 2 edge-analytics-job.jar
  ```

> *“Flink gives me the power to process data in real time at the edge!”* Bob says.

---

## **4. Integrating Edge Analytics with IoT Sensors**

Bob sets up an **MQTT broker** to collect data from IoT devices.

- **Deploying Mosquitto**:

  ```bash
  helm repo add eclipse-mosquitto https://eclipse-mosquitto.github.io/charts
  helm install mqtt-broker eclipse-mosquitto/mosquitto
  ```

- **Simulating Sensor Data**:
  - Bob writes a Python script to simulate sensor data:

    ```python
    import paho.mqtt.client as mqtt
    import random, time

    client = mqtt.Client()
    client.connect("mqtt-broker-ip", 1883)

    while True:
        data = random.uniform(20.0, 30.0)
        client.publish("sensors/temperature", f"{data}")
        time.sleep(1)
    ```

> *“Now my sensors are streaming data to the edge!”* Bob says.

---

## **5. Deploying AI Models for Analytics**

Bob integrates machine learning models to enhance analytics at the edge.

- **Preparing an AI Model**:
  - Bob trains a TensorFlow model to predict anomalies in temperature data.

- **Deploying the Model**:
  - He wraps the model in a Flask API and containerizes it:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: edge-ai
    spec:
      replicas: 1
      template:
        spec:
          containers:
          - name: ai-processor
            image: myrepo/edge-ai:latest
    ```

- **Using the Model**:
  - Bob modifies the Flink job to send data to the AI model for anomaly detection.

> *“AI-powered analytics makes edge insights smarter!”* Bob says.

---

## **6. Storing Processed Data Locally**

Bob sets up local storage for processed analytics data.

- **Deploying TimescaleDB**:
  - Bob uses TimescaleDB for time-series data storage:

    ```bash
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm install timescale bitnami/postgresql
    ```

- **Ingesting Data**:
  - He writes a script to store processed data in TimescaleDB:

    ```python
    import psycopg2

    conn = psycopg2.connect("dbname=edge user=admin password=secret host=timescale-ip")
    cur = conn.cursor()
    cur.execute("INSERT INTO analytics (time, value) VALUES (NOW(), %s)", (processed_data,))
    conn.commit()
    ```

> *“Edge storage ensures data is available locally for quick access!”* Bob says.

---

## **7. Visualizing Analytics**

Bob adds dashboards for visualizing edge analytics data.

- **Using Grafana**:
  - Bob sets up Grafana to connect to TimescaleDB:

    ```bash
    helm repo add grafana https://grafana.github.io/helm-charts
    helm install grafana grafana/grafana
    ```

- **Creating Dashboards**:
  - He builds dashboards to display real-time temperature readings, anomaly detection, and trends.

> *“Dashboards make analytics insights actionable!”* Bob notes.

---

## **8. Scaling Edge Analytics**

Bob ensures his edge analytics stack can handle increasing workloads.

- **Using Horizontal Pod Autoscaling (HPA)**:
  - Bob configures autoscaling for the Flink job processor:

    ```yaml
    apiVersion: autoscaling/v2
    kind: HorizontalPodAutoscaler
    metadata:
      name: flink-hpa
    spec:
      scaleTargetRef:
        apiVersion: apps/v1
        kind: Deployment
        name: flink
      minReplicas: 1
      maxReplicas: 5
      metrics:
      - type: Resource
        resource:
          name: cpu
          targetAverageUtilization: 70
    ```

> *“Autoscaling keeps my edge system responsive during peak loads!”* Bob says.

---

## **9. Ensuring Security at the Edge**

Bob secures communication and workloads at the edge.

- **Enabling Mutual TLS (mTLS)**:
  - Bob configures Mosquitto to use TLS for secure device communication:

    ```bash
    mosquitto --cert /path/to/cert.pem --key /path/to/key.pem
    ```

- **Restricting Access with RBAC**:
  - He uses RBAC to limit access to sensitive components:

    ```yaml
    apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      name: edge-role
    rules:
    - apiGroups: [""]
      resources: ["pods", "services"]
      verbs: ["get", "list", "create"]
    ```

> *“Security is non-negotiable for edge analytics!”* Bob says.

---

## **10. Conclusion: Bob’s Edge Analytics Triumph**

With K3s, Flink, AI models, and secure storage, Bob has built a robust edge analytics system. It processes IoT data in real time, enables smarter decision-making, and operates efficiently even in remote locations.

> Next, Bob plans to explore **multi-cloud Kubernetes deployments**, managing workloads across multiple cloud providers for resilience and scalability.

*Stay tuned for the next chapter: "Bob Masters Multi-Cloud Kubernetes Deployments!"*
