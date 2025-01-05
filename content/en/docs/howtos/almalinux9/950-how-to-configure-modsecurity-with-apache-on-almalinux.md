---
title: How to Configure mod_security with Apache on AlmaLinux
linkTitle: mod_security with Apache
description: This detailed guide will walk you through the installation, configuration, and testing of mod_security on AlmaLinux.
date: 2024-12-18
weight: 950
url: configure-mod-security-apache-almalinux
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


featured_image: /images/almalinux.webp
---
Securing web applications is a critical aspect of modern server administration, and **mod_security** plays a pivotal role in fortifying your Apache web server. mod_security is an open-source Web Application Firewall (WAF) module that helps protect your server from malicious attacks, such as SQL injection, cross-site scripting (XSS), and other vulnerabilities.  

For system administrators using **AlmaLinux**, a popular RHEL-based distribution, setting up mod_security with Apache is an effective way to enhance web application security. This detailed guide will walk you through the installation, configuration, and testing of mod_security on AlmaLinux.  

---

### **Prerequisites**  

Before starting, ensure you have:  

1. **AlmaLinux Installed**: AlmaLinux 8 or later is assumed for this tutorial.  
2. **Apache Installed and Running**: Ensure the Apache (httpd) web server is installed and active.  
3. **Root or Sudo Privileges**: Administrative access is required to perform these tasks.  
4. **Basic Understanding of Apache Configuration**: Familiarity with Apache configuration files is helpful.  

---

### **Step 1: Update Your AlmaLinux System**  

First, ensure your AlmaLinux system is up-to-date. Run the following commands:  

```bash
sudo dnf update -y
sudo reboot
```  

This ensures that all packages are current, which is especially important for security-related configurations.  

---

### **Step 2: Install Apache (if not already installed)**  

If Apache isn’t installed, install it using the `dnf` package manager:  

```bash
sudo dnf install httpd -y
```  

