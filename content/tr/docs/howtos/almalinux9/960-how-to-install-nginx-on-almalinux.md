---
title: How to Install Nginx on AlmaLinux
linkTitle: Install Nginx
description: This guide will walk you through the step-by-step process of installing and configuring Nginx on AlmaLinux.
date: 2024-12-18
weight: 960
url: install-nginx-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
Nginx (pronounced "Engine-X") is a powerful, lightweight, and highly customizable web server that also functions as a reverse proxy, load balancer, and HTTP cache. Its performance, scalability, and ease of configuration make it a popular choice for hosting websites and managing web traffic.  

For users of **AlmaLinux**, a robust and RHEL-compatible operating system, Nginx offers a seamless way to deploy and manage web applications. This guide will walk you through the step-by-step process of installing and configuring Nginx on AlmaLinux.

---

### **Prerequisites**  

Before we begin, ensure you meet these prerequisites:  

1. **A Running AlmaLinux Instance**: The tutorial assumes AlmaLinux 8 or later is installed.  
2. **Sudo or Root Access**: You’ll need administrative privileges for installation and configuration.  
3. **A Basic Understanding of the Command Line**: Familiarity with Linux commands will be helpful.  

---

### **Step 1: Update Your AlmaLinux System**  

Keeping your system updated ensures that all installed packages are current and secure. Open a terminal and run the following commands:  

```bash
sudo dnf update -y
sudo reboot
```  

Rebooting ensures all updates are applied correctly.  

---

### **Step 2: Install Nginx**  

#### Add the EPEL Repository  

Nginx is available in AlmaLinux’s Extra Packages for Enterprise Linux (EPEL) repository. First, ensure the EPEL repository is installed:  

```bash
sudo dnf install epel-release -y
```  

#### Install Nginx  

Once the EPEL repository is enabled, install Nginx using the `dnf` package manager:  

```bash
sudo dnf install nginx -y
```  

#### Verify Installation  

Check the installed Nginx version to ensure it was installed correctly:  

```bash
nginx -v
```  

You should see the version of Nginx that was installed.  

---

### **Step 3: Start and Enable Nginx**  

After installation, start the Nginx service:  

```bash
sudo systemctl start nginx
```  

Enable Nginx to start automatically on boot:  

```bash
sudo systemctl enable nginx
```  

Verify that Nginx is running:  

```bash
sudo systemctl status nginx
```  

You should see an output indicating that Nginx is active and running.  

---

### **Step 4: Adjust the Firewall to Allow HTTP and HTTPS Traffic**  

By default, AlmaLinux’s firewall blocks web traffic. To allow HTTP and HTTPS traffic, update the firewall settings:  

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```  

Confirm that the changes were applied:  

```bash
sudo firewall-cmd --list-all
```  

You should see HTTP and HTTPS listed under "services".  

---

### **Step 5: Verify Nginx Installation**  

Open a web browser and navigate to your server's IP address:  

```html
http://your-server-ip
```  

You should see the default Nginx welcome page, confirming that the installation was successful.  

---

### **Step 6: Configure Nginx**  

#### Understanding Nginx Directory Structure  

The main configuration files for Nginx are located in the following directories:  

- **/etc/nginx/nginx.conf**: The primary Nginx configuration file.  
- **/etc/nginx/conf.d/**: A directory for additional configuration files.  
- **/usr/share/nginx/html/**: The default web document root directory.  

#### Create a New Server Block  

A server block in Nginx is equivalent to a virtual host in Apache. It allows you to host multiple websites on the same server.  

Create a new configuration file for your website:  

```bash
sudo nano /etc/nginx/conf.d/yourdomain.conf
```  

Add the following configuration:  

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    root /var/www/yourdomain;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    error_page 404 /404.html;

    location = /404.html {
        root /usr/share/nginx/html;
    }
}
```  

Replace `yourdomain.com` with your actual domain name or IP address. Save and close the file.  

#### Create the Document Root  

Create the document root directory for your website:  

```bash
sudo mkdir -p /var/www/yourdomain
```  

Add a sample `index.html` file:  

```bash
echo "<h1>Welcome to YourDomain.com</h1>" | sudo tee /var/www/yourdomain/index.html
```  

Set proper ownership and permissions:  

```bash
sudo chown -R nginx:nginx /var/www/yourdomain
sudo chmod -R 755 /var/www/yourdomain
```  

---

### **Step 7: Test Nginx Configuration**  

Before restarting Nginx, test the configuration for syntax errors:  

```bash
sudo nginx -t
```  

If the output indicates "syntax is ok" and "test is successful," restart Nginx:  

```bash
sudo systemctl restart nginx
```  

---

### **Step 8: Secure Nginx with SSL/TLS**  

To secure your website with HTTPS, install SSL/TLS certificates. You can use **Let's Encrypt** for free SSL certificates.  

#### Install Certbot  

Install Certbot and its Nginx plugin:  

```bash
sudo dnf install certbot python3-certbot-nginx -y
```  

#### Obtain and Configure SSL Certificate  

Run the following command to obtain and install an SSL certificate for your domain:  

```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```  

Follow the prompts to complete the process. Certbot will automatically configure Nginx to use the certificate.  

#### Verify HTTPS Setup  

Once completed, test your HTTPS configuration by navigating to:  

```html
https://yourdomain.com
```  

You should see a secure connection with a padlock in the browser’s address bar.  

#### Set Up Automatic Renewal  

Ensure your SSL certificate renews automatically:  

```bash
sudo systemctl enable certbot-renew.timer
```  

Test the renewal process:  

```bash
sudo certbot renew --dry-run
```  

---

### **Step 9: Monitor and Maintain Nginx**  

#### Log Files  

Monitor Nginx logs for troubleshooting and performance insights:  

- **Access Logs**: `/var/log/nginx/access.log`  
- **Error Logs**: `/var/log/nginx/error.log`  

Use the `tail` command to monitor logs in real-time:  

```bash
sudo tail -f /var/log/nginx/access.log /var/log/nginx/error.log
```  

#### Restart and Reload Nginx  

- Reload Nginx after making configuration changes:  

  ```bash
  sudo systemctl reload nginx
  ```  

- Restart Nginx if it’s not running properly:  

  ```bash
  sudo systemctl restart nginx
  ```  

#### Update Nginx  

Keep Nginx updated to ensure you have the latest features and security patches:  

```bash
sudo dnf update nginx
```  

---

### **Conclusion**  

By following this guide, you’ve successfully installed and configured Nginx on AlmaLinux. From serving static files to securing your server with SSL/TLS, Nginx is now ready to host your websites or applications efficiently.  

For further optimization, consider exploring advanced Nginx features such as reverse proxying, load balancing, caching, and integrating dynamic content through FastCGI or uWSGI. By leveraging Nginx’s full potential, you can ensure high-performance and secure web hosting tailored to your needs.
