---
title: How to Install PostgreSQL on AlmaLinux
linkTitle: Install PostgreSQL
description: In this guide, we’ll walk you through the process of installing and setting up PostgreSQL on AlmaLinux
date: 2024-12-18
weight: 1060
url: install-postgresql-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: install-postgresql-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
PostgreSQL, often referred to as Postgres, is a powerful, open-source, object-relational database management system (RDBMS) widely used for modern web applications. Its robust feature set, scalability, and adherence to SQL standards make it a top choice for developers and businesses.

In this guide, we’ll walk you through the process of installing and setting up PostgreSQL on **AlmaLinux**, a popular, stable Linux distribution that’s a downstream fork of CentOS. By the end, you'll have a fully operational PostgreSQL installation ready to handle database operations.

---

## Table of Contents

1. **Introduction to PostgreSQL**
2. **Prerequisites**
3. **Step-by-Step Installation Guide**
4. **Post-Installation Configuration**
5. **Connecting to PostgreSQL**
6. **Securing and Optimizing PostgreSQL**
7. **Conclusion**

---

## 1. Introduction to PostgreSQL

PostgreSQL is known for its advanced features like JSON/JSONB support, full-text search, and strong ACID compliance. It is ideal for applications that require complex querying, data integrity, and scalability.

**Key Features:**

- Multi-Version Concurrency Control (MVCC)
- Support for advanced data types and indexing
- Extensibility through plugins and custom procedures
- High availability and replication capabilities

---

## 2. Prerequisites

Before starting the installation process, ensure the following:

1. **AlmaLinux server** with a sudo-enabled user or root access.
2. Access to the internet for downloading packages.
3. Basic knowledge of Linux commands.

### Update the System

Begin by updating the system to the latest packages:

```bash
sudo dnf update -y
```

---

## 3. Step-by-Step Installation Guide

PostgreSQL can be installed from the default AlmaLinux repositories or directly from the official PostgreSQL repositories for newer versions.

### Step 1: Enable the PostgreSQL Repository

The PostgreSQL Global Development Group maintains official repositories for the latest versions of PostgreSQL. To enable the repository:

1. Install the PostgreSQL repository package:

   ```bash
   sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

2. Disable the default PostgreSQL module in AlmaLinux (it often contains an older version):

   ```bash
   sudo dnf -qy module disable postgresql
   ```

### Step 2: Install PostgreSQL

Install the desired version of PostgreSQL. For this example, we’ll install PostgreSQL 15 (replace `15` with another version if needed):

```bash
sudo dnf install -y postgresql15 postgresql15-server
```

### Step 3: Initialize the PostgreSQL Database

After installing PostgreSQL, initialize the database cluster:

```bash
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
```

This command creates the necessary directories and configures the database for first-time use.

### Step 4: Start and Enable PostgreSQL

To ensure PostgreSQL starts automatically on boot:

```bash
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
```

Verify the service is running:

```bash
sudo systemctl status postgresql-15
```

You should see a message indicating that PostgreSQL is active and running.

---

## 4. Post-Installation Configuration

### Step 1: Update PostgreSQL Authentication Methods

By default, PostgreSQL uses the **peer** authentication method, which allows only the system user `postgres` to connect. If you want to enable password-based access for remote or local connections:

1. Edit the **pg_hba.conf** file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/pg_hba.conf
   ```

2. Look for the following lines and change `peer` or `ident` to `md5` for password-based authentication:

   ```plaintext
   # TYPE  DATABASE        USER            ADDRESS                 METHOD
   local   all             all                                     md5
   host    all             all             127.0.0.1/32           md5
   host    all             all             ::1/128                md5
   ```

3. Save and exit the file, then reload PostgreSQL to apply changes:

   ```bash
   sudo systemctl reload postgresql-15
   ```

### Step 2: Set a Password for the `postgres` User

Switch to the `postgres` user and open the PostgreSQL command-line interface (`psql`):

```bash
sudo -i -u postgres
psql
```

Set a password for the `postgres` database user:

```sql
ALTER USER postgres PASSWORD 'your_secure_password';
```

Exit the `psql` shell:

```sql
\q
```

Exit the `postgres` system user:

```bash
exit
```

---

## 5. Connecting to PostgreSQL

You can connect to PostgreSQL using the `psql` command-line tool or a graphical client like pgAdmin.

### Local Connection

For local connections, use the following command:

```bash
psql -U postgres -h 127.0.0.1 -W
```

- `-U`: Specifies the database user.
- `-h`: Specifies the host (127.0.0.1 for localhost).
- `-W`: Prompts for a password.

### Remote Connection

To allow remote connections:

1. Edit the **postgresql.conf** file to listen on all IP addresses:

   ```bash
   sudo nano /var/lib/pgsql/15/data/postgresql.conf
   ```

   Find and update the `listen_addresses` parameter:

   ```plaintext
   listen_addresses = '*'
   ```

2. Save the file and reload PostgreSQL:

   ```bash
   sudo systemctl reload postgresql-15
   ```

3. Ensure the firewall allows traffic on PostgreSQL’s default port (5432):

   ```bash
   sudo firewall-cmd --add-service=postgresql --permanent
   sudo firewall-cmd --reload
   ```

You can now connect to PostgreSQL remotely using a tool like **pgAdmin** or a client application.

---

## 6. Securing and Optimizing PostgreSQL

### Security Best Practices

1. **Use Strong Passwords**: Ensure all database users have strong passwords.
2. **Restrict Access**: Limit connections to trusted IP addresses in the `pg_hba.conf` file.
3. **Regular Backups**: Use tools like `pg_dump` or `pg_basebackup` to create backups.

   Example backup command:

   ```bash
   pg_dump -U postgres dbname > dbname_backup.sql
   ```

4. **Enable SSL**: Secure remote connections by configuring SSL for PostgreSQL.

### Performance Optimization

1. **Tune Memory Settings**: Adjust memory-related parameters in `postgresql.conf` for better performance. For example:

   ```plaintext
   shared_buffers = 256MB
   work_mem = 64MB
   maintenance_work_mem = 128MB
   ```

2. **Monitor Performance**: Use the `pg_stat_activity` view to monitor active queries and database activity:

   ```sql
   SELECT * FROM pg_stat_activity;
   ```

3. **Analyze and Vacuum**: Periodically run `ANALYZE` and `VACUUM` to optimize database performance:

   ```bash
   VACUUM ANALYZE;
   ```

---

## 7. Conclusion

PostgreSQL is a robust database system that pairs seamlessly with AlmaLinux for building scalable and secure applications. This guide has covered everything from installation to basic configuration and optimization. Whether you’re using PostgreSQL for web applications, data analytics, or enterprise solutions, you now have a solid foundation to get started.

By enabling password authentication, securing remote connections, and fine-tuning PostgreSQL, you can ensure your database environment is both secure and efficient. Take advantage of PostgreSQL’s advanced features and enjoy the stability AlmaLinux offers for a dependable server experience.
