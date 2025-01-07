---
title: 
linkTitle: 
description: 
date: 
weight: 1800
slug: 
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
### How to Install React on AlmaLinux: A Comprehensive Guide

React, a powerful JavaScript library developed by Facebook, is a popular choice for building dynamic and interactive user interfaces. React's component-based architecture and reusable code modules make it ideal for creating scalable web applications. If you’re using **AlmaLinux**, an enterprise-grade Linux distribution, this guide will show you how to install and set up React for web development.

In this tutorial, we’ll cover everything from installing the prerequisites to creating a new React application, testing it, and preparing it for deployment.

---

### **Table of Contents**

1. What is React and Why Use It?
2. Prerequisites
3. Step 1: Update AlmaLinux
4. Step 2: Install Node.js and npm
5. Step 3: Install the Create React App Tool
6. Step 4: Create a React Application
7. Step 5: Run and Test the React Application
8. Step 6: Build and Deploy the React Application
9. Step 7: Security and Firewall Configurations
10. Conclusion

---

### **1. What is React and Why Use It?**

React is a JavaScript library used for building user interfaces, particularly for single-page applications (SPAs). It allows developers to create reusable UI components, manage state efficiently, and render updates quickly.

Key features of React include:

- **Virtual DOM**: Efficiently updates and renders only the components that change.
- **Component-Based Architecture**: Encourages modular and reusable code.
- **Strong Ecosystem**: A vast collection of tools, libraries, and community support.
- **Flexibility**: Can be used with other libraries and frameworks.

Setting up React on AlmaLinux ensures a stable and reliable development environment for building modern web applications.

---

### **2. Prerequisites**

Before you begin, make sure you have:

1. **AlmaLinux** server or workstation.
2. **Sudo privileges** to install packages.
3. A basic understanding of the Linux command line.
4. An active internet connection for downloading dependencies.

---

### **3. Step 1: Update AlmaLinux**

Start by updating your AlmaLinux system to ensure you have the latest packages and security updates:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

Reboot the system to apply updates:

```bash
sudo reboot
```

---

### **4. Step 2: Install Node.js and npm**

React relies on **Node.js** and its package manager, **npm**, for running its development server and managing dependencies.

#### Step 4.1: Add the NodeSource Repository
Install Node.js (LTS version) from the official NodeSource repository:

```bash
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
```

#### Step 4.2: Install Node.js
Once the repository is added, install Node.js and npm:

```bash
sudo dnf install -y nodejs
```

#### Step 4.3: Verify Installation
After installation, check the versions of Node.js and npm:

```bash
node -v
```

Expected output:
```
v16.x.x
```

```bash
npm -v
```

npm is installed automatically with Node.js and is essential for managing React dependencies.

---

### **5. Step 3: Install the Create React App Tool**

The easiest way to create a React application is by using the `create-react-app` tool. This CLI tool sets up a React project with all the necessary configurations.

#### Step 5.1: Install Create React App Globally
Run the following command to install the tool globally:

```bash
sudo npm install -g create-react-app
```

#### Step 5.2: Verify Installation
Confirm that `create-react-app` is installed correctly:

```bash
create-react-app --version
```

---

### **6. Step 4: Create a React Application**

Now that the setup is complete, you can create a new React application.

#### Step 6.1: Create a New React Project
Navigate to your desired directory (e.g., `/var/www/`) and create a new React project. Replace `my-react-app` with your desired project name:

```bash
create-react-app my-react-app
```

This command will download and set up all the dependencies required for a React application.

#### Step 6.2: Navigate to the Project Directory
Change to the newly created directory:

```bash
cd my-react-app
```

---

### **7. Step 5: Run and Test the React Application**

#### Step 7.1: Start the Development Server
Run the following command to start the React development server:

```bash
npm start
```

By default, the development server runs on port `3000`. If you’re running this on a remote server, you may need to bind the server to the system’s IP address:

```bash
npm start -- --host 0.0.0.0
```

#### Step 7.2: Access the React Application
Open a browser and navigate to:

```
http://<your-server-ip>:3000/
```

You should see the default React welcome page, confirming that your React application is up and running.

---

### **8. Step 6: Build and Deploy the React Application**

Once your application is ready for deployment, you need to create a production build.

#### Step 8.1: Build the Application
Run the following command to create a production-ready build:

```bash
npm run build
```

This will generate optimized files in the `build/` directory.

#### Step 8.2: Deploy Using a Web Server
You can serve the built files using a web server like Apache or Nginx.

##### Example: Deploying with Nginx
1. **Install Nginx**:
   ```bash
   sudo dnf install nginx -y
   ```

2. **Configure Nginx**:
   Open the Nginx configuration file:
   ```bash
   sudo nano /etc/nginx/conf.d/react-app.conf
   ```

   Add the following configuration:
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;

       root /path/to/my-react-app/build;
       index index.html;

       location / {
           try_files $uri /index.html;
       }
   }
   ```

   Replace `/path/to/my-react-app/build` with the actual path to your React app’s build directory.

3. **Restart Nginx**:
   ```bash
   sudo systemctl restart nginx
   ```

Your React application will now be accessible via your domain or server IP.

---

### **9. Step 7: Security and Firewall Configurations**

If you’re using a firewall, ensure that necessary ports are open for both development and production environments.

#### Open Port 3000 (for Development Server):
```bash
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
```

#### Open Port 80 (for Nginx Production):
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
```

---

### **10. Conclusion**

By following this guide, you’ve successfully installed React on AlmaLinux and created your first React application. React’s flexibility and AlmaLinux’s stability make for an excellent combination for developing modern web applications. You’ve also learned how to serve and deploy your application, ensuring it’s accessible for end-users.

As you dive deeper into React, explore its ecosystem of libraries like React Router, Redux for state management, and tools like Next.js for server-side rendering. Whether you’re a beginner or an experienced developer, this setup provides a robust foundation for building dynamic and interactive web applications.

Happy coding!