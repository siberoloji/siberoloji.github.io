---
title: Bob Secures Data with Encryption in Kubernetes on AlmaLinux
linkTitle: Secure Data with Encryption in Kubernetes
description: Bob will learn how to protect sensitive information by using encryption for data at rest and in transit, as well as securely managing secrets in Kubernetes.
date: 2024-11-20
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 400
toc: true
keywords:
  - Data with Encryption in Kubernetes
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-secures-data-encryption-kubernetes-alma-linux
---
Let’s dive into Chapter 40, *"Bob Secures Data with Encryption in Kubernetes!"*. In this chapter, Bob will learn how to protect sensitive information by using encryption for data at rest and in transit, as well as securely managing secrets in Kubernetes.

---

## **1. Introduction: Why Data Encryption Matters**

Bob’s manager emphasizes the importance of securing sensitive data, such as credentials, API keys, and user information. Bob’s task is to ensure all data in the Kubernetes cluster is encrypted, whether stored on disks or transmitted over the network.

> *“Encryption is my shield against data breaches—time to deploy it everywhere!”* Bob says, diving into the challenge.

---

## **2. Enabling Data Encryption at Rest**

Bob starts by enabling encryption for data stored in etcd, Kubernetes’ key-value store.

- **Configuring etcd Encryption**:
  - Bob edits the API server configuration to enable encryption:

    ```yaml
    --encryption-provider-config=/etc/kubernetes/encryption-config.yaml
    ```

  - He creates the `encryption-config.yaml` file:

    ```yaml
    apiVersion: apiserver.config.k8s.io/v1
    kind: EncryptionConfiguration
    resources:
    - resources:
      - secrets
      providers:
      - aescbc:
          keys:
          - name: key1
            secret: <base64-encoded-key>
      - identity: {}
    ```

  - Bob restarts the API server to apply the changes:

    ```bash
    systemctl restart kube-apiserver
    ```

- **Verifying Encryption**:
  - Bob checks that sensitive data in etcd is now encrypted:

    ```bash
    etcdctl get /registry/secrets/default/my-secret --print-value-only
    ```

> *“Now my secrets in etcd are safe from prying eyes!”* Bob says, feeling secure.

---

## **3. Encrypting Persistent Volumes**

Bob ensures data stored on persistent volumes is encrypted.

- **Using Encrypted Storage Classes**:
  - Bob configures an encrypted EBS volume on AWS:

    ```yaml
    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
      name: encrypted-ebs
    provisioner: kubernetes.io/aws-ebs
    parameters:
      type: gp2
      encrypted: "true"
    ```

  - He creates a PersistentVolumeClaim using the storage class:

    ```yaml
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: encrypted-pvc
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 10Gi
      storageClassName: encrypted-ebs
    ```

> *“With encrypted volumes, sensitive data is secure even at rest!”* Bob says.

---

## **4. Encrypting Data in Transit**

Bob configures encryption for all data transmitted between Kubernetes components and applications.

- **Enabling TLS for the API Server**:
  - Bob generates a TLS certificate for the API server:

    ```bash
    openssl genrsa -out apiserver.key 2048
    openssl req -new -key apiserver.key -out apiserver.csr
    openssl x509 -req -in apiserver.csr -signkey apiserver.key -out apiserver.crt
    ```

  - He updates the API server configuration:

    ```bash
    --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
    --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
    ```

- **Securing Pod Communication**:
  - Bob enables **mutual TLS (mTLS)** for service-to-service communication using Istio:

    ```yaml
    apiVersion: security.istio.io/v1beta1
    kind: PeerAuthentication
    metadata:
      name: default
      namespace: default
    spec:
      mtls:
        mode: STRICT
    ```

> *“With TLS and mTLS, my data is encrypted as it travels!”* Bob says, reassured.

---

## **5. Managing Kubernetes Secrets Securely**

Bob revisits how secrets are stored and accessed in Kubernetes.

- **Storing Secrets in Kubernetes**:
  - Bob creates a secret for database credentials:

    ```bash
    kubectl create secret generic db-credentials --from-literal=username=admin --from-literal=password=secret123
    ```

- **Using Secrets in Deployments**:
  - Bob mounts the secret in a deployment:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: my-app
    spec:
      containers:
      - name: app-container
        image: my-app:latest
        env:
        - name: DB_USERNAME
          valueFrom:
            secretKeyRef:
              name: db-credentials
              key: username
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-credentials
              key: password
    ```

> *“Secrets management is simple and secure!”* Bob says.

---

## **6. Introducing External Secret Managers**

To enhance security, Bob integrates Kubernetes with an external secret manager.

- **Using HashiCorp Vault**:
  - Bob deploys Vault on Kubernetes:

    ```bash
    helm repo add hashicorp https://helm.releases.hashicorp.com
    helm install vault hashicorp/vault --namespace vault --create-namespace
    ```

  - He configures Vault to sync secrets with Kubernetes:

    ```yaml
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: vault-agent-config
    data:
      vault-agent-config.hcl: |
        auto_auth {
          method "kubernetes" {
            mount_path = "auth/kubernetes"
            config = {
              role = "my-role"
            }
          }
        }
        sink "file" {
          config = {
            path = "/etc/secrets"
          }
        }
    ```

- **Accessing Secrets from Vault**:
  - Bob modifies his app to read secrets from Vault’s sync path.

> *“External managers like Vault add an extra layer of security!”* Bob says.

---

## **7. Encrypting Application Data**

Bob ensures that application-level encryption is also in place.

- **Encrypting with Libraries**:
  - Bob modifies his Python app to encrypt sensitive data using Fernet:

    ```python
    from cryptography.fernet import Fernet

    key = Fernet.generate_key()
    cipher_suite = Fernet(key)
    encrypted_data = cipher_suite.encrypt(b"Sensitive Data")
    ```

- **Storing Encryption Keys Securely**:
  - He stores the encryption keys in Vault or AWS KMS.

> *“Encrypting at the application level adds another layer of protection!”* Bob says.

---

## **8. Auditing Encryption Practices**

Bob uses tools to verify that encryption is properly implemented.

- **Running Kubeaudit**:
  - Bob checks for insecure configurations:

    ```bash
    kubeaudit all
    ```

- **Enabling Logging**:
  - He configures Kubernetes audit logs to track access to sensitive data.

> *“Auditing ensures I don’t miss any weak spots!”* Bob notes.

---

## **9. Planning for Key Rotation**

Bob implements key rotation policies for long-term security.

- **Rotating Encryption Keys**:
  - Bob schedules key rotation in Vault:

    ```bash
    vault write sys/rotate
    ```

- **Updating Kubernetes Secrets**:
  - He automates secret updates using a CI/CD pipeline.

> *“Regular key rotation keeps my cluster secure over time!”* Bob says.

---

## **10. Conclusion: Bob’s Encryption Expertise**

With etcd encryption, TLS, secure secrets management, and external tools like Vault, Bob has created a Kubernetes environment where data is fully protected. His cluster is now safe from unauthorized access and breaches.

> Next, Bob plans to explore **event-driven architecture in Kubernetes**, using tools like Kafka and Knative Eventing.

*Stay tuned for the next chapter: "Bob Builds Event-Driven Architecture in Kubernetes!"*
