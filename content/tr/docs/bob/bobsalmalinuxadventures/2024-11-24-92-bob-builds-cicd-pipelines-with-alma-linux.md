---
draft: false
title: Bob Builds CI/CD Pipelines with AlmaLinux
linkTitle: CI/CD Pipelines
keywords:
  - CI/CD
description: Automate the software delivery lifecycle by building a Continuous Integration/Continuous Deployment (CI/CD) pipeline on AlmaLinux.
date: 2024-12-12
url: bob-builds-ci-cd-pipelines-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 920
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to automate the software delivery lifecycle by building a **Continuous Integration/Continuous Deployment (CI/CD)** pipeline on AlmaLinux. With tools like Git, Jenkins, and Docker, he aimed to create a seamless pipeline for coding, testing, and deploying applications.

> *“CI/CD makes software delivery faster and error-free—let’s build one!”* Bob said, diving into automation.

---

### **Chapter Outline: "Bob Builds CI/CD Pipelines with AlmaLinux"**

1. **Introduction: What Is CI/CD?**
   - Overview of Continuous Integration and Continuous Deployment.
   - Benefits of CI/CD pipelines.

2. **Setting Up Git for Version Control**
   - Installing Git and setting up repositories.
   - Using Git hooks for automation.

3. **Installing Jenkins on AlmaLinux**
   - Setting up Jenkins.
   - Configuring Jenkins pipelines.

4. **Integrating Docker for Deployment**
   - Building containerized applications.
   - Automating deployments with Docker.

5. **Creating a Complete CI/CD Pipeline**
   - Configuring Jenkins to pull code from Git.
   - Automating tests and deployments.

6. **Scaling and Securing the Pipeline**
   - Adding nodes to Jenkins for scaling.
   - Securing the CI/CD pipeline.

7. **Conclusion: Bob Reflects on CI/CD Mastery**

---

### **Part 1: What Is CI/CD?**

Bob learned that **CI/CD pipelines** streamline the process of delivering software, ensuring high quality and fast deployment.

#### **Key Concepts**

- **Continuous Integration (CI)**: Automatically testing and integrating code changes into the main branch.
- **Continuous Deployment (CD)**: Automatically deploying tested code to production.

> *“CI/CD eliminates the pain of manual testing and deployments!”* Bob said.

---

### **Part 2: Setting Up Git for Version Control**

#### **Step 1: Installing Git**

- Install Git:

  ```bash
  sudo dnf install -y git
  ```

- Configure Git:

  ```bash
  git config --global user.name "Bob"
  git config --global user.email "bob@example.com"
  ```

#### **Step 2: Creating a Repository**

- Initialize a repository:

  ```bash
  mkdir my-app && cd my-app
  git init
  ```

- Add and commit files:

  ```bash
  echo "print('Hello, CI/CD')" > app.py
  git add app.py
  git commit -m "Initial commit"
  ```

#### **Step 3: Using Git Hooks**

Bob automated testing before each commit using Git hooks:

- Create a pre-commit hook:

  ```bash
  nano .git/hooks/pre-commit
  ```

- Add a basic linting script:

  ```bash
  #!/bin/bash
  python3 -m py_compile app.py
  ```

- Make it executable:

  ```bash
  chmod +x .git/hooks/pre-commit
  ```

> *“Git ensures version control and enforces good coding practices!”* Bob noted.

---

### **Part 3: Installing Jenkins on AlmaLinux**

#### **Step 1: Setting Up Jenkins**

- Install Jenkins:

  ```bash
  sudo dnf install -y java-11-openjdk
  sudo dnf install -y epel-release
  sudo dnf install -y jenkins
  ```

- Enable and start Jenkins:

  ```bash
  sudo systemctl enable jenkins --now
  ```

- Access Jenkins:

  ```plaintext
  http://<server-ip>:8080
  ```

#### **Step 2: Configuring Jenkins**

- Unlock Jenkins using the initial admin password:

  ```bash
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
  ```

- Install recommended plugins and create an admin user.

---

### **Part 4: Integrating Docker for Deployment**

#### **Step 1: Installing Docker**

- Install Docker:

  ```bash
  sudo dnf install -y docker
  ```

- Enable and start Docker:

  ```bash
  sudo systemctl enable docker --now
  ```

- Test Docker:

  ```bash
  sudo docker run hello-world
  ```

#### **Step 2: Building a Containerized Application**

- Create a `Dockerfile`:

  ```bash
  nano Dockerfile
  ```

  ```plaintext
  FROM python:3.8-slim
  COPY app.py /app/app.py
  CMD ["python3", "/app/app.py"]
  ```

- Build and run the container:

  ```bash
  sudo docker build -t my-app .
  sudo docker run my-app
  ```

> *“Containers make deployments consistent and portable!”* Bob said.

---

### **Part 5: Creating a Complete CI/CD Pipeline**

#### **Step 1: Configuring Jenkins to Pull Code from Git**

- Create a Jenkins job:
  1. Go to **New Item** and select **Pipeline**.
  2. Configure the Git repository under **Source Code Management**.

- Add a Jenkinsfile to the repository:

  ```bash
  nano Jenkinsfile
  ```

  ```plaintext
  pipeline {
      agent any
      stages {
          stage('Checkout') {
              steps {
                  checkout scm
              }
          }
          stage('Build') {
              steps {
                  sh 'docker build -t my-app .'
              }
          }
          stage('Test') {
              steps {
                  sh 'docker run --rm my-app'
              }
          }
          stage('Deploy') {
              steps {
                  sh 'docker run -d -p 8080:8080 my-app'
              }
          }
      }
  }
  ```

- Commit and push the Jenkinsfile:

  ```bash
  git add Jenkinsfile
  git commit -m "Add Jenkins pipeline"
  git push origin main
  ```

#### **Step 2: Automating Tests and Deployments**

- Trigger the Jenkins job:
  - Jenkins pulls the code, builds the Docker image, runs tests, and deploys the container.

> *“My pipeline is fully automated!”* Bob noted.

---

### **Part 6: Scaling and Securing the Pipeline**

#### **Step 1: Adding Jenkins Nodes**

- Add a new Jenkins node to distribute the workload:
  1. Go to **Manage Jenkins > Manage Nodes**.
  2. Add a new node and configure SSH credentials.

#### **Step 2: Securing the Pipeline**

- Install Jenkins security plugins:
  - **Role-Based Authorization Strategy** for user roles.
  - **OWASP Dependency-Check** for vulnerability scanning.

- Configure SSL for Jenkins:

  ```bash
  sudo certbot --nginx -d jenkins.example.com
  ```

> *“Scaling and securing the pipeline ensures reliability and safety!”* Bob said.

---

### **Conclusion: Bob Reflects on CI/CD Mastery**

Bob successfully built a CI/CD pipeline on AlmaLinux, integrating Git, Jenkins, and Docker for seamless coding, testing, and deployment. With scaling and security in place, he was ready to support robust development workflows.

> Next, Bob plans to explore **High-Performance Computing (HPC) with AlmaLinux**, tackling intensive workloads.
