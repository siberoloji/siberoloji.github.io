---
title: How to Use PHP Scripts with Nginx on AlmaLinux
linkTitle: Use PHP Scripts with Nginx
description: In this comprehensive guide, we will explore how to set up and use PHP scripts with Nginx on AlmaLinux.
date: 2024-12-18
weight: 1020
url: php-scripts-nginx-almalinux
draft: false
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
PHP remains one of the most popular server-side scripting languages, powering millions of websites and applications worldwide. When combined with Nginx, a high-performance web server, PHP scripts can be executed efficiently to deliver dynamic web content. AlmaLinux, a CentOS alternative built for stability and security, is an excellent foundation for hosting PHP-based websites and applications.

In this comprehensive guide, we will explore how to set up and use PHP scripts with Nginx on AlmaLinux. By the end, you’ll have a fully functional Nginx-PHP setup capable of serving PHP applications like WordPress, Laravel, or custom scripts.

---

## Prerequisites

Before diving into the setup, ensure you meet the following prerequisites:

1. **AlmaLinux server** with sudo/root access.
2. **Nginx installed and running.**
3. Familiarity with the Linux command line.
4. A domain name (optional) or the server’s IP address for testing.

---

## Step-by-Step Guide to Using PHP Scripts with Nginx on AlmaLinux

### Step 1: Update Your AlmaLinux System

Start by updating the system packages to ensure the latest software versions and security patches:

```bash
sudo dnf update -y
```

---

### Step 2: Install Nginx (If Not Installed)

If Nginx isn’t already installed, you can install it using:

```bash
sudo dnf install nginx -y
```

Once installed, start and enable the Nginx service:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

Verify that Nginx is running by visiting your server's IP address or domain in a web browser. The default Nginx welcome page should appear.

---

### Step 3: Install PHP and PHP-FPM

Nginx doesn’t process PHP scripts directly; instead, it relies on a FastCGI Process Manager (PHP-FPM) to handle PHP execution. Install PHP and PHP-FPM with the following command:

```bash
sudo dnf install php php-fpm php-cli php-mysqlnd -y
```

- **`php-fpm`**: Handles PHP script execution.
- **`php-cli`**: Allows running PHP scripts from the command line.
- **`php-mysqlnd`**: Adds MySQL support for PHP (useful for applications like WordPress).

---

### Step 4: Configure PHP-FPM

1. Open the PHP-FPM configuration file:

   ```bash
   sudo nano /etc/php-fpm.d/www.conf
   ```

2. Look for the following lines and make sure they are set as shown:

   ```plaintext
   user = nginx
   group = nginx
   listen = /run/php-fpm/www.sock
   listen.owner = nginx
   listen.group = nginx
   ```

   - This configuration ensures PHP-FPM uses a Unix socket (`/run/php-fpm/www.sock`) for communication with Nginx.

3. Save and exit the file, then restart PHP-FPM to apply the changes:

   ```bash
   sudo systemctl restart php-fpm
   sudo systemctl enable php-fpm
   ```

---

### Step 5: Configure Nginx to Use PHP

Now, you need to tell Nginx to pass PHP scripts to PHP-FPM for processing.

1. Open the Nginx server block configuration file. For the default site, edit:

   ```bash
   sudo nano /etc/nginx/conf.d/default.conf
   ```

2. Modify the server block to include the following:

   ```nginx
   server {
       listen 80;
       server_name your-domain.com www.your-domain.com; # Replace with your domain or server IP
       root /var/www/html;

       index index.php index.html index.htm;

       location / {
           try_files $uri $uri/ =404;
       }

       location ~ \.php$ {
           include fastcgi_params;
           fastcgi_pass unix:/run/php-fpm/www.sock;
           fastcgi_index index.php;
           fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       }

       location ~ /\.ht {
           deny all;
       }
   }
   ```

   - **`fastcgi_pass`**: Points to the PHP-FPM socket.
   - **`fastcgi_param SCRIPT_FILENAME`**: Tells PHP-FPM the full path of the script to execute.

3. Save and exit the file, then test the Nginx configuration:

   ```bash
   sudo nginx -t
   ```

4. If the test is successful, reload Nginx:

   ```bash
   sudo systemctl reload nginx
   ```

---

### Step 6: Add a Test PHP Script

Create a test PHP file to verify the setup:

1. Navigate to the web root directory:

   ```bash
   sudo mkdir -p /var/www/html
   ```

2. Create a `info.php` file:

   ```bash
   sudo nano /var/www/html/info.php
   ```

3. Add the following content:

   ```php
   <?php
   phpinfo();
   ?>
   ```

4. Save and exit the file, then adjust permissions to ensure Nginx can read the file:

   ```bash
   sudo chown -R nginx:nginx /var/www/html
   sudo chmod -R 755 /var/www/html
   ```

---

### Step 7: Test PHP Configuration

Open a browser and navigate to:

```html
http://your-domain.com/info.php
```

You should see a PHP information page displaying details about your PHP installation, server environment, and modules.

---

## Securing Your Setup

### 1. Remove the `info.php` File

The `info.php` file exposes sensitive information about your server and PHP setup. Remove it after verifying your configuration:

```bash
sudo rm /var/www/html/info.php
```

---

### 2. Enable HTTPS

To secure your website, configure HTTPS using Let’s Encrypt. Install Certbot:

```bash
sudo dnf install certbot python3-certbot-nginx -y
```

Run Certbot to obtain and configure an SSL certificate:

```bash
sudo certbot --nginx -d your-domain.com -d www.your-domain.com
```

Certbot will automatically set up HTTPS in your Nginx configuration.

---

### 3. Restrict File Access

Prevent access to sensitive files like `.env` or `.htaccess` by adding rules in your Nginx configuration:

```nginx
location ~ /\.(?!well-known).* {
    deny all;
}
```

---

### 4. Optimize PHP Settings

To improve performance and security, edit the PHP configuration file:

```bash
sudo nano /etc/php.ini
```

- Set `display_errors = Off` to prevent error messages from showing on the frontend.
- Adjust `upload_max_filesize` and `post_max_size` for file uploads, if needed.
- Set a reasonable value for `max_execution_time` to avoid long-running scripts.

Restart PHP-FPM to apply changes:

```bash
sudo systemctl restart php-fpm
```

---

## Troubleshooting Common Issues

### 1. PHP Not Executing, Showing as Plain Text

- Ensure the `location ~ \.php$` block is correctly configured in your Nginx file.
- Check that PHP-FPM is running:

  ```bash
  sudo systemctl status php-fpm
  ```

### 2. Nginx Fails to Start or Reload

- Test the configuration for syntax errors:

  ```bash
  sudo nginx -t
  ```

- Check the logs for details:

  ```bash
  sudo tail -f /var/log/nginx/error.log
  ```

### 3. 403 Forbidden Error

- Ensure the PHP script and its directory have the correct ownership and permissions.
- Verify the `root` directive in your Nginx configuration points to the correct directory.

---

## Conclusion

Using PHP scripts with Nginx on AlmaLinux provides a powerful, efficient, and flexible setup for hosting dynamic websites and applications. By combining Nginx’s high performance with PHP’s versatility, you can run everything from simple scripts to complex frameworks like WordPress, Laravel, or Symfony.

With proper configuration, security measures, and optimization, your server will be ready to handle PHP-based applications reliably and efficiently. Whether you’re running a personal blog or a business-critical application, this guide provides the foundation for a robust PHP-Nginx setup on AlmaLinux.
