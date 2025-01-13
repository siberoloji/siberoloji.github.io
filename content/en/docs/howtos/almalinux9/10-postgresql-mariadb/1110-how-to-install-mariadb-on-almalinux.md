---
title: How to Install MariaDB on AlmaLinux
linkTitle: Install MariaDB
description: In this comprehensive guide, we’ll walk you through the steps to install MariaDB on AlmaLinux, configure it for production use, and verify its operation.
date: 2024-12-22
weight: 1110
url: install-mariadb-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
  - mariadb
featured_image: /images/almalinux.webp
---
MariaDB, an open-source relational database management system, is a widely popular alternative to MySQL. Known for its performance, scalability, and reliability, MariaDB is a favored choice for web applications, data warehousing, and analytics. AlmaLinux, a CentOS replacement, offers a stable and secure platform for hosting MariaDB databases.

In this comprehensive guide, we’ll walk you through the steps to install MariaDB on AlmaLinux, configure it for production use, and verify its operation. Whether you're a beginner or an experienced system administrator, this tutorial has everything you need to get started.

---

### Table of Contents

1. Introduction to MariaDB and AlmaLinux
2. Prerequisites for Installation
3. Installing MariaDB on AlmaLinux
    - Installing from Default Repositories
    - Installing the Latest Version
4. Configuring MariaDB
    - Securing the Installation
    - Editing Configuration Files
5. Starting and Managing MariaDB Service
6. Testing the MariaDB Installation
7. Creating a Database and User
8. Best Practices for MariaDB on AlmaLinux
9. Troubleshooting Common Issues
10. Conclusion

---

### 1. Introduction to MariaDB and AlmaLinux

MariaDB originated as a fork of MySQL and has since gained popularity for its enhanced features, community-driven development, and open-source commitment. AlmaLinux, a RHEL-based distribution, provides an excellent platform for hosting MariaDB, whether for small-scale projects or enterprise-level applications.

---

### 2. Prerequisites for Installation

Before installing MariaDB on AlmaLinux, ensure the following:

- A running AlmaLinux instance with root or sudo access.
- The system is up-to-date:

  ```bash
  sudo dnf update -y
  ```

- A basic understanding of Linux commands and database management.

---

### 3. Installing MariaDB on AlmaLinux

There are two main approaches to installing MariaDB on AlmaLinux: using the default repositories or installing the latest version from the official MariaDB repositories.

#### Installing from Default Repositories

1. **Install MariaDB:**
   The default AlmaLinux repositories often include MariaDB. To install it, run:

   ```bash
   sudo dnf install -y mariadb-server
   ```

2. **Verify Installation:**
   Check the installed version:

   ```bash
   mariadb --version
   ```

   Output example:

   ```plaintext
   mariadb 10.3.29
   ```

---

#### Installing the Latest Version

If you require the latest version, follow these steps:

