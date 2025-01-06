---
title: Bob Explores Automated Deployment and Containerization with Docker on AlmaLinux
linkTitle: Containerization with Docker
description: Bob will set up Docker, learn about containerization, and deploy his first application container, making his AlmaLinux server even more versatile and efficient.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 160

keywords:
  - Containerization with Docker

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-explores-automated-deployment-containerization-docker-alma-linux
---

Let’s move into Chapter 16, *"Bob Explores Automated Deployment and Containerization with Docker"*. In this chapter, Bob will set up Docker, learn about containerization, and deploy his first application container, making his AlmaLinux server even more versatile and efficient.

---

## **1. Introduction: Bob’s Containerization Quest**

Bob’s latest assignment is to learn about **containerization** and **automated deployment**. His boss wants him to experiment with Docker to see if it could simplify app deployment and management on their AlmaLinux server. Bob is excited to dive into containers—a powerful way to package, distribute, and run applications in isolated environments.

> *“Let’s get Docker up and running, and see what all the container hype is about!”* Bob says, ready to take his deployment skills to the next level.

---

## **2. Installing Docker on AlmaLinux**

The first step is installing Docker, which isn’t available in AlmaLinux’s default repositories. Bob learns he’ll need to set up the Docker repository and install it from there.

- **Setting Up the Docker Repository**: Bob adds Docker’s official repository to AlmaLinux:

  ```bash
  sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
  ```

- **Installing Docker**: With the repository added, he installs Docker:

  ```bash
  sudo dnf install docker-ce docker-ce-cli containerd.io
  ```

- **Starting and Enabling Docker**: Bob starts Docker and enables it to run at boot:

  ```bash
  sudo systemctl start docker
  sudo systemctl enable docker
  ```

- **Checking Docker Version**: To confirm the installation, he checks Docker’s version:

  ```bash
  docker --version
  ```

> *“Docker is officially installed! Let’s see what it can do,”* Bob says, excited to move forward.

---

## **3. Running a Test Container**

To make sure Docker is working, Bob decides to run a simple **Hello World** container.

- **Pulling and Running the Container**: He uses Docker’s `run` command to pull and run the `hello-world` container:

  ```bash
  sudo docker run hello-world
  ```

  Docker automatically pulls the image, runs it, and displays a welcome message, confirming that everything is working.

> *“First container up and running—this is amazing!”* Bob says, thrilled by the simplicity of containers.

---

## **4. Understanding Docker Images and Containers**

Bob learns that **images** are the building blocks of containers. Images are like blueprints, defining everything needed to run a container, while **containers** are running instances of these images.

- **Listing Docker Images**: To view downloaded images, Bob uses:

  ```bash
  sudo docker images
  ```

- **Listing Running Containers**: To view active containers, he types:

  ```bash
  sudo docker ps
  ```

- **Viewing All Containers**: To see both active and inactive containers, he uses:

  ```bash
  sudo docker ps -a
  ```

> *“Docker makes it so easy to manage multiple environments with images and containers!”* Bob notes, seeing the power of containerization.

---

## **5. Pulling and Running a Web Application Container**

Now that he’s comfortable with Docker basics, Bob wants to deploy a more practical application. He decides to pull a **Nginx** image to set up a simple web server container.

- **Pulling the Nginx Image**: Bob pulls the latest Nginx image from Docker Hub:

  ```bash
  sudo docker pull nginx
  ```

- **Running the Nginx Container**: He starts the container, mapping port 80 on his host to port 80 on the container:

  ```bash
  sudo docker run -d -p 80:80 --name my-nginx nginx
  ```

  - **`-d`**: Runs the container in detached mode (in the background).
  - **`-p 80:80`**: Maps port 80 on the host to port 80 in the container.

- **Testing the Web Server**: Bob opens a browser and navigates to `http://localhost` to see the Nginx welcome page, confirming the containerized web server is up and running.

> *“With just a few commands, I’ve got a web server running—no manual setup!”* Bob says, amazed by Docker’s efficiency.

---

## **6. Managing Containers and Images**

Now that he has multiple containers, Bob learns how to manage and organize them.

- **Stopping a Container**: Bob stops his Nginx container with:

  ```bash
  sudo docker stop my-nginx
  ```

- **Starting a Stopped Container**: To restart it, he runs:

  ```bash
  sudo docker start my-nginx
  ```

- **Removing a Container**: When he no longer needs a container, he removes it:

  ```bash
  sudo docker rm my-nginx
  ```

- **Removing an Image**: If he wants to clear out images, he uses:

  ```bash
  sudo docker rmi nginx
  ```

> *“It’s so easy to start, stop, and clean up containers,”* Bob says, happy with the flexibility Docker provides.

---

## **7. Creating a Custom Dockerfile**

Bob learns that he can build his own Docker images using a **Dockerfile**, a script that defines the steps to set up an image. He decides to create a simple Dockerfile that installs a basic Nginx server and customizes the default HTML page.

- **Writing the Dockerfile**: In a new directory, he creates a `Dockerfile`:

  ```dockerfile
  FROM nginx:latest
  COPY index.html /usr/share/nginx/html/index.html
  ```

  - **`FROM`**: Specifies the base image (Nginx in this case).
  - **`COPY`**: Copies a custom `index.html` file into the web server’s root directory.

- **Building the Image**: He builds the custom image, naming it `my-nginx`:

  ```bash
  sudo docker build -t my-nginx .
  ```

- **Running the Custom Container**: Bob runs his custom Nginx container:

  ```bash
  sudo docker run -d -p 80:80 my-nginx
  ```

> *“With Dockerfiles, I can create my own images tailored to any project!”* Bob notes, excited by the possibilities of custom containers.

---

## **8. Using Docker Compose for Multi-Container Applications**

Bob discovers **Docker Compose**, a tool for defining and running multi-container applications, allowing him to start multiple containers with a single command.

- **Installing Docker Compose**: To start, Bob installs Docker Compose:

  ```bash
  sudo dnf install docker-compose
  ```

- **Creating a `docker-compose.yml` File**: Bob writes a `docker-compose.yml` file to launch both an Nginx web server and a MySQL database container:

  ```yaml
  version: '3'
  services:
    web:
      image: nginx
      ports:
        - "80:80"
    db:
      image: mysql
      environment:
        MYSQL_ROOT_PASSWORD: mypassword
  ```

- **Starting the Application with Docker Compose**: He launches both containers with:

  ```bash
  sudo docker-compose up -d
  ```

  This command runs both services in the background, creating a simple web and database stack.

> *“With Docker Compose, I can spin up entire environments in seconds!”* Bob says, amazed by the ease of multi-container management.

---

## **9. Cleaning Up Docker Resources**

To keep his system organized, Bob learns to clean up unused Docker resources.

- **Removing Unused Containers and Images**: Bob uses `docker system prune` to delete unused containers, networks, and dangling images:

  ```bash
  sudo docker system prune
  ```

> *“Keeping Docker clean is easy with a single command!”* Bob says, appreciating the simplicity of cleanup.

---

## **10. Conclusion: Bob’s Containerized Deployment Success**

With Docker and Docker Compose, Bob has mastered the basics of containerization. He can now create, manage, and deploy applications in containers, enabling him to scale and automate environments with ease.

> Next, Bob is ready to explore **advanced security practices** for containers and Linux systems, further safeguarding his AlmaLinux server.

*Stay tuned for the next chapter: "Bob Delves into Advanced Security Practices!"*
