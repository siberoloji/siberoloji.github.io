---
title: How to Configure mod_wsgi with Apache on AlmaLinux
linkTitle: mod_wsgi with Apache
description: This guide provides a detailed, step-by-step process for configuring mod_wsgi with Apache on AlmaLinux.
date: 2024-12-18
weight: 930
url: configure-mod-wsgi-apache-almalinux
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
When it comes to hosting Python web applications, **mod_wsgi** is a popular Apache module that allows you to integrate Python applications seamlessly with the Apache web server. For developers and system administrators using AlmaLinux, a free and open-source RHEL-based distribution, configuring mod_wsgi is an essential step for deploying robust Python-based web solutions.  

This guide provides a detailed, step-by-step process for configuring mod_wsgi with Apache on AlmaLinux. By the end of this tutorial, you will have a fully functioning Python web application hosted using mod_wsgi.  

---

### **Prerequisites**  

Before diving into the configuration process, ensure the following prerequisites are met:  

1. **A Running AlmaLinux System**: This guide assumes you have AlmaLinux 8 or later installed.  
2. **Apache Installed**: The Apache web server should be installed and running.  
3. **Python Installed**: Ensure Python 3.x is installed.  
4. **Root or Sudo Privileges**: You’ll need administrative access to perform system modifications.  

---

### **Step 1: Update Your AlmaLinux System**  

Keeping your system updated ensures you have the latest security patches and software versions. Open a terminal and run:  

```bash
sudo dnf update -y
```  

Once the update completes, restart the system if necessary:  

```bash
sudo reboot
```  

---

### **Step 2: Install Apache (if not already installed)**  

Apache is a core component of this setup. Install it using the `dnf` package manager:  

```bash
sudo dnf install httpd -y
```  

Enable and start the Apache service:  

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```  

Verify that Apache is running:  

```bash
sudo systemctl status httpd
```  

Open your browser and navigate to your server's IP address to confirm Apache is serving the default web page.  

---

### **Step 3: Install Python and Dependencies**  

AlmaLinux typically comes with Python pre-installed, but it’s important to verify the version. Run:  

```bash
python3 --version
```  

If Python is not installed, install it with:  

```bash
sudo dnf install python3 python3-pip -y
```  

You’ll also need the development tools and Apache HTTPD development libraries:  

```bash
sudo dnf groupinstall "Development Tools" -y
sudo dnf install httpd-devel -y
```  

---

### **Step 4: Install mod_wsgi**  

The mod_wsgi package allows Python web applications to interface with Apache. Install it using `pip`:  

```bash
pip3 install mod_wsgi
```  

Verify the installation by checking the mod_wsgi-express binary:  

```bash
mod_wsgi-express --version
```  

---

### **Step 5: Configure mod_wsgi with Apache**  

#### Generate mod_wsgi Module  

Use `mod_wsgi-express` to generate a `.so` file for Apache:  

```bash
mod_wsgi-express module-config
```  

This command outputs configuration details similar to the following:  

```apache
LoadModule wsgi_module "/usr/local/lib/python3.8/site-packages/mod_wsgi/server/mod_wsgi-py38.so"
WSGIPythonHome "/usr"
```  

Copy this output and save it for the next step.  

#### Add Configuration to Apache  

Create a new configuration file for mod_wsgi in the Apache configuration directory. Typically, this is located at `/etc/httpd/conf.d/`.  

```bash
sudo nano /etc/httpd/conf.d/mod_wsgi.conf
```  

Paste the output from the `mod_wsgi-express module-config` command into this file. Save and close the file.  

---

### **Step 6: Deploy a Python Application**  

#### Create a Sample Python Web Application  

For demonstration purposes, create a simple Python WSGI application. Navigate to `/var/www/` and create a directory for your app:  

```bash
sudo mkdir /var/www/myapp
cd /var/www/myapp
```  

Create a new file named `app.wsgi`:  

```bash
sudo nano app.wsgi
```  

Add the following code:  

```python
def application(environ, start_response):
    status = '200 OK'
    output = b'Hello, World! This is a Python application running with mod_wsgi.'

    response_headers = [('Content-Type', 'text/plain'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]
```  

Save and close the file.  

#### Set File Permissions  

Ensure the Apache user (`apache`) can access the directory and files:  

```bash
sudo chown -R apache:apache /var/www/myapp
```  

#### Configure Apache to Serve the Application  

Create a virtual host configuration file for the application:  

```bash
sudo nano /etc/httpd/conf.d/myapp.conf
```  

Add the following content:  

```apache
<VirtualHost *:80>
    ServerName your-domain.com

    WSGIScriptAlias / /var/www/myapp/app.wsgi
    <Directory /var/www/myapp>
        Require all granted
    </Directory>

    ErrorLog /var/log/httpd/myapp_error.log
    CustomLog /var/log/httpd/myapp_access.log combined
</VirtualHost>
```  

Replace `your-domain.com` with your domain name or server IP address. Save and close the file.  

#### Restart Apache  

Reload Apache to apply the changes:  

```bash
sudo systemctl restart httpd
```  

---

### **Step 7: Test Your Setup**  

Open your browser and navigate to your server's domain or IP address. You should see the message:  

```python
Hello, World! This is a Python application running with mod_wsgi.
```  

---

### **Step 8: Secure Your Server (Optional but Recommended)**  

#### Enable the Firewall  

Allow HTTP and HTTPS traffic through the firewall:  

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```  

#### Enable HTTPS with SSL/TLS  

To secure your application, install an SSL certificate. You can use Let's Encrypt for free SSL certificates. Install Certbot and enable HTTPS:  

```bash
sudo dnf install certbot python3-certbot-apache -y
sudo certbot --apache
```  

Follow the prompts to secure your site with HTTPS.  

---

### **Conclusion**  

By following these steps, you’ve successfully configured mod_wsgi with Apache on AlmaLinux. This setup enables you to host Python web applications with ease and efficiency. While this guide focused on a simple WSGI application, the same principles apply to more complex frameworks like Django or Flask.  

For production environments, always ensure your application and server are optimized and secure. Configuring proper logging, load balancing, and monitoring are key aspects of maintaining a reliable Python web application.  

Feel free to explore the capabilities of mod_wsgi further and unlock the full potential of hosting Python web applications on AlmaLinux.
