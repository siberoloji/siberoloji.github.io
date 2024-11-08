---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
date: "2024-11-02T13:13:14Z"
excerpt: In this tutorial, we'll walk through configuring a WebDAV folder on AlmaLinux
  9, one of the latest and most popular RHEL-based distributions.
guid: https://www.siberoloji.com/?p=5850
id: 5850
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
title: How to Configure a WebDAV Folder on AlmaLinux 9?
url: /how-to-configure-a-webdav-folder-on-almalinux-9/
---

<!-- wp:jetpack/markdown {"source":"Web Distributed Authoring and Versioning (WebDAV) is a protocol that enables web users to manage files on a server just as if they were stored locally on their machine. WebDAV is useful in various scenarios, from collaborative file management to simple web-based file storage. In this tutorial, we'll walk through configuring a WebDAV folder on AlmaLinux 9, one of the latest and most popular RHEL-based distributions.\n\n### 1. Introduction to WebDAV\n\nWebDAV is a protocol that enhances the HTTP standard to allow users to edit and manage files on a remote server. This capability is often used for content management and collaborative projects. It integrates easily with various operating systems, making it a flexible choice for network-based file storage and management.\n\n\u002d\u002d-\n\n### 2. Prerequisites\n\nBefore starting, ensure you have the following:\n- **AlmaLinux 9**: Installed and configured with root or sudo privileges.\n- **Apache HTTP Server**: As WebDAV uses HTTP, Apache is required for this setup.\n- **Open Ports**: Port 80 (HTTP) or 443 (HTTPS) should be open.\n- **Basic Networking Knowledge**: Familiarity with basic Linux commands and networking is beneficial.\n\n\u002d\u002d-\n\n### 3. Install Apache and WebDAV Modules\n\nTo set up WebDAV, you first need to install Apache and enable WebDAV-related modules. Follow these steps:\n\n#### Step 1: Update System Packages\nIt's always good practice to update your system packages before making installations.\n\n```bash\nsudo dnf update -y\n```\n\n#### Step 2: Install Apache Web Server\nTo install Apache, run:\n\n```bash\nsudo dnf install httpd -y\n```\n\n#### Step 3: Enable and Start Apache Service\nOnce installed, enable and start the Apache service.\n\n```bash\nsudo systemctl enable httpd\nsudo systemctl start httpd\n```\n\n#### Step 4: Install WebDAV Modules\nWebDAV functionality in Apache is supported through two main modules, `dav` and `dav_fs`. These modules are usually included by default in Apache installations. To install them, run:\n\n```bash\nsudo dnf install mod_dav mod_dav_fs -y\n```\n\nYou can verify that the modules are loaded by checking Apache’s configuration file, typically located in `/etc/httpd/conf/httpd.conf`.\n\n\u002d\u002d-\n\n### 4. Configure WebDAV Directory\n\nNext, we need to configure the directory on the server where files will be stored and accessed.\n\n#### Step 1: Create the WebDAV Directory\nCreate a new directory to serve as the WebDAV folder.\n\n```bash\nsudo mkdir -p /var/www/html/webdav\n```\n\n#### Step 2: Set Permissions\nSet appropriate permissions for the directory. You can choose who can read and write by adjusting permissions or creating a dedicated user group.\n\n```bash\nsudo chown -R apache:apache /var/www/html/webdav\nsudo chmod -R 755 /var/www/html/webdav\n```\n\n#### Step 3: Configure the WebDAV Directory in Apache\nAdd configuration to allow WebDAV access to the directory.\n\n1. Open Apache’s configuration file or create a new configuration file specifically for WebDAV:\n\n   ```bash\n   sudo nano /etc/httpd/conf.d/webdav.conf\n   ```\n\n2. Add the following configuration:\n\n   ```apache\n   \n       Dav On\n       Options Indexes FollowSymLinks\n       AllowOverride None\n       Require valid-user\n   \n\n   Alias /webdav /var/www/html/webdav\n   ```\n\nThis configuration enables WebDAV on the `/webdav` directory and requires authentication.\n\n\u002d\u002d-\n\n### 5. Setting Up Authentication\n\nTo restrict access, configure basic authentication for WebDAV.\n\n#### Step 1: Install `httpd-tools`\nInstall the `httpd-tools` package, which includes the `htpasswd` utility for creating password files.\n\n```bash\nsudo dnf install httpd-tools -y\n```\n\n#### Step 2: Create a Password File\nCreate a password file for WebDAV authentication.\n\n```bash\nsudo htpasswd -c /etc/httpd/.htpasswd webdav_user\n```\n\nEnter a password when prompted. To add more users, omit the `-c` flag:\n\n```bash\nsudo htpasswd /etc/httpd/.htpasswd another_user\n```\n\n#### Step 3: Update Apache Configuration for Authentication\nIn your `webdav.conf` file, add the following lines within the `` block:\n\n```apache\nAuthType Basic\nAuthName \u0022Restricted WebDAV Folder\u0022\nAuthUserFile /etc/httpd/.htpasswd\nRequire valid-user\n```\n\nSave and close the file.\n\n#### Step 4: Restart Apache\nTo apply the changes, restart Apache:\n\n```bash\nsudo systemctl restart httpd\n```\n\n\u002d\u002d-\n\n### 6. Configuring Firewall Rules\n\nIf your firewall is active, ensure that Apache traffic is allowed.\n\n```bash\nsudo firewall-cmd \u002d\u002dpermanent \u002d\u002dadd-service=http\nsudo firewall-cmd \u002d\u002dpermanent \u002d\u002dadd-service=https\nsudo firewall-cmd \u002d\u002dreload\n```\n\n\u002d\u002d-\n\n### 7. Testing WebDAV Configuration\n\nTo test if WebDAV is functioning properly, open a web browser and navigate to `http://your-server-ip/webdav`. You should be prompted for a username and password. Enter the credentials set up in the `.htpasswd` file.\n\nIf access is successful, your WebDAV setup is working!\n\n\u002d\u002d-\n\n### 8. Mounting the WebDAV Folder\n\nOnce WebDAV is set up, you can mount the folder on various operating systems. Here’s how to do it on a few popular systems.\n\n#### On Linux\nYou can mount a WebDAV share in Linux using the `davfs2` package.\n\n1. Install `davfs2`:\n\n   ```bash\n   sudo dnf install davfs2 -y\n   ```\n\n2. Mount the WebDAV folder:\n\n   ```bash\n   sudo mount -t davfs http://your-server-ip/webdav /mnt/webdav\n   ```\n\n#### On Windows\n1. Open File Explorer.\n2. Right-click on “This PC” and select “Map network drive.”\n3. In the Folder field, type: `http://your-server-ip/webdav`.\n4. Enter your WebDAV username and password when prompted.\n\n#### On macOS\n1. In Finder, press `Cmd + K`.\n2. Enter the WebDAV URL: `http://your-server-ip/webdav`.\n3. Click “Connect” and enter your WebDAV credentials.\n\n\u002d\u002d-\n\n### 9. Troubleshooting Tips\n\nIf you encounter issues, try these troubleshooting tips:\n\n- **Check Apache Error Logs**: Use `sudo tail -f /var/log/httpd/error_log` to view Apache logs for possible configuration errors.\n- **Verify File Permissions**: Ensure the `apache` user has permissions to the WebDAV directory.\n- **Ensure Correct URL**: Make sure the URL path is correct, especially when connecting from different operating systems.\n- **Firewall Settings**: Confirm that firewall rules are applied correctly.\n\n\u002d\u002d-\n\n### 10. Conclusion\n\nConfiguring a WebDAV folder on AlmaLinux 9 is straightforward with Apache and a few additional configurations. WebDAV enables remote file management, enhancing collaboration and file accessibility. By following this guide, you should now have a secure and functional WebDAV setup on your AlmaLinux server.\n\nWebDAV offers a practical solution for shared file management, and with proper configuration, it can be a powerful tool for businesses and individual users alike."} -->
<div class="wp-block-jetpack-markdown"> Web Distributed Authoring and Versioning (WebDAV) is a protocol that enables web users to manage files on a server just as if they were stored locally on their machine. WebDAV is useful in various scenarios, from collaborative file management to simple web-based file storage. In this tutorial, we’ll walk through configuring a WebDAV folder on AlmaLinux 9, one of the latest and most popular RHEL-based distributions. 
<h3>1. Introduction to WebDAV</h3>
 WebDAV is a protocol that enhances the HTTP standard to allow users to edit and manage files on a remote server. This capability is often used for content management and collaborative projects. It integrates easily with various operating systems, making it a flexible choice for network-based file storage and management. 
