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
date: "2024-10-04T18:30:49Z"
guid: https://www.siberoloji.com/?p=2343
id: 2343
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- linux how-to
- virtual hosts
title: 'AlmaLinux 9: How to Create Virtual Hosts to Use Multiple Domain Names on Apache
  Web Server'
url: /almalinux-9-how-to-create-virtual-hosts-to-use-multiple-domain-names-on-apache-web-server/
---

  As your website portfolio or business grows, you may find yourself needing to host multiple websites on the same server. Apache's Virtual Hosting feature allows you to do this by enabling multiple domains or subdomains to run on a single web server, all using one IP address. This method is efficient, saves resources, and is ideal for developers, businesses, and web hosting providers. 
 

  In this comprehensive guide, we will walk through the process of configuring Virtual Hosting on an Apache Web Server running on AlmaLinux 9. By the end, you will have the skills to host multiple websites on a single server, each with its own domain name. 
 


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Apache Virtual Hosts 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Prerequisites 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Installing Apache on AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- How Virtual Hosting Works in Apache 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Creating Directories for Each Website 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring Virtual Hosts on Apache 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Testing the Virtual Hosts Configuration 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enabling and Securing Virtual Hosts with SSL (Optional) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Apache Virtual Hosts
<!-- /wp:heading -->

  Apache Virtual Hosts is a feature that allows a single Apache web server to host multiple domains. It works by mapping different domain names or IP addresses to separate directories on the server, essentially creating isolated environments for each domain. Virtual Hosting can be done in two main ways: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Name-Based Virtual Hosting*** : Multiple domains share the same IP address but serve different content based on the domain name in the request. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***IP-Based Virtual Hosting*** : Each domain has its own IP address, but this method is less commonly used due to the scarcity of IPv4 addresses. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  In this guide, we'll focus on ***Name-Based Virtual Hosting***  to configure multiple domain names on one Apache server. 
 


 ### 2. Prerequisites
<!-- /wp:heading -->

  Before you start, ensure that the following prerequisites are in place: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***An AlmaLinux 9 Server*** : Ensure your server is up and running. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Sudo Privileges*** : You need an account with sudo privileges to install and configure software. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Domain Names*** : Two or more domain names that will point to your server's IP address. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Apache HTTP Server Installed*** : If Apache is not yet installed, we will cover this in the next section. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 3. Installing Apache on AlmaLinux 9
<!-- /wp:heading -->

  If Apache is not already installed on your AlmaLinux 9 system, you can install it using the DNF package manager. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Update the System 
<!-- /wp:heading -->

  First, make sure your system’s package index is up to date: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf update -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Install Apache 
<!-- /wp:heading -->

  Install the Apache HTTP Server package using the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Start and Enable Apache 
<!-- /wp:heading -->

  Once Apache is installed, start the service: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

  Enable Apache to start automatically on system boot: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Verify Apache Installation 
<!-- /wp:heading -->

  You can verify the installation by visiting your server's IP address in a web browser (<code>http://your_server_ip</code>). You should see the default Apache test page. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. How Virtual Hosting Works in Apache
<!-- /wp:heading -->

  Virtual Hosting in Apache is managed through individual configuration files for each domain or subdomain. Apache uses these files to determine which domain corresponds to which directory on the server. 
 

  Each Virtual Host is configured with directives such as: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***ServerName*** : The domain name (e.g., <code>example.com</code>). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DocumentRoot*** : The directory where the website’s files are located. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***ErrorLog and CustomLog*** : Paths to log files for the domain. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  You will create separate configuration files for each domain, allowing Apache to serve the correct content based on the domain requested. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Creating Directories for Each Website
<!-- /wp:heading -->

  Before creating the Virtual Hosts, you need to set up directories for each website that will be hosted on the server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Create Directories 
<!-- /wp:heading -->

  Navigate to the <code>/var/www</code> directory, which is the default location for website files on Apache. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /var/www</code></pre>
<!-- /wp:code -->

  For each website, create a separate directory. For example, if you are hosting two websites, <code>example1.com</code> and <code>example2.com</code>, create directories for each: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /var/www/example1.com
sudo mkdir /var/www/example2.com</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Set Permissions 
<!-- /wp:heading -->

  Set the correct permissions for these directories, ensuring that the Apache user has read and write access: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chown -R $USER:$USER /var/www/example1.com
sudo chown -R $USER:$USER /var/www/example2.com</code></pre>
<!-- /wp:code -->

  The <code>$USER</code> variable represents your current user. If you're running Apache as a different user, adjust accordingly. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Create Sample Web Pages 
<!-- /wp:heading -->

  For testing purposes, create a simple HTML file in each directory: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /var/www/example1.com/index.html</code></pre>
<!-- /wp:code -->

  Add some basic HTML content to this file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Welcome to Example1.com!&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Example1.com is working!&lt;/h1&gt;
    &lt;/body&gt;
