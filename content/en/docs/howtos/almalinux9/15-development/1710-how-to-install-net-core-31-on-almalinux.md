---
title: How to Install .NET Core 3.1 on AlmaLinux
linkTitle: Install .NET Core 3.1
description: Step-by-step guide to installing .NET Core 3.1 on AlmaLinux. Learn to set up the runtime, SDK, and ASP.NET Core for building modern applications.
date: 2025-01-08T10:58:09.608Z
weight: 1710
url: install-net-core-3-1-almalinux
translationKey: install-net-core-3-1-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - .net core
featured_image: /images/almalinux.webp
---
# **How to Install .NET Core 3.1 on AlmaLinux**  

.NET Core 3.1, now part of the broader .NET platform, is a popular open-source and cross-platform framework for building modern applications. It supports web, desktop, mobile, cloud, and microservices development with high performance and flexibility. AlmaLinux, an enterprise-grade Linux distribution, is an excellent choice for hosting and running .NET Core applications due to its stability and RHEL compatibility.

This guide will walk you through the process of installing .NET Core 3.1 on AlmaLinux, covering prerequisites, step-by-step installation, and testing.

---

## **Why Choose .NET Core 3.1?**  

Although newer versions of .NET are available, .NET Core 3.1 remains a Long-Term Support (LTS) release. This means:  

1. **Stability:** Backed by long-term updates and security fixes until December 2022 (or beyond for enterprise).  
2. **Compatibility:** Supports building and running applications across multiple platforms.  
3. **Proven Performance:** Optimized for high performance in web and API applications.  
4. **Extensive Libraries:** Includes features like gRPC support, new JSON APIs, and enhanced desktop support.

If your project requires a stable environment, .NET Core 3.1 is a reliable choice.

---

## **Prerequisites**  

Before installing .NET Core 3.1 on AlmaLinux, ensure the following prerequisites are met:  

1. **Updated System:**  
   Update all existing packages on your AlmaLinux system:  

   ```bash
   sudo dnf update -y
   ```  

2. **Development Tools:**  
   Install essential build tools to support .NET Core:  

   ```bash
   sudo dnf groupinstall "Development Tools" -y
   ```  

3. **Administrative Privileges:**  
   You need root or sudo access to install .NET Core packages and make system changes.

4. **Check AlmaLinux Version:**  
   Ensure you are using AlmaLinux 8 or higher, as it provides the necessary dependencies.

---

## **Step 1: Enable Microsoft’s Package Repository**  

.NET Core packages are provided directly by Microsoft. To install .NET Core 3.1, you first need to enable the Microsoft package repository.  

1. Import the Microsoft GPG key:  

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```  

2. Add the Microsoft repository:  

   ```bash
   sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
   ```  

3. Update the repository cache:  

   ```bash
   sudo dnf update -y
   ```  

---

## **Step 2: Install .NET Core 3.1 Runtime or SDK**  

You can choose between the **.NET Core Runtime** or the **SDK** depending on your requirements:  

- **Runtime:** For running .NET Core applications.  
- **SDK:** For developing and running .NET Core applications.  

### **Install .NET Core 3.1 Runtime**  

If you only need to run .NET Core applications:  

```bash
sudo dnf install -y dotnet-runtime-3.1
```  

### **Install .NET Core 3.1 SDK**  

If you are a developer and need to build applications:  

```bash
sudo dnf install -y dotnet-sdk-3.1
```  

---

## **Step 3: Verify the Installation**  

Check if .NET Core 3.1 has been installed successfully:  

1. Verify the installed runtime:  

   ```bash
   dotnet --list-runtimes
   ```  

   You should see an entry similar to:  

   ```plaintext
   Microsoft.NETCore.App 3.1.x [/usr/share/dotnet/shared/Microsoft.NETCore.App]
   ```  

2. Verify the installed SDK:  

   ```bash
   dotnet --list-sdks
   ```  

   The output should include:  

   ```plaintext
   3.1.x [/usr/share/dotnet/sdk]
   ```  

3. Check the .NET version:  

   ```bash
   dotnet --version
   ```  

   This should display `3.1.x`.  

---

## **Step 4: Create and Run a Sample .NET Core Application**  

To ensure everything is working correctly, create a simple .NET Core application.  

1. **Create a New Console Application:**  

   ```bash
   dotnet new console -o MyApp
   ```  

   This command creates a new directory `MyApp` and initializes a basic .NET Core console application.  

2. **Navigate to the Application Directory:**  

   ```bash
   cd MyApp
   ```  

3. **Run the Application:**  

   ```bash
   dotnet run
   ```  

   You should see the output:  

   ```plaintext
   Hello, World!
   ```  

---

## **Step 5: Configure .NET Core for Web Applications (Optional)**  

If you are building web applications, you may want to set up ASP.NET Core.  

### **Install ASP.NET Core Runtime**  

To support web applications, install the ASP.NET Core runtime:  

```bash
sudo dnf install -y aspnetcore-runtime-3.1
```  

### **Test an ASP.NET Core Application**  

1. Create a new web application:  

   ```bash
   dotnet new webapp -o MyWebApp
   ```  

2. Navigate to the application directory:  

   ```bash
   cd MyWebApp
   ```  

3. Run the web application:  

   ```bash
   dotnet run
   ```  

4. Access the application in your browser at `http://localhost:5000`.  

---

## **Step 6: Manage .NET Core Applications**  

### **Start and Stop Applications**  

You can start a .NET Core application using:  

```bash
dotnet MyApp.dll
```  

Replace `MyApp.dll` with your application file name.  

### **Publish Applications**  

To deploy your application, publish it to a folder:  

```bash
dotnet publish -c Release -o /path/to/publish
```  

The `-c Release` flag creates a production-ready build.  

---

## **Step 7: Troubleshooting Common Issues**  

### **1. Dependency Issues**  

Ensure all dependencies are installed:  

```bash
sudo dnf install -y gcc libunwind libicu
```  

### **2. Application Fails to Start**  

Check the application logs for errors:  

```bash
journalctl -u myapp.service
```  

### **3. Firewall Blocks ASP.NET Applications**  

If your ASP.NET application cannot be accessed, allow traffic on the required ports:  

```bash
sudo firewall-cmd --add-port=5000/tcp --permanent
sudo firewall-cmd --reload
```  

---

## **Step 8: Uninstall .NET Core 3.1 (If Needed)**  

If you need to remove .NET Core 3.1 from your system:  

1. Uninstall the SDK and runtime:  

   ```bash
   sudo dnf remove dotnet-sdk-3.1 dotnet-runtime-3.1
   ```  

2. Remove the Microsoft repository:  

   ```bash
   sudo rm -f /etc/yum.repos.d/microsoft-prod.repo
   ```  

---

## **Conclusion**  

Installing .NET Core 3.1 on AlmaLinux is a straightforward process, enabling you to leverage the framework's power and versatility. Whether you’re building APIs, web apps, or microservices, this guide ensures that you have a stable development and runtime environment.  

With .NET Core 3.1 installed, you can now start creating high-performance applications that run seamlessly across multiple platforms. If you’re ready for a more cutting-edge experience, consider exploring .NET 6 or later versions once your project’s requirements align.
