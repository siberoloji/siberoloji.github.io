---
title: 
linkTitle: 
description: 
date: 
weight: 1450
slug: 
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: 
next: 
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
### HAProxy: How to Configure ACL Settings for Layer 4 on AlmaLinux  

**Introduction**  
HAProxy (High Availability Proxy) is a versatile and powerful tool for load balancing and proxying. While it excels at Layer 7 (application layer) tasks, HAProxy's Layer 4 (transport layer) capabilities are just as important for handling high-speed and protocol-agnostic traffic. Layer 4 Access Control Lists (ACLs) enable administrators to define routing rules and access policies based on IP addresses, ports, and other low-level network properties.  

This article provides a comprehensive guide to configuring ACL settings for Layer 4 (L4) load balancing in HAProxy on AlmaLinux. We’ll cover installation, configuration, common use cases, and best practices to help you secure and optimize your network traffic.  

---

### Section 1: **Understanding Layer 4 ACLs in HAProxy**  

#### What are Layer 4 ACLs?  

Layer 4 ACLs operate at the transport layer of the OSI model, enabling administrators to control traffic based on:  

- **Source IP Address:** Route or block traffic originating from specific IPs.  
- **Destination Port:** Restrict or allow access to specific application ports.  
- **Protocol Type (TCP/UDP):** Define behavior based on the type of transport protocol used.  

Unlike Layer 7 ACLs, Layer 4 ACLs do not inspect packet content, making them faster and more suitable for scenarios where high throughput is required.  

#### Benefits of Layer 4 ACLs  

- **Low Latency:** Process rules without inspecting packet payloads.  
- **Enhanced Security:** Block unwanted traffic at the transport layer.  
- **Protocol Independence:** Handle traffic for any TCP/UDP-based application.  

---

### Section 2: **Installing HAProxy on AlmaLinux**  

#### Step 1: Update the System  

Keep your system up-to-date to avoid compatibility issues:  

```bash
sudo dnf update -y
```  

#### Step 2: Install HAProxy  

Install HAProxy from AlmaLinux’s repositories:  

```bash
sudo dnf install haproxy -y
```  

#### Step 3: Enable and Verify Service  

Enable HAProxy to start on boot and check its status:  

```bash
sudo systemctl start haproxy
sudo systemctl enable haproxy
sudo systemctl status haproxy
```  

---

### Section 3: **Configuring Layer 4 ACLs in HAProxy**  

#### Step 1: Locate the Configuration File  

The main configuration file for HAProxy is located at:  

```bash
/etc/haproxy/haproxy.cfg
```  

Before proceeding, make a backup of the file:  

```bash
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
```  

#### Step 2: Define Layer 4 ACLs  

Layer 4 ACLs are typically defined in the **frontend** section. Below is an example of a basic configuration:  

```plaintext
frontend l4_frontend
    bind *:443
    mode tcp
    acl block_ip src 192.168.1.100
    acl allow_subnet src 192.168.1.0/24
    tcp-request connection reject if block_ip
    use_backend l4_backend if allow_subnet
```  

**Explanation:**  

- **`mode tcp`**: Enables Layer 4 processing.  
- **`acl block_ip`**: Defines a rule to block traffic from a specific IP address.  
- **`acl allow_subnet`**: Allows traffic from a specific subnet.  
- **`tcp-request connection reject`**: Drops connections matching the `block_ip` ACL.  
- **`use_backend`**: Routes allowed traffic to the specified backend.  

#### Step 3: Configure the Backend  

Define the backend servers for traffic routing:  

```plaintext
backend l4_backend
    mode tcp
    balance roundrobin
    server srv1 192.168.1.101:443 check
    server srv2 192.168.1.102:443 check
```  

---

### Section 4: **Common Use Cases for Layer 4 ACLs**  

#### 1. Blocking Traffic from Malicious IPs  

To block traffic from known malicious IPs:  

