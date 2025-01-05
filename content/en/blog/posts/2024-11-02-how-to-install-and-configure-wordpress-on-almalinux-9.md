---
draft: false

title:  'How to Install and Configure WordPress on AlmaLinux 9'
date: '2024-11-02T15:03:52+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this guide, we''ll go through the steps needed to install and configure WordPress on AlmaLinux 9.' 
 
url:  /how-to-install-and-configure-wordpress-on-almalinux-9/
 
featured_image: /images/wordpress2.webp
categories:
    - 'Linux How-to'
tags:
    - 'linux how-to'
    - wordpress
---

If you're looking to set up a website on a reliable, enterprise-level Linux distribution, AlmaLinux 9 is an excellent choice. AlmaLinux is a free, open-source RHEL-based operating system that's popular for web hosting environments, making it a perfect fit for running WordPress.

In this guide, we'll go through the steps needed to install and configure WordPress on AlmaLinux 9. We’ll cover everything from preparing the server to installing the required software, setting up a database, and configuring WordPress for optimal performance and security.

---

## Prerequisites

Before we begin, make sure you have the following:

1. **A Server Running AlmaLinux 9** – This can be a virtual private server (VPS) or a dedicated server.
2. **Root Access or a User with Sudo Privileges** – You'll need administrative access to install and configure software.
3. **A Registered Domain Name** – While not required for initial setup, having a domain will help you fully configure your WordPress site.
4. **SSH Access** – This guide assumes you're connected to the server via SSH.

### Step 1: Update Your Server

To start, it’s a good idea to update your server packages to ensure compatibility and security.

```bash
sudo dnf update -y
```

This command updates all system packages and installs the latest security patches available.

---

## Step 2: Install Apache Web Server

Apache is a popular web server that works well with WordPress. To install it, run:

```bash
sudo dnf install httpd -y
```

Once installed, start Apache and enable it to run at system boot:

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

To confirm Apache is running, use the following command:

```bash
sudo systemctl status httpd
```

---

## Step 3: Install PHP

WordPress requires PHP to run. AlmaLinux 9 offers the latest stable PHP versions, and it’s recommended to use PHP 7.4 or above. Install PHP and its necessary extensions:

```bash
sudo dnf install php php-mysqlnd php-json php-xml php-gd php-mbstring -y
```

After installation, restart Apache to apply changes:

```bash
sudo systemctl restart httpd
```

To verify PHP was installed correctly, check the version:

```bash
php -v
```

---

## Step 4: Install MariaDB (MySQL)

MariaDB is a popular, open-source relational database management system that WordPress uses to store content. Install MariaDB with the following command:

```bash
sudo dnf install mariadb-server -y
```

Start and enable MariaDB to run on boot:

```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

Once started, secure the installation with this command:

```bash
sudo mysql_secure_installation
```

Follow the on-screen prompts to set a root password and remove anonymous users, disable remote root login, and remove test databases.

---

## Step 5: Create a Database and User for WordPress

Log in to MariaDB with the root account:

```bash
sudo mysql -u root -p
```

After entering the root password, you’ll be in the MariaDB shell. Run the following commands to create a database and a user for WordPress:

```sql
CREATE DATABASE wordpress_db;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Replace `wordpress_db` with the name of your database, `wordpress_user` with your desired username, and `strong_password` with a secure password.

---

## Step 6: Download and Configure WordPress

Navigate to the `/tmp` directory to download the latest WordPress package:

```bash
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
```

Extract the WordPress package:

```bash
tar -xzvf latest.tar.gz
```

Move the extracted files to your Apache web root directory:

```bash
sudo mv wordpress /var/www/html/
```

Set the appropriate permissions so Apache can read the files:

```bash
sudo chown -R apache:apache /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress
```

---

## Step 7: Configure WordPress

Navigate to the WordPress directory:

```bash
cd /var/www/html/wordpress
```

Copy the sample configuration file:

```bash
sudo cp wp-config-sample.php wp-config.php
```

Open the configuration file to set your database details:

```bash
sudo nano wp-config.php
```

Locate the following lines and replace them with your database information:

```php
define('DB_NAME', 'wordpress_db');
define('DB_USER', 'wordpress_user');
define('DB_PASSWORD', 'strong_password');
define('DB_HOST', 'localhost');
```

Save and close the file by pressing `CTRL + X`, then `Y`, and `Enter`.

---

## Step 8: Configure Apache for WordPress

To make your WordPress site accessible, create a new Apache configuration file:

```bash
sudo nano /etc/httpd/conf.d/wordpress.conf
```

Paste the following configuration into the file:

```apache
<VirtualHost *:80>
ServerAdmin webmaster@your_domain.com
DocumentRoot /var/www/html/wordpress
ServerName your_domain.com
ServerAlias www.your_domain.com

<Directory /var/www/html/wordpress>
AllowOverride All
</Directory>

ErrorLog /var/log/httpd/wordpress_error.log
CustomLog /var/log/httpd/wordpress_access.log combined
</VirtualHost>
```

Replace `your_domain.com` with your actual domain. Save and close the file.

Enable the `mod_rewrite` module, which WordPress needs for permalink functionality:

```bash
sudo dnf install mod_rewrite -y
sudo systemctl restart httpd
```

---

## Step 9: Finalize Installation in the Browser

At this point, your WordPress installation is ready for final setup. Open your web browser and navigate to:

```
http://your_domain.com
```

If you’re using a local environment, go to your server’s IP address. You’ll see the WordPress installation screen, where you can select your language and fill in site information such as:

- Site Title
- Username
- Password
- Email Address

Click **Install WordPress** when done, and you’ll be able to log in to your new WordPress site.

---

## Step 10: Configure Basic WordPress Settings

After logging into the WordPress dashboard, go to **Settings &gt; General** and configure:

1. **Site Title and Tagline**
2. **Timezone** – Match this with your location.
3. **Permalinks** – Go to **Settings &gt; Permalinks** and choose **Post name** for an SEO-friendly URL structure.

---

## Step 11: Secure and Optimize Your Installation

To enhance security and optimize performance, consider the following:

- **Install Security Plugins** like Wordfence or Sucuri.
- **Enable SSL** – Use Certbot to install a free SSL certificate from Let’s Encrypt:
```bash
sudo dnf install epel-release
sudo dnf install certbot python3-certbot-apache
sudo certbot --apache
```
- **Regular Backups** – Install a backup plugin or set up automated backups.

---

## Conclusion

Congratulations! You’ve successfully installed and configured WordPress on AlmaLinux 9. From setting up the server environment to securing and optimizing your WordPress site, this guide covers all the necessary steps for getting your website up and running smoothly. With this solid foundation, you’re ready to start customizing your WordPress site and creating content.