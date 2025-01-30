---
draft: false

title:  'AlmaLinux 9: How to Configure Apache (httpd) to Use PHP Scripts'
date: '2024-10-04T20:38:28+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-configure-apache-httpd-to-use-php-scripts/
 
featured_image: /images/apache-web-server.webp
categories:
    - 'Linux How-to'
tags:
    - 'apache web server'
    - 'how-to guides'
    - linux
    - 'linux how-to'
    - php
---
PHP is one of the most widely used server-side scripting languages for building dynamic websites and web applications. Running PHP scripts on an Apache web server is a common setup in the LAMP (Linux, Apache, MySQL, PHP) stack. AlmaLinux 9, a powerful and stable RHEL-based Linux distribution, is ideal for this setup.

In this detailed guide, we’ll cover how to configure Apache (`httpd`) on AlmaLinux 9 to use PHP scripts. This includes installing and configuring both Apache and PHP, verifying that they work together, and setting up some basic PHP scripts to test the configuration.
Table of Contents
* Introduction to PHP and Apache

* Prerequisites

* Step 1: Installing Apache and PHP on AlmaLinux 9

* Step 2: Configuring Apache to Use PHP

* Step 3: Testing PHP with Apache

* Step 4: Configuring PHP for Optimal Performance

* Step 5: Securing Your PHP Installation

* Conclusion

## 1. Introduction to PHP and Apache

Apache, also known as `httpd`, is one of the most popular web servers in the world, and PHP is a highly versatile scripting language that can be embedded into HTML. When these two technologies are combined, Apache serves the web pages while PHP processes any server-side scripts within them.

Configuring Apache to use PHP scripts involves installing both Apache and PHP, ensuring that Apache recognizes and properly executes PHP scripts, and adjusting configurations to ensure secure and efficient operation.

In this tutorial, we’ll guide you step by step to set up and configure Apache to use PHP scripts on AlmaLinux 9.
## 2. Prerequisites

Before you start, make sure you meet the following requirements:
* **AlmaLinux 9** installed on your system.

* **Root or sudo access** to configure Apache and PHP.

* A basic understanding of how to use the Linux terminal.

## 3. Step 1: Installing Apache and PHP on AlmaLinux 9

The first step in configuring Apache to use PHP is to install both Apache and PHP. These packages are available in the AlmaLinux 9 repository and can be installed using the `dnf` package manager.

Install Apache

To install Apache, run the following command:
```bash
sudo dnf install httpd
```

After installation, enable and start the Apache service:
```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

You can verify that Apache is running with this command:
```bash
sudo systemctl status httpd
```

Install PHP

Next, install PHP along with some common PHP extensions. The basic PHP package includes the core functionality, but many applications and frameworks require additional extensions. You can install PHP and its commonly used extensions using the following command:
```bash
sudo dnf install php php-mysqlnd php-pdo php-gd php-mbstring php-xml php-json
```

Here’s a breakdown of the PHP packages installed:
* **php**: The core PHP package.

* **php-mysqlnd**: The MySQL driver for PHP.

* **php-pdo**: The PHP Data Objects (PDO) extension.

* **php-gd**: PHP support for image processing.

* **php-mbstring**: Provides multibyte string support in PHP.

* **php-xml**: PHP support for XML processing.

* **php-json**: PHP support for working with JSON data.
Once PHP is installed, restart the Apache service to load the PHP module:
```bash
sudo systemctl restart httpd
```
## 4. Step 2: Configuring Apache to Use PHP

Once Apache and PHP are installed, you need to configure Apache to handle PHP files correctly. This is done by ensuring that Apache can recognize PHP files, pass them to the PHP interpreter, and then return the output to the client (browser).

Check PHP Module for Apache

The PHP module should have been installed and enabled automatically with the `php` package. You can confirm that PHP support is loaded by checking the Apache configuration files.

Open the Apache configuration file located at `/etc/httpd/conf/httpd.conf` to check for PHP module configuration:
```bash
sudo nano /etc/httpd/conf/httpd.conf```

Ensure that the following lines exist in the file:
```bash
LoadModule php_module modules/libphp.so
AddHandler php-script .php
DirectoryIndex index.php index.html
```

These lines ensure that Apache loads the PHP module and treats files with the `.php` extension as PHP scripts.

Test the PHP Configuration

To verify that PHP is properly integrated with Apache, create a simple PHP file in the web root directory. The default document root for Apache on AlmaLinux is `/var/www/html`.

Create a PHP test file:
```bash
sudo nano /var/www/html/info.php
```

Add the following PHP code to the file:
```bash
<?php
phpinfo();
?>
```

This script will display detailed information about your PHP installation.

Save and close the file, then open a web browser and navigate to the following URL:
```bash
http://your-server-ip/info.php
```

You should see a PHP information page showing details about your PHP installation, including loaded modules, configuration settings, and environment variables. If this page loads, it means PHP is working correctly with Apache.
## 5. Step 3: Testing PHP with Apache

To further confirm that PHP is working with Apache, you can create another PHP script that outputs dynamic content.

Create another PHP file in the document root:
```bash
sudo nano /var/www/html/test.php
```

Add the following PHP code:
```bash
<?php
echo "Hello, AlmaLinux! PHP is working on Apache.";
?>
```

Save the file and access it in your browser at:
```bash
http://your-server-ip/test.php
```

If the PHP script works correctly, you should see the message: "Hello, AlmaLinux! PHP is working on Apache."
## 6. Step 4: Configuring PHP for Optimal Performance

Now that PHP is functioning, it’s important to configure it for optimal performance. AlmaLinux uses PHP 7 or later, which includes several improvements in performance and memory usage, but there are still a few settings you can adjust to get the most out of your server.

Adjust PHP Settings

The PHP configuration file is located at `/etc/php.ini`. Open this file in a text editor:
```bash
sudo nano /etc/php.ini```

Here are some important PHP settings you may want to tweak:
* **Memory Limit**: Defines the maximum amount of memory a PHP script is allowed to use. You can increase this value based on your server resources. For example:

```bash
  memory_limit = 256m
