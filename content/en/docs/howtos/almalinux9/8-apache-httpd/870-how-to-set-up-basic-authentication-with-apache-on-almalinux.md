---
title: How to Set Up Basic Authentication with Apache on AlmaLinux
linkTitle: Basic Authentication with Apache
description: In this guide, we’ll walk you through configuring Basic Authentication on Apache running on AlmaLinux, ensuring secure access to protected resources.
date: 2024-12-14
weight: 870
url: set-basic-authentication-apache-almalinux
draft: false
tags:
  - AlmaLinux
  - apache
categories:
  - Linux
  - Linux How-to
  - basic authentication
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-set-up-basic-authentication-with-apache-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Basic Authentication is a simple yet effective way to restrict access to certain parts of your website or web application. It prompts users to enter a username and password to gain access, providing a layer of security without the need for complex login systems. Apache HTTP Server, paired with AlmaLinux, offers a straightforward method to implement Basic Authentication.

In this guide, we’ll walk you through configuring Basic Authentication on Apache running on AlmaLinux, ensuring secure access to protected resources.

---

### **Why Use Basic Authentication?**

Basic Authentication is ideal for:

1. **Restricting Access to Sensitive Pages**: Protect administrative panels, development environments, or internal resources.
2. **Quick and Simple Setup**: No additional software or extensive coding is required.
3. **Lightweight Protection**: Effective for low-traffic sites or internal projects without full authentication systems.

---

### **Prerequisites**

Before setting up Basic Authentication, ensure the following:

1. **A Server Running AlmaLinux**  
   With root or sudo privileges.

2. **Apache Installed and Running**  
   If not installed, install Apache with:

   ```bash
   sudo dnf install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **Administrative Access**  
   Familiarity with Linux commands and file editing tools like `nano` or `vim`.

---

### **Step 1: Enable the `mod_authn_core` and `mod_auth_basic` Modules**

Apache’s Basic Authentication relies on the `mod_authn_core` and `mod_auth_basic` modules. These modules

These modules should be enabled by default in most Apache installations. Verify they are loaded:

```bash
httpd -M | grep auth
```

Look for `authn_core_module` and `auth_basic_module` in the output. If these modules are not listed, enable them by editing the Apache configuration file:

1. Open the Apache configuration file:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

2. Add the following lines (if not already present):

   ```apache
   LoadModule authn_core_module modules/mod_authn_core.so
   LoadModule auth_basic_module modules/mod_auth_basic.so
   ```

3. Save the file and restart Apache to apply the changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 2: Create a Password File Using `htpasswd`**

The `htpasswd` utility is used to create and manage user credentials for Basic Authentication.

1. **Install `httpd-tools`**  
   The `htpasswd` utility is included in the `httpd-tools` package. Install it with:

   ```bash
   sudo dnf install httpd-tools -y
   ```

2. **Create a Password File**  
   Use `htpasswd` to create a file that stores user credentials:

   ```bash
   sudo htpasswd -c /etc/httpd/.htpasswd username
   ```

   - Replace `username` with the desired username.
   - The `-c` flag creates a new file. Omit this flag to add additional users to an existing file.

   You’ll be prompted to enter and confirm the password. The password is hashed and stored in the `/etc/httpd/.htpasswd` file.

3. **Verify the Password File**  
   Check the contents of the file:

   ```bash
   cat /etc/httpd/.htpasswd
   ```

   You’ll see the username and the hashed password.

---

### **Step 3: Configure Apache for Basic Authentication**

To restrict access to a specific directory, update the Apache configuration.

1. **Edit the Apache Configuration File**  
   For example, to protect the `/var/www/html/protected` directory, create or modify the `.conf` file for the site:

   ```bash
   sudo nano /etc/httpd/conf.d/protected.conf
   ```

2. **Add Authentication Directives**  
   Add the following configuration to enable Basic Authentication:

   ```apache
   <Directory "/var/www/html/protected">
       AuthType Basic
       AuthName "Restricted Area"
       AuthUserFile /etc/httpd/.htpasswd
       Require valid-user
   </Directory>
   ```

   - **AuthType**: Specifies the authentication type, which is `Basic` in this case.
   - **AuthName**: Sets the message displayed in the login prompt.
   - **AuthUserFile**: Points to the password file created with `htpasswd`.
   - **Require valid-user**: Allows access only to users listed in the password file.

3. **Save the File and Restart Apache**  
   Restart Apache to apply the changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 4: Create the Protected Directory**

If the directory you want to protect doesn’t already exist, create it and add some content to test the configuration.

1. Create the directory:

   ```bash
   sudo mkdir -p /var/www/html/protected
   ```

2. Add a sample file:

   ```bash
   echo "This is a protected area." | sudo tee /var/www/html/protected/index.html
   ```

3. Set the proper ownership and permissions:

   ```bash
   sudo chown -R apache:apache /var/www/html/protected
   sudo chmod -R 755 /var/www/html/protected
   ```

---

### **Step 5: Test the Basic Authentication Setup**

1. Open a web browser and navigate to the protected directory:

   ```html
   http://<your-server-ip>/protected
   ```

2. A login prompt should appear. Enter the username and password created with `htpasswd`.

3. If the credentials are correct, you’ll gain access to the protected content.

---

### **Advanced Configuration Options**

#### **1. Restrict Access to Specific Users**

If you want to allow access to specific users, modify the `Require` directive:

```apache
Require user username1 username2
```

Replace `username1` and `username2` with the allowed usernames.

---

#### **2. Restrict Access by IP and User**

You can combine IP-based restrictions with Basic Authentication:

```apache
<Directory "/var/www/html/protected">
    AuthType Basic
    AuthName "Restricted Area"
    AuthUserFile /etc/httpd/.htpasswd
    Require valid-user
    Require ip 192.168.1.0/24
</Directory>
```

This configuration allows access only to users with valid credentials from the specified IP range.

---

#### **3. Secure the Password File**

Ensure the password file is not accessible via the web by setting appropriate permissions:

```bash
sudo chmod 640 /etc/httpd/.htpasswd
sudo chown root:apache /etc/httpd/.htpasswd
```

---

#### **4. Use HTTPS for Authentication**

Basic Authentication transmits credentials in plaintext, making it insecure over HTTP. To secure authentication, enable HTTPS:

1. Install Certbot and the Apache plugin:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   ```

2. Obtain an SSL certificate from Let’s Encrypt:

   ```bash
   sudo certbot --apache
   ```

3. Test the HTTPS configuration by navigating to the secure URL:

   ```html
   https://<your-server-ip>/protected
   ```

---

### **Troubleshooting Common Issues**

1. **Login Prompt Doesn’t Appear**  
   - Check if the `mod_auth_basic` module is enabled.
   - Verify the `AuthUserFile` path is correct.

2. **Access Denied After Entering Credentials**  
   - Ensure the username exists in the `.htpasswd` file.
   - Verify permissions for the `.htpasswd` file.

3. **Changes Not Reflected**  
   Restart Apache after modifying configurations:

   ```bash
   sudo systemctl restart httpd
   ```

4. **Password File Not Found Error**  
   Double-check the path to the `.htpasswd` file and ensure it matches the `AuthUserFile` directive.

---

### **Conclusion**

Setting up Basic Authentication with Apache on AlmaLinux is a straightforward way to secure sensitive areas of your web server. While not suitable for highly sensitive applications, it serves as an effective tool for quick access control and lightweight security.

By following this guide, you’ve learned to enable Basic Authentication, create and manage user credentials, and implement additional layers of security. For enhanced protection, combine Basic Authentication with HTTPS to encrypt user credentials during transmission.
