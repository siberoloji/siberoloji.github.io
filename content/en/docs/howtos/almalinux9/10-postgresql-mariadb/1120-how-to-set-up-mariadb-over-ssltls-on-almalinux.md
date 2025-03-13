---
title: How to Set Up MariaDB Over SSL/TLS on AlmaLinux
linkTitle: Set Up MariaDB Over SSL/TLS
description: This guide provides a comprehensive walkthrough to set up MariaDB over SSL/TLS on AlmaLinux.
date: 2024-12-22
weight: 1120
url: set-mariadb-ssl-tls-almalinux
draft: false
tags:
  - AlmaLinux
  - mariadb
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-set-up-mariadb-over-ssltls-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Securing database connections is a critical aspect of modern database administration. Using **SSL/TLS** (Secure Sockets Layer / Transport Layer Security) to encrypt connections between MariaDB servers and their clients is essential to protect sensitive data in transit. AlmaLinux, a stable and secure RHEL-based distribution, is an excellent platform for hosting MariaDB with SSL/TLS enabled.

This guide provides a comprehensive walkthrough to set up MariaDB over SSL/TLS on AlmaLinux. By the end, you’ll have a secure MariaDB setup capable of encrypted client-server communication.

---

### Table of Contents

1. Introduction to SSL/TLS in MariaDB
2. Prerequisites
3. Installing MariaDB on AlmaLinux
4. Generating SSL/TLS Certificates
5. Configuring MariaDB for SSL/TLS
6. Configuring Clients for SSL/TLS
7. Testing the SSL/TLS Configuration
8. Enforcing SSL/TLS Connections
9. Troubleshooting Common Issues
10. Conclusion

---

### 1. Introduction to SSL/TLS in MariaDB

SSL/TLS ensures secure communication between MariaDB servers and clients by encrypting data in transit. This prevents eavesdropping, data tampering, and man-in-the-middle attacks. Key benefits include:

- **Data Integrity:** Ensures data is not tampered with during transmission.
- **Confidentiality:** Encrypts sensitive data such as credentials and query results.
- **Authentication:** Verifies the server and optionally the client’s identity.

---

### 2. Prerequisites

Before starting, ensure you have:

1. **AlmaLinux Installed:** A running instance of AlmaLinux with root or sudo access.
2. **MariaDB Installed:** MariaDB server installed and running on AlmaLinux.
3. **Basic Knowledge:** Familiarity with Linux commands and MariaDB operations.
4. **OpenSSL Installed:** Used to generate SSL/TLS certificates:

   ```bash
   sudo dnf install -y openssl
   ```

---

### 3. Installing MariaDB on AlmaLinux

If MariaDB is not already installed, follow these steps:

1. **Install MariaDB:**

   ```bash
   sudo dnf install -y mariadb-server mariadb
   ```

2. **Start and Enable the Service:**

   ```bash
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   ```

3. **Secure MariaDB Installation:**

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set a root password, remove anonymous users, and disallow remote root login.

---

### 4. Generating SSL/TLS Certificates

To enable SSL/TLS, MariaDB requires server and client certificates. These can be self-signed or issued by a Certificate Authority (CA).

#### Step 1: Create a Directory for Certificates

Create a directory to store the certificates:

```bash
sudo mkdir /etc/mysql/ssl
sudo chmod 700 /etc/mysql/ssl
```

#### Step 2: Generate a Private Key for the Server

```bash
openssl genrsa -out /etc/mysql/ssl/server-key.pem 2048
```

#### Step 3: Create a Certificate Signing Request (CSR)

```bash
openssl req -new -key /etc/mysql/ssl/server-key.pem -out /etc/mysql/ssl/server-csr.pem
```

Provide the required information (e.g., Common Name should match the server’s hostname).

#### Step 4: Generate the Server Certificate

```bash
openssl x509 -req -in /etc/mysql/ssl/server-csr.pem -signkey /etc/mysql/ssl/server-key.pem -out /etc/mysql/ssl/server-cert.pem -days 365
```