<hr>
<h3>2. Prerequisites</h3>
 Before starting, ensure you have the following: 
<ul>
<li><strong>AlmaLinux 9</strong>: Installed and configured with root or sudo privileges.</li>
<li><strong>Apache HTTP Server</strong>: As WebDAV uses HTTP, Apache is required for this setup.</li>
<li><strong>Open Ports</strong>: Port 80 (HTTP) or 443 (HTTPS) should be open.</li>
<li><strong>Basic Networking Knowledge</strong>: Familiarity with basic Linux commands and networking is beneficial.</li>
</ul>
<hr>
<h3>3. Install Apache and WebDAV Modules</h3>
 To set up WebDAV, you first need to install Apache and enable WebDAV-related modules. Follow these steps: 
<h4>Step 1: Update System Packages</h4>
 It’s always good practice to update your system packages before making installations. 
<pre><code class="language-bash">sudo dnf update -y
</code></pre>
<h4>Step 2: Install Apache Web Server</h4>
 To install Apache, run: 
<pre><code class="language-bash">sudo dnf install httpd -y
</code></pre>
<h4>Step 3: Enable and Start Apache Service</h4>
 Once installed, enable and start the Apache service. 
<pre><code class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd
</code></pre>
<h4>Step 4: Install WebDAV Modules</h4>
 WebDAV functionality in Apache is supported through two main modules, <code>dav</code> and <code>dav_fs</code>. These modules are usually included by default in Apache installations. To install them, run: 
