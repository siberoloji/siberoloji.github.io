---
title: How to Configure Squid as a Reverse Proxy Server on AlmaLinux
linkTitle: Configure Squid as a Reverse Proxy Server
description: In this guide, we’ll walk you through the steps to configure Squid as a reverse proxy server on AlmaLinux.
date: 2024-12-28
weight: 1380
url: configure-squid-reverse-proxy-server-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: configure-squid-reverse-proxy-server-almalinux
keywords:
  - AlmaLinux
  - Squid

featured_image: /images/almalinux.webp
---
A **reverse proxy server** acts as an intermediary between clients and backend servers, offering benefits like load balancing, caching, and enhanced security. One of the most reliable tools for setting up a reverse proxy is **Squid**, an open-source, high-performance caching proxy server. Squid is typically used as a forward proxy, but it can also be configured as a reverse proxy to optimize backend server performance and improve the user experience.

In this guide, we’ll walk you through the steps to configure **Squid as a reverse proxy server** on **AlmaLinux**.

---

## **What is a Reverse Proxy Server?**

A reverse proxy server intercepts client requests, forwards them to backend servers, and relays responses back to the clients. Unlike a forward proxy that works on behalf of clients, a reverse proxy represents servers.

### **Key Benefits of a Reverse Proxy**

1. **Load Balancing:** Distributes incoming requests across multiple servers.
2. **Caching:** Reduces server load by serving cached content to clients.
3. **Security:** Hides the identity and details of backend servers.
4. **SSL Termination:** Offloads SSL encryption and decryption tasks.
5. **Improved Performance:** Compresses and optimizes responses for faster delivery.

---

## **Prerequisites**

Before configuring Squid as a reverse proxy, ensure the following:

1. **AlmaLinux** is installed and updated.
2. **Squid** is installed on the server.
3. Root or sudo access to the server.
4. Basic understanding of Squid configuration files.

---

## **Step 1: Install Squid on AlmaLinux**

### **Update the System**

Ensure all packages are up to date:

```bash
sudo dnf update -y
```

### **Install Squid**

Install Squid using the `dnf` package manager:

```bash
sudo dnf install squid -y
```

### **Start and Enable Squid**

Start the Squid service and enable it to start at boot:

```bash
sudo systemctl start squid
sudo systemctl enable squid
```

### **Verify Installation**

Check if Squid is running:

```bash
sudo systemctl status squid
```

---

## **Step 2: Understand the Squid Configuration File**

The primary configuration file for Squid is located at:

```bash
/etc/squid/squid.conf
```

This file controls all aspects of Squid’s behavior, including caching, access control, and reverse proxy settings.

Before making changes, create a backup of the original configuration file:

```bash
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
```

---

## **Step 3: Configure Squid as a Reverse Proxy**

### **3.1 Basic Reverse Proxy Setup**

Edit the Squid configuration file:

```bash
sudo nano /etc/squid/squid.conf
```

Add the following configuration to define Squid as a reverse proxy:

```text
# Define HTTP port for reverse proxy
http_port 80 accel vhost allow-direct

# Cache peer (backend server) settings
cache_peer backend_server_ip parent 80 0 no-query originserver name=backend

# Map requests to the backend server
acl sites_to_reverse_proxy dstdomain example.com
http_access allow sites_to_reverse_proxy
cache_peer_access backend allow sites_to_reverse_proxy
cache_peer_access backend deny all

# Deny all other traffic
http_access deny all
```

**Explanation of Key Directives:**

- **http_port 80 accel vhost allow-direct:** Configures Squid to operate as a reverse proxy on port 80.
- **cache_peer:** Specifies the backend server’s IP address and port. The `originserver` flag ensures Squid treats it as the origin server.
- **acl sites_to_reverse_proxy:** Defines an access control list (ACL) for the domain being proxied.
- **cache_peer_access:** Associates client requests to the appropriate backend server.
- **http_access deny all:** Denies any requests that don’t match the ACL.

