---
title: How to Configure mod_perl with Apache on AlmaLinux
linkTitle: mod_perl with Apache
description: This guide walks you through the process of configuring mod_perl with Apache on AlmaLinux, covering installation, configuration, and testing.
date: 2024-12-18
weight: 940
url: configure-mod-perl-apache-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
For developers and system administrators looking to integrate Perl scripting into their web servers, **mod_perl** is a robust and efficient solution. It allows the Apache web server to embed a Perl interpreter, making it an ideal choice for building dynamic web applications. AlmaLinux, a popular RHEL-based distribution, provides a stable platform for configuring mod_perl with Apache to host Perl-powered websites or applications.  

This guide walks you through the process of configuring mod_perl with Apache on AlmaLinux, covering installation, configuration, and testing. By the end, you’ll have a working mod_perl setup for your web applications.  

---

### **Prerequisites**  

Before starting, ensure you meet these prerequisites:  

1. **A Running AlmaLinux System**: This guide assumes AlmaLinux 8 or later is installed.  
2. **Apache Installed**: You’ll need Apache (httpd) installed and running.  
3. **Root or Sudo Privileges**: Administrative access is required for system-level changes.  
4. **Perl Installed**: Perl must be installed on your system.  

---

### **Step 1: Update Your AlmaLinux System**  

Start by updating your AlmaLinux system to ensure all packages are up-to-date. Run:  

```bash
sudo dnf update -y
```  

After updating, reboot the system if necessary:  

```bash
sudo reboot
```  

---

### **Step 2: Install Apache (if not already installed)**  

If Apache isn’t already installed, install it using the `dnf` package manager:  

```bash
sudo dnf install httpd -y
```  

Enable and start the Apache service:  

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```  

Verify Apache is running:  

```bash
sudo systemctl status httpd
```  

---

### **Step 3: Install Perl and mod_perl**  

#### Install Perl  

Perl is often included in AlmaLinux installations, but you can confirm it by running:  

```bash
perl -v
```  

If Perl isn’t installed, install it using:  

```bash
sudo dnf install perl -y
```  

#### Install mod_perl  

To enable mod_perl, install the `mod_perl` package, which provides the integration between Perl and Apache:  

```bash
sudo dnf install mod_perl -y
```  

This will also pull in other necessary dependencies.  

---

### **Step 4: Enable mod_perl in Apache**  

After installation, mod_perl should automatically be enabled in Apache. You can verify this by checking the Apache configuration:  

```bash
sudo httpd -M | grep perl
```  

You should see an output like:  

```html
perl_module (shared)
```  

If the module isn’t loaded, you can explicitly enable it by editing the Apache configuration file:  

```bash
sudo nano /etc/httpd/conf.modules.d/01-mod_perl.conf
```  

Ensure the following line is present:  

```apache
LoadModule perl_module modules/mod_perl.so
```  

Save and close the file, then restart Apache to apply the changes:  

```bash
sudo systemctl restart httpd
```  

---

### **Step 5: Create a Test Perl Script**  

To test the mod_perl setup, create a simple Perl script. Navigate to the Apache document root, typically located at `/var/www/html`:  

```bash
cd /var/www/html
```  

Create a new Perl script:  

```bash
sudo nano hello.pl
```  

Add the following content:  

```perl
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "<html><head><title>mod_perl Test</title></head>";
print "<body><h1>Hello, World! mod_perl is working!</h1></body></html>";
```  

Save and close the file. Make the script executable:  

```bash
sudo chmod +x hello.pl
```  

---

### **Step 6: Configure Apache to Handle Perl Scripts**  

To ensure Apache recognizes and executes Perl scripts, you need to configure it properly. Open or create a new configuration file for mod_perl:  

```bash
sudo nano /etc/httpd/conf.d/perl.conf
```  

Add the following content:  

```apache
<Directory "/var/www/html">
    Options +ExecCGI
    AddHandler cgi-script .pl
</Directory>
```  

Save and close the file, then restart Apache:  

```bash
sudo systemctl restart httpd
```  

---

### **Step 7: Test Your mod_perl Configuration**  

Open your browser and navigate to your server’s IP address or domain, appending `/hello.pl` to the URL. For example:  

```html
http://your-server-ip/hello.pl
```  

You should see the following output:  

```html
Hello, World! mod_perl is working!
```  

If the script doesn’t execute, ensure that the permissions are set correctly and that mod_perl is loaded into Apache.  

---

### **Step 8: Advanced Configuration Options**  

#### Using mod_perl Handlers  

One of the powerful features of mod_perl is its ability to use Perl handlers for various phases of the Apache request cycle. Create a simple handler to demonstrate this capability.  

Navigate to the `/var/www/html` directory and create a new file:  

```bash
sudo nano MyHandler.pm
```  

Add the following code:  

```perl
package MyHandler;

use strict;
use warnings;
use Apache2::RequestRec ();
use Apache2::Const -compile => qw(OK);

sub handler {
    my $r = shift;

    $r->content_type('text/plain');
    $r->print("Hello, mod_perl handler is working!");

    return Apache2::Const::OK;
}

1;
```  

Save and close the file.  

Update the Apache configuration to use this handler:  

```bash
sudo nano /etc/httpd/conf.d/perl.conf
```  

Add the following:  

```apache
PerlModule MyHandler
<Location /myhandler>
    SetHandler perl-script
    PerlResponseHandler MyHandler
</Location>
```  

Restart Apache:  

```bash
sudo systemctl restart httpd
```  

Test the handler by navigating to:  

```html
http://your-server-ip/myhandler
```  

---

### **Step 9: Secure Your mod_perl Setup**  

#### Restrict Access to Perl Scripts  

To enhance security, restrict access to specific directories where Perl scripts are executed. Update your Apache configuration:  

```apache
<Directory "/var/www/html">
    Options +ExecCGI
    AddHandler cgi-script .pl
    Require all granted
</Directory>
```  

You can further customize permissions based on IP or user authentication.  

#### Enable Firewall Rules  

Allow HTTP and HTTPS traffic through the firewall:  

```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```  

---

### **Conclusion**  

By following these steps, you’ve successfully configured mod_perl with Apache on AlmaLinux. With mod_perl, you can deploy dynamic, high-performance Perl applications directly within the Apache server environment, leveraging the full power of the Perl programming language.  

This setup is not only robust but also highly customizable, allowing you to optimize it for various use cases. Whether you're running simple Perl scripts or complex web applications, mod_perl ensures a seamless integration of Perl with your web server.  

For production environments, remember to secure your server with HTTPS, monitor performance, and regularly update your system and applications to maintain a secure and efficient setup.
