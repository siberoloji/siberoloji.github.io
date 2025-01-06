---
title: Bob Gains Observability in Kubernetes
linkTitle: Observability in Kubernetes
description: How to implement comprehensive observability in his Kubernetes cluster using logging, metrics, and tracing to monitor, troubleshoot, and optimize his applications.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 270

keywords:
  - Observability in Kubernetes on AlmaLinux

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-gains-observability-kubernetes-alma-linux
---
Let’s move on to Chapter 27, *"Bob Gains Observability in Kubernetes!"*. In this chapter, Bob will learn how to implement comprehensive observability in his Kubernetes cluster using **logging**, **metrics**, and **tracing** to monitor, troubleshoot, and optimize his applications.

## **1. Introduction: Observability and Its Importance**

Bob has built a robust Kubernetes environment, but keeping everything running smoothly requires complete visibility. Observability gives Bob insights into application performance, resource usage, and potential issues before they become problems.

> *“Observability isn’t just nice to have—it’s essential for running a healthy cluster!”* Bob says, eager to dive in.

---

## **2. Setting Up Centralized Logging**

Bob starts with centralized logging to collect logs from all containers in the cluster.

- **Deploying the EFK Stack**:
  - Bob chooses the **EFK Stack** (Elasticsearch, Fluentd, Kibana) for log aggregation.
  - **Installing Elasticsearch**:

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/elastic/cloud-on-k8s/v2.2.0/config/samples/elasticsearch/elasticsearch.yaml
    ```

  - **Installing Fluentd**:
    - Fluentd collects logs from containers and forwards them to Elasticsearch.

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/fluent/fluentd-kubernetes-daemonset/master/fluentd-daemonset-elasticsearch-rbac.yaml
    ```

  - **Installing Kibana**:
    - Kibana visualizes the logs stored in Elasticsearch.

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/elastic/cloud-on-k8s/v2.2.0/config/samples/kibana/kibana.yaml
    ```

- **Testing the Logging Stack**:
  - Bob generates test logs by accessing one of his services.
  - He opens Kibana in his browser and verifies the logs are collected:

    ```html
    http://<kibana-ip>:5601
    ```

> *“Now I can see logs from every pod in one place—no more chasing individual logs!”* Bob says, excited by the visibility.

---

## **3. Monitoring Metrics with Prometheus and Grafana**

Next, Bob sets up **Prometheus** and **Grafana** to monitor metrics in his cluster.

- **Deploying Prometheus**:

  ```bash
  kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/bundle.yaml
  ```

- **Setting Up Grafana**:

  ```bash
  kubectl apply -f https://raw.githubusercontent.com/grafana/helm-charts/main/charts/grafana/templates/grafana-deployment.yaml
  ```

- **Connecting Prometheus to Grafana**:
  - Bob adds Prometheus as a data source in Grafana and creates a dashboard for CPU, memory, and network metrics.

- **Creating Alerts in Prometheus**:
  - Bob configures alerts for high CPU usage:

    ```yaml
    groups:
    - name: cpu-alerts
      rules:
      - alert: HighCPUUsage
        expr: sum(rate(container_cpu_usage_seconds_total[1m])) > 0.8
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "High CPU usage detected"
    ```

> *“With Prometheus and Grafana, I can track performance and get alerted to problems instantly!”* Bob says, loving the insight.

---

## **4. Implementing Distributed Tracing with Jaeger**

Bob learns that **Jaeger** helps trace requests as they flow through his microservices, making it easier to debug complex issues.

- **Deploying Jaeger**:

  ```bash
  kubectl create namespace observability
  kubectl apply -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/main/deploy/examples/simplest.yaml
  ```

- **Instrumenting Applications**:
  - Bob modifies his Python Flask backend to include Jaeger tracing:

    ```python
    from flask import Flask
    from jaeger_client import Config

    app = Flask(__name__)

    def init_tracer(service_name):
        config = Config(
            config={
                'sampler': {'type': 'const', 'param': 1},
                'local_agent': {'reporting_host': 'jaeger-agent'},
            },
            service_name=service_name,
        )
        return config.initialize_tracer()

    tracer = init_tracer('backend')
    ```

- **Viewing Traces**:
  - Bob accesses the Jaeger UI and traces a request through the backend:

    ```html
    http://<jaeger-ip>:16686
    ```

> *“Tracing makes it so much easier to pinpoint where a request slows down!”* Bob says, impressed.

---

## **5. Using Kubernetes Built-In Tools for Debugging**

Bob explores built-in Kubernetes tools for quick diagnostics.

- **Viewing Pod Logs**:

  ```bash
  kubectl logs <pod-name>
  ```

- **Checking Pod Resource Usage**:

  ```bash
  kubectl top pod
  ```

- **Debugging with `kubectl exec`**:

  ```bash
  kubectl exec -it <pod-name> -- sh
  ```

- **Inspecting Cluster Events**:

  ```bash
  kubectl get events
  ```

> *“The built-in tools are great for quick troubleshooting!”* Bob notes.

---

## **6. Monitoring Application Health with Liveness and Readiness Probes**

Bob ensures his applications remain healthy by adding probes to their configurations.

- **Adding Probes to a Deployment**:
  - Bob updates his Nginx deployment:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 10
    ```

- **Testing Probes**:
  - Bob intentionally breaks the service and observes Kubernetes restarting the pod to restore functionality.

> *“Probes make my apps self-healing!”* Bob says, impressed by the resilience.

---

## **7. Combining Observability Tools into Dashboards**

Bob creates unified dashboards in Grafana to combine logs, metrics, and traces.

- **Adding Logs to Grafana**:
  - Bob integrates Elasticsearch with Grafana to visualize logs alongside metrics.

- **Customizing Dashboards**:
  - He creates panels for:
    - CPU and memory usage.
    - Log error counts.
    - Request trace durations.

> *“One dashboard to rule them all—everything I need in one place!”* Bob says, thrilled.

---

## **8. Automating Observability with Helm Charts**

To simplify observability setup, Bob learns to use **Helm charts**.

- **Installing Helm**:

  ```bash
  sudo dnf install helm
  ```

- **Deploying the EFK Stack with Helm**:

  ```bash
  helm repo add elastic https://helm.elastic.co
  helm install efk elastic/efk-stack
  ```

- **Deploying Prometheus with Helm**:

  ```bash
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm install prometheus prometheus-community/prometheus
  ```

> *“Helm makes deploying complex observability stacks a breeze!”* Bob says, loving the efficiency.

---

## **9. Conclusion: Bob’s Observability Triumph**

With centralized logging, metrics, and tracing in place, Bob’s Kubernetes cluster is fully observable. He can monitor, debug, and optimize his applications with confidence, ensuring everything runs smoothly.

> Next, Bob plans to explore **advanced scheduling and workload management** in Kubernetes, diving into node affinities, taints, and tolerations.

*Stay tuned for the next chapter: "Bob Masters Kubernetes Scheduling and Workload Management!"*
