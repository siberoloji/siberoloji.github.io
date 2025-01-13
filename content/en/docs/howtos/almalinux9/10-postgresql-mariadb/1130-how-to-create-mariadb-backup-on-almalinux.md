---
title: How to Create MariaDB Backup on AlmaLinux
linkTitle: Create MariaDB Backup
description: This guide walks you through different methods to create MariaDB backups on AlmaLinux, covering both logical and physical backups, and provides insights into best practices to ensure data integrity and security.
date: 2024-12-22
weight: 1130
url: create-mariadb-backup-almalinux
draft: false
tags:
  - AlmaLinux
  - mariadb
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Backing up your database is a critical task for any database administrator. Whether for disaster recovery, migration, or simply safeguarding data, a robust backup strategy ensures the security and availability of your database. **MariaDB**, a popular open-source database, provides multiple tools and methods to back up your data effectively. **AlmaLinux**, a reliable and secure Linux distribution, serves as an excellent platform for hosting MariaDB and managing backups.

This guide walks you through different methods to create MariaDB backups on AlmaLinux, covering both logical and physical backups, and provides insights into best practices to ensure data integrity and security.

---

### Table of Contents

1. Why Backups Are Essential
2. Prerequisites
3. Backup Types in MariaDB
    - Logical Backups
    - Physical Backups
4. Tools for MariaDB Backups
    - mysqldump
    - mariabackup
    - File-System Level Backups
5. Creating MariaDB Backups
    - Using mysqldump
    - Using mariabackup
    - Using File-System Level Backups
6. Automating Backups with Cron Jobs
7. Verifying and Restoring Backups
8. Best Practices for MariaDB Backups
9. Troubleshooting Common Backup Issues
10. Conclusion

---

### 1. Why Backups Are Essential

A backup strategy ensures that your database remains resilient against data loss due to hardware failures, human errors, malware attacks, or other unforeseen events. Regular backups allow you to:

- Recover data during accidental deletions or corruption.
- Protect against ransomware attacks.
- Safeguard business continuity during system migrations or upgrades.
- Support auditing or compliance requirements by archiving historical data.

---

### 2. Prerequisites

Before creating MariaDB backups on AlmaLinux, ensure you have:

1. **MariaDB Installed:** A working MariaDB setup.
2. **Sufficient Disk Space:** Adequate storage for backup files.
3. **User Privileges:** Administrative privileges (`root` or equivalent) to access and back up databases.
4. **Backup Directory:** A dedicated directory to store backups.

---

### 3. Backup Types in MariaDB

MariaDB offers two primary types of backups:

#### Logical Backups

- Export database schemas and data as SQL statements.
- Ideal for small to medium-sized databases.
- Can be restored on different MariaDB or MySQL versions.

#### Physical Backups

- Copy the database files directly at the file system level.
- Suitable for large databases or high-performance use cases.
- Includes metadata and binary logs for consistency.

---

### 4. Tools for MariaDB Backups

#### mysqldump

- A built-in tool for logical backups.
- Exports databases to SQL files.

#### mariabackup

- A robust tool for physical backups.
- Ideal for large databases with transaction log support.

#### File-System Level Backups

- Directly copies database files.
- Requires MariaDB to be stopped during the backup process.

---

### 5. Creating MariaDB Backups

#### Using `mysqldump`

**Step 1: Back Up a Single Database**

```bash
mysqldump -u root -p database_name > /backup/database_name.sql
```

**Step 2: Back Up Multiple Databases**

```bash
mysqldump -u root -p --databases db1 db2 db3 > /backup/multiple_databases.sql
```

**Step 3: Back Up All Databases**

```bash
mysqldump -u root -p --all-databases > /backup/all_databases.sql
```

**Step 4: Compressed Backup**

```bash
mysqldump -u root -p database_name | gzip > /backup/database_name.sql.gz
```

---

#### Using `mariabackup`

`mariabackup` is a powerful tool for creating consistent physical backups.

**Step 1: Install `mariabackup`**

