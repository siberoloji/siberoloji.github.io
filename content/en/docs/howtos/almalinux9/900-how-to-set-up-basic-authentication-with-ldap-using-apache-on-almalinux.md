---
title: How to Set Up Basic Authentication with LDAP Using Apache
linkTitle: Basic Authentication with LDAP
description: Configuring basic authentication with LDAP in an Apache web server on AlmaLinux can secure your application by integrating it with centralized user directories.
date: 2024-12-18
weight: 900
url: set-basic-authentication-ldap-apache-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux


featured_image: /images/almalinux.webp
---
Configuring basic authentication with LDAP in an Apache web server on AlmaLinux can secure your application by integrating it with centralized user directories. LDAP (Lightweight Directory Access Protocol) allows you to manage user authentication in a scalable way, while Apache’s built-in modules make integration straightforward. In this guide, we’ll walk you through the process, step-by-step, with practical examples.

---

### Prerequisites

Before starting, ensure you have the following:

- **AlmaLinux server** with root or sudo access.
- **Apache web server** installed and running.
- **Access to an LDAP server**, such as OpenLDAP or Active Directory.
- Basic familiarity with Linux commands.

---

### Step 1: Update Your System

First, update your AlmaLinux system to ensure all packages are up to date:

```bash
sudo dnf update -y
sudo dnf install httpd mod_ldap -y
```

The `mod_ldap` package includes the necessary modules for Apache to communicate with an LDAP directory.

---

### Step 2: Enable and Start Apache

Verify that the Apache service is running and set it to start automatically on boot:

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
```

The `status` command should confirm that Apache is active and running.

---

### Step 3: Verify Required Apache Modules

Apache uses specific modules for LDAP-based authentication. Enable them using the following commands:

```bash
sudo dnf install mod_authnz_ldap
sudo systemctl restart httpd
```

Next, confirm that the modules are enabled:

```bash
httpd -M | grep ldap
```

You should see `authnz_ldap_module` and possibly `ldap_module` in the output.

---

### Step 4: Configure LDAP Authentication in Apache

1. **Edit the Virtual Host Configuration File**

   Open the Apache configuration file for your virtual host or default site:

   ```bash
   sudo nano /etc/httpd/conf.d/example.conf
   ```

   Replace `example.conf` with the name of your configuration file.

2. **Add LDAP Authentication Directives**

   Add the following configuration within the `<VirtualHost>` block or for a specific directory:

   ```apache
   <Directory "/var/www/html/secure">
       AuthType Basic
       AuthName "Restricted Area"
       AuthBasicProvider ldap
       AuthLDAPURL "ldap://ldap.example.com/ou=users,dc=example,dc=com?uid?sub?(objectClass=person)"
       AuthLDAPBindDN "cn=admin,dc=example,dc=com"
       AuthLDAPBindPassword "admin_password"
       Require valid-user
   </Directory>
   ```

   Explanation of the key directives:

   - `AuthType Basic`: Sets basic authentication.
   - `AuthName`: The name displayed in the login prompt.
   - `AuthBasicProvider ldap`: Specifies that LDAP is used for authentication.
   - `AuthLDAPURL`: Defines the LDAP server and search base (e.g., `ou=users,dc=example,dc=com`).
   - `AuthLDAPBindDN` and `AuthLDAPBindPassword`: Provide credentials for an account that can query the LDAP directory.
   - `Require valid-user`: Ensures only authenticated users can access.

3. **Save the File and Exit**

   Press `Ctrl+O` to save and `Ctrl+X` to exit.

---

### Step 5: Protect the Directory

To protect a directory, create one (if not already present):

```bash
sudo mkdir /var/www/html/secure
echo "Protected Content" | sudo tee /var/www/html/secure/index.html
```

Ensure proper permissions for the web server:

```bash
sudo chown -R apache:apache /var/www/html/secure
sudo chmod -R 755 /var/www/html/secure
```

---

### Step 6: Test the Configuration

1. **Check Apache Configuration**

   Before restarting Apache, validate the configuration:

   ```bash
   sudo apachectl configtest
   ```

   If everything is correct, you’ll see a message like *Syntax OK*.

2. **Restart Apache**

   Apply changes by restarting Apache:

   ```bash
   sudo systemctl restart httpd
   ```

3. **Access the Protected Directory**

   Open a web browser and navigate to `http://your_server_ip/secure`. You should be prompted to log in with an LDAP username and password.

---

### Step 7: Troubleshooting Tips

- **Log Files**: If authentication fails, review Apache’s log files for errors:

  ```bash
  sudo tail -f /var/log/httpd/error_log
  ```

- **Firewall Rules**: Ensure the LDAP port (default: 389 for non-secure, 636 for secure) is open:

  ```bash
  sudo firewall-cmd --add-port=389/tcp --permanent
  sudo firewall-cmd --reload
  ```

- **Verify LDAP Connectivity**: Use the `ldapsearch` command to verify connectivity to your LDAP server:

  ```bash
  ldapsearch -x -H ldap://ldap.example.com -D "cn=admin,dc=example,dc=com" -w admin_password -b "ou=users,dc=example,dc=com"
  ```

---

### Step 8: Optional – Use Secure LDAP (LDAPS)

To encrypt communication, configure Apache to use LDAPS:

1. Update the `AuthLDAPURL` directive to:

   ```apache
   AuthLDAPURL "ldaps://ldap.example.com/ou=users,dc=example,dc=com?uid?sub?(objectClass=person)"
   ```

2. Install the necessary SSL/TLS certificates. Copy the CA certificate for your LDAP server to `/etc/openldap/certs/`.

3. Update the OpenLDAP configuration:

   ```bash
   sudo nano /etc/openldap/ldap.conf
   ```

   Add the following lines:

   ```plaintext
   TLS_CACERT /etc/openldap/certs/ca-cert.pem
   ```

4. Restart Apache:

   ```bash
   sudo systemctl restart httpd
   ```

---

### Step 9: Verify and Optimize

1. **Test Authentication**: Revisit the protected URL and log in using an LDAP user.
2. **Performance Tuning**: For larger directories, consider configuring caching to improve performance. Add this directive to your configuration:

   ```apache
   LDAPSharedCacheSize 200000
   LDAPCacheEntries 1024
   LDAPCacheTTL 600
   ```

   These settings manage the cache size, number of entries, and time-to-live for LDAP queries.

---

### Conclusion

Configuring Basic Authentication with LDAP in Apache on AlmaLinux enhances security by integrating your web server with a centralized user directory. While the process may seem complex, breaking it into manageable steps ensures a smooth setup. By enabling secure communication with LDAPS, you further protect sensitive user credentials.

With these steps, your Apache server is ready to authenticate users against an LDAP directory, ensuring both security and centralized control.

For questions or additional insights, drop a comment below!
