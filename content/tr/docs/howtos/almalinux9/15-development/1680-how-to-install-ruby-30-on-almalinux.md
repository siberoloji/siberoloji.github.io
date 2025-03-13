---
title: How to Install Ruby 3.0 on AlmaLinux
linkTitle: Install Ruby 3.0
description: Learn step-by-step how to install Ruby 3.0 on AlmaLinux using RVM, rbenv, or source compilation. Perfect for developers seeking the latest Ruby features.
date: 2025-01-08T10:44:54.833Z
weight: 1680
url: install-ruby-3-0-almalinux
translationKey: install-ruby-3-0-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - install ruby
featured_image: /images/almalinux.webp
---
Ruby 3.0, released as a major update to the Ruby programming language, brings significant improvements in performance, features, and usability. It is particularly favored for its support of web development frameworks like Ruby on Rails and its robust library ecosystem. AlmaLinux, being a stable, enterprise-grade Linux distribution, is an excellent choice for running Ruby applications.

In this guide, we’ll cover step-by-step instructions on how to install Ruby 3.0 on AlmaLinux. By the end of this article, you'll have a fully functional Ruby 3.0 setup, ready for development.

---

## **Why Ruby 3.0?**  

Ruby 3.0 introduces several noteworthy enhancements:  

1. **Performance Boost:** Ruby 3.0 is up to 3 times faster than Ruby 2.x due to the introduction of the MJIT (Method-based Just-in-Time) compiler.  
2. **Ractor:** A new actor-based parallel execution feature for writing thread-safe concurrent programs.  
3. **Static Analysis:** Improved static analysis features for identifying potential errors during development.  
4. **Improved Syntax:** Cleaner and more concise syntax for developers.  

By installing Ruby 3.0, you ensure that your applications benefit from these modern features and performance improvements.  

---

## **Prerequisites**  

Before installing Ruby 3.0, ensure the following:  

1. **Updated AlmaLinux System:**  
   Update your system packages to avoid conflicts.  

   ```bash
   sudo dnf update -y
   ```  

2. **Development Tools Installed:**  
   Ruby requires essential development tools for compilation. Install them using:  

   ```bash
   sudo dnf groupinstall "Development Tools" -y
   ```  

3. **Dependencies for Ruby:**  
   Ensure the required libraries are installed:  

   ```bash
   sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel
   ```  

---

## **Methods to Install Ruby 3.0 on AlmaLinux**  

There are multiple ways to install Ruby 3.0 on AlmaLinux. Choose the one that best suits your needs.  

---

### **Method 1: Using RVM (Ruby Version Manager)**  

RVM is a popular tool for managing Ruby versions and environments. It allows you to install Ruby 3.0 effortlessly.  

#### **Step 1: Install RVM**  

1. Install required dependencies for RVM:  

   ```bash
   sudo dnf install -y curl gnupg tar
   ```  

2. Import the RVM GPG key:  

   ```bash
   curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
   ```  

3. Install RVM:  

   ```bash
   curl -sSL https://get.rvm.io | bash -s stable
   ```  

4. Load RVM into your current shell session:  

   ```bash
   source ~/.rvm/scripts/rvm
   ```  

#### **Step 2: Install Ruby 3.0 with RVM**  

To install Ruby 3.0:  

```bash
rvm install 3.0
```  

Set Ruby 3.0 as the default version:  

```bash
rvm use 3.0 --default
```  

#### **Step 3: Verify the Installation**  

Check the installed Ruby version:  

```bash
ruby --version
```  

It should output a version starting with `3.0`.  

---

### **Method 2: Using rbenv**  

rbenv is another tool for managing Ruby installations. It is lightweight and designed to allow multiple Ruby versions to coexist.  

#### **Step 1: Install rbenv and Dependencies**  

1. Clone rbenv:  

   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   ```  

2. Add rbenv to your shell:  

   ```bash
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```  

3. Install `ruby-build`:  

   ```bash
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```  

#### **Step 2: Install Ruby 3.0 with rbenv**  

1. Install Ruby 3.0:  

   ```bash
   rbenv install 3.0.0
   ```  

2. Set Ruby 3.0 as the global version:  

   ```bash
   rbenv global 3.0.0
   ```  

#### **Step 3: Verify the Installation**  

Check the Ruby version:  

```bash
ruby --version
```  

---

### **Method 3: Installing Ruby 3.0 from Source**  

For complete control over the installation, compiling Ruby from source is a reliable option.  

#### **Step 1: Download Ruby Source Code**  

Visit the official [Ruby Downloads Page](https://www.ruby-lang.org/en/downloads/) to find the latest Ruby 3.0 version. Download it using:  

```bash
curl -O https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.gz
```  

Extract the tarball:  

```bash
tar -xvzf ruby-3.0.0.tar.gz
cd ruby-3.0.0
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

#### **Step 3: Verify the Installation**  

Check the Ruby version:  

```bash
ruby --version
```  

---

## **Post-Installation Steps**  

### **Install Bundler**  

Bundler is a Ruby tool for managing application dependencies. Install it using:  

```bash
gem install bundler
```  

Verify the installation:  

```bash
bundler --version
```  

### **Test the Ruby Installation**  

Create a simple Ruby script to test your setup:  

1. Create a file named `test.rb`:  

   ```bash
   nano test.rb
   ```  

2. Add the following code:  

   ```ruby
   puts "Ruby 3.0 is successfully installed on AlmaLinux!"
   ```  

3. Run the script:  

   ```bash
   ruby test.rb
   ```  

You should see:  

```plaintext
Ruby 3.0 is successfully installed on AlmaLinux!
```  

---

## **Troubleshooting Common Issues**  

### **Ruby Command Not Found**  

Ensure Ruby's binary directory is in your PATH. For RVM or rbenv, reinitialize your shell:  

```bash
source ~/.bashrc
```  

### **Library Errors**  

If you encounter missing library errors, recheck that all dependencies are installed:  

```bash
sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel
```  

### **Permission Denied Errors**  

Run the command with `sudo` or ensure your user has the necessary privileges.  

---

## **Conclusion**  

Installing Ruby 3.0 on AlmaLinux provides access to the latest performance enhancements, features, and tools that Ruby offers. Whether you choose to install Ruby using RVM, rbenv, or by compiling from source, each method ensures a robust development environment tailored to your needs.  

With Ruby 3.0 installed, you’re ready to build modern, high-performance applications. If you encounter issues, revisit the steps or consult the extensive Ruby documentation and community resources.  
