---
title: How to Set Up Streaming Replication on PostgreSQL on AlmaLinux
linkTitle: Set Up Streaming Replication on PostgreSQL
description: In this article, we’ll guide you through setting up streaming replication on PostgreSQL running on AlmaLinux.
date: 2024-12-19
weight: 1100
url: set-streaming-replication-postgresql-almalinux
draft: false
tags:
   - AlmaLinux
   - Postgresql
categories:
   - Linux
   - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
**PostgreSQL**, an advanced open-source relational database system, supports robust replication features that allow high availability, scalability, and fault tolerance. **Streaming replication**, in particular, is widely used for maintaining a near-real-time replica of the primary database. In this article, we’ll guide you through setting up streaming replication on **PostgreSQL** running on **AlmaLinux**, a reliable RHEL-based distribution.

---

### Table of Contents

1. Introduction to Streaming Replication
2. Prerequisites for Setting Up Streaming Replication
3. Understanding the Primary and Standby Roles
4. Installing PostgreSQL on AlmaLinux
5. Configuring the Primary Server for Streaming Replication
6. Setting Up the Standby Server
7. Testing the Streaming Replication Setup
8. Monitoring Streaming Replication
9. Common Issues and Troubleshooting
10. Conclusion

---

### 1. Introduction to Streaming Replication

Streaming replication in PostgreSQL provides a mechanism where changes made to the primary database are streamed in real-time to one or more standby servers. These standby servers can act as hot backups or read-only servers for query load balancing. This feature is critical for:

- **High Availability:** Ensuring minimal downtime during server failures.
- **Data Redundancy:** Preventing data loss in case of primary server crashes.
- **Scalability:** Offloading read operations to standby servers.

---

### 2. Prerequisites for Setting Up Streaming Replication

Before diving into the setup, ensure you have the following:

1. **Two AlmaLinux Servers:** One for the primary database and one for the standby database.
2. **PostgreSQL Installed:** Both servers should have PostgreSQL installed and running.
3. **Network Connectivity:** Both servers should be able to communicate with each other.
4. **Sufficient Storage:** Ensure adequate storage for the WAL (Write-Ahead Logging) files and database data.
5. **User Privileges:** Access to the PostgreSQL administrative user (`postgres`) and `sudo` privileges on both servers.

---

### 3. Understanding the Primary and Standby Roles

- **Primary Server:** The main PostgreSQL server where all write operations occur.
- **Standby Server:** A replica server that receives changes from the primary server.

Streaming replication works by continuously streaming WAL files from the primary server to the standby server.

---

### 4. Installing PostgreSQL on AlmaLinux

If PostgreSQL is not installed, follow these steps on both the primary and standby servers:

1. **Enable PostgreSQL Repository:**

   ```bash
   sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

2. **Disable the Default PostgreSQL Module:**

   ```bash
   sudo dnf -qy module disable postgresql
   ```

3. **Install PostgreSQL:**

   ```bash
   sudo dnf install -y postgresql15-server
   ```

4. **Initialize and Start PostgreSQL:**

   ```bash
   sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
   sudo systemctl enable postgresql-15
   sudo systemctl start postgresql-15
   ```

---

### 5. Configuring the Primary Server for Streaming Replication

#### Step 1: Edit `postgresql.conf`

Modify the configuration file to enable replication and allow connections from the standby server:

1. Open the file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/postgresql.conf
   ```

2. Update the following parameters:

   ```plaintext
   listen_addresses = '*'
   wal_level = replica
   max_wal_senders = 5
   wal_keep_size = 128MB
   archive_mode = on
   archive_command = 'cp %p /var/lib/pgsql/15/archive/%f'
   ```

3. Save and exit the file.

#### Step 2: Edit `pg_hba.conf`

Allow the standby server to connect to the primary server for replication.