#### Step 5: Create the CA Certificate

Generate a CA certificate to sign client certificates:

```bash
openssl req -newkey rsa:2048 -nodes -keyout /etc/mysql/ssl/ca-key.pem -x509 -days 365 -out /etc/mysql/ssl/ca-cert.pem
```

#### Step 6: Set Permissions

Ensure the certificates and keys are owned by the MariaDB user:

```bash
sudo chown -R mysql:mysql /etc/mysql/ssl
sudo chmod 600 /etc/mysql/ssl/*.pem
```

---

### 5. Configuring MariaDB for SSL/TLS

#### Step 1: Edit the MariaDB Configuration File

Modify `/etc/my.cnf` to enable SSL/TLS:

```bash
sudo nano /etc/my.cnf
```

Add the following under the `[mysqld]` section:

```plaintext
[mysqld]
ssl-ca=/etc/mysql/ssl/ca-cert.pem
ssl-cert=/etc/mysql/ssl/server-cert.pem
ssl-key=/etc/mysql/ssl/server-key.pem
```

#### Step 2: Restart MariaDB

Restart MariaDB to apply the changes:

```bash
sudo systemctl restart mariadb
```

---

### 6. Configuring Clients for SSL/TLS

To connect securely, MariaDB clients must trust the server’s certificate and optionally present their own.

1. Copy the `ca-cert.pem` file to the client machine:

   ```bash
   scp /etc/mysql/ssl/ca-cert.pem user@client-machine:/path/to/ca-cert.pem
   ```

2. Use the `mysql` client to connect securely:

   ```bash
   mysql --host=<server_ip> --user=<username> --password --ssl-ca=/path/to/ca-cert.pem
   ```

---

### 7. Testing the SSL/TLS Configuration

1. **Check SSL Status on the Server:**
   Log in to MariaDB and verify SSL is enabled:

   ```sql
   SHOW VARIABLES LIKE 'have_ssl';
   ```

   Output:

   ```plaintext
   +---------------+-------+
   | Variable_name | Value |
   +---------------+-------+
   | have_ssl      | YES   |
   +---------------+-------+
   ```

2. **Verify Connection Encryption:**
   Use the following query to check if the connection is encrypted:

   ```sql
   SHOW STATUS LIKE 'Ssl_cipher';
   ```

   A non-empty result confirms encryption.

---

### 8. Enforcing SSL/TLS Connections

To enforce SSL/TLS, update the user privileges:

1. **Log in to MariaDB:**

   ```bash
   sudo mysql -u root -p
   ```

2. **Require SSL for a User:**

   ```sql
   GRANT ALL PRIVILEGES ON *.* TO 'secure_user'@'%' REQUIRE SSL;
   FLUSH PRIVILEGES;
   ```

3. **Test the Configuration:**
   Try connecting without SSL. It should fail.

---

### 9. Troubleshooting Common Issues

#### SSL Handshake Error

- **Cause:** Incorrect certificate or key permissions.
- **Solution:** Verify ownership and permissions:

  ```bash
  sudo chown mysql:mysql /etc/mysql/ssl/*
  sudo chmod 600 /etc/mysql/ssl/*.pem
  ```

#### Connection Refused

- **Cause:** Firewall blocking MariaDB’s port.
- **Solution:** Open the port in the firewall:

  ```bash
  sudo firewall-cmd --permanent --add-service=mysql
  sudo firewall-cmd --reload
  ```

#### Client Cannot Verify Certificate

- **Cause:** Incorrect CA certificate on the client.
- **Solution:** Ensure the client uses the correct `ca-cert.pem`.

---

### 10. Conclusion

Setting up MariaDB over SSL/TLS on AlmaLinux enhances the security of your database by encrypting all communications between the server and its clients. With this guide, you’ve learned to generate SSL certificates, configure MariaDB for secure connections, and enforce SSL/TLS usage. Regularly monitor and update certificates to maintain a secure database environment.

By following these steps, you can confidently deploy a secure MariaDB instance, safeguarding your data against unauthorized access and network-based threats.
