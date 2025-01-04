---
title: How to Configure SSL/TLS with Nginx on AlmaLinux
linkTitle: Configure SSL/TLS with Nginx
description: This comprehensive guide will walk you through the steps to configure SSL/TLS with Nginx on AlmaLinux, including obtaining free SSL/TLS certificates from Let’s Encrypt using Certbot.
date: 2024-12-18
weight: 980
url: configure-ssl-tls-nginx-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
In today’s digital landscape, securing your website with SSL/TLS is not optional—it’s essential. SSL/TLS encryption not only protects sensitive user data but also enhances search engine rankings and builds user trust. If you’re running a server with AlmaLinux and Nginx, setting up SSL/TLS certificates is straightforward and crucial for securing your web traffic.

This comprehensive guide will walk you through the steps to configure SSL/TLS with Nginx on AlmaLinux, including obtaining free SSL/TLS certificates from Let’s Encrypt using Certbot.

---

### What is SSL/TLS?

**SSL (Secure Sockets Layer)** and its successor, **TLS (Transport Layer Security)**, are cryptographic protocols that secure communications over a network. They encrypt data exchanged between a client (browser) and server, ensuring privacy and integrity.

Websites secured with SSL/TLS display a padlock icon in the browser's address bar and use the `https://` prefix instead of `http://`.

---

### Prerequisites

Before starting, ensure the following:

1. **AlmaLinux server** with sudo privileges.
2. **Nginx installed and running.** If not installed, follow the Nginx installation section below.
3. **Domain name(s)** pointed to your server’s IP address (A records configured in your domain registrar’s DNS settings).
4. Basic familiarity with the Linux command line.

---

### Step-by-Step Guide to Configure SSL/TLS with Nginx on AlmaLinux

#### Step 1: Update System Packages

Start by updating the system packages to ensure compatibility and security.

```bash
sudo dnf update -y
```

#### Step 2: Install Nginx (if not already installed)

If Nginx is not installed, you can do so using:

```bash
sudo dnf install nginx -y
```

Enable and start the Nginx service:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

To verify the installation, visit your server's IP address in a browser. The default Nginx welcome page should appear.

---

#### Step 3: Install Certbot for Let’s Encrypt

Certbot is a tool that automates the process of obtaining and installing SSL/TLS certificates from Let’s Encrypt.

Install Certbot and its Nginx plugin:

```bash
sudo dnf install certbot python3-certbot-nginx -y
```

---

#### Step 4: Configure Nginx Server Blocks (Optional)

If you’re hosting multiple domains, create a server block for each domain in Nginx. For example, to create a server block for `example.com`:

1. Create the directory for your website files:

   ```bash
   sudo mkdir -p /var/www/example.com/html
   ```

2. Set the appropriate permissions:

   ```bash
   sudo chown -R $USER:$USER /var/www/example.com/html
   sudo chmod -R 755 /var/www
   ```

3. Add a sample HTML file:

   ```bash
   echo "<h1>Welcome to Example.com</h1>" > /var/www/example.com/html/index.html
   ```

4. Create an Nginx server block file:

   ```bash
   sudo nano /etc/nginx/conf.d/example.com.conf
   ```

   Add the following configuration:

   ```nginx
   server {
       listen 80;
       server_name example.com www.example.com;

       root /var/www/example.com/html;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }

       access_log /var/log/nginx/example.com.access.log;
       error_log /var/log/nginx/example.com.error.log;
   }
   ```

5. Test and reload Nginx:

   ```bash
   sudo nginx -t
   sudo systemctl reload nginx
   ```

---

#### Step 5: Obtain an SSL/TLS Certificate with Certbot

To secure your domain, run Certbot’s Nginx plugin:

```bash
sudo certbot --nginx -d example.com -d www.example.com
```

During this process, Certbot will:

- Verify your domain ownership.
- Automatically configure Nginx to use SSL/TLS.
- Set up automatic redirection from HTTP to HTTPS.

---

#### Step 6: Test SSL/TLS Configuration

After the certificate installation, test the SSL/TLS configuration:

1. Visit your website using `https://` (e.g., `https://example.com`) to verify the SSL/TLS certificate is active.
2. Use an online tool like [SSL Labs’ SSL Test](https://www.ssllabs.com/ssltest/) to ensure proper configuration.

---

### Understanding Nginx SSL/TLS Configuration

Certbot modifies your Nginx configuration to enable SSL/TLS. Let’s break down the key elements:

1. **SSL Certificate and Key Paths**:

   Certbot creates certificates in `/etc/letsencrypt/live/<your-domain>/`.

   ```nginx
   ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
   ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
   ```

2. **SSL Protocols and Ciphers**:

   Modern Nginx configurations disable outdated protocols like SSLv3 and use secure ciphers:

   ```nginx
   ssl_protocols TLSv1.2 TLSv1.3;
   ssl_ciphers HIGH:!aNULL:!MD5;
   ```

3. **HTTP to HTTPS Redirection**:

   Certbot sets up a redirection block to ensure all traffic is secured:

   ```nginx
   server {
       listen 80;
       server_name example.com www.example.com;
       return 301 https://$host$request_uri;
   }
   ```

---

### Step 7: Automate SSL/TLS Certificate Renewal

Let’s Encrypt certificates expire every 90 days. Certbot includes a renewal script to automate this process. Test the renewal process:

```bash
sudo certbot renew --dry-run
```

If successful, Certbot will renew certificates automatically via a cron job.

---

### Step 8: Optimize SSL/TLS Performance (Optional)

To enhance security and performance, consider these additional optimizations:

1. **Enable HTTP/2**:

   HTTP/2 improves loading times by allowing multiple requests over a single connection. Add the `http2` directive in the `listen` line:

   ```nginx
   listen 443 ssl http2;
   ```

2. **Use Stronger Ciphers**:

   Configure Nginx with a strong cipher suite. Example:

   ```nginx
   ssl_ciphers EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH;
   ssl_prefer_server_ciphers on;
   ```

3. **Enable OCSP Stapling**:

   OCSP Stapling improves SSL handshake performance by caching certificate status:

   ```nginx
   ssl_stapling on;
   ssl_stapling_verify on;
   resolver 8.8.8.8 8.8.4.4;
   ```

4. **Add HSTS Header**:

   Enforce HTTPS by adding the HTTP Strict Transport Security (HSTS) header:

   ```nginx
   add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
   ```

---

### Troubleshooting SSL/TLS Issues

1. **Nginx Fails to Start**:

   Check for syntax errors:

   ```bash
   sudo nginx -t
   ```

   Review logs in `/var/log/nginx/error.log`.

2. **Certificate Expired**:

   If certificates are not renewed automatically, manually renew them:

   ```bash
   sudo certbot renew
   ```

3. **Mixed Content Warnings**:

   Ensure all resources (images, scripts, styles) are loaded over HTTPS.

---

### Conclusion

Configuring SSL/TLS with Nginx on AlmaLinux is a critical step for securing your websites and building user trust. By using Certbot with Let’s Encrypt, you can easily obtain and manage free SSL/TLS certificates. The process includes creating server blocks, obtaining certificates, configuring HTTPS, and optimizing SSL/TLS settings for enhanced security and performance.

With the steps in this guide, you’re now equipped to secure your websites with robust encryption, ensuring privacy and security for your users.
