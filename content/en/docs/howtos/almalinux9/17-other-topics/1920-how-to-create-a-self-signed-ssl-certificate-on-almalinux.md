---
title: How to Create a Self-Signed SSL Certificate on AlmaLinux
linkTitle: null
description: In this guide, we’ll walk you through creating a self-signed SSL certificate on AlmaLinux
date: 2025-01-08
weight: 1920
url: create-signed-ssl-certificate-almalinux
draft: false
tags:
   - AlmaLinux
   - self-signed ssl certificate
categories:
   - Linux
   - Linux How-to
   - Security
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - Self-Signed SSL
featured_image: /images/almalinux.webp
---
Securing websites and applications with SSL/TLS certificates is an essential practice for ensuring data privacy and authentication. A self-signed SSL certificate can be useful in development environments or internal applications where a certificate issued by a trusted Certificate Authority (CA) isn’t required. In this guide, we’ll walk you through creating a self-signed SSL certificate on AlmaLinux, a popular and secure Linux distribution derived from Red Hat Enterprise Linux (RHEL).

### Prerequisites

Before diving into the process, ensure you have the following:

- AlmaLinux installed on your system.
- Access to the terminal with root or sudo privileges.
- OpenSSL installed (it typically comes pre-installed on most Linux distributions).

Let’s proceed step by step.

---

### Step 1: Install OpenSSL (if not already installed)

OpenSSL is a robust tool for managing SSL/TLS certificates. Verify whether it is installed on your system:

```bash
openssl version
```

If OpenSSL is not installed, install it using the following command:

```bash
sudo dnf install openssl -y
```

---

### Step 2: Create a Directory for SSL Certificates

It’s good practice to organize your SSL certificates in a dedicated directory. Create one if it doesn’t exist:

```bash
sudo mkdir -p /etc/ssl/self-signed
```

Navigate to the directory:

```bash
cd /etc/ssl/self-signed
```

---

### Step 3: Generate a Private Key

The private key is a crucial component of an SSL certificate. It should be kept confidential to maintain security. Run the following command to generate a 2048-bit RSA private key:

```bash
sudo openssl genrsa -out private.key 2048
```

This will create a file named `private.key` in the current directory.

For enhanced security, consider generating a 4096-bit key:

```bash
sudo openssl genrsa -out private.key 4096
```

---

### Step 4: Create a Certificate Signing Request (CSR)

A CSR contains information about your organization and domain. Run the following command:

```bash
sudo openssl req -new -key private.key -out certificate.csr
```

You will be prompted to enter details such as:

- **Country Name** (e.g., `US`)
- **State or Province Name** (e.g., `California`)
- **Locality Name** (e.g., `San Francisco`)
- **Organization Name** (e.g., `MyCompany`)
- **Organizational Unit Name** (e.g., `IT Department`)
- **Common Name** (e.g., `example.com` or `*.example.com` for a wildcard certificate)
- **Email Address** (optional)

Ensure the Common Name matches your domain or IP address.

---

### Step 5: Generate the Self-Signed Certificate

Once the CSR is created, you can generate a self-signed certificate:

```bash
sudo openssl x509 -req -days 365 -in certificate.csr -signkey private.key -out certificate.crt
```

Here:

- `-days 365` specifies the validity of the certificate (1 year). Adjust as needed.
- `certificate.crt` is the output file containing the self-signed certificate.

---

### Step 6: Verify the Certificate

To ensure the certificate was created successfully, inspect its details:

```bash
openssl x509 -in certificate.crt -text -noout
```

This command displays details such as the validity period, issuer, and subject.

---

### Step 7: Configure Applications to Use the Certificate

After generating the certificate and private key, configure your applications or web server (e.g., Apache, Nginx) to use them.

#### For Apache

1. Edit your site’s configuration file (e.g., `/etc/httpd/conf.d/ssl.conf` or a virtual host file).

   ```bash
   sudo nano /etc/httpd/conf.d/ssl.conf
   ```

2. Update the `SSLCertificateFile` and `SSLCertificateKeyFile` directives:

   ```bash
   SSLCertificateFile /etc/ssl/self-signed/certificate.crt
   SSLCertificateKeyFile /etc/ssl/self-signed/private.key
   ```

3. Restart Apache:

   ```bash
   sudo systemctl restart httpd
   ```

#### For Nginx

1. Edit your site’s server block file (e.g., `/etc/nginx/conf.d/your_site.conf`).

   ```bash
   sudo nano /etc/nginx/conf.d/your_site.conf
   ```

2. Update the `ssl_certificate` and `ssl_certificate_key` directives:

   ```bash
   ssl_certificate /etc/ssl/self-signed/certificate.crt;
   ssl_certificate_key /etc/ssl/self-signed/private.key;
   ```

3. Restart Nginx:

   ```bash
   sudo systemctl restart nginx
   ```

---

### Step 8: Test the SSL Configuration

Use tools like **curl** or a web browser to verify your application is accessible via HTTPS:

```bash
curl -k https://your_domain_or_ip
```

The `-k` option bypasses certificate verification, which is expected for self-signed certificates.

---

### Step 9: Optional - Automating Certificate Renewal

Since self-signed certificates have a fixed validity, automate renewal by scheduling a script with **cron**. For example:

1. Create a script:

   ```bash
   sudo nano /usr/local/bin/renew_self_signed_ssl.sh
   ```

   Add the following content:

   ```bash
   #!/bin/bash
   openssl req -new -key /etc/ssl/self-signed/private.key -out /etc/ssl/self-signed/certificate.csr -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=your_domain"
   openssl x509 -req -days 365 -in /etc/ssl/self-signed/certificate.csr -signkey /etc/ssl/self-signed/private.key -out /etc/ssl/self-signed/certificate.crt
   systemctl reload nginx
   ```

2. Make it executable:

   ```bash
   sudo chmod +x /usr/local/bin/renew_self_signed_ssl.sh
   ```

3. Schedule it in crontab:

   ```bash
   sudo crontab -e
   ```

   Add an entry to run the script annually:

   ```bash
   0 0 1 1 * /usr/local/bin/renew_self_signed_ssl.sh
   ```

---

### Conclusion

Creating a self-signed SSL certificate on AlmaLinux is a straightforward process that involves generating a private key, CSR, and signing the certificate. While self-signed certificates are suitable for testing and internal purposes, they are not ideal for public-facing websites due to trust issues. For production environments, always obtain certificates from trusted Certificate Authorities. By following the steps outlined in this guide, you can secure your AlmaLinux applications with ease and efficiency.
