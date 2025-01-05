---
title: How to Set Up Nginx Load Balancing on AlmaLinux
linkTitle: Set Up Nginx Load Balancing
description: In this guide, we’ll walk you through how to set up and configure load balancing with Nginx on AlmaLinux.
date: 2024-12-18
weight: 1040
url: set-nginx-load-balancing-almalinux
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
As modern web applications grow in complexity and user base, ensuring high availability and scalability becomes crucial. Load balancing is a technique that distributes incoming traffic across multiple servers to prevent overloading a single machine, ensuring better performance and reliability. Nginx, known for its high performance and flexibility, offers robust load-balancing features, making it an excellent choice for managing traffic for web applications.

In this guide, we’ll walk you through how to set up and configure load balancing with Nginx on AlmaLinux. By the end, you’ll have a scalable and efficient solution for handling increased traffic to your web services.

---

## What is Load Balancing?

Load balancing is the process of distributing incoming requests across multiple backend servers, also known as upstream servers. This prevents any single server from being overwhelmed and ensures that traffic is handled efficiently.

### Benefits of Load Balancing

1. **Improved Performance**: Distributes traffic across servers to reduce response times.
2. **High Availability**: If one server fails, traffic is redirected to other available servers.
3. **Scalability**: Add or remove servers as needed without downtime.
4. **Fault Tolerance**: Ensures the application remains operational even if individual servers fail.

---

## Prerequisites

Before starting, ensure you have:

1. **AlmaLinux server** with sudo/root privileges.
2. **Nginx installed and running**.
3. Two or more backend servers or services to distribute traffic.
4. Basic knowledge of Linux command-line operations.

---

## Step-by-Step Guide to Setting Up Nginx Load Balancing

### Step 1: Update Your AlmaLinux System

Ensure your AlmaLinux server is up-to-date with the latest packages and security patches:

```bash
sudo dnf update -y
```

---

### Step 2: Install Nginx

If Nginx is not already installed, you can install it using:

```bash
sudo dnf install nginx -y
```

Enable and start Nginx:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

Verify Nginx is running by visiting your server's IP address in a web browser. The default Nginx welcome page should appear.

---

### Step 3: Set Up Backend Servers

To demonstrate load balancing, we’ll use two simple backend servers. These servers can run on different ports of the same machine or on separate machines.

For testing, you can use Python's built-in HTTP server:

```bash
# Start a test server on port 8080
python3 -m http.server 8080

# Start another test server on port 8081
python3 -m http.server 8081
```

Ensure these backend servers are running and accessible. You can check by visiting:

```html
http://<your-server-ip>:8080
http://<your-server-ip>:8081
```

---

### Step 4: Configure Nginx for Load Balancing

1. **Create an Upstream Block**: The upstream block defines the backend servers that will handle incoming traffic.

   Open a new configuration file:

   ```bash
   sudo nano /etc/nginx/conf.d/load_balancer.conf
   ```

   Add the following:

   ```nginx
   upstream backend_servers {
       server 127.0.0.1:8080;
       server 127.0.0.1:8081;
   }

   server {
       listen 80;
       server_name your-domain.com;

       location / {
           proxy_pass http://backend_servers;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
   }
   ```

   - **`upstream` block**: Lists the backend servers.
   - **`proxy_pass`**: Forwards requests to the upstream block.
   - **`proxy_set_header`**: Passes client information to the backend servers.

2. **Save and exit** the file.

---

### Step 5: Test and Reload Nginx

1. Check the configuration for syntax errors:

   ```bash
   sudo nginx -t
   ```

2. Reload Nginx to apply the changes:

   ```bash
   sudo systemctl reload nginx
   ```

---

### Step 6: Test Load Balancing

Visit your domain or server IP in a browser:

```html
http://your-domain.com
```

Refresh the page multiple times. You should see responses from both backend servers alternately.

---

## Load Balancing Methods in Nginx

Nginx supports several load-balancing methods:

### 1. **Round Robin (Default)**

The default method, where requests are distributed sequentially to each server.

```nginx
upstream backend_servers {
    server 127.0.0.1:8080;
    server 127.0.0.1:8081;
}
```

### 2. **Least Connections**

Directs traffic to the server with the fewest active connections. Ideal for servers with varying response times.

```nginx
upstream backend_servers {
    least_conn;
    server 127.0.0.1:8080;
    server 127.0.0.1:8081;
}
```

### 3. **IP Hash**

Routes requests from the same client IP to the same backend server. Useful for session persistence.

```nginx
upstream backend_servers {
    ip_hash;
    server 127.0.0.1:8080;
    server 127.0.0.1:8081;
}
```

---

## Advanced Configuration Options

### 1. Configure Health Checks

To automatically remove unhealthy servers from the rotation, you can use third-party Nginx modules or advanced configurations.

Example with **`max_fails`** and **`fail_timeout`**:

```nginx
upstream backend_servers {
    server 127.0.0.1:8080 max_fails=3 fail_timeout=30s;
    server 127.0.0.1:8081 max_fails=3 fail_timeout=30s;
}
```

### 2. Enable SSL/TLS for Secure Traffic

Secure your load balancer by configuring HTTPS with Let’s Encrypt.

1. Install Certbot:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. Obtain and configure an SSL certificate:

   ```bash
   sudo certbot --nginx -d your-domain.com
   ```

---

### 3. Caching Responses

To improve performance, you can enable caching for responses from backend servers:

```nginx
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=cache_zone:10m inactive=60m;
proxy_cache_key "$scheme$request_method$host$request_uri";

server {
    location / {
        proxy_cache cache_zone;
        proxy_pass http://backend_servers;
        proxy_set_header Host $host;
    }
}
```

---

## Troubleshooting

### 1. **502 Bad Gateway Error**

- Verify that backend servers are running and accessible.
- Check the `proxy_pass` URL in the configuration.
- Review the Nginx error log:

  ```bash
  sudo tail -f /var/log/nginx/error.log
  ```

### 2. **Nginx Fails to Start or Reload**

- Test the configuration for syntax errors:

  ```bash
  sudo nginx -t
  ```

- Check logs for details:

  ```bash
  sudo journalctl -xe
  ```

### 3. **Backend Servers Not Rotating**

- Ensure the backend servers are listed correctly in the `upstream` block.
- Test different load-balancing methods.

---

## Conclusion

Setting up load balancing with Nginx on AlmaLinux provides a scalable and efficient solution for handling increased traffic to your web applications. With features like round-robin distribution, least connections, and IP hashing, Nginx allows you to customize traffic management based on your application needs.

By following this guide, you’ve configured a robust load balancer, complete with options for secure connections and advanced optimizations. Whether you're managing a small application or a high-traffic website, Nginx’s load-balancing capabilities are a reliable foundation for ensuring performance and availability.
