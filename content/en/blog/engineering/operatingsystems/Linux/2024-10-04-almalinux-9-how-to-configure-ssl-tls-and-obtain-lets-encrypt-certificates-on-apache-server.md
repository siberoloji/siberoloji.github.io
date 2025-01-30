---
draft: false

title:  'AlmaLinux 9: How to Configure SSL/TLS and Obtain Let’s Encrypt Certificates on Apache Server'
date: '2024-10-04T20:12:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-configure-ssl-tls-and-obtain-lets-encrypt-certificates-on-apache-server/
 
featured_image: /images/apache-web-server.webp
categories:
    - 'Linux How-to'
tags:
    - 'apache web server'
    - 'how-to guides'
    - linux
    - 'linux how-to'
    - 'ssl certificate'
---
In today’s world, where online security is paramount, encrypting the communication between a web server and its users has become essential. Using SSL/TLS (Secure Sockets Layer/Transport Layer Security) certificates provides that layer of security, ensuring that sensitive information exchanged between a browser and a server is encrypted. One of the most popular and cost-effective ways to implement SSL/TLS is by using Let’s Encrypt, a free certificate authority that provides trusted SSL/TLS certificates for your websites.

In this guide, we will walk you through the steps to configure SSL/TLS and obtain a Let’s Encrypt certificate on an Apache web server running AlmaLinux 9.

## Table of Contents
* Understanding SSL/TLS and Let’s Encrypt

* Prerequisites

* Step 1: Installing Apache on AlmaLinux 9

* Step 2: Installing Certbot for Let’s Encrypt

* Step 3: Setting Up the Firewall

* Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate

* Step 5: Configuring Apache to Use SSL/TLS Certificates

* Step 6: Auto-Renewal of Let’s Encrypt Certificates

* Conclusion
## 1. Understanding SSL/TLS and Let’s Encrypt

What is SSL/TLS?

SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security) are cryptographic protocols designed to secure communications over a computer network. SSL/TLS certificates authenticate the identity of websites and enable an encrypted connection. When a website has an SSL/TLS certificate, a padlock icon appears in the browser's address bar, and the site’s URL begins with "https," indicating a secure connection.

What is Let’s Encrypt?

Let’s Encrypt is a free, automated, and open Certificate Authority (CA) that provides SSL/TLS certificates to encrypt web traffic. It simplifies the process of setting up SSL/TLS by automating the certificate issuance and renewal processes, allowing website administrators to secure their sites quickly and with minimal effort.

## 2. Prerequisites

Before we begin, you need to make sure the following prerequisites are met:
* **A server running AlmaLinux 9** with root or sudo user access.

* **A domain name** that points to your server's public IP address.

* **Apache web server** installed and running.

* **Firewall configuration** that allows HTTP and HTTPS traffic.

* A tool like **Certbot**, which simplifies the process of obtaining and managing Let’s Encrypt SSL certificates.
## 3. Step 1: Installing Apache on AlmaLinux 9

If Apache is not already installed on your server, the first step is to install it. Here’s how to do it:

Install Apache:
```bash
sudo dnf install httpd
```

Enable and Start Apache:

