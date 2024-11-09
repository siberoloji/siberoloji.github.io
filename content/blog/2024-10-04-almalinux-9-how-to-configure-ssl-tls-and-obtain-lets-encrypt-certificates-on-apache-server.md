---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-04T20:12:00Z"
guid: https://www.siberoloji.com/?p=2345
id: 2345
image: /assets/images/2024/09/apache-web-server.webp
tags:
- apache web server
- how-to guides
- linux
- linux how-to
- ssl certificate
title: 'AlmaLinux 9: How to Configure SSL/TLS and Obtain Let’s Encrypt Certificates
  on Apache Server'
url: /almalinux-9-how-to-configure-ssl-tls-and-obtain-lets-encrypt-certificates-on-apache-server/
---

  In today’s world, where online security is paramount, encrypting the communication between a web server and its users has become essential. Using SSL/TLS (Secure Sockets Layer/Transport Layer Security) certificates provides that layer of security, ensuring that sensitive information exchanged between a browser and a server is encrypted. One of the most popular and cost-effective ways to implement SSL/TLS is by using Let’s Encrypt, a free certificate authority that provides trusted SSL/TLS certificates for your websites.
 

  In this guide, we will walk you through the steps to configure SSL/TLS and obtain a Let’s Encrypt certificate on an Apache web server running AlmaLinux 9.
 

 
 ## Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Understanding SSL/TLS and Let’s Encrypt 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Prerequisites 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 1: Installing Apache on AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 2: Installing Certbot for Let’s Encrypt 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 3: Setting Up the Firewall 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 5: Configuring Apache to Use SSL/TLS Certificates 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 6: Auto-Renewal of Let’s Encrypt Certificates 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## 1. Understanding SSL/TLS and Let’s Encrypt
<!-- /wp:heading -->


 ### What is SSL/TLS?
<!-- /wp:heading -->

  SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security) are cryptographic protocols designed to secure communications over a computer network. SSL/TLS certificates authenticate the identity of websites and enable an encrypted connection. When a website has an SSL/TLS certificate, a padlock icon appears in the browser's address bar, and the site’s URL begins with "https," indicating a secure connection.
 


 ### What is Let’s Encrypt?
<!-- /wp:heading -->

  Let’s Encrypt is a free, automated, and open Certificate Authority (CA) that provides SSL/TLS certificates to encrypt web traffic. It simplifies the process of setting up SSL/TLS by automating the certificate issuance and renewal processes, allowing website administrators to secure their sites quickly and with minimal effort.
 

 
 ## 2. Prerequisites
<!-- /wp:heading -->

  Before we begin, you need to make sure the following prerequisites are met:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***A server running AlmaLinux 9***  with root or sudo user access. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***A domain name***  that points to your server's public IP address. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Apache web server***  installed and running. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Firewall configuration***  that allows HTTP and HTTPS traffic. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- A tool like ***Certbot*** , which simplifies the process of obtaining and managing Let’s Encrypt SSL certificates. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## 3. Step 1: Installing Apache on AlmaLinux 9
<!-- /wp:heading -->

  If Apache is not already installed on your server, the first step is to install it. Here’s how to do it:
 


 ### Install Apache:
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd</code></pre>
<!-- /wp:code -->


 ### Enable and Start Apache:
<!-- /wp:heading -->

  Once Apache is installed, enable it to start automatically on system boot and start the service.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd</code></pre>
<!-- /wp:code -->


 ### Check Apache Status:
<!-- /wp:heading -->

  To ensure Apache is running, check its status:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

  If the service is active and running, you’re good to go.
 

 
 ## 4. Step 2: Installing Certbot for Let’s Encrypt
<!-- /wp:heading -->

  Next, you’ll need to install Certbot, the tool that automates the process of obtaining and renewing Let’s Encrypt certificates.
 


 ### Install the Required Packages:
<!-- /wp:heading -->

  Run the following command to install the Certbot and the Certbot Apache plugin:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install certbot python3-certbot-apache</code></pre>
<!-- /wp:code -->

  The Certbot Apache plugin will automatically configure SSL/TLS for your Apache web server.
 

 
 ## 5. Step 3: Setting Up the Firewall
<!-- /wp:heading -->

  To ensure that your server can handle both HTTP and HTTPS traffic, you’ll need to update the firewall settings.
 


 ### Allow HTTP and HTTPS Traffic:
<!-- /wp:heading -->

  Run the following commands to open the necessary ports:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  By doing this, you’ve allowed HTTP traffic on port 80 and HTTPS traffic on port 443, which are essential for web traffic and secure communication.
 

 
 ## 6. Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate
