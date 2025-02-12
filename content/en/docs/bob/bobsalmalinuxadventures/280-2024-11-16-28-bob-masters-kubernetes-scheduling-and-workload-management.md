---
title: Bob Masters Kubernetes Scheduling and Workload Management
linkTitle: Kubernetes Scheduling
description: Bob will explore advanced scheduling concepts in Kubernetes, such as node affinities, taints and tolerations and resource quota
date: 2024-11-16T14:45:45.376Z
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 280
keywords:
  - Kubernetes Scheduling
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-masters-kubernetes-scheduling-workload-management-alma-linux
translationKey: bob-masters-kubernetes-scheduling-workload-management-alma-linux
---
Let’s dive into Chapter 28, *"Bob Masters Kubernetes Scheduling and Workload Management!"*. In this chapter, Bob will explore advanced scheduling concepts in Kubernetes, such as **node affinities**, **taints and tolerations**, and **resource quotas**, to fine-tune how workloads are distributed across his cluster.

## **1. Introduction: Controlling Workload Placement**

Bob’s Kubernetes cluster is running smoothly, but he notices that some nodes are underutilized while others are overburdened. He decides to master Kubernetes scheduling to control where and how his workloads run, optimizing for performance and resource usage.

> *“Why let Kubernetes decide everything? It’s time to take charge of workload placement!”* Bob says, ready for the challenge.

---

## **2. Understanding Kubernetes Scheduling Basics**

Bob learns how Kubernetes schedules pods:

- **Default Behavior**:
  - Kubernetes automatically selects a node based on resource availability.
  - The **kube-scheduler** component handles this process.

- **Customizing Scheduling**:
  - **Node Selectors**: Basic matching for pod placement.
  - **Node Affinities**: Advanced rules for workload placement.
  - **Taints and Tolerations**: Restricting access to specific nodes.

> *“The kube-scheduler is smart, but I can make it even smarter with custom rules!”* Bob says, eager to dig deeper.

---

## **3. Using Node Selectors for Basic Scheduling**

Bob starts with **node selectors**, the simplest way to assign pods to specific nodes.

- **Labeling Nodes**:
  - Bob labels a node for frontend workloads:

    ```bash
    kubectl label nodes <node-name> role=frontend
    ```

- **Applying a Node Selector**:
  - He updates his frontend deployment:

    ```yaml
    spec:
      template:
        spec:
          nodeSelector:
            role: frontend
    ```

- **Verifying Placement**:

  ```bash
  kubectl get pods -o wide
  ```

  Bob sees the frontend pods running only on the labeled node.

> *“Node selectors make it easy to assign workloads to specific nodes!”* Bob says.

---

## **4. Fine-Tuning Placement with Node Affinities**

Next, Bob explores **node affinities** for more flexible placement rules.

- **Creating a Node Affinity Rule**:
  - Bob adds a preferred rule to deploy pods on nodes labeled `role=frontend`:

    ```yaml
    affinity:
      nodeAffinity:
        preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 1
          preference:
            matchExpressions:
            - key: role
              operator: In
              values:
              - frontend
    ```

- **Testing the Affinity Rule**:
  - Bob deploys the workload and verifies it prefers the frontend node but can run elsewhere if needed.

> *“Node affinities give me both control and flexibility!”* Bob notes, impressed.

---

## **5. Restricting Nodes with Taints and Tolerations**

Bob discovers **taints** and **tolerations**, which allow him to reserve nodes for specific workloads.

- **Adding a Taint to a Node**:
  - Bob taints a node to restrict it to critical workloads:

    ```bash
    kubectl taint nodes <node-name> key=critical:NoSchedule
    ```

- **Adding a Toleration to a Pod**:
  - He updates his critical workload deployment:

    ```yaml
    spec:
      tolerations:
      - key: "key"
        operator: "Equal"
        value: "critical"
        effect: "NoSchedule"
    ```

- **Verifying Behavior**:
  - Bob tries to deploy non-critical workloads to the tainted node and confirms they’re blocked.