```bash
sudo dnf install -y MariaDB-backup
```

**Step 2: Perform a Full Backup**

```bash
mariabackup --backup --target-dir=/backup/full_backup --user=root --password=yourpassword
```

**Step 3: Prepare the Backup for Restoration**

```bash
mariabackup --prepare --target-dir=/backup/full_backup
```

**Step 4: Incremental Backups**

- First, take a full backup as a base:

   ```bash
   mariabackup --backup --target-dir=/backup/base_backup --user=root --password=yourpassword
   ```

- Then, create incremental backups:

   ```bash
   mariabackup --backup --incremental-basedir=/backup/base_backup --target-dir=/backup/incremental_backup --user=root --password=yourpassword
   ```

---

#### Using File-System Level Backups

File-system level backups are simple but require downtime.

**Step 1: Stop MariaDB**

```bash
sudo systemctl stop mariadb
```

**Step 2: Copy the Data Directory**

```bash
sudo cp -r /var/lib/mysql /backup/mysql_backup
```

**Step 3: Start MariaDB**

```bash
sudo systemctl start mariadb
```

---

### 6. Automating Backups with Cron Jobs

You can automate backups using cron jobs to ensure consistency and reduce manual effort.

**Step 1: Open the Cron Editor**

```bash
crontab -e
```

**Step 2: Add a Daily Backup Job**

```bash
0 2 * * * mysqldump -u root -p'yourpassword' --all-databases | gzip > /backup/all_databases_$(date +\%F).sql.gz
```

**Step 3: Save and Exit**

---

### 7. Verifying and Restoring Backups

#### Verify Backup Integrity

- Check the size of backup files:

  ```bash
  ls -lh /backup/
  ```

- Test restoration in a staging environment.

#### Restore Logical Backups

1. Restore a single database:

   ```bash
   mysql -u root -p database_name < /backup/database_name.sql
   ```

2. Restore all databases:

   ```bash
   mysql -u root -p < /backup/all_databases.sql
   ```

#### Restore Physical Backups

1. Stop MariaDB:

   ```bash
   sudo systemctl stop mariadb
   ```

2. Replace the data directory:

   ```bash
   sudo cp -r /backup/mysql_backup/* /var/lib/mysql/
   sudo chown -R mysql:mysql /var/lib/mysql/
   ```

3. Start MariaDB:

   ```bash
   sudo systemctl start mariadb
   ```

---

### 8. Best Practices for MariaDB Backups

1. **Schedule Regular Backups:**
   - Use cron jobs for daily or weekly backups.

2. **Verify Backups:**
   - Regularly test restoration to ensure backups are valid.

3. **Encrypt Sensitive Data:**
   - Use tools like `gpg` to encrypt backup files.

4. **Store Backups Off-Site:**
   - Use cloud storage or external drives for disaster recovery.

5. **Monitor Backup Status:**
   - Use monitoring tools or scripts to ensure backups run as expected.

---

### 9. Troubleshooting Common Backup Issues

#### Backup Fails with "Access Denied"

- Ensure the backup user has sufficient privileges:

  ```sql
  GRANT ALL PRIVILEGES ON *.* TO 'backup_user'@'localhost' IDENTIFIED BY 'password';
  FLUSH PRIVILEGES;
  ```

#### Storage Issues

- Check disk space using:

  ```bash
  df -h
  ```

#### Slow Backups

- Optimize the `mysqldump` command with parallel exports:

  ```bash
  mysqldump --single-transaction --quick --lock-tables=false
  ```

---

### 10. Conclusion

Creating regular MariaDB backups on AlmaLinux is an essential practice to ensure data availability and security. Whether using logical backups with `mysqldump`, physical backups with `mariabackup`, or file-system level copies, the right method depends on your database size and recovery requirements. By automating backups, verifying their integrity, and adhering to best practices, you can maintain a resilient database system capable of recovering from unexpected disruptions.

With this guide, you’re equipped to implement a reliable backup strategy for MariaDB on AlmaLinux, safeguarding your valuable data for years to come.
