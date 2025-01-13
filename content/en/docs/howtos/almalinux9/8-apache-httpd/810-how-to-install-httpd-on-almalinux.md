---
title: How to Install httpd on AlmaLinux
linkTitle: Install httpd
description: In this guide, we’ll walk you through the process of installing and configuring the httpd web server on AlmaLinux.
date: 2024-12-14
weight: 810
url: install-httpd-almalinux
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
Installing and configuring a web server is one of the first steps to hosting your own website or application. On AlmaLinux, a popular enterprise-grade Linux distribution, the httpd service (commonly known as Apache HTTP Server) is a reliable and widely used option for serving web content. In this guide, we’ll walk you through the process of installing and configuring the httpd web server on AlmaLinux.

---

### **What is httpd and Why Choose AlmaLinux?**

The Apache HTTP Server, referred to as `httpd`, is an open-source and highly configurable web server that has powered the internet for decades. It supports a wide range of use cases, from hosting static websites to serving dynamic web applications. Paired with AlmaLinux, a CentOS successor designed for enterprise environments, httpd offers a secure, stable, and performance-oriented solution for web hosting.

---

### **Prerequisites for Installing httpd on AlmaLinux**

Before starting, ensure the following prerequisites are met:

1. **Access to an AlmaLinux Server**  
   You’ll need a machine running AlmaLinux with root or sudo privileges.

2. **Basic Command Line Knowledge**  
   Familiarity with basic Linux commands is essential.

3. **Updated System**  
   Keep your system up to date by running:

   ```bash
   sudo dnf update -y
   ```

4. **Firewall and SELinux Considerations**  
   Be ready to configure firewall rules and manage SELinux settings for httpd.

---

### **Step-by-Step Installation of httpd on AlmaLinux**

Follow these steps to install and configure the Apache HTTP Server on AlmaLinux:

#### **1. Install httpd Using DNF**

AlmaLinux provides the Apache HTTP Server package in its default repositories. To install it:

1. Update your package list:

   ```bash
   sudo dnf update -y
   ```

2. Install the `httpd` package:

   ```bash
   sudo dnf install httpd -y
   ```

3. Verify the installation by checking the httpd version:

   ```bash
   httpd -v
   ```

You should see an output indicating the version of Apache installed on your system.

---

#### **2. Start and Enable the httpd Service**

Once httpd is installed, you need to start the service and configure it to start on boot:

1. Start the httpd service:

   ```bash
   sudo systemctl start httpd
   ```

2. Enable httpd to start automatically at boot:

   ```bash
   sudo systemctl enable httpd
   ```

3. Verify the service status:

   ```bash
   sudo systemctl status httpd
   ```

   Look for the status `active (running)` to confirm it’s operational.

---

#### **3. Configure Firewall for httpd**

By default, the firewall may block HTTP and HTTPS traffic. Allow traffic to the appropriate ports:

1. Open port 80 for HTTP:

   ```bash
   sudo firewall-cmd --permanent --add-service=http
   ```

2. Open port 443 for HTTPS (optional):

   ```bash
   sudo firewall-cmd --permanent --add-service=https
   ```

3. Reload the firewall to apply changes:

   ```bash
   sudo firewall-cmd --reload
   ```

4. Verify open ports:

   ```bash
   sudo firewall-cmd --list-all
   ```

---

#### **4. Test httpd Installation**

To ensure the Apache server is working correctly:

1. Open a web browser and navigate to your server’s IP address:

   ```html
   http://<your-server-ip>
   ```

2. You should see the Apache test page, indicating that the server is functioning.

---

#### **5. Configure SELinux (Optional)**

If SELinux is enabled on your AlmaLinux system, it might block some actions by default. To manage SELinux policies for httpd:

1. Install `policycoreutils` tools (if not already installed):

   ```bash
   sudo dnf install policycoreutils-python-utils -y
   ```

2. Allow httpd to access the network:

   ```bash
   sudo setsebool -P httpd_can_network_connect 1
   ```

3. If you’re hosting files outside the default `/var/www/html` directory, use the following command to allow SELinux access:

   ```bash
   sudo semanage fcontext -a -t httpd_sys_content_t "/path/to/your/files(/.*)?"
   sudo restorecon -Rv /path/to/your/files
   ```

---

### **Basic Configuration of Apache (httpd)**

#### **1. Edit the Default Configuration File**

Apache’s default configuration file is located at `/etc/httpd/conf/httpd.conf`. Use your favorite text editor to make changes, for example:

```bash
sudo nano /etc/httpd/conf/httpd.conf
```

Some common configurations you might want to modify include:

- **Document Root**: Change the location of your website’s files by modifying the `DocumentRoot` directive.
- **ServerName**: Set the domain name or IP address of your server to avoid warnings.

#### **2. Create a Virtual Host**

To host multiple websites, create a virtual host configuration. For example, create a new file:

```bash
sudo nano /etc/httpd/conf.d/example.com.conf
```

Add the following configuration:

```bash
<VirtualHost *:80>
    ServerName example.com
    DocumentRoot /var/www/example.com

    <Directory /var/www/example.com>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog /var/log/httpd/example.com-error.log
    CustomLog /var/log/httpd/example.com-access.log combined
</VirtualHost>
```

Replace `example.com` with your domain name and adjust paths as needed.

3. Create the document root directory:

   ```bash
   sudo mkdir -p /var/www/example.com
   ```

4. Set permissions and ownership:

   ```bash
   sudo chown -R apache:apache /var/www/example.com
   sudo chmod -R 755 /var/www/example.com
   ```

5. Restart Apache to apply changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### **Troubleshooting Common Issues**

#### **1. Firewall or SELinux Blocks**

If your website isn’t accessible, check firewall settings and SELinux configurations as outlined earlier.

#### **2. Logs for Debugging**

Apache logs can provide valuable insights into issues:

- Access logs: `/var/log/httpd/access.log`
- Error logs: `/var/log/httpd/error.log`

#### **3. Permissions Issues**

Ensure that the Apache user (`apache`) has the necessary permissions for the document root.

---

### **Securing Your Apache Server**

1. **Enable HTTPS**:  
   Install and configure SSL/TLS certificates using Let’s Encrypt:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   sudo certbot --apache
   ```

2. **Disable Directory Listing**:  
   Edit the configuration file and add the `Options -Indexes` directive to prevent directory listings.

3. **Keep httpd Updated**:  
   Regularly update Apache to ensure you have the latest security patches:

   ```bash
   sudo dnf update httpd -y
   ```

---

### **Conclusion**

Installing and configuring httpd on AlmaLinux is a straightforward process that equips you with a powerful web server to host your websites or applications. With its flexibility, stability, and strong community support, Apache is an excellent choice for web hosting needs on AlmaLinux.

By following this guide, you’ll be able to get httpd up and running, customize it to suit your specific requirements, and ensure a secure and robust hosting environment. Now that your web server is ready, you’re all set to launch your next project on AlmaLinux!
