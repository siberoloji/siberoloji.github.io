---
draft: false
title: "AlmaLinux 9: How to Install Apache httpd to Configure a Web Server"
date: 2024-10-04T18:25:45+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-install-apache-httpd-to-configure-a-web-server/
featured_image: /images/apache-web-server.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - apache web server
  - how-to guides
  - linux how-to
---


When it comes to setting up a reliable web server, Apache HTTP Server (commonly known as Apache httpd) is one of the most popular choices. It is open-source, widely used, and highly customizable to fit the needs of different web hosting environments. In this guide, we'll walk through the steps of installing and configuring Apache httpd on an AlmaLinux 9 server.



By the end of this tutorial, you will have a fully functional Apache web server running on your AlmaLinux system, ready to serve web pages.



Table of Contents


* Introduction to Apache Web Server

* Prerequisites

* Installing Apache httpd on AlmaLinux 9

* Configuring Apache Web Server

* Managing the Apache Service

* Configuring Firewalls for Apache

* Hosting a Website with Apache

* Setting Up Virtual Hosts

* Securing Apache with SSL (Optional)

* Conclusion




1. Introduction to Apache Web Server



Apache is a powerful, flexible, and high-performance web server. It can serve static content (like HTML pages, images, CSS, and JavaScript) as well as dynamic content through integrations with scripting languages like PHP, Python, or Perl. Apache has a modular architecture, meaning you can extend its capabilities by enabling additional modules, making it versatile for different types of web hosting environments.



2. Prerequisites



Before you begin, ensure that the following prerequisites are met:


* **AlmaLinux 9 Server**: This guide assumes that you have a running AlmaLinux 9 instance.

* **Sudo Privileges**: You need a user account with sudo privileges to perform administrative tasks.

* **Basic Command-Line Knowledge**: Familiarity with basic Linux commands is helpful for completing the steps in this guide.




3. Installing Apache httpd on AlmaLinux 9



AlmaLinux 9 uses the DNF package manager, making it simple to install software packages. To install Apache httpd, follow these steps:


#### Step 1: Update the System



Before installing any new packages, it's a good practice to ensure your system is up to date. Use the following command to update the package index:


```bash
sudo dnf update -y
```



This command will update your system to the latest package versions.


#### Step 2: Install Apache httpd



Now, use the following command to install Apache httpd:


```bash
sudo dnf install httpd -y
```



This will install Apache and its dependencies on your AlmaLinux server.


#### Step 3: Start and Enable Apache



After the installation is complete, you need to start the Apache service and enable it to run automatically on system boot.



Start Apache with the following command:


```bash
sudo systemctl start httpd
```



To enable Apache to start at boot, run:


```bash
sudo systemctl enable httpd
```



You can check the status of the Apache service to ensure it’s running with this command:


```bash
sudo systemctl status httpd
```



The output should indicate that the service is "active (running)."


#### Step 4: Verify Apache Installation



After starting Apache, verify that the web server is working by accessing it via your web browser. By default, Apache serves a test page to any client that connects to your server's IP address.



To find the IP address of your server, run:


```bash
ip a
```



Open your web browser and enter the IP address of your server (e.g., `http://your_server_ip`). If everything is set up correctly, you should see a default Apache welcome page that says "Testing 123…". This confirms that Apache is installed and running properly.



4. Configuring Apache Web Server



The main configuration file for Apache is located at `/etc/httpd/conf/httpd.conf`. This file controls various settings related to how Apache behaves, such as which ports it listens on, the location of log files, and where website files are stored.


#### Basic Configuration Settings



Open the configuration file using a text editor (like `nano` or `vim`):


```bash
sudo nano /etc/httpd/conf/httpd.conf```



Here are some common settings you might want to adjust:


* **ServerAdmin**: This is the email address that Apache uses to notify the administrator if there is a problem with the server. You can set it to your email address: `ServerAdmin admin@yourdomain.com`

