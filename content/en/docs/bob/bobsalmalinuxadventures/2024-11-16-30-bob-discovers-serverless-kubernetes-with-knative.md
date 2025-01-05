---
title: Bob Discovers Serverless Kubernetes with Knative
linkTitle: Serverless Kubernetes
description: Bob will explore **Knative**, a framework for building serverless applications on Kubernetes.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 300
toc: true
keywords:
  - Serverless Kubernetes with Knative
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-discovers-serverless-kubernetes-knative-alma-linux
---
Let’s dive into Chapter 30, *"Bob Discovers Serverless Kubernetes with Knative!"*. In this chapter, Bob will explore **Knative**, a framework for building serverless applications on Kubernetes. He’ll learn how to deploy and scale event-driven applications dynamically, saving resources and improving efficiency.

---

## **1. Introduction: What Is Serverless Kubernetes?**

Bob hears about **Knative**, a tool that lets applications scale to zero when idle and dynamically scale up during high demand. It’s perfect for event-driven workloads and cost-conscious environments. Bob is intrigued—this could revolutionize how he deploys applications!

> *“No servers to manage when there’s no traffic? Sounds like magic. Let’s try it out!”* Bob says, ready to experiment.

---

## **2. Installing Knative on Kubernetes**

Bob starts by setting up Knative in his Kubernetes cluster.

- **Installing the Knative Serving Component**:
  - Knative Serving manages the deployment and autoscaling of serverless applications:

    ```bash
    kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-crds.yaml
    kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-core.yaml
    ```

- **Installing a Networking Layer**:
  - Bob uses Istio for routing traffic:

    ```bash
    kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/release.yaml
    ```

- **Verifying the Installation**:

  ```bash
  kubectl get pods -n knative-serving
  kubectl get pods -n istio-system
  ```

> *“Knative is up and running—let’s deploy something serverless!”* Bob says, eager to start.

---

## **3. Deploying a Serverless Application**

Bob deploys his first serverless app using Knative Serving.

- **Creating a Knative Service**:
  - Bob writes a YAML file, `knative-service.yaml`:

    ```yaml
    apiVersion: serving.knative.dev/v1
    kind: Service
    metadata:
      name: hello-service
      namespace: default
    spec:
      template:
        spec:
          containers:
          - image: gcr.io/knative-samples/helloworld-go
            env:
            - name: TARGET
              value: "Hello, Knative!"
    ```

- **Deploying the Service**:

  ```bash
  kubectl apply -f knative-service.yaml
  ```

- **Accessing the Service**:
  - Bob retrieves the external IP and URL:

    ```bash
    kubectl get ksvc hello-service
    ```

  - He accesses the service using the provided URL.

> *“My app scaled up automatically when I accessed it—this is incredible!”* Bob says, amazed by the automation.

---

## **4. Autoscaling with Knative**

Bob learns how Knative automatically adjusts the number of pods based on traffic.

- **Testing Autoscaling**:
  - Bob uses a load testing tool like `hey` to simulate traffic:

    ```bash
    hey -z 30s -q 10 http://<service-url>
    ```

- **Observing Pod Scaling**:

  ```bash
  kubectl get pods -w
  ```

  Bob watches as the number of pods increases with traffic and scales back to zero when the load stops.

> *“Knative handles scaling better than I ever could!”* Bob says, impressed by the resource efficiency.

---

## **5. Adding Event-Driven Workloads with Knative Eventing**

Knative Eventing enables apps to respond to events from various sources. Bob tries it out by connecting his service to an event source.

- **Installing Knative Eventing**:

  ```bash
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.0/eventing-crds.yaml
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.0/eventing-core.yaml
  ```

- **Setting Up an Event Source**:
  - Bob creates a Kubernetes CronJob as an event source:

    ```yaml
    apiVersion: sources.knative.dev/v1
    kind: PingSource
    metadata:
      name: test-ping
    spec:
      schedule: "*/1 * * * *"
      contentType: "application/json"
      data: '{"message": "Hello from PingSource!"}'
      sink:
        ref:
          apiVersion: serving.knative.dev/v1
          kind: Service
          name: hello-service
    ```

- **Deploying the Event Source**:

  ```bash
  kubectl apply -f ping-source.yaml
  ```

- **Verifying Event Delivery**:
  - Bob checks the service logs:

    ```bash
    kubectl logs -l serving.knative.dev/service=hello-service
    ```

> *“My app responds to scheduled events automatically—Knative makes it so simple!”* Bob says, thrilled by the possibilities.

---

## **6. Observability with Knative**

Bob integrates monitoring tools to observe his serverless workloads.

- **Enabling Request Metrics**:
  - Bob installs Prometheus and Grafana, configuring them to scrape Knative’s metrics endpoints.

- **Creating Dashboards**:
  - He creates dashboards for:
    - Request latency.
    - Pod scaling activity.
    - Event delivery success rates.

> *“Real-time metrics help me ensure everything is working perfectly!”* Bob says.

---

## **7. Debugging and Troubleshooting**

Bob explores tools for debugging Knative services.

- **Viewing Service Logs**:

  ```bash
  kubectl logs -l serving.knative.dev/service=hello-service
  ```

- **Inspecting Knative Events**:

  ```bash
  kubectl get events
  ```

- **Using Kiali for Tracing**:
  - Bob deploys Kiali to visualize service traces and debug event delivery issues.

> *“With these tools, debugging serverless apps is a breeze!”* Bob says.

---

## **8. Extending Knative with Custom Event Sources**

Bob writes a custom event source to trigger his service when a file is uploaded to an S3 bucket.

- **Using Knative’s ContainerSource**:
  - Bob writes a YAML file for the custom source:

    ```yaml
    apiVersion: sources.knative.dev/v1
    kind: ContainerSource
    metadata:
      name: s3-source
    spec:
      image: custom-s3-event-source:latest
      sink:
        ref:
          apiVersion: serving.knative.dev/v1
          kind: Service
          name: hello-service
    ```

- **Deploying the Event Source**:

  ```bash
  kubectl apply -f s3-source.yaml
  ```

- **Testing the Source**:
  - Bob uploads a file to the S3 bucket and confirms his service is triggered.

> *“Custom event sources make Knative even more powerful!”* Bob says, excited by the flexibility.

---

## **9. Scaling Serverless Applications Across Clusters**

Bob learns to use Knative with a multi-cluster setup, combining his knowledge of federation and serverless.

- **Deploying Knative Federated Services**:
  - Bob uses KubeFed to synchronize Knative services across clusters, ensuring global availability.

> *“Knative scales seamlessly, even across clusters!”* Bob says, confident in his setup.

---

## **10. Conclusion: Bob’s Serverless Success**

With Knative, Bob has unlocked a new way to deploy and manage applications. His serverless workloads scale dynamically, respond to events, and run efficiently, all while saving resources.

> Next, Bob plans to explore **Kubernetes for AI/ML workloads**, learning how to deploy machine learning models with tools like Kubeflow.

*Stay tuned for the next chapter: "Bob Explores Kubernetes for AI/ML Workloads!"*
