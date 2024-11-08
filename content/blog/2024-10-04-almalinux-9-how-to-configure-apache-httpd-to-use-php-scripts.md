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
date: "2024-10-04T20:38:28Z"
guid: https://www.siberoloji.com/?p=2350
id: 2350
image: /assets/images/2024/09/apache-web-server.webp
tags:
- apache web server
- how-to guides
- linux
- linux how-to
- php
title: 'AlmaLinux 9: How to Configure Apache (httpd) to Use PHP Scripts'
url: /almalinux-9-how-to-configure-apache-httpd-to-use-php-scripts/
---

  PHP is one of the most widely used server-side scripting languages for building dynamic websites and web applications. Running PHP scripts on an Apache web server is a common setup in the LAMP (Linux, Apache, MySQL, PHP) stack. AlmaLinux 9, a powerful and stable RHEL-based Linux distribution, is ideal for this setup. 
 

  In this detailed guide, we’ll cover how to configure Apache (<code>httpd</code>) on AlmaLinux 9 to use PHP scripts. This includes installing and configuring both Apache and PHP, verifying that they work together, and setting up some basic PHP scripts to test the configuration. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to PHP and Apache</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Prerequisites</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 1: Installing Apache and PHP on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 2: Configuring Apache to Use PHP</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 3: Testing PHP with Apache</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 4: Configuring PHP for Optimal Performance</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 5: Securing Your PHP Installation</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Introduction to PHP and Apache</h2>
<!-- /wp:heading -->

  Apache, also known as <code>httpd</code>, is one of the most popular web servers in the world, and PHP is a highly versatile scripting language that can be embedded into HTML. When these two technologies are combined, Apache serves the web pages while PHP processes any server-side scripts within them. 
 

  Configuring Apache to use PHP scripts involves installing both Apache and PHP, ensuring that Apache recognizes and properly executes PHP scripts, and adjusting configurations to ensure secure and efficient operation. 
 

  In this tutorial, we’ll guide you step by step to set up and configure Apache to use PHP scripts on AlmaLinux 9. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. Prerequisites</h2>
<!-- /wp:heading -->

  Before you start, make sure you meet the following requirements: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>AlmaLinux 9</strong> installed on your system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Root or sudo access</strong> to configure Apache and PHP.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A basic understanding of how to use the Linux terminal.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Step 1: Installing Apache and PHP on AlmaLinux 9</h2>
<!-- /wp:heading -->

  The first step in configuring Apache to use PHP is to install both Apache and PHP. These packages are available in the AlmaLinux 9 repository and can be installed using the <code>dnf</code> package manager. 
 

<!-- wp:heading {"level":3} -->
 ### Install Apache</h3>
<!-- /wp:heading -->

  To install Apache, run the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd</code></pre>
<!-- /wp:code -->

  After installation, enable and start the Apache service: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

  You can verify that Apache is running with this command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Install PHP</h3>
<!-- /wp:heading -->

  Next, install PHP along with some common PHP extensions. The basic PHP package includes the core functionality, but many applications and frameworks require additional extensions. You can install PHP and its commonly used extensions using the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install php php-mysqlnd php-pdo php-gd php-mbstring php-xml php-json</code></pre>
<!-- /wp:code -->

  Here’s a breakdown of the PHP packages installed: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>php</strong>: The core PHP package.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-mysqlnd</strong>: The MySQL driver for PHP.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-pdo</strong>: The PHP Data Objects (PDO) extension.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-gd</strong>: PHP support for image processing.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-mbstring</strong>: Provides multibyte string support in PHP.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-xml</strong>: PHP support for XML processing.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>php-json</strong>: PHP support for working with JSON data.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Once PHP is installed, restart the Apache service to load the PHP module: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Step 2: Configuring Apache to Use PHP</h2>
<!-- /wp:heading -->

  Once Apache and PHP are installed, you need to configure Apache to handle PHP files correctly. This is done by ensuring that Apache can recognize PHP files, pass them to the PHP interpreter, and then return the output to the client (browser). 
 

<!-- wp:heading {"level":3} -->
 ### Check PHP Module for Apache</h3>
<!-- /wp:heading -->

  The PHP module should have been installed and enabled automatically with the <code>php</code> package. You can confirm that PHP support is loaded by checking the Apache configuration files. 
 

  Open the Apache configuration file located at <code>/etc/httpd/conf/httpd.conf</code> to check for PHP module configuration: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  Ensure that the following lines exist in the file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">LoadModule php_module modules/libphp.so
AddHandler php-script .php
DirectoryIndex index.php index.html</code></pre>
<!-- /wp:code -->

  These lines ensure that Apache loads the PHP module and treats files with the <code>.php</code> extension as PHP scripts. 
 

<!-- wp:heading {"level":3} -->
 ### Test the PHP Configuration</h3>
<!-- /wp:heading -->

  To verify that PHP is properly integrated with Apache, create a simple PHP file in the web root directory. The default document root for Apache on AlmaLinux is <code>/var/www/html</code>. 
 

  Create a PHP test file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /var/www/html/info.php</code></pre>
<!-- /wp:code -->

  Add the following PHP code to the file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;?php
