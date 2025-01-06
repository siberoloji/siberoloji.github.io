---
title: null
linkTitle: null
description: null
date: null
weight: 1440
slug: null
draft: true
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
### HAProxy: How to Configure ACL Settings on AlmaLinux  

**Introduction**  
HAProxy (High Availability Proxy) is a powerful, open-source software widely used for load balancing and proxying. It’s a staple in enterprise environments thanks to its high performance, scalability, and flexibility. One of its most valuable features is Access Control Lists (ACLs), which allow administrators to define specific rules for processing traffic based on customizable conditions.  

In this article, we’ll guide you through the process of configuring ACL settings for HAProxy on AlmaLinux, an enterprise-grade Linux distribution. From understanding ACL basics to implementation and testing, this comprehensive guide will help you enhance control over your traffic routing.  

---

### Section 1: **What are ACLs in HAProxy?**  

#### Understanding ACLs  

Access Control Lists (ACLs) in HAProxy enable administrators to define rules for allowing, denying, or routing traffic based on specific conditions. ACLs operate by matching predefined criteria such as:  

- Source or destination IP addresses.  
- HTTP headers and paths.  
- TCP ports or payload content.  

ACLs are highly versatile and are used for tasks like:  

- Routing traffic to different backend servers based on URL patterns.  
- Blocking traffic from specific IP addresses.  
- Allowing access to certain resources only during specified times.  

#### Advantages of Using ACLs  

- **Granular Traffic Control:** Fine-tune how traffic flows within your infrastructure.  
- **Enhanced Security:** Block unauthorized access at the proxy level.  
- **Optimized Performance:** Route requests efficiently based on defined criteria.  

---

### Section 2: **Installing HAProxy on AlmaLinux**  

#### Step 1: Update the System  

Ensure your AlmaLinux system is up to date:  

```bash
sudo dnf update -y
```  

#### Step 2: Install HAProxy  

Install HAProxy using the default repository:  

```bash
sudo dnf install haproxy -y
```  

#### Step 3: Enable and Verify the Service  

Start and enable HAProxy:  

```bash
sudo systemctl start haproxy
sudo systemctl enable haproxy
sudo systemctl status haproxy
```  

---

### Section 3: **Configuring ACL Settings in HAProxy**  

#### Step 1: Locate the Configuration File  

The primary configuration file is located at:  

```bash
/etc/haproxy/haproxy.cfg
```  

Make a backup of this file before making changes:  

```bash
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
```  

#### Step 2: Define ACL Rules  

ACL rules are defined within the **frontend** or **backend** sections of the configuration file. Example:  

```plaintext
frontend http_front
    bind *:80
    acl is_static path_end .jpg .png .css .js
    acl is_admin path_beg /admin
    use_backend static_server if is_static
    use_backend admin_server if is_admin
```  

Explanation:  

- **`acl is_static`**: Matches requests ending with `.jpg`, `.png`, `.css`, or `.js`.  
- **`acl is_admin`**: Matches requests that begin with `/admin`.  
- **`use_backend`**: Routes traffic to specific backends based on ACL matches.  

#### Step 3: Configure Backends  

Define the backends corresponding to your ACL rules:  

```plaintext
backend static_server
    server static1 192.168.1.101:80 check

backend admin_server
    server admin1 192.168.1.102:80 check
```  

---

### Section 4: **Examples of Common ACL Scenarios**  

#### Example 1: Blocking Traffic from Specific IPs  

To block traffic from a specific IP address, use an ACL with a `deny` rule:  

```plaintext
frontend http_front
    bind *:80
    acl block_ips src 192.168.1.50 192.168.1.51
    http-request deny if block_ips
```  

#### Example 2: Redirecting Traffic Based on URL Path  

To redirect requests for `/old-page` to `/new-page`:  

```plaintext
frontend http_front
    bind *:80
    acl old_page path_beg /old-page
    http-request redirect location /new-page if old_page
```  

#### Example 3: Restricting Access by Time  

To allow access to `/maintenance` only during business hours:  

```plaintext
frontend http_front
    bind *:80
    acl business_hours time 08:00-18:00
    acl maintenance_path path_beg /maintenance
    http-request deny if maintenance_path !business_hours
```  

#### Example 4: Differentiating Traffic by Protocol  

Route traffic based on whether it’s HTTP or HTTPS:  

```plaintext
frontend mixed_traffic
    bind *:80
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem
    acl is_http hdr(host) -i http
    acl is_https hdr(host) -i https
    use_backend http_server if is_http
    use_backend https_server if is_https
```  

---

### Section 5: **Testing and Validating ACL Configurations**  

#### Step 1: Validate the Configuration File  

Before restarting HAProxy, validate the configuration:  

```bash
sudo haproxy -c -f /etc/haproxy/haproxy.cfg
```  

#### Step 2: Restart HAProxy  

Apply your changes:  

```bash
sudo systemctl restart haproxy
```  

#### Step 3: Test with `curl`  

Use `curl` to simulate requests and test ACL rules:  

```bash
curl -v http://<haproxy-ip>/admin
curl -v http://<haproxy-ip>/old-page
```  

Verify the response codes and redirections based on your ACL rules.  

---

### Section 6: **Optimizing ACL Performance**  

#### Use Efficient Matching  

Use optimized ACL matching methods for better performance:  

- Use **`path_beg`** or **`path_end`** for matching specific patterns.  
- Avoid overly complex regex patterns that increase processing time.  

#### Minimize Redundant Rules  

Consolidate similar ACLs to reduce duplication and simplify maintenance.  

#### Enable Logging  

Enable HAProxy logging for debugging and monitoring:  

```plaintext
global
    log /dev/log local0
    log /dev/log local1 notice

defaults
    log global
```  

Monitor logs to verify ACL behavior:  

```bash
sudo tail -f /var/log/haproxy.log
```  

---

### Section 7: **Troubleshooting Common ACL Issues**  

#### ACLs Not Matching as Expected  

- Double-check the syntax of ACL definitions.  
- Use the `haproxy -c -f` command to identify syntax errors.  

#### Unexpected Traffic Routing  

- Verify the order of ACL rules—HAProxy processes them sequentially.  
- Check for conflicting rules or conditions.  

#### Performance Issues  

- Reduce the number of ACL checks in critical traffic paths.  
- Review system resource utilization and adjust HAProxy settings accordingly.  

---

**Conclusion**  

Configuring ACL settings in HAProxy is a powerful way to control traffic and optimize performance for enterprise applications on AlmaLinux. Whether you’re blocking unauthorized users, routing traffic dynamically, or enforcing security rules, ACLs provide unparalleled flexibility.  

By following this guide, you can implement ACLs effectively, ensuring a robust and secure infrastructure that meets your organization’s needs. Regular testing and monitoring will help maintain optimal performance and reliability.  

---

**Meta Title:** Configuring HAProxy ACL Settings on AlmaLinux  
**Meta Description:** Learn how to configure ACL settings in HAProxy on AlmaLinux. A detailed guide covering installation, configuration, testing, and optimization for traffic control and security.
