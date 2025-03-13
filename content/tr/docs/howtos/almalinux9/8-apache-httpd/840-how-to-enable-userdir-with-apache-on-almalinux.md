---
title: How to Enable Userdir with Apache on AlmaLinux
linkTitle: Enable Userdir with Apache
description: This guide provides a step-by-step approach to enabling and configuring the Userdir module on Apache in AlmaLinux
date: 2024-12-14
weight: 840
url: enable-userdir-apache-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: enable-userdir-apache-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
The `mod_userdir` module in Apache is a useful feature that allows users on a server to host personal websites or share files from their home directories. When enabled, each user on the server can create a `public_html` directory in their home folder and serve web content through a URL such as `http://example.com/~username`.

This guide provides a step-by-step approach to enabling and configuring the **Userdir** module on Apache in AlmaLinux, a popular enterprise-grade Linux distribution.

---

### **Why Enable Userdir?**

Enabling the `mod_userdir` module offers several advantages:

1. **Convenience for Users**: Users can easily host and manage their own web content without requiring administrative access.
2. **Multi-Purpose Hosting**: It’s perfect for educational institutions, shared hosting environments, or collaborative projects.
3. **Efficient Testing**: Developers can use Userdir to test web applications before deploying them to the main server.

---

### **Prerequisites**

Before you begin, ensure the following:

1. **A Server Running AlmaLinux**  
   Ensure Apache is installed and running.

2. **User Accounts on the System**  
   Userdir works with local system accounts. Confirm there are valid users on the server or create new ones.

3. **Administrative Privileges**  
   You need root or `sudo` access to configure Apache and modify system files.

---

### **Step 1: Install and Verify Apache**

If Apache is not already installed, install it using the `dnf` package manager:

```bash
sudo dnf install httpd -y
```

Start the Apache service and enable it to start on boot:

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

Verify that Apache is running:

```bash
sudo systemctl status httpd
```

---

### **Step 2: Enable the Userdir Module**

1. **Verify the `mod_userdir` Module**  
   Apache’s Userdir functionality is provided by the `mod_userdir` module. Check if it’s installed by listing the available modules:

   ```bash
   httpd -M | grep userdir
   ```

   If you see `userdir_module`, the module is enabled. If it’s not listed, ensure Apache's core modules are correctly installed.

2. **Enable the Userdir Module**  
   Open the Userdir configuration file:

   ```bash
   sudo nano /etc/httpd/conf.d/userdir.conf
   ```

   Ensure the following lines are present and uncommented:

   ```apache
   <IfModule mod_userdir.c>
       UserDir public_html
       UserDir enabled
   </IfModule>
   ```

   This configuration tells Apache to look for a `public_html` directory in each user’s home folder.

---

### **Step 3: Configure Permissions**

The Userdir feature requires proper directory and file permissions to serve content securely.

1. **Create a `public_html` Directory for a User**  
   Assuming you have a user named `testuser`, create their `public_html` directory:

   ```bash
   sudo mkdir /home/testuser/public_html
   ```

   Set the correct ownership and permissions:

   ```bash
   sudo chown -R testuser:testuser /home/testuser/public_html
   sudo chmod 755 /home/testuser
   sudo chmod 755 /home/testuser/public_html
   ```

2. **Add Sample Content**  
   Create an example HTML file in the user’s `public_html` directory:

   ```bash
   echo "<h1>Welcome to testuser's page</h1>" > /home/testuser/public_html/index.html
   ```

---

### **Step 4: Adjust SELinux Settings**

If SELinux is enabled on AlmaLinux, it may block Apache from accessing user directories. To allow Userdir functionality:

1. **Set the SELinux Context**  
   Apply the correct SELinux context to the `public_html` directory:

   ```bash
   sudo semanage fcontext -a -t httpd_user_content_t "/home/testuser/public_html(/.*)?"
   sudo restorecon -Rv /home/testuser/public_html
   ```

   If the `semanage` command is not available, install the required package:

   ```bash
   sudo dnf install policycoreutils-python-utils -y
   ```

2. **Verify SELinux Settings**  
   Ensure Apache is allowed to read user directories:

   ```bash
   sudo getsebool httpd_enable_homedirs
   ```

   If it’s set to `off`, enable it:

   ```bash
   sudo setsebool -P httpd_enable_homedirs on
   ```

---

### **Step 5: Configure the Firewall**

The firewall must allow HTTP traffic for Userdir to work. Open the necessary ports:

1. **Allow HTTP and HTTPS Services**  
   Enable these services in the firewall:

   ```bash
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   sudo firewall-cmd --reload
   ```

2. **Verify the Firewall Configuration**  
   List the active zones and rules to confirm:

   ```bash
   sudo firewall-cmd --list-all
   ```

---

### **Step 6: Test Userdir Functionality**

Restart Apache to apply the changes:

```bash
sudo systemctl restart httpd
```

1. Open a web browser and navigate to the following URL:

   ```html
   http://your-server-ip/~testuser
   ```

2. You should see the content from the `index.html` file in the `public_html` directory:

   ```html
   Welcome to testuser's page
   ```

---

### **Advanced Configuration**

#### **1. Restrict User Access**

To disable Userdir for specific users, edit the `userdir.conf` file:

```apache
UserDir disabled username
```

Replace `username` with the user account you want to exclude.

#### **2. Limit Directory Access**

Restrict access to specific IPs or networks using `<Directory>` directives in the `userdir.conf` file:

```apache
<Directory /home/*/public_html>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require ip 192.168.1.0/24
</Directory>
```

#### **3. Customize Error Messages**

If a user’s `public_html` directory doesn’t exist, Apache returns a 404 error. You can customize this behavior by creating a fallback error page.

Edit the Apache configuration:

```apache
ErrorDocument 404 /custom_404.html
```

Place the custom error page at the specified location:

```bash
sudo echo "<h1>Page Not Found</h1>" > /var/www/html/custom_404.html
```

Restart Apache:

```bash
sudo systemctl restart httpd
```

---

### **Troubleshooting**

1. **403 Forbidden Error**  
   - Ensure the permissions for the user’s home and `public_html` directories are set to 755.
   - Check SELinux settings using `getenforce` and adjust as necessary.

2. **File Not Found Error**  
   Verify the `public_html` directory exists and contains an `index.html` file.

3. **Apache Not Reading User Directories**  
   - Confirm that the `UserDir` directives are enabled in `userdir.conf`.
   - Test the Apache configuration:

     ```bash
     sudo apachectl configtest
     ```

4. **Firewall Blocking Requests**  
   Ensure the firewall allows HTTP traffic.

---

### **Conclusion**

Enabling the Userdir module on Apache in AlmaLinux is a practical way to allow individual users to host and manage their web content. By carefully configuring permissions, SELinux, and firewall rules, you can set up a secure and efficient environment for user-based web hosting.

Whether you’re running a shared hosting server, managing an educational lab, or offering personal hosting services, Userdir is a versatile feature that expands the capabilities of Apache. Follow this guide to streamline your setup and ensure smooth functionality for all users.
