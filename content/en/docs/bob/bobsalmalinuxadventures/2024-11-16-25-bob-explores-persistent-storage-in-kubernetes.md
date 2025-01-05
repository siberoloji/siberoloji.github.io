---
title: Bob Explores Persistent Storage in Kubernetes
linkTitle: Persistent Storage
description: Bob will learn how to handle persistent storage for stateful applications in Kubernetes, ensuring that data remains intact
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 250
toc: true
keywords:
  - Persistent Storage in Kubernetes on AlmaLinux
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-explores-persistent-storage-kubernetes-alma-linux
---
Let’s move on to Chapter 25, *"Bob Explores Persistent Storage in Kubernetes!"*. In this chapter, Bob will learn how to handle persistent storage for stateful applications in Kubernetes, ensuring that data remains intact even when containers are restarted or redeployed.

---

## **1. Introduction: Persistent Storage Needs**

Bob has successfully deployed Kubernetes applications, but he notices that his setups lose all data whenever a container restarts. To fix this, he needs to learn about **persistent storage** in Kubernetes, which allows pods to store data that survives beyond the lifecycle of a single container.

> *“It’s time to make sure my data sticks around, no matter what happens!”* Bob says, ready to explore persistent storage options.

---

## **2. Understanding Kubernetes Storage Concepts**

Before diving in, Bob familiarizes himself with key Kubernetes storage terms:

- **Persistent Volume (PV)**: A piece of storage provisioned in the cluster, like a hard disk.
- **Persistent Volume Claim (PVC)**: A request for storage by a pod.
- **StorageClass**: A way to dynamically provision storage using cloud-based or on-premises storage backends.

> *“So a PVC is like a ticket, and a PV is the seat I claim on the storage train!”* Bob summarizes.

---

## **3. Creating a Persistent Volume**

Bob starts by creating a **Persistent Volume** (PV) to provide storage to his pods.

- **Writing a PV Configuration**:
  - Bob writes a YAML file, `pv-local.yaml`, to create a local PV:

    ```yaml
    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: local-pv
    spec:
      capacity:
        storage: 1Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /mnt/data
    ```

- **Applying the PV**:

  ```bash
  kubectl apply -f pv-local.yaml
  ```

- **Verifying the PV**:

  ```bash
  kubectl get pv
  ```

> *“I’ve got a storage pool ready to go!”* Bob says, pleased with his first PV.

---

## **4. Creating a Persistent Volume Claim**

Next, Bob creates a **Persistent Volume Claim (PVC)** to request storage from his PV.

- **Writing a PVC Configuration**:
  - Bob writes a YAML file, `pvc-local.yaml`:

    ```yaml
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: local-pvc
    spec:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 500Mi
    ```

- **Applying the PVC**:

  ```bash
  kubectl apply -f pvc-local.yaml
  ```

- **Checking the PVC Status**:
  - Bob confirms the PVC has been bound to the PV:

    ```bash
    kubectl get pvc
    ```

> *“My claim has been granted—time to attach it to a pod!”* Bob says, excited.

---

## **5. Using Persistent Storage in a Pod**

Bob connects the PVC to a pod so his application can use the storage.

- **Writing a Pod Configuration**:
  - Bob creates `nginx-pv-pod.yaml` to use the PVC:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx-pv-pod
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: storage-volume
      volumes:
      - name: storage-volume
        persistentVolumeClaim:
          claimName: local-pvc
    ```

- **Deploying the Pod**:

  ```bash
  kubectl apply -f nginx-pv-pod.yaml
  ```

- **Testing the Persistent Volume**:
  - Bob creates a test file in the pod:

    ```bash
    kubectl exec nginx-pv-pod -- sh -c "echo 'Hello, Kubernetes!' > /usr/share/nginx/html/index.html"
    ```

  - After restarting the pod, he confirms the file is still there:

    ```bash
    kubectl exec nginx-pv-pod -- cat /usr/share/nginx/html/index.html
    ```

> *“The data survived the pod restart—persistent storage is working!”* Bob says, feeling accomplished.

---

## **6. Dynamic Storage Provisioning with StorageClass**

To simplify storage management, Bob explores **dynamic provisioning** with `StorageClass`.

- **Creating a StorageClass**:
  - Bob writes a YAML file, `storage-class.yaml`:

    ```yaml
    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
      name: standard
    provisioner: kubernetes.io/aws-ebs
    parameters:
      type: gp2
    ```

- **Using the StorageClass**:
  - Bob modifies his PVC to use the `standard` StorageClass:

    ```yaml
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: dynamic-pvc
    spec:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi
      storageClassName: standard
    ```

- **Deploying the PVC**:

  ```bash
  kubectl apply -f dynamic-pvc.yaml
  ```

> *“Dynamic provisioning takes care of storage for me—this is so convenient!”* Bob says, appreciating the simplicity.

---

## **7. Exploring StatefulSets for Stateful Applications**

Bob discovers that **StatefulSets** are designed for applications requiring persistent storage, like databases.

- **Deploying a MySQL StatefulSet**:
  - Bob writes a StatefulSet YAML file, `mysql-statefulset.yaml`:

    ```yaml
    apiVersion: apps/v1
    kind: StatefulSet
    metadata:
      name: mysql
    spec:
      selector:
        matchLabels:
          app: mysql
      serviceName: "mysql"
      replicas: 1
      template:
        metadata:
          labels:
            app: mysql
        spec:
          containers:
          - name: mysql
            image: mysql:5.7
            env:
            - name: MYSQL_ROOT_PASSWORD
              value: rootpassword
            volumeMounts:
            - name: mysql-persistent-storage
              mountPath: /var/lib/mysql
      volumeClaimTemplates:
      - metadata:
          name: mysql-persistent-storage
        spec:
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 1Gi
    ```

- **Deploying the StatefulSet**:

  ```bash
  kubectl apply -f mysql-statefulset.yaml
  ```

- **Verifying Persistent Storage**:
  - Bob confirms the MySQL data persists even after restarting the pod.

> *“StatefulSets make managing databases in Kubernetes so much easier!”* Bob says, impressed by the functionality.

---

## **8. Backing Up Persistent Volumes**

Bob ensures his persistent volumes are backed up regularly.

- **Snapshotting Persistent Volumes**:
  - In AWS, Bob uses **EBS Snapshots** to back up his storage dynamically.
  - On-premises, he uses `rsync` to back up data directories:

    ```bash
    rsync -av /mnt/data /backups/
    ```

> *“With backups in place, I’m covered for any storage failure!”* Bob says, feeling secure.

---

## **9. Monitoring Storage Usage**

Bob monitors storage usage to avoid running out of space.

- **Using Kubernetes Metrics**:

  ```bash
  kubectl top pod
  kubectl top pvc
  ```

- **Visualizing with Grafana**:
  - Bob integrates Prometheus and Grafana to track PVC utilization over time.

> *“Real-time metrics help me stay ahead of storage issues!”* Bob says.

---

## **10. Conclusion: Bob’s Persistent Storage Expertise**

With persistent volumes, dynamic provisioning, StatefulSets, and backups in place, Bob has mastered Kubernetes storage. He feels confident managing stateful applications and ensuring data safety in his cluster.

> Next, Bob plans to dive into **advanced networking in Kubernetes**, tackling topics like ingress controllers and network policies.

*Stay tuned for the next chapter: "Bob Masters Kubernetes Networking!"*
