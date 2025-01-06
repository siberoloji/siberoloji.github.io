---
title: Bob Masters Kubernetes Networking
linkTitle: Kubernetes Networking
description: Bob will dive into Kubernetes networking concepts, enabling him to create secure and efficient communication between applications in his cluster.
date: 2024-11-16
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 260

keywords:
  - Kubernetes Networking on AlmaLinux

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-masters-kubernetes-networking-ailma-linux
---
Let’s move on to Chapter 26, *"Bob Masters Kubernetes Networking!"*. In this chapter, Bob will dive into Kubernetes networking concepts, including **services**, **ingress controllers**, and **network policies**, enabling him to create secure and efficient communication between applications in his cluster.

---

## **1. Introduction: Networking Challenges in Kubernetes**

Bob’s Kubernetes setup is coming together, but he notices some networking quirks. How do pods communicate securely? How can users access his apps from outside the cluster? And how can he control traffic between services? Today, Bob tackles these questions by mastering Kubernetes networking.

> *“Networking is the glue that holds my cluster together—time to make it work seamlessly!”* Bob says, ready to learn.

---

## **2. Understanding Kubernetes Networking Basics**

Bob starts with an overview of Kubernetes networking:

- **Cluster Networking**:
  - Every pod gets its own unique IP address, allowing direct communication.
  - Kubernetes handles the routing automatically—no NAT required between pods.

- **Types of Services**:
  - **ClusterIP**: Default type, makes a service accessible only within the cluster.
  - **NodePort**: Exposes a service on a static port on each node.
  - **LoadBalancer**: Integrates with cloud providers to expose services using a public IP.
  - **ExternalName**: Maps a service to an external DNS name.

> *“The ClusterIP service is great for internal traffic, but I’ll need NodePort or LoadBalancer for external access,”* Bob says, understanding the options.

---

## **3. Exposing Services with Ingress Controllers**

Bob learns that an **Ingress** resource allows him to route external HTTP and HTTPS traffic to services in his cluster.

- **Installing an Ingress Controller**:
  - Bob decides to use NGINX as his ingress controller and installs it:

    ```bash
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
    ```

- **Creating an Ingress Resource**:
  - Bob writes a YAML file, `nginx-ingress.yaml`, to expose his `frontend` service:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: frontend-ingress
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
    spec:
      rules:
      - host: frontend.local
        http:
          paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: frontend
                port:
                  number: 80
    ```

- **Testing the Ingress**:
  - Bob updates his `/etc/hosts` file to point `frontend.local` to the cluster’s external IP:

    ```bash
    <external-ip> frontend.local
    ```

  - He accesses the app in his browser at `http://frontend.local`.

> *“The Ingress controller simplifies routing external traffic!”* Bob says, impressed by the clean URLs.

---

## **4. Configuring Network Policies for Security**

To secure traffic between pods, Bob explores **Network Policies**.

- **Default Behavior**:
  - By default, Kubernetes allows all pods to communicate with each other.

- **Creating a Network Policy**:
  - Bob writes a YAML file, `frontend-network-policy.yaml`, to restrict access to the `frontend` pod:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: frontend-policy
      namespace: default
    spec:
      podSelector:
        matchLabels:
          app: frontend
      policyTypes:
      - Ingress
      - Egress
      ingress:
      - from:
        - podSelector:
            matchLabels:
              app: backend
      egress:
      - to:
        - podSelector:
            matchLabels:
              app: backend
    ```

- **Applying the Policy**:

  ```bash
  kubectl apply -f frontend-network-policy.yaml
  ```

- **Testing the Policy**:
  - Bob verifies that only pods with the label `app: backend` can communicate with `frontend`.

> *“Now my services are secure, with traffic flowing only where it’s needed!”* Bob says, appreciating the control.

---

## **5. Load Balancing External Traffic with LoadBalancer Services**

In a cloud environment, Bob uses **LoadBalancer** services to handle external traffic automatically.

- **Creating a LoadBalancer Service**:
  - Bob writes `frontend-loadbalancer.yaml`:

    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: frontend-loadbalancer
    spec:
      type: LoadBalancer
      selector:
        app: frontend
      ports:
      - protocol: TCP
        port: 80
        targetPort: 80
    ```

- **Deploying the Service**:

  ```bash
  kubectl apply -f frontend-loadbalancer.yaml
  ```

- **Testing External Access**:
  - Bob retrieves the external IP of the LoadBalancer:

    ```bash
    kubectl get svc frontend-loadbalancer
    ```

  - He accesses the app using the provided IP address.

> *“The LoadBalancer service handles everything—no manual setup required!”* Bob says, enjoying the ease of use.

---

## **6. Monitoring Network Traffic**

To ensure everything runs smoothly, Bob sets up traffic monitoring.

- **Using `kubectl top` for Real-Time Metrics**:

  ```bash
  kubectl top pod
  kubectl top node
  ```

- **Visualizing Traffic with Grafana**:
  - Bob uses Prometheus and Grafana to monitor network traffic and latency between services.

> *“Real-time monitoring helps me catch issues before they escalate!”* Bob notes.

---

## **7. Advanced Routing with Path-Based Ingress**

Bob learns how to route traffic to multiple services using **path-based rules** in Ingress.

- **Creating a Multi-Path Ingress**:
  - Bob writes `multi-path-ingress.yaml`:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: multi-path-ingress
    spec:
      rules:
      - host: app.local
        http:
          paths:
          - path: /frontend
            pathType: Prefix
            backend:
              service:
                name: frontend
                port:
                  number: 80
          - path: /backend
            pathType: Prefix
            backend:
              service:
                name: backend
                port:
                  number: 80
    ```

- **Testing Multi-Path Routing**:
  - Bob updates his `/etc/hosts` file to point `app.local` to the cluster’s external IP.
  - He accesses `http://app.local/frontend` and `http://app.local/backend` to verify the routing.

> *“Path-based routing gives me granular control over traffic!”* Bob says, impressed by the flexibility.

---

## **8. Troubleshooting Networking Issues**

Bob encounters some networking hiccups and uses these tools to debug:

- **`kubectl describe` for Service Details**:

  ```bash
  kubectl describe svc frontend-loadbalancer
  ```

- **`kubectl logs` for Pod Logs**:

  ```bash
  kubectl logs <pod-name>
  ```

- **`kubectl exec` for Debugging Inside Pods**:

  ```bash
  kubectl exec -it <pod-name> -- sh
  ping backend
  ```

> *“These debugging tools make it easy to pinpoint and fix issues!”* Bob says, relieved.

---

## **9. Conclusion: Bob’s Networking Success**

With Ingress controllers, Network Policies, and LoadBalancer services, Bob has transformed his Kubernetes networking skills. His cluster is now secure, efficient, and accessible, ready to handle any workload.

> Next, Bob plans to explore **observability in Kubernetes**, diving into logging, metrics, and tracing to gain complete visibility into his applications.

*Stay tuned for the next chapter: "Bob Gains Observability in Kubernetes!"*
