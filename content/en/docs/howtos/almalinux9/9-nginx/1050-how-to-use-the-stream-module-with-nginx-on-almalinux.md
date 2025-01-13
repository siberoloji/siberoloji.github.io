---
title: How to Use the Stream Module with Nginx on AlmaLinux
linkTitle: Stream Module with Nginx
description: In this guide, we’ll explore how to enable and configure the Stream module with Nginx on AlmaLinux.
date: 2024-12-18
weight: 1050
url: stream-module-nginx-almalinux
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
Nginx is widely known as a high-performance HTTP and reverse proxy server. However, its capabilities extend beyond just HTTP; it also supports other network protocols such as TCP and UDP. The **Stream module** in Nginx is specifically designed to handle these non-HTTP protocols, allowing Nginx to act as a load balancer or proxy for applications like databases, mail servers, game servers, or custom network applications.

In this guide, we’ll explore how to enable and configure the Stream module with Nginx on AlmaLinux. By the end of this guide, you’ll know how to proxy and load balance TCP/UDP traffic effectively using Nginx.

---

## What is the Stream Module?

The Stream module is a core Nginx module that enables handling of TCP and UDP traffic. It supports:

1. **Proxying**: Forwarding TCP/UDP requests to a backend server.
2. **Load Balancing**: Distributing traffic across multiple backend servers.
3. **SSL/TLS Termination**: Offloading encryption/decryption for secure traffic.
4. **Traffic Filtering**: Filtering traffic by IP or rate-limiting connections.

Common use cases include:

- Proxying database connections (e.g., MySQL, PostgreSQL).
- Load balancing game servers.
- Proxying mail servers (e.g., SMTP, IMAP, POP3).
- Managing custom TCP/UDP applications.

---

## Prerequisites

1. **AlmaLinux server** with sudo privileges.
2. **Nginx installed** (compiled with the Stream module).
3. At least one TCP/UDP service to proxy (e.g., a database, game server, or custom application).

---

## Step-by-Step Guide to Using the Stream Module

### Step 1: Update the System

Begin by ensuring your AlmaLinux system is up-to-date:

```bash
sudo dnf update -y
```

---

### Step 2: Check for Stream Module Support

The Stream module is typically included in the default Nginx installation on AlmaLinux. To verify:

1. Check the available Nginx modules:

   ```bash
   nginx -V
   ```

2. Look for `--with-stream` in the output. If it’s present, the Stream module is already included. If not, you’ll need to install or build Nginx with Stream support (covered in **Appendix**).

---

### Step 3: Enable the Stream Module

By default, the Stream module configuration is separate from the HTTP configuration. You need to enable and configure it.

1. **Create the Stream configuration directory**:

   ```bash
   sudo mkdir -p /etc/nginx/stream.d
   ```

2. **Edit the main Nginx configuration file**:

   Open `/etc/nginx/nginx.conf`:

   ```bash
   sudo nano /etc/nginx/nginx.conf
   ```

   Add the following within the main configuration block:

   ```nginx
   stream {
       include /etc/nginx/stream.d/*.conf;
   }
   ```

   This directive tells Nginx to include all Stream-related configurations from `/etc/nginx/stream.d/`.

---

### Step 4: Configure TCP/UDP Proxying

Create a new configuration file for your Stream module setup. For example:

```bash
sudo nano /etc/nginx/stream.d/tcp_proxy.conf
```

#### Example 1: Simple TCP Proxy

This configuration proxies incoming TCP traffic on port 3306 to a MySQL backend server:

```nginx
server {
    listen 3306;
    proxy_pass 192.168.1.10:3306;
}
```

- **`listen`**: Specifies the port Nginx listens on for incoming TCP connections.
- **`proxy_pass`**: Defines the backend server address and port.

#### Example 2: Simple UDP Proxy

For a UDP-based application (e.g., DNS server):

```nginx
server {
    listen 53 udp;
    proxy_pass 192.168.1.20:53;
}
```

