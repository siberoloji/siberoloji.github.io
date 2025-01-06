---
title: Bob Explores Kubernetes for AI/ML Workloads
linkTitle: Kubernetes for AI/ML
description: Bob will learn how to deploy and manage machine learning workloads on Kubernetes using **Kubeflow**, **Jupyter notebooks**, and specialized tools for AI/ML.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 310

keywords: ""

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-explores-kubernetes-ai-ml-workloads
---
Let’s dive into Chapter 31, *"Bob Explores Kubernetes for AI/ML Workloads!"*. In this chapter, Bob will learn how to deploy and manage machine learning workloads on Kubernetes using **Kubeflow**, **Jupyter notebooks**, and specialized tools for AI/ML.

## **1. Introduction: AI/ML Meets Kubernetes**

Bob’s company is venturing into AI and machine learning. His team wants to train and deploy ML models on Kubernetes, taking advantage of its scalability. Bob’s mission: understand the tools and workflows needed to integrate AI/ML workloads into his cluster.

> *“Kubernetes for AI? Sounds challenging, but also exciting—let’s make it happen!”* Bob says.

---

## **2. Setting Up Kubeflow**

Bob starts by installing **Kubeflow**, a machine learning platform designed for Kubernetes.

- **Deploying Kubeflow**:
  - Bob uses the official deployment script to set up Kubeflow on his cluster:

    ```bash
    curl -O https://raw.githubusercontent.com/kubeflow/manifests/v1.6-branch/kfctl_k8s_istio.yaml
    kfctl apply -f kfctl_k8s_istio.yaml
    ```

- **Accessing the Kubeflow Dashboard**:
  - Bob retrieves the external IP of the Kubeflow dashboard:

    ```bash
    kubectl get svc -n istio-system
    ```

  - He accesses it in his browser.

> *“The Kubeflow dashboard is my new AI command center!”* Bob says, impressed by the interface.

---

## **3. Running Jupyter Notebooks on Kubernetes**

Bob sets up **Jupyter notebooks** for interactive ML development.

- **Creating a Jupyter Notebook Pod**:
  - Bob writes a YAML file, `jupyter-notebook.yaml`:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: jupyter
    spec:
      replicas: 1
      template:
        spec:
          containers:
          - name: jupyter
            image: jupyter/minimal-notebook
            ports:
            - containerPort: 8888
    ```

- **Accessing the Notebook**:
  - Bob exposes the notebook with a NodePort service and retrieves the access URL:

    ```bash
    kubectl expose deployment jupyter --type=NodePort --name=jupyter-service
    kubectl get svc jupyter-service
    ```

> *“Jupyter on Kubernetes makes ML development scalable!”* Bob says.

---

## **4. Training a Machine Learning Model**

Bob learns to train an ML model using distributed workloads.

- **Creating a TensorFlow Job**:
  - Bob installs the Kubeflow **TFJob Operator** to manage TensorFlow training jobs:

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kubeflow/training-operator/master/manifests/v1beta1/tfjob/tfjob-crd.yaml
    ```

- **Submitting a Training Job**:
  - Bob writes `tensorflow-job.yaml` to train a simple model:

    ```yaml
    apiVersion: "kubeflow.org/v1"
    kind: "TFJob"
    metadata:
      name: "mnist-training"
    spec:
      replicaSpecs:
        - replicas: 2
          template:
            spec:
              containers:
              - name: "tensorflow"
                image: "tensorflow/tensorflow:2.4.0"
                command: ["python", "/app/mnist.py"]
    ```

- **Monitoring Training**:

  ```bash
  kubectl logs -f <pod-name>
  ```

> *“Distributed training is a breeze with Kubernetes!”* Bob says, proud of the setup.

---

## **5. Deploying a Trained Model**

Bob deploys a trained ML model as a REST API using **KFServing**.

- **Installing KFServing**:

  ```bash
  kubectl apply -f https://github.com/kubeflow/kfserving/releases/download/v0.7.0/kfserving.yaml
  ```