phpinfo();
?&gt;</code></pre>
<!-- /wp:code -->

  This script will display detailed information about your PHP installation. 
 

  Save and close the file, then open a web browser and navigate to the following URL: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://your-server-ip/info.php</code></pre>
<!-- /wp:code -->

  You should see a PHP information page showing details about your PHP installation, including loaded modules, configuration settings, and environment variables. If this page loads, it means PHP is working correctly with Apache. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 5. Step 3: Testing PHP with Apache</h2>
<!-- /wp:heading -->

  To further confirm that PHP is working with Apache, you can create another PHP script that outputs dynamic content. 
 

  Create another PHP file in the document root: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /var/www/html/test.php</code></pre>
<!-- /wp:code -->

  Add the following PHP code: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;?php
echo "Hello, AlmaLinux! PHP is working on Apache.";
?&gt;</code></pre>
<!-- /wp:code -->

  Save the file and access it in your browser at: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://your-server-ip/test.php</code></pre>
<!-- /wp:code -->

  If the PHP script works correctly, you should see the message: "Hello, AlmaLinux! PHP is working on Apache." 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. Step 4: Configuring PHP for Optimal Performance</h2>
<!-- /wp:heading -->

  Now that PHP is functioning, it’s important to configure it for optimal performance. AlmaLinux uses PHP 7 or later, which includes several improvements in performance and memory usage, but there are still a few settings you can adjust to get the most out of your server. 
 

<!-- wp:heading {"level":3} -->
 ### Adjust PHP Settings</h3>
<!-- /wp:heading -->

  The PHP configuration file is located at <code>/etc/php.ini</code>. Open this file in a text editor: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/php.ini</code></pre>
<!-- /wp:code -->

  Here are some important PHP settings you may want to tweak: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Memory Limit</strong>: Defines the maximum amount of memory a PHP script is allowed to use. You can increase this value based on your server resources. For example:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  memory_limit = 256M</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Upload File Size</strong>: Defines the maximum allowed size for file uploads. If you’re running applications that handle file uploads, such as a CMS, you may need to increase this value:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  upload_max_filesize = 20M
  post_max_size = 20M</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Max Execution Time</strong>: Specifies the maximum time in seconds a PHP script is allowed to run before it is terminated. This can help prevent poorly written scripts from using up server resources:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  max_execution_time = 60</code></pre>
<!-- /wp:code -->

  After making any changes, save the file and restart Apache: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Opcode Caching</h3>
<!-- /wp:heading -->

  PHP includes a built-in <strong>opcode cache</strong> called <strong>OPcache</strong> that speeds up script execution by storing precompiled script bytecode in memory. To check if OPcache is enabled, look for it in the output of the <code>phpinfo()</code> function (from the <code>info.php</code> file we created earlier). 
 

  If it’s not enabled, you can enable it in the <code>/etc/php.d/10-opcache.ini</code> file. Set the following options to enable and configure OPcache: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60</code></pre>
<!-- /wp:code -->

  Restart Apache again to apply the changes: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Step 5: Securing Your PHP Installation</h2>
<!-- /wp:heading -->

  Running PHP scripts can expose your server to potential vulnerabilities if not properly secured. Here are some tips to help secure your PHP environment: 
 

<!-- wp:heading {"level":3} -->
 ### Disable Unnecessary Functions</h3>
<!-- /wp:heading -->

  Many PHP installations enable potentially dangerous functions by default. These functions can be disabled to reduce the risk of exploitation. Open the <code>/etc/php.ini</code> file and find the <code>disable_functions</code> directive. Add the following functions to the list to disable them: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">disable_functions = exec,passthru,shell_exec,system,proc_open,popen,curl_exec,curl_multi_exec</code></pre>
<!-- /wp:code -->

  This will prevent these functions from being used in PHP scripts. 
 

<!-- wp:heading {"level":3} -->
 ### Hide PHP Version</h3>
<!-- /wp:heading -->

  By default, PHP exposes its version number in HTTP headers and error messages. To disable this, set the following directive in <code>/etc/php.ini</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">expose_php = Off</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Enable Error Logging</h3>
<!-- /wp:heading -->

  Instead of displaying errors on web pages (which could expose sensitive information to attackers), log errors to a file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">log_errors = On
error_log = /var/log/php_errors.log</code></pre>
<!-- /wp:code -->

  Make sure the log file is only accessible by root: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo touch /var/log/php_errors.log
sudo chown root:root /var/log/php_errors.log
sudo chmod 600 /var/log/php_errors.log</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 8. Conclusion</h2>
<!-- /wp:heading -->

  Configuring Apache to use PHP on AlmaLinux 9 is an essential step in setting up a powerful 
 

  web server capable of hosting dynamic web applications. In this guide, we covered how to install Apache and PHP, configure Apache to use PHP scripts, and optimize PHP for better performance and security. 
 

  With Apache and PHP working together, you’re ready to deploy web applications, content management systems like WordPress, or any custom PHP-based web project. Following the best practices in performance tuning and security will ensure that your server remains efficient and secure. 
 

  By completing these steps, you now have a fully functioning LAMP (Linux, Apache, MySQL, PHP) stack on AlmaLinux 9! 
 