<pre><code class="language-bash">sudo dnf install mod_dav mod_dav_fs -y
</code></pre>
 You can verify that the modules are loaded by checking Apache’s configuration file, typically located in <code>/etc/httpd/conf/httpd.conf</code>. 
<hr>
<h3>4. Configure WebDAV Directory</h3>
 Next, we need to configure the directory on the server where files will be stored and accessed. 
<h4>Step 1: Create the WebDAV Directory</h4>
 Create a new directory to serve as the WebDAV folder. 
<pre><code class="language-bash">sudo mkdir -p /var/www/html/webdav
</code></pre>
<h4>Step 2: Set Permissions</h4>
 Set appropriate permissions for the directory. You can choose who can read and write by adjusting permissions or creating a dedicated user group. 
<pre><code class="language-bash">sudo chown -R apache:apache /var/www/html/webdav
sudo chmod -R 755 /var/www/html/webdav
</code></pre>
<h4>Step 3: Configure the WebDAV Directory in Apache</h4>
 Add configuration to allow WebDAV access to the directory. 
<ol>
<li>
 Open Apache’s configuration file or create a new configuration file specifically for WebDAV: 
<pre><code class="language-bash">sudo nano /etc/httpd/conf.d/webdav.conf
</code></pre>
</li>
<li>
 Add the following configuration: 
<pre><code class="language-apache">&lt;Directory /var/www/html/webdav&gt;
    Dav On
    Options Indexes FollowSymLinks
    AllowOverride None
    Require valid-user
&lt;/Directory&gt;

Alias /webdav /var/www/html/webdav
</code></pre>
</li>
</ol>
 This configuration enables WebDAV on the <code>/webdav</code> directory and requires authentication. 
<hr>
<h3>5. Setting Up Authentication</h3>
 To restrict access, configure basic authentication for WebDAV. 
<h4>Step 1: Install <code>httpd-tools</code></h4>
 Install the <code>httpd-tools</code> package, which includes the <code>htpasswd</code> utility for creating password files. 
