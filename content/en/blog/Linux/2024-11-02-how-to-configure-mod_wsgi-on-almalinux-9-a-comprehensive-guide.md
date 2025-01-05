---
draft: false

title:  'How to Configure mod_wsgi on AlmaLinux 9: A Comprehensive Guide'
date: '2024-11-02T13:41:15+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This guide walks you through each step in setting up mod_wsgi on AlmaLinux 9, from installation to configuration, allowing you to serve Python applications securely and effectively.' 
 
url:  /how-to-configure-mod_wsgi-on-almalinux-9-a-comprehensive-guide/
featured_image: /images/apache-web-server.webp
categories:
    - 'Linux How-to'
tags:
    - 'alma linux'
    - mod_wsgi
---

<!-- wp:jetpack/markdown {"source":"Configuring **mod_wsgi** on **AlmaLinux 9** is a powerful way to deploy Python-based web applications with the Apache web server. By combining the flexibility of Python with the reliability of Apache, mod_wsgi enables smooth deployment, easy scaling, and efficient server-side processing. This guide walks you through each step in setting up mod_wsgi on AlmaLinux 9, from installation to configuration, allowing you to serve Python applications securely and effectively. 
 
### **1. Introduction to mod_wsgi** 
**mod_wsgi** is an Apache HTTP server module designed to serve Python web applications. It's particularly popular for running applications built with frameworks like **Django** or **Flask**. By using mod_wsgi, you can deploy Python applications in a production environment while leveraging Apache’s powerful features, such as load balancing, caching, and authentication. 
 
### **2. Why Use mod_wsgi on AlmaLinux 9?** 
1. **Efficient Deployment**: mod_wsgi integrates Python applications seamlessly with Apache, making deployment straightforward. 2. **Performance**: It’s optimized for Python applications, providing efficient server-side performance. 3. **Security**: AlmaLinux 9 is known for its enterprise-level security, and with mod_wsgi, you can ensure a secure Python web server setup. 
 
### **3. Prerequisites for Configuring mod_wsgi** 
Before diving into the configuration, make sure you have: 
- **AlmaLinux 9** installed and running. - **Apache HTTP Server** installed. - **Python 3.9+** (or a compatible version) installed. - **Root or sudo privileges** on the server. 
 
### **4. Step 1: Installing Apache on AlmaLinux 9** 
If Apache is not already installed, you’ll need to set it up as mod_wsgi depends on Apache to function. 
1. **Install Apache**: 
   ```bash    sudo dnf install httpd -y    ``` 
2. **Start and enable Apache** to ensure it runs at boot: 
   ```bash    sudo systemctl start httpd    sudo systemctl enable httpd    ``` 
3. **Confirm Apache Installation**: Open your browser and navigate to your server’s IP address. You should see the Apache test page if it’s working correctly. 
 
### **5. Step 2: Installing Python and Python Development Packages** 
mod_wsgi requires Python development headers for installation, so let’s ensure they’re available. 
1. **Install Python** (if not already installed): 
   ```bash    sudo dnf install python3 -y    ``` 
2. **Install Python Development Tools**: 
   ```bash    sudo dnf install python3-devel -y    ``` 
3. **Verify Python Installation**: 
   ```bash    python3 \u002d\u002dversion    ``` 
   This should return your Python version, confirming a successful installation. 
 
### **6. Step 3: Installing mod_wsgi Using pip** 
While mod_wsgi can sometimes be available as a package, it’s often preferable to install it via `pip` to ensure compatibility with the latest Python version. 
1. **Install pip** (if it’s not installed): 
   ```bash    sudo dnf install python3-pip -y    ``` 
2. **Use pip to Install mod_wsgi**: 
   ```bash    sudo pip3 install mod_wsgi    ``` 
3. **Verify Installation**: 
   After installation, run the following command to check the installed mod_wsgi version: 
   ```bash    mod_wsgi-express \u002d\u002dversion    ``` 
   This should confirm that mod_wsgi is correctly installed. 
 
### **7. Step 4: Configuring Apache to Load mod_wsgi** 
Now, we need to configure Apache to load the mod_wsgi module. 
1. **Get the mod_wsgi Configuration Path**: 
   Run this command to get the Apache module configuration details: 
   ```bash    mod_wsgi-express module-config    ``` 
   You’ll see output like this: 
   ```apache    LoadModule wsgi_module /usr/lib64/httpd/modules/mod_wsgi.so    WSGIPythonHome /usr    ``` 
2. **Edit the Apache Configuration File**: 
   Open Apache’s main configuration file: 
   ```bash    sudo nano /etc/httpd/conf/httpd.conf    ``` 
3. **Add the mod_wsgi Configuration**: 
   Copy the `LoadModule` and `WSGIPythonHome` lines from the previous command’s output into your Apache configuration file. 
4. **Save and Close** the configuration file. 
 
### **8. Step 5: Setting Up Your First Python Application** 
To demonstrate the mod_wsgi setup, let’s create a simple “Hello World” Python application. 
1. **Create a New Directory for the Application**: 
   ```bash    sudo mkdir /var/www/myapp    ``` 
2. **Write a Simple Application**: 
   Create a Python file within this directory: 
   ```bash    sudo nano /var/www/myapp/myapp.wsgi    ``` 
   Add the following code: 
   ```python    def application(environ, start_response):        status = '200 OK'        output = b'Hello, World!' 
       response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]        start_response(status, response_headers) 
       return [output]    ``` 
3. **Save and Close** the file. 
 
### **9. Step 6: Configuring mod_wsgi to Serve Your Application** 
Now that the application is ready, let’s configure Apache to serve it. 
1. **Create a Virtual Host for Your Application**: 
   Open a new Apache configuration file for the virtual host: 
   ```bash    sudo nano /etc/httpd/conf.d/myapp.conf    ``` 
2. **Configure the Virtual Host**: 
   In this configuration file, add the following code (replace `mydomain.com` with your actual domain): 
   ```apache            ServerName mydomain.com        WSGIScriptAlias / /var/www/myapp/myapp.wsgi 
                   Require all granted         
       ErrorLog /var/log/httpd/myapp_error.log        CustomLog /var/log/httpd/myapp_access.log combined        ``` 
   This configuration tells Apache to serve your application when someone accesses `mydomain.com`. 
3. **Save and Close** the file. 
 
### **10. Step 7: Testing the Configuration** 
With everything set up, it’s time to test the configuration. 
1. **Restart Apache** to apply the new configuration: 
   ```bash    sudo systemctl restart httpd    ``` 
2. **Test the Application**: 
   Open a browser and navigate to `http://mydomain.com`. You should see the message “Hello, World!” indicating that your application is being served correctly. 
 
### **11. Common Errors and Troubleshooting** 
**Issue**: *500 Internal Server Error*   **Solution**: Check the `myapp_error.log` file in `/var/log/httpd/` for more information. Often, this error occurs due to permission issues or incorrect WSGI file paths. 
**Issue**: *Module not found errors*   **Solution**: Ensure all Python dependencies are installed in the Python environment specified in `WSGIPythonHome`. Using a virtual environment can help manage dependencies cleanly. 
**Issue**: *Cannot locate mod_wsgi.so*   **Solution**: Double-check the `LoadModule` path in the Apache configuration. The `mod_wsgi-express module-config` command typically provides the correct path. 
 
### **12. FAQ on mod_wsgi Configuration for AlmaLinux 9** 
**Q1: Can I use mod_wsgi with a virtual environment?**   A: Yes, simply point `WSGIPythonHome` to your virtual environment’s location, and make sure all required packages are installed there. 
**Q2: How do I configure mod_wsgi for HTTPS?**   A: Configure Apache for SSL by installing `mod_ssl`, then update your VirtualHost configuration to listen on port 443 and include the SSL certificate and key paths. 
**Q3: How can I use multiple Python versions with mod_wsgi?**   A: Install different Python versions and specify the desired version with `WSGIPythonHome`. 
**Q4: Does mod_wsgi support multiprocessing?**   A: Yes, mod_wsgi supports both multi-threading and multi-processing, configurable via the `WSGIDaemonProcess` directive. 
**Q5: What permissions should my application directory have?**   A: Set permissions so that the Apache user (`apache` or `www-data`) has read access to the directory and execute access to the files. 
 
With these steps, you’ve successfully configured mod_wsgi on AlmaLinux 9, giving you a reliable, scalable, and production-ready environment for your Python applications. Enjoy the power and flexibility of deploying your Python apps with mod_wsgi!"} -->
<div class="wp-block-jetpack-markdown">Configuring **mod_wsgi** on **AlmaLinux 9** is a powerful way to deploy Python-based web applications with the Apache web server. By combining the flexibility of Python with the reliability of Apache, mod_wsgi enables smooth deployment, easy scaling, and efficient server-side processing. This guide walks you through each step in setting up mod_wsgi on AlmaLinux 9, from installation to configuration, allowing you to serve Python applications securely and effectively.
<hr>
**1. Introduction to mod_wsgi**
**mod_wsgi** is an Apache HTTP server module designed to serve Python web applications. It’s particularly popular for running applications built with frameworks like **Django** or **Flask**. By using mod_wsgi, you can deploy Python applications in a production environment while leveraging Apache’s powerful features, such as load balancing, caching, and authentication.
<hr>
**2. Why Use mod_wsgi on AlmaLinux 9?**

* **Efficient Deployment**: mod_wsgi integrates Python applications seamlessly with Apache, making deployment straightforward.
* **Performance**: It’s optimized for Python applications, providing efficient server-side performance.
* **Security**: AlmaLinux 9 is known for its enterprise-level security, and with mod_wsgi, you can ensure a secure Python web server setup.

<hr>
**3. Prerequisites for Configuring mod_wsgi**
Before diving into the configuration, make sure you have:

* **AlmaLinux 9** installed and running.
* **Apache HTTP Server** installed.
* **Python 3.9+** (or a compatible version) installed.
* **Root or sudo privileges** on the server.

<hr>
**4. Step 1: Installing Apache on AlmaLinux 9**
If Apache is not already installed, you’ll need to set it up as mod_wsgi depends on Apache to function.

* 
**Install Apache**:
<pre><code class="language-bash">sudo dnf install httpd -y
`</pre>

* 
**Start and enable Apache** to ensure it runs at boot:
<pre><code class="language-bash">sudo systemctl start httpd
sudo systemctl enable httpd
`</pre>

* 
**Confirm Apache Installation**: Open your browser and navigate to your server’s IP address. You should see the Apache test page if it’s working correctly.


<hr>
**5. Step 2: Installing Python and Python Development Packages**
mod_wsgi requires Python development headers for installation, so let’s ensure they’re available.

* 
**Install Python** (if not already installed):
<pre><code class="language-bash">sudo dnf install python3 -y
`</pre>

* 
**Install Python Development Tools**:
<pre><code class="language-bash">sudo dnf install python3-devel -y
`</pre>

* 
**Verify Python Installation**:
<pre><code class="language-bash">python3 --version
`</pre>
This should return your Python version, confirming a successful installation.


<hr>
**6. Step 3: Installing mod_wsgi Using pip**
While mod_wsgi can sometimes be available as a package, it’s often preferable to install it via `pip` to ensure compatibility with the latest Python version.

* 
**Install pip** (if it’s not installed):
<pre><code class="language-bash">sudo dnf install python3-pip -y
`</pre>

* 
**Use pip to Install mod_wsgi**:
<pre><code class="language-bash">sudo pip3 install mod_wsgi
`</pre>

* 
**Verify Installation**:
After installation, run the following command to check the installed mod_wsgi version:
<pre><code class="language-bash">mod_wsgi-express --version
`</pre>
This should confirm that mod_wsgi is correctly installed.


<hr>
**7. Step 4: Configuring Apache to Load mod_wsgi**
Now, we need to configure Apache to load the mod_wsgi module.

* 
**Get the mod_wsgi Configuration Path**:
Run this command to get the Apache module configuration details:
<pre><code class="language-bash">mod_wsgi-express module-config
`</pre>
You’ll see output like this:
<pre><code class="language-apache">LoadModule wsgi_module /usr/lib64/httpd/modules/mod_wsgi.so
WSGIPythonHome /usr
`</pre>

* 
**Edit the Apache Configuration File**:
Open Apache’s main configuration file:
<pre><code class="language-bash">sudo nano /etc/httpd/conf/httpd.conf
`</pre>

* 
**Add the mod_wsgi Configuration**:
Copy the `LoadModule` and `WSGIPythonHome` lines from the previous command’s output into your Apache configuration file.

* 
**Save and Close** the configuration file.


<hr>
**8. Step 5: Setting Up Your First Python Application**
To demonstrate the mod_wsgi setup, let’s create a simple “Hello World” Python application.

* 
**Create a New Directory for the Application**:
<pre><code class="language-bash">sudo mkdir /var/www/myapp
`</pre>

* 
**Write a Simple Application**:
Create a Python file within this directory:
<pre><code class="language-bash">sudo nano /var/www/myapp/myapp.wsgi
`</pre>
Add the following code:
<pre><code class="language-python">def application(environ, start_response):
    status = '200 OK'
    output = b'Hello, World!'

    response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]
`</pre>

* 
**Save and Close** the file.


<hr>
**9. Step 6: Configuring mod_wsgi to Serve Your Application**
Now that the application is ready, let’s configure Apache to serve it.

* 
**Create a Virtual Host for Your Application**:
Open a new Apache configuration file for the virtual host:
<pre><code class="language-bash">sudo nano /etc/httpd/conf.d/myapp.conf
`</pre>

* 
**Configure the Virtual Host**:
In this configuration file, add the following code (replace `mydomain.com` with your actual domain):
<pre><code class="language-apache">&lt;VirtualHost *:80&gt;
    ServerName mydomain.com
    WSGIScriptAlias / /var/www/myapp/myapp.wsgi

    &lt;Directory /var/www/myapp&gt;
        Require all granted
    &lt;/Directory&gt;

    ErrorLog /var/log/httpd/myapp_error.log
    CustomLog /var/log/httpd/myapp_access.log combined
&lt;/VirtualHost&gt;
`</pre>
This configuration tells Apache to serve your application when someone accesses `mydomain.com`.

* 
**Save and Close** the file.


<hr>
**10. Step 7: Testing the Configuration**
With everything set up, it’s time to test the configuration.

* 
**Restart Apache** to apply the new configuration:
<pre><code class="language-bash">sudo systemctl restart httpd
`</pre>

* 
**Test the Application**:
Open a browser and navigate to `http://mydomain.com`. You should see the message “Hello, World!” indicating that your application is being served correctly.


<hr>
**11. Common Errors and Troubleshooting**
**Issue**: 500 Internal Server Error 
**Solution**: Check the `myapp_error.log` file in `/var/log/httpd/` for more information. Often, this error occurs due to permission issues or incorrect WSGI file paths.
**Issue**: Module not found errors 
**Solution**: Ensure all Python dependencies are installed in the Python environment specified in `WSGIPythonHome`. Using a virtual environment can help manage dependencies cleanly.
**Issue**: Cannot locate mod_wsgi.so 
**Solution**: Double-check the `LoadModule` path in the Apache configuration. The `mod_wsgi-express module-config` command typically provides the correct path.
<hr>
**12. FAQ on mod_wsgi Configuration for AlmaLinux 9**
**Q1: Can I use mod_wsgi with a virtual environment?** 
A: Yes, simply point `WSGIPythonHome` to your virtual environment’s location, and make sure all required packages are installed there.
**Q2: How do I configure mod_wsgi for HTTPS?** 
A: Configure Apache for SSL by installing `mod_ssl`, then update your VirtualHost configuration to listen on port 443 and include the SSL certificate and key paths.
**Q3: How can I use multiple Python versions with mod_wsgi?** 
A: Install different Python versions and specify the desired version with `WSGIPythonHome`.
**Q4: Does mod_wsgi support multiprocessing?** 
A: Yes, mod_wsgi supports both multi-threading and multi-processing, configurable via the `WSGIDaemonProcess` directive.
**Q5: What permissions should my application directory have?** 
A: Set permissions so that the Apache user (`apache` or `www-data`) has read access to the directory and execute access to the files.
<hr>
With these steps, you’ve successfully configured mod_wsgi on AlmaLinux 9, giving you a reliable, scalable, and production-ready environment for your Python applications. Enjoy the power and flexibility of deploying your Python apps with mod_wsgi!
</div>
<!-- /wp:jetpack/markdown -->