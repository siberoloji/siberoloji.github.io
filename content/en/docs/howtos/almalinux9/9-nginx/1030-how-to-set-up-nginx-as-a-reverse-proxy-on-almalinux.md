---
title: How to Set Up Nginx as a Reverse Proxy on AlmaLinux
linkTitle: Nginx as a Reverse Proxy
description: In this guide, we’ll cover how to configure Nginx as a reverse proxy on AlmaLinux.
date: 2024-12-18
weight: 1030
url: set-nginx-reverse-proxy-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: set-nginx-reverse-proxy-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
A reverse proxy is a server that sits between clients and backend servers, forwarding client requests to the appropriate backend server and returning the server’s response to the client. Nginx, a high-performance web server, is a popular choice for setting up reverse proxies due to its speed, scalability, and flexibility.

In this guide, we’ll cover how to configure Nginx as a reverse proxy on AlmaLinux. This setup is particularly useful for load balancing, improving security, caching, or managing traffic for multiple backend services.

---

## What is a Reverse Proxy?

A reverse proxy acts as an intermediary for client requests, forwarding them to backend servers. Unlike a forward proxy that shields clients from servers, a reverse proxy shields servers from clients. Key benefits include:

1. **Load Balancing**: Distributes incoming requests across multiple servers to ensure high availability.
2. **Enhanced Security**: Hides backend server details and acts as a buffer for malicious traffic.
3. **SSL Termination**: Offloads SSL/TLS encryption to the reverse proxy to reduce backend server load.
4. **Caching**: Improves performance by caching responses.

---

## Prerequisites

Before setting up Nginx as a reverse proxy, ensure you have the following:

1. **AlmaLinux server** with root or sudo privileges.
2. **Nginx installed and running**.
3. One or more backend servers to proxy traffic to. These could be applications running on different ports of the same server or separate servers entirely.
4. A domain name (optional) pointed to your Nginx server for easier testing.

---

## Step-by-Step Guide to Configuring Nginx as a Reverse Proxy

### Step 1: Update Your AlmaLinux System

Update all packages to ensure your system is up-to-date:

```bash
sudo dnf update -y
```

---

### Step 2: Install Nginx

If Nginx isn’t installed, you can install it with:

```bash
sudo dnf install nginx -y
```

Start and enable Nginx:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

Verify the installation by visiting your server's IP address in a web browser. The default Nginx welcome page should appear.

---

### Step 3: Configure Backend Servers

For demonstration purposes, let’s assume you have two backend services:

1. **Backend 1**: A web application running on `http://127.0.0.1:8080`
2. **Backend 2**: Another service running on `http://127.0.0.1:8081`

Ensure these services are running. You can use simple HTTP servers like Python’s built-in HTTP server for testing:

```bash
# Start a simple server on port 8080
python3 -m http.server 8080

# Start another server on port 8081
python3 -m http.server 8081
```

---

### Step 4: Create a Reverse Proxy Configuration

1. **Edit the Nginx configuration file**:

   Create a new configuration file in `/etc/nginx/conf.d/`. For example:

   ```bash
   sudo nano /etc/nginx/conf.d/reverse-proxy.conf
   ```

2. **Add the reverse proxy configuration**:

   Here’s an example configuration to proxy traffic for two backend services:

   ```nginx
   server {
       listen 80;
       server_name your-domain.com;

       location /app1/ {
           proxy_pass http://127.0.0.1:8080/;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }

       location /app2/ {
           proxy_pass http://127.0.0.1:8081/;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
   }
   ```

   - **`proxy_pass`**: Specifies the backend server for the location.
   - **`proxy_set_header`**: Passes client information (e.g., IP address) to the backend server.

3. **Save and exit** the file.

---

### Step 5: Test and Reload Nginx Configuration

1. Test the configuration for syntax errors:

   ```bash
   sudo nginx -t
   ```

2. Reload Nginx to apply the changes:

   ```bash
   sudo systemctl reload nginx
   ```

---

### Step 6: Test the Reverse Proxy

Open a browser and test the setup:

- **`http://your-domain.com/app1/`** should proxy to the service running on port `8080`.
- **`http://your-domain.com/app2/`** should proxy to the service running on port `8081`.

---

## Enhancing the Reverse Proxy Setup

### 1. Add SSL/TLS with Let’s Encrypt

Securing your reverse proxy with SSL/TLS is crucial for protecting client data. Use Certbot to obtain and configure an SSL certificate:

1. Install Certbot:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. Obtain an SSL certificate for your domain:

   ```bash
   sudo certbot --nginx -d your-domain.com
   ```

Certbot will automatically configure SSL for your reverse proxy. Test it by accessing:

```html
https://your-domain.com/app1/
https://your-domain.com/app2/
```

---

### 2. Load Balancing Backend Servers

If you have multiple instances of a backend service, Nginx can distribute traffic across them. Modify the `proxy_pass` directive to include an upstream block:

1. Define an upstream group in the Nginx configuration:

   ```nginx
   upstream app1_backend {
       server 127.0.0.1:8080;
       server 127.0.0.1:8082; # Additional instance
   }
   ```

2. Update the `proxy_pass` directive to use the upstream group:

   ```nginx
   location /app1/ {
       proxy_pass http://app1_backend/;
       proxy_set_header Host $host;
       proxy_set_header X-Real-IP $remote_addr;
       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header X-Forwarded-Proto $scheme;
   }
   ```

---

### 3. Enable Caching for Static Content

To improve performance, enable caching for static content like images, CSS, and JavaScript files:

```nginx
location ~* \.(jpg|jpeg|png|gif|ico|css|js|woff2|ttf|otf|eot|svg)$ {
    expires max;
    log_not_found off;
    add_header Cache-Control "public";
}
```

---

### 4. Restrict Access to Backend Servers

To prevent direct access to your backend servers, use firewall rules to restrict access. For example, allow only Nginx to access the backend ports:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="127.0.0.1" port port="8080" protocol="tcp" accept' --permanent
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="127.0.0.1" port port="8081" protocol="tcp" accept' --permanent
sudo firewall-cmd --reload
```

---

## Troubleshooting

### 1. 502 Bad Gateway Error

- Ensure the backend service is running.
- Verify the `proxy_pass` URL is correct.
- Check the Nginx error log for details:

  ```bash
  sudo tail -f /var/log/nginx/error.log
  ```

### 2. Configuration Fails to Reload

- Test the configuration for syntax errors:

  ```bash
  sudo nginx -t
  ```

- Correct any issues before reloading.

### 3. SSL Not Working

- Ensure Certbot successfully obtained a certificate.
- Check the Nginx error log for SSL-related issues.

---

## Conclusion

Using Nginx as a reverse proxy on AlmaLinux is a powerful way to manage and optimize traffic between clients and backend servers. By following this guide, you’ve set up a robust reverse proxy configuration, with the flexibility to scale, secure, and enhance your web applications. Whether for load balancing, caching, or improving security, Nginx provides a reliable foundation for modern server management.
