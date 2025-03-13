---
title: How to Configure Virtual Hosting with Nginx on AlmaLinux
linkTitle: Virtual Hosting with Nginx
description: This guide walks you through configuring virtual hosting with Nginx on AlmaLinux.
date: 2024-12-18
weight: 970
url: configure-virtual-hosting-nginx-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-configure-virtual-hosting-with-nginx-on-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
---
In today’s web-hosting landscape, virtual hosting allows multiple websites to run on a single server, saving costs and optimizing server resources. Nginx, a popular open-source web server, excels in performance, scalability, and flexibility, making it a go-to choice for hosting multiple domains or websites on a single server. Paired with AlmaLinux, a CentOS alternative known for its stability and compatibility, this combination provides a powerful solution for virtual hosting.

This guide walks you through configuring virtual hosting with Nginx on AlmaLinux. By the end, you’ll be equipped to host multiple websites on your AlmaLinux server with ease.

---

### What is Virtual Hosting?

Virtual hosting is a server configuration method that enables a single server to host multiple domains or websites. With Nginx, there are two types of virtual hosting configurations:

1. **Name-based Virtual Hosting**: Multiple domains share the same IP address, and Nginx determines which website to serve based on the domain name in the HTTP request.
2. **IP-based Virtual Hosting**: Each domain has a unique IP address, which requires additional IP addresses.

For most use cases, **name-based virtual hosting** is sufficient and cost-effective. This tutorial focuses on that method.

---

### Prerequisites

Before proceeding, ensure the following:

1. **A server running AlmaLinux** with a sudo-enabled user.
2. **Nginx installed**. If not installed, refer to the Nginx documentation or the instructions below.
3. **Domain names** pointed to your server’s IP address.
4. Basic understanding of Linux command-line operations.

---

### Step-by-Step Guide to Configure Virtual Hosting with Nginx on AlmaLinux

#### Step 1: Update Your System

Begin by updating your system packages to ensure compatibility and security.

```bash
sudo dnf update -y
```

#### Step 2: Install Nginx

If Nginx is not already installed on your system, install it using the following commands:

```bash
sudo dnf install nginx -y
```

Once installed, enable and start Nginx:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

You can verify the installation by visiting your server's IP address in a browser. If Nginx is installed correctly, you’ll see the default welcome page.

---

#### Step 3: Configure DNS Records

Ensure your domain names are pointed to the server’s IP address. Log in to your domain registrar’s dashboard and configure **A records** to link the domains to your server.

Example:

- Domain: `example1.com` → A record → `192.168.1.100`
- Domain: `example2.com` → A record → `192.168.1.100`

Allow some time for the DNS changes to propagate.

---

#### Step 4: Create Directory Structures for Each Website

Organize your websites by creating a dedicated directory for each domain. This will help manage files efficiently.

```bash
sudo mkdir -p /var/www/example1.com/html
sudo mkdir -p /var/www/example2.com/html
```

Set appropriate ownership and permissions for these directories:

```bash
sudo chown -R $USER:$USER /var/www/example1.com/html
sudo chown -R $USER:$USER /var/www/example2.com/html
sudo chmod -R 755 /var/www
```

Next, create sample HTML files for testing:

```bash
echo "<h1>Welcome to Example1.com</h1>" > /var/www/example1.com/html/index.html
echo "<h1>Welcome to Example2.com</h1>" > /var/www/example2.com/html/index.html
```

---

#### Step 5: Configure Virtual Host Files

Nginx stores its server block (virtual host) configurations in `/etc/nginx/conf.d/` by default. Create separate configuration files for each domain.

```bash
sudo nano /etc/nginx/conf.d/example1.com.conf
```

Add the following content:

```nginx
server {
    listen 80;
    server_name example1.com www.example1.com;

    root /var/www/example1.com/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/example1.com.access.log;
    error_log /var/log/nginx/example1.com.error.log;
}
```

Save and exit the file, then create another configuration for the second domain:

```bash
sudo nano /etc/nginx/conf.d/example2.com.conf
```

Add similar content, replacing domain names and paths:

```nginx
server {
    listen 80;
    server_name example2.com www.example2.com;

    root /var/www/example2.com/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/example2.com.access.log;
    error_log /var/log/nginx/example2.com.error.log;
}
```

---

#### Step 6: Test and Reload Nginx Configuration

Verify your Nginx configuration for syntax errors:

```bash
sudo nginx -t
```

If the test is successful, reload Nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

---

#### Step 7: Verify Virtual Hosting Setup

Open a browser and visit your domain names (`example1.com` and `example2.com`). You should see the corresponding welcome messages. This confirms that Nginx is serving different content based on the domain name.

---

### Optional: Enable HTTPS with Let’s Encrypt

Securing your websites with HTTPS is essential for modern web hosting. Use **Certbot**, a tool from Let’s Encrypt, to obtain and install SSL/TLS certificates.

1. **Install Certbot** and the Nginx plugin:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. **Obtain SSL certificates**:

   ```bash
   sudo certbot --nginx -d example1.com -d www.example1.com
   sudo certbot --nginx -d example2.com -d www.example2.com
   ```

3. Certbot will automatically configure Nginx to redirect HTTP traffic to HTTPS. Test the new configuration:

   ```bash
   sudo nginx -t
   sudo systemctl reload nginx
   ```

4. Verify HTTPS by visiting your domains (`https://example1.com` and `https://example2.com`).

---

### Troubleshooting Tips

- **404 Errors**: Ensure the `root` directory path in your configuration files matches the actual directory containing your website files.
- **Nginx Not Starting**: Check for syntax errors using `nginx -t` and inspect logs at `/var/log/nginx/error.log`.
- **DNS Issues**: Confirm that your domain’s A records are correctly pointing to the server’s IP address.

---

### Conclusion

Configuring virtual hosting with Nginx on AlmaLinux is a straightforward process that enables you to efficiently host multiple websites on a single server. By organizing your files, creating server blocks, and optionally securing your sites with HTTPS, you can deliver robust and secure hosting solutions. AlmaLinux and Nginx provide a reliable foundation for web hosting, whether for personal projects or enterprise-level applications.

With this setup, you’re ready to scale your hosting capabilities and offer seamless web services.
