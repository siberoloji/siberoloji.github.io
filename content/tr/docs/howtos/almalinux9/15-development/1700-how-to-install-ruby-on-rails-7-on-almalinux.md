---
title: How to Install Ruby on Rails 7 on AlmaLinux
linkTitle: Install Ruby on Rails 7
description: Learn how to install Ruby on Rails 7 on AlmaLinux with this step-by-step guide. Includes Ruby installation, Rails setup, and database configuration.
date: 2025-01-08T10:59:59.544Z
weight: 1700
url: install-ruby-rails-7-almalinux
translationKey: install-ruby-rails-7-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - ruby on rails
featured_image: /images/almalinux.webp
---
Ruby on Rails (commonly referred to as Rails) is a powerful, full-stack web application framework built on Ruby. It has gained immense popularity for its convention-over-configuration approach, enabling developers to build robust and scalable web applications quickly. Rails 7, the latest version of the framework, brings exciting new features like Hotwire integration, improved Active Record capabilities, and advanced JavaScript compatibility without requiring Node.js or Webpack by default.  

AlmaLinux, as a stable and reliable RHEL-based distribution, provides an excellent environment for hosting Ruby on Rails applications. This blog will guide you through the installation of Ruby on Rails 7 on AlmaLinux, ensuring that you can start developing your applications efficiently.  

---

## **Why Choose Ruby on Rails 7?**  

Ruby on Rails 7 introduces several cutting-edge features:  

1. **Hotwire Integration:** Real-time, server-driven updates without relying on heavy JavaScript libraries.  
2. **No Node.js Dependency (Optional):** Rails 7 embraces ESBuild and import maps, reducing reliance on Node.js for asset management.  
3. **Turbo and Stimulus:** Tools for building modern, dynamic frontends with minimal JavaScript.  
4. **Enhanced Active Record:** Improvements to database querying and handling.  
5. **Encryption Framework:** Built-in support for encryption, ensuring better security out of the box.  

By installing Rails 7, you gain access to these features, empowering your web development projects.  

---

## **Prerequisites**  

Before installing Ruby on Rails 7, make sure your AlmaLinux system is prepared:  

1. **Update Your System:**  

   ```bash
   sudo dnf update -y
   ```  

2. **Install Development Tools and Libraries:**  
   Rails relies on various libraries and tools. Install them using:  

   ```bash
   sudo dnf groupinstall "Development Tools" -y
   sudo dnf install -y gcc make openssl-devel readline-devel zlib-devel libffi-devel git curl sqlite sqlite-devel nodejs
   ```  

3. **Install a Database (Optional):**  
   Rails supports several databases like PostgreSQL and MySQL. If you plan to use PostgreSQL, install it using:  

   ```bash
   sudo dnf install -y postgresql postgresql-server postgresql-devel
   ```  

4. **Administrative Privileges:**  
   Ensure you have sudo or root access for system-level installations.  

---

## **Step 1: Install Ruby**  

Ruby on Rails requires Ruby to function. While AlmaLinux’s default repositories might not have the latest Ruby version, you can install it using one of the following methods:  

### **Option 1: Install Ruby Using RVM**  

1. Install RVM:  

   ```bash
   sudo dnf install -y curl gnupg tar
   curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
   curl -sSL https://get.rvm.io | bash -s stable
   source ~/.rvm/scripts/rvm
   ```  

2. Install Ruby:  

   ```bash
   rvm install 3.1.0
   rvm use 3.1.0 --default
   ```  

3. Verify Ruby Installation:  

   ```bash
   ruby --version
   ```  

### **Option 2: Install Ruby Using rbenv**  

1. Clone rbenv and ruby-build:  

   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```  

2. Add rbenv to your PATH:  

   ```bash
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```  

3. Install Ruby:  

   ```bash
   rbenv install 3.1.0
   rbenv global 3.1.0
   ```  

4. Verify Ruby Installation:  

   ```bash
   ruby --version
   ```  

---

## **Step 2: Install RubyGems and Bundler**  

RubyGems is the package manager for Ruby, and Bundler is a tool for managing application dependencies. Both are essential for Rails development.  

1. Install Bundler:  

   ```bash
   gem install bundler
   ```  

2. Verify Bundler Installation:  

   ```bash
   bundler --version
   ```  

---

## **Step 3: Install Rails 7**  

With Ruby and Bundler installed, you can now install Rails 7:  

1. Install Rails:  

   ```bash
   gem install rails -v 7.0.0
   ```  

2. Verify Rails Installation:  

   ```bash
   rails --version
   ```  

   It should output `Rails 7.0.0` or a newer version, depending on updates.  

---

## **Step 4: Set Up a New Rails Application**  

Now that Rails is installed, create a new application to test the setup:  

### **Step 4.1: Install Node.js or ESBuild (Optional)**  

Rails 7 supports JavaScript-free applications using import maps. However, if you prefer a traditional setup, ensure Node.js is installed:  

```bash
sudo dnf install -y nodejs
```  

### **Step 4.2: Create a New Rails Application**  

Create a new Rails application named `myapp`:  

```bash
rails new myapp
```  

The `rails new` command will create a folder named `myapp` and set up all necessary files and directories.  

### **Step 4.3: Navigate to the Application Directory**  

```bash
cd myapp
```  

### **Step 4.4: Install Gems and Dependencies**  

Run Bundler to install the required gems:  

```bash
bundle install
```  

### **Step 4.5: Start the Rails Server**  

Start the Rails development server:  

```bash
rails server
```  

The server will start on `http://localhost:3000`.  

### **Step 4.6: Access Your Application**  

Open a web browser and navigate to `http://<your-server-ip>:3000` to see the Rails welcome page.  

---

## **Step 5: Database Configuration (Optional)**  

Rails supports various databases, and you may want to configure your application to use PostgreSQL or MySQL instead of the default SQLite.  

### **Example: PostgreSQL Setup**  

1. Install PostgreSQL:  

   ```bash
   sudo dnf install -y postgresql postgresql-server postgresql-devel
   ```  

2. Initialize and Start PostgreSQL:  

   ```bash
   sudo postgresql-setup --initdb
   sudo systemctl enable --now postgresql
   ```  

3. Update the `database.yml` file in your Rails project to use PostgreSQL:  

   ```yaml
   development:
     adapter: postgresql
     encoding: unicode
     database: myapp_development
     pool: 5
     username: your_postgres_user
     password: your_password
   ```  

4. Create the database:  

   ```bash
   rails db:create
   ```  

---

## **Step 6: Deploy Your Rails Application**  

Once your application is ready for deployment, consider using production-grade tools like **Puma**, **Nginx**, and **Passenger** for hosting. For a full-stack deployment, tools like **Capistrano** or **Docker** can streamline the process.  

---

## **Troubleshooting Common Issues**  

### **1. Missing Gems or Bundler Errors**  

Run the following to ensure all dependencies are installed:  

```bash
bundle install
```  

### **2. Port Access Issues**  

If you can’t access the Rails server, ensure that the firewall allows traffic on port 3000:  

```bash
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload
```  

### **3. Permission Errors**  

Ensure your user has sufficient privileges to access necessary files and directories. Use `sudo` if required.  

---

## **Conclusion**  

Installing Ruby on Rails 7 on AlmaLinux equips you with the latest tools and features for web development. With its streamlined asset management, improved Active Record, and enhanced JavaScript integration, Rails 7 empowers developers to build modern, high-performance applications efficiently.  

This guide covered everything from installing Ruby to setting up Rails and configuring a database. Now, you're ready to start your journey into Rails 7 development on AlmaLinux!  
