---
title: "HAProxy: How to Configure SSL/TLS Settings on AlmaLinux"
linkTitle: null
description: In this guide, we will walk you through configuring SSL/TLS settings on HAProxy running on AlmaLinux.
date: 2024-12-28
weight: 1400
url: haproxy-configure-ssl-tls-settings-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
As web applications and services increasingly demand secure communication, implementing **SSL/TLS** (Secure Sockets Layer/Transport Layer Security) is essential for encrypting traffic between clients and servers. **HAProxy**, a powerful open-source load balancer and reverse proxy, offers robust support for SSL/TLS termination and passthrough, ensuring secure and efficient traffic management.

In this guide, we will walk you through configuring **SSL/TLS settings on HAProxy** running on **AlmaLinux**, covering both termination and passthrough setups, as well as advanced security settings.

---

## **What is SSL/TLS?**

SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security) are cryptographic protocols that encrypt communication between a client (e.g., a web browser) and a server. This encryption ensures:
- **Confidentiality**: Prevents eavesdropping on data.
- **Integrity**: Protects data from being tampered with.
- **Authentication**: Confirms the identity of the server and optionally the client.

---

## **Why Use SSL/TLS with HAProxy?**

Integrating SSL/TLS with HAProxy provides several benefits:
1. **SSL Termination**: Decrypts incoming traffic, reducing the computational load on backend servers.
2. **SSL Passthrough**: Allows encrypted traffic to pass directly to backend servers.
3. **Improved Security**: Ensures encrypted connections between clients and the proxy.
4. **Centralized Certificate Management**: Simplifies SSL/TLS certificate management for multiple backend servers.

---

## **Prerequisites**

Before configuring SSL/TLS in HAProxy, ensure:
1. **AlmaLinux** is installed and updated.
2. **HAProxy** is installed and running.
3. You have an **SSL certificate** and private key for your domain.
4. Basic knowledge of HAProxy configuration files.

---

## **Step 1: Install HAProxy on AlmaLinux**

If HAProxy isn’t already installed, follow these steps:

### **Update System Packages**
```bash
sudo dnf update -y
```

### **Install HAProxy**
```bash
sudo dnf install haproxy -y
```

### **Start and Enable HAProxy**
```bash
sudo systemctl start haproxy
sudo systemctl enable haproxy
```

### **Verify Installation**
```bash
haproxy -v
```

---

## **Step 2: Obtain and Prepare SSL Certificates**

