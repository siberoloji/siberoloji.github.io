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
date: "2024-10-04T20:15:55Z"
guid: https://www.siberoloji.com/?p=2347
id: 2347
image: /assets/images/2024/09/apache-web-server.webp
tags:
- apache web server
- how-to guides
- linux
- linux how-to
- userdir
title: 'AlmaLinux 9: How to Create Userdir on Apache Web Server'
url: /almalinux-9-how-to-create-userdir-on-apache-web-server/
---

  AlmaLinux is a powerful, stable Linux distribution, often chosen for web hosting and server management due to its similarity with CentOS. One of the most useful features you can set up on an Apache web server is ***user directories***  (UserDir). This allows individual users to host personal websites on a shared server environment without interfering with one another’s content.
 

  In this blog post, we’ll walk through the steps to enable and configure the UserDir module in Apache on AlmaLinux 9, allowing users to have their own web directories under <code>/home/username/public_html</code>. We'll cover everything from setting up the necessary modules, adjusting permissions, to configuring the server correctly to ensure proper security.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to UserDir in Apache 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Prerequisites 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 1: Install Apache on AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 2: Enable the UserDir Module 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 3: Creating User Directories 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 4: Configuring Apache for UserDir 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 5: Testing the UserDir Configuration 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Step 6: Adjusting Permissions for Security 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Introduction to UserDir in Apache
<!-- /wp:heading -->

  The ***UserDir***  feature in Apache allows each user on a system to have a personal web directory, typically located in their home folder. By default, this directory is named <code>public_html</code>, and it is accessed through a browser via a URL like:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://yourdomain.com/~username</code></pre>
<!-- /wp:code -->

  This feature is beneficial when managing shared hosting environments, where multiple users or developers may need to host individual websites on a single server. Each user’s content is stored in a separate home directory, preventing conflicts and allowing for easier organization.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. Prerequisites
<!-- /wp:heading -->

  Before we start, ensure the following requirements are met:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***AlmaLinux 9***  installed on your server. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Apache Web Server***  installed and running. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Root or sudo user privileges***  to configure the system. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Basic knowledge of terminal commands and file management. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Step 1: Install Apache on AlmaLinux 9
<!-- /wp:heading -->

  Before we can configure the UserDir feature, ensure that Apache is installed and running on your AlmaLinux 9 system.
 


 ### Installing Apache
<!-- /wp:heading -->

  If Apache is not yet installed, you can install it using the <code>dnf</code> package manager:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd</code></pre>
<!-- /wp:code -->


 ### Starting Apache
<!-- /wp:heading -->

  After installation, enable Apache to start on boot and then start the service:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd</code></pre>
<!-- /wp:code -->


 ### Verifying Apache Installation
<!-- /wp:heading -->

  You can check if Apache is running correctly by typing the following command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

  You should see an output indicating that the Apache service is active and running.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Step 2: Enable the UserDir Module
<!-- /wp:heading -->

  Apache has a built-in ***mod_userdir***  module that allows individual users to have their own directories served by Apache. To enable this, we need to ensure that the module is activated and properly configured.
 


 ### Enabling mod_userdir
<!-- /wp:heading -->

  The UserDir module should be installed by default with Apache. To confirm that it’s enabled, use the following command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install mod_userdir</code></pre>
<!-- /wp:code -->

  Next, we need to ensure that the module is loaded in the Apache configuration file. Open the configuration file for user directories, which is located at <code>/etc/httpd/conf.d/userdir.conf</code>:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf.d/userdir.conf</code></pre>
<!-- /wp:code -->

  In this file, you should see configuration directives that look something like this:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;IfModule mod_userdir.c&gt;
    UserDir public_html
    UserDir disabled root
&lt;/IfModule&gt;</code></pre>
<!-- /wp:code -->

  The <code>UserDir public_html</code> line means that users’ websites will be served from the <code>public_html</code> directory within their home directories.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 5. Step 3: Creating User Directories
