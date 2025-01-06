---
draft: false
title: Bob Explores Edge Computing with AlmaLinux
linkTitle: Edge Computing
keywords: ""
description: The edge is where the action happens—time to bring AlmaLinux closer to the data
date: 2024-12-11
url: bob-explores-edge-computing-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 880


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to dive into the world of **edge computing**. With businesses increasingly deploying servers closer to their data sources—like IoT devices and remote sensors—Bob wanted to see how AlmaLinux could handle these workloads efficiently.

> *“The edge is where the action happens—time to bring AlmaLinux closer to the data!”* Bob said as he set up his first edge environment.

---

### **Chapter Outline: "Bob Explores Edge Computing with AlmaLinux"**

1. **Introduction: What Is Edge Computing?**
   - Overview of edge computing and its use cases.
   - Why AlmaLinux is a strong choice for edge deployments.

2. **Setting Up a Lightweight Edge Node**
   - Configuring AlmaLinux for minimal resource usage.
   - Deploying edge-friendly tools like Podman and MicroK8s.

3. **Managing IoT and Sensor Data**
   - Setting up MQTT brokers for IoT communication.
   - Processing data streams with Apache Kafka.

4. **Ensuring Security at the Edge**
   - Implementing firewalls, SELinux, and disk encryption.
   - Securing communication with TLS.

5. **Monitoring and Scaling Edge Infrastructure**
   - Using Prometheus and Grafana for edge monitoring.
   - Automating scaling with Ansible.

6. **Conclusion: Bob Reflects on Edge Computing Mastery**

---

### **Part 1: Introduction: What Is Edge Computing?**

Bob learned that **edge computing** processes data closer to its source, reducing latency and bandwidth usage. AlmaLinux’s stability, small footprint, and flexibility make it ideal for edge environments.

#### **Use Cases for Edge Computing**

- **IoT**: Managing data from smart devices.
- **Content Delivery**: Hosting content closer to end users.
- **Remote Operations**: Managing systems in locations with limited connectivity.

> *“Edge computing brings the power of data processing right to the source!”* Bob said.

---

### **Part 2: Setting Up a Lightweight Edge Node**

#### **Step 1: Configuring AlmaLinux for Minimal Resource Usage**

- Install only essential packages:

  ```bash
  sudo dnf groupinstall "Minimal Install"
  ```

- Disable unnecessary services:

  ```bash
  sudo systemctl disable cups
  sudo systemctl disable avahi-daemon
  ```

- Monitor resource usage:

  ```bash
  top
  ```

#### **Step 2: Deploying Podman for Containers**

- Install Podman:

  ```bash
  sudo dnf install -y podman
  ```

- Run a lightweight container for edge processing:

  ```bash
  podman run -d --name edge-nginx -p 8080:80 nginx:alpine
  ```

#### **Step 3: Installing MicroK8s for Orchestration**

- Install MicroK8s:

  ```bash
  sudo snap install microk8s --classic
  ```

- Enable essential services:

  ```bash
  microk8s enable dns storage
  ```

- Deploy a simple pod:

  ```bash
  microk8s kubectl run edge-app --image=nginx --port=80
  ```

> *“AlmaLinux is ready to handle lightweight edge workloads!”* Bob said.

---

### **Part 3: Managing IoT and Sensor Data**

#### **Step 1: Setting Up an MQTT Broker**

- Install Mosquitto for MQTT:

  ```bash
  sudo dnf install -y mosquitto mosquitto-clients
  ```

- Start Mosquitto:

  ```bash
  sudo systemctl enable mosquitto --now
  ```

- Test MQTT communication:

  ```bash
  mosquitto_sub -t test/topic &
  mosquitto_pub -t test/topic -m "Hello, IoT!"
  ```

#### **Step 2: Processing Data Streams with Kafka**

- Install Apache Kafka:

  ```bash
  sudo dnf install -y kafka-server
  ```

- Start Kafka:

  ```bash
  sudo systemctl enable kafka --now
  ```

- Create a Kafka topic:

  ```bash
  kafka-topics.sh --create --topic sensor-data --bootstrap-server localhost:9092
  ```

- Test Kafka with producers and consumers:

  ```bash
  kafka-console-producer.sh --topic sensor-data --bootstrap-server localhost:9092
  kafka-console-consumer.sh --topic sensor-data --bootstrap-server localhost:9092
  ```

> *“With MQTT and Kafka, my edge node can handle IoT data streams effortlessly!”* Bob noted.

---

### **Part 4: Ensuring Security at the Edge**

#### **Step 1: Implementing a Firewall**

- Configure `firewalld`:

  ```bash
  sudo firewall-cmd --add-service=http --permanent
  sudo firewall-cmd --add-service=mqtt --permanent
  sudo firewall-cmd --reload
  ```

#### **Step 2: Securing Communication with TLS**

- Generate a self-signed TLS certificate:

  ```bash
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/edge.key -out /etc/ssl/certs/edge.crt
  ```

- Configure Mosquitto to use TLS:

  ```plaintext
  listener 8883
  cafile /etc/ssl/certs/edge.crt
  keyfile /etc/ssl/private/edge.key
  ```

#### **Step 3: Enforcing SELinux Policies**

- Check SELinux status:

  ```bash
  sestatus
  ```

- Enable SELinux if not active:

  ```bash
  sudo setenforce 1
  ```

- Create a custom policy for Mosquitto:

  ```bash
  sudo ausearch -c 'mosquitto' --raw | audit2allow -M mosquitto_policy
  sudo semodule -i mosquitto_policy.pp
  ```

> *“Security is non-negotiable, especially at the edge!”* Bob said.

---

### **Part 5: Monitoring and Scaling Edge Infrastructure**

#### **Step 1: Monitoring Edge Nodes**

- Deploy Prometheus on MicroK8s:

  ```bash
  microk8s enable prometheus
  ```

- Access Prometheus metrics:

  ```plaintext
  http://<node-ip>:9090
  ```

#### **Step 2: Automating Scaling with Ansible**

- Create an Ansible playbook for deploying new edge nodes:

  ```yaml
  ---
  - name: Deploy Edge Node
    hosts: edge-servers
    tasks:
      - name: Install required packages
        dnf:
          name: "{{ item }}"
          state: present
        with_items:
          - podman
          - mosquitto
          - python3
  ```

- Run the playbook:

  ```bash
  ansible-playbook -i inventory edge_setup.yml
  ```

> *“Automation makes scaling edge nodes effortless!”* Bob noted.

---

### **Conclusion: Bob Reflects on Edge Computing Mastery**

Bob successfully set up an edge environment with AlmaLinux, running lightweight workloads, processing IoT data, and ensuring robust security. With monitoring and automation, he felt ready to scale edge computing solutions across any organization.

> Next, Bob plans to explore **Linux Automation with Bash and Custom Scripts** to further enhance his efficiency.