- **Creating an Inference Service**:
  - Bob writes `inference-service.yaml` to serve the model:

    ```yaml
    apiVersion: serving.kubeflow.org/v1beta1
    kind: InferenceService
    metadata:
      name: mnist-service
    spec:
      predictor:
        tensorflow:
          storageUri: "gs://my-models/mnist/"
    ```

- **Accessing the API**:
  - Bob retrieves the external URL and tests the model with a curl command:

    ```bash
    kubectl get inferenceservice mnist-service
    curl -d '{"instances": [[0.5, 0.3, 0.1]]}' -H "Content-Type: application/json" -X POST http://<service-url>/v1/models/mnist-service:predict
    ```

> *“Serving ML models is now as easy as deploying a Kubernetes service!”* Bob says, amazed.

---

## **6. Using GPUs for AI Workloads**

Bob learns to optimize AI workloads using GPUs.

- **Enabling GPU Support**:
  - Bob installs NVIDIA’s GPU operator:

    ```bash
    kubectl apply -f https://github.com/NVIDIA/gpu-operator/releases/download/v1.9.0/nvidia-gpu-operator.yaml
    ```

- **Deploying a GPU-Accelerated Pod**:
  - He writes a YAML file, `gpu-pod.yaml`:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: gpu-pod
    spec:
      containers:
      - name: tensorflow-gpu
        image: tensorflow/tensorflow:2.4.0-gpu
        resources:
          limits:
            nvidia.com/gpu: 1
    ```

- **Verifying GPU Usage**:

  ```bash
  kubectl logs gpu-pod
  ```

> *“With GPUs, my ML models train faster than ever!”* Bob says, thrilled.

---

## **7. Managing Data with Persistent Volumes**

Bob integrates persistent storage for large datasets.

- **Creating a Persistent Volume**:
  - Bob writes `pv.yaml`:

    ```yaml
    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: ml-data
    spec:
      capacity:
        storage: 50Gi
      accessModes:
        - ReadWriteMany
      hostPath:
        path: /mnt/data
    ```

- **Mounting the Volume**:
  - He updates his TensorFlow job to use the volume for training data.

> *“Persistent volumes simplify handling large datasets!”* Bob says.

---

## **8. Automating AI Pipelines with Kubeflow Pipelines**

Bob automates end-to-end ML workflows with **Kubeflow Pipelines**.

- **Creating a Pipeline**:
  - Bob writes a Python script to define a pipeline using the Kubeflow Pipelines SDK:

    ```python
    from kfp import dsl

    @dsl.pipeline(name="ML Pipeline")
    def pipeline():
        preprocess = dsl.ContainerOp(
            name="Preprocess",
            image="my-preprocess-image",
            arguments=["--input", "/data/raw", "--output", "/data/processed"]
        )
        train = dsl.ContainerOp(
            name="Train",
            image="my-train-image",
            arguments=["--data", "/data/processed", "--model", "/data/model"]
        )
        preprocess >> train
    ```

- **Submitting the Pipeline**:

  ```bash
  kfp run --pipeline ml-pipeline.py
  ```

> *“Automating workflows saves so much time!”* Bob says, appreciating the efficiency.

---

## **9. Monitoring AI Workloads**

Bob ensures his AI workloads are running efficiently.

- **Using Prometheus and Grafana**:
  - He adds GPU and memory metrics to his dashboards.
- **Integrating MLFlow for Experiment Tracking**:
  - Bob uses MLFlow to log model training metrics and compare results.

> *“Observability is just as important for AI as it is for apps!”* Bob notes.

---

## **10. Conclusion: Bob’s AI/ML Kubernetes Expertise**

With Kubeflow, Jupyter, and GPU optimization, Bob has transformed his Kubernetes cluster into an AI powerhouse. He’s ready to tackle real-world ML workloads, from training to deployment, with ease.

> Next, Bob plans to explore **Edge Computing with Kubernetes**, learning how to deploy workloads to edge devices for low-latency applications.

*Stay tuned for the next chapter: "Bob Ventures into Edge Computing with Kubernetes!"*