- The `udp` flag tells Nginx to handle UDP traffic.

Save and close the file after adding the configuration.

---

### Step 5: Test and Reload Nginx

1. Test the Nginx configuration:

   ```bash
   sudo nginx -t
   ```

2. Reload Nginx to apply the changes:

   ```bash
   sudo systemctl reload nginx
   ```

---

### Step 6: Test the Proxy

- For TCP, use a tool like **telnet** or a database client to connect to the proxied service via the Nginx server.
  
  Example for MySQL:

  ```bash
  mysql -u username -h nginx-server-ip -p
  ```

- For UDP, use **dig** or a similar tool to test the connection:

  ```bash
  dig @nginx-server-ip example.com
  ```

---

## Advanced Configuration

### Load Balancing with the Stream Module

The Stream module supports load balancing across multiple backend servers. Use the `upstream` directive to define a group of backend servers.

#### Example: Load Balancing TCP Traffic

Distribute MySQL traffic across multiple servers:

```nginx
upstream mysql_cluster {
    server 192.168.1.10:3306;
    server 192.168.1.11:3306;
    server 192.168.1.12:3306;
}

server {
    listen 3306;
    proxy_pass mysql_cluster;
}
```

#### Example: Load Balancing UDP Traffic

Distribute DNS traffic across multiple servers:

```nginx
upstream dns_servers {
    server 192.168.1.20:53;
    server 192.168.1.21:53;
}

server {
    listen 53 udp;
    proxy_pass dns_servers;
}
```

### Session Persistence

For TCP-based applications like databases, session persistence ensures that clients are always routed to the same backend server. Add the `hash` directive:

```nginx
upstream mysql_cluster {
    hash $remote_addr consistent;
    server 192.168.1.10:3306;
    server 192.168.1.11:3306;
}
```

- **`hash $remote_addr consistent`**: Routes traffic based on the client’s IP address.

---

### SSL/TLS Termination

To secure traffic, you can terminate SSL/TLS connections at the Nginx server:

```nginx
server {
    listen 443 ssl;
    proxy_pass 192.168.1.10:3306;

    ssl_certificate /etc/nginx/ssl/server.crt;
    ssl_certificate_key /etc/nginx/ssl/server.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
}
```

- Replace `/etc/nginx/ssl/server.crt` and `/etc/nginx/ssl/server.key` with your SSL certificate and private key paths.

---

### Traffic Filtering

To restrict traffic based on IP or apply rate limiting:

#### Example: Allow/Deny Specific IPs

```nginx
server {
    listen 3306;
    proxy_pass 192.168.1.10:3306;

    allow 192.168.1.0/24;
    deny all;
}
```

#### Example: Rate Limiting Connections

```nginx
limit_conn_zone $binary_remote_addr zone=conn_limit:10m;

server {
    listen 3306;
    proxy_pass 192.168.1.10:3306;

    limit_conn conn_limit 10;
}
```

- **`limit_conn_zone`**: Defines the shared memory zone for tracking connections.
- **`limit_conn`**: Limits connections per client.

---

## Troubleshooting

### 1. Stream Configuration Not Working

- Ensure the `stream` block is included in the main `nginx.conf` file.
- Verify the configuration with `nginx -t`.

### 2. 502 Bad Gateway Errors

- Check if the backend servers are running and accessible.
- Verify the `proxy_pass` addresses.

### 3. Nginx Fails to Reload

- Check for syntax errors using `nginx -t`.
- Review error logs at `/var/log/nginx/error.log`.

---

## Conclusion

The Nginx Stream module offers powerful features for managing TCP and UDP traffic, making it an invaluable tool for modern networked applications. Whether you need simple proxying, advanced load balancing, or secure SSL termination, the Stream module provides a flexible and performant solution.

By following this guide, you’ve learned how to enable and configure the Stream module on AlmaLinux. With advanced configurations like load balancing, session persistence, and traffic filtering, your Nginx server is ready to handle even the most demanding TCP/UDP workloads.
