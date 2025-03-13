---
title: How to Enable Userdir with Nginx on AlmaLinux
linkTitle: Enable Userdir with Nginx
description: This guide explains how to enable and configure userdir with Nginx on AlmaLinux, step by step.
date: 2024-12-18
weight: 990
url: enable-userdir-nginx-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-enable-userdir-with-nginx-on-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
---
The `userdir` module is a useful feature that allows individual users on a Linux server to host their own web content in directories under their home folders. By enabling `userdir` with Nginx on AlmaLinux, you can set up a system where users can create personal websites or test environments without needing root or administrative access to the web server configuration.

This guide explains how to enable and configure `userdir` with Nginx on AlmaLinux, step by step.

---

### What Is `userdir`?

The `userdir` feature is a mechanism in Unix-like operating systems that allows each user to have a web directory within their home directory. By default, the directory is typically named `public_html`, and it can be accessed via a URL such as:

```html
http://example.com/~username/
```

This feature is particularly useful in shared hosting environments, educational setups, or scenarios where multiple users need isolated web development environments.

---

### Prerequisites

Before enabling `userdir`, ensure the following:

1. **AlmaLinux installed and running** with root or sudo access.
2. **Nginx installed and configured** as the web server.
3. At least one non-root user account available for testing.
4. Basic familiarity with Linux commands and file permissions.

---

### Step-by-Step Guide to Enable Userdir with Nginx

#### Step 1: Update Your System

Start by updating your AlmaLinux system to ensure it has the latest packages and security updates:

```bash
sudo dnf update -y
```

#### Step 2: Install Nginx (if not already installed)

If Nginx isn’t installed, you can install it with the following command:

```bash
sudo dnf install nginx -y
```

After installation, enable and start Nginx:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

Verify the installation by visiting your server’s IP address in a browser. The default Nginx welcome page should appear.

---

#### Step 3: Create User Accounts

If you don’t already have user accounts on your system, create one for testing purposes. Replace `username` with the desired username:

```bash
sudo adduser username
sudo passwd username
```

This creates a new user and sets a password for the account.

---

#### Step 4: Create the `public_html` Directory

For each user who needs web hosting, create a `public_html` directory inside their home directory:

```bash
mkdir -p /home/username/public_html
```

Set appropriate permissions so Nginx can serve files from this directory:

```bash
chmod 755 /home/username
chmod 755 /home/username/public_html
```

The `755` permissions ensure that the directory is readable by others, while still being writable only by the user.

---

#### Step 5: Add Sample Content

To test the `userdir` setup, add a sample HTML file inside the user’s `public_html` directory:

```bash
echo "<h1>Welcome to Userdir for username</h1>" > /home/username/public_html/index.html
```

---

#### Step 6: Configure Nginx for Userdir

Nginx doesn’t natively support `userdir` out of the box, so you’ll need to manually configure it by adding a custom server block.

1. **Open the Nginx configuration file**:

   ```bash
   sudo nano /etc/nginx/conf.d/userdir.conf
   ```

2. **Add the following configuration** to enable `userdir`:

   ```nginx
   server {
       listen 80;
       server_name example.com;

       location ~ ^/~([a-zA-Z0-9_-]+)/ {
           alias /home/$1/public_html/;
           autoindex on;
           index index.html index.htm;
           try_files $uri $uri/ =404;
       }

       error_log /var/log/nginx/userdir_error.log;
       access_log /var/log/nginx/userdir_access.log;
   }
   ```

   - The `location` block uses a regular expression to capture the `~username` pattern from the URL.
   - The `alias` directive maps the request to the corresponding user's `public_html` directory.
   - The `try_files` directive ensures that the requested file exists or returns a `404` error.

3. Save and exit the file.

---

#### Step 7: Test and Reload Nginx Configuration

Before reloading Nginx, test the configuration for syntax errors:

```bash
sudo nginx -t
```

If the test is successful, reload Nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

---

#### Step 8: Test the Userdir Setup

Open a browser and navigate to:

```html
http://example.com/~username/
```

You should see the sample HTML content you added earlier: `Welcome to Userdir for username`.

If you don’t see the expected output, check Nginx logs for errors:

```bash
sudo tail -f /var/log/nginx/userdir_error.log
```

---

### Managing Permissions and Security

#### File Permissions

For security, ensure that users cannot access each other’s files. Use the following commands to enforce stricter permissions:

```bash
chmod 711 /home/username
chmod 755 /home/username/public_html
chmod 644 /home/username/public_html/*
```

- **711** for the user’s home directory ensures others can access the `public_html` directory without listing the contents of the home directory.
- **755** for the `public_html` directory allows files to be served by Nginx.
- **644** for files ensures they are readable by others but writable only by the user.

#### Isolating User Environments

To further isolate user environments, consider enabling **SELinux** or setting up **chroot jails**. This ensures that users cannot browse or interfere with system files or other users’ data.

---

### Troubleshooting

#### 1. **404 Errors for User Directories**

- Verify that the `public_html` directory exists for the user.
- Check the permissions of the user’s home directory and `public_html` folder.

#### 2. **Nginx Configuration Errors**

- Use `nginx -t` to identify syntax errors.
- Check the `/var/log/nginx/error.log` file for additional details.

#### 3. **Permissions Denied**

- Ensure that the `public_html` directory and its files have the correct permissions.
- Confirm that SELinux is not blocking access. If SELinux is enabled, you may need to adjust its policies:

     ```bash
     sudo setsebool -P httpd_enable_homedirs 1
     sudo chcon -R -t httpd_sys_content_t /home/username/public_html
     ```

---

### Additional Considerations

#### Enabling HTTPS for Userdir

For added security, configure HTTPS using an SSL certificate. Tools like **Let’s Encrypt Certbot** can help you obtain free certificates. Add SSL support to your `userdir` configuration:

```nginx
server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

    location ~ ^/~([a-zA-Z0-9_-]+)/ {
        alias /home/$1/public_html/;
        autoindex on;
        index index.html index.htm;
        try_files $uri $uri/ =404;
    }
}
```

#### Disabling Directory Listings

If you don’t want directory listings to be visible, remove the `autoindex on;` line from the Nginx configuration.

---

### Conclusion

By enabling `userdir` with Nginx on AlmaLinux, you provide individual users with a secure and efficient way to host their own web content. This is especially useful in shared hosting or development environments where users need isolated yet easily accessible web spaces.

With proper configuration, permissions, and optional enhancements like HTTPS, the `userdir` feature becomes a robust tool for empowering users while maintaining security and performance.
