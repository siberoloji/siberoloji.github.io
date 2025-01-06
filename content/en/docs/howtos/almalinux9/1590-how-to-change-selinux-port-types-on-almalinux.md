---
title: null
linkTitle: null
description: null
date: null
weight: 1590
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
# How to Change SELinux Port Types on AlmaLinux  

**Security-Enhanced Linux (SELinux)** is a powerful security feature in AlmaLinux that enforces strict access controls over processes, users, and system resources. A critical part of SELinux’s functionality is the management of port types. These port types define which services or applications can use specific network ports based on SELinux policies.  

This article will guide you through understanding SELinux port types, why and when to change them, and how to configure them effectively on AlmaLinux to ensure both security and functionality.  

---

### **What Are SELinux Port Types?**

SELinux port types are labels applied to network ports to control their usage by specific services or processes. These labels are defined within SELinux policies and determine which services can bind to or listen on particular ports.  

For example:  

- The `http_port_t` type is assigned to ports used by web servers like Apache or Nginx.  
- The `ssh_port_t` type is assigned to the SSH service's default port (22).  

Changing SELinux port types is necessary when you need to use non-standard ports for services while maintaining SELinux security.

---

### **Why Change SELinux Port Types?**

Changing SELinux port types is useful for:  

1. **Using Custom Ports**: When a service needs to run on a non-standard port.  
2. **Avoiding Conflicts**: If multiple services are competing for the same port.  
3. **Security Hardening**: Running services on uncommon ports can make attacks like port scanning less effective.  
4. **Troubleshooting**: Resolving SELinux denials related to port bindings.  

---

### **Checking Current SELinux Port Configurations**

Before making changes, it’s essential to review the current SELinux port configurations.  

#### 1. **List All Ports with SELinux Types**  

Use the `semanage port` command to display all SELinux port types and their associated ports:  

```bash
sudo semanage port -l
```  

Sample output:  

```plaintext
http_port_t                   tcp      80, 443
ssh_port_t                    tcp      22
smtp_port_t                   tcp      25
```

#### 2. **Filter by Service**  

To find ports associated with a specific type, use `grep`:  

```bash
sudo semanage port -l | grep http
```  

This command shows only ports labeled with `http_port_t`.  

#### 3. **Verify Port Usage**  

Check if a port is already in use by another service using the `netstat` or `ss` command:  

```bash
sudo ss -tuln | grep [PORT_NUMBER]
```  

---

### **Changing SELinux Port Types**

SELinux port types can be added, removed, or modified using the `semanage port` command.

---

#### **Adding a New Port to an Existing SELinux Type**

When configuring a service to run on a custom port, assign that port to the appropriate SELinux type.  

#### Syntax  

```bash
sudo semanage port -a -t PORT_TYPE -p PROTOCOL PORT_NUMBER
```  

- `-a`: Adds a new rule.  
- `-t PORT_TYPE`: Specifies the SELinux port type.  
- `-p PROTOCOL`: Protocol type (`tcp` or `udp`).  
- `PORT_NUMBER`: The port number to assign.  

#### Example 1: Add a Custom Port for Apache (HTTP)  

To allow Apache to use port 8080:  

```bash
sudo semanage port -a -t http_port_t -p tcp 8080
```  

#### Example 2: Add a Custom Port for SSH  

To allow SSH to listen on port 2222:  

```bash
sudo semanage port -a -t ssh_port_t -p tcp 2222
```  

---

#### **Modifying an Existing Port Assignment**

If a port is already assigned to a type but needs to be moved to a different type, modify its configuration.  

#### Syntax  

```bash
sudo semanage port -m -t PORT_TYPE -p PROTOCOL PORT_NUMBER
```  

#### Example: Change Port 8080 to a Custom Type  

To assign port 8080 to a custom type:  

```bash
sudo semanage port -m -t custom_port_t -p tcp 8080
```  

---

#### **Removing a Port from an SELinux Type**

If a port is no longer needed for a specific type, remove it using the `-d` option.  

#### Syntax  

```bash
sudo semanage port -d -t PORT_TYPE -p PROTOCOL PORT_NUMBER
```  

#### Example: Remove Port 8080 from `http_port_t`  

```bash
sudo semanage port -d -t http_port_t -p tcp 8080
```  

---

### **Applying and Verifying Changes**

#### 1. **Restart the Service**  

After modifying SELinux port types, restart the service to apply changes:  

```bash
sudo systemctl restart [SERVICE_NAME]
```  

#### 2. **Check SELinux Logs**  

If the service fails to bind to the port, check SELinux logs for denials:  

```bash
sudo ausearch -m avc -ts recent
```  

#### 3. **Test the Service**  

Ensure the service is running on the new port using:  

```bash
sudo ss -tuln | grep [PORT_NUMBER]
```  

---

### **Common SELinux Port Types and Services**

Here’s a list of common SELinux port types and their associated services:  

| **Port Type**       | **Protocol** | **Default Ports** | **Service**               |
|----------------------|--------------|-------------------|---------------------------|
| `http_port_t`        | `tcp`        | 80, 443           | Apache, Nginx, Web Server |
| `ssh_port_t`         | `tcp`        | 22                | SSH                       |
| `smtp_port_t`        | `tcp`        | 25                | SMTP Mail Service         |
| `mysqld_port_t`      | `tcp`        | 3306              | MySQL, MariaDB            |
| `dns_port_t`         | `udp`        | 53                | DNS                       |
| `samba_port_t`       | `tcp`        | 445               | Samba                     |

---

### **Troubleshooting SELinux Port Type Issues**

#### Issue 1: Service Fails to Bind to Port  

- **Symptoms**: The service cannot start, and logs indicate a permission error.  
- **Solution**: Check SELinux denials:  

  ```bash
  sudo ausearch -m avc
  ```  

  Assign the correct SELinux port type using `semanage port`.  

#### Issue 2: Port Conflict  

- **Symptoms**: Two services compete for the same port.  
- **Solution**: Reassign one service to a different port and update its SELinux type.  

#### Issue 3: Incorrect Protocol  

- **Symptoms**: The service works for `tcp` but not `udp` (or vice versa).  
- **Solution**: Verify the protocol in the `semanage port` configuration and update it if needed.  

---

### **Best Practices for Managing SELinux Port Types**

1. **Understand Service Requirements**  
   Research the SELinux type required by your service before making changes.  

2. **Document Changes**  
   Maintain a record of modified port configurations for troubleshooting and compliance purposes.  

3. **Use Non-Standard Ports for Security**  
   Running services on non-standard ports can reduce the risk of automated attacks.  

4. **Test Changes Before Deployment**  
   Test new configurations in a staging environment before applying them to production systems.  

5. **Avoid Disabling SELinux**  
   Instead of disabling SELinux, focus on configuring port types and policies correctly.  

---

### **Conclusion**

SELinux port types are a crucial part of AlmaLinux’s security framework, controlling how services interact with network resources. By understanding how to view, change, and manage SELinux port types, you can configure your system to meet specific requirements while maintaining robust security.  

Whether you’re running web servers, configuring SSH on custom ports, or troubleshooting access issues, mastering SELinux port management will ensure your system operates securely and efficiently.  

Need help with SELinux configurations or troubleshooting? Let us know, and we’ll assist you in optimizing your AlmaLinux environment!
