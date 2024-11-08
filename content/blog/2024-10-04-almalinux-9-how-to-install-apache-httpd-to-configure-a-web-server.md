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
date: "2024-10-04T18:25:45Z"
guid: https://www.siberoloji.com/?p=2341
id: 2341
image: /assets/images/2024/09/apache-web-server.webp
tags:
- alma linux
- apache web server
- how-to guides
- linux how-to
title: 'AlmaLinux 9: How to Install Apache httpd to Configure a Web Server'
url: /almalinux-9-how-to-install-apache-httpd-to-configure-a-web-server/
---

  When it comes to setting up a reliable web server, Apache HTTP Server (commonly known as Apache httpd) is one of the most popular choices. It is open-source, widely used, and highly customizable to fit the needs of different web hosting environments. In this guide, we'll walk through the steps of installing and configuring Apache httpd on an AlmaLinux 9 server. 
 

  By the end of this tutorial, you will have a fully functional Apache web server running on your AlmaLinux system, ready to serve web pages. 
 

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Apache Web Server</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Prerequisites</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Installing Apache httpd on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring Apache Web Server</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Managing the Apache Service</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring Firewalls for Apache</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Hosting a Website with Apache</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Setting Up Virtual Hosts</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Securing Apache with SSL (Optional)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Apache Web Server</h3>
<!-- /wp:heading -->

  Apache is a powerful, flexible, and high-performance web server. It can serve static content (like HTML pages, images, CSS, and JavaScript) as well as dynamic content through integrations with scripting languages like PHP, Python, or Perl. Apache has a modular architecture, meaning you can extend its capabilities by enabling additional modules, making it versatile for different types of web hosting environments. 
 

<!-- wp:heading {"level":3} -->
 ### 2. Prerequisites</h3>
<!-- /wp:heading -->

  Before you begin, ensure that the following prerequisites are met: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>AlmaLinux 9 Server</strong>: This guide assumes that you have a running AlmaLinux 9 instance.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sudo Privileges</strong>: You need a user account with sudo privileges to perform administrative tasks.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Basic Command-Line Knowledge</strong>: Familiarity with basic Linux commands is helpful for completing the steps in this guide.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 3. Installing Apache httpd on AlmaLinux 9</h3>
<!-- /wp:heading -->

  AlmaLinux 9 uses the DNF package manager, making it simple to install software packages. To install Apache httpd, follow these steps: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Update the System</h4>
<!-- /wp:heading -->

  Before installing any new packages, it's a good practice to ensure your system is up to date. Use the following command to update the package index: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf update -y</code></pre>
<!-- /wp:code -->

  This command will update your system to the latest package versions. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Install Apache httpd</h4>
<!-- /wp:heading -->

  Now, use the following command to install Apache httpd: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd -y</code></pre>
<!-- /wp:code -->

  This will install Apache and its dependencies on your AlmaLinux server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Start and Enable Apache</h4>
<!-- /wp:heading -->

  After the installation is complete, you need to start the Apache service and enable it to run automatically on system boot. 
 

  Start Apache with the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

  To enable Apache to start at boot, run: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd</code></pre>
<!-- /wp:code -->

  You can check the status of the Apache service to ensure it’s running with this command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

  The output should indicate that the service is "active (running)." 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Verify Apache Installation</h4>
<!-- /wp:heading -->

  After starting Apache, verify that the web server is working by accessing it via your web browser. By default, Apache serves a test page to any client that connects to your server's IP address. 
 

  To find the IP address of your server, run: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ip a</code></pre>
