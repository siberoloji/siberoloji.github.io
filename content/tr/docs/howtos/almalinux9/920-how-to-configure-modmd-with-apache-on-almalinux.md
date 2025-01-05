---
title: How to Configure mod_md with Apache on AlmaLinux
linkTitle: mod_md with Apache
description: This guide will walk you through the process of configuring mod_md with Apache on AlmaLinux.
date: 2024-12-18
weight: 920
url: configure-mod-md-apache-almalinux
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
The `mod_md` module, or **Mod_MD**, is an Apache module designed to simplify the process of managing SSL/TLS certificates via the ACME protocol, which is the standard for automated certificate issuance by services like Let's Encrypt. By using `mod_md`, you can automate certificate requests, renewals, and updates directly from your Apache server, eliminating the need for third-party tools like Certbot. This guide will walk you through the process of configuring `mod_md` with Apache on AlmaLinux.

---

### Prerequisites

Before diving in, ensure the following:

- **AlmaLinux 8 or later** installed on your server.
- **Apache (httpd)** web server version 2.4.30 or higher, as this version introduced `mod_md`.
- A **valid domain name** pointing to your server’s IP address.
- Open ports **80 (HTTP)** and **443 (HTTPS)** in your server’s firewall.
- Basic understanding of Linux command-line tools.

---

### Step 1: Update Your System

Start by updating your AlmaLinux system to ensure all software packages are up to date.

```bash
sudo dnf update -y
```

Install Apache if it is not already installed:

```bash
sudo dnf install httpd -y
```

---

### Step 2: Enable and Verify mod_md

Apache includes `mod_md` in its default packages for versions 2.4.30 and above. To enable the module, follow these steps:

1. **Enable the Module**

   Use the following command to enable `mod_md`:

   ```bash
   sudo dnf install mod_md
   ```

   Open the Apache configuration file to confirm the module is loaded:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

   Ensure the following line is present (it might already be included by default):

   ```apache
   LoadModule md_module modules/mod_md.so
   ```

2. **Verify the Module**

   Check that `mod_md` is active:

   ```bash
   httpd -M | grep md
   ```

   The output should display `md_module` if it’s properly loaded.

3. **Restart Apache**

   After enabling `mod_md`, restart Apache to apply changes:

   ```bash
   sudo systemctl restart httpd
   ```

---

### Step 3: Configure Virtual Hosts for `mod_md`

1. **Create a Virtual Host Configuration**

   Edit or create a virtual host configuration file:

   ```bash
   sudo nano /etc/httpd/conf.d/yourdomain.conf
   ```

   Add the following configuration:

   ```apache
   <VirtualHost *:80>
       ServerName yourdomain.com
       ServerAlias www.yourdomain.com

       # Enable Managed Domain
       MDomain yourdomain.com www.yourdomain.com

       DocumentRoot /var/www/yourdomain
   </VirtualHost>
   ```

   Explanation:
   - `MDomain`: Defines the domains for which `mod_md` will manage certificates.
   - `DocumentRoot`: Points to the directory containing your website files.

   Replace `yourdomain.com` and `www.yourdomain.com` with your actual domain names.

2. **Create the Document Root Directory**

   If the directory specified in `DocumentRoot` doesn’t exist, create it:

   ```bash
   sudo mkdir -p /var/www/yourdomain
   sudo chown -R apache:apache /var/www/yourdomain
   echo "Hello, World!" | sudo tee /var/www/yourdomain/index.html
   ```

3. **Enable SSL Support**

   To use SSL, update the virtual host to include HTTPS:

   ```apache
   <VirtualHost *:443>
       ServerName yourdomain.com
       ServerAlias www.yourdomain.com

       # Enable Managed Domain
       MDomain yourdomain.com www.yourdomain.com

       DocumentRoot /var/www/yourdomain
   </VirtualHost>
   ```

   Save and close the configuration file.

---

### Step 4: Configure `mod_md` for ACME Certificate Management

