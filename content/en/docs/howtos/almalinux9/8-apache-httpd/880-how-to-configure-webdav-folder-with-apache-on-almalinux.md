---
title: How to Configure WebDAV Folder with Apache on AlmaLinux
linkTitle: WebDAV Folder with Apache
description: We’ll walk you through configuring a WebDAV folder with Apache on AlmaLinux. By the end, you’ll have a secure and fully functional WebDAV server.
date: 2024-12-14
weight: 880
url: configure-webdav-folder-apache-almalinux
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
Web Distributed Authoring and Versioning (WebDAV) is a protocol that allows users to collaboratively edit and manage files on a remote server. Built into the HTTP protocol, WebDAV is commonly used for file sharing, managing resources, and supporting collaborative workflows. When paired with Apache on AlmaLinux, WebDAV provides a powerful solution for creating shared folders accessible over the web.

In this comprehensive guide, we’ll walk you through configuring a WebDAV folder with Apache on AlmaLinux. By the end, you’ll have a secure and fully functional WebDAV server.

---

### **Why Use WebDAV?**

WebDAV offers several benefits, including:

1. **Remote File Management**: Access, upload, delete, and edit files directly on the server.
2. **Collaboration**: Allows multiple users to work on shared resources seamlessly.
3. **Platform Independence**: Works with various operating systems, including Windows, macOS, and Linux.
4. **Built-In Client Support**: Most modern operating systems support WebDAV natively.

---

### **Prerequisites**

Before configuring WebDAV, ensure the following:

1. **A Server Running AlmaLinux**  
   Ensure root or sudo access to your AlmaLinux server.

2. **Apache Installed and Running**  
   If Apache isn’t already installed, set it up with:

   ```bash
   sudo dnf install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **Firewall Configuration**  
   Ensure that HTTP (port 80) and HTTPS (port 443) traffic are allowed through the firewall:

   ```bash
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   sudo firewall-cmd --reload
   ```

4. **Installed `mod_dav` and `mod_dav_fs` Modules**  
   These Apache modules are required to enable WebDAV.

---

### **Step 1: Enable the WebDAV Modules**

The `mod_dav` and `mod_dav_fs` modules provide WebDAV functionality for Apache.

1. **Verify if the Modules are Enabled**  
   Run the following command to check if the required modules are loaded:

   ```bash
   httpd -M | grep dav
   ```

   You should see output like:

   ```bash
   dav_module (shared)
   dav_fs_module (shared)
   ```

2. **Enable the Modules (if necessary)**  
   If the modules aren’t listed, enable them by editing the Apache configuration file:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

   Add the following lines (if not already present):

   ```apache
   LoadModule dav_module modules/mod_dav.so
   LoadModule dav_fs_module modules/mod_dav_fs.so
   ```

3. **Restart Apache**  
   Apply the changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 2: Create a WebDAV Directory**

Create the directory that will store the WebDAV files.

1. **Create the Directory**  
   For example, create a directory named `/var/www/webdav`:

   ```bash
   sudo mkdir -p /var/www/webdav
   ```

2. **Set Ownership and Permissions**  
   Grant ownership to the `apache` user and set the appropriate permissions:

   ```bash
   sudo chown -R apache:apache /var/www/webdav
   sudo chmod -R 755 /var/www/webdav
   ```

3. **Add Sample Files**  
   Place a sample file in the directory for testing:

   ```bash
   echo "This is a WebDAV folder." | sudo tee /var/www/webdav/sample.txt
   ```

---

### **Step 3: Configure the Apache WebDAV Virtual Host**

1. **Create a New Configuration File**  
   Create a new virtual host file for WebDAV, such as `/etc/httpd/conf.d/webdav.conf`:

   ```bash
   sudo nano /etc/httpd/conf.d/webdav.conf
   ```

2. **Add the Virtual Host Configuration**  
   Add the following content:

   ```apache
   <VirtualHost *:80>
       ServerName your-domain.com
       DocumentRoot /var/www/webdav

       <Directory /var/www/webdav>
           Options Indexes FollowSymLinks
           AllowOverride None
           Require all granted

           DAV On
           AuthType Basic
           AuthName "WebDAV Restricted Area"
           AuthUserFile /etc/httpd/.webdavpasswd
           Require valid-user
       </Directory>
   </VirtualHost>
   ```

   Key Directives:
   - `DAV On`: Enables WebDAV in the specified directory.
   - `AuthType` and `AuthName`: Configure Basic Authentication for user access.
   - `AuthUserFile`: Specifies the file storing user credentials.
   - `Require valid-user`: Grants access only to authenticated users.

3. **Save and Restart Apache**  
   Restart Apache to apply the changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 4: Secure Access with Basic Authentication**

1. **Install `httpd-tools`**  
   Install the `httpd-tools` package, which includes the `htpasswd` utility:

   ```bash
   sudo dnf install httpd-tools -y
   ```

2. **Create a Password File**  
   Create a new password file to store credentials for WebDAV users:

   ```bash
   sudo htpasswd -c /etc/httpd/.webdavpasswd username
   ```

   Replace `username` with the desired username. You’ll be prompted to enter and confirm a password.

3. **Add Additional Users (if needed)**  
   To add more users, omit the `-c` flag:

   ```bash
   sudo htpasswd /etc/httpd/.webdavpasswd anotheruser
   ```

4. **Secure the Password File**  
   Set the correct permissions for the password file:

   ```bash
   sudo chmod 640 /etc/httpd/.webdavpasswd
   sudo chown root:apache /etc/httpd/.webdavpasswd
   ```

---

### **Step 5: Test WebDAV Access**

1. **Access the WebDAV Folder in a Browser**  
   Open your browser and navigate to:

   ```html
   http://your-domain.com
   ```

   Enter the username and password created earlier. You should see the contents of the WebDAV directory.

2. **Test WebDAV with a Client**  
   Use a WebDAV-compatible client, such as:
   - **Windows File Explorer**:  
     Map the WebDAV folder by right-clicking *This PC* > *Add a network location*.
   - **macOS Finder**:  
     Connect to the server via *Finder* > *Go* > *Connect to Server*.
   - **Linux**:  
     Use a file manager like Nautilus or a command-line tool like `cadaver`.

---

### **Step 6: Secure Your WebDAV Server**

#### **1. Enable HTTPS**

Basic Authentication sends credentials in plaintext, making it insecure over HTTP. Secure the connection by enabling HTTPS with Let’s Encrypt:

1. Install Certbot:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   ```

