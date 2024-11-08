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

  AlmaLinux is a powerful, stable Linux distribution, often chosen for web hosting and server management due to its similarity with CentOS. One of the most useful features you can set up on an Apache web server is <strong>user directories</strong> (UserDir). This allows individual users to host personal websites on a shared server environment without interfering with one another’s content.</p>
 

  In this blog post, we’ll walk through the steps to enable and configure the UserDir module in Apache on AlmaLinux 9, allowing users to have their own web directories under <code>/home/username/public_html</code>. We'll cover everything from setting up the necessary modules, adjusting permissions, to configuring the server correctly to ensure proper security.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to UserDir in Apache</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Prerequisites</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 1: Install Apache on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 2: Enable the UserDir Module</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 3: Creating User Directories</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 4: Configuring Apache for UserDir</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 5: Testing the UserDir Configuration</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Step 6: Adjusting Permissions for Security</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Introduction to UserDir in Apache</h2>
<!-- /wp:heading -->

  The <strong>UserDir</strong> feature in Apache allows each user on a system to have a personal web directory, typically located in their home folder. By default, this directory is named <code>public_html</code>, and it is accessed through a browser via a URL like:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://yourdomain.com/~username</code></pre>
<!-- /wp:code -->

  This feature is beneficial when managing shared hosting environments, where multiple users or developers may need to host individual websites on a single server. Each user’s content is stored in a separate home directory, preventing conflicts and allowing for easier organization.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. Prerequisites</h2>
<!-- /wp:heading -->

  Before we start, ensure the following requirements are met:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>AlmaLinux 9</strong> installed on your server.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Apache Web Server</strong> installed and running.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Root or sudo user privileges</strong> to configure the system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Basic knowledge of terminal commands and file management.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Step 1: Install Apache on AlmaLinux 9</h2>
<!-- /wp:heading -->

  Before we can configure the UserDir feature, ensure that Apache is installed and running on your AlmaLinux 9 system.</p>
 

<!-- wp:heading {"level":3} -->
 ### Installing Apache</h3>
<!-- /wp:heading -->

  If Apache is not yet installed, you can install it using the <code>dnf</code> package manager:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Starting Apache</h3>
<!-- /wp:heading -->

  After installation, enable Apache to start on boot and then start the service:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Verifying Apache Installation</h3>
<!-- /wp:heading -->

  You can check if Apache is running correctly by typing the following command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status httpd</code></pre>
<!-- /wp:code -->

  You should see an output indicating that the Apache service is active and running.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Step 2: Enable the UserDir Module</h2>
<!-- /wp:heading -->

  Apache has a built-in <strong>mod_userdir</strong> module that allows individual users to have their own directories served by Apache. To enable this, we need to ensure that the module is activated and properly configured.</p>
 

<!-- wp:heading {"level":3} -->
 ### Enabling mod_userdir</h3>
<!-- /wp:heading -->

  The UserDir module should be installed by default with Apache. To confirm that it’s enabled, use the following command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install mod_userdir</code></pre>
<!-- /wp:code -->

  Next, we need to ensure that the module is loaded in the Apache configuration file. Open the configuration file for user directories, which is located at <code>/etc/httpd/conf.d/userdir.conf</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf.d/userdir.conf</code></pre>
<!-- /wp:code -->

  In this file, you should see configuration directives that look something like this:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">&lt;IfModule mod_userdir.c&gt;
    UserDir public_html
    UserDir disabled root
&lt;/IfModule&gt;</code></pre>
<!-- /wp:code -->

  The <code>UserDir public_html</code> line means that users’ websites will be served from the <code>public_html</code> directory within their home directories.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 5. Step 3: Creating User Directories</h2>
<!-- /wp:heading -->

  Now that the UserDir module is enabled, we need to create directories for each user who wants to host content.</p>
 

<!-- wp:heading {"level":3} -->
 ### Creating the User’s Public Directory</h3>
