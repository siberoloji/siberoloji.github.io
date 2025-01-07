---
title: 
linkTitle: 
description: 
date: 
weight: 1670
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
# **How to Install the Latest Ruby Version on AlmaLinux**  

Ruby is a versatile, open-source programming language renowned for its simplicity and productivity. It powers popular frameworks like Ruby on Rails, making it a staple for developers building web applications. If you're using AlmaLinux, installing the latest version of Ruby ensures you have access to the newest features, performance improvements, and security updates.  

This guide will walk you through the process of installing the latest Ruby version on AlmaLinux. We'll cover multiple methods, allowing you to choose the one that best fits your needs and environment.

---

## **Why Install Ruby on AlmaLinux?**  

AlmaLinux, a popular Red Hat Enterprise Linux (RHEL) clone, provides a stable platform for deploying development environments. Ruby on AlmaLinux is essential for:  
- Developing Ruby applications.  
- Running Ruby-based frameworks like Rails.  
- Automating tasks with Ruby scripts.  
- Accessing Ruby's extensive library of gems (pre-built packages).  

Installing the latest version ensures compatibility with modern applications and libraries.  

---

## **Prerequisites**  

Before starting, make sure your system is prepared:  
1. **A running AlmaLinux system:** Ensure AlmaLinux is installed and up-to-date.  
   ```bash
   sudo dnf update -y
   ```  
2. **Sudo or root access:** Most commands in this guide require administrative privileges.  
3. **Development tools:** Some methods require essential development tools like `gcc` and `make`. Install them using:  
   ```bash
   sudo dnf groupinstall "Development Tools" -y
   ```  

---

## **Method 1: Installing Ruby Using AlmaLinux DNF Repository**  

AlmaLinux's default DNF repositories may not include the latest Ruby version, but they provide a stable option.  

### **Step 1: Install Ruby from DNF**  
Use the following command to install Ruby:  
```bash
sudo dnf install ruby -y
```  

### **Step 2: Verify the Installed Version**  
Check the installed Ruby version:  
```bash
ruby --version
```  
If you need the latest version, proceed to the other methods below.  

---

## **Method 2: Installing Ruby Using RVM (Ruby Version Manager)**  

**RVM** is a popular tool for managing multiple Ruby environments on the same system. It allows you to install and switch between Ruby versions effortlessly.  

### **Step 1: Install RVM**  

1. Install required dependencies:  
   ```bash
   sudo dnf install -y curl gnupg tar
   ```  

2. Import the GPG key and install RVM:  
   ```bash
   curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
   curl -sSL https://get.rvm.io | bash -s stable
   ```  

3. Load RVM into your shell session:  
   ```bash
   source ~/.rvm/scripts/rvm
   ```  

### **Step 2: Install Ruby with RVM**  
To install the latest Ruby version:  
```bash
rvm install ruby
```  

You can also specify a specific version:  
```bash
rvm install 3.2.0
```  

### **Step 3: Set the Default Ruby Version**  
Set the installed version as the default:  
```bash
rvm use ruby --default
```  

### **Step 4: Verify the Installation**  
Check the Ruby version:  
```bash
ruby --version
```  

---

## **Method 3: Installing Ruby Using rbenv**  

**rbenv** is another tool for managing Ruby versions. It's lightweight and straightforward, making it a good alternative to RVM.  

### **Step 1: Install rbenv and Dependencies**  

1. Install dependencies:  
   ```bash
   sudo dnf install -y git bzip2 gcc make openssl-devel readline-devel zlib-devel
   ```  

2. Clone rbenv from GitHub:  
   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   ```  

3. Add rbenv to your PATH:  
   ```bash
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```  

4. Install `ruby-build`:  
   ```bash
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```  

### **Step 2: Install Ruby Using rbenv**  
Install the latest Ruby version:  
```bash
rbenv install 3.2.0
```  

Set it as the global default version:  
```bash
rbenv global 3.2.0
```  

### **Step 3: Verify the Installation**  
Confirm the installed version:  
```bash
ruby --version
```  

---

## **Method 4: Compiling Ruby from Source**  

If you prefer complete control over the installation, compiling Ruby from source is an excellent option.  

### **Step 1: Install Dependencies**  
Install the necessary libraries and tools:  
```bash
sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel
```  

### **Step 2: Download Ruby Source Code**  
Visit the [Ruby Downloads Page](https://www.ruby-lang.org/en/downloads/) and download the latest stable version:  
```bash
curl -O https://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.0.tar.gz
```  

Extract the tarball:  
```bash
tar -xvzf ruby-3.2.0.tar.gz
cd ruby-3.2.0
```  

### **Step 3: Compile and Install Ruby**  
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

### **Step 4: Verify the Installation**  
Check the installed version:  
```bash
ruby --version
```  

---

## **Installing RubyGems and Bundler**  

Once Ruby is installed, you'll want to install **RubyGems** and **Bundler** for managing Ruby libraries and dependencies.  

### **Install Bundler**  
Bundler is a tool for managing gem dependencies:  
```bash
gem install bundler
```  
Verify the installation:  
```bash
bundler --version
```  

---

## **Testing Your Ruby Installation**  

Create a simple Ruby script to ensure your installation is working:  

1. Create a file called `test.rb`:  
   ```bash
   nano test.rb
   ```  

2. Add the following content:  
   ```ruby
   puts "Hello, Ruby on AlmaLinux!"
   ```  

3. Run the script:  
   ```bash
   ruby test.rb
   ```  
You should see:  
```plaintext
Hello, Ruby on AlmaLinux!
```  

---

## **Conclusion**  

Installing the latest Ruby version on AlmaLinux can be achieved through multiple methods, each tailored to different use cases. The DNF repository offers simplicity but may not always have the latest version. Tools like RVM and rbenv provide flexibility, while compiling Ruby from source offers complete control.  

With Ruby installed, you're ready to explore its vast ecosystem of gems, frameworks, and tools. Whether you're building web applications, automating tasks, or experimenting with programming, Ruby on AlmaLinux provides a robust foundation for your development needs.  

**Meta Title:** How to Install the Latest Ruby Version on AlmaLinux  
**Meta Description:** Learn how to install the latest Ruby version on AlmaLinux using DNF, RVM, rbenv, or by compiling from source. Step-by-step guide for developers.  