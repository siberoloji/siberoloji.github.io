---
title: How to Use CGI Scripts with Nginx on AlmaLinux
linkTitle: CGI Scripts with Nginx
description: This guide will walk you through the process of using CGI scripts with Nginx on AlmaLinux.
date: 2024-12-18
weight: 1010
url: cgi-scripts-nginx-almalinux
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
CGI (Common Gateway Interface) scripts are one of the earliest and simplest ways to generate dynamic content on a web server. They allow a server to execute scripts (written in languages like Python, Perl, or Bash) and send the output to a user's browser. Although CGI scripts are less common in modern development due to alternatives like PHP, FastCGI, and application frameworks, they remain useful for specific use cases such as small-scale web tools or legacy systems.

Nginx, a high-performance web server, does not natively support CGI scripts like Apache. However, with the help of additional tools such as **FCGIWrapper** or **Spawn-FCGI**, you can integrate CGI support into your Nginx server. This guide will walk you through the process of using CGI scripts with Nginx on AlmaLinux.

---

## What are CGI Scripts?

A CGI script is a program that runs on a server in response to a user request, typically via an HTML form or direct URL. The script processes the request, generates output (usually in HTML), and sends it back to the client. CGI scripts can be written in any language that can produce standard output, including:

- **Python**
- **Perl**
- **Bash**
- **C/C++**

---

## Prerequisites

Before you begin, ensure you have the following:

1. **AlmaLinux server** with root or sudo privileges.
2. **Nginx installed and running**.
3. Basic knowledge of Linux commands and file permissions.
4. **CGI script(s)** for testing, or the ability to create one.

---

## Step-by-Step Guide to Using CGI Scripts with Nginx

### Step 1: Update Your System

Begin by updating the AlmaLinux system to ensure you have the latest packages and security patches:

```bash
sudo dnf update -y
```

---

### Step 2: Install Nginx (If Not Already Installed)

If Nginx is not installed, you can install it using:

```bash
sudo dnf install nginx -y
```

Start and enable the Nginx service:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

---

### Step 3: Install and Configure a CGI Processor

Nginx does not natively support CGI scripts. To enable this functionality, you need a FastCGI wrapper or similar tool. For this guide, we’ll use **fcgiwrap**, a lightweight FastCGI server for handling CGI scripts.

1. **Install `fcgiwrap`**:

   ```bash
   sudo dnf install fcgiwrap -y
   ```

2. **Enable and Start `fcgiwrap`**:

   By default, `fcgiwrap` is managed by a systemd socket. Start and enable it:

   ```bash
   sudo systemctl enable fcgiwrap.socket
   sudo systemctl start fcgiwrap.socket
   ```

   Check the status to ensure it’s running:

   ```bash
   sudo systemctl status fcgiwrap.socket
   ```

---

### Step 4: Set Up the CGI Script Directory

Create a directory to store your CGI scripts. The standard location for CGI scripts is `/usr/lib/cgi-bin`, but you can use any directory.

```bash
sudo mkdir -p /usr/lib/cgi-bin
```

Set appropriate permissions for the directory:

```bash
sudo chmod 755 /usr/lib/cgi-bin
```

Add a test CGI script, such as a simple Bash script:

```bash
sudo nano /usr/lib/cgi-bin/hello.sh
```

Add the following code:

```bash
#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><body><h1>Hello from CGI!</h1></body></html>"
```

Save the file and make it executable:

```bash
sudo chmod +x /usr/lib/cgi-bin/hello.sh
```

---

### Step 5: Configure Nginx for CGI Scripts

Edit the Nginx configuration to enable FastCGI processing for the `/cgi-bin/` directory.

1. **Edit the Nginx configuration**:

   Open the server block configuration file, typically located in `/etc/nginx/conf.d/` or `/etc/nginx/nginx.conf`.

   ```bash
   sudo nano /etc/nginx/conf.d/default.conf
   ```

2. **Add a location block for CGI scripts**:

   Add the following to the `server` block:

   ```nginx
   server {
       listen 80;
       server_name your-domain.com;

       location /cgi-bin/ {
           root /usr/lib/;
           fastcgi_pass unix:/var/run/fcgiwrap.socket;
           include fastcgi_params;
           fastcgi_param SCRIPT_FILENAME /usr/lib$fastcgi_script_name;
           fastcgi_param QUERY_STRING $query_string;
           fastcgi_param REQUEST_METHOD $request_method;
           fastcgi_param CONTENT_TYPE $content_type;
           fastcgi_param CONTENT_LENGTH $content_length;
       }
   }
   ```

3. **Save and exit** the configuration file.

4. **Test the configuration**:

   Check for syntax errors:

   ```bash
   sudo nginx -t
   ```

5. **Reload Nginx**:

   Apply the changes by reloading the service:

   ```bash
   sudo systemctl reload nginx
   ```

---

### Step 6: Test the CGI Script

Open a browser and navigate to:

```html
http://your-domain.com/cgi-bin/hello.sh
```

You should see the output: **"Hello from CGI!"**

---

## Advanced Configuration

### 1. Restrict Access to CGI Scripts

If you only want specific users or IP addresses to access the `/cgi-bin/` directory, you can restrict it using access control directives:

```nginx
location /cgi-bin/ {
    root /usr/lib/;
    fastcgi_pass unix:/var/run/fcgiwrap.socket;
    include fastcgi_params;
    allow 192.168.1.0/24;
    deny all;
}
```

---

### 2. Enable HTTPS for Secure Transmission

To ensure secure transmission of data to and from the CGI scripts, configure HTTPS using **Let’s Encrypt**:

1. Install Certbot:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. Obtain and configure an SSL certificate:

   ```bash
   sudo certbot --nginx -d your-domain.com -d www.your-domain.com
   ```

3. Verify HTTPS functionality by accessing your CGI script over `https://`.

---

### 3. Debugging and Logs

- **Check Nginx Logs**: Errors and access logs are stored in `/var/log/nginx/`. Use the following commands to view logs:

  ```bash
  sudo tail -f /var/log/nginx/error.log
  sudo tail -f /var/log/nginx/access.log
  ```

- **Check fcgiwrap Logs**: If `fcgiwrap` fails, check its logs for errors:

  ```bash
  sudo journalctl -u fcgiwrap
  ```

---

## Security Best Practices

1. **Script Permissions**: Ensure all CGI scripts have secure permissions. For example:

   ```bash
   sudo chmod 700 /usr/lib/cgi-bin/*
   ```

2. **Validate Input**: Always validate and sanitize input to prevent injection attacks.

3. **Restrict Execution**: Limit script execution to trusted users or IP addresses using Nginx access control rules.

4. **Use HTTPS**: Encrypt all traffic with HTTPS to protect sensitive data.

---

## Conclusion

Using CGI scripts with Nginx on AlmaLinux allows you to execute server-side scripts efficiently while maintaining Nginx's high performance. With the help of tools like `fcgiwrap`, you can integrate legacy CGI functionality into modern Nginx deployments. By following the steps in this guide, you can set up and test CGI scripts on your AlmaLinux server while ensuring security and scalability.

Whether for small-scale tools, testing environments, or legacy support, this setup provides a robust way to harness the power of CGI with Nginx.
