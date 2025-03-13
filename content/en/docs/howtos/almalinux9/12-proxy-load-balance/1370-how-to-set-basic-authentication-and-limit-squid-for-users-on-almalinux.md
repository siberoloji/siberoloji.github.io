---
title: How to Set Basic Authentication and Limit Squid for Users on AlmaLinux
linkTitle: Basic Authentication and Limit Squid
description: This guide walks you through configuring basic authentication and setting user-based limits in Squid on AlmaLinux.
date: 2024-12-28
weight: 1370
url: set-basic-authentication-limit-squid-users-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-set-basic-authentication-and-limit-squid-for-users-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Proxy servers are essential tools for managing and optimizing network traffic. **Squid**, a powerful open-source proxy server, provides features like caching, traffic filtering, and access control. One key feature of Squid is its ability to implement user-based restrictions using **basic authentication**. By enabling authentication, administrators can ensure only authorized users access the proxy, further enhancing security and control.

This guide walks you through configuring **basic authentication** and setting user-based limits in Squid on AlmaLinux.

---

## **Why Use Basic Authentication in Squid?**

Basic authentication requires users to provide a username and password to access the proxy server. This ensures:

1. **Access Control**: Only authenticated users can use the proxy.
2. **Usage Monitoring**: Track individual user activity via logs.
3. **Security**: Prevent unauthorized use of the proxy, reducing risks.

Combined with Squid's access control features, basic authentication allows fine-grained control over who can access specific websites or network resources.

---

## **Prerequisites**

Before configuring basic authentication, ensure the following:

1. AlmaLinux is installed and updated.
2. **Squid Proxy Server** is installed and running.
3. You have root or sudo access to the server.

---

## **Step 1: Install Squid on AlmaLinux**

If Squid isn’t already installed, follow these steps:

### **Update System Packages**

```bash
sudo dnf update -y
```

### **Install Squid**

```bash
sudo dnf install squid -y
```

### **Start and Enable Squid**

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

## **Step 2: Configure Basic Authentication in Squid**

### **2.1 Install Apache HTTP Tools**

Squid uses **htpasswd** from Apache HTTP Tools to manage usernames and passwords.

Install the package:

```bash
sudo dnf install httpd-tools -y
```

### **2.2 Create the Password File**

Create a file to store usernames and passwords:

```bash
sudo htpasswd -c /etc/squid/passwd user1
```

- Replace `user1` with the desired username.
- You’ll be prompted to set a password for the user.

To add more users, omit the `-c` flag:

```bash
sudo htpasswd /etc/squid/passwd user2
```

Verify the contents of the password file:

```bash
cat /etc/squid/passwd
```

### **2.3 Configure Squid for Authentication**

Edit Squid's configuration file:

```bash
sudo nano /etc/squid/squid.conf
```

Add the following lines to enable basic authentication:

```text
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Squid Proxy Authentication
auth_param basic credentialsttl 2 hours
auth_param basic casesensitive on

acl authenticated_users proxy_auth REQUIRED
http_access allow authenticated_users
http_access deny all
```

Here’s what each line does:

- `auth_param basic program`: Specifies the authentication helper and password file location.
- `auth_param basic realm`: Sets the authentication prompt users see.
- `acl authenticated_users`: Defines an access control list (ACL) for authenticated users.
- `http_access`: Grants access only to authenticated users and denies everyone else.

---

### **2.4 Restart Squid**

Apply the changes by restarting Squid:

```bash
sudo systemctl restart squid
```

---

## **Step 3: Limit Access for Authenticated Users**

Squid’s ACL system allows you to create user-based restrictions. Below are some common scenarios and their configurations.

---

### **3.1 Restrict Access by Time**

To limit internet access to specific hours:

1. Add a time-based ACL to **squid.conf**:

   ```text
   acl work_hours time MTWHF 09:00-17:00
   http_access allow authenticated_users work_hours
   http_access deny authenticated_users
   ```

   - This configuration allows access from Monday to Friday, 9 AM to 5 PM.

2. Restart Squid:

   ```bash
   sudo systemctl restart squid
   ```

---

### **3.2 Block Specific Websites**

To block certain websites for all authenticated users:

1. Create a file listing the blocked websites:

   ```bash
   sudo nano /etc/squid/blocked_sites.txt
   ```

   Add the domains to block, one per line:

   ```text
   facebook.com
   youtube.com
   ```

2. Reference this file in **squid.conf**:

   ```text
   acl blocked_sites dstdomain "/etc/squid/blocked_sites.txt"
   http_access deny authenticated_users blocked_sites
   ```

3. Restart Squid:

   ```bash
   sudo systemctl restart squid
   ```

---

### **3.3 Limit Bandwidth for Users**

To enforce bandwidth restrictions:

1. Enable **delay pools** in **squid.conf**:

   ```text
   delay_pools 1
   delay_class 1 2
   delay_parameters 1 64000/64000 16000/16000
   delay_access 1 allow authenticated_users
   delay_access 1 deny all
   ```

   - `64000/64000`: Total bandwidth (in bytes per second).
   - `16000/16000`: Bandwidth per request.

2. Restart Squid:

   ```bash
   sudo systemctl restart squid
   ```

---

### **3.4 Allow Access to Specific Users Only**

To restrict access to specific users:

1. Define an ACL for the user:

   ```text
   acl user1 proxy_auth user1
   http_access allow user1
   http_access deny all
   ```

2. Restart Squid:

   ```bash
   sudo systemctl restart squid
   ```

---

## **Step 4: Monitor and Troubleshoot**

Monitoring and troubleshooting are essential to ensure Squid runs smoothly.

### **4.1 View Logs**

Squid logs user activity in the **access.log** file:

```bash
sudo tail -f /var/log/squid/access.log
```

### **4.2 Test Authentication**

Use a browser or command-line tool (e.g., `curl`) to verify:

```bash
curl -x http://<proxy-ip>:3128 -U user1:password http://example.com
```

### **4.3 Troubleshoot Configuration Issues**

Check Squid’s syntax before restarting:

```bash
sudo squid -k parse
```

If issues persist, review the Squid logs in **/var/log/squid/cache.log**.

---

## **Step 5: Best Practices for Squid Authentication and Access Control**

1. **Encrypt Password Files:**
   Protect your password file using file permissions:

   ```bash
   sudo chmod 600 /etc/squid/passwd
   sudo chown squid:squid /etc/squid/passwd
   ```

2. **Combine ACLs for Fine-Grained Control:**
   Use multiple ACLs to create layered restrictions (e.g., time-based limits with content filtering).

3. **Enable HTTPS Proxying with SSL Bumping:**
   To inspect encrypted traffic, configure Squid with SSL bumping.

4. **Monitor Usage Regularly:**
   Use tools like **sarg** or **squid-analyzer** to generate user activity reports.

5. **Keep Squid Updated:**
   Regularly update Squid to benefit from security patches and new features:

   ```bash
   sudo dnf update squid
   ```

---

## Conclusion

Implementing basic authentication and user-based restrictions in Squid on AlmaLinux provides robust access control and enhances security. By following this guide, you can enable authentication, limit user access by time or domain, and monitor usage effectively.

Squid’s flexibility allows you to tailor proxy configurations to your organization’s needs, ensuring efficient and secure internet access for all users.