1. Open the file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/pg_hba.conf
   ```

2. Add the following line, replacing `<standby_ip>` with the standby server’s IP:

   ```plaintext
   host    replication     all     <standby_ip>/32     md5
   ```

3. Save and exit the file.

#### Step 3: Create a Replication Role

Create a user with replication privileges:

1. Log in to the PostgreSQL shell:

   ```bash
   sudo -u postgres psql
   ```

2. Create the replication user:

   ```sql
   CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'yourpassword';
   ```

3. Exit the PostgreSQL shell:

   ```bash
   \q
   ```

#### Step 4: Restart PostgreSQL

Restart the PostgreSQL service to apply changes:

```bash
sudo systemctl restart postgresql-15
```

---

### 6. Setting Up the Standby Server

#### Step 1: Stop PostgreSQL Service

Stop the PostgreSQL service on the standby server:

```bash
sudo systemctl stop postgresql-15
```

#### Step 2: Synchronize Data from the Primary Server

Use `pg_basebackup` to copy the data directory from the primary server to the standby server:

```bash
pg_basebackup -h <primary_ip> -D /var/lib/pgsql/15/data -U replicator -Fp -Xs -P
```

- Replace `<primary_ip>` with the primary server’s IP address.
- Provide the `replicator` user password when prompted.

#### Step 3: Configure Recovery Settings

1. Create a `recovery.conf` file in the PostgreSQL data directory:

   ```bash
   sudo nano /var/lib/pgsql/15/data/recovery.conf
   ```

2. Add the following lines:

   ```plaintext
   standby_mode = 'on'
   primary_conninfo = 'host=<primary_ip> port=5432 user=replicator password=yourpassword'
   restore_command = 'cp /var/lib/pgsql/15/archive/%f %p'
   trigger_file = '/tmp/failover.trigger'
   ```

3. Save and exit the file.

#### Step 4: Adjust Permissions

Set the correct permissions for the `recovery.conf` file:

```bash
sudo chown postgres:postgres /var/lib/pgsql/15/data/recovery.conf
```

#### Step 5: Start PostgreSQL Service

Start the PostgreSQL service on the standby server:

```bash
sudo systemctl start postgresql-15
```

---

### 7. Testing the Streaming Replication Setup

1. **Verify Streaming Status on the Primary Server:**
   Log in to the PostgreSQL shell on the primary server and check the replication status:

   ```sql
   SELECT * FROM pg_stat_replication;
   ```

   Look for the standby server's details in the output.

2. **Perform a Test Write:**
   On the primary server, create a test table and insert data:

   ```sql
   CREATE TABLE replication_test (id SERIAL PRIMARY KEY, name TEXT);
   INSERT INTO replication_test (name) VALUES ('Replication works!');
   ```

3. **Verify the Data on the Standby Server:**
   Connect to the standby server and check if the table exists:

   ```sql
   SELECT * FROM replication_test;
   ```

   The data should match the primary server’s table.

---

### 8. Monitoring Streaming Replication

Use the following tools and commands to monitor replication:

- **Check Replication Lag:**

   ```sql
   SELECT pg_last_wal_receive_lsn() - pg_last_wal_replay_lsn() AS replication_lag;
   ```

- **View WAL Sender and Receiver Status:**

   ```sql
   SELECT * FROM pg_stat_replication;
   ```

- **Logs:**
   Check PostgreSQL logs for replication-related messages:

   ```bash
   sudo tail -f /var/lib/pgsql/15/data/log/postgresql-*.log
   ```

---

### 9. Common Issues and Troubleshooting

- **Connection Refused:**
   Ensure the primary server’s `pg_hba.conf` and `postgresql.conf` files are configured correctly.
- **Data Directory Errors:**
   Verify that the standby server’s data directory is an exact copy of the primary server’s directory.
- **Replication Lag:**
   Check the network performance and adjust the `wal_keep_size` parameter as needed.

---

### 10. Conclusion

Setting up streaming replication in PostgreSQL on AlmaLinux ensures database high availability, scalability, and disaster recovery. By following this guide, you can configure a reliable replication environment that is secure and efficient. Regularly monitor replication health and test failover scenarios to maintain a robust database infrastructure.
