---
title: 
linkTitle: 
description: 
date: 
weight: 1810
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
### How to Install Next.js on AlmaLinux: A Comprehensive Guide

Next.js is a popular React framework for building server-rendered applications, static websites, and modern web applications with ease. Developed by Vercel, Next.js provides powerful features like server-side rendering (SSR), static site generation (SSG), and API routes, making it an excellent choice for developers who want to create scalable and high-performance web applications.

If you’re running **AlmaLinux**, an enterprise-grade Linux distribution, this guide will walk you through installing and setting up Next.js on your system. By the end of this tutorial, you’ll have a functional Next.js project ready for development or deployment.

---

### **Table of Contents**

1. What is Next.js and Why Use It?
2. Prerequisites
3. Step 1: Update Your AlmaLinux System
4. Step 2: Install Node.js and npm
5. Step 3: Create a New Next.js Application
6. Step 4: Start and Test the Next.js Development Server
7. Step 5: Build and Deploy the Next.js Application
8. Step 6: Deploy Next.js with Nginx
9. Step 7: Security and Firewall Considerations
10. Conclusion

---

### **1. What is Next.js and Why Use It?**

**Next.js** is an open-source React framework that extends React’s capabilities by adding server-side rendering (SSR) and static site generation (SSG). These features make it ideal for creating fast, SEO-friendly web applications.

Key features of Next.js include:

- **Server-Side Rendering (SSR)**: Improves SEO and user experience by rendering content on the server.
- **Static Site Generation (SSG)**: Builds static HTML pages at build time for faster loading.
- **Dynamic Routing**: Supports route-based code splitting and dynamic routing.
- **API Routes**: Enables serverless API functionality.
- **Integrated TypeScript Support**: Simplifies development with built-in TypeScript support.

By combining React's component-based architecture with Next.js's performance optimizations, you can build robust web applications with minimal effort.

---

### **2. Prerequisites**

Before proceeding, ensure the following prerequisites are met:

1. A server running **AlmaLinux**.
2. **Root or sudo access** to install software and configure the system.
3. Familiarity with basic Linux commands and web development concepts.
4. An active internet connection for downloading dependencies.

---

### **3. Step 1: Update Your AlmaLinux System**

Start by updating your AlmaLinux system to ensure you have the latest packages and security patches:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

Reboot the system to apply the updates:

```bash
sudo reboot
```

---

### **4. Step 2: Install Node.js and npm**

Next.js requires **Node.js** to run its development server and manage dependencies.

#### Step 4.1: Add the NodeSource Repository
Install the latest Long-Term Support (LTS) version of Node.js (currently Node.js 18) using the NodeSource repository:

```bash
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
```

#### Step 4.2: Install Node.js and npm
Install Node.js and its package manager npm:

```bash
sudo dnf install -y nodejs
```

#### Step 4.3: Verify Installation
After installation, verify the versions of Node.js and npm:

```bash
node -v
```

Expected output:
```
v18.x.x
```

```bash
npm -v
```

---

### **5. Step 3: Create a New Next.js Application**

With Node.js and npm installed, you can now create a new Next.js application using the `create-next-app` command.

#### Step 5.1: Install Create Next App
Run the following command to install the `create-next-app` tool globally:

```bash
sudo npm install -g create-next-app
```

#### Step 5.2: Create a New Project
Generate a new Next.js application by running:

```bash
npx create-next-app my-nextjs-app
```

You’ll be prompted to:

- Specify the project name (you can press Enter to use the default name).
- Choose whether to use TypeScript (recommended for better type safety).

Once the command finishes, it will set up a new Next.js application in the `my-nextjs-app` directory.

#### Step 5.3: Navigate to the Project Directory
Move into your project directory:

```bash
cd my-nextjs-app
```

---

### **6. Step 4: Start and Test the Next.js Development Server**

Next.js includes a built-in development server that you can use to test your application locally.

#### Step 6.1: Start the Development Server
Run the following command to start the server:

```bash
npm run dev
```

By default, the server runs on port `3000`. If you’re running this on a remote server, bind the server to all available IP addresses:

```bash
npm run dev -- --host 0.0.0.0
```

#### Step 6.2: Access the Application
Open your browser and navigate to:

```
http://<your-server-ip>:3000/
```

You should see the default Next.js welcome page, confirming that your application is running successfully.

---

### **7. Step 5: Build and Deploy the Next.js Application**

When your application is ready for production, you need to create a production build.

#### Step 7.1: Build the Application
Run the following command to generate optimized production files:

```bash
npm run build
```

The build process will generate static and server-rendered files in the `.next/` directory.

#### Step 7.2: Start the Production Server
To serve the production build locally, use the following command:

```bash
npm run start
```

---

### **8. Step 6: Deploy Next.js with Nginx**

For production, you’ll typically use a web server like **Nginx** to serve your Next.js application.

#### Step 8.1: Install Nginx
Install Nginx on AlmaLinux:

```bash
sudo dnf install nginx -y
```

#### Step 8.2: Configure Nginx
Open a new Nginx configuration file:

```bash
sudo nano /etc/nginx/conf.d/nextjs-app.conf
```

Add the following configuration:

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

Replace `yourdomain.com` with your domain name or server IP.

#### Step 8.3: Restart Nginx
Restart Nginx to apply the configuration:

```bash
sudo systemctl restart nginx
```

Now, your Next.js application will be accessible via your domain or server IP.

---

### **9. Step 7: Security and Firewall Considerations**

#### Open Necessary Ports
If you’re using a firewall, open port `3000` for development or port `80` for production:

```bash
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
```

---

### **10. Conclusion**

By following this guide, you’ve successfully installed and set up **Next.js** on AlmaLinux. You’ve learned how to create a new Next.js project, test it using the built-in development server, and deploy it in a production environment using Nginx.

With Next.js, you have a powerful framework for building fast, scalable, and SEO-friendly web applications. As you dive deeper, explore advanced features like API routes, dynamic routing, and server-side rendering to maximize Next.js’s potential.

Happy coding!