<!-- /wp:heading -->

  Once Apache is installed and the firewall is configured, the next step is to obtain an SSL/TLS certificate from Let’s Encrypt.
 


 ### Obtain the SSL/TLS Certificate:
<!-- /wp:heading -->

  To obtain a Let’s Encrypt SSL certificate for your domain, use the following Certbot command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot --apache -d yourdomain.com -d www.yourdomain.com</code></pre>
<!-- /wp:code -->

  Replace <code>yourdomain.com</code> and <code>www.yourdomain.com</code> with your actual domain name. Certbot will handle the following:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Verify ownership of the domain. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Automatically obtain and install the SSL certificate. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configure your Apache server to serve your site over HTTPS. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Follow the Certbot Prompts:
<!-- /wp:heading -->

  Certbot will prompt you with a few questions, such as whether you want to redirect HTTP traffic to HTTPS (which is recommended). Once the process is complete, Certbot will automatically configure Apache with your new SSL/TLS certificate.
 


 ### Verify the SSL/TLS Certificate:
<!-- /wp:heading -->

  You can verify that the SSL certificate is installed correctly by visiting your website using <code>https://yourdomain.com</code>. You should see the padlock icon next to your URL, indicating that the site is secure.
 

 
 ## 7. Step 5: Configuring Apache to Use SSL/TLS Certificates
<!-- /wp:heading -->

  Certbot usually handles most of the configuration automatically. However, if you want to manually configure your SSL/TLS settings or customize them further, you can do so in the Apache configuration files.
 


 ### SSL Configuration File:
<!-- /wp:heading -->

  The SSL configuration file is usually located in <code>/etc/httpd/conf.d/ssl.conf</code> or <code>/etc/httpd/conf.d/yourdomain-le-ssl.conf</code> (if Certbot created it). This file contains directives to control how Apache uses the SSL certificate.
 

  Here’s an example configuration:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;VirtualHost *:443&gt;
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem
    Include /etc/letsencrypt/options-ssl-apache.conf
&lt;/VirtualHost&gt;</code></pre>
<!-- /wp:code -->

  In this file, you’ll find references to the Let’s Encrypt SSL certificate files, which Certbot has installed. These include:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***SSLCertificateFile*** : The location of the SSL certificate. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***SSLCertificateKeyFile*** : The location of the private key. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Include /etc/letsencrypt/options-ssl-apache.conf*** : This line ensures that Apache uses the recommended security settings. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Redirect HTTP to HTTPS:
<!-- /wp:heading -->

  To ensure that all traffic to your site uses HTTPS, you can set up a redirect from HTTP to HTTPS in the Apache configuration:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;VirtualHost *:80&gt;
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    Redirect permanent / https://yourdomain.com/
&lt;/VirtualHost&gt;</code></pre>
<!-- /wp:code -->

  This configuration automatically redirects visitors accessing <code>http://yourdomain.com</code> to the secure <code>https://yourdomain.com</code>.
 

 
 ## 8. Step 6: Auto-Renewal of Let’s Encrypt Certificates
<!-- /wp:heading -->

  Let’s Encrypt certificates are valid for 90 days, but Certbot can automatically renew them for you. To ensure your SSL certificates are renewed before they expire, Certbot includes a renewal script.
 


 ### Enable Auto-Renewal:
<!-- /wp:heading -->

  Certbot automatically adds a cron job to handle certificate renewals. However, you can manually test the renewal process to ensure it works correctly:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot renew --dry-run</code></pre>
<!-- /wp:code -->

  This command performs a dry run to simulate the renewal process without actually renewing the certificate. If successful, Certbot will automatically renew your certificates as they approach expiration.
 

 
 ## 9. Conclusion
<!-- /wp:heading -->

  Setting up SSL/TLS with Let’s Encrypt on AlmaLinux 9 is a straightforward process, thanks to the powerful Certbot tool and its tight integration with Apache. By following the steps outlined in this guide, you can secure your website with trusted SSL/TLS certificates, ensuring that your users' data is encrypted and safe.
 

  Not only will SSL/TLS improve your site's security, but it also boosts SEO rankings and builds user trust. Remember to keep an eye on certificate renewal to ensure continuous protection for your website, though Certbot automates most of this process.
 

  With this setup, your AlmaLinux 9 server is now ready to securely serve content over HTTPS, providing peace of mind to both you and your site’s visitors. Happy hosting!
 