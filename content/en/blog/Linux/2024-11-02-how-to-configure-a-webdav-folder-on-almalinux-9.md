---
draft: false
title: How to Configure a WebDAV Folder on AlmaLinux 9?
date: 2024-11-02T13:13:14+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this tutorial, well walk through configuring a WebDAV folder on AlmaLinux 9, one of the latest and most popular RHEL-based distributions.
url: /how-to-configure-a-webdav-folder-on-almalinux-9/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
---

<!-- wp:jetpack/markdown {"source":"Web Distributed Authoring and Versioning (WebDAV) is a protocol that enables web users to manage files on a server just as if they were stored locally on their machine. WebDAV is useful in various scenarios, from collaborative file management to simple web-based file storage. In this tutorial, we'll walk through configuring a WebDAV folder on AlmaLinux 9, one of the latest and most popular RHEL-based distributions. 
### 1. Introduction to WebDAV 
WebDAV is a protocol that enhances the HTTP standard to allow users to edit and manage files on a remote server. This capability is often used for content management and collaborative projects. It integrates easily with various operating systems, making it a flexible choice for network-based file storage and management. 
 
### 2. Prerequisites 
Before starting, ensure you have the following: - **AlmaLinux 9**: Installed and configured with root or sudo privileges. - **Apache HTTP Server**: As WebDAV uses HTTP, Apache is required for this setup. - **Open Ports**: Port 80 (HTTP) or 443 (HTTPS) should be open. - **Basic Networking Knowledge**: Familiarity with basic Linux commands and networking is beneficial. 
 
### 3. Install Apache and WebDAV Modules 
To set up WebDAV, you first need to install Apache and enable WebDAV-related modules. Follow these steps: 
#### Step 1: Update System Packages It's always good practice to update your system packages before making installations. 

```bash sudo dnf update -y 
``` 
#### Step 2: Install Apache Web Server To install Apache, run: 

```bash sudo dnf install httpd -y 
``` 
#### Step 3: Enable and Start Apache Service Once installed, enable and start the Apache service. 

```bash sudo systemctl enable httpd sudo systemctl start httpd 
``` 
#### Step 4: Install WebDAV Modules WebDAV functionality in Apache is supported through two main modules, `dav` and `dav_fs`. These modules are usually included by default in Apache installations. To install them, run: 

```bash sudo dnf install mod_dav mod_dav_fs -y 
``` 
You can verify that the modules are loaded by checking Apache’s configuration file, typically located in `/etc/httpd/conf/httpd.conf`. 
 
### 4. Configure WebDAV Directory 
Next, we need to configure the directory on the server where files will be stored and accessed. 
#### Step 1: Create the WebDAV Directory Create a new directory to serve as the WebDAV folder. 

```bash sudo mkdir -p /var/www/html/webdav 
``` 
#### Step 2: Set Permissions Set appropriate permissions for the directory. You can choose who can read and write by adjusting permissions or creating a dedicated user group. 

```bash sudo chown -R apache:apache /var/www/html/webdav sudo chmod -R 755 /var/www/html/webdav 
``` 
#### Step 3: Configure the WebDAV Directory in Apache Add configuration to allow WebDAV access to the directory. 
1. Open Apache’s configuration file or create a new configuration file specifically for WebDAV: 
   ```bash    sudo nano /etc/httpd/conf.d/webdav.conf    ``` 
2. Add the following configuration: 
   ```apache            Dav On        Options Indexes FollowSymLinks        AllowOverride None        Require valid-user     
   Alias /webdav /var/www/html/webdav    ``` 
This configuration enables WebDAV on the `/webdav` directory and requires authentication. 
 
### 5. Setting Up Authentication 
To restrict access, configure basic authentication for WebDAV. 
#### Step 1: Install `httpd-tools` Install the `httpd-tools` package, which includes the `htpasswd` utility for creating password files. 

```bash sudo dnf install httpd-tools -y 
``` 
#### Step 2: Create a Password File Create a password file for WebDAV authentication. 

```bash sudo htpasswd -c /etc/httpd/.htpasswd webdav_user 
``` 
Enter a password when prompted. To add more users, omit the `-c` flag: 

```bash sudo htpasswd /etc/httpd/.htpasswd another_user 
``` 
#### Step 3: Update Apache Configuration for Authentication In your `webdav.conf` file, add the following lines within the `` block: 

```apache AuthType Basic AuthName \u0022Restricted WebDAV Folder\u0022 AuthUserFile /etc/httpd/.htpasswd Require valid-user 
``` 
Save and close the file. 
#### Step 4: Restart Apache To apply the changes, restart Apache: 

```bash sudo systemctl restart httpd 
``` 
 
### 6. Configuring Firewall Rules 
If your firewall is active, ensure that Apache traffic is allowed. 

```bash sudo firewall-cmd \u002d\u002dpermanent \u002d\u002dadd-service=http sudo firewall-cmd \u002d\u002dpermanent \u002d\u002dadd-service=https sudo firewall-cmd \u002d\u002dreload 
``` 
 
### 7. Testing WebDAV Configuration 
To test if WebDAV is functioning properly, open a web browser and navigate to `http://your-server-ip/webdav`. You should be prompted for a username and password. Enter the credentials set up in the `.htpasswd` file. 
If access is successful, your WebDAV setup is working! 
 
### 8. Mounting the WebDAV Folder 
Once WebDAV is set up, you can mount the folder on various operating systems. Here’s how to do it on a few popular systems. 
#### On Linux You can mount a WebDAV share in Linux using the `davfs2` package. 
1. Install `davfs2`: 
   ```bash    sudo dnf install davfs2 -y    ``` 
2. Mount the WebDAV folder: 
   ```bash    sudo mount -t davfs http://your-server-ip/webdav /mnt/webdav    ``` 
#### On Windows 1. Open File Explorer. 2. Right-click on “This PC” and select “Map network drive.” 3. In the Folder field, type: `http://your-server-ip/webdav`. 4. Enter your WebDAV username and password when prompted. 
#### On macOS 1. In Finder, press `Cmd + K`. 2. Enter the WebDAV URL: `http://your-server-ip/webdav`. 3. Click “Connect” and enter your WebDAV credentials. 
 
### 9. Troubleshooting Tips 
If you encounter issues, try these troubleshooting tips: 
- **Check Apache Error Logs**: Use `sudo tail -f /var/log/httpd/error_log` to view Apache logs for possible configuration errors. - **Verify File Permissions**: Ensure the `apache` user has permissions to the WebDAV directory. - **Ensure Correct URL**: Make sure the URL path is correct, especially when connecting from different operating systems. - **Firewall Settings**: Confirm that firewall rules are applied correctly. 
 
### 10. Conclusion 
Configuring a WebDAV folder on AlmaLinux 9 is straightforward with Apache and a few additional configurations. WebDAV enables remote file management, enhancing collaboration and file accessibility. By following this guide, you should now have a secure and functional WebDAV setup on your AlmaLinux server. 
WebDAV offers a practical solution for shared file management, and with proper configuration, it can be a powerful tool for businesses and individual users alike."} -->
<div class="wp-block-jetpack-markdown">Web Distributed Authoring and Versioning (WebDAV) is a protocol that enables web users to manage files on a server just as if they were stored locally on their machine. WebDAV is useful in various scenarios, from collaborative file management to simple web-based file storage. In this tutorial, we’ll walk through configuring a WebDAV folder on AlmaLinux 9, one of the latest and most popular RHEL-based distributions.
1. Introduction to WebDAV
WebDAV is a protocol that enhances the HTTP standard to allow users to edit and manage files on a remote server. This capability is often used for content management and collaborative projects. It integrates easily with various operating systems, making it a flexible choice for network-based file storage and management.
<hr>
2. Prerequisites
Before starting, ensure you have the following:

* **AlmaLinux 9**: Installed and configured with root or sudo privileges.
* **Apache HTTP Server**: As WebDAV uses HTTP, Apache is required for this setup.
* **Open Ports**: Port 80 (HTTP) or 443 (HTTPS) should be open.
* **Basic Networking Knowledge**: Familiarity with basic Linux commands and networking is beneficial.

<hr>
3. Install Apache and WebDAV Modules
To set up WebDAV, you first need to install Apache and enable WebDAV-related modules. Follow these steps:
#### Step 1: Update System Packages
It’s always good practice to update your system packages before making installations.
<pre><code class="language-bash">sudo dnf update -y
`</pre>
#### Step 2: Install Apache Web Server
To install Apache, run:
<pre><code class="language-bash">sudo dnf install httpd -y
`</pre>
#### Step 3: Enable and Start Apache Service
Once installed, enable and start the Apache service.
<pre><code class="language-bash">sudo systemctl enable httpd
sudo systemctl start httpd
`</pre>
#### Step 4: Install WebDAV Modules
WebDAV functionality in Apache is supported through two main modules, `dav` and `dav_fs`. These modules are usually included by default in Apache installations. To install them, run:
<pre><code class="language-bash">sudo dnf install mod_dav mod_dav_fs -y
`</pre>
You can verify that the modules are loaded by checking Apache’s configuration file, typically located in `/etc/httpd/conf/httpd.conf`.
<hr>
4. Configure WebDAV Directory
Next, we need to configure the directory on the server where files will be stored and accessed.
#### Step 1: Create the WebDAV Directory
Create a new directory to serve as the WebDAV folder.
<pre><code class="language-bash">sudo mkdir -p /var/www/html/webdav
`</pre>
#### Step 2: Set Permissions
Set appropriate permissions for the directory. You can choose who can read and write by adjusting permissions or creating a dedicated user group.
<pre><code class="language-bash">sudo chown -R apache:apache /var/www/html/webdav
sudo chmod -R 755 /var/www/html/webdav
`</pre>
#### Step 3: Configure the WebDAV Directory in Apache
Add configuration to allow WebDAV access to the directory.

* 
Open Apache’s configuration file or create a new configuration file specifically for WebDAV:
<pre><code class="language-bash">sudo nano /etc/httpd/conf.d/webdav.conf
`</pre>

* 
Add the following configuration:
<pre><code class="language-apache">&lt;Directory /var/www/html/webdav&gt;
    Dav On
    Options Indexes FollowSymLinks
    AllowOverride None
    Require valid-user
&lt;/Directory&gt;

Alias /webdav /var/www/html/webdav
`</pre>


This configuration enables WebDAV on the `/webdav` directory and requires authentication.
<hr>
5. Setting Up Authentication
To restrict access, configure basic authentication for WebDAV.
#### Step 1: Install `httpd-tools`
Install the `httpd-tools` package, which includes the `htpasswd` utility for creating password files.
<pre><code class="language-bash">sudo dnf install httpd-tools -y
`</pre>
#### Step 2: Create a Password File
Create a password file for WebDAV authentication.
<pre><code class="language-bash">sudo htpasswd -c /etc/httpd/.htpasswd webdav_user
`</pre>
Enter a password when prompted. To add more users, omit the `-c` flag:
<pre><code class="language-bash">sudo htpasswd /etc/httpd/.htpasswd another_user
`</pre>
#### Step 3: Update Apache Configuration for Authentication
In your `webdav.conf` file, add the following lines within the `&lt;Directory&gt;` block:
<pre><code class="language-apache">AuthType Basic
AuthName &quot;Restricted WebDAV Folder&quot;
AuthUserFile /etc/httpd/.htpasswd
Require valid-user
`</pre>
Save and close the file.
#### Step 4: Restart Apache
To apply the changes, restart Apache:
<pre><code class="language-bash">sudo systemctl restart httpd
`</pre>
<hr>
6. Configuring Firewall Rules
If your firewall is active, ensure that Apache traffic is allowed.
<pre><code class="language-bash">sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
`</pre>
<hr>
7. Testing WebDAV Configuration
To test if WebDAV is functioning properly, open a web browser and navigate to `http://your-server-ip/webdav`. You should be prompted for a username and password. Enter the credentials set up in the `.htpasswd` file.
If access is successful, your WebDAV setup is working!
<hr>
8. Mounting the WebDAV Folder
Once WebDAV is set up, you can mount the folder on various operating systems. Here’s how to do it on a few popular systems.
#### On Linux
You can mount a WebDAV share in Linux using the `davfs2` package.

* 
Install `davfs2`:
<pre><code class="language-bash">sudo dnf install davfs2 -y
`</pre>

* 
Mount the WebDAV folder:
<pre><code class="language-bash">sudo mount -t davfs http://your-server-ip/webdav /mnt/webdav
`</pre>


#### On Windows

* Open File Explorer.
* Right-click on “This PC” and select “Map network drive.”
* In the Folder field, type: `http://your-server-ip/webdav`.
* Enter your WebDAV username and password when prompted.

#### On macOS

* In Finder, press `Cmd + K`.
* Enter the WebDAV URL: `http://your-server-ip/webdav`.
* Click “Connect” and enter your WebDAV credentials.

<hr>
9. Troubleshooting Tips
If you encounter issues, try these troubleshooting tips:

* **Check Apache Error Logs**: Use `sudo tail -f /var/log/httpd/error_log` to view Apache logs for possible configuration errors.
* **Verify File Permissions**: Ensure the `apache` user has permissions to the WebDAV directory.
* **Ensure Correct URL**: Make sure the URL path is correct, especially when connecting from different operating systems.
* **Firewall Settings**: Confirm that firewall rules are applied correctly.

<hr>
10. Conclusion
Configuring a WebDAV folder on AlmaLinux 9 is straightforward with Apache and a few additional configurations. WebDAV enables remote file management, enhancing collaboration and file accessibility. By following this guide, you should now have a secure and functional WebDAV setup on your AlmaLinux server.
WebDAV offers a practical solution for shared file management, and with proper configuration, it can be a powerful tool for businesses and individual users alike.
</div>
<!-- /wp:jetpack/markdown -->