### **2.1 Obtain SSL Certificates**
You can get an SSL certificate from:
- A trusted Certificate Authority (e.g., Let's Encrypt, DigiCert).
- Self-signed certificates (for testing purposes).

### **2.2 Combine Certificate and Private Key**
HAProxy requires the certificate and private key to be combined into a single `.pem` file. If your certificate and key are separate:
```bash
cat example.com.crt example.com.key > /etc/haproxy/certs/example.com.pem
```

### **2.3 Secure the Certificates**
Set appropriate permissions to protect your private key:
```bash
sudo mkdir -p /etc/haproxy/certs
sudo chmod 700 /etc/haproxy/certs
sudo chown haproxy:haproxy /etc/haproxy/certs
sudo chmod 600 /etc/haproxy/certs/example.com.pem
```

---

## **Step 3: Configure SSL Termination in HAProxy**

SSL termination decrypts incoming HTTPS traffic at HAProxy, sending unencrypted traffic to backend servers.

### **3.1 Update the Configuration File**
Edit the HAProxy configuration file:
```bash
sudo nano /etc/haproxy/haproxy.cfg
```

Add or modify the following sections:

#### **Frontend Configuration**
```text
frontend https_front
    bind *:443 ssl crt /etc/haproxy/certs/example.com.pem
    mode http
    default_backend web_servers
```

- **bind *:443 ssl crt**: Binds port 443 (HTTPS) to the SSL certificate.
- **default_backend**: Specifies the backend server pool.

#### **Backend Configuration**
```text
backend web_servers
    mode http
    balance roundrobin
    option httpchk GET /
    server server1 192.168.1.101:80 check
    server server2 192.168.1.102:80 check
```

- **balance roundrobin**: Distributes traffic evenly across servers.
- **server**: Defines backend servers by IP and port.

---

### **3.2 Restart HAProxy**
Apply the changes by restarting HAProxy:
```bash
sudo systemctl restart haproxy
```

### **3.3 Test SSL Termination**
Open a browser and navigate to your domain using HTTPS (e.g., `https://example.com`). Verify that the connection is secure.

---

## **Step 4: Configure SSL Passthrough**

In SSL passthrough mode, HAProxy does not terminate SSL traffic. Instead, it forwards encrypted traffic to the backend servers.

### **4.1 Update the Configuration File**
Edit the configuration file:
```bash
sudo nano /etc/haproxy/haproxy.cfg
```

Modify the `frontend` and `backend` sections as follows:

#### **Frontend Configuration**
```text
frontend https_passthrough
    bind *:443
    mode tcp
    default_backend web_servers
```

- **mode tcp**: Ensures that SSL traffic is passed as-is to the backend.

#### **Backend Configuration**
```text
backend web_servers
    mode tcp
    balance roundrobin
    server server1 192.168.1.101:443 check ssl verify none
    server server2 192.168.1.102:443 check ssl verify none
```

- **verify none**: Skips certificate validation (use cautiously).

---

### **4.2 Restart HAProxy**
```bash
sudo systemctl restart haproxy
```

### **4.3 Test SSL Passthrough**
Ensure that backend servers handle SSL decryption by visiting your domain over HTTPS.

---

## **Step 5: Advanced SSL/TLS Settings**

### **5.1 Enforce TLS Versions**
Restrict the use of older protocols (e.g., SSLv3, TLSv1) to improve security:
```text
frontend https_front
    bind *:443 ssl crt /etc/haproxy/certs/example.com.pem alpn h2,http/1.1 no-sslv3 no-tlsv10 no-tlsv11
```

- **no-sslv3**: Disables SSLv3.
- **no-tlsv10**: Disables TLSv1.0.

### **5.2 Configure Cipher Suites**
Define strong cipher suites to enhance encryption:
```text
bind *:443 ssl crt /etc/haproxy/certs/example.com.pem ciphers EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH no-sslv3
```

### **5.3 Enable HTTP/2**
HTTP/2 improves performance by multiplexing multiple requests over a single connection:
```text
bind *:443 ssl crt /etc/haproxy/certs/example.com.pem alpn h2,http/1.1
```

---

## **Step 6: Monitor and Test the Configuration**

### **6.1 Check Logs**
Monitor HAProxy logs to ensure proper operation:
```bash
sudo tail -f /var/log/haproxy.log
```

### **6.2 Test with Tools**
- Use **SSL Labs** to analyze your SSL configuration: [https://www.ssllabs.com/ssltest/](https://www.ssllabs.com/ssltest/).
- Verify HTTP/2 support using `curl`:
  ```bash
  curl -I --http2 https://example.com
  ```

---

## **Step 7: Troubleshooting**

### **Common Issues**
1. **Certificate Errors**: Ensure the `.pem` file contains the full certificate chain.
2. **Unreachable Backend**: Verify backend server IPs, ports, and firewall rules.
3. **Protocol Errors**: Check for unsupported TLS versions or ciphers.

---

## **Conclusion**

Configuring SSL/TLS settings in HAProxy on AlmaLinux enhances your server's security, performance, and scalability. Whether using SSL termination for efficient encryption management or passthrough for end-to-end encryption, HAProxy offers the flexibility needed to meet diverse requirements.

By following this guide, you’ve set up secure HTTPS traffic handling with advanced configurations like TLS version enforcement and HTTP/2 support. With HAProxy, you can confidently build a secure and scalable infrastructure for your web applications.
