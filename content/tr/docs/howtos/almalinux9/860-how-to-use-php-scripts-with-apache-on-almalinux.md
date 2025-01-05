---
title: How to Use PHP Scripts with Apache on AlmaLinux
linkTitle: PHP Scripts with Apache
description: In this detailed guide, we’ll walk you through the steps to set up Apache and PHP on AlmaLinux, configure PHP scripts, and optimize your environment.
date: 2024-12-14
weight: 860
url: php-scripts-apache-almalinux
draft: false
tags:
   - AlmaLinux
   - apache
   - php scripts
categories:
   - Linux
   - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
PHP (Hypertext Preprocessor) is one of the most popular server-side scripting languages for building dynamic web applications. Its ease of use, extensive library support, and ability to integrate with various databases make it a preferred choice for developers. Pairing PHP with Apache on AlmaLinux creates a robust environment for hosting websites and applications.

In this detailed guide, we’ll walk you through the steps to set up Apache and PHP on AlmaLinux, configure PHP scripts, and optimize your environment for development or production.

---

### **Why Use PHP with Apache on AlmaLinux?**

The combination of PHP, Apache, and AlmaLinux offers several advantages:

1. **Enterprise Stability**: AlmaLinux is a free, open-source, enterprise-grade Linux distribution.
2. **Ease of Integration**: Apache and PHP are designed to work seamlessly together.
3. **Versatility**: PHP supports a wide range of use cases, from simple scripts to complex content management systems like WordPress.
4. **Scalability**: PHP can handle everything from small personal projects to large-scale applications.

---

### **Prerequisites**

Before you begin, ensure you have the following:

1. **A Server Running AlmaLinux**  
   With root or `sudo` access.

