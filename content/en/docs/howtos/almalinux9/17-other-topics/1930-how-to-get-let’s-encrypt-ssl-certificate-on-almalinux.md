---
title: How to Get Let’s Encrypt SSL Certificate on AlmaLinux
linkTitle: Let’s Encrypt SSL
description: This guide walks you through the process of getting a Let’s Encrypt SSL certificate on AlmaLinux, a popular RHEL-based Linux distribution.
date: 2025-01-08
weight: 1930
url: lets-encrypt-ssl-certificate-almalinux
draft: false
tags:
  - AlmaLinux
  - letd encrypt ssl
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Securing your website with an SSL/TLS certificate is essential for protecting data and building trust with your users. Let’s Encrypt, a free, automated, and open certificate authority, makes it easy to obtain SSL certificates. This guide walks you through the process of getting a Let’s Encrypt SSL certificate on AlmaLinux, a popular RHEL-based Linux distribution.

### Prerequisites

Before you start, ensure the following:

1. **A domain name**: You need a fully qualified domain name (FQDN) that points to your server.
2. **Root or sudo access**: Administrator privileges are required to install and configure software.
3. **Web server installed**: Apache or Nginx should be installed and running.
4. **Firewall configured**: Ensure HTTP (port 80) and HTTPS (port 443) are allowed.

Let’s Encrypt uses Certbot, a popular ACME client, to generate and manage SSL certificates. Follow the steps below to install Certbot and secure your AlmaLinux server.

---

### Step 1: Update Your System

First, update your system packages to ensure compatibility:

```bash
sudo dnf update -y
```

This ensures that your software packages and repositories are up to date.

---

### Step 2: Install EPEL Repository

Certbot is available through the EPEL (Extra Packages for Enterprise Linux) repository. Install it using:

```bash
sudo dnf install epel-release -y
```

Enable the repository:

```bash
sudo dnf update
```

---

### Step 3: Install Certbot

Certbot is the ACME client used to obtain Let’s Encrypt SSL certificates. Install Certbot along with the web server plugin:

#### For Apache

```bash
sudo dnf install certbot python3-certbot-apache -y
```

#### For Nginx

```bash
sudo dnf install certbot python3-certbot-nginx -y
```

---

### Step 4: Obtain an SSL Certificate

Certbot simplifies the process of obtaining SSL certificates. Use the appropriate command based on your web server:

#### For Apache

```bash
sudo certbot --apache
```

Certbot will prompt you to:

- Enter your email address (for renewal notifications).
- Agree to the terms of service.
- Choose whether to share your email with the Electronic Frontier Foundation (EFF).

Certbot will automatically detect your domain(s) configured in Apache and offer options to enable HTTPS for them. Select the domains you wish to secure and proceed.

#### For Nginx

```bash
sudo certbot --nginx
```

Similar to Apache, Certbot will guide you through the process, detecting your domain(s) and updating the Nginx configuration to enable HTTPS.

---

### Step 5: Verify SSL Installation

After completing the Certbot process, verify that your SSL certificate is installed and working correctly.

#### Using a Browser

Visit your website with `https://your_domain`. Look for a padlock icon in the address bar, which indicates a secure connection.

#### Using SSL Labs

You can use [SSL Labs’ SSL Test](https://www.ssllabs.com/ssltest/) to analyze your SSL configuration and ensure everything is set up properly.

---

### Step 6: Configure Automatic Renewal

Let’s Encrypt certificates are valid for 90 days, so it’s crucial to set up automatic renewal. Certbot includes a systemd timer to handle this.

Verify that the timer is active:

```bash
sudo systemctl status certbot.timer
```

If it’s not enabled, activate it:

```bash
sudo systemctl enable --now certbot.timer
```

You can also test renewal manually to ensure everything works:

```bash
sudo certbot renew --dry-run
```

---

### Step 7: Adjust Firewall Settings

Ensure your firewall allows HTTPS traffic. Use the following commands to update firewall rules:

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

---

### Optional: Manually Edit Configuration (if needed)

Certbot modifies your web server’s configuration to enable SSL. If you need to customize settings, edit the configuration files directly.

#### For Apache

```bash
sudo nano /etc/httpd/conf.d/ssl.conf
```

Or edit the virtual host configuration file:

```bash
sudo nano /etc/httpd/sites-enabled/your_site.conf
```

#### For Nginx

```bash
sudo nano /etc/nginx/conf.d/your_site.conf
```

Make necessary changes, then restart the web server:

```bash
sudo systemctl restart httpd  # For Apache
sudo systemctl restart nginx  # For Nginx
```

---

### Troubleshooting

If you encounter issues during the process, consider the following tips:

- **Certbot Cannot Detect Your Domain:** Ensure your web server is running and correctly configured to serve your domain.
- **Port 80 or 443 Blocked:** Verify that these ports are open and not blocked by your firewall or hosting provider.
- **Renewal Issues:** Check Certbot logs for errors:

  ```bash
  sudo less /var/log/letsencrypt/letsencrypt.log
  ```

---

### Security Best Practices

To maximize the security of your SSL configuration:

1. **Use Strong Ciphers:** Update your web server’s configuration to prioritize modern, secure ciphers.
2. **Enable HTTP Strict Transport Security (HSTS):** This ensures browsers only connect to your site over HTTPS.
3. **Disable Insecure Protocols:** Ensure SSLv3 and older versions of TLS are disabled.

#### Example HSTS Configuration

Add the following header to your web server configuration:

```bash
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
```

---

### Conclusion

Obtaining a Let’s Encrypt SSL certificate on AlmaLinux is a straightforward process with Certbot. By following the steps outlined in this guide, you can secure your website and provide users with a safe browsing experience. Remember to configure automatic renewal and follow best practices to maintain a secure and compliant environment. With Let’s Encrypt, achieving HTTPS for your AlmaLinux server is both cost-effective and efficient.
