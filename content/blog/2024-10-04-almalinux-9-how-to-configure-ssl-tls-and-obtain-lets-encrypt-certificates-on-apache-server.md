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

  In today’s world, where online security is paramount, encrypting the communication between a web server and its users has become essential. Using SSL/TLS (Secure Sockets Layer/Transport Layer Security) certificates provides that layer of security, ensuring that sensitive information exchanged between a browser and a server is encrypted. One of the most popular and cost-effective ways to implement SSL/TLS is by using Let’s Encrypt, a free certificate authority that provides trusted SSL/TLS certificates for your websites.</p>
 

  In this guide, we will walk you through the steps to configure SSL/TLS and obtain a Let’s Encrypt certificate on an Apache web server running AlmaLinux 9.</p>
 

 
 ## Table of Contents</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Understanding SSL/TLS and Let’s Encrypt</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Prerequisites</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 1: Installing Apache on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 2: Installing Certbot for Let’s Encrypt</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 3: Setting Up the Firewall</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 5: Configuring Apache to Use SSL/TLS Certificates</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 6: Auto-Renewal of Let’s Encrypt Certificates</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## 1. Understanding SSL/TLS and Let’s Encrypt</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### What is SSL/TLS?</h3>
<!-- /wp:heading -->

  SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security) are cryptographic protocols designed to secure communications over a computer network. SSL/TLS certificates authenticate the identity of websites and enable an encrypted connection. When a website has an SSL/TLS certificate, a padlock icon appears in the browser's address bar, and the site’s URL begins with "https," indicating a secure connection.</p>
 

<!-- wp:heading {"level":3} -->
 ### What is Let’s Encrypt?</h3>
<!-- /wp:heading -->

  Let’s Encrypt is a free, automated, and open Certificate Authority (CA) that provides SSL/TLS certificates to encrypt web traffic. It simplifies the process of setting up SSL/TLS by automating the certificate issuance and renewal processes, allowing website administrators to secure their sites quickly and with minimal effort.</p>
 

 
 ## 2. Prerequisites</h2>
<!-- /wp:heading -->

  Before we begin, you need to make sure the following prerequisites are met:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>A server running AlmaLinux 9</strong> with root or sudo user access.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>A domain name</strong> that points to your server's public IP address.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Apache web server</strong> installed and running.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Firewall configuration</strong> that allows HTTP and HTTPS traffic.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A tool like <strong>Certbot</strong>, which simplifies the process of obtaining and managing Let’s Encrypt SSL certificates.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## 3. Step 1: Installing Apache on AlmaLinux 9</h2>
<!-- /wp:heading -->

  If Apache is not already installed on your server, the first step is to install it. Here’s how to do it:</p>
 

<!-- wp:heading {"level":3} -->
 ### Install Apache:</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Enable and Start Apache:</h3>
<!-- /wp:heading -->

  Once Apache is installed, enable it to start automatically on system boot and start the service.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Check Apache Status:</h3>
<!-- /wp:heading -->

  To ensure Apache is running, check its status:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

  If the service is active and running, you’re good to go.</p>
 

 
 ## 4. Step 2: Installing Certbot for Let’s Encrypt</h2>
<!-- /wp:heading -->

  Next, you’ll need to install Certbot, the tool that automates the process of obtaining and renewing Let’s Encrypt certificates.</p>
 

<!-- wp:heading {"level":3} -->
 ### Install the Required Packages:</h3>
<!-- /wp:heading -->

  Run the following command to install the Certbot and the Certbot Apache plugin:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install certbot python3-certbot-apache</code></pre>
<!-- /wp:code -->

  The Certbot Apache plugin will automatically configure SSL/TLS for your Apache web server.</p>
 

 
 ## 5. Step 3: Setting Up the Firewall</h2>
<!-- /wp:heading -->

  To ensure that your server can handle both HTTP and HTTPS traffic, you’ll need to update the firewall settings.</p>
 

<!-- wp:heading {"level":3} -->
 ### Allow HTTP and HTTPS Traffic:</h3>
<!-- /wp:heading -->

  Run the following commands to open the necessary ports:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  By doing this, you’ve allowed HTTP traffic on port 80 and HTTPS traffic on port 443, which are essential for web traffic and secure communication.</p>
 

 
 ## 6. Step 4: Obtaining a Let’s Encrypt SSL/TLS Certificate</h2>
<!-- /wp:heading -->

  Once Apache is installed and the firewall is configured, the next step is to obtain an SSL/TLS certificate from Let’s Encrypt.</p>
 