<!-- /wp:heading -->

  Now that the UserDir module is enabled, we need to create directories for each user who wants to host content.
 


 ### Creating the User’s Public Directory
<!-- /wp:heading -->

  For each user, create a directory named <code>public_html</code> inside their home directory. If you don’t already have a user account set up, you can create one like this:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo useradd username</code></pre>
<!-- /wp:code -->

  Replace <code>username</code> with the actual name of the user.
 

  Next, create the <code>public_html</code> directory:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /home/username/public_html</code></pre>
<!-- /wp:code -->

  This directory is where the user will place their web content. Ensure that the ownership and permissions are set correctly:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chown username:username /home/username/public_html
sudo chmod 755 /home/username/public_html</code></pre>
<!-- /wp:code -->

  The <code>755</code> permission ensures that the web server can read the files, while the user has full control over their directory.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. Step 4: Configuring Apache for UserDir
<!-- /wp:heading -->

  We’ve set up the user directories, but now we need to make sure Apache knows how to handle them.
 


 ### Adjusting the UserDir Configuration
<!-- /wp:heading -->

  The default configuration of Apache should work for most cases, but you may want to review and customize the settings in <code>/etc/httpd/conf.d/userdir.conf</code>.
 

  Ensure that the <code>UserDir</code> directive is correctly pointing to <code>public_html</code>, as shown earlier.
 

  You may also want to disable the feature for the <code>root</code> user for security reasons, which should already be configured as follows:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">UserDir disabled root</code></pre>
<!-- /wp:code -->


 ### Restart Apache to Apply Changes
<!-- /wp:heading -->

  Once you've made changes to the configuration file, restart Apache to apply the changes:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Step 5: Testing the UserDir Configuration
<!-- /wp:heading -->

  With the configuration complete, it’s time to test the setup. Each user’s web directory should now be accessible via a URL like:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://yourdomain.com/~username</code></pre>
<!-- /wp:code -->


 ### Create an Index File
<!-- /wp:heading -->

  To test the configuration, create a simple HTML file in the <code>public_html</code> directory of a user. For example:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nano /home/username/public_html/index.html</code></pre>
<!-- /wp:code -->

  Add the following content:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
    &lt;title&gt;Test UserDir&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;h1&gt;Welcome to UserDir for username&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
<!-- /wp:code -->

  Save the file, then navigate to <code>http://yourdomain.com/~username</code> in your browser. If everything is configured correctly, you should see the test HTML page.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 8. Step 6: Adjusting Permissions for Security
<!-- /wp:heading -->


 ### Set Directory Permissions
<!-- /wp:heading -->

  While the <code>public_html</code> directory is set to <code>755</code>, it’s crucial that other files within the user’s home directory have the appropriate permissions to maintain security. Ensure the following permissions:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- The user’s home directory should have the permissions set to <code>711</code>, so others can access the <code>public_html</code> directory, but not view the contents of the home directory itself: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chmod 711 /home/username</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Any files inside the <code>public_html</code> directory should be readable by Apache, so set permissions for files and subdirectories appropriately: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chmod 644 /home/username/public_html/*</code></pre>
<!-- /wp:code -->

  This ensures that files can be read by the web server but not modified by unauthorized users.
 


 ### Protecting Other User Directories
<!-- /wp:heading -->

  It’s important to ensure that users cannot access each other’s files. The permissions we've set ensure that users have restricted access to home directories while allowing public access to <code>public_html</code>. However, always review your system’s security configuration to prevent privilege escalation.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 9. Conclusion
<!-- /wp:heading -->

  Enabling the ***UserDir***  feature in Apache on AlmaLinux 9 allows individual users to host their own websites in a shared hosting environment. With just a few steps, we installed Apache, enabled the UserDir module, created user directories, configured permissions, and tested the setup.
 

  This configuration is ideal for multi-user environments, web hosting companies, or development teams working on the same server. The setup offers flexibility while keeping the system secure, as users can manage their own content independently.
 

  By following this guide, you now have a fully functional UserDir setup on Apache, giving users the ability to host personal web pages on your server.
 