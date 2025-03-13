---
title: How to Install PHP 8.0 on AlmaLinux
linkTitle: Install PHP 8.0
description: Learn how to install PHP 8.0 on AlmaLinux with this step-by-step guide. Includes repository setup, configuration, extensions, and testing instructions.
date: 2025-01-08T10:51:53.447Z
weight: 1730
url: install-php-8-0-almalinux
translationKey: install-php-8-0-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - install php
featured_image: /images/almalinux.webp
---
PHP 8.0 is a significant release in the PHP ecosystem, offering new features, performance improvements, and security updates. It introduces features like the JIT (Just-In-Time) compiler, union types, attributes, and improved error handling. If you're using AlmaLinux, a stable and enterprise-grade Linux distribution, installing PHP 8.0 will provide a robust foundation for developing or hosting modern PHP applications.  

In this guide, we will walk you through the process of installing PHP 8.0 on AlmaLinux. Whether you’re setting up a new server or upgrading an existing PHP installation, this step-by-step guide will cover everything you need to know.  

---

## Why Choose PHP 8.0?  

PHP 8.0 offers several enhancements that make it a compelling choice for developers:  

1. **JIT Compiler:** Boosts performance for specific workloads by compiling code at runtime.  
2. **Union Types:** Allows a single parameter or return type to accept multiple types.  
3. **Attributes:** Provides metadata for functions, classes, and methods, replacing doc comments.  
4. **Named Arguments:** Improves readability and flexibility by allowing parameters to be passed by name.  
5. **Improved Error Handling:** Includes clearer exception messages and better debugging support.  

With these improvements, PHP 8.0 enhances both performance and developer productivity.  

---

## **Prerequisites**  

Before installing PHP 8.0, ensure the following prerequisites are met:  

1. **Update the AlmaLinux System:**  
   Ensure your system is up-to-date with the latest packages:  

   ```bash
   sudo dnf update -y
   ```  

2. **Install Required Tools:**  
   PHP depends on various tools and libraries. Install them using:  

   ```bash
   sudo dnf install -y gcc libxml2 libxml2-devel curl curl-devel oniguruma oniguruma-devel
   ```  

3. **Administrative Access:**  
   You need sudo or root privileges to install and configure PHP.  

---

## **Step 1: Enable EPEL and Remi Repositories**  

PHP 8.0 is not available in the default AlmaLinux repositories, so you’ll need to enable the **EPEL** (Extra Packages for Enterprise Linux) and **Remi** repositories, which provide updated PHP packages.  

### **1.1 Enable EPEL Repository**  

Install the EPEL repository:  

```bash
sudo dnf install -y epel-release
```  

### **1.2 Install Remi Repository**  

Install the Remi repository, which provides PHP 8.0 packages:  

```bash
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
```  

### **1.3 Enable the PHP 8.0 Module**  

Reset the default PHP module to ensure compatibility with PHP 8.0:  

```bash
sudo dnf module reset php -y
sudo dnf module enable php:remi-8.0 -y
```  

---

## **Step 2: Install PHP 8.0**  

Now that the necessary repositories are set up, you can install PHP 8.0.  

### **2.1 Install the PHP 8.0 Core Package**  

Install PHP and its core components:  

```bash
sudo dnf install -y php
```  

### **2.2 Install Additional PHP Extensions**  

Depending on your application requirements, you may need additional PHP extensions. Here are some commonly used extensions:  

```bash
sudo dnf install -y php-mysqlnd php-pdo php-mbstring php-xml php-curl php-json php-intl php-soap php-zip php-bcmath php-gd
```  

### **2.3 Verify the PHP Installation**  

Check the installed PHP version:  

```bash
php -v
```  

You should see output similar to:  

```plaintext
PHP 8.0.x (cli) (built: ...)
```  

---

## **Step 3: Configure PHP 8.0**  

Once installed, you’ll need to configure PHP 8.0 to suit your application and server requirements.  

### **3.1 Locate the PHP Configuration File**  

The main PHP configuration file is `php.ini`. Use the following command to locate it:  

```bash
php --ini
```  

### **3.2 Modify the Configuration**  

Edit the `php.ini` file to adjust settings like maximum file upload size, memory limits, and execution time.  

```bash
sudo nano /etc/php.ini
```  

Common settings to modify:  

- **Maximum Execution Time:**  

   ```ini
   max_execution_time = 300
   ```  

- **Memory Limit:**  

   ```ini
   memory_limit = 256M
   ```  

- **File Upload Size:**  

   ```ini
   upload_max_filesize = 50M
   post_max_size = 50M
   ```  

### **3.3 Restart the Web Server**  

Restart your web server to apply the changes:  

- For Apache:  

   ```bash
   sudo systemctl restart httpd
   ```  

- For Nginx with PHP-FPM:  

   ```bash
   sudo systemctl restart php-fpm
   sudo systemctl restart nginx
   ```  

---

## **Step 4: Test PHP 8.0 Installation**  

### **4.1 Create a PHP Info File**  

Create a simple PHP script to test the installation:  

```bash
sudo nano /var/www/html/info.php
```  

Add the following content:  

```php
<?php
phpinfo();
?>
```  

### **4.2 Access the Test File**  

Open your web browser and navigate to:  

```bash
http://<your-server-ip>/info.php
```  

You should see a detailed PHP information page confirming that PHP 8.0 is installed and configured.  

### **4.3 Remove the Test File**  

For security reasons, delete the test file after verification:  

```bash
sudo rm /var/www/html/info.php
```  

---

## **Step 5: Troubleshooting Common Issues**  

### **5.1 PHP Command Not Found**  

Ensure the PHP binary is in your PATH. If not, add it manually:  

```bash
export PATH=$PATH:/usr/bin/php
```  

### **5.2 PHP Extensions Missing**  

Install the required PHP extensions from the Remi repository:  

```bash
sudo dnf install -y php-<extension-name>
```  

### **5.3 Web Server Issues**  

If your web server cannot process PHP files:  

- Verify that PHP-FPM is running:  

   ```bash
   sudo systemctl status php-fpm
   ```  

- Restart your web server:  

   ```bash
   sudo systemctl restart httpd
   ```  

---

## **Step 6: Installing Composer (Optional)**  

**Composer** is a dependency manager for PHP that simplifies package management.  

### **6.1 Download Composer**  

Download and install Composer:  

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
```  

### **6.2 Verify Installation**  

Check the Composer version:  

```bash
composer --version
```  

---

## **Step 7: Upgrade from Previous PHP Versions (Optional)**  

If you’re upgrading from PHP 7.x, ensure compatibility with your applications by testing them in a staging environment. You may need to adjust deprecated functions or update frameworks like Laravel or WordPress to their latest versions.  

---

## **Conclusion**  

Installing PHP 8.0 on AlmaLinux enables you to take advantage of its improved performance, modern syntax, and robust features. Whether you're hosting a WordPress site, developing custom web applications, or running APIs, PHP 8.0 offers the tools needed to build fast and scalable solutions.  

By following this guide, you’ve successfully installed and configured PHP 8.0, added essential extensions, and verified the installation. With your setup complete, you’re ready to start developing or hosting modern PHP applications on AlmaLinux!  
