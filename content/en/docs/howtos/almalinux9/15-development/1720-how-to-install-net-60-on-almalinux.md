---
title: How to Install .NET 6.0 on AlmaLinux
linkTitle: Install .NET 6.0
description: Learn how to install .NET 6.0 on AlmaLinux with this comprehensive step-by-step guide. Includes runtime and SDK installation, application creation, and troubleshooting.
date: 2025-01-08T10:54:11.711Z
weight: 1720
url: install-net-6-0-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - .NET 6.0
featured_image: /images/almalinux.webp
---
.NET 6.0 is a cutting-edge, open-source framework that supports a wide range of applications, including web, desktop, cloud, mobile, and IoT solutions. It is a Long-Term Support (LTS) release, providing stability and support through November 2024. AlmaLinux, as a reliable and enterprise-grade Linux distribution, is an excellent platform for hosting .NET applications due to its compatibility with Red Hat Enterprise Linux (RHEL).

This guide provides a detailed, step-by-step tutorial for installing .NET 6.0 on AlmaLinux, along with configuration and testing steps to ensure a seamless development experience.

---

## **Why Choose .NET 6.0?**  

.NET 6.0 introduces several key features and improvements:  

1. **Unified Development Platform:** One framework for building apps across all platforms (web, desktop, mobile, and cloud).  
2. **Performance Enhancements:** Improved execution speed and reduced memory usage, especially for web APIs and microservices.  
3. **C# 10 and F# 6 Support:** Access to the latest language features.  
4. **Simplified Development:** Minimal APIs for quick web API development.  
5. **Long-Term Support:** Backed by updates and fixes for the long term.  

If you're looking to build modern, high-performance applications, .NET 6.0 is the perfect choice.

---

## **Prerequisites**  

Before you begin, ensure the following prerequisites are met:  

1. **AlmaLinux System Requirements:**  
   - AlmaLinux 8 or newer.  
   - Sudo or root access to perform administrative tasks.  

2. **Update Your System:**  

   ```bash
   sudo dnf update -y
   ```  

3. **Install Development Tools:**  
   Install essential build tools and libraries:  

   ```bash
   sudo dnf groupinstall "Development Tools" -y
   sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel git curl
   ```  

4. **Firewall Configuration:**  
   Ensure ports required by your applications (e.g., 5000, 5001 for ASP.NET) are open:  

   ```bash
   sudo firewall-cmd --add-port=5000/tcp --permanent
   sudo firewall-cmd --add-port=5001/tcp --permanent
   sudo firewall-cmd --reload
   ```  

---

## **Step 1: Enable Microsoft’s Package Repository**  

.NET packages are provided by Microsoft’s official repository. You must add it to your AlmaLinux system.  

1. **Import Microsoft’s GPG Key:**  

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```  

2. **Add the Repository:**  

   ```bash
   sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
   ```  

3. **Update the Repository Cache:**  

   ```bash
   sudo dnf update -y
   ```  

---

## **Step 2: Install .NET 6.0 Runtime or SDK**  

You can install the **Runtime** or the **SDK**, depending on your needs:  

- **Runtime:** For running .NET applications.  
- **SDK:** For developing and running .NET applications.  

### **Install .NET 6.0 Runtime**  

If you only need to run applications, install the runtime:  

```bash
sudo dnf install -y dotnet-runtime-6.0
```  

### **Install .NET 6.0 SDK**  

For development purposes, install the SDK:  

```bash
sudo dnf install -y dotnet-sdk-6.0
```  

---

## **Step 3: Verify the Installation**  

To confirm that .NET 6.0 has been installed successfully:  

1. **Check the Installed Runtime Versions:**  

   ```bash
   dotnet --list-runtimes
   ```  

   Example output:  

   ```plaintext
   Microsoft.NETCore.App 6.0.x [/usr/share/dotnet/shared/Microsoft.NETCore.App]
   ```  

2. **Check the Installed SDK Versions:**  

   ```bash
   dotnet --list-sdks
   ```  

   Example output:  

   ```plaintext
   6.0.x [/usr/share/dotnet/sdk]
   ```  

3. **Verify the .NET Version:**  

   ```bash
   dotnet --version
   ```  

   The output should display the installed version, e.g., `6.0.x`.  

---

## **Step 4: Create and Run a Sample .NET 6.0 Application**  

To test your installation, create a simple application.  

1. **Create a New Console Application:**  

   ```bash
   dotnet new console -o MyApp
   ```  

   This command generates a basic .NET console application in a folder named `MyApp`.  

2. **Navigate to the Application Directory:**  

   ```bash
   cd MyApp
   ```  

3. **Run the Application:**  

   ```bash
   dotnet run
   ```  

   You should see:  

   ```plaintext
   Hello, World!
   ```  

---

## **Step 5: Set Up an ASP.NET Core Application (Optional)**  

.NET 6.0 includes ASP.NET Core for building web applications and APIs.  

1. **Create a New Web Application:**  

   ```bash
   dotnet new webapp -o MyWebApp
   ```  

2. **Navigate to the Application Directory:**  

   ```bash
   cd MyWebApp
   ```  

3. **Run the Application:**  

   ```bash
   dotnet run
   ```  

4. **Access the Application:**  
   Open your browser and navigate to `http://localhost:5000` (or the displayed URL in the terminal).  

---

## **Step 6: Deploying .NET 6.0 Applications**  

### **Publishing an Application**  

To deploy a .NET 6.0 application, publish it as a self-contained or framework-dependent application:  

1. **Publish the Application:**  

   ```bash
   dotnet publish -c Release -o /path/to/publish
   ```  

2. **Run the Published Application:**  

   ```bash
   dotnet /path/to/publish/MyApp.dll
   ```  

### **Running as a Service**  

You can configure your application to run as a systemd service for production environments:  

1. Create a service file:  

   ```bash
   sudo nano /etc/systemd/system/myapp.service
   ```  

2. Add the following content:  

   ```plaintext
   [Unit]
   Description=My .NET 6.0 Application
   After=network.target

   [Service]
   WorkingDirectory=/path/to/publish
   ExecStart=/usr/bin/dotnet /path/to/publish/MyApp.dll
   Restart=always
   RestartSec=10
   KillSignal=SIGINT
   SyslogIdentifier=myapp
   User=www-data
   Environment=ASPNETCORE_ENVIRONMENT=Production

   [Install]
   WantedBy=multi-user.target
   ```  

3. Enable and start the service:  

   ```bash
   sudo systemctl enable myapp.service
   sudo systemctl start myapp.service
   ```  

4. Check the service status:  

   ```bash
   sudo systemctl status myapp.service
   ```  

---

## **Step 7: Troubleshooting Common Issues**  

### **1. Dependency Errors**  

Ensure all required dependencies are installed:  

```bash
sudo dnf install -y libunwind libicu
```  

### **2. Application Fails to Start**  

Check the application logs:  

```bash
journalctl -u myapp.service
```  

### **3. Firewall Blocking Ports**  

Ensure the firewall is configured to allow the necessary ports:  

```bash
sudo firewall-cmd --add-port=5000/tcp --permanent
sudo firewall-cmd --reload
```  

---

## **Conclusion**  

Installing .NET 6.0 on AlmaLinux is a straightforward process, enabling you to build and run high-performance, cross-platform applications. With the powerful features of .NET 6.0 and the stability of AlmaLinux, you have a reliable foundation for developing and deploying modern solutions.  

From creating basic console applications to hosting scalable web APIs, .NET 6.0 offers the tools you need for any project. Follow this guide to set up your environment and start leveraging the capabilities of this versatile framework.  