```plaintext
frontend l4_frontend
    bind *:80
    mode tcp
    acl malicious_ips src 203.0.113.50 203.0.113.51
    tcp-request connection reject if malicious_ips
```  

#### 2. Allowing Access from Specific Subnets  

To restrict access to a trusted subnet:  

```plaintext
frontend l4_frontend
    bind *:22
    mode tcp
    acl trusted_subnet src 192.168.2.0/24
    tcp-request connection reject if !trusted_subnet
```  

#### 3. Differentiating Traffic by Ports  

To route traffic based on the destination port:  

```plaintext
frontend l4_frontend
    bind *:8080-8090
    mode tcp
    acl port_8080 dst_port 8080
    acl port_8090 dst_port 8090
    use_backend backend_8080 if port_8080
    use_backend backend_8090 if port_8090
```  

#### 4. Enforcing Traffic Throttling  

To limit the rate of new connections:  

```plaintext
frontend l4_frontend
    bind *:443
    mode tcp
    stick-table type ip size 1m expire 10s store conn_rate(10s)
    acl too_many_connections src_conn_rate(10s) gt 100
    tcp-request connection reject if too_many_connections
```  

---

### Section 5: **Testing and Validating Configuration**  

#### Step 1: Validate Configuration File  

Check for syntax errors before applying changes:  

```bash
sudo haproxy -c -f /etc/haproxy/haproxy.cfg
```  

#### Step 2: Restart HAProxy  

Apply your changes by restarting the service:  

```bash
sudo systemctl restart haproxy
```  

#### Step 3: Test ACL Behavior  

Simulate traffic using `curl` or custom tools to test ACL rules:  

```bash
curl -v http://<haproxy-ip>:80
```  

#### Step 4: Monitor Logs  

Enable HAProxy logging to verify how traffic is processed:  

```plaintext
global
    log /dev/log local0
    log /dev/log local1 notice

defaults
    log global
```  

Monitor logs for ACL matches:  

```bash
sudo tail -f /var/log/haproxy.log
```  

---

### Section 6: **Optimizing ACL Performance**  

#### 1. Use Efficient ACL Rules  

- Use IP-based rules (e.g., `src`) for faster processing.  
- Avoid complex regex patterns unless absolutely necessary.  

#### 2. Consolidate Rules  

Combine similar rules to reduce redundancy and simplify configuration.  

#### 3. Tune Timeout Settings  

Optimize timeout settings for faster rejection of unwanted connections:  

```plaintext
defaults
    timeout connect 5s
    timeout client 50s
    timeout server 50s
```  

#### 4. Monitor System Performance  

Use tools like `top` or `htop` to ensure HAProxy’s CPU and memory usage remain optimal.  

---

### Section 7: **Troubleshooting Common Issues**  

#### ACL Not Matching as Expected  

- Double-check the syntax and ensure ACLs are defined within the appropriate scope.  
- Use the `haproxy -c` command to identify misconfigurations.  

#### Unintended Traffic Blocking  

- Review the sequence of ACL rules—HAProxy processes them in order.  
- Check for overlapping or conflicting ACLs.  

#### High Latency  

- Optimize rules by avoiding overly complex checks.  
- Verify network and server performance to rule out bottlenecks.  

---

**Conclusion**  
Configuring Layer 4 ACL settings in HAProxy on AlmaLinux provides robust control over your network traffic. By defining rules based on IP addresses, ports, and connection rates, you can secure your infrastructure, optimize performance, and enhance reliability.  

With this guide, you now have the tools to implement, test, and optimize L4 ACL configurations effectively. Remember to regularly review and update your rules to adapt to changing traffic patterns and security needs.  

---

**Meta Title:** Configuring Layer 4 ACL Settings in HAProxy on AlmaLinux  
**Meta Description:** Learn how to configure Layer 4 ACL settings in HAProxy on AlmaLinux. A step-by-step guide covering installation, configuration, testing, and optimization for secure and efficient traffic management.
