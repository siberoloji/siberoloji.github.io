---
title: How to Configure Basic Authentication with PAM in Apache on AlmaLinux
linkTitle: Basic Authentication with PAM
description: This guide provides a detailed walkthrough for configuring Basic Authentication with PAM on Apache running on AlmaLinux.
date: 2024-12-14
weight: 890
url: configure-basic-authentication-pam-apache-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-configure-basic-authentication-with-pam-in-apache-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Basic Authentication is a lightweight method to secure web resources by requiring users to authenticate with a username and password. By integrating Basic Authentication with **Pluggable Authentication Module (PAM)**, Apache can leverage the underlying system's authentication mechanisms, allowing for more secure and flexible access control.

This guide provides a detailed walkthrough for configuring Basic Authentication with PAM on Apache running on AlmaLinux. By the end, you’ll have a robust authentication setup that integrates seamlessly with your system’s user database.

---

### **What is PAM?**

PAM (Pluggable Authentication Module) is a powerful authentication framework used in Linux systems. It enables applications like Apache to authenticate users using various backends, such as:

1. **System User Accounts**: Authenticate users based on local Linux accounts.
2. **LDAP**: Authenticate against a central directory service.
3. **Custom Authentication Modules**: Extend functionality with additional authentication methods.

Integrating PAM with Apache allows you to enforce a unified authentication policy across your server.

---

### **Prerequisites**

Before proceeding, ensure the following:

1. **A Server Running AlmaLinux**  
   Root or sudo access is required.

2. **Apache Installed and Running**  
   If Apache isn’t installed, install and start it:

   ```bash
   sudo dnf install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **`mod_authnz_pam` Module**  
   This Apache module bridges PAM and Apache, enabling PAM-based authentication.

4. **Firewall Configuration**  
   Ensure HTTP (port 80) and HTTPS (port 443) traffic is allowed:

   ```bash
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   sudo firewall-cmd --reload
   ```

---

### **Step 1: Install the Required Packages**

1. **Install `mod_authnz_pam`**  
   The `mod_authnz_pam` module enables Apache to use PAM for authentication. Install it along with the PAM utilities:

   ```bash
   sudo dnf install mod_authnz_pam pam -y
   ```

2. **Verify Installation**  
   Confirm that the `mod_authnz_pam` module is available:

   ```bash
   httpd -M | grep pam
   ```

   If `authnz_pam_module` is listed, the module is enabled.

---

### **Step 2: Create the Directory to Protect**

Create a directory on your server that you want to protect with Basic Authentication.

1. **Create the Directory**  
   For example:

   ```bash
   sudo mkdir -p /var/www/html/protected
   ```

2. **Add Sample Content**  
   Add a sample HTML file to the directory:

   ```bash
   echo "<h1>This is a protected area</h1>" | sudo tee /var/www/html/protected/index.html
   ```

3. **Set Permissions**  
   Ensure the Apache user has access:

   ```bash
   sudo chown -R apache:apache /var/www/html/protected
   sudo chmod -R 755 /var/www/html/protected
   ```

---

### **Step 3: Configure Apache for Basic Authentication with PAM**

To use PAM for Basic Authentication, create a configuration file for the protected directory.

1. **Edit the Apache Configuration File**  
   Create a new configuration file for the protected directory:

   ```bash
   sudo nano /etc/httpd/conf.d/protected.conf
   ```

2. **Add the Basic Authentication Configuration**  
   Include the following directives:

   ```apache
   <Directory "/var/www/html/protected">
       AuthType Basic
       AuthName "Restricted Area"
       AuthBasicProvider PAM
       AuthPAMService httpd
       Require valid-user
   </Directory>
   ```

   Explanation of the directives:
   - **AuthType Basic**: Specifies Basic Authentication.
   - **AuthName**: The message displayed in the authentication prompt.
   - **AuthBasicProvider PAM**: Indicates that PAM will handle authentication.
   - **AuthPAMService httpd**: Refers to the PAM configuration for Apache (we’ll configure this in Step 4).
   - **Require valid-user**: Restricts access to authenticated users.

3. **Save and Restart Apache**  
   Restart Apache to apply the configuration:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Step 4: Configure PAM for Apache**

PAM requires a service configuration file to manage authentication policies for Apache.

1. **Create a PAM Service File**  
   Create a new PAM configuration file for Apache:

   ```bash
   sudo nano /etc/pam.d/httpd
   ```

2. **Define PAM Policies**  
   Add the following content to the file:

   ```bash
   auth required pam_unix.so
   account required pam_unix.so
   ```

   Explanation:
   - **pam_unix.so**: Uses the local system’s user accounts for authentication.
   - **auth**: Manages authentication policies (e.g., verifying passwords).
   - **account**: Ensures the account exists and is valid.

3. **Save the File**  

---

### **Step 5: Test the Configuration**

1. **Create a Test User**  
   Add a new Linux user for testing:

   ```bash
   sudo useradd testuser
   sudo passwd testuser
   ```

2. **Access the Protected Directory**  
   Open a web browser and navigate to:

   ```html
   http://<your-server-ip>/protected
   ```

   Enter the username (`testuser`) and password you created. If the credentials are correct, you should see the protected content.

---

### **Step 6: Secure Access with HTTPS**

Since Basic Authentication transmits credentials in plaintext, it’s essential to use HTTPS for secure communication.

1. **Install Certbot and the Apache Plugin**  
   Install Certbot for Let’s Encrypt SSL certificates:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   ```

2. **Obtain and Install an SSL Certificate**  
   Run Certbot to configure HTTPS:

   ```bash
   sudo certbot --apache
   ```

3. **Test HTTPS Access**  
   Navigate to:

   ```html
   https://<your-server-ip>/protected
   ```

   Ensure that credentials are transmitted securely over HTTPS.

---

### **Step 7: Advanced Configuration Options**

#### **1. Restrict Access to Specific Users**

To allow only specific users, update the `Require` directive:

```apache
Require user testuser
```

#### **2. Restrict Access to a Group**

If you have a Linux user group, allow only group members:

```apache
Require group webadmins
```

#### **3. Limit Access by IP**

Combine PAM with IP-based restrictions:

```apache
<Directory "/var/www/html/protected">
    AuthType Basic
    AuthName "Restricted Area"
    AuthBasicProvider PAM
    AuthPAMService httpd
    Require valid-user
    Require ip 192.168.1.0/24
</Directory>
```

---

### **Troubleshooting Common Issues**

1. **Authentication Fails**  
   - Verify the PAM service file (`/etc/pam.d/httpd`) is correctly configured.
   - Check the Apache error logs for clues:

     ```bash
     sudo tail -f /var/log/httpd/error_log
     ```

2. **403 Forbidden Error**  
   - Ensure the protected directory is readable by Apache:

     ```bash
     sudo chown -R apache:apache /var/www/html/protected
     ```

3. **PAM Configuration Errors**  
   - Test the PAM service with a different application to ensure it’s functional.

---

### **Conclusion**

Configuring Basic Authentication with PAM on Apache running AlmaLinux provides a powerful and flexible way to secure your web resources. By leveraging PAM, you can integrate Apache authentication with your system’s existing user accounts and policies, streamlining access control across your environment.

This guide has covered every step, from installing the necessary modules to configuring PAM and securing communication with HTTPS. Whether for internal tools, administrative panels, or sensitive resources, this setup offers a reliable and secure solution tailored to your needs.