<pre><code class="language-bash">sudo dnf install httpd-tools -y
</code></pre>
<h4>Step 2: Create a Password File</h4>
 Create a password file for WebDAV authentication. 
<pre><code class="language-bash">sudo htpasswd -c /etc/httpd/.htpasswd webdav_user
</code></pre>
 Enter a password when prompted. To add more users, omit the <code>-c</code> flag: 
<pre><code class="language-bash">sudo htpasswd /etc/httpd/.htpasswd another_user
</code></pre>
<h4>Step 3: Update Apache Configuration for Authentication</h4>
 In your <code>webdav.conf</code> file, add the following lines within the <code>&lt;Directory&gt;</code> block: 
<pre><code class="language-apache">AuthType Basic
AuthName &quot;Restricted WebDAV Folder&quot;
AuthUserFile /etc/httpd/.htpasswd
Require valid-user
</code></pre>
 Save and close the file. 
<h4>Step 4: Restart Apache</h4>
 To apply the changes, restart Apache: 
<pre><code class="language-bash">sudo systemctl restart httpd
</code></pre>
<hr>
<h3>6. Configuring Firewall Rules</h3>
 If your firewall is active, ensure that Apache traffic is allowed. 
<pre><code class="language-bash">sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
</code></pre>
<hr>
<h3>7. Testing WebDAV Configuration</h3>
 To test if WebDAV is functioning properly, open a web browser and navigate to <code>http://your-server-ip/webdav</code>. You should be prompted for a username and password. Enter the credentials set up in the <code>.htpasswd</code> file. 
 If access is successful, your WebDAV setup is working! 
<hr>
<h3>8. Mounting the WebDAV Folder</h3>
 Once WebDAV is set up, you can mount the folder on various operating systems. Here’s how to do it on a few popular systems. 
<h4>On Linux</h4>
 You can mount a WebDAV share in Linux using the <code>davfs2</code> package. 
<ol>
<li>
 Install <code>davfs2</code>: 
<pre><code class="language-bash">sudo dnf install davfs2 -y
</code></pre>
</li>
<li>
 Mount the WebDAV folder: 
<pre><code class="language-bash">sudo mount -t davfs http://your-server-ip/webdav /mnt/webdav
</code></pre>
</li>
</ol>
<h4>On Windows</h4>
<ol>
<li>Open File Explorer.</li>
<li>Right-click on “This PC” and select “Map network drive.”</li>
<li>In the Folder field, type: <code>http://your-server-ip/webdav</code>.</li>
<li>Enter your WebDAV username and password when prompted.</li>
</ol>
<h4>On macOS</h4>
<ol>
<li>In Finder, press <code>Cmd + K</code>.</li>
<li>Enter the WebDAV URL: <code>http://your-server-ip/webdav</code>.</li>
<li>Click “Connect” and enter your WebDAV credentials.</li>
</ol>
<hr>
<h3>9. Troubleshooting Tips</h3>
 If you encounter issues, try these troubleshooting tips: 
<ul>
<li><strong>Check Apache Error Logs</strong>: Use <code>sudo tail -f /var/log/httpd/error_log</code> to view Apache logs for possible configuration errors.</li>
<li><strong>Verify File Permissions</strong>: Ensure the <code>apache</code> user has permissions to the WebDAV directory.</li>
<li><strong>Ensure Correct URL</strong>: Make sure the URL path is correct, especially when connecting from different operating systems.</li>
<li><strong>Firewall Settings</strong>: Confirm that firewall rules are applied correctly.</li>
</ul>
<hr>
<h3>10. Conclusion</h3>
 Configuring a WebDAV folder on AlmaLinux 9 is straightforward with Apache and a few additional configurations. WebDAV enables remote file management, enhancing collaboration and file accessibility. By following this guide, you should now have a secure and functional WebDAV setup on your AlmaLinux server. 
 WebDAV offers a practical solution for shared file management, and with proper configuration, it can be a powerful tool for businesses and individual users alike. 
</div>
<!-- /wp:jetpack/markdown -->