* **DocumentRoot**: This is the directory where your website files are stored. By default, Apache serves files from `/var/www/html`. You can change this directory if needed: `DocumentRoot "/var/www/html"`

* **ServerName**: This is the domain name or IP address Apache should respond to. Set this to your server's IP address or your domain: `ServerName yourdomain.com:80`




After making changes, save the file and exit the editor.



To apply your changes, restart Apache:


```bash
sudo systemctl restart httpd
```



5. Managing the Apache Service



Apache is controlled using the `systemctl` command. Here are a few commands to manage the Apache service:


* **Start Apache**: `sudo systemctl start httpd`

* **Stop Apache**: `sudo systemctl stop httpd`

* **Restart Apache**: `sudo systemctl restart httpd`

* **Check Apache Status**: `sudo systemctl status httpd`




6. Configuring Firewalls for Apache



To make sure your server is accessible, you need to configure your firewall to allow HTTP (port 80) and HTTPS (port 443) traffic.



If you're using `firewalld`, run the following commands to open the necessary ports:


```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```



Now, your server should be able to serve web traffic to users.



7. Hosting a Website with Apache



By default, Apache serves content from the `/var/www/html` directory. To host a simple website, place your website’s files (such as HTML, CSS, and JavaScript) in this directory.


* Navigate to the default web directory: `cd /var/www/html`

* You can either create a new HTML file or upload your website files. For example, create a simple `index.html` file: `sudo nano index.html`

* Add your website content: `&lt;html&gt; &lt;head&gt; &lt;title&gt;My AlmaLinux Website&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &lt;h1&gt;Welcome to my website hosted on AlmaLinux 9!&lt;/h1&gt; &lt;/body&gt; &lt;/html&gt;`

* Save the file and exit. When you visit your server's IP address in a web browser, you should now see your custom web page instead of the default Apache page.




8. Setting Up Virtual Hosts



Virtual hosts allow you to run multiple websites on the same server. Each website can have its own domain name, even though they share a single server and IP address.


* First, create a directory for your new website: `sudo mkdir /var/www/yourdomain.com`

* Set permissions for this directory: `sudo chown -R $USER:$USER /var/www/yourdomain.com`

* Create a configuration file for the new site in `/etc/httpd/conf.d/`: `sudo nano /etc/httpd/conf.d/yourdomain.com.conf`

* Add the following content to define the virtual host: `&lt;VirtualHost *:80&gt; ServerAdmin admin@yourdomain.com DocumentRoot /var/www/yourdomain.com ServerName yourdomain.com ErrorLog /var/log/httpd/yourdomain.com-error.log CustomLog /var/log/httpd/yourdomain.com-access.log combined &lt;/VirtualHost&gt;`

* Save the file, then restart Apache: `sudo systemctl restart httpd`




Now, when users visit `yourdomain.com`, they will see the website hosted in the `/var/www/yourdomain.com` directory.



9. Securing Apache with SSL (Optional)



To secure your Apache server with SSL, you can install a free SSL certificate from Let's Encrypt. First, install the `mod_ssl` module and the `certbot` client:


```bash
sudo dnf install mod_ssl
sudo dnf install certbot python3-certbot-apache```



Next, use Certbot to obtain and install the SSL certificate:


```bash
sudo certbot --apache```



Certbot will automatically configure SSL for your Apache server. You can verify it by visiting your website via `https://yourdomain.com`.



10. Conclusion



Congratulations! You've successfully installed and configured Apache httpd on your AlmaLinux 9 server. You now have a fully functional web server capable of serving web pages. By following this guide, you’ve learned how to install Apache, configure virtual hosts, manage the Apache service, and secure your server with SSL.



Apache’s flexibility and powerful configuration options make it a great choice for hosting websites of all sizes. Whether you’re hosting a personal blog, an e-commerce site, or a large enterprise application, Apache provides the tools and capabilities to handle your needs efficiently.
