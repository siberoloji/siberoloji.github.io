---
draft: false

title:  'AlmaLinux 9: How to Create Userdir on Apache Web Server'
date: '2024-10-04T20:15:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-create-userdir-on-apache-web-server/
 
featured_image: /images/apache-web-server.webp
categories:
    - 'Linux How-to'
tags:
    - 'apache web server'
    - 'how-to guides'
    - linux
    - 'linux how-to'
    - userdir
---
AlmaLinux is a powerful, stable Linux distribution, often chosen for web hosting and server management due to its similarity with CentOS. One of the most useful features you can set up on an Apache web server is **user directories** (UserDir). This allows individual users to host personal websites on a shared server environment without interfering with one another’s content.

In this blog post, we’ll walk through the steps to enable and configure the UserDir module in Apache on AlmaLinux 9, allowing users to have their own web directories under `/home/username/public_html`. We'll cover everything from setting up the necessary modules, adjusting permissions, to configuring the server correctly to ensure proper security.
Table of Contents
* Introduction to UserDir in Apache

* Prerequisites

* Step 1: Install Apache on AlmaLinux 9

* Step 2: Enable the UserDir Module

* Step 3: Creating User Directories

* Step 4: Configuring Apache for UserDir

* Step 5: Testing the UserDir Configuration

* Step 6: Adjusting Permissions for Security

* Conclusion

## 1. Introduction to UserDir in Apache

The **UserDir** feature in Apache allows each user on a system to have a personal web directory, typically located in their home folder. By default, this directory is named `public_html`, and it is accessed through a browser via a URL like:
```bash
http://yourdomain.com/~username```

This feature is beneficial when managing shared hosting environments, where multiple users or developers may need to host individual websites on a single server. Each user’s content is stored in a separate home directory, preventing conflicts and allowing for easier organization.
## 2. Prerequisites

Before we start, ensure the following requirements are met:
* **AlmaLinux 9** installed on your server.

* **Apache Web Server** installed and running.

* **Root or sudo user privileges** to configure the system.

* Basic knowledge of terminal commands and file management.

## 3. Step 1: Install Apache on AlmaLinux 9

Before we can configure the UserDir feature, ensure that Apache is installed and running on your AlmaLinux 9 system.

Installing Apache

If Apache is not yet installed, you can install it using the `dnf` package manager:
```bash
sudo dnf install httpd
```

Starting Apache

After installation, enable Apache to start on boot and then start the service:
```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

Verifying Apache Installation

You can check if Apache is running correctly by typing the following command:
```bash
sudo systemctl status httpd
```

You should see an output indicating that the Apache service is active and running.
## 4. Step 2: Enable the UserDir Module

Apache has a built-in **mod_userdir** module that allows individual users to have their own directories served by Apache. To enable this, we need to ensure that the module is activated and properly configured.

Enabling mod_userdir

The UserDir module should be installed by default with Apache. To confirm that it’s enabled, use the following command:
```bash
sudo dnf install mod_userdir```

Next, we need to ensure that the module is loaded in the Apache configuration file. Open the configuration file for user directories, which is located at `/etc/httpd/conf.d/userdir.conf`:
```bash
sudo nano /etc/httpd/conf.d/userdir.conf```

In this file, you should see configuration directives that look something like this:
```bash
<IfModule mod_userdir.c>
    UserDir public_html
    UserDir disabled root
</IfModule>
```

The `UserDir public_html` line means that users’ websites will be served from the `public_html` directory within their home directories.
## 5. Step 3: Creating User Directories

Now that the UserDir module is enabled, we need to create directories for each user who wants to host content.

Creating the User’s Public Directory

For each user, create a directory named `public_html` inside their home directory. If you don’t already have a user account set up, you can create one like this:
```bash
sudo useradd username```

Replace `username` with the actual name of the user.

Next, create the `public_html` directory:
```bash
sudo mkdir /home/username/public_html
```

This directory is where the user will place their web content. Ensure that the ownership and permissions are set correctly:
```bash
sudo chown username:username /home/username/public_html
sudo chmod 755 /home/username/public_html
```

The `755` permission ensures that the web server can read the files, while the user has full control over their directory.
## 6. Step 4: Configuring Apache for UserDir

We’ve set up the user directories, but now we need to make sure Apache knows how to handle them.

Adjusting the UserDir Configuration

The default configuration of Apache should work for most cases, but you may want to review and customize the settings in `/etc/httpd/conf.d/userdir.conf`.

Ensure that the `UserDir` directive is correctly pointing to `public_html`, as shown earlier.

You may also want to disable the feature for the `root` user for security reasons, which should already be configured as follows:
```bash
UserDir disabled root```

Restart Apache to Apply Changes

Once you've made changes to the configuration file, restart Apache to apply the changes:
```bash
sudo systemctl restart httpd
```
## 7. Step 5: Testing the UserDir Configuration

With the configuration complete, it’s time to test the setup. Each user’s web directory should now be accessible via a URL like:
```bash
http://yourdomain.com/~username```

Create an Index File

To test the configuration, create a simple HTML file in the `public_html` directory of a user. For example:
```bash
nano /home/username/public_html/index.html
```

Add the following content:
```bash
<!DOCTYPE html>
<html>
<head>
    <title>Test UserDir</title>
</head>
<body>
    <h1>Welcome to UserDir for username</h1>
</body>
</html>
```

Save the file, then navigate to `http://yourdomain.com/~username` in your browser. If everything is configured correctly, you should see the test HTML page.
## 8. Step 6: Adjusting Permissions for Security

Set Directory Permissions

While the `public_html` directory is set to `755`, it’s crucial that other files within the user’s home directory have the appropriate permissions to maintain security. Ensure the following permissions:
* The user’s home directory should have the permissions set to `711`, so others can access the `public_html` directory, but not view the contents of the home directory itself:

```bash
sudo chmod 711 /home/username```
* Any files inside the `public_html` directory should be readable by Apache, so set permissions for files and subdirectories appropriately:

```bash
sudo chmod 644 /home/username/public_html/*```

This ensures that files can be read by the web server but not modified by unauthorized users.

Protecting Other User Directories

It’s important to ensure that users cannot access each other’s files. The permissions we've set ensure that users have restricted access to home directories while allowing public access to `public_html`. However, always review your system’s security configuration to prevent privilege escalation.
## 9. Conclusion

Enabling the **UserDir** feature in Apache on AlmaLinux 9 allows individual users to host their own websites in a shared hosting environment. With just a few steps, we installed Apache, enabled the UserDir module, created user directories, configured permissions, and tested the setup.

This configuration is ideal for multi-user environments, web hosting companies, or development teams working on the same server. The setup offers flexibility while keeping the system secure, as users can manage their own content independently.

By following this guide, you now have a fully functional UserDir setup on Apache, giving users the ability to host personal web pages on your server.