1. **Add the Official MariaDB Repository:**
   Visit the [MariaDB repository page](https://mariadb.org/download/) to find the latest repository for your AlmaLinux version. Create a repository file:

   ```bash
   sudo nano /etc/yum.repos.d/mariadb.repo
   ```

   Add the following contents (replace `10.11` with the desired version):

   ```plaintext
   [mariadb]
   name = MariaDB
   baseurl = http://yum.mariadb.org/10.11/rhel8-amd64
   gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
   gpgcheck=1
   ```

   Save and exit the file.

2. **Install MariaDB:**

   ```bash
   sudo dnf install -y MariaDB-server MariaDB-client
   ```

3. **Verify Installation:**

   ```bash
   mariadb --version
   ```

---

### 4. Configuring MariaDB

After installation, some configuration steps are required to secure and optimize MariaDB.

#### Securing the Installation

Run the security script to improve MariaDB's security:

```bash
sudo mysql_secure_installation
```

The script will prompt you to:

- Set the root password.
- Remove anonymous users.
- Disallow root login remotely.
- Remove the test database.
- Reload privilege tables.

Answer "yes" to these prompts to ensure optimal security.

---

#### Editing Configuration Files

The MariaDB configuration file is located at `/etc/my.cnf`. You can customize settings based on your requirements.

1. **Edit the File:**

   ```bash
   sudo nano /etc/my.cnf
   ```

2. **Optimize Basic Settings:** Add or modify the following for better performance:

   ```plaintext
   [mysqld]
   bind-address = 0.0.0.0
   max_connections = 150
   query_cache_size = 16M
   ```

   - **bind-address:** Allows remote connections. Change to the server's IP for security.
   - **max_connections:** Adjust based on expected traffic.
   - **query_cache_size:** Optimizes query performance.

3. **Save and Restart MariaDB:**

   ```bash
   sudo systemctl restart mariadb
   ```

---

### 5. Starting and Managing MariaDB Service

MariaDB runs as a service, which you can manage using `systemctl`.

- **Start MariaDB:**

  ```bash
  sudo systemctl start mariadb
  ```

- **Enable MariaDB to Start on Boot:**

  ```bash
  sudo systemctl enable mariadb
  ```

- **Check Service Status:**

  ```bash
  sudo systemctl status mariadb
  ```

---

### 6. Testing the MariaDB Installation

1. **Log in to the MariaDB Shell:**

   ```bash
   sudo mysql -u root -p
   ```

   Enter the root password set during the `mysql_secure_installation` process.

2. **Check Server Status:**
   Inside the MariaDB shell, run:

   ```sql
   SHOW VARIABLES LIKE "%version%";
   ```

   This displays the server's version and environment details.

3. **Exit the Shell:**

   ```sql
   EXIT;
   ```

---

### 7. Creating a Database and User

1. **Log in to MariaDB:**

   ```bash
   sudo mysql -u root -p
   ```

2. **Create a New Database:**

   ```sql
   CREATE DATABASE my_database;
   ```

3. **Create a User and Grant Permissions:**

   ```sql
   CREATE USER 'my_user'@'%' IDENTIFIED BY 'secure_password';
   GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%';
   FLUSH PRIVILEGES;
   ```

4. **Exit the Shell:**

   ```sql
   EXIT;
   ```

---

### 8. Best Practices for MariaDB on AlmaLinux

1. **Regular Updates:**
   Keep MariaDB and AlmaLinux updated:

   ```bash
   sudo dnf update -y
   ```

2. **Automate Backups:**
   Use tools like `mysqldump` or `mariabackup` for regular backups:

   ```bash
   mysqldump -u root -p my_database > my_database_backup.sql
   ```

3. **Secure Remote Connections:**
   Use SSL/TLS for encrypted connections to the database.

4. **Monitor Performance:**
   Utilize monitoring tools like `MySQLTuner` to optimize the database's performance:

   ```bash
   perl mysqltuner.pl
   ```

5. **Set Resource Limits:**
   Configure resource usage to avoid overloading the system.

---

### 9. Troubleshooting Common Issues

- **MariaDB Fails to Start:**
  - Check the logs for errors:

     ```bash
     sudo tail -f /var/log/mariadb/mariadb.log
     ```

  - Verify the configuration file syntax.

- **Access Denied Errors:**
  - Ensure proper user privileges and authentication:

     ```sql
     SHOW GRANTS FOR 'my_user'@'%';
     ```

- **Remote Connection Issues:**
  - Verify `bind-address` in `/etc/my.cnf` is set correctly.
  - Ensure the firewall allows MariaDB traffic:

     ```bash
     sudo firewall-cmd --permanent --add-service=mysql
     sudo firewall-cmd --reload
     ```

---

### 10. Conclusion

Installing MariaDB on AlmaLinux is a straightforward process, whether you use the default repositories or opt for the latest version. Once installed, securing and configuring MariaDB is essential to ensure optimal performance and security. By following this guide, you now have a functional MariaDB setup on AlmaLinux, ready for use in development or production environments. Regular maintenance, updates, and monitoring will help you keep your database system running smoothly for years to come.
