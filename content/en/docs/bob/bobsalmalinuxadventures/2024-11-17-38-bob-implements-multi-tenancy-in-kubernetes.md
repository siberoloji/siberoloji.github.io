---
title: Bob Implements Multi-Tenancy in Kubernetes
linkTitle: Multi-Tenancy in Kubernetes
description: Bob will explore how to create a multi-tenant Kubernetes environment, isolating and managing workloads for different teams, departments, or customers securely and efficiently.
date: 2024-11-20
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 380

keywords:
  - Multi-Tenancy in Kubernetes

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-implements-multi-tenancy-kubernetes
---
Let’s dive into Chapter 38, *"Bob Implements Multi-Tenancy in Kubernetes!"*. In this chapter, Bob will explore how to create a multi-tenant Kubernetes environment, isolating and managing workloads for different teams, departments, or customers securely and efficiently.

---

## **1. Introduction: Why Multi-Tenancy?**

Bob’s Kubernetes cluster is growing, and different teams are now deploying their workloads. To prevent resource conflicts, security issues, and administrative headaches, Bob needs to implement multi-tenancy. This involves isolating workloads while maintaining shared infrastructure.

> *“Sharing resources doesn’t mean chaos—multi-tenancy will keep everyone happy and secure!”* Bob says, ready for the challenge.

---

## **2. Understanding Multi-Tenancy Models**

Bob learns about two key approaches to multi-tenancy:

- **Soft Multi-Tenancy**: Logical isolation using namespaces, RBAC, and Network Policies.
- **Hard Multi-Tenancy**: Physical isolation using separate clusters or node pools.

> *“Soft multi-tenancy is a good start, but hard multi-tenancy might be needed for critical workloads.”* Bob notes.

---

## **3. Setting Up Namespace Isolation**

Bob begins with **namespace-based isolation**, a fundamental building block for multi-tenancy.

- **Creating Namespaces**:
  - Bob creates namespaces for different teams:

    ```bash
    kubectl create namespace team-a
    kubectl create namespace team-b
    ```

- **Assigning Resource Quotas**:
  - He enforces resource limits per namespace:

    ```yaml
    apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: team-a-quota
      namespace: team-a
    spec:
      hard:
        pods: "10"
        requests.cpu: "5"
        requests.memory: "10Gi"
    ```

    ```bash
    kubectl apply -f team-a-quota.yaml
    ```

> *“Namespaces are like sandboxes for teams—clean and isolated!”* Bob says.

---

## **4. Configuring Role-Based Access Control (RBAC)**

Bob ensures each team has access only to their own namespace.

- **Creating Roles**:
  - Bob defines roles for developers:

    ```yaml
    apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      namespace: team-a
      name: developer
    rules:
    - apiGroups: [""]
      resources: ["pods", "services"]
      verbs: ["get", "list", "create", "delete"]
    ```

- **Binding Roles to Users**:
  - Bob assigns roles to team members:

    ```yaml
    apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      namespace: team-a
      name: developer-binding
    subjects:
    - kind: User
      name: alice
      apiGroup: ""
    roleRef:
      kind: Role
      name: developer
      apiGroup: ""
    ```

> *“RBAC ensures everyone stays in their lane—no accidental cross-namespace meddling!”* Bob says, satisfied.

---

## **5. Implementing Network Policies**

Bob enforces network isolation between namespaces to prevent unauthorized communication.

- **Creating a Network Policy**:
  - Bob writes a policy to allow ingress only from specific namespaces:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: allow-team-a
      namespace: team-a
    spec:
      podSelector:
        matchLabels: {}
      ingress:
      - from:
        - namespaceSelector:
            matchLabels:
              name: team-a
    ```

    ```bash
    kubectl apply -f team-a-network-policy.yaml
    ```

> *“With network policies, I’ve built virtual walls between tenants!”* Bob says.

---

## **6. Using LimitRanges for Resource Control**

Bob configures **LimitRanges** to enforce per-pod resource limits.

- **Defining Limits**:
  - Bob creates a `LimitRange` for team-a:

    ```yaml
    apiVersion: v1
    kind: LimitRange
    metadata:
      name: pod-limits
      namespace: team-a
    spec:
      limits:
      - type: Container
        defaultRequest:
          cpu: "500m"
          memory: "256Mi"
        default:
          cpu: "1"
          memory: "512Mi"
    ```

    ```bash
    kubectl apply -f pod-limits.yaml
    ```

> *“LimitRanges prevent any one pod from hogging resources!”* Bob says.

---

## **7. Exploring Hard Multi-Tenancy**

For workloads requiring stronger isolation, Bob configures **node pools** and dedicated clusters.

- **Assigning Node Pools**:
  - Bob uses node labels and taints to dedicate nodes to specific teams:

    ```bash
    kubectl label nodes node1 team=team-a
    kubectl taint nodes node1 team=team-a:NoSchedule
    ```

- **Node Affinity in Deployments**:
  - He modifies team-a deployments to target their dedicated nodes:

    ```yaml
    spec:
      template:
        spec:
          affinity:
            nodeAffinity:
              requiredDuringSchedulingIgnoredDuringExecution:
                nodeSelectorTerms:
                - matchExpressions:
                  - key: team
                    operator: In
                    values:
                    - team-a
    ```

> *“Dedicated nodes provide the ultimate isolation for critical workloads!”* Bob notes.

---

## **8. Monitoring Tenants**

Bob integrates monitoring tools to track resource usage by namespace.

- **Using Prometheus and Grafana**:
  - Bob creates dashboards to visualize CPU, memory, and storage usage by team.

- **Enabling Alerts**:
  - He sets up alerts for quota breaches or abnormal activity:

    ```yaml
    groups:
    - name: tenant-alerts
      rules:
      - alert: HighNamespaceUsage
        expr: namespace:container_memory_usage_bytes:sum{namespace="team-a"} > 8Gi
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "High memory usage in team-a namespace"
    ```

> *“Real-time monitoring keeps tenants in check and resources balanced!”* Bob says.

---

## **9. Automating Multi-Tenancy with Operators**

Bob uses **operators** to simplify multi-tenant management.

- **Installing the Capsule Operator**:
  - Bob deploys Capsule, a multi-tenancy operator:

    ```bash
    helm repo add clastix https://clastix.github.io/charts
    helm install capsule clastix/capsule --namespace capsule-system
    ```

- **Defining Tenants**:
  - He creates a tenant resource for team-a:

    ```yaml
    apiVersion: capsule.clastix.io/v1alpha1
    kind: Tenant
    metadata:
      name: team-a
    spec:
      owners:
      - kind: User
        name: alice
      namespaceQuota: 5
    ```

> *“Operators automate tenant lifecycle management beautifully!”* Bob says.

---

## **10. Conclusion: Bob’s Multi-Tenant Masterpiece**

With namespaces, RBAC, network policies, and dedicated nodes, Bob has built a secure and efficient multi-tenant Kubernetes environment. Teams can work independently, securely, and without interference, making his cluster a model of shared infrastructure.

> Next, Bob plans to explore **Kubernetes for Edge AI Workloads**, learning how to deploy and manage machine learning applications at the edge.

*Stay tuned for the next chapter: "Bob Deploys Edge AI Workloads with Kubernetes!"*