&lt;/html&gt;</code></pre>
<!-- /wp:code -->

  Repeat the process for <code>example2.com</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /var/www/example2.com/index.html</code></pre>
<!-- /wp:code -->

  Add a similar HTML page for <code>example2.com</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Welcome to Example2.com!&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Example2.com is working!&lt;/h1&gt;
    &lt;/body&gt;
&lt;/html&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Configuring Virtual Hosts on Apache
<!-- /wp:heading -->

  Now that the directories are set up, it’s time to configure Apache to serve the correct content for each domain. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Create Virtual Host Files 
<!-- /wp:heading -->

  Navigate to the <code>/etc/httpd/conf.d/</code> directory, where Apache's configuration files are stored. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /etc/httpd/conf.d/</code></pre>
<!-- /wp:code -->

  Create a new Virtual Host configuration file for <code>example1.com</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano example1.com.conf</code></pre>
<!-- /wp:code -->

  Add the following content to configure the Virtual Host for <code>example1.com</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;VirtualHost *:80&gt;
    ServerAdmin admin@example1.com
    ServerName example1.com
    ServerAlias www.example1.com
    DocumentRoot /var/www/example1.com
    ErrorLog /var/log/httpd/example1.com-error.log
    CustomLog /var/log/httpd/example1.com-access.log combined
&lt;/VirtualHost&gt;</code></pre>
<!-- /wp:code -->

  This configuration tells Apache to serve files from <code>/var/www/example1.com</code> when <code>example1.com</code> or <code>www.example1.com</code> is requested. 
 

  Repeat the process for <code>example2.com</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano example2.com.conf</code></pre>
<!-- /wp:code -->

  Add the following content: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;VirtualHost *:80&gt;
    ServerAdmin admin@example2.com
    ServerName example2.com
    ServerAlias www.example2.com
    DocumentRoot /var/www/example2.com
    ErrorLog /var/log/httpd/example2.com-error.log
    CustomLog /var/log/httpd/example2.com-access.log combined
&lt;/VirtualHost&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Check Configuration Syntax 
<!-- /wp:heading -->

  After adding the Virtual Host configurations, it’s important to verify that there are no syntax errors in the configuration files. Run the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apachectl configtest</code></pre>
<!-- /wp:code -->

  If the configuration is correct, you should see a message that says <code>Syntax OK</code>. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Restart Apache 
<!-- /wp:heading -->

  Restart the Apache service to apply the new configuration: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Testing the Virtual Hosts Configuration
<!-- /wp:heading -->

  To test the Virtual Hosts, you need to ensure that your domain names (<code>example1.com</code> and <code>example2.com</code>) are pointing to your server’s IP address. This can be done by updating your domain’s DNS records or by editing your local machine’s <code>/etc/hosts</code> file for testing purposes. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Edit the Hosts File (for Local Testing) 
<!-- /wp:heading -->

  On your local machine, you can simulate domain resolution by editing the <code>/etc/hosts</code> file (on Linux and macOS) or <code>C:\Windows\System32\drivers\etc\hosts</code> (on Windows). Add the following lines: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">your_server_ip example1.com
your_server_ip example2.com</code></pre>
<!-- /wp:code -->

  Replace <code>your_server_ip</code> with the actual IP address of your server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Test in a Web Browser 
<!-- /wp:heading -->

  Now open a web browser and navigate to <code>http://example1.com</code> and <code>http://example2.com</code>. You should see the different websites you created for each domain. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Enabling and Securing Virtual Hosts with SSL (Optional)
<!-- /wp:heading -->

  To secure your websites with SSL, you can use Let's Encrypt to obtain a free SSL certificate. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install Certbot and mod_ssl 
<!-- /wp:heading -->

  To install Certbot and the Apache SSL module, run the following commands: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install certbot python3-certbot-apache mod_ssl -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Obtain SSL Certificates 
<!-- /wp:heading -->

  Run the Certbot client to obtain and automatically configure the SSL certificates: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot --apache -d example1.com -d www.example1.com</code></pre>
<!-- /wp:code -->

  Follow the prompts to install the SSL certificate. Repeat this step for each domain you want to secure. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Verify SSL Configuration 
<!-- /wp:heading -->

  After installing the certificates, verify that your domains are now accessible over HTTPS. Test by visiting <code>https://example1.com</code> 
 

  and <code>https://example2.com</code>. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 9. Conclusion
<!-- /wp:heading -->

  By configuring Virtual Hosts in Apache on AlmaLinux 9, you can host multiple websites on a single server, reducing costs and maximizing efficiency. In this guide, we covered the steps to create directories for each website, configure Virtual Hosts, and test the setup. 
 

  Virtual Hosting is a powerful feature for web developers, hosting companies, and businesses. You can easily scale your server to handle many different websites and manage them efficiently using Apache’s robust configuration options. 
 

  Now that your Virtual Hosts are configured and running, you can manage multiple domains on a single Apache server, all while maintaining clear separation and control over each site. 
 