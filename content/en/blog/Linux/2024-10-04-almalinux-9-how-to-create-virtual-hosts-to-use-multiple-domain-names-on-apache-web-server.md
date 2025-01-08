---
draft: false
title: "AlmaLinux 9: How to Create Virtual Hosts to Use Multiple Domain Names on Apache Web Server"
date: 2024-10-04T18:30:49+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-create-virtual-hosts-to-use-multiple-domain-names-on-apache-web-server/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
  - virtual hosts
---


As your website portfolio or business grows, you may find yourself needing to host multiple websites on the same server. Apache's Virtual Hosting feature allows you to do this by enabling multiple domains or subdomains to run on a single web server, all using one IP address. This method is efficient, saves resources, and is ideal for developers, businesses, and web hosting providers.



In this comprehensive guide, we will walk through the process of configuring Virtual Hosting on an Apache Web Server running on AlmaLinux 9. By the end, you will have the skills to host multiple websites on a single server, each with its own domain name.



Table of Contents


* Introduction to Apache Virtual Hosts

* Prerequisites

* Installing Apache on AlmaLinux 9

* How Virtual Hosting Works in Apache

* Creating Directories for Each Website

* Configuring Virtual Hosts on Apache

* Testing the Virtual Hosts Configuration

* Enabling and Securing Virtual Hosts with SSL (Optional)

* Conclusion

1. Introduction to Apache Virtual Hosts



Apache Virtual Hosts is a feature that allows a single Apache web server to host multiple domains. It works by mapping different domain names or IP addresses to separate directories on the server, essentially creating isolated environments for each domain. Virtual Hosting can be done in two main ways:


* **Name-Based Virtual Hosting**: Multiple domains share the same IP address but serve different content based on the domain name in the request.

* **IP-Based Virtual Hosting**: Each domain has its own IP address, but this method is less commonly used due to the scarcity of IPv4 addresses.




In this guide, we'll focus on **Name-Based Virtual Hosting** to configure multiple domain names on one Apache server.



2. Prerequisites



Before you start, ensure that the following prerequisites are in place:


* **An AlmaLinux 9 Server**: Ensure your server is up and running.

* **Sudo Privileges**: You need an account with sudo privileges to install and configure software.

* **Domain Names**: Two or more domain names that will point to your server's IP address.

* **Apache HTTP Server Installed**: If Apache is not yet installed, we will cover this in the next section.




3. Installing Apache on AlmaLinux 9



If Apache is not already installed on your AlmaLinux 9 system, you can install it using the DNF package manager.


#### Step 1: Update the System



First, make sure your system’s package index is up to date:


```bash
sudo dnf update -y
```


#### Step 2: Install Apache



Install the Apache HTTP Server package using the following command:


```bash
sudo dnf install httpd -y
```


#### Step 3: Start and Enable Apache



Once Apache is installed, start the service:


```bash
sudo systemctl start httpd
```



Enable Apache to start automatically on system boot:


```bash
sudo systemctl enable httpd
```


#### Step 4: Verify Apache Installation



You can verify the installation by visiting your server's IP address in a web browser (`http://your_server_ip`). You should see the default Apache test page.
4. How Virtual Hosting Works in Apache



Virtual Hosting in Apache is managed through individual configuration files for each domain or subdomain. Apache uses these files to determine which domain corresponds to which directory on the server.



Each Virtual Host is configured with directives such as:


* **ServerName**: The domain name (e.g., `example.com`).

* **DocumentRoot**: The directory where the website’s files are located.

* **ErrorLog and CustomLog**: Paths to log files for the domain.




You will create separate configuration files for each domain, allowing Apache to serve the correct content based on the domain requested.
5. Creating Directories for Each Website



Before creating the Virtual Hosts, you need to set up directories for each website that will be hosted on the server.


#### Step 1: Create Directories



Navigate to the `/var/www` directory, which is the default location for website files on Apache.


```bash
cd /var/www```



For each website, create a separate directory. For example, if you are hosting two websites, `example1.com` and `example2.com`, create directories for each:


```bash
sudo mkdir /var/www/example1.com
sudo mkdir /var/www/example2.com
```


#### Step 2: Set Permissions



Set the correct permissions for these directories, ensuring that the Apache user has read and write access:


```bash
sudo chown -R $USER:$USER /var/www/example1.com
sudo chown -R $USER:$USER /var/www/example2.com
```



The `$USER` variable represents your current user. If you're running Apache as a different user, adjust accordingly.


#### Step 3: Create Sample Web Pages



For testing purposes, create a simple HTML file in each directory:


```bash
sudo nano /var/www/example1.com/index.html
```



Add some basic HTML content to this file:


```bash
<html>
    <head>
        <title>Welcome to Example1.com!</title>
    </head>
    <body>
        <h1>Example1.com is working!</h1>
    </body>
</html>
```



Repeat the process for `example2.com`:


```bash
sudo nano /var/www/example2.com/index.html
```



Add a similar HTML page for `example2.com`:


```bash
<html>
    <head>
        <title>Welcome to Example2.com!</title>
    </head>
    <body>
        <h1>Example2.com is working!</h1>
    </body>
</html>
```
6. Configuring Virtual Hosts on Apache



Now that the directories are set up, it’s time to configure Apache to serve the correct content for each domain.


#### Step 1: Create Virtual Host Files



Navigate to the `/etc/httpd/conf.d/` directory, where Apache's configuration files are stored.


```bash
cd /etc/httpd/conf.d/```



Create a new Virtual Host configuration file for `example1.com`:


```bash
sudo nano example1.com.conf```



Add the following content to configure the Virtual Host for `example1.com`:


```bash
<VirtualHost *:80>
    ServerAdmin admin@example1.com
    ServerName example1.com
    ServerAlias www.example1.com
    DocumentRoot /var/www/example1.com
    ErrorLog /var/log/httpd/example1.com-error.log
    CustomLog /var/log/httpd/example1.com-access.log combined
</VirtualHost>
```



This configuration tells Apache to serve files from `/var/www/example1.com` when `example1.com` or `www.example1.com` is requested.



Repeat the process for `example2.com`:


```bash
sudo nano example2.com.conf```



Add the following content:


```bash
<VirtualHost *:80>
    ServerAdmin admin@example2.com
    ServerName example2.com
    ServerAlias www.example2.com
    DocumentRoot /var/www/example2.com
    ErrorLog /var/log/httpd/example2.com-error.log
    CustomLog /var/log/httpd/example2.com-access.log combined
</VirtualHost>
```


#### Step 2: Check Configuration Syntax



After adding the Virtual Host configurations, it’s important to verify that there are no syntax errors in the configuration files. Run the following command:


```bash
sudo apachectl configtest```



If the configuration is correct, you should see a message that says `Syntax OK`.


#### Step 3: Restart Apache



Restart the Apache service to apply the new configuration:


```bash
sudo systemctl restart httpd
```
7. Testing the Virtual Hosts Configuration



To test the Virtual Hosts, you need to ensure that your domain names (`example1.com` and `example2.com`) are pointing to your server’s IP address. This can be done by updating your domain’s DNS records or by editing your local machine’s `/etc/hosts` file for testing purposes.


#### Step 1: Edit the Hosts File (for Local Testing)



On your local machine, you can simulate domain resolution by editing the `/etc/hosts` file (on Linux and macOS) or `C:\Windows\System32\drivers\etc\hosts` (on Windows). Add the following lines:


```bash
your_server_ip example1.com
your_server_ip example2.com
```



Replace `your_server_ip` with the actual IP address of your server.


#### Step 2: Test in a Web Browser



Now open a web browser and navigate to `http://example1.com` and `http://example2.com`. You should see the different websites you created for each domain.
8. Enabling and Securing Virtual Hosts with SSL (Optional)



To secure your websites with SSL, you can use Let's Encrypt to obtain a free SSL certificate.


#### Step 1: Install Certbot and mod_ssl



To install Certbot and the Apache SSL module, run the following commands:


```bash
sudo dnf install certbot python3-certbot-apache mod_ssl -y
```


#### Step 2: Obtain SSL Certificates



Run the Certbot client to obtain and automatically configure the SSL certificates:


```bash
sudo certbot --apache -d example1.com -d www.example1.com
```



Follow the prompts to install the SSL certificate. Repeat this step for each domain you want to secure.


#### Step 3: Verify SSL Configuration



After installing the certificates, verify that your domains are now accessible over HTTPS. Test by visiting `https://example1.com`



and `https://example2.com`.
9. Conclusion



By configuring Virtual Hosts in Apache on AlmaLinux 9, you can host multiple websites on a single server, reducing costs and maximizing efficiency. In this guide, we covered the steps to create directories for each website, configure Virtual Hosts, and test the setup.



Virtual Hosting is a powerful feature for web developers, hosting companies, and businesses. You can easily scale your server to handle many different websites and manage them efficiently using Apache’s robust configuration options.



Now that your Virtual Hosts are configured and running, you can manage multiple domains on a single Apache server, all while maintaining clear separation and control over each site.