<!-- /wp:heading -->

  For each user, create a directory named <code>public_html</code> inside their home directory. If you don’t already have a user account set up, you can create one like this:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo useradd username</code></pre>
<!-- /wp:code -->

  Replace <code>username</code> with the actual name of the user.</p>
 

  Next, create the <code>public_html</code> directory:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /home/username/public_html</code></pre>
<!-- /wp:code -->

  This directory is where the user will place their web content. Ensure that the ownership and permissions are set correctly:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chown username:username /home/username/public_html
sudo chmod 755 /home/username/public_html</code></pre>
<!-- /wp:code -->

  The <code>755</code> permission ensures that the web server can read the files, while the user has full control over their directory.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. Step 4: Configuring Apache for UserDir</h2>
<!-- /wp:heading -->

  We’ve set up the user directories, but now we need to make sure Apache knows how to handle them.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adjusting the UserDir Configuration</h3>
<!-- /wp:heading -->

  The default configuration of Apache should work for most cases, but you may want to review and customize the settings in <code>/etc/httpd/conf.d/userdir.conf</code>.</p>
 

  Ensure that the <code>UserDir</code> directive is correctly pointing to <code>public_html</code>, as shown earlier.</p>
 

  You may also want to disable the feature for the <code>root</code> user for security reasons, which should already be configured as follows:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">UserDir disabled root</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Restart Apache to Apply Changes</h3>
<!-- /wp:heading -->

  Once you've made changes to the configuration file, restart Apache to apply the changes:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Step 5: Testing the UserDir Configuration</h2>
<!-- /wp:heading -->

  With the configuration complete, it’s time to test the setup. Each user’s web directory should now be accessible via a URL like:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">http://yourdomain.com/~username</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Create an Index File</h3>
<!-- /wp:heading -->

  To test the configuration, create a simple HTML file in the <code>public_html</code> directory of a user. For example:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nano /home/username/public_html/index.html</code></pre>
<!-- /wp:code -->

  Add the following content:</p>
 

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

  Save the file, then navigate to <code>http://yourdomain.com/~username</code> in your browser. If everything is configured correctly, you should see the test HTML page.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 8. Step 6: Adjusting Permissions for Security</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Set Directory Permissions</h3>
<!-- /wp:heading -->

  While the <code>public_html</code> directory is set to <code>755</code>, it’s crucial that other files within the user’s home directory have the appropriate permissions to maintain security. Ensure the following permissions:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>The user’s home directory should have the permissions set to <code>711</code>, so others can access the <code>public_html</code> directory, but not view the contents of the home directory itself:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chmod 711 /home/username</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Any files inside the <code>public_html</code> directory should be readable by Apache, so set permissions for files and subdirectories appropriately:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chmod 644 /home/username/public_html/*</code></pre>
<!-- /wp:code -->

  This ensures that files can be read by the web server but not modified by unauthorized users.</p>
 

<!-- wp:heading {"level":3} -->
 ### Protecting Other User Directories</h3>
<!-- /wp:heading -->

  It’s important to ensure that users cannot access each other’s files. The permissions we've set ensure that users have restricted access to home directories while allowing public access to <code>public_html</code>. However, always review your system’s security configuration to prevent privilege escalation.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 9. Conclusion</h2>
<!-- /wp:heading -->

  Enabling the <strong>UserDir</strong> feature in Apache on AlmaLinux 9 allows individual users to host their own websites in a shared hosting environment. With just a few steps, we installed Apache, enabled the UserDir module, created user directories, configured permissions, and tested the setup.</p>
 

  This configuration is ideal for multi-user environments, web hosting companies, or development teams working on the same server. The setup offers flexibility while keeping the system secure, as users can manage their own content independently.</p>
 

  By following this guide, you now have a fully functional UserDir setup on Apache, giving users the ability to host personal web pages on your server.</p>
 