```
* **Upload File Size**: Defines the maximum allowed size for file uploads. If you’re running applications that handle file uploads, such as a CMS, you may need to increase this value:

```bash
  upload_max_filesize = 20M
  post_max_size = 20m
```
* **Max Execution Time**: Specifies the maximum time in seconds a PHP script is allowed to run before it is terminated. This can help prevent poorly written scripts from using up server resources:

```bash
  max_execution_time = 60```

After making any changes, save the file and restart Apache:
```bash
sudo systemctl restart httpd
```

Opcode Caching

PHP includes a built-in **opcode cache** called **OPcache** that speeds up script execution by storing precompiled script bytecode in memory. To check if OPcache is enabled, look for it in the output of the `phpinfo()` function (from the `info.php` file we created earlier).

If it’s not enabled, you can enable it in the `/etc/php.d/10-opcache.ini` file. Set the following options to enable and configure OPcache:
```bash
opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60```

Restart Apache again to apply the changes:
```bash
sudo systemctl restart httpd
```
## 7. Step 5: Securing Your PHP Installation

Running PHP scripts can expose your server to potential vulnerabilities if not properly secured. Here are some tips to help secure your PHP environment:

Disable Unnecessary Functions

Many PHP installations enable potentially dangerous functions by default. These functions can be disabled to reduce the risk of exploitation. Open the `/etc/php.ini` file and find the `disable_functions` directive. Add the following functions to the list to disable them:
```bash
disable_functions = exec,passthru,shell_exec,system,proc_open,popen,curl_exec,curl_multi_exec```

This will prevent these functions from being used in PHP scripts.

Hide PHP Version

By default, PHP exposes its version number in HTTP headers and error messages. To disable this, set the following directive in `/etc/php.ini`:
```bash
expose_php = Off```

Enable Error Logging

Instead of displaying errors on web pages (which could expose sensitive information to attackers), log errors to a file:
```bash
log_errors = On
error_log = /var/log/php_errors.log```

Make sure the log file is only accessible by root:
```bash
sudo touch /var/log/php_errors.log
sudo chown root:root /var/log/php_errors.log
sudo chmod 600 /var/log/php_errors.log```
## 8. Conclusion

Configuring Apache to use PHP on AlmaLinux 9 is an essential step in setting up a powerful

web server capable of hosting dynamic web applications. In this guide, we covered how to install Apache and PHP, configure Apache to use PHP scripts, and optimize PHP for better performance and security.

With Apache and PHP working together, you’re ready to deploy web applications, content management systems like WordPress, or any custom PHP-based web project. Following the best practices in performance tuning and security will ensure that your server remains efficient and secure.

By completing these steps, you now have a fully functioning LAMP (Linux, Apache, MySQL, PHP) stack on AlmaLinux 9!