<!-- /wp:code -->

  Open your web browser and enter the IP address of your server (e.g., <code>http://your_server_ip</code>). If everything is set up correctly, you should see a default Apache welcome page that says "Testing 123…". This confirms that Apache is installed and running properly. 
 

<!-- wp:heading {"level":3} -->
 ### 4. Configuring Apache Web Server</h3>
<!-- /wp:heading -->

  The main configuration file for Apache is located at <code>/etc/httpd/conf/httpd.conf</code>. This file controls various settings related to how Apache behaves, such as which ports it listens on, the location of log files, and where website files are stored. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Basic Configuration Settings</h4>
<!-- /wp:heading -->

  Open the configuration file using a text editor (like <code>nano</code> or <code>vim</code>): 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  Here are some common settings you might want to adjust: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>ServerAdmin</strong>: This is the email address that Apache uses to notify the administrator if there is a problem with the server. You can set it to your email address: <code>ServerAdmin admin@yourdomain.com</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DocumentRoot</strong>: This is the directory where your website files are stored. By default, Apache serves files from <code>/var/www/html</code>. You can change this directory if needed: <code>DocumentRoot "/var/www/html"</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>ServerName</strong>: This is the domain name or IP address Apache should respond to. Set this to your server's IP address or your domain: <code>ServerName yourdomain.com:80</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  After making changes, save the file and exit the editor. 
 

  To apply your changes, restart Apache: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 5. Managing the Apache Service</h3>
<!-- /wp:heading -->

  Apache is controlled using the <code>systemctl</code> command. Here are a few commands to manage the Apache service: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Start Apache</strong>: <code>sudo systemctl start httpd</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Stop Apache</strong>: <code>sudo systemctl stop httpd</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Restart Apache</strong>: <code>sudo systemctl restart httpd</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Check Apache Status</strong>: <code>sudo systemctl status httpd</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 6. Configuring Firewalls for Apache</h3>
<!-- /wp:heading -->

  To make sure your server is accessible, you need to configure your firewall to allow HTTP (port 80) and HTTPS (port 443) traffic. 
 

  If you're using <code>firewalld</code>, run the following commands to open the necessary ports: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  Now, your server should be able to serve web traffic to users. 
 

<!-- wp:heading {"level":3} -->
 ### 7. Hosting a Website with Apache</h3>
<!-- /wp:heading -->

  By default, Apache serves content from the <code>/var/www/html</code> directory. To host a simple website, place your website’s files (such as HTML, CSS, and JavaScript) in this directory. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Navigate to the default web directory: <code>cd /var/www/html</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You can either create a new HTML file or upload your website files. For example, create a simple <code>index.html</code> file: <code>sudo nano index.html</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Add your website content: <code>&lt;html&gt; &lt;head&gt; &lt;title&gt;My AlmaLinux Website&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &lt;h1&gt;Welcome to my website hosted on AlmaLinux 9!&lt;/h1&gt; &lt;/body&gt; &lt;/html&gt;</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Save the file and exit. When you visit your server's IP address in a web browser, you should now see your custom web page instead of the default Apache page.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 8. Setting Up Virtual Hosts</h3>
<!-- /wp:heading -->

  Virtual hosts allow you to run multiple websites on the same server. Each website can have its own domain name, even though they share a single server and IP address. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>First, create a directory for your new website: <code>sudo mkdir /var/www/yourdomain.com</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Set permissions for this directory: <code>sudo chown -R $USER:$USER /var/www/yourdomain.com</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create a configuration file for the new site in <code>/etc/httpd/conf.d/</code>: <code>sudo nano /etc/httpd/conf.d/yourdomain.com.conf</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Add the following content to define the virtual host: <code>&lt;VirtualHost *:80&gt; ServerAdmin admin@yourdomain.com DocumentRoot /var/www/yourdomain.com ServerName yourdomain.com ErrorLog /var/log/httpd/yourdomain.com-error.log CustomLog /var/log/httpd/yourdomain.com-access.log combined &lt;/VirtualHost&gt;</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Save the file, then restart Apache: <code>sudo systemctl restart httpd</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Now, when users visit <code>yourdomain.com</code>, they will see the website hosted in the <code>/var/www/yourdomain.com</code> directory. 
 

<!-- wp:heading {"level":3} -->
 ### 9. Securing Apache with SSL (Optional)</h3>
<!-- /wp:heading -->

  To secure your Apache server with SSL, you can install a free SSL certificate from Let's Encrypt. First, install the <code>mod_ssl</code> module and the <code>certbot</code> client: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install mod_ssl
sudo dnf install certbot python3-certbot-apache</code></pre>
<!-- /wp:code -->

  Next, use Certbot to obtain and install the SSL certificate: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo certbot --apache</code></pre>
<!-- /wp:code -->

  Certbot will automatically configure SSL for your Apache server. You can verify it by visiting your website via <code>https://yourdomain.com</code>. 
 

<!-- wp:heading {"level":3} -->
 ### 10. Conclusion</h3>
<!-- /wp:heading -->

  Congratulations! You've successfully installed and configured Apache httpd on your AlmaLinux 9 server. You now have a fully functional web server capable of serving web pages. By following this guide, you’ve learned how to install Apache, configure virtual hosts, manage the Apache service, and secure your server with SSL. 
 

  Apache’s flexibility and powerful configuration options make it a great choice for hosting websites of all sizes. Whether you’re hosting a personal blog, an e-commerce site, or a large enterprise application, Apache provides the tools and capabilities to handle your needs efficiently. 
 