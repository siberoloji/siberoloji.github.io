---
title: "HAProxy: How to Configure HTTP Load Balancing Server on AlmaLinux"
linkTitle: HTTP Load Balancing Server
description: In this detailed guide, you’ll learn how to configure an HTTP load-balancing server using HAProxy on AlmaLinux, ensuring your web applications run efficiently and reliably.
date: 2024-12-28
weight: 1390
url: haproxy-configure-http-load-balancing-server-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: haproxy-configure-http-load-balancing-server-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
---
As web applications scale, ensuring consistent performance, reliability, and availability becomes a challenge. **HAProxy** (High Availability Proxy) is a powerful and widely-used open-source solution for **HTTP load balancing** and **proxying**. By distributing incoming traffic across multiple backend servers, HAProxy improves fault tolerance and optimizes resource utilization.

In this detailed guide, you’ll learn how to configure an HTTP load-balancing server using **HAProxy** on **AlmaLinux**, ensuring your web applications run efficiently and reliably.

---

## **What is HAProxy?**

HAProxy is a high-performance, open-source load balancer and reverse proxy server designed to distribute traffic efficiently across multiple servers. It’s known for its reliability, extensive protocol support, and ability to handle large volumes of traffic.

### **Key Features of HAProxy**

- **Load Balancing**: Distributes traffic across multiple backend servers.
- **High Availability**: Automatically reroutes traffic from failed servers.
- **Scalability**: Manages large-scale traffic for enterprise-grade applications.
- **Health Checks**: Monitors the status of backend servers.
- **SSL Termination**: Handles SSL encryption and decryption to offload backend servers.
- **Logging**: Provides detailed logs for monitoring and debugging.

---

## **Why Use HAProxy for HTTP Load Balancing?**

HTTP load balancing ensures:

1. **Optimized Resource Utilization**: Distributes traffic evenly among servers.
2. **High Availability**: Redirects traffic from failed servers to healthy ones.
3. **Improved Performance**: Reduces latency and bottlenecks.
4. **Fault Tolerance**: Keeps services running even during server failures.
5. **Scalable Architecture**: Accommodates increasing traffic demands by adding more servers.

---

## **Prerequisites**

Before starting, ensure:

1. **AlmaLinux** is installed and updated.
2. You have root or sudo access to the server.
3. Multiple web servers (backend servers) are available for load balancing.
4. Basic knowledge of Linux commands and networking.

---

## **Step 1: Install HAProxy on AlmaLinux**

### **Update System Packages**

Ensure your system is up to date:

```bash
sudo dnf update -y
```

### **Install HAProxy**

Install HAProxy using the `dnf` package manager:

```bash
sudo dnf install haproxy -y
```

### **Verify Installation**

Check the HAProxy version to confirm installation:

```bash
haproxy -v
```

---

## **Step 2: Understand HAProxy Configuration**

The primary configuration file for HAProxy is located at:

```bash
/etc/haproxy/haproxy.cfg
```

This file contains sections that define:

- **Global Settings**: General HAProxy configurations like logging and tuning.
- **Defaults**: Default settings for all proxies.
- **Frontend**: Handles incoming traffic from clients.
- **Backend**: Defines the pool of servers to distribute traffic.
- **Listen**: Combines frontend and backend configurations.

---

## **Step 3: Configure HAProxy for HTTP Load Balancing**

### **3.1 Backup the Default Configuration**

Before making changes, back up the default configuration:

```bash
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
```

### **3.2 Edit the Configuration File**

Open the configuration file for editing:

```bash
sudo nano /etc/haproxy/haproxy.cfg
```

#### **Global Settings**

Update the `global` section to define general parameters:

```text
global
    log /dev/log    local0
    log /dev/log    local1 notice
    chroot /var/lib/haproxy
    stats timeout 30s
    user haproxy
    group haproxy
    daemon
    maxconn 2000
```

- `log`: Configures logging.
- `chroot`: Sets the working directory for HAProxy.
- `maxconn`: Defines the maximum number of concurrent connections.

#### **Default Settings**

Modify the `defaults` section to set basic options:

