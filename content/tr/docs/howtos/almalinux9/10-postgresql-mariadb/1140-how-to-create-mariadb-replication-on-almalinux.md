---
title: How to Create MariaDB Replication on AlmaLinux
linkTitle: Create MariaDB Replication
description: This guide provides a step-by-step walkthrough to configure MariaDB replication on AlmaLinux.
date: 2024-12-22
weight: 1140
url: create-mariadb-replication-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-create-mariadb-replication-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
**MariaDB**, an open-source relational database management system, provides powerful replication features that allow you to maintain copies of your databases on separate servers. Replication is crucial for ensuring **high availability**, **load balancing**, and **disaster recovery** in production environments. By using AlmaLinux, a robust and secure RHEL-based Linux distribution, you can set up MariaDB replication for an efficient and resilient database infrastructure.

This guide provides a step-by-step walkthrough to configure MariaDB replication on AlmaLinux, helping you create a **Main-Replica** setup where changes on the Main database are mirrored on one or more Replica servers.

---

### Table of Contents

1. What is MariaDB Replication?
2. Prerequisites
3. Understanding Main-Replica Replication
4. Installing MariaDB on AlmaLinux
5. Configuring the Main Server
6. Configuring the Replica Server
7. Testing the Replication Setup
8. Monitoring and Managing Replication
9. Troubleshooting Common Issues
10. Conclusion

---

### 1. What is MariaDB Replication?

MariaDB replication is a process that enables one database server (the **Main**) to replicate its data to one or more other servers (the **Replicas**). Common use cases include:

- **High Availability:** Minimize downtime by using Replicas as failover systems.
- **Load Balancing:** Distribute read operations to Replica servers to reduce the Main server's load.
- **Data Backup:** Maintain an up-to-date copy of the database for backup or recovery.

---

### 2. Prerequisites

Before setting up MariaDB replication on AlmaLinux, ensure the following:

1. **AlmaLinux Installed:** At least two servers (Main and Replica) running AlmaLinux.
2. **MariaDB Installed:** MariaDB installed on both the Main and Replica servers.
3. **Network Connectivity:** Both servers can communicate with each other over the network.
4. **User Privileges:** Access to root or sudo privileges on both servers.
5. **Firewall Configured:** Allow MariaDB traffic on port 3306.

---

### 3. Understanding Main-Replica Replication

- **Main:** Handles all write operations and logs changes in a binary log file.
- **Replica:** Reads the binary log from the Main and applies the changes to its own database.

Replication can be **asynchronous** (default) or **semi-synchronous**, depending on the configuration.

---

### 4. Installing MariaDB on AlmaLinux

Install MariaDB on both the Main and Replica servers:

1. **Add the MariaDB Repository:**

   ```bash
   sudo dnf install -y https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
   sudo mariadb_repo_setup --mariadb-server-version=10.11
   ```

2. **Install MariaDB:**

   ```bash
   sudo dnf install -y mariadb-server mariadb
   ```

3. **Enable and Start MariaDB:**

   ```bash
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   ```

4. **Secure MariaDB:**
   Run the security script:

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set a root password, remove anonymous users, and disallow remote root login.

---

### 5. Configuring the Main Server

#### Step 1: Enable Binary Logging

1. Open the MariaDB configuration file:

   ```bash
   sudo nano /etc/my.cnf
   ```

2. Add the following lines under the `[mysqld]` section:

   ```plaintext
   [mysqld]
   server-id=1
   log-bin=mysql-bin
   binlog-format=ROW
   ```

   - `server-id=1`: Assigns a unique ID to the Main server.
   - `log-bin`: Enables binary logging for replication.
   - `binlog-format=ROW`: Recommended format for replication.

3. Save and exit the file, then restart MariaDB:

   ```bash
   sudo systemctl restart mariadb
   ```

#### Step 2: Create a Replication User

1. Log in to the MariaDB shell:

   ```bash
   sudo mysql -u root -p
   ```

