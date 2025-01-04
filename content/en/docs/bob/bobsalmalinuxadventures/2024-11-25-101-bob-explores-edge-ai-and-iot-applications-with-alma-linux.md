---
draft: false
title: Bob Explores Edge AI and IoT Applications with AlmaLinux
linkTitle: Edge AI and IoT Applications
keywords:
  - Edge ai
description: ombine the power of artificial intelligence (AI) with the Internet of Things (IoT) to create smarter, edge-deployed systems.
date: 2024-12-12
url: bob-explores-edge-ai-iot-applications-almalinux
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
weight: 1010
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
### **Bob Explores Edge AI and IoT Applications with AlmaLinux**

Bob’s next adventure was to combine the power of **artificial intelligence (AI)** with the Internet of Things (**IoT**) to create smarter, edge-deployed systems. By processing data locally at the edge, he aimed to reduce latency and improve efficiency in AI-driven IoT applications.

> *“Edge AI combines the best of IoT and AI—let’s bring intelligence closer to the data!”* Bob said, excited for the challenge.

---

### **Chapter Outline: "Bob Explores Edge AI and IoT Applications"**

1. **Introduction: Why Edge AI for IoT?**
   - Overview of Edge AI and its advantages.
   - Key use cases for AI-driven IoT applications.

2. **Setting Up IoT Infrastructure**
   - Installing and configuring MQTT for device communication.
   - Managing IoT devices with AlmaLinux.

3. **Deploying AI Models on Edge Devices**
   - Installing TensorFlow Lite and PyTorch Mobile.
   - Running AI models locally on edge devices.

4. **Integrating IoT with AI Workflows**
   - Collecting and processing IoT data with AI.
   - Automating responses using AI predictions.

5. **Securing Edge AI and IoT Systems**
   - Encrypting data between devices and edge nodes.
   - Implementing access controls for IoT devices.

6. **Monitoring and Scaling Edge AI Workloads**
   - Using Prometheus and Grafana to monitor edge devices.
   - Scaling AI inference with lightweight Kubernetes (K3s).

7. **Conclusion: Bob Reflects on Edge AI Mastery**

---

### **Part 1: Why Edge AI for IoT?**

Bob learned that **Edge AI** involves running AI algorithms directly on IoT devices or edge servers, enabling real-time data analysis without relying heavily on cloud resources.

#### **Edge AI Use Cases**

- **Smart Cities**: Managing traffic with real-time video analysis.
- **Industrial IoT**: Predicting machine failures using sensor data.
- **Healthcare**: Monitoring patients with wearable devices.

> *“Edge AI brings intelligence to the source of data!”* Bob noted.

---

### **Part 2: Setting Up IoT Infrastructure**

#### **Step 1: Installing and Configuring MQTT**

- Install Mosquitto MQTT broker:

  ```bash
  sudo dnf install -y mosquitto mosquitto-clients
  ```

- Start the broker:

  ```bash
  sudo systemctl enable mosquitto --now
  ```

- Test MQTT communication:
  - Subscribe to a topic:

    ```bash
    mosquitto_sub -t "iot/devices/temperature" -v
    ```

  - Publish a message:

    ```bash
    mosquitto_pub -t "iot/devices/temperature" -m "25.3"
    ```

#### **Step 2: Managing IoT Devices**

- Use AlmaLinux to manage connected devices via SSH:

  ```bash
  ssh user@iot-device.local
  ```

- Deploy a monitoring script:

  ```bash
  while true; do
      temp=$(cat /sys/class/thermal/thermal_zone0/temp)
      mosquitto_pub -t "iot/devices/temperature" -m "$temp"
      sleep 10
  done
  ```

> *“With MQTT and Linux, I can easily communicate with IoT devices!”* Bob said.

---

### **Part 3: Deploying AI Models on Edge Devices**

#### **Step 1: Installing TensorFlow Lite**

- Install TensorFlow Lite runtime:

  ```bash
  pip3 install tflite-runtime
  ```