```text
defaults
    log     global
    option  httplog
    option  dontlognull
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http
```

- `timeout connect`: Timeout for establishing a connection to the backend.
- `timeout client`: Timeout for client inactivity.
- `timeout server`: Timeout for server inactivity.

#### **Frontend Configuration**

Define how HAProxy handles incoming client requests:

```text
frontend http_front
    bind *:80
    mode http
    default_backend web_servers
```

- `bind *:80`: Listens for HTTP traffic on port 80.
- `default_backend`: Specifies the backend pool of servers.

#### **Backend Configuration**

Define the pool of backend servers for load balancing:

```text
backend web_servers
    mode http
    balance roundrobin
    option httpchk GET /
    server server1 192.168.1.101:80 check
    server server2 192.168.1.102:80 check
    server server3 192.168.1.103:80 check
```

- `balance roundrobin`: Distributes traffic evenly across servers.
- `option httpchk`: Sends health-check requests to backend servers.
- `server`: Defines each backend server with its IP, port, and health-check status.

---

## **Step 4: Test and Apply the Configuration**

### **4.1 Validate Configuration Syntax**

Check for syntax errors in the configuration file:

```bash
sudo haproxy -c -f /etc/haproxy/haproxy.cfg
```

### **4.2 Restart HAProxy**

Apply the configuration changes by restarting HAProxy:

```bash
sudo systemctl restart haproxy
```

### **4.3 Enable HAProxy at Boot**

Ensure HAProxy starts automatically during system boot:

```bash
sudo systemctl enable haproxy
```

---

## **Step 5: Monitor HAProxy**

### **5.1 Enable HAProxy Statistics**

To monitor traffic and server status, enable the HAProxy statistics dashboard. Add the following section to the configuration file:

```text
listen stats
    bind *:8080
    stats enable
    stats uri /haproxy?stats
    stats auth admin:password
```

- `bind *:8080`: Access the stats page on port 8080.
- `stats uri`: URL path for the dashboard.
- `stats auth`: Username and password for authentication.

Restart HAProxy and access the dashboard:

```bash
http://<haproxy-server-ip>:8080/haproxy?stats
```

### **5.2 Monitor Logs**

Check HAProxy logs for detailed information:

```bash
sudo tail -f /var/log/haproxy.log
```

---

## **Step 6: Advanced Configurations**

### **6.1 SSL Termination**

To enable HTTPS traffic, HAProxy can handle SSL termination. Install an SSL certificate and update the frontend configuration:

```text
frontend https_front
    bind *:443 ssl crt /etc/haproxy/certs/example.com.pem
    mode http
    default_backend web_servers
```

### **6.2 Load Balancing Algorithms**

Customize traffic distribution by choosing a load-balancing algorithm:

- **roundrobin**: Default method, distributes requests evenly.
- **leastconn**: Sends requests to the server with the fewest active connections.
- **source**: Routes traffic based on the client’s IP address.

For example:

```text
balance leastconn
```

### **6.3 Error Pages**

Customize error pages by creating custom HTTP files and referencing them in the `defaults` section:

```text
errorfile 503 /etc/haproxy/errors/custom_503.http
```

---

## **Step 7: Troubleshooting**

### **Check HAProxy Status**

Verify the service status:

```bash
sudo systemctl status haproxy
```

### **Debug Configuration**

Run HAProxy in debugging mode:

```bash
sudo haproxy -d -f /etc/haproxy/haproxy.cfg
```

### **Verify Backend Health**

Check the health of backend servers:

```bash
curl -I http://<haproxy-server-ip>
```

---

## **Conclusion**

Configuring HAProxy as an HTTP load balancer on AlmaLinux is a vital step in building a scalable and reliable infrastructure. By distributing traffic efficiently, HAProxy ensures high availability and improved performance for your web applications. With its extensive features like health checks, SSL termination, and monitoring, HAProxy is a versatile solution for businesses of all sizes.

By following this guide, you’ve set up HAProxy, tested its functionality, and explored advanced configurations to optimize your system further. Whether for small projects or large-scale deployments, HAProxy is an essential tool in modern networking.