2. Create a replication user with appropriate privileges:

   ```sql
   CREATE USER 'replicator'@'%' IDENTIFIED BY 'secure_password';
   GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
   FLUSH PRIVILEGES;
   ```

3. Check the binary log position:

   ```sql
   SHOW MASTER STATUS;
   ```

   Output example:

   ```plaintext
   +------------------+----------+--------------+------------------+
   | File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
   +------------------+----------+--------------+------------------+
   | mysql-bin.000001 |      120 |              |                  |
   +------------------+----------+--------------+------------------+
   ```

   Note the `File` and `Position` values; they will be used in the Replica configuration.

---

### 6. Configuring the Replica Server

#### Step 1: Set Up Replica Configuration

1. Open the MariaDB configuration file:

   ```bash
   sudo nano /etc/my.cnf
   ```

2. Add the following lines under the `[mysqld]` section:

   ```plaintext
   [mysqld]
   server-id=2
   relay-log=mysql-relay-bin
   ```

   - `server-id=2`: Assigns a unique ID to the Replica server.
   - `relay-log`: Stores the relay logs for replication.

3. Save and exit the file, then restart MariaDB:

   ```bash
   sudo systemctl restart mariadb
   ```

#### Step 2: Connect the Replica to the Main

1. Log in to the MariaDB shell:

   ```bash
   sudo mysql -u root -p
   ```

2. Configure the replication parameters:

   ```sql
   CHANGE MASTER TO
       MASTER_HOST='master_server_ip',
       MASTER_USER='replicator',
       MASTER_PASSWORD='secure_password',
       MASTER_LOG_FILE='mysql-bin.000001',
       MASTER_LOG_POS=120;
   ```

   Replace:
   - `master_server_ip` with the IP of the main server.
   - `MASTER_LOG_FILE` and `MASTER_LOG_POS` with the values from the Main.

3. Start the replication process:

   ```sql
   START SLAVE;
   ```

4. Verify the replication status:

   ```sql
   SHOW SLAVE STATUS\G;
   ```

   Look for `Slave_IO_Running: Yes` and `Slave_SQL_Running: Yes`.

---

### 7. Testing the Replication Setup

1. **Create a Test Database on the Main:**

   ```sql
   CREATE DATABASE replication_test;
   ```

2. **Verify on the Replica:**
   Check if the database appears on the Replica:

   ```sql
   SHOW DATABASES;
   ```

   The `replication_test` database should be present.

---

### 8. Monitoring and Managing Replication

#### Monitor Replication Status

- On the Replica server, check the replication status:

   ```sql
   SHOW SLAVE STATUS\G;
   ```

#### Pause or Resume Replication

- Pause replication:

   ```sql
   STOP SLAVE;
   ```

- Resume replication:

   ```sql
   START SLAVE;
   ```

#### Resynchronize a Replica

- Rebuild the Replica by copying the Main’s data using `mysqldump` or `mariabackup` and reconfigure replication.

---

### 9. Troubleshooting Common Issues

#### Replica Not Connecting to Main

- **Check Firewall Rules:** Ensure the Main allows MariaDB traffic on port 3306:

   ```bash
   sudo firewall-cmd --permanent --add-service=mysql
   sudo firewall-cmd --reload
   ```

#### Replication Lag

- Monitor the `Seconds_Behind_Master` value in the Replica status and optimize the Main’s workload if needed.

#### Binary Log Not Enabled

- Verify the `log-bin` parameter is set in the Main’s configuration file.

---

### 10. Conclusion

MariaDB replication on AlmaLinux is a powerful way to enhance database performance, scalability, and reliability. By setting up a **Main-Replica** replication, you can distribute database operations efficiently, ensure high availability, and prepare for disaster recovery scenarios. Regular monitoring and maintenance of the replication setup will keep your database infrastructure robust and resilient.

With this guide, you’re equipped to implement MariaDB replication on AlmaLinux, enabling a reliable and scalable database system for your organization.