2. Obtain and Configure an SSL Certificate:

   ```bash
   sudo certbot --apache -d your-domain.com
   ```

3. Test HTTPS Access:
   Navigate to:

   ```html
   https://your-domain.com
   ```

---

#### **2. Restrict Access by IP**

Limit access to specific IP addresses or ranges by adding the following to the WebDAV configuration:

```apache
<Directory /var/www/webdav>
    Require ip 192.168.1.0/24
</Directory>
```

---

#### **3. Monitor Logs**

Regularly review Apache’s logs for unusual activity:

- Access log:  

  ```bash
  sudo tail -f /var/log/httpd/access_log
  ```

- Error log:  

  ```bash
  sudo tail -f /var/log/httpd/error_log
  ```

---

### **Troubleshooting Common Issues**

1. **403 Forbidden Error**  
   - Ensure the WebDAV directory has the correct permissions:

     ```bash
     sudo chmod -R 755 /var/www/webdav
     sudo chown -R apache:apache /var/www/webdav
     ```

   - Verify the `DAV On` directive is properly configured.

2. **Authentication Fails**  
   - Check the password file path in `AuthUserFile`.
   - Test credentials with:

     ```bash
     cat /etc/httpd/.webdavpasswd
     ```

3. **Changes Not Reflected**  
   Restart Apache after configuration updates:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Conclusion**

Setting up a WebDAV folder with Apache on AlmaLinux allows you to create a flexible, web-based file sharing and collaboration system. By enabling WebDAV, securing it with Basic Authentication, and using HTTPS, you can safely manage and share files remotely.

This guide has equipped you with the steps to configure, secure, and test a WebDAV folder. Whether for personal use, team collaboration, or secure file sharing, your AlmaLinux server is now ready to serve as a reliable WebDAV platform.
