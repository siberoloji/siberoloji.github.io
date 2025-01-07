---
title: 
linkTitle: 
description: 
date: 
weight: 1690
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
# **How to Install Ruby 3.1 on AlmaLinux**  

Ruby 3.1 is a robust and efficient programming language release that builds on the enhancements introduced in Ruby 3.0. With improved performance, new features, and extended capabilities, it’s an excellent choice for developers creating web applications, scripts, or other software. AlmaLinux, a stable and enterprise-grade Linux distribution, provides an ideal environment for hosting Ruby applications.  

In this guide, you’ll learn step-by-step how to install Ruby 3.1 on AlmaLinux, covering multiple installation methods to suit your preferences and requirements.  

---

## **Why Install Ruby 3.1?**  

Ruby 3.1 includes significant improvements and updates:  
1. **Performance Improvements:** Ruby 3.1 continues the 3x speedup goal ("Ruby 3x3") with faster execution and reduced memory usage.  
2. **Enhanced Ractor API:** Further refinements to Ractor, allowing safer and easier parallel execution.  
3. **Improved Error Handling:** Enhanced error messages and diagnostics for debugging.  
4. **New Features:** Additions like keyword argument consistency and extended gem support.  

Upgrading to Ruby 3.1 ensures compatibility with the latest libraries and provides a solid foundation for your applications.  

---

## **Prerequisites**  

Before starting, ensure the following:  

1. **Update AlmaLinux System:**  
   Update all system packages to avoid compatibility issues.  
   ```bash
   sudo dnf update -y
   ```  

2. **Install Development Tools:**  
   Ruby requires certain tools and libraries for compilation. Install them using:  
   ```bash
   sudo dnf groupinstall "Development Tools" -y
   sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel
   ```  

3. **Administrative Privileges:**  
   Ensure you have sudo or root access to execute system-level changes.  

---

## **Methods to Install Ruby 3.1 on AlmaLinux**  

### **Method 1: Using RVM (Ruby Version Manager)**  

RVM is a popular tool for managing Ruby versions and environments. It allows you to install Ruby 3.1 easily and switch between multiple Ruby versions.  

#### **Step 1: Install RVM**  
1. Install prerequisites:  
   ```bash
   sudo dnf install -y curl gnupg tar
   ```  

2. Import the RVM GPG key and install RVM:  
   ```bash
   curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
   curl -sSL https://get.rvm.io | bash -s stable
   ```  

3. Load RVM into the current session:  
   ```bash
   source ~/.rvm/scripts/rvm
   ```  

#### **Step 2: Install Ruby 3.1 with RVM**  
To install Ruby 3.1:  
```bash
rvm install 3.1
```  

Set Ruby 3.1 as the default version:  
```bash
rvm use 3.1 --default
```  

#### **Step 3: Verify Installation**  
Check the installed Ruby version:  
```bash
ruby --version
```  
You should see output indicating version `3.1.x`.  

---

### **Method 2: Using rbenv**  

rbenv is another tool for managing multiple Ruby versions. It is lightweight and provides a straightforward way to install and switch Ruby versions.  

#### **Step 1: Install rbenv and Dependencies**  
1. Clone rbenv from GitHub:  
   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   ```  

2. Add rbenv to your PATH:  
   ```bash
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```  

3. Install `ruby-build`:  
   ```bash
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```  

#### **Step 2: Install Ruby 3.1 with rbenv**  
1. Install Ruby 3.1:  
   ```bash
   rbenv install 3.1.0
   ```  

2. Set Ruby 3.1 as the global version:  
   ```bash
   rbenv global 3.1.0
   ```  

#### **Step 3: Verify Installation**  
Check the installed Ruby version:  
```bash
ruby --version
```  

---

### **Method 3: Installing Ruby 3.1 from Source**  

Compiling Ruby from source gives you full control over the installation process.  

#### **Step 1: Download Ruby Source Code**  
Download the Ruby 3.1 source code from the official [Ruby Downloads Page](https://www.ruby-lang.org/en/downloads/):  
```bash
curl -O https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.0.tar.gz
```  

Extract the downloaded archive:  
```bash
tar -xvzf ruby-3.1.0.tar.gz
cd ruby-3.1.0
```  

#### **Step 2: Compile and Install Ruby**  
1. Configure the build:  
   ```bash
   ./configure
   ```  

2. Compile Ruby:  
   ```bash
   make
   ```  

3. Install Ruby:  
   ```bash
   sudo make install
   ```  

#### **Step 3: Verify Installation**  
Check the Ruby version:  
```bash
ruby --version
```  

---

## **Post-Installation Setup**  

### **Install Bundler**  
Bundler is a Ruby gem used for managing application dependencies. Install it using:  
```bash
gem install bundler
```  
Verify Bundler installation:  
```bash
bundler --version
```  

### **Test Ruby Installation**  
To confirm Ruby is working correctly, create a simple script:  

1. Create a file named `test.rb`:  
   ```bash
   nano test.rb
   ```  

2. Add the following code:  
   ```ruby
   puts "Ruby 3.1 is successfully installed on AlmaLinux!"
   ```  

3. Run the script:  
   ```bash
   ruby test.rb
   ```  
You should see the output:  
```plaintext
Ruby 3.1 is successfully installed on AlmaLinux!
```  

---

## **Troubleshooting Common Issues**  

### **Command Not Found**  
Ensure Ruby binaries are in your system PATH. For RVM or rbenv, reinitialize the shell:  
```bash
source ~/.bashrc
```  

### **Missing Libraries**  
If Ruby installation fails, ensure all dependencies are installed:  
```bash
sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel
```  

### **Permission Errors**  
Use `sudo` for system-wide installations or ensure your user has the necessary permissions.  

---

## **Conclusion**  

Installing Ruby 3.1 on AlmaLinux is straightforward and provides access to the latest features and improvements in the Ruby programming language. Whether you use RVM, rbenv, or compile from source, you can have a reliable Ruby environment tailored to your needs.  

With Ruby 3.1 installed, you can start developing modern applications, exploring Ruby gems, and leveraging frameworks like Ruby on Rails. Happy coding!  

---

**Meta Title:** How to Install Ruby 3.1 on AlmaLinux  
**Meta Description:** Step-by-step guide to installing Ruby 3.1 on AlmaLinux using RVM, rbenv, or source compilation. Perfect for developers seeking modern Ruby features.
