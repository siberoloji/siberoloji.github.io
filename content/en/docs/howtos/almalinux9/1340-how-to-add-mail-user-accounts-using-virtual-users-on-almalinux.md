---
title: How to Add Mail User Accounts Using Virtual Users on AlmaLinux
linkTitle: Add Mail User from Virtual Users
description: In this guide, we’ll walk you through how to set up and manage mail user accounts using virtual users on AlmaLinux
date: 2024-12-23
weight: 1340
url: add-mail-user-accounts-virtual-users-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
Managing mail servers efficiently is a critical task for server administrators. In many cases, using **virtual users** to handle email accounts is preferred over creating system users. Virtual users allow you to separate mail accounts from system accounts, providing flexibility, enhanced security, and streamlined management.

In this guide, we’ll walk you through how to set up and manage mail user accounts using virtual users on AlmaLinux, a popular enterprise Linux distribution. By the end, you’ll be able to create, configure, and manage virtual mail users effectively.

---

### **What Are Virtual Mail Users?**

Virtual mail users are email accounts that exist solely for mail purposes and are not tied to system users. They are managed independently of the operating system's user database, providing benefits such as:
- Enhanced security (no direct shell access for mail users).
- Easier account management for mail-only users.
- Greater scalability for hosting multiple domains or users.

---

### **Prerequisites**

Before starting, ensure you have the following in place:
1. A server running AlmaLinux.
2. **Postfix** and **Dovecot** installed and configured as your Mail Transfer Agent (MTA) and Mail Delivery Agent (MDA), respectively.
3. Root or sudo access to the server.

---

### **Step 1: Install Required Packages**

Begin by ensuring your AlmaLinux system is updated and the necessary mail server components are installed:

#### **Update System Packages**
```bash
sudo dnf update -y
```

#### **Install Postfix and Dovecot**
```bash
sudo dnf install postfix dovecot -y
```

#### **Install Additional Tools**
For virtual user management, you'll need tools like `mariadb-server` or `sqlite` to store user data, and other dependencies:
```bash
sudo dnf install mariadb-server mariadb postfix-mysql -y
```
Start and enable MariaDB:
```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

---

### **Step 2: Configure the Database for Virtual Users**

Virtual users and domains are typically stored in a database. You can use **MariaDB** to manage this.

#### **Step 2.1: Secure MariaDB Installation**
Run the secure installation script:
```bash
sudo mysql_secure_installation
```
Follow the prompts to set a root password and secure your database server.

#### **Step 2.2: Create a Database and Tables**
Log in to MariaDB:
```bash
sudo mysql -u root -p
```

Create a database for mail users:
```sql
CREATE DATABASE mailserver;
```

Switch to the database:
```sql
USE mailserver;
```

Create tables for virtual domains, users, and aliases:
```sql
CREATE TABLE virtual_domains (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE virtual_users (
    id INT NOT NULL AUTO_INCREMENT,
    domain_id INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email (email),
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
);

CREATE TABLE virtual_aliases (
    id INT NOT NULL AUTO_INCREMENT,
    domain_id INT NOT NULL,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
);
```

#### **Step 2.3: Add Sample Data**
Insert a virtual domain and user for testing:
```sql
INSERT INTO virtual_domains (name) VALUES ('example.com');

INSERT INTO virtual_users (domain_id, password, email)
VALUES (1, ENCRYPT('password'), 'user@example.com');
```
Exit the database:
```sql
EXIT;
```

---

### **Step 3: Configure Postfix for Virtual Users**

Postfix needs to be configured to fetch virtual user information from the database.

#### **Step 3.1: Install and Configure Postfix**
Edit the Postfix configuration file:
```bash
sudo nano /etc/postfix/main.cf
```

Add the following lines for virtual domains and users:
```text
virtual_mailbox_domains = mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf
virtual_mailbox_maps = mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf
virtual_alias_maps = mysql:/etc/postfix/mysql-virtual-alias-maps.cf
```

#### **Step 3.2: Create Postfix MySQL Configuration Files**
Create configuration files for each mapping.

**/etc/postfix/mysql-virtual-mailbox-domains.cf**:
```text
user = mailuser
password = mailpassword
hosts = 127.0.0.1
dbname = mailserver
query = SELECT name FROM virtual_domains WHERE name='%s'
```

**/etc/postfix/mysql-virtual-mailbox-maps.cf**:
```text
user = mailuser
password = mailpassword
hosts = 127.0.0.1
dbname = mailserver
query = SELECT email FROM virtual_users WHERE email='%s'
```

**/etc/postfix/mysql-virtual-alias-maps.cf**:
```text
user = mailuser
password = mailpassword
hosts = 127.0.0.1
dbname = mailserver
query = SELECT destination FROM virtual_aliases WHERE source='%s'
```

Replace `mailuser` and `mailpassword` with the credentials you created for your database.

Set proper permissions:
```bash
sudo chmod 640 /etc/postfix/mysql-virtual-*.cf
sudo chown postfix:postfix /etc/postfix/mysql-virtual-*.cf
```

Reload Postfix:
```bash
sudo systemctl restart postfix
```

---

### **Step 4: Configure Dovecot for Virtual Users**

Dovecot handles mail retrieval for virtual users.

#### **Step 4.1: Edit Dovecot Configuration**
Open the main Dovecot configuration file:
```bash
sudo nano /etc/dovecot/dovecot.conf
```

Enable mail delivery for virtual users by adding:
```text
mail_location = maildir:/var/mail/vhosts/%d/%n
namespace inbox {
    inbox = yes
}
```

#### **Step 4.2: Set up Authentication**
Edit the authentication configuration:
```bash
sudo nano /etc/dovecot/conf.d/auth-sql.conf.ext
```

Add the following:
```text
passdb {
    driver = sql
    args = /etc/dovecot/dovecot-sql.conf.ext
}

userdb {
    driver = static
    args = uid=vmail gid=vmail home=/var/mail/vhosts/%d/%n
}
```

Create **/etc/dovecot/dovecot-sql.conf.ext**:
```text
driver = mysql
connect = host=127.0.0.1 dbname=mailserver user=mailuser password=mailpassword
default_pass_scheme = MD5-CRYPT
password_query = SELECT email as user, password FROM virtual_users WHERE email='%u';
```

Set permissions:
```bash
sudo chmod 600 /etc/dovecot/dovecot-sql.conf.ext
sudo chown dovecot:dovecot /etc/dovecot/dovecot-sql.conf.ext
```

Reload Dovecot:
```bash
sudo systemctl restart dovecot
```

---

### **Step 5: Add New Virtual Users**

You can add new users directly to the database:
```sql
USE mailserver;

INSERT INTO virtual_users (domain_id, password, email)
VALUES (1, ENCRYPT('newpassword'), 'newuser@example.com');
```

Ensure the user directory exists:
```bash
sudo mkdir -p /var/mail/vhosts/example.com/newuser
sudo chown -R vmail:vmail /var/mail/vhosts
```

---

### **Step 6: Testing the Configuration**

Test email delivery using tools like `telnet` or mail clients:
```bash
telnet localhost 25
```
Ensure that emails can be sent and retrieved.

---

### **Conclusion**

Setting up virtual mail users on AlmaLinux offers flexibility, scalability, and security for managing mail services. By following this guide, you can configure a database-driven mail system using Postfix and Dovecot, allowing you to efficiently manage email accounts for multiple domains.

With this setup, your server is equipped to handle email hosting for various scenarios, from personal projects to business-critical systems.