Once Apache is installed, enable it to start automatically on system boot and start the service.
```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

Check Apache Status:

To ensure Apache is running, check its status:
```bash
sudo systemctl status httpd
```

If the service is active and running, you’re good to go.

## 4. Step 2: Installing Certbot for Let’s Encrypt

Next, you’ll need to install Certbot, the tool that automates the process of obtaining and renewing Let’s Encrypt certificates.

Install the Required Packages:

Run the following command to install the Certbot and the Certbot Apache plugin:
```bash
sudo dnf install certbot python3-certbot-apache```

The Certbot Apache plugin will automatically configure SSL/TLS for your Apache web server.

## 5. Step 3: Setting Up the Firewall

To ensure that your server can handle both HTTP and HTTPS traffic, you’ll need to update the firewall settings.

Allow HTTP and HTTPS Traffic:

Run the following commands to open the necessary ports:
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

By doing this, you’ve allowed HTTP traffic on port 80 and HTTPS traffic on port 443, which are essential for web traffic and secure communication.

## 6. Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate

Once Apache is installed and the firewall is configured, the next step is to obtain an SSL/TLS certificate from Let’s Encrypt.

Obtain the SSL/TLS Certificate:

To obtain a Let’s Encrypt SSL certificate for your domain, use the following Certbot command:
```bash
sudo certbot --apache -d yourdomain.com -d www.yourdomain.com
```

Replace `yourdomain.com` and `www.yourdomain.com` with your actual domain name. Certbot will handle the following:
* Verify ownership of the domain.

* Automatically obtain and install the SSL certificate.

* Configure your Apache server to serve your site over HTTPS.
Follow the Certbot Prompts:

Certbot will prompt you with a few questions, such as whether you want to redirect HTTP traffic to HTTPS (which is recommended). Once the process is complete, Certbot will automatically configure Apache with your new SSL/TLS certificate.

Verify the SSL/TLS Certificate:

You can verify that the SSL certificate is installed correctly by visiting your website using `https://yourdomain.com`. You should see the padlock icon next to your URL, indicating that the site is secure.

## 7. Step 5: Configuring Apache to Use SSL/TLS Certificates

Certbot usually handles most of the configuration automatically. However, if you want to manually configure your SSL/TLS settings or customize them further, you can do so in the Apache configuration files.

SSL Configuration File:

The SSL configuration file is usually located in `/etc/httpd/conf.d/ssl.conf` or `/etc/httpd/conf.d/yourdomain-le-ssl.conf` (if Certbot created it). This file contains directives to control how Apache uses the SSL certificate.

Here’s an example configuration:
```bash
<VirtualHost *:443>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem
    Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
```

In this file, you’ll find references to the Let’s Encrypt SSL certificate files, which Certbot has installed. These include:
* **SSLCertificateFile**: The location of the SSL certificate.

* **SSLCertificateKeyFile**: The location of the private key.

* **Include /etc/letsencrypt/options-ssl-apache.conf**: This line ensures that Apache uses the recommended security settings.
Redirect HTTP to HTTPS:

To ensure that all traffic to your site uses HTTPS, you can set up a redirect from HTTP to HTTPS in the Apache configuration:
```bash
<VirtualHost *:80>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    Redirect permanent / https://yourdomain.com/
</VirtualHost>
```

This configuration automatically redirects visitors accessing `http://yourdomain.com` to the secure `https://yourdomain.com`.

## 8. Step 6: Auto-Renewal of Let’s Encrypt Certificates

Let’s Encrypt certificates are valid for 90 days, but Certbot can automatically renew them for you. To ensure your SSL certificates are renewed before they expire, Certbot includes a renewal script.

Enable Auto-Renewal:

Certbot automatically adds a cron job to handle certificate renewals. However, you can manually test the renewal process to ensure it works correctly:
```bash
sudo certbot renew --dry-run
```

This command performs a dry run to simulate the renewal process without actually renewing the certificate. If successful, Certbot will automatically renew your certificates as they approach expiration.

## 9. Conclusion

Setting up SSL/TLS with Let’s Encrypt on AlmaLinux 9 is a straightforward process, thanks to the powerful Certbot tool and its tight integration with Apache. By following the steps outlined in this guide, you can secure your website with trusted SSL/TLS certificates, ensuring that your users' data is encrypted and safe.

Not only will SSL/TLS improve your site's security, but it also boosts SEO rankings and builds user trust. Remember to keep an eye on certificate renewal to ensure continuous protection for your website, though Certbot automates most of this process.

With this setup, your AlmaLinux 9 server is now ready to securely serve content over HTTPS, providing peace of mind to both you and your site’s visitors. Happy hosting!
