---
draft: false
title: Bob Explores AI/ML Workloads on AlmaLinux
linkTitle: AI/ML Workloads
keywords:
  - AI/ML Workloads
description: Delve into artificial intelligence (AI) and machine learning (ML) workloads on AlmaLinux.
date: 2024-12-10
url: bob-explores-ai-ml-workloads-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 860
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure was to delve into **artificial intelligence (AI)** and **machine learning (ML)** workloads on AlmaLinux. With growing interest in data-driven applications, Bob aimed to configure his AlmaLinux server to handle data processing, model training, and inference tasks efficiently.

> *“AI and ML are the future of computing—let’s see what AlmaLinux can do!”* Bob said, ready to explore.

---

### **Chapter Outline: "Bob Explores AI/ML Workloads on AlmaLinux"**

1. **Introduction: Why AI/ML on AlmaLinux?**
   - Overview of AI/ML workloads.
   - Why AlmaLinux is a solid choice for AI/ML.

2. **Setting Up an AI/ML Environment**
   - Installing Python, Jupyter, and common ML libraries.
   - Configuring GPU support with CUDA and cuDNN.

3. **Running AI/ML Workloads**
   - Using TensorFlow and PyTorch.
   - Training and testing a simple ML model.

4. **Optimizing Performance for AI/ML**
   - Managing resources with Docker and Podman.
   - Fine-tuning CPU and GPU performance.

5. **Deploying AI Models**
   - Setting up a REST API with Flask for model inference.
   - Automating model deployment with Ansible.

6. **Monitoring and Scaling AI/ML Applications**
   - Using Prometheus and Grafana to monitor workloads.
   - Scaling ML services with Kubernetes.

7. **Conclusion: Bob Reflects on AI/ML Mastery**

---

### **Part 1: Introduction: Why AI/ML on AlmaLinux?**

Bob learned that AI/ML workloads are computationally intensive, requiring powerful hardware and optimized software environments. AlmaLinux offers stability and compatibility, making it ideal for running AI/ML frameworks.

#### **Why Use AlmaLinux for AI/ML?**

- **Open-source**: No licensing fees, full control over the environment.
- **Stable**: Based on RHEL, ensuring reliability.
- **Scalable**: Supports modern tools like Docker, Kubernetes, and TensorFlow.

> *“AlmaLinux provides a solid foundation for AI innovation!”* Bob said.

---

### **Part 2: Setting Up an AI/ML Environment**

#### **Step 1: Installing Python and Jupyter**

- Install Python and essential tools:

  ```bash
  sudo dnf install -y python3 python3-pip
  ```

- Install Jupyter Notebook:

  ```bash
  pip3 install jupyterlab
  ```

- Start Jupyter:

  ```bash
  jupyter-lab --no-browser --ip=0.0.0.0 --port=8888
  ```

#### **Step 2: Installing ML Libraries**

- Install common libraries:

  ```bash
  pip3 install numpy pandas matplotlib scikit-learn
  ```

- Install TensorFlow and PyTorch:

  ```bash
  pip3 install tensorflow torch torchvision
  ```

#### **Step 3: Configuring GPU Support**

If Bob’s server had an NVIDIA GPU:

- Install CUDA:

  ```bash
  sudo dnf install -y nvidia-driver cuda
  ```

- Install cuDNN:

  ```bash
  sudo dnf install -y libcudnn8
  ```

- Verify GPU support in TensorFlow:

  ```python
  import tensorflow as tf
  print("GPUs Available: ", tf.config.list_physical_devices('GPU'))
  ```

> *“The AI environment is ready—time to build something cool!”* Bob said.

---

### **Part 3: Running AI/ML Workloads**

#### **Step 1: Training a Simple Model**

Bob created a basic TensorFlow script to train a model on the MNIST dataset.

