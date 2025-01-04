---
title: Bob Sets Up a Database Server on AlmaLinux
linkTitle: Setup Database Server
description: he’s going to set up a MariaDB server (a MySQL-compatible open-source database) on AlmaLinux and practice basic database management.
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 130
toc: true
keywords:
  - Setup Database Server
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-sets-database-server-alma-linux
---
Perfect! Let’s dive into Chapter 13, *"Bob Sets Up a Database Server"*, where Bob will learn how to set up and manage a database server on AlmaLinux. He’ll configure a MySQL (MariaDB) server, create databases and users, and practice basic database management commands.

---

## **1. Introduction: Bob’s Database Challenge**

Bob’s latest task is to set up a database server for a new web application. He’s heard about MySQL and MariaDB and knows they’re commonly used for storing data in Linux environments. Today, he’s going to set up a MariaDB server (a MySQL-compatible open-source database) on AlmaLinux and practice basic database management.

> *“Time to dive into databases and see what they’re all about!”* Bob says, ready for a new learning experience.

---

## **2. Installing MariaDB**

Bob starts by installing **MariaDB**, the default MySQL-compatible database in AlmaLinux.

- **Installing MariaDB**: He uses `dnf` to install the server:

  ```bash
  sudo dnf install mariadb-server
  ```

- **Starting and Enabling MariaDB**: Once installed, Bob starts the database service and enables it to start at boot:

  ```bash
  sudo systemctl start mariadb
  sudo systemctl enable mariadb
  ```

- **Checking the Service Status**: To make sure it’s running correctly, he checks the status:

  ```bash
  sudo systemctl status mariadb
  ```

> *“MariaDB is up and running!”* Bob says, excited to move on to configuration.

---

## **3. Securing the Database Server**

Bob learns that the MariaDB installation comes with a basic security script that helps set up initial security settings.

- **Running the Security Script**: He runs the script to remove insecure default settings:

  ```bash
  sudo mysql_secure_installation
  ```

- **Configuring Security Settings**:
  - **Setting the Root Password**: The script prompts him to set a root password for database access.
  - **Removing Anonymous Users**: Bob removes anonymous users to prevent unauthorized access.
  - **Disabling Remote Root Login**: For security, he disables root access from external hosts.
  - **Removing Test Databases**: Bob deletes the default test database to keep things secure.

> *“A few simple steps, and now my database server is secure!”* Bob notes, feeling reassured about MariaDB’s security.

---

## **4. Connecting to MariaDB**

Now that the server is running and secured, Bob logs into MariaDB to start working with databases.

- **Logging into the Database**: He logs in as the root database user:

  ```bash
  sudo mysql -u root -p
  ```

  After entering his password, he sees the MariaDB prompt, indicating he’s successfully connected.

> *“I’m in! Time to explore databases from the inside,”* Bob says, feeling like a true DBA (database administrator).

---

## **5. Creating a Database and User**

Bob learns how to create databases and user accounts, a critical skill for managing application data.

- **Creating a New Database**: Bob creates a database for the new application, naming it `app_db`:

  ```sql
  CREATE DATABASE app_db;
  ```

- **Creating a User with Permissions**: Next, he creates a user, `appuser`, and grants them full access to the new database:

  ```sql
  CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'securepassword';
  GRANT ALL PRIVILEGES ON app_db.* TO 'appuser'@'localhost';
  ```

- **Applying Privileges**: He runs `FLUSH PRIVILEGES;` to make sure the permissions take effect:

  ```sql
  FLUSH PRIVILEGES;
  ```

> *“Now I have a dedicated user for my database—security and organization in one!”* Bob notes, feeling proud of his progress.

---

## **6. Testing the Database Connection**

To confirm everything is set up correctly, Bob tests his new user account.

- **Logging in as the New User**: He exits the root session and logs in as `appuser`:

  ```bash
  mysql -u appuser -p
  ```

  After entering the password, he successfully connects to MariaDB as `appuser`, confirming that the permissions are correctly set.

- **Checking Database Access**: Inside MariaDB, he switches to the `app_db` database:

  ```sql
  USE app_db;
  ```

  Bob now has access to his database and can start creating tables for his application.

> *“The user works perfectly, and I’m all set to manage data!”* Bob says, pleased with the setup.

---

## **7. Managing Data with SQL Commands**

Bob decides to practice creating tables and managing data within his new database.

- **Creating a Table**: In `app_db`, Bob creates a `customers` table with basic columns:

  ```sql
  CREATE TABLE customers (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100),
      email VARCHAR(100)
  );
  ```

- **Inserting Data**: Bob inserts a test record into the `customers` table:

  ```sql
  INSERT INTO customers (name, email) VALUES ('Alice', 'alice@example.com');
  ```

- **Querying Data**: To see if the data was inserted correctly, he queries the table:

  ```sql
  SELECT * FROM customers;
  ```

  He sees his data displayed, confirming that everything is working as expected.

> *“Now I’m really starting to feel like a database pro!”* Bob says, excited by the possibilities of SQL.

---

## **8. Backing Up and Restoring Databases**

Bob realizes that backups are crucial for databases, so he practices backing up and restoring his data.

- **Creating a Backup with `mysqldump`**: To back up `app_db`, Bob uses `mysqldump`:

  ```bash
  mysqldump -u root -p app_db > app_db_backup.sql
  ```

  This creates a `.sql` file containing all the data and structure of `app_db`.

- **Restoring from a Backup**: To restore a database, Bob uses:

  ```bash
  mysql -u root -p app_db < app_db_backup.sql
  ```

  This imports the data back into `app_db`, making it easy to recover in case of data loss.

> *“With regular backups, I won’t lose any important data,”* Bob says, reassured by his new backup skills.

---

## **9. Conclusion: Bob’s Database Server is Ready**

With MariaDB installed, configured, and secured, Bob now has a fully operational database server on AlmaLinux. He’s learned to create and manage databases, set up users, and even back up his data. Bob’s excited to use his database skills in future projects and is already planning his next steps in Linux system administration.

> Next up, Bob wants to dive into **system monitoring and logging** to gain insights into system health and user activity.