> *“Taints and tolerations ensure only the right workloads run on sensitive nodes!”* Bob says, satisfied with the setup.

---

## **6. Managing Resource Quotas**

To prevent overloading the cluster, Bob sets **resource quotas** to limit resource usage per namespace.

- **Creating a Resource Quota**:
  - Bob writes `resource-quota.yaml` for his `frontend` namespace:

    ```yaml
    apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: frontend-quota
      namespace: frontend
    spec:
      hard:
        pods: "10"
        requests.cpu: "4"
        requests.memory: "8Gi"
        limits.cpu: "8"
        limits.memory: "16Gi"
    ```

- **Applying the Quota**:

  ```bash
  kubectl apply -f resource-quota.yaml
  ```

- **Testing the Quota**:
  - Bob tries to exceed the quota by deploying additional pods and receives an error.

> *“Resource quotas keep workloads within safe limits!”* Bob says, appreciating the safeguard.

---

## **7. Implementing Pod Priority and Preemption**

Bob ensures critical workloads are prioritized during resource contention.

- **Defining Priority Classes**:
  - Bob writes `priority-class.yaml`:

    ```yaml
    apiVersion: scheduling.k8s.io/v1
    kind: PriorityClass
    metadata:
      name: high-priority
    value: 1000
    globalDefault: false
    description: "High-priority workloads"
    ```

- **Applying the Priority Class**:

  ```bash
  kubectl apply -f priority-class.yaml
  ```

- **Assigning Priority to Pods**:
  - Bob updates his critical workload deployment:

    ```yaml
    spec:
      priorityClassName: high-priority
    ```

- **Testing Preemption**:
  - Bob deploys low-priority pods, then high-priority pods, and confirms the scheduler evicts low-priority pods to make room.

> *“Priority classes ensure critical workloads always have resources!”* Bob says, impressed by the feature.

---

## **8. Scheduling DaemonSets for Cluster-Wide Tasks**

Bob explores **DaemonSets**, which run a pod on every node in the cluster.

- **Creating a DaemonSet**:
  - Bob writes `log-collector-daemonset.yaml`:

    ```yaml
    apiVersion: apps/v1
    kind: DaemonSet
    metadata:
      name: log-collector
    spec:
      selector:
        matchLabels:
          name: log-collector
      template:
        metadata:
          labels:
            name: log-collector
        spec:
          containers:
          - name: log-collector
            image: fluentd
    ```

- **Deploying the DaemonSet**:

  ```bash
  kubectl apply -f log-collector-daemonset.yaml
  ```

- **Verifying Pods**:

  ```bash
  kubectl get pods -o wide
  ```

  Bob sees a pod running on every node.

> *“DaemonSets make it easy to deploy cluster-wide services!”* Bob says.

---

## **9. Automating Scheduling Policies with Scheduler Profiles**

To customize the scheduling process further, Bob explores **scheduler profiles**.

- **Creating a Custom Scheduler Configuration**:
  - Bob writes a custom `scheduler-config.yaml`:

    ```yaml
    apiVersion: kubescheduler.config.k8s.io/v1beta1
    kind: KubeSchedulerConfiguration
    profiles:
    - schedulerName: custom-scheduler
      plugins:
        score:
          enabled:
          - name: NodeResourcesFit
          weight: 2
    ```

- **Applying the Custom Scheduler**:
  - Bob passes the configuration to the kube-scheduler.

> *“Scheduler profiles give me total control over how workloads are placed!”* Bob says, excited by the possibilities.

---

## **10. Conclusion: Bob Masters Kubernetes Scheduling**

With node selectors, affinities, taints, tolerations, and advanced scheduling tools, Bob has fine-tuned workload placement in his cluster. His Kubernetes setup is now efficient, resilient, and ready for any challenge.

> Next, Bob plans to explore **multi-cluster Kubernetes management**, learning how to manage workloads across multiple clusters.

*Stay tuned for the next chapter: "Bob Ventures into Multi-Cluster Kubernetes Management!"*