- Run an image classification model:

  ```python
  from tflite_runtime.interpreter import Interpreter

  interpreter = Interpreter(model_path="model.tflite")
  interpreter.allocate_tensors()

  input_details = interpreter.get_input_details()
  output_details = interpreter.get_output_details()

  input_data = ...  # Preprocessed image
  interpreter.set_tensor(input_details[0]['index'], input_data)
  interpreter.invoke()
  predictions = interpreter.get_tensor(output_details[0]['index'])
  ```

#### **Step 2: Running PyTorch Mobile**

- Install PyTorch Mobile:

  ```bash
  pip3 install torch torchvision
  ```

- Load and run a model:

  ```python
  import torch
  model = torch.jit.load('model.pt')
  input_data = torch.tensor([...])  # Example input data
  predictions = model(input_data)
  ```

> *“AI models running locally on edge devices enable real-time decision-making!”* Bob said.

---

### **Part 4: Integrating IoT with AI Workflows**

#### **Step 1: Collecting and Processing IoT Data**

- Stream data from IoT devices:

  ```python
  import paho.mqtt.client as mqtt

  def on_message(client, userdata, msg):
      print(f"Received message: {msg.payload.decode()}")

  client = mqtt.Client()
  client.on_message = on_message
  client.connect("localhost", 1883)
  client.subscribe("iot/devices/temperature")
  client.loop_forever()
  ```

#### **Step 2: Automating Responses with AI Predictions**

- Use AI predictions to control devices:

  ```python
  if predictions[0] > 0.5:
      mqtt.publish("iot/devices/fan", "ON")
  else:
      mqtt.publish("iot/devices/fan", "OFF")
  ```

> *“AI and IoT together create intelligent, autonomous systems!”* Bob said.

---

### **Part 5: Securing Edge AI and IoT Systems**

#### **Step 1: Encrypting Data Transmission**

- Enable SSL in Mosquitto:

  ```plaintext
  listener 8883
  cafile /etc/mosquitto/ca.crt
  certfile /etc/mosquitto/server.crt
  keyfile /etc/mosquitto/server.key
  ```

- Restart Mosquitto:

  ```bash
  sudo systemctl restart mosquitto
  ```

#### **Step 2: Implementing Access Controls**

- Restrict device access:

  ```bash
  echo "iot-device:password" | sudo tee -a /etc/mosquitto/passwords
  sudo mosquitto_passwd -U /etc/mosquitto/passwords
  ```

> *“Encryption and access controls protect my IoT and AI systems from attacks!”* Bob noted.

---

### **Part 6: Monitoring and Scaling Edge AI Workloads**

#### **Step 1: Monitoring Edge Devices**

- Install Prometheus Node Exporter on edge devices:

  ```bash
  sudo dnf install -y prometheus-node-exporter
  sudo systemctl enable node_exporter --now
  ```

- Visualize metrics in Grafana:

  ```bash
  sudo grafana-cli plugins install grafana-piechart-panel
  sudo systemctl restart grafana-server
  ```

#### **Step 2: Scaling AI Inference with K3s**

- Install K3s for lightweight Kubernetes:

  ```bash
  curl -sfL https://get.k3s.io | sh -
  ```

- Deploy an AI model as a Kubernetes service:

  ```yaml
  apiVersion: v1
  kind: Service
  metadata:
    name: ai-service
  spec:
    ports:
    - port: 8501
    selector:
      app: ai-model
  ---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: ai-model
  spec:
    replicas: 2
    template:
      metadata:
        labels:
          app: ai-model
      spec:
        containers:
        - name: ai-model
          image: tensorflow/serving
          args: ["--model_base_path=/models/my-model", "--rest_api_port=8501"]
  ```

- Apply the configuration:

  ```bash
  kubectl apply -f ai-service.yaml
  ```

> *“K3s makes scaling edge AI workloads lightweight and efficient!”* Bob said.

---

### **Conclusion: Bob Reflects on Edge AI and IoT Mastery**

Bob successfully deployed AI-driven IoT applications on AlmaLinux, leveraging MQTT for communication, TensorFlow Lite for AI inference, and K3s for scaling workloads. With robust security and monitoring tools in place, he was ready to tackle even more complex edge AI challenges.

> Next, Bob plans to explore **Advanced Networking with AlmaLinux**, focusing on SDNs and VPNs.
