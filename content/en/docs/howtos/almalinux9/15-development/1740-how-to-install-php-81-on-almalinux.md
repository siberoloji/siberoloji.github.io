---
title: 
linkTitle: 
description: 
date: 
weight: 0
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
# **How to Install PHP 8.1 on AlmaLinux**  

PHP 8.1 is one of the most significant updates in the PHP ecosystem, offering developers new features, enhanced performance, and improved security. With features such as enums, read-only properties, fibers, and intersection types, PHP 8.1 takes modern application development to the next level. AlmaLinux, an enterprise-grade Linux distribution, provides a stable platform for hosting PHP applications, making it an ideal choice for setting up PHP 8.1.  

This comprehensive guide will walk you through the steps to install PHP 8.1 on AlmaLinux, configure essential extensions, and ensure your environment is ready for modern PHP development.

---

## **Why Choose PHP 8.1?**  

PHP 8.1 introduces several noteworthy features and improvements:  
1. **Enums:** A powerful feature for managing constants more efficiently.  
2. **Fibers:** Simplifies asynchronous programming and enhances concurrency handling.  
3. **Read-Only Properties:** Ensures immutability for class properties.  
4. **Intersection Types:** Allows greater flexibility in type declarations.  
5. **Performance Boosts:** JIT improvements and better memory handling.  

These enhancements make PHP 8.1 an excellent choice for developers building scalable, high-performance applications.

---

## **Prerequisites**  

Before installing PHP 8.1, ensure the following prerequisites are met:  

1. **Update Your AlmaLinux System:**  
   ```bash
   sudo dnf update -y
   ```  

2. **Install Required Tools and Libraries:**  
   Install essential dependencies required by PHP:  
   ```bash
   sudo dnf install -y gcc libxml2 libxml2-devel curl curl-devel oniguruma oniguruma-devel
   ```  

3. **Administrative Access:**  
   Ensure you have root or sudo privileges to install and configure PHP.  

---

## **Step 1: Enable EPEL and Remi Repositories**  

PHP 8.1 is not included in AlmaLinux’s default repositories. You need to enable the **EPEL** (Extra Packages for Enterprise Linux) and **Remi** repositories to access updated PHP packages.  

### **1.1 Install the EPEL Repository**  
Install the EPEL repository:  
```bash
sudo dnf install -y epel-release
```  

### **1.2 Install the Remi Repository**  
Install the Remi repository, which provides PHP 8.1 packages:  
```bash
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
```  

### **1.3 Enable the PHP 8.1 Module**  
Reset any existing PHP modules and enable the PHP 8.1 module:  
```bash
sudo dnf module reset php -y
sudo dnf module enable php:remi-8.1 -y
```  

---

## **Step 2: Install PHP 8.1**  

Now that the repositories are set up, you can proceed with installing PHP 8.1.  

### **2.1 Install PHP 8.1 Core Package**  
Install the PHP 8.1 core package:  
```bash
sudo dnf install -y php
```  

### **2.2 Install Common PHP Extensions**  
Depending on your application, you may need additional PHP extensions. Here are some commonly used ones:  
```bash
sudo dnf install -y php-mysqlnd php-pdo php-mbstring php-xml php-curl php-json php-intl php-soap php-zip php-bcmath php-gd php-opcache
```  

### **2.3 Verify PHP Installation**  
Check the installed PHP version:  
```bash
php -v
```  
You should see output similar to:  
```plaintext
PHP 8.1.x (cli) (built: ...)
```  

---

## **Step 3: Configure PHP 8.1**  

Once PHP is installed, you may need to configure it according to your application’s requirements.  

### **3.1 Locate the PHP Configuration File**  
To locate the main `php.ini` file, use:  
```bash
php --ini
```  

### **3.2 Edit the PHP Configuration File**  
Open the `php.ini` file for editing:  
```bash
sudo nano /etc/php.ini
```  

Modify these common settings:  
- **Maximum Execution Time:**  
   ```ini
   max_execution_time = 300
   ```  
- **Memory Limit:**  
   ```ini
   memory_limit = 512M
   ```  
- **Upload File Size:**  
   ```ini
   upload_max_filesize = 50M
   post_max_size = 50M
   ```  

Save the changes and exit the editor.  

### **3.3 Restart the Web Server**  
After making changes to PHP settings, restart your web server to apply them:  
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

## **Step 4: Test PHP 8.1 Installation**  

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

### **4.2 Access the Test Page**  
Open a browser and navigate to:  
```
http://<your-server-ip>/info.php
```  
You should see a detailed PHP information page confirming the PHP 8.1 installation.  

### **4.3 Remove the Test File**  
For security reasons, delete the test file after verification:  
```bash
sudo rm /var/www/html/info.php
```  

---

## **Step 5: Install Composer (Optional)**  

Composer is a dependency manager for PHP and is essential for modern PHP development.  

### **5.1 Download and Install Composer**  
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
```  

### **5.2 Verify Installation**  
Check the Composer version:  
```bash
composer --version
```  

---

## **Step 6: Upgrade from Previous PHP Versions (Optional)**  

If you’re upgrading from PHP 7.x or 8.0 to PHP 8.1, follow these steps:  

1. **Backup Configuration and Applications:**  
   Create backups of your existing configurations and applications.  

2. **Switch to PHP 8.1 Module:**  
   ```bash
   sudo dnf module reset php -y
   sudo dnf module enable php:remi-8.1 -y
   sudo dnf install -y php
   ```  

3. **Verify Application Compatibility:**  
   Test your application in a staging environment to ensure compatibility with PHP 8.1.  

---

## **Step 7: Troubleshooting Common Issues**  

### **7.1 PHP Command Not Found**  
Ensure the PHP binary is in your system PATH:  
```bash
export PATH=$PATH:/usr/bin/php
```  

### **7.2 Missing Extensions**  
Install the required extensions from the Remi repository:  
```bash
sudo dnf install -y php-<extension-name>
```  

### **7.3 Web Server Issues**  
- Ensure PHP-FPM is running:  
   ```bash
   sudo systemctl status php-fpm
   ```  
- Restart your web server:  
   ```bash
   sudo systemctl restart httpd
   sudo systemctl restart php-fpm
   ```  

---

## **Conclusion**  

Installing PHP 8.1 on AlmaLinux equips your server with the latest features, performance enhancements, and security updates. This guide covered all the essential steps, from enabling the required repositories to configuring PHP settings and testing the installation.  

Whether you're developing web applications, hosting WordPress sites, or building APIs, PHP 8.1 ensures you have the tools to create high-performance and scalable solutions. Follow this guide to set up a robust environment for modern PHP development on AlmaLinux!  

---

**Meta Title:** How to Install PHP 8.1 on AlmaLinux  
**Meta Description:** Learn how to install PHP 8.1 on AlmaLinux with this detailed step-by-step guide. Includes configuration, testing, Composer installation, and troubleshooting.