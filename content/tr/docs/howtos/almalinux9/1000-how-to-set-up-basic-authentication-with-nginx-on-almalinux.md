---
title: How to Set Up Basic Authentication with Nginx on AlmaLinux
linkTitle: Basic Authentication with Nginx
description: In this guide, we will walk you through the steps to configure Basic Authentication on Nginx running on AlmaLinux
date: 2024-12-18
weight: 1000
url: set-basic-authentication-nginx-almalinux
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


featured_image: /images/almalinux.webp
---
Securing your web resources is a critical part of managing a web server. One simple yet effective way to restrict access to certain sections of your website or web applications is by enabling Basic Authentication in Nginx. This method prompts users for a username and password before allowing access, providing an extra layer of security for sensitive or private content.

In this guide, we will walk you through the steps to configure Basic Authentication on Nginx running on AlmaLinux, covering everything from prerequisites to fine-tuning the configuration for security and performance.

---

## What is Basic Authentication?

Basic Authentication is an HTTP-based method for securing web content. When a user attempts to access a restricted area, the server sends a challenge requesting a username and password. The browser then encodes these credentials in Base64 and transmits them back to the server for validation. If the credentials are correct, access is granted; otherwise, access is denied.

While Basic Authentication is straightforward to implement, it is often used in combination with HTTPS to encrypt the credentials during transmission and prevent interception.

---

## Prerequisites

Before we begin, ensure the following:

1. **AlmaLinux server** with root or sudo privileges.
2. **Nginx installed and configured**. If not, refer to the installation steps below.
3. A basic understanding of the Linux command line.
4. Optional: A domain name pointed to your server’s IP address for testing.

---

## Step-by-Step Guide to Configuring Basic Authentication

### Step 1: Update Your AlmaLinux System

To ensure your server is running the latest packages, update the system with:

```bash
sudo dnf update -y
```

---

### Step 2: Install Nginx (If Not Already Installed)

If Nginx is not installed, install it using:

```bash
sudo dnf install nginx -y
```

Enable and start Nginx:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

Verify that Nginx is running by visiting your server’s IP address in a web browser. You should see the default Nginx welcome page.

---

### Step 3: Install `htpasswd` Utility

The `htpasswd` command-line utility from the **httpd-tools** package is used to create and manage username/password pairs for Basic Authentication. Install it with:

```bash
sudo dnf install httpd-tools -y
```

---

### Step 4: Create a Password File

The `htpasswd` utility generates a file to store the usernames and encrypted passwords. For security, place this file in a directory that is not publicly accessible. For example, create a directory named `/etc/nginx/auth/`:

```bash
sudo mkdir -p /etc/nginx/auth
```

Now, create a password file and add a user. Replace `username` with your desired username:

```bash
sudo htpasswd -c /etc/nginx/auth/.htpasswd username
```

You will be prompted to set and confirm a password. The `-c` flag creates the file. To add additional users later, omit the `-c` flag:

```bash
sudo htpasswd /etc/nginx/auth/.htpasswd anotheruser
```

---

### Step 5: Configure Nginx to Use Basic Authentication

Next, modify your Nginx configuration to enable Basic Authentication for the desired location or directory. For example, let’s restrict access to a subdirectory `/admin`.

1. **Edit the Nginx server block configuration file**:

   Open the Nginx configuration file for your site. For the default site, edit `/etc/nginx/conf.d/default.conf`:

   ```bash
   sudo nano /etc/nginx/conf.d/default.conf
   ```

2. **Add Basic Authentication to the desired location**:

   Within the `server` block, add the following:

   ```nginx
   location /admin {
       auth_basic "Restricted Area"; # Message shown in the authentication prompt
       auth_basic_user_file /etc/nginx/auth/.htpasswd;
   }
   ```

   This configuration tells Nginx to:
   - Display the authentication prompt with the message **"Restricted Area"**.
   - Use the password file located at `/etc/nginx/auth/.htpasswd`.

3. **Save and exit** the file.

---

### Step 6: Test and Reload Nginx Configuration

Before reloading Nginx, test the configuration for syntax errors:

```bash
sudo nginx -t
```

If the test is successful, reload Nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

---

### Step 7: Test Basic Authentication

Open a browser and navigate to the restricted area, such as:

```html
http://your-domain.com/admin
```

You should be prompted to enter a username and password. Use the credentials created with the `htpasswd` command. If the credentials are correct, you’ll gain access; otherwise, access will be denied.

---

## Securing Basic Authentication with HTTPS

Basic Authentication transmits credentials in Base64 format, which can be easily intercepted if the connection is not encrypted. To protect your credentials, you must enable HTTPS.

### Step 1: Install Certbot for Let’s Encrypt

Install Certbot and its Nginx plugin:

```bash
sudo dnf install certbot python3-certbot-nginx -y
```

### Step 2: Obtain an SSL Certificate

Run Certbot to obtain and automatically configure SSL/TLS for your domain:

```bash
sudo certbot --nginx -d your-domain.com -d www.your-domain.com
```

Certbot will prompt you for an email address and ask you to agree to the terms of service. It will then configure HTTPS for your site.

### Step 3: Verify HTTPS

After the process completes, visit your site using `https://`:

```html
https://your-domain.com/admin
```

The connection should now be encrypted, securing your Basic Authentication credentials.

---

## Advanced Configuration Options

### 1. Restrict Basic Authentication to Specific Methods

You can limit Basic Authentication to specific HTTP methods, such as `GET` and `POST`, by modifying the `location` block:

```nginx
location /admin {
    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/auth/.htpasswd;
    limit_except GET POST {
        deny all;
    }
}
```

---

### 2. Protect Multiple Locations

To apply Basic Authentication to multiple locations, you can define it in a higher-level block, such as the `server` or `http` block. For example:

```nginx
server {
    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/auth/.htpasswd;

    location /admin {
        # Specific settings for /admin
    }

    location /secure {
        # Specific settings for /secure
    }
}
```

---

### 3. Customize Authentication Messages

The `auth_basic` directive message can be customized to provide context for the login prompt. For example:

```nginx
auth_basic "Enter your credentials to access the admin panel";
```

---

## Troubleshooting Common Issues

### 1. **Nginx Fails to Start or Reload**

- Check for syntax errors with `nginx -t`.
- Review the Nginx error log for details: `/var/log/nginx/error.log`.

### 2. **Password Prompt Not Appearing**

- Ensure the `auth_basic_user_file` path is correct and accessible by Nginx.
- Verify file permissions for `/etc/nginx/auth/.htpasswd`.

   ```bash
   sudo chmod 640 /etc/nginx/auth/.htpasswd
   sudo chown root:nginx /etc/nginx/auth/.htpasswd
   ```

### 3. **Credentials Not Accepted**

- Double-check the username and password in the `.htpasswd` file.
- Regenerate the password file if needed.

---

## Conclusion

Basic Authentication is a simple yet effective method to secure sensitive areas of your website. When configured with Nginx on AlmaLinux, it provides a quick way to restrict access without the need for complex user management systems. However, always combine Basic Authentication with HTTPS to encrypt credentials and enhance security.

By following this guide, you now have a secure and functional Basic Authentication setup on your AlmaLinux server. Whether for admin panels, staging environments, or private sections of your site, this configuration adds an essential layer of protection.