- Save the following Python script as `mnist_train.py`:

  ```python
  import tensorflow as tf
  from tensorflow.keras import layers, models

  # Load MNIST dataset
  (x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
  x_train, x_test = x_train / 255.0, x_test / 255.0

  # Build a simple model
  model = models.Sequential([
      layers.Flatten(input_shape=(28, 28)),
      layers.Dense(128, activation='relu'),
      layers.Dense(10, activation='softmax')
  ])

  # Compile and train the model
  model.compile(optimizer='adam',
                loss='sparse_categorical_crossentropy',
                metrics=['accuracy'])

  model.fit(x_train, y_train, epochs=5)
  test_loss, test_acc = model.evaluate(x_test, y_test)
  print(f"Test accuracy: {test_acc}")
  ```

- Run the script:

  ```bash
  python3 mnist_train.py
  ```

#### **Step 2: Visualizing Results**

Bob used Matplotlib to plot training results:

- Add to the script:

  ```python
  import matplotlib.pyplot as plt

  plt.plot(history.history['accuracy'], label='accuracy')
  plt.xlabel('Epoch')
  plt.ylabel('Accuracy')
  plt.legend()
  plt.show()
  ```

> *“Training a model was easier than I thought!”* Bob said.

---

### **Part 4: Optimizing Performance for AI/ML**

#### **Step 1: Using Docker or Podman**

Bob containerized his AI workloads for portability:

- Create a `Dockerfile`:

  ```plaintext
  FROM tensorflow/tensorflow:latest-gpu
  WORKDIR /app
  COPY mnist_train.py .
  CMD ["python", "mnist_train.py"]
  ```

- Build and run the container:

  ```bash
  podman build -t ai-workload .
  podman run --gpus all ai-workload
  ```

#### **Step 2: Fine-Tuning Hardware Performance**

- Monitor GPU usage:

  ```bash
  nvidia-smi
  ```

- Optimize TensorFlow for the GPU:

  ```python
  from tensorflow.config import experimental

  experimental.set_memory_growth(tf.config.list_physical_devices('GPU')[0], True)
  ```

> *“Optimized hardware ensures maximum speed for training!”* Bob said.

---

### **Part 5: Deploying AI Models**

#### **Step 1: Building a REST API**

- Install Flask:

  ```bash
  pip3 install flask
  ```

- Create an API script:

  ```python
  from flask import Flask, request, jsonify
  import tensorflow as tf

  app = Flask(__name__)
  model = tf.keras.models.load_model('mnist_model.h5')

  @app.route('/predict', methods=['POST'])
  def predict():
      data = request.json
      prediction = model.predict(data['input'])
      return jsonify({'prediction': prediction.tolist()})

  if __name__ == '__main__':
      app.run(host='0.0.0.0', port=5000)
  ```

- Run the API:

  ```bash
  python3 api.py
  ```

#### **Step 2: Automating Deployment with Ansible**

Bob created an Ansible playbook to deploy the API across multiple servers:

- Example playbook:

  ```yaml
  ---
  - name: Deploy AI API
    hosts: ai-servers
    tasks:
      - name: Copy API script
        copy:
          src: /home/bob/api.py
          dest: /opt/ai/api.py
      - name: Install dependencies
        pip:
          name: flask tensorflow
      - name: Start API
        command: python3 /opt/ai/api.py &
  ```

---

### **Part 6: Monitoring and Scaling AI/ML Applications**

#### **Step 1: Monitoring Workloads**

- Use Prometheus to track GPU and CPU metrics.
- Visualize with Grafana.

#### **Step 2: Scaling with Kubernetes**

Bob used Kubernetes to manage multiple instances of his AI API:

- Create a deployment:

  ```yaml
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: ai-api
  spec:
    replicas: 3
    selector:
      matchLabels:
        app: ai-api
    template:
      metadata:
        labels:
          app: ai-api
      spec:
        containers:
        - name: ai-api
          image: ai-workload
          ports:
          - containerPort: 5000
  ```

---

### **Conclusion: Bob Reflects on AI/ML Mastery**

Bob successfully configured AlmaLinux to handle AI/ML workloads, from training models to deploying them as scalable APIs. He felt confident in AlmaLinux’s capabilities for data-driven applications.

> Next, Bob plans to explore **Linux Storage Management with AlmaLinux**.
