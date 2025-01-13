---
title: How to Configure PostgreSQL Over SSL/TLS on AlmaLinux
linkTitle: PostgreSQL Over SSL/TLS
description: This guide provides a detailed walkthrough to configure PostgreSQL over SSL/TLS on AlmaLinux.
date: 2024-12-19
weight: 1080
url: configure-postgresql-ssl-tls-almalinux
draft: false
tags:
  - AlmaLinux
  - postgresql
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
PostgreSQL is a robust and open-source relational database system renowned for its reliability and advanced features. One critical aspect of database security is ensuring secure communication between the server and clients. Configuring PostgreSQL to use **SSL/TLS** (Secure Sockets Layer / Transport Layer Security) on **AlmaLinux** is a vital step in safeguarding data in transit against eavesdropping and tampering.

This guide provides a detailed walkthrough to configure PostgreSQL over SSL/TLS on AlmaLinux. By the end of this article, you'll have a secure PostgreSQL setup capable of encrypted communication with its clients.

---

### Table of Contents

1. Understanding SSL/TLS in PostgreSQL
2. Prerequisites
3. Installing PostgreSQL on AlmaLinux
4. Generating SSL Certificates
5. Configuring PostgreSQL for SSL/TLS
6. Enabling the PostgreSQL Client to Use SSL/TLS
7. Testing SSL/TLS Connections
8. Troubleshooting Common Issues
9. Best Practices for SSL/TLS in PostgreSQL
10. Conclusion

---

### 1. Understanding SSL/TLS in PostgreSQL

**SSL/TLS** is a protocol designed to provide secure communication over a network. In PostgreSQL, enabling SSL/TLS ensures that the data exchanged between the server and its clients is encrypted. This is particularly important for databases exposed over the internet or in environments where sensitive data is transferred.

Key benefits include:

- **Data Integrity:** Protects against data tampering during transmission.
- **Confidentiality:** Encrypts sensitive information such as login credentials and query data.
- **Authentication:** Verifies the identity of the server and optionally the client.

---

### 2. Prerequisites

Before proceeding, ensure the following:

- AlmaLinux is installed and up-to-date.
- PostgreSQL is installed on the server.
- Access to a root or sudo-enabled user.
- Basic knowledge of SSL/TLS concepts.

---

### 3. Installing PostgreSQL on AlmaLinux

If PostgreSQL isn’t already installed, follow these steps:

1. **Enable the PostgreSQL repository:**

   ```bash
   sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

2. **Disable the default PostgreSQL module:**

   ```bash
   sudo dnf -qy module disable postgresql
   ```

3. **Install PostgreSQL:**

   ```bash
   sudo dnf install -y postgresql15-server
   ```

4. **Initialize and start PostgreSQL:**

   ```bash
   sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
   sudo systemctl enable postgresql-15
   sudo systemctl start postgresql-15
   ```

---

### 4. Generating SSL Certificates

PostgreSQL requires a valid SSL certificate and key to enable SSL/TLS. These can be self-signed for internal use or obtained from a trusted certificate authority (CA).

#### Step 1: Create a Self-Signed Certificate

1. **Install OpenSSL:**

   ```bash
   sudo dnf install -y openssl
   ```

2. **Generate a private key:**

   ```bash
   openssl genrsa -out server.key 2048
   ```

3. **Set secure permissions for the private key:**

   ```bash
   chmod 600 server.key
   ```

4. **Create a certificate signing request (CSR):**

   ```bash
   openssl req -new -key server.key -out server.csr
   ```

   Provide the required information during the prompt (e.g., Common Name should match your server’s hostname or IP).

5. **Generate the self-signed certificate:**

   ```bash
   openssl x509 -req -in server.csr -signkey server.key -out server.crt -days 365
   ```

#### Step 2: Place the Certificates in the PostgreSQL Directory

Move the generated certificate and key to PostgreSQL's data directory:

```bash
sudo mv server.crt server.key /var/lib/pgsql/15/data/
```

Ensure the files have the correct permissions:

```bash
sudo chown postgres:postgres /var/lib/pgsql/15/data/server.*
```

---

### 5. Configuring PostgreSQL for SSL/TLS

#### Step 1: Enable SSL in `postgresql.conf`

1. Open the configuration file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/postgresql.conf
   ```

2. Locate the `ssl` parameter and set it to `on`:

   ```plaintext
   ssl = on
   ```

3. Save and exit the file.

#### Step 2: Configure Client Authentication in `pg_hba.conf`

1. Open the `pg_hba.conf` file:

   ```bash
   sudo nano /var/lib/pgsql/15/data/pg_hba.conf
   ```

2. Add the following line to require SSL for all connections (adjust `host` parameters as needed):

   ```plaintext
   hostssl    all    all    0.0.0.0/0    md5
   ```

3. Save and exit the file.

#### Step 3: Restart PostgreSQL

Restart the service to apply changes:

```bash
sudo systemctl restart postgresql-15
```

---

### 6. Enabling the PostgreSQL Client to Use SSL/TLS

To connect securely, the PostgreSQL client must trust the server’s certificate.

1. Copy the server's certificate (`server.crt`) to the client machine.
2. Place the certificate in a trusted directory, e.g., `~/.postgresql/`.
3. Use the `sslmode` option when connecting:

   ```bash
   psql "host=<server_ip> dbname=<database_name> user=<username> sslmode=require"
   ```

---

### 7. Testing SSL/TLS Connections

1. **Check PostgreSQL logs:**
   Verify that SSL is enabled by inspecting the logs:

   ```bash
   sudo tail -f /var/lib/pgsql/15/data/log/postgresql-*.log
   ```

2. **Connect using `psql`:**
   Use the `sslmode` parameter to enforce SSL:

   ```bash
   psql -h <server_ip> -U <username> -d <database_name> --sslmode=require
   ```

3. If the connection succeeds, confirm encryption using:

   ```sql
   SHOW ssl;
   ```

   The result should display `on`.

---

### 8. Troubleshooting Common Issues

#### Issue: SSL Connection Fails

- **Cause:** Incorrect certificate or permissions.
- **Solution:** Ensure `server.key` has `600` permissions and is owned by the `postgres` user.

#### Issue: `sslmode` Mismatch

- **Cause:** Client not configured for SSL.
- **Solution:** Verify the client’s `sslmode` configuration.

#### Issue: Firewall Blocks SSL Port

- **Cause:** PostgreSQL port (default 5432) is blocked.
- **Solution:** Open the port in the firewall:

  ```bash
  sudo firewall-cmd --permanent --add-port=5432/tcp
  sudo firewall-cmd --reload
  ```

---

### 9. Best Practices for SSL/TLS in PostgreSQL

- Use certificates signed by a trusted CA for production environments.
- Rotate certificates periodically to minimize the risk of compromise.
- Enforce `sslmode=verify-full` for clients to ensure server identity.
- Restrict IP ranges in `pg_hba.conf` to minimize exposure.

---

### 10. Conclusion

Configuring PostgreSQL over SSL/TLS on AlmaLinux is a crucial step in enhancing the security of your database infrastructure. By encrypting client-server communications, you protect sensitive data from unauthorized access. This guide walked you through generating SSL certificates, configuring PostgreSQL for SSL/TLS, and testing secure connections.

With proper setup and adherence to best practices, you can ensure a secure and reliable PostgreSQL deployment capable of meeting modern security requirements.
