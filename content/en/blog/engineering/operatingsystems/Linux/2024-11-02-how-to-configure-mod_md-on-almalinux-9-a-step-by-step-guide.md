---
draft: false
title:  "How to Configure mod_md on AlmaLinux 9: A Step-by-Step Guide"
date: 2024-11-02T13:31:08+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: This guide will take you through the process, step-by-step, to ensure a smooth setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS.
url:  /how-to-configure-mod_md-on-almalinux-9-a-step-by-step-guide/
featured_image: /images/almalinux.webp
categories:
    - Linux How-to
tags:
    - alma linux
    - mod_md
---

<!-- wp:jetpack/markdown {"source":"Configuring mod_md on AlmaLinux 9 is an essential step for users looking to implement automatic management of Let's Encrypt SSL certificates for Apache-based web servers. With **mod_md** (short for *modular mod_md*), Apache 2.4+ users can simplify SSL certificate management by allowing automatic creation, renewal, and loading of certificates. This guide will take you through the process, step-by-step, to ensure a smooth setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS. 
 
### **1. Introduction to mod_md** 
**mod_md** is an Apache module that manages SSL certificates directly on the server. It communicates with the Let's Encrypt certificate authority (CA) to automate the generation and renewal of SSL certificates, ensuring your website remains secure without manual intervention. 
 
### **2. Why Use mod_md on AlmaLinux 9?** 
- **Automated Certificate Management**: mod_md minimizes manual SSL handling by managing the entire SSL lifecycle, from issuing to renewal. - **Enhanced Security**: The automatic renewal feature of mod_md keeps your site protected, maintaining a high level of SSL encryption. - **Compatibility with Let's Encrypt**: mod_md works seamlessly with Let's Encrypt, one of the most popular CAs for SSL certificates. 
 
### **3. Prerequisites for mod_md Configuration** 
Before starting the configuration process, ensure that: 
1. **AlmaLinux 9** is up and running. 2. **Apache HTTP Server (version 2.4.30 or higher)** is installed. 3. **Root or sudo access** to install and configure software. 4. **Domain name(s)** you own and have control over. 
 
### **4. Step 1: Installing mod_md on AlmaLinux 9** 
The first step is to check if mod_md is installed as part of the Apache installation on AlmaLinux 9. 
1. **Install Apache** (if it isn't already installed): 
   ```bash    sudo dnf install httpd -y    ``` 
2. **Enable mod_md**: 
   AlmaLinux 9 typically includes mod_md in the Apache installation. To confirm, use the command: 
   ```bash    httpd -M | grep md    ``` 
   If the output shows `md_module`, mod_md is already enabled. If it isn’t, you may need to install additional packages or update Apache. 
3. **Start and Enable Apache**: 
   ```bash    sudo systemctl start httpd    sudo systemctl enable httpd    ``` 
 
### **5. Step 2: Configuring mod_md** 
The core configuration for mod_md occurs within the Apache configuration files. Follow these steps to ensure mod_md is set up properly: 
1. **Edit the Apache configuration file** (typically located in `/etc/httpd/conf/httpd.conf`): 
   ```bash    sudo nano /etc/httpd/conf/httpd.conf    ``` 
2. **Load mod_md**: Add the following lines if they aren’t present: 
   ```apache    LoadModule md_module modules/mod_md.so    ``` 
3. **Define Managed Domains**: mod_md requires specifying the domain(s) you wish to manage. Add the following lines to configure mod_md for your domain (replace `yourdomain.com` with your actual domain): 
   ```apache    MDomain yourdomain.com www.yourdomain.com    ``` 
4. **Specify the Contact Email**: This email is used to communicate with Let's Encrypt in case of issues. Add the line: 
   ```apache    MDContactEmail admin@yourdomain.com    ``` 
5. **Save and Close** the configuration file. 
 
### **6. Step 3: Setting up Domain Management (MDomain)** 
The `MDomain` directive defines which domains mod_md should manage. If you have multiple domains, you can add them in the same directive: 

```apache MDomain example.com www.example.com sub.example.com 
``` 
mod_md will create a single certificate valid for all specified domains. Ensure that DNS records for each domain point to your server. 
 
### **7. Step 4: Configuring mod_md for Automatic Certificate Renewal** 
mod_md automates certificate renewal for your domains. By default, it will attempt to renew certificates when they are within 30 days of expiration. You can adjust this setting as follows: 
1. **Edit Apache configuration file** and add the `MDRenewWindow` directive: 
   ```apache    MDRenewWindow 33%    ``` 
   This example sets the renewal window to 33% of the certificate’s lifetime, which is approximately 30 days for Let’s Encrypt certificates. 
2. **Specify Challenge Types**: Configure mod_md to use the `http-01` challenge (default) for domain validation: 
   ```apache    MDChallengeHttp01 on    ``` 
   This lets mod_md validate domains via HTTP, which is the most common method. 
 
### **8. Step 5: Testing and Enabling HTTPS** 
With mod_md set up, you can test it by requesting a certificate manually. Follow these steps: 
1. **Restart Apache** to apply the configuration changes: 
   ```bash    sudo systemctl restart httpd    ``` 
2. **Request a Certificate** manually (useful for testing): 
   ```bash    sudo apachectl -M yourdomain.com    ``` 
3. **Verify Certificate Installation**: 
   Visit `https://yourdomain.com` in your web browser to confirm the SSL certificate is active. 
4. **Set HTTPS as the Default Protocol**: 
   Edit the Virtual Host configuration for your domain in `/etc/httpd/conf.d/ssl.conf`, adding the following: 
   ```apache            ServerName yourdomain.com        DocumentRoot /var/www/html        SSLEngine on        SSLCertificateFile /path/to/fullchain.pem        SSLCertificateKeyFile /path/to/privkey.pem        ``` 
   Be sure to replace `/path/to/fullchain.pem` and `/path/to/privkey.pem` with the actual paths where mod_md stores certificates (typically under `/var/www/.well-known/acme-challenge`). 
 
### **9. Troubleshooting Common Issues** 
- **Issue**: *Certificate renewal fails.*   - **Solution**: Verify DNS settings and domain ownership. Ensure Apache is configured to listen on ports 80 and 443.    - **Issue**: *Permission denied errors when renewing certificates.*   - **Solution**: Check permissions on the challenge directories. Ensure Apache has write access to `.well-known/acme-challenge`. 
- **Issue**: *HTTP challenges failing.*   - **Solution**: Confirm port 80 is open and no firewall is blocking access. This can usually be checked using `firewalld`. 
 
### **10. FAQ on mod_md Configuration for AlmaLinux 9** 
**Q1: What is the main benefit of using mod_md with Let's Encrypt on AlmaLinux?**   A: The primary benefit is automation; mod_md manages SSL certificates, including automatic renewals, without manual intervention. 
**Q2: Do I need a dedicated IP address to use mod_md?**   A: No, mod_md works with virtual hosts, so a dedicated IP is not required. 
**Q3: How can I monitor the status of my certificates?**   A: You can use `apachectl -M` or check the `/var/www/.well-known/acme-challenge` directory to monitor certificate status. 
**Q4: What if I want to disable mod_md for a specific domain?**   A: Remove the `MDomain` directive for that domain from the Apache configuration and restart Apache. 
**Q5: How often will mod_md attempt to renew my certificates?**   A: By default, mod_md renews certificates within 30 days of expiration, which can be configured with `MDRenewWindow`. 
**Q6: Is mod_md compatible with other CAs besides Let's Encrypt?**   A: Yes, mod_md supports ACME protocols compatible with other CAs. However, Let's Encrypt is the default choice. 
 
With this configuration, mod_md on AlmaLinux 9 enables a smooth, secure, and automatic SSL setup. By following these steps, you ensure your web server is protected with the latest certificates without manual renewals."} -->
<div class="wp-block-jetpack-markdown">Configuring mod_md on AlmaLinux 9 is an essential step for users looking to implement automatic management of Let’s Encrypt SSL certificates for Apache-based web servers. With **mod_md** (short for modular mod_md), Apache 2.4+ users can simplify SSL certificate management by allowing automatic creation, renewal, and loading of certificates. This guide will take you through the process, step-by-step, to ensure a smooth setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS.
<hr>
**1. Introduction to mod_md**
**mod_md** is an Apache module that manages SSL certificates directly on the server. It communicates with the Let’s Encrypt certificate authority (CA) to automate the generation and renewal of SSL certificates, ensuring your website remains secure without manual intervention.
<hr>
**2. Why Use mod_md on AlmaLinux 9?**

* **Automated Certificate Management**: mod_md minimizes manual SSL handling by managing the entire SSL lifecycle, from issuing to renewal.
* **Enhanced Security**: The automatic renewal feature of mod_md keeps your site protected, maintaining a high level of SSL encryption.
* **Compatibility with Let’s Encrypt**: mod_md works seamlessly with Let’s Encrypt, one of the most popular CAs for SSL certificates.

<hr>
**3. Prerequisites for mod_md Configuration**
Before starting the configuration process, ensure that:

* **AlmaLinux 9** is up and running.
* **Apache HTTP Server (version 2.4.30 or higher)** is installed.
* **Root or sudo access** to install and configure software.
* **Domain name(s)** you own and have control over.

<hr>
**4. Step 1: Installing mod_md on AlmaLinux 9**
The first step is to check if mod_md is installed as part of the Apache installation on AlmaLinux 9.

* 
**Install Apache** (if it isn’t already installed):
<pre><code class="language-bash">sudo dnf install httpd -y
`</pre>

* 
**Enable mod_md**:
AlmaLinux 9 typically includes mod_md in the Apache installation. To confirm, use the command:
<pre><code class="language-bash">httpd -M | grep md
`</pre>
If the output shows `md_module`, mod_md is already enabled. If it isn’t, you may need to install additional packages or update Apache.

* 
**Start and Enable Apache**:
<pre><code class="language-bash">sudo systemctl start httpd
sudo systemctl enable httpd
`</pre>
<hr>
**5. Step 2: Configuring mod_md**
The core configuration for mod_md occurs within the Apache configuration files. Follow these steps to ensure mod_md is set up properly:

* 
**Edit the Apache configuration file** (typically located in `/etc/httpd/conf/httpd.conf`):
<pre><code class="language-bash">sudo nano /etc/httpd/conf/httpd.conf
`</pre>

* 
**Load mod_md**: Add the following lines if they aren’t present:
<pre><code class="language-apache">LoadModule md_module modules/mod_md.so
`</pre>

* 
**Define Managed Domains**: mod_md requires specifying the domain(s) you wish to manage. Add the following lines to configure mod_md for your domain (replace `yourdomain.com` with your actual domain):
<pre><code class="language-apache">MDomain yourdomain.com www.yourdomain.com
`</pre>

* 
**Specify the Contact Email**: This email is used to communicate with Let’s Encrypt in case of issues. Add the line:
<pre><code class="language-apache">MDContactEmail admin@yourdomain.com
`</pre>

* 
**Save and Close** the configuration file.
<hr>
**6. Step 3: Setting up Domain Management (MDomain)**
The `MDomain` directive defines which domains mod_md should manage. If you have multiple domains, you can add them in the same directive:
<pre><code class="language-apache">MDomain example.com www.example.com sub.example.com
`</pre>
mod_md will create a single certificate valid for all specified domains. Ensure that DNS records for each domain point to your server.
<hr>
**7. Step 4: Configuring mod_md for Automatic Certificate Renewal**
mod_md automates certificate renewal for your domains. By default, it will attempt to renew certificates when they are within 30 days of expiration. You can adjust this setting as follows:

* 
**Edit Apache configuration file** and add the `MDRenewWindow` directive:
<pre><code class="language-apache">MDRenewWindow 33%
`</pre>
This example sets the renewal window to 33% of the certificate’s lifetime, which is approximately 30 days for Let’s Encrypt certificates.

* 
**Specify Challenge Types**: Configure mod_md to use the `http-01` challenge (default) for domain validation:
<pre><code class="language-apache">MDChallengeHttp01 on
`</pre>
This lets mod_md validate domains via HTTP, which is the most common method.
<hr>
**8. Step 5: Testing and Enabling HTTPS**
With mod_md set up, you can test it by requesting a certificate manually. Follow these steps:

* 
**Restart Apache** to apply the configuration changes:
<pre><code class="language-bash">sudo systemctl restart httpd
`</pre>

* 
**Request a Certificate** manually (useful for testing):
<pre><code class="language-bash">sudo apachectl -M yourdomain.com
`</pre>

* 
**Verify Certificate Installation**:
Visit `https://yourdomain.com` in your web browser to confirm the SSL certificate is active.

* 
**Set HTTPS as the Default Protocol**:
Edit the Virtual Host configuration for your domain in `/etc/httpd/conf.d/ssl.conf`, adding the following:
<pre><code class="language-apache"><VirtualHost *:443>
    ServerName yourdomain.com
    DocumentRoot /var/www/html
    SSLEngine on
    SSLCertificateFile /path/to/fullchain.pem
    SSLCertificateKeyFile /path/to/privkey.pem
</VirtualHost>
`</pre>
Be sure to replace `/path/to/fullchain.pem` and `/path/to/privkey.pem` with the actual paths where mod_md stores certificates (typically under `/var/www/.well-known/acme-challenge`).
<hr>
**9. Troubleshooting Common Issues**

* 
**Issue**: Certificate renewal fails.

* **Solution**: Verify DNS settings and domain ownership. Ensure Apache is configured to listen on ports 80 and 443.
* 
**Issue**: Permission denied errors when renewing certificates.

* **Solution**: Check permissions on the challenge directories. Ensure Apache has write access to `.well-known/acme-challenge`.
* 
**Issue**: HTTP challenges failing.

* **Solution**: Confirm port 80 is open and no firewall is blocking access. This can usually be checked using `firewalld`.

<hr>
**10. FAQ on mod_md Configuration for AlmaLinux 9**
**Q1: What is the main benefit of using mod_md with Let’s Encrypt on AlmaLinux?** 
A: The primary benefit is automation; mod_md manages SSL certificates, including automatic renewals, without manual intervention.
**Q2: Do I need a dedicated IP address to use mod_md?** 
A: No, mod_md works with virtual hosts, so a dedicated IP is not required.
**Q3: How can I monitor the status of my certificates?** 
A: You can use `apachectl -M` or check the `/var/www/.well-known/acme-challenge` directory to monitor certificate status.
**Q4: What if I want to disable mod_md for a specific domain?** 
A: Remove the `MDomain` directive for that domain from the Apache configuration and restart Apache.
**Q5: How often will mod_md attempt to renew my certificates?** 
A: By default, mod_md renews certificates within 30 days of expiration, which can be configured with `MDRenewWindow`.
**Q6: Is mod_md compatible with other CAs besides Let’s Encrypt?** 
A: Yes, mod_md supports ACME protocols compatible with other CAs. However, Let’s Encrypt is the default choice.
<hr>
With this configuration, mod_md on AlmaLinux 9 enables a smooth, secure, and automatic SSL setup. By following these steps, you ensure your web server is protected with the latest certificates without manual renewals.
</div>
<!-- /wp:jetpack/markdown -->