<!-- wp:heading {"level":3} -->
 ### Obtain the SSL/TLS Certificate:</h3>
<!-- /wp:heading -->

  To obtain a Let’s Encrypt SSL certificate for your domain, use the following Certbot command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot --apache -d yourdomain.com -d www.yourdomain.com</code></pre>
<!-- /wp:code -->

  Replace <code>yourdomain.com</code> and <code>www.yourdomain.com</code> with your actual domain name. Certbot will handle the following:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Verify ownership of the domain.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Automatically obtain and install the SSL certificate.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configure your Apache server to serve your site over HTTPS.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Follow the Certbot Prompts:</h3>
<!-- /wp:heading -->

  Certbot will prompt you with a few questions, such as whether you want to redirect HTTP traffic to HTTPS (which is recommended). Once the process is complete, Certbot will automatically configure Apache with your new SSL/TLS certificate.</p>
 

<!-- wp:heading {"level":3} -->
 ### Verify the SSL/TLS Certificate:</h3>
<!-- /wp:heading -->

  You can verify that the SSL certificate is installed correctly by visiting your website using <code>https://yourdomain.com</code>. You should see the padlock icon next to your URL, indicating that the site is secure.</p>
 

 
 ## 7. Step 5: Configuring Apache to Use SSL/TLS Certificates</h2>
<!-- /wp:heading -->

  Certbot usually handles most of the configuration automatically. However, if you want to manually configure your SSL/TLS settings or customize them further, you can do so in the Apache configuration files.</p>
 

<!-- wp:heading {"level":3} -->
 ### SSL Configuration File:</h3>
<!-- /wp:heading -->

  The SSL configuration file is usually located in <code>/etc/httpd/conf.d/ssl.conf</code> or <code>/etc/httpd/conf.d/yourdomain-le-ssl.conf</code> (if Certbot created it). This file contains directives to control how Apache uses the SSL certificate.</p>
 

  Here’s an example configuration:</p>
 

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

  In this file, you’ll find references to the Let’s Encrypt SSL certificate files, which Certbot has installed. These include:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>SSLCertificateFile</strong>: The location of the SSL certificate.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>SSLCertificateKeyFile</strong>: The location of the private key.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Include /etc/letsencrypt/options-ssl-apache.conf</strong>: This line ensures that Apache uses the recommended security settings.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Redirect HTTP to HTTPS:</h3>
<!-- /wp:heading -->

  To ensure that all traffic to your site uses HTTPS, you can set up a redirect from HTTP to HTTPS in the Apache configuration:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;VirtualHost *:80&gt;
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com

    Redirect permanent / https://yourdomain.com/
&lt;/VirtualHost&gt;</code></pre>
<!-- /wp:code -->

  This configuration automatically redirects visitors accessing <code>http://yourdomain.com</code> to the secure <code>https://yourdomain.com</code>.</p>
 

 
 ## 8. Step 6: Auto-Renewal of Let’s Encrypt Certificates</h2>
<!-- /wp:heading -->

  Let’s Encrypt certificates are valid for 90 days, but Certbot can automatically renew them for you. To ensure your SSL certificates are renewed before they expire, Certbot includes a renewal script.</p>
 

<!-- wp:heading {"level":3} -->
 ### Enable Auto-Renewal:</h3>
<!-- /wp:heading -->

  Certbot automatically adds a cron job to handle certificate renewals. However, you can manually test the renewal process to ensure it works correctly:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot renew --dry-run</code></pre>
<!-- /wp:code -->

  This command performs a dry run to simulate the renewal process without actually renewing the certificate. If successful, Certbot will automatically renew your certificates as they approach expiration.</p>
 

 
 ## 9. Conclusion</h2>
<!-- /wp:heading -->

  Setting up SSL/TLS with Let’s Encrypt on AlmaLinux 9 is a straightforward process, thanks to the powerful Certbot tool and its tight integration with Apache. By following the steps outlined in this guide, you can secure your website with trusted SSL/TLS certificates, ensuring that your users' data is encrypted and safe.</p>
 

  Not only will SSL/TLS improve your site's security, but it also boosts SEO rankings and builds user trust. Remember to keep an eye on certificate renewal to ensure continuous protection for your website, though Certbot automates most of this process.</p>
 

  With this setup, your AlmaLinux 9 server is now ready to securely serve content over HTTPS, providing peace of mind to both you and your site’s visitors. Happy hosting!</p>
 