---
draft: false
title: Bob Sets Up Advanced Monitoring with Prometheus and Grafana on AlmaLinux
linkTitle: Monitoring with Prometheus and Grafana
keywords:
  - Monitoring with Prometheus
description: "Prometheus: A monitoring tool that collects and stores metrics. Grafana: A visualization platform that creates interactive dashboards."
date: 2024-12-10
url: bob-sets-advanced-monitoring-prometheus-grafana-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 810
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next task was to implement an **advanced monitoring solution** for his AlmaLinux server. He learned to use **Prometheus**, a powerful monitoring system, and **Grafana**, a visualization tool, to monitor system metrics and present them in beautiful, interactive dashboards.

> *“With great monitoring comes great control—time to set it up!”* Bob said, diving into the world of observability.

---

### **Chapter Outline: "Bob Sets Up Advanced Monitoring with Prometheus and Grafana"**

1. **Introduction: Why Advanced Monitoring?**
   - The importance of monitoring and visualization.
   - Overview of Prometheus and Grafana.

2. **Installing Prometheus**
   - Setting up Prometheus on AlmaLinux.
   - Configuring Prometheus to collect metrics.

3. **Setting Up Grafana**
   - Installing Grafana.
   - Integrating Grafana with Prometheus.

4. **Monitoring AlmaLinux Metrics**
   - Using Prometheus exporters.
   - Creating dashboards in Grafana.

5. **Alerting with Prometheus and Grafana**
   - Configuring Prometheus alerts.
   - Setting up notifications in Grafana.

6. **Conclusion: Bob Reflects on Monitoring Mastery**

---

### **Part 1: Introduction: Why Advanced Monitoring?**

Bob learned that advanced monitoring provides insights into system performance, helps identify bottlenecks, and ensures issues are resolved before they become critical.

#### **Why Prometheus and Grafana?**

- **Prometheus**: A monitoring tool that collects and stores metrics.
- **Grafana**: A visualization platform that creates interactive dashboards.

> *“Prometheus and Grafana give me visibility into every corner of my server!”* Bob said.

---

### **Part 2: Installing Prometheus**

#### **Step 1: Download and Install Prometheus**

- Download the latest Prometheus tarball:

  ```bash
  curl -LO https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz
  ```

- Extract the archive:

  ```bash
  tar -xvf prometheus-2.47.0.linux-amd64.tar.gz
  ```

- Move the binaries:

  ```bash
  sudo mv prometheus /usr/local/bin/
  sudo mv promtool /usr/local/bin/
  ```

#### **Step 2: Configure Prometheus**

- Create a Prometheus configuration file:

  ```bash
  sudo mkdir -p /etc/prometheus
  sudo nano /etc/prometheus/prometheus.yml
  ```

- Add the following content:

  ```yaml
  global:
    scrape_interval: 15s

  scrape_configs:
    - job_name: 'node'
      static_configs:
        - targets: ['localhost:9090']
  ```

#### **Step 3: Start Prometheus**

- Run Prometheus:

  ```bash
  prometheus --config.file=/etc/prometheus/prometheus.yml
  ```

- Verify Prometheus is running by visiting:

  ```plaintext
  http://<server-ip>:9090
  ```

> *“Prometheus is live and collecting metrics!”* Bob said.

---

### **Part 3: Setting Up Grafana**

#### **Step 1: Install Grafana**

- Add the Grafana repository:

  ```bash
  sudo dnf install -y https://dl.grafana.com/enterprise-release/grafana-enterprise-10.2.0-1.x86_64.rpm
  ```

- Install Grafana:

  ```bash
  sudo dnf install -y grafana
  ```

#### **Step 2: Start Grafana**

- Enable and start the Grafana service:

  ```bash
  sudo systemctl enable grafana-server --now
  ```

- Access Grafana in a browser:

  ```plaintext
  http://<server-ip>:3000
  ```

- Default login:
  - Username: `admin`
  - Password: `admin`

---

### **Part 4: Monitoring AlmaLinux Metrics**

#### **Step 1: Using Prometheus Exporters**

Bob installed the **Node Exporter** to collect Linux system metrics.

- Download the Node Exporter:

  ```bash
  curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz
  ```

- Extract and move the binary:

  ```bash
  tar -xvf node_exporter-1.6.0.linux-amd64.tar.gz
  sudo mv node_exporter /usr/local/bin/
  ```

- Start the Node Exporter:

  ```bash
  node_exporter &
  ```

- Add the Node Exporter to Prometheus:

  ```yaml
  scrape_configs:
    - job_name: 'node'
      static_configs:
        - targets: ['localhost:9100']
  ```

- Restart Prometheus:

  ```bash
  sudo systemctl restart prometheus
  ```

#### **Step 2: Creating Dashboards in Grafana**

- Add Prometheus as a data source in Grafana:
  1. Navigate to **Configuration > Data Sources**.
  2. Add a new Prometheus data source with URL:

     ```plaintext
     http://localhost:9090
     ```

- Import a prebuilt Node Exporter dashboard:
  1. Go to **Create > Import**.
  2. Use Dashboard ID `1860` from Grafana’s repository.

> *“Now I can visualize my server’s health in real time!”* Bob said.

---

### **Part 5: Alerting with Prometheus and Grafana**

#### **Step 1: Configuring Prometheus Alerts**

- Add an alert rule to Prometheus:

  ```yaml
  alerting:
    alertmanagers:
      - static_configs:
          - targets: ['localhost:9093']

  rule_files:
    - "alerts.yml"
  ```

- Create `alerts.yml`:

  ```yaml
  groups:
    - name: ExampleAlert
      rules:
        - alert: HighCPUUsage
          expr: node_cpu_seconds_total > 80
          for: 1m
          labels:
            severity: critical
          annotations:
            summary: "High CPU usage detected"
  ```

- Restart Prometheus to apply changes:

  ```bash
  sudo systemctl restart prometheus
  ```

#### **Step 2: Setting Up Grafana Notifications**

- In Grafana, go to **Alerting > Notification Channels**.
- Add an email or Slack notification channel.
- Test notifications with a sample alert.

> *“Alerts make sure I catch issues before users notice!”* Bob said.

---

### **Conclusion: Bob Reflects on Monitoring Mastery**

Bob successfully deployed Prometheus and Grafana, enabling advanced monitoring and alerting for his AlmaLinux server. With real-time insights and historical data, he could proactively manage system performance and uptime.

> Next, Bob plans to explore **High Availability and Clustering on AlmaLinux**.
