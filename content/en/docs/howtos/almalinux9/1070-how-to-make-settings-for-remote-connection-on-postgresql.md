---
title: How to Make Settings for Remote Connection on PostgreSQL on AlmaLinux
linkTitle: Remote Connection on PostgreSQL
description: This guide will focus on configuring remote connections for PostgreSQL on AlmaLinux.
date: 2024-12-19
weight: 1070
url: settings-remote-connection-postgresql-almalinux
draft: false
tags:
   - AlmaLinux
   - postgresql
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
PostgreSQL, often referred to as Postgres, is a powerful, open-source relational database system that offers extensibility and SQL compliance. Setting up a remote connection to PostgreSQL is a common task for developers and system administrators, enabling them to interact with the database from remote machines. This guide will focus on configuring remote connections for PostgreSQL on **AlmaLinux**, a popular CentOS replacement that’s gaining traction in enterprise environments.

#### Table of Contents

1. Introduction to PostgreSQL and AlmaLinux
2. Prerequisites
3. Installing PostgreSQL on AlmaLinux
4. Configuring PostgreSQL for Remote Access
    - Editing the `postgresql.conf` File
    - Modifying the `pg_hba.conf` File
5. Allowing PostgreSQL Through the Firewall
6. Testing the Remote Connection
7. Common Troubleshooting Tips
8. Conclusion

---

### 1. Introduction to PostgreSQL and AlmaLinux

AlmaLinux, a community-driven Linux distribution, is widely regarded as a reliable replacement for CentOS. Its compatibility with Red Hat Enterprise Linux (RHEL) makes it a strong candidate for database servers running PostgreSQL. Remote access to PostgreSQL is especially useful in distributed systems or development environments where multiple clients need database access.

### 2. Prerequisites

Before diving into the setup process, ensure the following:

- **AlmaLinux** is installed and updated.
- PostgreSQL is installed on the server (we'll cover installation in the next section).
- You have root or sudo access to the AlmaLinux system.
- Basic knowledge of PostgreSQL commands and SQL.

### 3. Installing PostgreSQL on AlmaLinux

If PostgreSQL isn’t already installed, follow these steps:

1. **Enable the PostgreSQL repository:**
   AlmaLinux uses the PostgreSQL repository for the latest version. Install it using:

   ```bash
   sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

2. **Disable the default PostgreSQL module:**

   ```bash
   sudo dnf -qy module disable postgresql
   ```

3. **Install PostgreSQL:**
   Replace `15` with your desired version:

   ```bash
   sudo dnf install -y postgresql15-server
   ```

4. **Initialize the database:**

   ```bash
   sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
   ```

5. **Enable and start PostgreSQL:**

   ```bash
   sudo systemctl enable postgresql-15
   sudo systemctl start postgresql-15
   ```

At this stage, PostgreSQL is installed and running on your AlmaLinux system.

### 4. Configuring PostgreSQL for Remote Access

PostgreSQL is configured to listen only to localhost by default for security reasons. To allow remote access, you need to modify a few configuration files.

#### Editing the `postgresql.conf` File

1. Open the configuration file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/postgresql.conf
   ```

2. Locate the `listen_addresses` parameter. By default, it looks like this:

   ```plaintext
   listen_addresses = 'localhost'
   ```

3. Change it to include the IP address you want PostgreSQL to listen on, or use `*` to listen on all available interfaces:

   ```plaintext
   listen_addresses = '*'
   ```

4. Save and exit the file.

#### Modifying the `pg_hba.conf` File

The `pg_hba.conf` file controls client authentication. You need to add entries to allow connections from specific IP addresses.

1. Open the file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/pg_hba.conf
   ```

2. Add the following line at the end of the file to allow connections from a specific IP range (replace `192.168.1.0/24` with your network range):

   ```plaintext
   host    all             all             192.168.1.0/24          md5
   ```

   Alternatively, to allow connections from all IPs (not recommended for production), use:

   ```plaintext
   host    all             all             0.0.0.0/0              md5
   ```

3. Save and exit the file.

4. Restart PostgreSQL to apply changes:

   ```bash
   sudo systemctl restart postgresql-15
   ```

### 5. Allowing PostgreSQL Through the Firewall

By default, AlmaLinux uses `firewalld` as its firewall management tool. You need to open the PostgreSQL port (5432) to allow remote connections.

1. Add the port to the firewall rules:

   ```bash
   sudo firewall-cmd --permanent --add-port=5432/tcp
   ```

2. Reload the firewall to apply changes:

   ```bash
   sudo firewall-cmd --reload
   ```

### 6. Testing the Remote Connection

To test the remote connection:

1. From a remote machine, use the `psql` client or any database management tool that supports PostgreSQL.
2. Run the following command, replacing the placeholders with appropriate values:

   ```bash
   psql -h <server_ip> -U <username> -d <database_name>
   ```

3. Enter the password when prompted. If everything is configured correctly, you should see the `psql` prompt.

### 7. Common Troubleshooting Tips

If you encounter issues, consider the following:

- **Firewall Issues:** Ensure the firewall on both the server and client allows traffic on port 5432.
- **Incorrect Credentials:** Double-check the username, password, and database name.
- **IP Restrictions:** Ensure the client’s IP address falls within the range specified in `pg_hba.conf`.
- **Service Status:** Verify that the PostgreSQL service is running:

  ```bash
  sudo systemctl status postgresql-15
  ```

- **Log Files:** Check PostgreSQL logs for errors:

  ```bash
  sudo tail -f /var/lib/pgsql/15/data/log/postgresql-*.log
  ```

### 8. Conclusion

Setting up remote connections for PostgreSQL on AlmaLinux involves modifying configuration files, updating firewall rules, and testing the setup. While the process requires a few careful steps, it enables you to use PostgreSQL in distributed environments effectively. Always prioritize security by limiting access to trusted IP ranges and enforcing strong authentication methods.

By following this guide, you can confidently configure PostgreSQL for remote access, ensuring seamless database management and operations. For advanced use cases, consider additional measures such as SSL/TLS encryption and database-specific roles for enhanced security.
