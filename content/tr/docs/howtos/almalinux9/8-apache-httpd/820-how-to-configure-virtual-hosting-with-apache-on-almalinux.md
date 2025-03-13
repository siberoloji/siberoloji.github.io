---
title: How to Configure Virtual Hosting with Apache on AlmaLinux
linkTitle: Virtual Hosting with Apache
description: In this detailed guide, we’ll walk you through the process of setting up virtual hosting on Apache with AlmaLinux
date: 2024-12-14
weight: 820
url: configure-virtual-hosting-apache-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: configure-virtual-hosting-apache-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Apache HTTP Server (httpd) is one of the most versatile and widely used web servers for hosting websites and applications. One of its most powerful features is **virtual hosting**, which allows a single Apache server to host multiple websites or domains from the same machine. This is especially useful for businesses, developers, and hobbyists managing multiple projects.

In this detailed guide, we’ll walk you through the process of setting up virtual hosting on Apache with AlmaLinux, a popular enterprise-grade Linux distribution.

---

### **What is Virtual Hosting in Apache?**

Virtual hosting is a method used by web servers to host multiple websites or applications on a single server. Apache supports two types of virtual hosting:

1. **Name-Based Virtual Hosting**:  
   Multiple domains share the same IP address but are differentiated by their domain names.

2. **IP-Based Virtual Hosting**:  
   Each website is assigned a unique IP address. This is less common due to IPv4 scarcity.

In most scenarios, name-based virtual hosting is sufficient and more economical. This guide focuses on name-based virtual hosting on AlmaLinux.

---

### **Prerequisites for Setting Up Virtual Hosting**

Before configuring virtual hosting, ensure you have:

1. **A Server Running AlmaLinux**  
   With root or sudo access.

2. **Apache Installed and Running**  
   If not, install Apache using the following command:

   ```bash
   sudo dnf install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **DNS Configured for Your Domains**  
   Ensure your domain names (e.g., `example1.com` and `example2.com`) point to your server’s IP address.

4. **Firewall and SELinux Configured**  
   Allow HTTP and HTTPS traffic through the firewall:

   ```bash
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   sudo firewall-cmd --reload
   ```

   Configure SELinux policies as necessary (explained later in this guide).

---

### **Step-by-Step Guide to Configure Virtual Hosting**

#### **Step 1: Set Up the Directory Structure**

For each website you host, you’ll need a dedicated directory to store its files.

1. Create directories for your websites:

   ```bash
   sudo mkdir -p /var/www/example1.com/public_html
   sudo mkdir -p /var/www/example2.com/public_html
   ```

2. Assign ownership and permissions to these directories:

   ```bash
   sudo chown -R apache:apache /var/www/example1.com/public_html
   sudo chown -R apache:apache /var/www/example2.com/public_html
   sudo chmod -R 755 /var/www
   ```

3. Place an `index.html` file in each directory to verify the setup:

   ```bash
   echo "<h1>Welcome to Example1.com</h1>" | sudo tee /var/www/example1.com/public_html/index.html
   echo "<h1>Welcome to Example2.com</h1>" | sudo tee /var/www/example2.com/public_html/index.html
   ```

---

#### **Step 2: Configure Virtual Host Files**

Each virtual host requires a configuration file in the `/etc/httpd/conf.d/` directory.

1. Create a virtual host configuration for the first website:

   ```bash
   sudo nano /etc/httpd/conf.d/example1.com.conf
   ```

2. Add the following content:

   ```apache
   <VirtualHost *:80>
       ServerName example1.com
       ServerAlias www.example1.com
       DocumentRoot /var/www/example1.com/public_html

       <Directory /var/www/example1.com/public_html>
           AllowOverride All
           Require all granted
       </Directory>

       ErrorLog /var/log/httpd/example1.com-error.log
       CustomLog /var/log/httpd/example1.com-access.log combined
   </VirtualHost>
   ```

3. Create a similar configuration for the second website:

   ```bash
   sudo nano /etc/httpd/conf.d/example2.com.conf
   ```

4. Add this content:

   ```apache
   <VirtualHost *:80>
       ServerName example2.com
       ServerAlias www.example2.com
       DocumentRoot /var/www/example2.com/public_html

       <Directory /var/www/example2.com/public_html>
           AllowOverride All
           Require all granted
       </Directory>

       ErrorLog /var/log/httpd/example2.com-error.log
       CustomLog /var/log/httpd/example2.com-access.log combined
   </VirtualHost>
   ```

---

#### **Step 3: Test the Configuration**

Before restarting Apache, it’s important to test the configuration for syntax errors.

Run the following command:

```bash
sudo apachectl configtest
```

If everything is configured correctly, you should see:

```bash
Syntax OK
```

---

#### **Step 4: Restart Apache**

Restart the Apache service to apply the new virtual host configurations:

```bash
sudo systemctl restart httpd
```

---

#### **Step 5: Verify the Virtual Hosts**

Open a web browser and navigate to your domains:

- For `example1.com`, you should see:  
  *Welcome to Example1.com*

- For `example2.com`, you should see:  
  *Welcome to Example2.com*

If the pages don’t load, check the DNS records for your domains and ensure they point to the server’s IP address.

---

### **Advanced Configuration and Best Practices**

#### **1. Enable HTTPS with SSL/TLS**

Secure your websites with HTTPS by configuring SSL/TLS certificates.

1. Install Certbot:

   ```bash
   sudo dnf install certbot python3-certbot-apache -y
   ```

2. Obtain and configure a free Let’s Encrypt certificate:

   ```bash
   sudo certbot --apache -d example1.com -d www.example1.com
   sudo certbot --apache -d example2.com -d www.example2.com
   ```

3. Verify automatic certificate renewal:

   ```bash
   sudo certbot renew --dry-run
   ```

#### **2. Disable Directory Listing**

To prevent unauthorized access to directory contents, disable directory listing by adding the following directive to each virtual host:

```apache
Options -Indexes
```

#### **3. Use Custom Log Formats**

Custom logs can help monitor and debug website activity. For example:

```apache
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" custom
CustomLog /var/log/httpd/example1.com-access.log custom
```

#### **4. Optimize SELinux Policies**

If SELinux is enabled, configure it to allow Apache to serve content outside the default directories:

```bash
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/example1.com(/.*)?"
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/example2.com(/.*)?"
sudo restorecon -Rv /var/www/example1.com
sudo restorecon -Rv /var/www/example2.com
```

---

### **Troubleshooting Common Issues**

1. **Virtual Host Not Working as Expected**
   - Check the order of virtual host configurations; the default host is served if no `ServerName` matches.

2. **Permission Denied Errors**
   - Verify that the `apache` user owns the document root and has the correct permissions.

3. **DNS Issues**
   - Use tools like `nslookup` or `dig` to ensure your domains resolve to the correct IP address.

4. **Firewall Blocking Traffic**
   - Confirm that HTTP and HTTPS ports (80 and 443) are open in the firewall.

---

### **Conclusion**

Configuring virtual hosting with Apache on AlmaLinux is a straightforward yet powerful way to host multiple websites on a single server. By carefully setting up your directory structure, virtual host files, and DNS records, you can serve unique content for different domains efficiently. Adding SSL/TLS encryption ensures your websites are secure and trusted by users.

With this guide, you’re now ready to manage multiple domains using virtual hosting, making your Apache server a versatile and cost-effective web hosting solution.
