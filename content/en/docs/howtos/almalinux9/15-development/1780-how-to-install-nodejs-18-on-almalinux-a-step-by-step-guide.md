---
title: "How to Install Node.js 18 on AlmaLinux: A Step-by-Step Guide"
linkTitle: Install Node.js 18
description: This detailed guide will walk you through installing Node.js 18 on AlmaLinux
date: 2025-01-08T11:07:41.806Z
weight: 1780
url: install-node-js-18-almalinux-step-step-guide
translationKey: how-to-install-nodejs-18-on-almalinux-a-step-by-step-guide
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - Node.js 18
featured_image: /images/almalinux.webp
---
Node.js is an open-source, cross-platform JavaScript runtime environment built on Chrome's V8 engine. It’s widely used for developing scalable, server-side applications. With the release of **Node.js 18**, developers gain access to long-term support (LTS) features, enhanced performance, and security updates. AlmaLinux, a stable, enterprise-grade Linux distribution, is an excellent choice for hosting Node.js applications.

This detailed guide will walk you through installing Node.js 18 on AlmaLinux, managing its dependencies, and verifying the setup to ensure everything works seamlessly.

---

### **Table of Contents**

1. Introduction to Node.js 18
2. Prerequisites
3. Step 1: Update Your System
4. Step 2: Install Node.js 18 from NodeSource
5. Step 3: Verify Node.js and npm Installation
6. Step 4: Manage Multiple Node.js Versions with NVM
7. Step 5: Create and Run a Simple Node.js Application
8. Step 6: Security and Firewall Configurations
9. Conclusion

---

### **1. Introduction to Node.js 18**

Node.js 18 introduces several key features, including:

- **Global Fetch API**: Native support for the Fetch API in Node.js applications.
- **Improved Performance**: Enhanced performance for asynchronous streams and timers.
- **Enhanced Test Runner Module**: Built-in tools for testing JavaScript code.
- **Long-Term Support (LTS)**: Ensuring stability and extended support for production environments.

By installing Node.js 18 on AlmaLinux, you can take advantage of these features while leveraging AlmaLinux's stability and security.

---

### **2. Prerequisites**

Before proceeding, ensure the following prerequisites are met:

1. A server running AlmaLinux.
2. Root or sudo access to the server.
3. Basic understanding of Linux commands.
4. An active internet connection for downloading packages.

---

### **3. Step 1: Update Your System**

Keeping your system up-to-date ensures that you have the latest security patches and system stability improvements. Run the following commands to update your AlmaLinux server:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

After completing the update, reboot your system to apply the changes:

```bash
sudo reboot
```

---

### **4. Step 2: Install Node.js 18 from NodeSource**

AlmaLinux’s default repositories may not include the latest Node.js version. To install Node.js 18, we’ll use the official NodeSource repository.

#### Step 4.1: Add the NodeSource Repository

NodeSource provides a script to set up its repository for specific Node.js versions. Download and execute the setup script for Node.js 18:

```bash
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
```

#### Step 4.2: Install Node.js 18

Once the repository is added, install Node.js 18 with the following command:

```bash
sudo dnf install -y nodejs
```

#### Step 4.3: Install Development Tools (Optional)

Some Node.js packages require compilation during installation. Install development tools to ensure compatibility:

```bash
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y gcc-c++ make
```

---

### **5. Step 3: Verify Node.js and npm Installation**

To confirm that Node.js and its package manager **npm** were installed correctly, check their versions:

#### Check Node.js Version

```bash
node -v
```

Expected output:

```
v18.x.x
```

#### Check npm Version

```bash
npm -v
```

npm is installed automatically with Node.js and allows you to manage JavaScript libraries and frameworks.

---

### **6. Step 4: Manage Multiple Node.js Versions with NVM**

The **Node Version Manager (NVM)** is a useful tool for managing multiple Node.js versions on the same system. This is particularly helpful for developers working on projects that require different Node.js versions.

#### Step 6.1: Install NVM

Install NVM using its official script:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

#### Step 6.2: Load NVM

Activate NVM by sourcing your shell configuration file:

```bash
source ~/.bashrc
```

#### Step 6.3: Install Node.js 18 Using NVM

Use NVM to install Node.js 18:

```bash
nvm install 18
```

#### Step 6.4: Verify Installation

Check the installed Node.js version:

```bash
node -v
```

#### Step 6.5: Switch Between Versions

If you have multiple Node.js versions installed, you can list them:

```bash
nvm list
```

Switch to Node.js 18:

```bash
nvm use 18
```

---

### **7. Step 5: Create and Run a Simple Node.js Application**

Now that Node.js 18 is installed, test it by creating and running a simple Node.js application.

#### Step 7.1: Create a Project Directory

Create a directory for your Node.js application and navigate to it:

```bash
mkdir my-node-app
cd my-node-app
```

#### Step 7.2: Initialize a Node.js Project

Run the following command to generate a `package.json` file:

```bash
npm init -y
```

#### Step 7.3: Write a Simple Node.js Application

Create a file named `app.js`:

```bash
nano app.js
```

Add the following code to create a basic HTTP server:

```javascript
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, Node.js 18 on AlmaLinux!\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

Save and close the file.

#### Step 7.4: Run the Application

Execute the application using Node.js:

```bash
node app.js
```

You should see the following message in the terminal:

```
Server running at http://127.0.0.1:3000/
```

#### Step 7.5: Test the Application

Open a web browser or use `curl` to visit `http://127.0.0.1:3000/`. You should see the message:

```
Hello, Node.js 18 on AlmaLinux!
```

---

### **8. Step 6: Security and Firewall Configurations**

If your server is secured with a firewall, ensure the necessary port (e.g., 3000) is open for your Node.js application.

#### Open Port 3000

```bash
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
```

#### Use PM2 for Process Management

For production environments, use **PM2**, a process manager for Node.js applications. Install PM2 globally:

```bash
sudo npm install -g pm2
```

Start your application with PM2:

```bash
pm2 start app.js
```

PM2 ensures your Node.js application runs in the background and restarts automatically in case of failures.

---

### **9. Conclusion**

Congratulations! You’ve successfully installed Node.js 18 on AlmaLinux. With this setup, you’re ready to develop modern, scalable JavaScript applications using the latest features and improvements in Node.js. Additionally, you’ve learned how to manage multiple Node.js versions with NVM and set up a basic Node.js server.

Whether you're building APIs, real-time applications, or microservices, Node.js 18 and AlmaLinux provide a robust and reliable foundation for your development needs. Don’t forget to explore the new features in Node.js 18 and leverage its full potential for your projects.

Happy coding!
