---
title: Bob Integrates Kubernetes with CI/CD Workflows on AlmaLinux
linkTitle: Kubernetes with CI/CD Workflows
description: Bob will explore how to leverage Kubernetes for automating Continuous Integration and Continuous Deployment (CI/CD) pipelines, enabling faster and more reliable software delivery.
date: 2024-11-19
draft: false
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
weight: 360
toc: true
keywords:
  - Kubernetes with CI/CD Workflows
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-integrates-kubernetes-ci-cd-workflows-alma-linux
---
Let’s dive into Chapter 36, *"Bob Integrates Kubernetes with CI/CD Workflows!"*. In this chapter, Bob will explore how to leverage Kubernetes for automating Continuous Integration and Continuous Deployment (CI/CD) pipelines, enabling faster and more reliable software delivery.

---

## **1. Introduction: Why CI/CD in Kubernetes?**

Bob’s team wants to streamline their development process by deploying updates faster and with fewer errors. CI/CD pipelines automate testing, building, and deploying code, and Kubernetes provides the perfect environment for scalable and reliable deployments.

> *“Automated pipelines mean less manual work and faster deployments—let’s make it happen!”* Bob says, excited to get started.

---

## **2. Setting Up Jenkins on Kubernetes**

Bob starts with **Jenkins**, a popular CI/CD tool.

- **Deploying Jenkins**:
  - Bob uses Helm to deploy Jenkins on Kubernetes:

    ```bash
    helm repo add jenkins https://charts.jenkins.io
    helm install jenkins jenkins/jenkins --namespace jenkins --create-namespace
    ```

- **Accessing Jenkins**:
  - Bob retrieves the admin password:

    ```bash
    kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password
    ```

  - He accesses Jenkins in his browser.

> *“Jenkins is up and running—time to build some pipelines!”* Bob says.

---

## **3. Building a CI Pipeline**

Bob creates a pipeline to test and build his application.

- **Writing a Jenkinsfile**:
  - Bob creates a simple CI pipeline:

    ```groovy
    pipeline {
        agent any
        stages {
            stage('Checkout') {
                steps {
                    git 'https://github.com/bob-app/sample-repo.git'
                }
            }
            stage('Build') {
                steps {
                    sh 'docker build -t my-app:latest .'
                }
            }
            stage('Test') {
                steps {
                    sh 'docker run --rm my-app:latest pytest'
                }
            }
        }
    }
    ```

- **Running the Pipeline**:
  - Bob commits the `Jenkinsfile` to his repo, and Jenkins automatically picks it up to run the pipeline.

> *“With every commit, my pipeline builds and tests the app—so smooth!”* Bob says, impressed.

---

## **4. Deploying with Continuous Deployment**

Bob extends the pipeline to deploy his app to Kubernetes.

- **Adding a Deployment Stage**:
  - Bob updates the `Jenkinsfile`:

    ```groovy
    pipeline {
        agent any
        stages {
            // Previous stages...
            stage('Deploy') {
                steps {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh 'kubectl apply -f k8s/deployment.yaml'
                    }
                }
            }
        }
    }
    ```

- **Verifying Deployment**:
  - After a successful build, Jenkins deploys the app to his Kubernetes cluster:

    ```bash
    kubectl get pods
    ```

> *“Now every code change goes live automatically after passing tests—this is a game-changer!”* Bob says.

---

## **5. Exploring GitOps with ArgoCD**

Bob hears about **GitOps**, where Kubernetes deployments are managed through Git repositories.

- **Installing ArgoCD**:

  ```bash
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```

- **Connecting to a Git Repository**:
  - Bob creates an ArgoCD application pointing to his Git repo:

    ```yaml
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: my-app
      namespace: argocd
    spec:
      source:
        repoURL: 'https://github.com/bob-app/sample-repo.git'
        path: 'k8s'
        targetRevision: HEAD
      destination:
        server: 'https://kubernetes.default.svc'
        namespace: default
    ```

- **Automatic Synchronization**:
  - Bob enables auto-sync, so ArgoCD applies any changes in the Git repo to the cluster.

> *“GitOps keeps everything in sync and easy to manage!”* Bob says, loving the simplicity.

---

## **6. Adding Security Scans to CI/CD Pipelines**

Bob integrates security scans to catch vulnerabilities early.

- **Adding Docker Image Scanning**:
  - Bob uses **Trivy** to scan for vulnerabilities:

    ```bash
    stage('Scan') {
        steps {
            sh 'trivy image my-app:latest'
        }
    }
    ```

- **Checking Kubernetes Configurations**:
  - Bob uses **kubeaudit** to check for insecure configurations:

    ```bash
    stage('Kubernetes Audit') {
        steps {
            sh 'kubeaudit all'
        }
    }
    ```

> *“Security baked into the pipeline means fewer surprises in production!”* Bob says.

---

## **7. Implementing Rollbacks with Helm**

Bob adds rollback functionality to handle failed deployments.

- **Deploying with Helm**:
  - Bob uses Helm in the deployment stage:

    ```groovy
    stage('Deploy') {
        steps {
            sh 'helm upgrade --install my-app ./helm-chart'
        }
    }
    ```

- **Enabling Rollbacks**:
  - In case of failure, Bob uses Helm to roll back:

    ```bash
    helm rollback my-app
    ```

> *“Rollbacks give me peace of mind during deployments!”* Bob says, relieved.

---

## **8. Monitoring CI/CD Pipelines**

Bob integrates monitoring tools to track pipeline performance.

- **Using Prometheus and Grafana**:
  - Bob collects metrics from Jenkins and ArgoCD for analysis.
- **Adding Alerts**:
  - He sets up alerts for failed builds or deployments:

    ```bash
    curl -X POST -H "Content-Type: application/json" \
      -d '{"text":"Build failed!"}' https://hooks.slack.com/services/...
    ```

> *“Monitoring keeps me on top of pipeline issues!”* Bob says.

---

## **9. Scaling CI/CD with Tekton**

Bob explores **Tekton**, a Kubernetes-native CI/CD solution.

- **Installing Tekton Pipelines**:

  ```bash
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
  ```

- **Creating a Tekton Pipeline**:
  - Bob writes a `Pipeline` YAML for building and deploying his app:

    ```yaml
    apiVersion: tekton.dev/v1beta1
    kind: Pipeline
    metadata:
      name: build-and-deploy
    spec:
      tasks:
      - name: build
        taskRef:
          name: build-task
      - name: deploy
        taskRef:
          name: deploy-task
        runAfter:
        - build
    ```

- **Running the Pipeline**:

  ```bash
  tkn pipeline start build-and-deploy
  ```

> *“Tekton’s Kubernetes-native design makes it perfect for scaling CI/CD!”* Bob says.

---

## **10. Conclusion: Bob’s CI/CD Revolution**

With Jenkins, ArgoCD, and Tekton, Bob has transformed his CI/CD workflows. His team can now deliver updates faster, with better security, and less manual effort.

> Next, Bob plans to explore **Kubernetes for Big Data and Analytics**, leveraging tools like Apache Spark and Hadoop for scalable data processing.

*Stay tuned for the next chapter: "Bob Explores Kubernetes for Big Data and Analytics!"*