Replace `backend_server_ip` with the IP address of your backend server and `example.com` with your domain name.

---

### **3.2 Configure DNS Settings**

Ensure Squid resolves your domain name correctly. Add the backend server’s IP address to your **/etc/hosts** file for local DNS resolution:

```bash
sudo nano /etc/hosts
```

Add the following line:

```text
backend_server_ip example.com
```

Replace `backend_server_ip` with the backend server’s IP address and `example.com` with your domain name.

---

### **3.3 Enable SSL (Optional)**

If your reverse proxy needs to handle HTTPS traffic, you’ll need to configure SSL.

#### **Step 3.3.1: Install SSL Certificates**

Obtain an SSL certificate for your domain from a trusted certificate authority or generate a self-signed certificate.

Place the certificate and private key files in a secure directory, e.g., `/etc/squid/ssl/`.

#### **Step 3.3.2: Configure Squid for HTTPS**

Edit the Squid configuration file to add SSL support:

```bash
https_port 443 accel cert=/etc/squid/ssl/example.com.crt key=/etc/squid/ssl/example.com.key vhost
cache_peer backend_server_ip parent 443 0 no-query originserver ssl name=backend
```

- Replace `example.com.crt` and `example.com.key` with your SSL certificate and private key files.
- Add `ssl` to the `cache_peer` directive to enable encrypted connections to the backend.

---

### **3.4 Configure Caching**

Squid can cache static content like images, CSS, and JavaScript files to improve performance.

Add caching settings to **squid.conf**:

```text
# Enable caching
cache_mem 256 MB
maximum_object_size_in_memory 1 MB
cache_dir ufs /var/spool/squid 1000 16 256
maximum_object_size 10 MB
minimum_object_size 0 KB

# Refresh patterns for caching
refresh_pattern ^ftp:       1440    20%     10080
refresh_pattern ^gopher:    1440    0%      1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern .           0       20%     4320
```

- `cache_mem`: Allocates memory for caching.
- `cache_dir`: Configures the storage directory and size for disk caching.

---

## **Step 4: Apply and Test the Configuration**

### **Restart Squid**

After making changes, restart Squid to apply the new configuration:

```bash
sudo systemctl restart squid
```

### **Check Logs**

Monitor Squid logs to verify requests are being handled correctly:

- Access log:

  ```bash
  sudo tail -f /var/log/squid/access.log
  ```

- Cache log:

  ```bash
  sudo tail -f /var/log/squid/cache.log
  ```

### **Test the Reverse Proxy**

1. Open a browser and navigate to your domain (e.g., `http://example.com`).
2. Ensure the request is routed through Squid and served by the backend server.

Use tools like `curl` to test from the command line:

```bash
curl -I http://example.com
```

---

## **Step 5: Optimize and Secure Squid**

### **5.1 Harden Access Control**

Limit access to trusted IP ranges by adding ACLs:

```text
acl allowed_ips src 192.168.1.0/24
http_access allow allowed_ips
http_access deny all
```

### **5.2 Configure Load Balancing**

If you have multiple backend servers, configure Squid for load balancing:

```text
cache_peer backend_server1_ip parent 80 0 no-query originserver round-robin
cache_peer backend_server2_ip parent 80 0 no-query originserver round-robin
```

The `round-robin` option distributes requests evenly among backend servers.

### **5.3 Enable Logging and Monitoring**

Install tools like **sarg** or **squid-analyzer** for detailed traffic reports:

```bash
sudo dnf install squid-analyzer -y
```

---

## **Conclusion**

Configuring Squid as a reverse proxy server on AlmaLinux is a straightforward process that can greatly enhance your network's performance and security. With features like caching, SSL termination, and load balancing, Squid helps optimize backend resources and deliver a seamless experience to users.

By following this guide, you’ve set up a functional reverse proxy and learned how to secure and fine-tune it for optimal performance. Whether for a small application or a large-scale deployment, Squid’s versatility makes it an invaluable tool for modern network infrastructure.
