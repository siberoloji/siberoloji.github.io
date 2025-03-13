---
title: "How to Install Node.js 16 on AlmaLinux: A Step-by-Step Guide"
linkTitle: Install Node.js 16
description: In this guide, we’ll walk through the steps to install Node.js 16 on AlmaLinux
date: 2025-01-08T11:06:12.405Z
weight: 1770
url: install-node-js-16-almalinux-step-step-guide
translationKey: install-node-js-16-almalinux-step-step-guide
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - Node.js 16
featured_image: /images/almalinux.webp
---
Node.js is a widely-used, cross-platform JavaScript runtime environment that empowers developers to build scalable server-side applications. The release of **Node.js 16** introduced several features, including Apple M1 support, npm v7, and updated V8 JavaScript engine capabilities. AlmaLinux, a reliable and secure Linux distribution, is an excellent choice for running Node.js applications.

In this guide, we’ll walk through the steps to install **Node.js 16** on AlmaLinux, ensuring you’re equipped to start building and deploying powerful JavaScript-based applications.

---

### **Table of Contents**

1. Introduction
2. Prerequisites
3. Step 1: Update Your System
4. Step 2: Install Node.js 16 from NodeSource Repository
5. Step 3: Verify Node.js and npm Installation
6. Step 4: Manage Multiple Node.js Versions with NVM
7. Step 5: Build and Run a Simple Node.js Application
8. Step 6: Enable Firewall and Security Considerations
9. Conclusion

---

### **1. Introduction**

Node.js has gained immense popularity in the developer community for its ability to handle asynchronous I/O and real-time applications seamlessly. Its package manager, **npm**, further simplifies managing dependencies for projects. Installing Node.js 16 on AlmaLinux provides the perfect environment for modern web and backend development.

---

### **2. Prerequisites**

Before starting, ensure you have:

- A server running AlmaLinux with root or **sudo** privileges.
- Basic knowledge of the Linux command line.
- Internet access to download packages.

---

### **3. Step 1: Update Your System**

Keeping your system updated ensures it has the latest security patches and a stable software environment. Run the following commands:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

Once the update is complete, reboot the system to apply the changes:

```bash
sudo reboot
```

---

### **4. Step 2: Install Node.js 16 from NodeSource Repository**

AlmaLinux’s default repositories may not always include the latest Node.js versions. To install Node.js 16, we’ll use the **NodeSource** repository.

#### Step 2.1: Add the NodeSource Repository

NodeSource provides a script to set up the repository for Node.js. Download and execute the setup script for Node.js 16:

```bash
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
```

#### Step 2.2: Install Node.js

After adding the repository, install Node.js with the following command:

```bash
sudo dnf install -y nodejs
```

#### Step 2.3: Install Build Tools (Optional but Recommended)

Some Node.js packages require compilation during installation. Install the necessary build tools to avoid errors:

```bash
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y gcc-c++ make
```

---

### **5. Step 3: Verify Node.js and npm Installation**

After installation, verify that Node.js and its package manager, **npm**, were successfully installed:

```bash
node -v
```

You should see the version of Node.js, which should be `16.x.x`.

```bash
npm -v
```

This command will display the version of **npm**, which ships with Node.js.

---

### **6. Step 4: Manage Multiple Node.js Versions with NVM**

If you want the flexibility to switch between different Node.js versions, the **Node Version Manager (NVM)** is a useful tool. Here’s how to set it up:

#### Step 4.1: Install NVM

Download and install NVM using the official script:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Activate NVM by sourcing the profile:

```bash
source ~/.bashrc
```

#### Step 4.2: Install Node.js 16 with NVM

With NVM installed, use it to install Node.js 16:

```bash
nvm install 16
```

Verify the installation:

```bash
node -v
```

#### Step 4.3: Switch Between Node.js Versions

You can list all installed Node.js versions:

```bash
nvm list
```

Switch to a specific version (e.g., Node.js 16):

```bash
nvm use 16
```

---

### **7. Step 5: Build and Run a Simple Node.js Application**

Now that Node.js 16 is installed, test your setup by building and running a simple Node.js application.

#### Step 5.1: Create a New Project Directory

Create a new directory for your project and navigate to it:

```bash
mkdir my-node-app
cd my-node-app
```

#### Step 5.2: Initialize a Node.js Project

Run the following command to create a `package.json` file:

```bash
npm init -y
```

This file holds the project’s metadata and dependencies.

#### Step 5.3: Create a Simple Application

Use a text editor to create a file named `app.js`:

```bash
nano app.js
```

Add the following code:

```javascript
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, Node.js on AlmaLinux!\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

Save and close the file.

#### Step 5.4: Run the Application

Run the application using Node.js:

```bash
node app.js
```

You should see the message:

```
Server running at http://127.0.0.1:3000/
```

Open a browser and navigate to `http://127.0.0.1:3000/` to see your application in action.

---

### **8. Step 6: Enable Firewall and Security Considerations**

If your server uses a firewall, ensure the necessary ports are open. For the above example, you need to open port 3000.

#### Open Port 3000

```bash
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
```

#### Use a Process Manager (Optional)

For production environments, use a process manager like **PM2** to manage your Node.js application. Install PM2 globally:

```bash
sudo npm install -g pm2
```

Start your application with PM2:

```bash
pm2 start app.js
```

---

### **9. Conclusion**

Congratulations! You’ve successfully installed Node.js 16 on AlmaLinux. You’ve also set up a simple Node.js application and explored how to manage multiple Node.js versions with NVM. With this setup, you’re ready to develop, test, and deploy powerful JavaScript applications on a stable AlmaLinux environment.

By following this guide, you’ve taken the first step in leveraging Node.js’s capabilities for real-time, scalable, and efficient applications. Whether you’re building APIs, single-page applications, or server-side solutions, Node.js and AlmaLinux provide a robust foundation for your projects. Happy coding!