2. **Apache Installed and Running**  
   If Apache is not installed, you can set it up using:

   ```bash
   sudo dnf install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **PHP Installed**  
   We’ll cover PHP installation in the steps below.

4. **Basic Command-Line Knowledge**  
   Familiarity with Linux commands and text editors like `nano` or `vim`.

---

### **Step 1: Install PHP on AlmaLinux**

1. **Enable the EPEL and Remi Repositories**  
   AlmaLinux’s default repositories may not have the latest PHP version. Install the `epel-release` and `remi-release` repositories:

   ```bash
   sudo dnf install epel-release -y
   sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
   ```

2. **Select and Enable the Desired PHP Version**  
   Use `dnf` to list available PHP versions:

   ```bash
   sudo dnf module list php
   ```

   Enable the desired version (e.g., PHP 8.1):

   ```bash
   sudo dnf module reset php -y
   sudo dnf module enable php:8.1 -y
   ```

3. **Install PHP and Common Extensions**  
   Install PHP along with commonly used extensions:

   ```bash
   sudo dnf install php php-mysqlnd php-cli php-common php-opcache php-gd php-curl php-zip php-mbstring php-xml -y
   ```

4. **Verify the PHP Installation**  
   Check the installed PHP version:

   ```bash
   php -v
   ```

---

### **Step 2: Configure Apache to Use PHP**

1. **Ensure PHP is Loaded in Apache**  
   The `mod_php` module should load PHP within Apache automatically. Verify this by checking the Apache configuration:

   ```bash
   httpd -M | grep php
   ```

   If `php_module` is listed, PHP is properly loaded.

2. **Edit Apache’s Configuration File (Optional)**  
   In most cases, PHP will work out of the box with Apache. However, to manually ensure proper configuration, edit the Apache configuration:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

   Add the following directives to handle PHP files:

   ```apache
   <FilesMatch \.php$>
       SetHandler application/x-httpd-php
   </FilesMatch>
   ```

3. **Restart Apache**  
   Apply the changes by restarting the Apache service:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 3: Test PHP with Apache**

1. **Create a Test PHP File**  
   Place a simple PHP script in the Apache document root:

   ```bash
   sudo nano /var/www/html/info.php
   ```

   Add the following content:

   ```php
   <?php
   phpinfo();
   ?>
   ```

2. **Access the Test Script in a Browser**  
   Open your browser and navigate to:

   ```html
   http://<your-server-ip>/info.php
   ```

   You should see a page displaying detailed PHP configuration information, confirming that PHP is working with Apache.

3. **Remove the Test File**  
   For security reasons, delete the test file once you’ve verified PHP is working:

   ```bash
   sudo rm /var/www/html/info.php
   ```

---

### **Step 4: Configure PHP Settings**

PHP’s behavior can be customized by editing the `php.ini` configuration file.

1. **Locate the PHP Configuration File**  
   Identify the active `php.ini` file:

   ```bash
   php --ini
   ```

   Typically, it’s located at `/etc/php.ini`.

2. **Edit PHP Settings**  
   Open the file for editing:

   ```bash
   sudo nano /etc/php.ini
   ```

   Common settings to adjust include:
   - **Memory Limit**:  
     Increase for resource-intensive applications:

     ```ini
     memory_limit = 256M
     ```

   - **Max Upload File Size**:  
     Allow larger file uploads:

     ```ini
     upload_max_filesize = 50M
     ```

   - **Max Execution Time**:  
     Prevent scripts from timing out prematurely:

     ```ini
     max_execution_time = 300
     ```

3. **Restart Apache**  
   Restart Apache to apply the changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 5: Deploy PHP Scripts**

With PHP and Apache configured, you can now deploy your PHP applications or scripts.

1. **Place Your Files in the Document Root**  
   By default, the Apache document root is `/var/www/html`. Upload your PHP scripts or applications to this directory:

   ```bash
   sudo cp -r /path/to/your/php-app /var/www/html/
   ```

2. **Set Proper Permissions**  
   Ensure the `apache` user owns the files:

   ```bash
   sudo chown -R apache:apache /var/www/html/php-app
   sudo chmod -R 755 /var/www/html/php-app
   ```

3. **Access the Application**  
   Navigate to the application URL:

   ```html
   http://<your-server-ip>/php-app
   ```

---

### **Step 6: Secure Your PHP and Apache Setup**

1. **Disable Directory Listing**  
   Prevent users from viewing the contents of directories by editing Apache’s configuration:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

   Add or modify the `Options` directive:

   ```apache
   <Directory /var/www/html>
       Options -Indexes
   </Directory>
   ```

   Restart Apache:

   ```bash
   sudo systemctl restart httpd
   ```

2. **Limit PHP Information Exposure**  
   Prevent sensitive information from being displayed by disabling `expose_php` in `php.ini`:

   ```ini
   expose_php = Off
   ```

3. **Set File Permissions Carefully**  
   Ensure only authorized users can modify PHP scripts and configuration files.

4. **Use HTTPS**  
   Secure your server with SSL/TLS encryption. Install and configure a Let’s Encrypt SSL certificate:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   sudo certbot --apache
   ```

5. **Keep PHP and Apache Updated**  
   Regularly update your packages to patch vulnerabilities:

   ```bash
   sudo dnf update -y
   ```

---

### **Step 7: Troubleshooting Common Issues**

1. **PHP Script Downloads Instead of Executing**  
   - Ensure `php_module` is loaded:

     ```bash
     httpd -M | grep php
     ```

   - Verify the `SetHandler` directive is configured for `.php` files.

2. **500 Internal Server Error**  
   - Check the Apache error log for details:

     ```bash
     sudo tail -f /var/log/httpd/error_log
     ```

   - Ensure proper file permissions and ownership.

3. **Changes in `php.ini` Not Reflected**  
   Restart Apache after modifying `php.ini`:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Conclusion**

Using PHP scripts with Apache on AlmaLinux is a straightforward and efficient way to create dynamic web applications. With its powerful scripting capabilities and compatibility with various databases, PHP remains a vital tool for developers.

By following this guide, you’ve configured Apache and PHP, deployed your first scripts, and implemented key security measures. Whether you’re building a simple contact form, a blog, or a complex web application, your server is now ready to handle PHP-based projects. Happy coding!