Start and enable Apache to run on boot:  

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```  

Verify that Apache is running:  

```bash
sudo systemctl status httpd
```  

You can confirm it’s working by accessing your server’s IP in a browser.  

---

### **Step 3: Install mod_security**  

mod_security is available in the AlmaLinux repositories. Install it along with its dependencies:  

```bash
sudo dnf install mod_security -y
```  

This command installs mod_security and its required components.  

#### Verify Installation  

Ensure mod_security is successfully installed by listing the enabled Apache modules:  

```bash
sudo httpd -M | grep security
```  

You should see an output similar to this:  

```bash
security2_module (shared)
```  

If it’s not enabled, you can explicitly load the module by editing the Apache configuration file:  

```bash
sudo nano /etc/httpd/conf.modules.d/00-base.conf
```  

Add the following line if it’s not present:  

```apache
LoadModule security2_module modules/mod_security2.so
```  

Save the file and restart Apache:  

```bash
sudo systemctl restart httpd
```  

---

### **Step 4: Configure mod_security**  

#### Default Configuration File  

mod_security’s main configuration file is located at:  

```bash
/etc/httpd/conf.d/mod_security.conf
```  

Open it in a text editor:  

```bash
sudo nano /etc/httpd/conf.d/mod_security.conf
```  

Inside, you’ll find directives that control mod_security’s behavior. Here are the most important ones:  

- **SecRuleEngine**: Enables or disables mod_security. Set it to `On` to activate the WAF:  

  ```apache
  SecRuleEngine On
  ```  

- **SecRequestBodyAccess**: Allows mod_security to inspect HTTP request bodies:  

  ```apache
  SecRequestBodyAccess On
  ```  

- **SecResponseBodyAccess**: Inspects HTTP response bodies for data leakage and other issues:  

  ```apache
  SecResponseBodyAccess Off
  ```  

#### Save Changes and Restart Apache  

After making changes to the configuration file, restart Apache to apply them:  

```bash
sudo systemctl restart httpd
```  

---

### **Step 5: Install and Configure the OWASP Core Rule Set (CRS)**  

The **OWASP ModSecurity Core Rule Set (CRS)** is a set of preconfigured rules that help protect against a wide range of web vulnerabilities.  

#### Download the Core Rule Set  

Install the CRS by cloning its GitHub repository:  

```bash
cd /etc/httpd/
sudo git clone https://github.com/coreruleset/coreruleset.git modsecurity-crs
```  

#### Enable CRS in mod_security  

Edit the mod_security configuration file to include the CRS rules:  

```bash
sudo nano /etc/httpd/conf.d/mod_security.conf
```  

Add the following lines at the bottom of the file:  

```apache
IncludeOptional /etc/httpd/modsecurity-crs/crs-setup.conf
IncludeOptional /etc/httpd/modsecurity-crs/rules/*.conf
```  

Save and close the file.  

#### Create a Symbolic Link for the CRS Configuration  

Create a symbolic link for the `crs-setup.conf` file:  

```bash
sudo cp /etc/httpd/modsecurity-crs/crs-setup.conf.example /etc/httpd/modsecurity-crs/crs-setup.conf
```  

---

### **Step 6: Test mod_security**  

#### Create a Test Rule  

To confirm mod_security is working, create a custom rule in the configuration file. Open the configuration file:  

```bash
sudo nano /etc/httpd/conf.d/mod_security.conf
```  

Add the following rule at the end:  

```apache
SecRule ARGS:testparam "@streq test" "id:1234,phase:1,deny,status:403,msg:'Test rule triggered'"
```  

This rule denies any request containing a parameter `testparam` with the value `test`.  

Restart Apache:  

```bash
sudo systemctl restart httpd
```  

#### Perform a Test  

Send a request to your server with the `testparam` parameter:  

```bash
curl "http://your-server-ip/?testparam=test"
```  

You should receive a 403 Forbidden response, indicating that the rule was triggered.  

---

### **Step 7: Monitor mod_security Logs**  

mod_security logs all activity to the **Apache error log** by default. To monitor logs in real-time:  

```bash
sudo tail -f /var/log/httpd/error_log
```  

For detailed logs, you can enable mod_security’s audit logging feature in the configuration file. Open the file:  

```bash
sudo nano /etc/httpd/conf.d/mod_security.conf
```  

Find and modify the following directives:  

```apache
SecAuditEngine On
SecAuditLog /var/log/httpd/modsec_audit.log
```  

Save and restart Apache:  

```bash
sudo systemctl restart httpd
```  

Audit logs will now be stored in `/var/log/httpd/modsec_audit.log`.  

---

### **Step 8: Fine-Tune Your Configuration**  

#### Disable Specific Rules  

Some CRS rules might block legitimate traffic. To disable a rule, you can use the `SecRuleRemoveById` directive. For example:  

```apache
SecRuleRemoveById 981176
```  

Add this line to your configuration file and restart Apache.  

#### Test Your Website for Compatibility  

Run tests against your website to ensure that legitimate traffic is not being blocked. Tools like **OWASP ZAP** or **Burp Suite** can be used for testing.  

---

### **Step 9: Secure Your Server**  

#### Enable the Firewall  

Ensure the firewall allows HTTP and HTTPS traffic:  

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```  

#### Use HTTPS  

Secure your server with SSL/TLS certificates. Install Certbot for Let's Encrypt and enable HTTPS:  

```bash
sudo dnf install certbot python3-certbot-apache -y
sudo certbot --apache
```  

Follow the prompts to generate and enable an SSL certificate for your domain.  

---

### **Conclusion**  

By configuring mod_security with Apache on AlmaLinux, you’ve added a powerful layer of defense to your web server. With mod_security and the OWASP Core Rule Set, your server is now equipped to detect and mitigate various web-based threats.  

While this guide covers the essentials, ongoing monitoring, testing, and fine-tuning are vital to maintain robust security. By keeping mod_security and its rule sets updated, you can stay ahead of evolving threats and protect your web applications effectively.  

For advanced setups, explore custom rules and integration with security tools to enhance your security posture further.
