---
title: "How to Install Laravel on AlmaLinux: A Step-by-Step Guide"
linkTitle: Install Laravel
description: If you're looking to set up Laravel on AlmaLinux, this guide will take you through the process step-by-step.
date: 2025-01-08T11:03:30.306Z
weight: 1750
url: install-laravel-almalinux-step-step-guide
translationKey: install-laravel-almalinux-step-step-guide
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - laravel
featured_image: /images/almalinux.webp
---
Laravel is one of the most popular PHP frameworks, known for its elegant syntax, scalability, and robust features for building modern web applications. AlmaLinux, a community-driven Linux distribution designed to be an alternative to CentOS, is a perfect server environment for hosting Laravel applications due to its stability and security. If you're looking to set up Laravel on AlmaLinux, this guide will take you through the process step-by-step.

---

### **Table of Contents**

1. Prerequisites
2. Step 1: Update Your System
3. Step 2: Install Apache (or Nginx) and PHP
4. Step 3: Install Composer
5. Step 4: Install MySQL (or MariaDB)
6. Step 5: Download and Set Up Laravel
7. Step 6: Configure Apache or Nginx for Laravel
8. Step 7: Verify Laravel Installation
9. Conclusion

---

### **Prerequisites**

Before diving into the installation process, ensure you have the following:

- A server running **AlmaLinux**.
- **Root or sudo privileges** to execute administrative commands.
- A basic understanding of the Linux command line.
- PHP version 8.0 or later (required by Laravel).
- Composer (a dependency manager for PHP).
- A database such as MySQL or MariaDB for your Laravel application.

---

### **Step 1: Update Your System**

Begin by ensuring your system is up-to-date. Open the terminal and run the following commands:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

This ensures you have the latest security patches and software updates.

---

### **Step 2: Install Apache (or Nginx) and PHP**

Laravel requires a web server and PHP to function. Apache is a common choice for hosting Laravel, but you can also use Nginx if preferred. For simplicity, we'll focus on Apache here.

#### Install Apache

```bash
sudo dnf install httpd -y
```

Start and enable Apache to ensure it runs on boot:

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

#### Install PHP

Laravel requires PHP 8.0 or later. Install PHP and its required extensions:

```bash
sudo dnf install php php-cli php-common php-mysqlnd php-xml php-mbstring php-json php-tokenizer php-curl php-zip -y
```

After installation, check the PHP version:

```bash
php -v
```

You should see something like:

```
PHP 8.0.x (cli) (built: ...)
```

Restart Apache to load PHP modules:

```bash
sudo systemctl restart httpd
```

---

### **Step 3: Install Composer**

Composer is a crucial dependency manager for PHP and is required to install Laravel.

1. Download the Composer installer:

   ```bash
   php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
   ```

2. Verify the installer integrity:

   ```bash
   php -r "if (hash_file('sha384', 'composer-setup.php') === 'HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
   ```

   Replace `HASH` with the latest hash from the [Composer website](https://getcomposer.org/download/).

3. Install Composer globally:

   ```bash
   sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
   ```

4. Check Composer installation:

   ```bash
   composer --version
   ```

---

### **Step 4: Install MySQL (or MariaDB)**

Laravel requires a database for storing application data. Install MariaDB (a popular MySQL fork) as follows:

1. Install MariaDB:

   ```bash
   sudo dnf install mariadb-server -y
   ```

2. Start and enable the service:

   ```bash
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   ```

3. Secure the installation:

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set a root password, remove anonymous users, disallow remote root login, and remove the test database.

4. Log in to MariaDB to create a Laravel database:

   ```bash
   sudo mysql -u root -p
   ```

   Run the following commands:

   ```sql
   CREATE DATABASE laravel_db;
   CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 'password';
   GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   ```

---

### **Step 5: Download and Set Up Laravel**

1. Navigate to your Apache document root (or create a directory for Laravel):

   ```bash
   cd /var/www
   sudo mkdir laravel-app
   cd laravel-app
   ```

2. Use Composer to create a new Laravel project:

   ```bash
   composer create-project --prefer-dist laravel/laravel .
   ```

3. Set the correct permissions for Laravel:

   ```bash
   sudo chown -R apache:apache /var/www/laravel-app
   sudo chmod -R 775 /var/www/laravel-app/storage /var/www/laravel-app/bootstrap/cache
   ```

---

### **Step 6: Configure Apache for Laravel**

Laravel uses the `/public` directory as its document root. Configure Apache to serve Laravel:

1. Create a new virtual host configuration file:

   ```bash
   sudo nano /etc/httpd/conf.d/laravel-app.conf
   ```

2. Add the following configuration:

   ```apache
   <VirtualHost *:80>
       ServerName yourdomain.com
       DocumentRoot /var/www/laravel-app/public

       <Directory /var/www/laravel-app/public>
           AllowOverride All
           Require all granted
       </Directory>

       ErrorLog /var/log/httpd/laravel-app-error.log
       CustomLog /var/log/httpd/laravel-app-access.log combined
   </VirtualHost>
   ```

3. Save and exit the file, then enable mod_rewrite:

   ```bash
   sudo dnf install mod_rewrite -y
   sudo systemctl restart httpd
   ```

4. Test your configuration:

   ```bash
   sudo apachectl configtest
   ```

---

### **Step 7: Verify Laravel Installation**

Open your browser and navigate to your server's IP address or domain. You should see Laravel's default welcome page.

If you encounter issues, check the Apache logs:

```bash
sudo tail -f /var/log/httpd/laravel-app-error.log
```

---

### **Conclusion**

You have successfully installed Laravel on AlmaLinux! This setup provides a robust foundation for building your Laravel applications. From here, you can start developing your project, integrating APIs, configuring additional services, or deploying your application to production.

By following the steps outlined in this guide, you've not only set up Laravel but also gained insight into managing a Linux-based web server. With Laravel's rich ecosystem and AlmaLinux's stability, your development journey is set for success. Happy coding!
