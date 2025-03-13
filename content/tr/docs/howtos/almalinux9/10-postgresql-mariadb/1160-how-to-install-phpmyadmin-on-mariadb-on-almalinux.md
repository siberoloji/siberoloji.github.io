---
title: How to Install phpMyAdmin on MariaDB on AlmaLinux
linkTitle: phpMyAdmin on MariaDB
description: This comprehensive guide walks you through the process of installing and configuring phpMyAdmin on AlmaLinux with a MariaDB database server.
date: 2024-12-22
weight: 1160
url: install-phpmyadmin-mariadb-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: install-phpmyadmin-mariadb-almalinux
keywords:
  - AlmaLinux
  - phpmyadmin
featured_image: /images/almalinux.webp
---
**phpMyAdmin** is a popular web-based tool that simplifies the management of MySQL and MariaDB databases. It provides an intuitive graphical user interface (GUI) for performing tasks such as creating, modifying, and deleting databases, tables, and users without the need to execute SQL commands manually. If you are running **MariaDB** on **AlmaLinux**, phpMyAdmin can significantly enhance your database administration workflow.

This comprehensive guide walks you through the process of installing and configuring phpMyAdmin on AlmaLinux with a MariaDB database server.

---

### Table of Contents

1. Introduction to phpMyAdmin
2. Prerequisites
3. Installing MariaDB on AlmaLinux
4. Installing phpMyAdmin
5. Configuring phpMyAdmin
6. Securing phpMyAdmin
7. Accessing phpMyAdmin
8. Troubleshooting Common Issues
9. Best Practices for phpMyAdmin on AlmaLinux
10. Conclusion

---

### 1. Introduction to phpMyAdmin

**phpMyAdmin** is a PHP-based tool designed to manage MariaDB and MySQL databases through a web browser. It allows database administrators to perform a variety of tasks, such as:

- Managing databases, tables, and users.
- Running SQL queries.
- Importing and exporting data.
- Setting permissions and privileges.

---

### 2. Prerequisites

Before installing phpMyAdmin, ensure the following:

1. **AlmaLinux Server:** A working AlmaLinux instance with root or sudo access.
2. **MariaDB Installed:** A functioning MariaDB server.
3. **LAMP Stack Installed:** Apache, MariaDB, and PHP are required for phpMyAdmin to work.
4. **Basic Knowledge:** Familiarity with Linux commands and MariaDB administration.

---

### 3. Installing MariaDB on AlmaLinux

If MariaDB is not already installed, follow these steps:

1. **Add the MariaDB Repository:**

   ```bash
   sudo dnf install -y https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
   sudo mariadb_repo_setup --mariadb-server-version=10.11
   ```

2. **Install MariaDB Server:**

   ```bash
   sudo dnf install -y mariadb-server
   ```

3. **Start and Enable MariaDB:**

   ```bash
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   ```

4. **Secure MariaDB Installation:**

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set a root password, remove anonymous users, and disable remote root login.

---

### 4. Installing phpMyAdmin

#### Step 1: Install Apache and PHP

If you don’t have Apache and PHP installed:

1. **Install Apache:**

   ```bash
   sudo dnf install -y httpd
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

2. **Install PHP and Required Extensions:**

   ```bash
   sudo dnf install -y php php-mysqlnd php-json php-mbstring
   sudo systemctl restart httpd
   ```

#### Step 2: Install phpMyAdmin

1. **Add the EPEL Repository:**
   phpMyAdmin is included in the EPEL repository:

   ```bash
   sudo dnf install -y epel-release
   ```

2. **Install phpMyAdmin:**

   ```bash
   sudo dnf install -y phpMyAdmin
   ```

---

### 5. Configuring phpMyAdmin

#### Step 1: Configure Apache for phpMyAdmin

1. Open the phpMyAdmin Apache configuration file:

   ```bash
   sudo nano /etc/httpd/conf.d/phpMyAdmin.conf
   ```

2. By default, phpMyAdmin is restricted to localhost. To allow access from other IP addresses, modify the file:

   Replace:

   ```plaintext
   Require ip 127.0.0.1
   Require ip ::1
   ```

   With:

   ```plaintext
   Require all granted
   ```

3. Save and exit the file.

#### Step 2: Restart Apache

After modifying the configuration, restart Apache:

```bash
sudo systemctl restart httpd
```

---

### 6. Securing phpMyAdmin

#### Step 1: Set Up Firewall Rules

To allow access to the Apache web server, open port 80 (HTTP) or port 443 (HTTPS):

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

#### Step 2: Configure Additional Authentication

You can add an extra layer of security by enabling basic HTTP authentication:

1. Create a password file:

   ```bash
   sudo htpasswd -c /etc/phpMyAdmin/.htpasswd admin
   ```

2. Edit the phpMyAdmin configuration file to include authentication:

   ```bash
   sudo nano /etc/httpd/conf.d/phpMyAdmin.conf
   ```

   Add the following lines:

   ```plaintext
   <Directory "/usr/share/phpMyAdmin">
       AuthType Basic
       AuthName "Restricted Access"
       AuthUserFile /etc/phpMyAdmin/.htpasswd
       Require valid-user
   </Directory>
   ```

3. Restart Apache:

   ```bash
   sudo systemctl restart httpd
   ```

#### Step 3: Use SSL/TLS for Secure Connections

To encrypt communication, enable SSL:

1. Install the `mod_ssl` module:

   ```bash
   sudo dnf install -y mod_ssl
   ```

2. Restart Apache:

   ```bash
   sudo systemctl restart httpd
   ```

---

### 7. Accessing phpMyAdmin

To access phpMyAdmin:

1. Open a web browser and navigate to:

   ```plaintext
   http://<server-ip>/phpMyAdmin
   ```

   Replace `<server-ip>` with your server’s IP address.

2. Log in using your MariaDB credentials.

---

### 8. Troubleshooting Common Issues

#### Issue: Access Denied for Root User

- **Cause:** By default, phpMyAdmin prevents root login for security.
- **Solution:** Use a dedicated database user with the necessary privileges.

#### Issue: phpMyAdmin Not Loading

- **Cause:** PHP extensions might be missing.
- **Solution:** Ensure required extensions are installed:

  ```bash
  sudo dnf install -y php-mbstring php-json php-xml
  sudo systemctl restart httpd
  ```

#### Issue: Forbidden Access Error

- **Cause:** Apache configuration restricts access.
- **Solution:** Verify the phpMyAdmin configuration file and adjust `Require` directives.

---

### 9. Best Practices for phpMyAdmin on AlmaLinux

1. **Restrict Access:** Limit access to trusted IP addresses in `/etc/httpd/conf.d/phpMyAdmin.conf`.
2. **Create a Dedicated User:** Avoid using the root account for database management.
3. **Regular Updates:** Keep phpMyAdmin, MariaDB, and Apache updated to address vulnerabilities.
4. **Enable SSL:** Always use HTTPS to secure communication.
5. **Backup Configuration Files:** Regularly back up your database and phpMyAdmin configuration.

---

### 10. Conclusion

Installing phpMyAdmin on AlmaLinux with a MariaDB database provides a powerful yet user-friendly way to manage databases through a web interface. By following the steps in this guide, you’ve set up phpMyAdmin, secured it with additional layers of protection, and ensured it runs smoothly on your AlmaLinux server.

With phpMyAdmin, you can efficiently manage your MariaDB databases, perform administrative tasks, and improve your productivity. Regular maintenance and adherence to best practices will keep your database environment secure and robust for years to come.