Modify the main Apache configuration file to enable `mod_md` directives globally.

1. **Open the Apache Configuration**

   Edit the main configuration file:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

2. **Add `mod_md` Directives**

   Append the following directives to configure `mod_md`:

   ```apache
   # Enable Managed Domains
   MDomain yourdomain.com www.yourdomain.com

   # Define ACME protocol provider (default: Let's Encrypt)
   MDCertificateAuthority https://acme-v02.api.letsencrypt.org/directory

   # Automatic renewal
   MDRenewMode auto

   # Define directory for storing certificates
   MDCertificateStore /etc/httpd/md

   # Agreement to ACME Terms of Service
   MDAgreement https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf

   # Enable OCSP stapling
   MDStapling on

   # Redirect HTTP to HTTPS
   MDRequireHttps temporary
   ```

   Explanation:
   - `MDomain`: Specifies the domains managed by `mod_md`.
   - `MDCertificateAuthority`: Points to the ACME provider (default: Let’s Encrypt).
   - `MDRenewMode auto`: Automates certificate renewal.
   - `MDCertificateStore`: Defines the storage location for SSL certificates.
   - `MDAgreement`: Accepts the terms of service for the ACME provider.
   - `MDRequireHttps temporary`: Redirects HTTP traffic to HTTPS during configuration.

3. **Save and Exit**

   Press `Ctrl+O` to save the file, then `Ctrl+X` to exit.

---

### Step 5: Restart Apache and Test Configuration

1. **Restart Apache**

   Apply the new configuration by restarting Apache:

   ```bash
   sudo systemctl restart httpd
   ```

2. **Test Syntax**

   Before proceeding, validate the Apache configuration:

   ```bash
   sudo apachectl configtest
   ```

   If successful, you’ll see `Syntax OK`.

---

### Step 6: Validate SSL Certificate Installation

Once Apache restarts, `mod_md` will contact the ACME provider (e.g., Let’s Encrypt) to request and install SSL certificates for the domains listed in `MDomain`.

1. **Verify Certificates**

   Check the managed domains and their certificate statuses:

   ```bash
   sudo httpd -M | grep md
   ```

   To inspect specific certificates:

   ```bash
   sudo ls /etc/httpd/md/yourdomain.com
   ```

2. **Access Your Domain**

   Open your browser and navigate to `https://yourdomain.com`. Ensure the page loads without SSL warnings.

---

### Step 7: Automate Certificate Renewals

`mod_md` automatically handles certificate renewals. However, you can manually test this process using the following command:

```bash
sudo apachectl -t -D MD_TEST_CERT
```

This command generates a test certificate to verify that the ACME provider and configuration are working correctly.

---

### Step 8: Troubleshooting

If you encounter issues during the configuration process, consider these tips:

1. **Check Apache Logs**

   Examine error logs for details:

   ```bash
   sudo tail -f /var/log/httpd/error_log
   ```

2. **Firewall Configuration**

   Ensure that HTTP (port 80) and HTTPS (port 443) are open:

   ```bash
   sudo firewall-cmd --add-service=http --permanent
   sudo firewall-cmd --add-service=https --permanent
   sudo firewall-cmd --reload
   ```

3. **Ensure Domain Resolution**

   Confirm your domain resolves to your server's IP address using tools like `ping` or `dig`:

   ```bash
   dig yourdomain.com
   ```

4. **ACME Validation**

   If certificate issuance fails, check that Let’s Encrypt can reach your server over HTTP. Ensure no conflicting rules block traffic to port 80.

---

### Conclusion

Configuring `mod_md` with Apache on AlmaLinux simplifies SSL/TLS certificate management by automating the ACME process. With this setup, you can secure your websites effortlessly while ensuring automatic certificate renewals, keeping your web server compliant with industry security standards.

By following this guide, you’ve implemented a streamlined and robust solution for managing SSL certificates on your AlmaLinux server. For more advanced configurations or additional questions, feel free to leave a comment below!
