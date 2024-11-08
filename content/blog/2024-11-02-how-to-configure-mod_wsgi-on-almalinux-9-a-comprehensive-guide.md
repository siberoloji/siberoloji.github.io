---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
date: "2024-11-02T13:41:15Z"
excerpt: This guide walks you through each step in setting up mod_wsgi on AlmaLinux
  9, from installation to configuration, allowing you to serve Python applications
  securely and effectively.
guid: https://www.siberoloji.com/?p=5856
id: 5856
image: /assets/images/2024/09/apache-web-server.webp
tags:
- alma linux
- mod_wsgi
title: 'How to Configure mod_wsgi on AlmaLinux 9: A Comprehensive Guide'
url: /how-to-configure-mod_wsgi-on-almalinux-9-a-comprehensive-guide/
---

<!-- wp:jetpack/markdown {"source":"Configuring **mod_wsgi** on **AlmaLinux 9** is a powerful way to deploy Python-based web applications with the Apache web server. By combining the flexibility of Python with the reliability of Apache, mod_wsgi enables smooth deployment, easy scaling, and efficient server-side processing. This guide walks you through each step in setting up mod_wsgi on AlmaLinux 9, from installation to configuration, allowing you to serve Python applications securely and effectively.\n\n\u002d\u002d-\n\n### **1. Introduction to mod_wsgi**\n\n**mod_wsgi** is an Apache HTTP server module designed to serve Python web applications. It's particularly popular for running applications built with frameworks like **Django** or **Flask**. By using mod_wsgi, you can deploy Python applications in a production environment while leveraging Apache’s powerful features, such as load balancing, caching, and authentication.\n\n\u002d\u002d-\n\n### **2. Why Use mod_wsgi on AlmaLinux 9?**\n\n1. **Efficient Deployment**: mod_wsgi integrates Python applications seamlessly with Apache, making deployment straightforward.\n2. **Performance**: It’s optimized for Python applications, providing efficient server-side performance.\n3. **Security**: AlmaLinux 9 is known for its enterprise-level security, and with mod_wsgi, you can ensure a secure Python web server setup.\n\n\u002d\u002d-\n\n### **3. Prerequisites for Configuring mod_wsgi**\n\nBefore diving into the configuration, make sure you have:\n\n- **AlmaLinux 9** installed and running.\n- **Apache HTTP Server** installed.\n- **Python 3.9+** (or a compatible version) installed.\n- **Root or sudo privileges** on the server.\n\n\u002d\u002d-\n\n### **4. Step 1: Installing Apache on AlmaLinux 9**\n\nIf Apache is not already installed, you’ll need to set it up as mod_wsgi depends on Apache to function.\n\n1. **Install Apache**:\n\n   ```bash\n   sudo dnf install httpd -y\n   ```\n\n2. **Start and enable Apache** to ensure it runs at boot:\n\n   ```bash\n   sudo systemctl start httpd\n   sudo systemctl enable httpd\n   ```\n\n3. **Confirm Apache Installation**: Open your browser and navigate to your server’s IP address. You should see the Apache test page if it’s working correctly.\n\n\u002d\u002d-\n\n### **5. Step 2: Installing Python and Python Development Packages**\n\nmod_wsgi requires Python development headers for installation, so let’s ensure they’re available.\n\n1. **Install Python** (if not already installed):\n\n   ```bash\n   sudo dnf install python3 -y\n   ```\n\n2. **Install Python Development Tools**:\n\n   ```bash\n   sudo dnf install python3-devel -y\n   ```\n\n3. **Verify Python Installation**:\n\n   ```bash\n   python3 \u002d\u002dversion\n   ```\n\n   This should return your Python version, confirming a successful installation.\n\n\u002d\u002d-\n\n### **6. Step 3: Installing mod_wsgi Using pip**\n\nWhile mod_wsgi can sometimes be available as a package, it’s often preferable to install it via `pip` to ensure compatibility with the latest Python version.\n\n1. **Install pip** (if it’s not installed):\n\n   ```bash\n   sudo dnf install python3-pip -y\n   ```\n\n2. **Use pip to Install mod_wsgi**:\n\n   ```bash\n   sudo pip3 install mod_wsgi\n   ```\n\n3. **Verify Installation**:\n\n   After installation, run the following command to check the installed mod_wsgi version:\n\n   ```bash\n   mod_wsgi-express \u002d\u002dversion\n   ```\n\n   This should confirm that mod_wsgi is correctly installed.\n\n\u002d\u002d-\n\n### **7. Step 4: Configuring Apache to Load mod_wsgi**\n\nNow, we need to configure Apache to load the mod_wsgi module.\n\n1. **Get the mod_wsgi Configuration Path**:\n\n   Run this command to get the Apache module configuration details:\n\n   ```bash\n   mod_wsgi-express module-config\n   ```\n\n   You’ll see output like this:\n\n   ```apache\n   LoadModule wsgi_module /usr/lib64/httpd/modules/mod_wsgi.so\n   WSGIPythonHome /usr\n   ```\n\n2. **Edit the Apache Configuration File**:\n\n   Open Apache’s main configuration file:\n\n   ```bash\n   sudo nano /etc/httpd/conf/httpd.conf\n   ```\n\n3. **Add the mod_wsgi Configuration**:\n\n   Copy the `LoadModule` and `WSGIPythonHome` lines from the previous command’s output into your Apache configuration file.\n\n4. **Save and Close** the configuration file.\n\n\u002d\u002d-\n\n### **8. Step 5: Setting Up Your First Python Application**\n\nTo demonstrate the mod_wsgi setup, let’s create a simple “Hello World” Python application.\n\n1. **Create a New Directory for the Application**:\n\n   ```bash\n   sudo mkdir /var/www/myapp\n   ```\n\n2. **Write a Simple Application**:\n\n   Create a Python file within this directory:\n\n   ```bash\n   sudo nano /var/www/myapp/myapp.wsgi\n   ```\n\n   Add the following code:\n\n   ```python\n   def application(environ, start_response):\n       status = '200 OK'\n       output = b'Hello, World!'\n\n       response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]\n       start_response(status, response_headers)\n\n       return [output]\n   ```\n\n3. **Save and Close** the file.\n\n\u002d\u002d-\n\n### **9. Step 6: Configuring mod_wsgi to Serve Your Application**\n\nNow that the application is ready, let’s configure Apache to serve it.\n\n1. **Create a Virtual Host for Your Application**:\n\n   Open a new Apache configuration file for the virtual host:\n\n   ```bash\n   sudo nano /etc/httpd/conf.d/myapp.conf\n   ```\n\n2. **Configure the Virtual Host**:\n\n   In this configuration file, add the following code (replace `mydomain.com` with your actual domain):\n\n   ```apache\n   \n       ServerName mydomain.com\n       WSGIScriptAlias / /var/www/myapp/myapp.wsgi\n\n       \n           Require all granted\n       \n\n       ErrorLog /var/log/httpd/myapp_error.log\n       CustomLog /var/log/httpd/myapp_access.log combined\n   \n   ```\n\n   This configuration tells Apache to serve your application when someone accesses `mydomain.com`.\n\n3. **Save and Close** the file.\n\n\u002d\u002d-\n\n### **10. Step 7: Testing the Configuration**\n\nWith everything set up, it’s time to test the configuration.\n\n1. **Restart Apache** to apply the new configuration:\n\n   ```bash\n   sudo systemctl restart httpd\n   ```\n\n2. **Test the Application**:\n\n   Open a browser and navigate to `http://mydomain.com`. You should see the message “Hello, World!” indicating that your application is being served correctly.\n\n\u002d\u002d-\n\n### **11. Common Errors and Troubleshooting**\n\n**Issue**: *500 Internal Server Error*  \n**Solution**: Check the `myapp_error.log` file in `/var/log/httpd/` for more information. Often, this error occurs due to permission issues or incorrect WSGI file paths.\n\n**Issue**: *Module not found errors*  \n**Solution**: Ensure all Python dependencies are installed in the Python environment specified in `WSGIPythonHome`. Using a virtual environment can help manage dependencies cleanly.\n\n**Issue**: *Cannot locate mod_wsgi.so*  \n**Solution**: Double-check the `LoadModule` path in the Apache configuration. The `mod_wsgi-express module-config` command typically provides the correct path.\n\n\u002d\u002d-\n\n### **12. FAQ on mod_wsgi Configuration for AlmaLinux 9**\n\n**Q1: Can I use mod_wsgi with a virtual environment?**  \nA: Yes, simply point `WSGIPythonHome` to your virtual environment’s location, and make sure all required packages are installed there.\n\n**Q2: How do I configure mod_wsgi for HTTPS?**  \nA: Configure Apache for SSL by installing `mod_ssl`, then update your VirtualHost configuration to listen on port 443 and include the SSL certificate and key paths.\n\n**Q3: How can I use multiple Python versions with mod_wsgi?**  \nA: Install different Python versions and specify the desired version with `WSGIPythonHome`.\n\n**Q4: Does mod_wsgi support multiprocessing?**  \nA: Yes, mod_wsgi supports both multi-threading and multi-processing, configurable via the `WSGIDaemonProcess` directive.\n\n**Q5: What permissions should my application directory have?**  \nA: Set permissions so that the Apache user (`apache` or `www-data`) has read access to the directory and execute access to the files.\n\n\u002d\u002d-\n\nWith these steps, you’ve successfully configured mod_wsgi on AlmaLinux 9, giving you a reliable, scalable, and production-ready environment for your Python applications. Enjoy the power and flexibility of deploying your Python apps with mod_wsgi!"} -->
<div class="wp-block-jetpack-markdown"> Configuring <strong>mod_wsgi</strong> on <strong>AlmaLinux 9</strong> is a powerful way to deploy Python-based web applications with the Apache web server. By combining the flexibility of Python with the reliability of Apache, mod_wsgi enables smooth deployment, easy scaling, and efficient server-side processing. This guide walks you through each step in setting up mod_wsgi on AlmaLinux 9, from installation to configuration, allowing you to serve Python applications securely and effectively.</p>
<hr>
<h3><strong>1. Introduction to mod_wsgi</strong></h3>
 <strong>mod_wsgi</strong> is an Apache HTTP server module designed to serve Python web applications. It’s particularly popular for running applications built with frameworks like <strong>Django</strong> or <strong>Flask</strong>. By using mod_wsgi, you can deploy Python applications in a production environment while leveraging Apache’s powerful features, such as load balancing, caching, and authentication.</p>
<hr>
<h3><strong>2. Why Use mod_wsgi on AlmaLinux 9?</strong></h3>
<ol>
<li><strong>Efficient Deployment</strong>: mod_wsgi integrates Python applications seamlessly with Apache, making deployment straightforward.</li>
<li><strong>Performance</strong>: It’s optimized for Python applications, providing efficient server-side performance.</li>
<li><strong>Security</strong>: AlmaLinux 9 is known for its enterprise-level security, and with mod_wsgi, you can ensure a secure Python web server setup.</li>
</ol>
<hr>
<h3><strong>3. Prerequisites for Configuring mod_wsgi</strong></h3>
 Before diving into the configuration, make sure you have:</p>
<ul>
<li><strong>AlmaLinux 9</strong> installed and running.</li>
<li><strong>Apache HTTP Server</strong> installed.</li>
<li><strong>Python 3.9+</strong> (or a compatible version) installed.</li>
<li><strong>Root or sudo privileges</strong> on the server.</li>
</ul>
<hr>
<h3><strong>4. Step 1: Installing Apache on AlmaLinux 9</strong></h3>
 If Apache is not already installed, you’ll need to set it up as mod_wsgi depends on Apache to function.</p>
<ol>
<li>
 <strong>Install Apache</strong>:</p>
<pre><code class="language-bash">sudo dnf install httpd -y
</code></pre>
</li>
<li>
 <strong>Start and enable Apache</strong> to ensure it runs at boot:</p>
<pre><code class="language-bash">sudo systemctl start httpd
sudo systemctl enable httpd
</code></pre>
</li>
<li>
 <strong>Confirm Apache Installation</strong>: Open your browser and navigate to your server’s IP address. You should see the Apache test page if it’s working correctly.</p>
</li>
</ol>
<hr>
<h3><strong>5. Step 2: Installing Python and Python Development Packages</strong></h3>
 mod_wsgi requires Python development headers for installation, so let’s ensure they’re available.</p>
<ol>
<li>
 <strong>Install Python</strong> (if not already installed):</p>
<pre><code class="language-bash">sudo dnf install python3 -y
</code></pre>
</li>
<li>
 <strong>Install Python Development Tools</strong>:</p>
<pre><code class="language-bash">sudo dnf install python3-devel -y
</code></pre>
</li>
<li>
 <strong>Verify Python Installation</strong>:</p>
<pre><code class="language-bash">python3 --version
</code></pre>
 This should return your Python version, confirming a successful installation.</p>
</li>
</ol>
<hr>
<h3><strong>6. Step 3: Installing mod_wsgi Using pip</strong></h3>
 While mod_wsgi can sometimes be available as a package, it’s often preferable to install it via <code>pip</code> to ensure compatibility with the latest Python version.</p>
<ol>
<li>
 <strong>Install pip</strong> (if it’s not installed):</p>
<pre><code class="language-bash">sudo dnf install python3-pip -y
</code></pre>
</li>
<li>
 <strong>Use pip to Install mod_wsgi</strong>:</p>
<pre><code class="language-bash">sudo pip3 install mod_wsgi
</code></pre>
</li>
<li>
 <strong>Verify Installation</strong>:</p>
 After installation, run the following command to check the installed mod_wsgi version:</p>
<pre><code class="language-bash">mod_wsgi-express --version
</code></pre>
 This should confirm that mod_wsgi is correctly installed.</p>
</li>
</ol>
<hr>
<h3><strong>7. Step 4: Configuring Apache to Load mod_wsgi</strong></h3>
 Now, we need to configure Apache to load the mod_wsgi module.</p>
<ol>
<li>
 <strong>Get the mod_wsgi Configuration Path</strong>:</p>
 Run this command to get the Apache module configuration details:</p>
<pre><code class="language-bash">mod_wsgi-express module-config
</code></pre>
 You’ll see output like this:</p>
<pre><code class="language-apache">LoadModule wsgi_module /usr/lib64/httpd/modules/mod_wsgi.so
WSGIPythonHome /usr
</code></pre>
</li>
<li>
 <strong>Edit the Apache Configuration File</strong>:</p>
 Open Apache’s main configuration file:</p>
<pre><code class="language-bash">sudo nano /etc/httpd/conf/httpd.conf
</code></pre>
</li>
<li>
 <strong>Add the mod_wsgi Configuration</strong>:</p>
 Copy the <code>LoadModule</code> and <code>WSGIPythonHome</code> lines from the previous command’s output into your Apache configuration file.</p>
</li>
<li>
 <strong>Save and Close</strong> the configuration file.</p>
</li>
</ol>
<hr>
<h3><strong>8. Step 5: Setting Up Your First Python Application</strong></h3>
 To demonstrate the mod_wsgi setup, let’s create a simple “Hello World” Python application.</p>
<ol>
<li>
 <strong>Create a New Directory for the Application</strong>:</p>
<pre><code class="language-bash">sudo mkdir /var/www/myapp
</code></pre>
</li>
<li>
 <strong>Write a Simple Application</strong>:</p>
 Create a Python file within this directory:</p>
<pre><code class="language-bash">sudo nano /var/www/myapp/myapp.wsgi
</code></pre>
 Add the following code:</p>
<pre><code class="language-python">def application(environ, start_response):
    status = '200 OK'
    output = b'Hello, World!'

    response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]
</code></pre>
</li>
<li>
 <strong>Save and Close</strong> the file.</p>
</li>
</ol>
<hr>
<h3><strong>9. Step 6: Configuring mod_wsgi to Serve Your Application</strong></h3>
 Now that the application is ready, let’s configure Apache to serve it.</p>
<ol>
<li>
 <strong>Create a Virtual Host for Your Application</strong>:</p>
 Open a new Apache configuration file for the virtual host:</p>
<pre><code class="language-bash">sudo nano /etc/httpd/conf.d/myapp.conf
</code></pre>
</li>
<li>
 <strong>Configure the Virtual Host</strong>:</p>
 In this configuration file, add the following code (replace <code>mydomain.com</code> with your actual domain):</p>
<pre><code class="language-apache">&lt;VirtualHost *:80&gt;
    ServerName mydomain.com
    WSGIScriptAlias / /var/www/myapp/myapp.wsgi

    &lt;Directory /var/www/myapp&gt;
        Require all granted
    &lt;/Directory&gt;

    ErrorLog /var/log/httpd/myapp_error.log
    CustomLog /var/log/httpd/myapp_access.log combined
&lt;/VirtualHost&gt;
</code></pre>
 This configuration tells Apache to serve your application when someone accesses <code>mydomain.com</code>.</p>
</li>
<li>
 <strong>Save and Close</strong> the file.</p>
</li>
</ol>
<hr>
<h3><strong>10. Step 7: Testing the Configuration</strong></h3>
 With everything set up, it’s time to test the configuration.</p>
<ol>
<li>
 <strong>Restart Apache</strong> to apply the new configuration:</p>
<pre><code class="language-bash">sudo systemctl restart httpd
</code></pre>
</li>
<li>
 <strong>Test the Application</strong>:</p>
 Open a browser and navigate to <code>http://mydomain.com</code>. You should see the message “Hello, World!” indicating that your application is being served correctly.</p>
</li>
</ol>
<hr>
<h3><strong>11. Common Errors and Troubleshooting</strong></h3>
 <strong>Issue</strong>: <em>500 Internal Server Error</em><br>
<strong>Solution</strong>: Check the <code>myapp_error.log</code> file in <code>/var/log/httpd/</code> for more information. Often, this error occurs due to permission issues or incorrect WSGI file paths.</p>
 <strong>Issue</strong>: <em>Module not found errors</em><br>
<strong>Solution</strong>: Ensure all Python dependencies are installed in the Python environment specified in <code>WSGIPythonHome</code>. Using a virtual environment can help manage dependencies cleanly.</p>
 <strong>Issue</strong>: <em>Cannot locate mod_wsgi.so</em><br>
<strong>Solution</strong>: Double-check the <code>LoadModule</code> path in the Apache configuration. The <code>mod_wsgi-express module-config</code> command typically provides the correct path.</p>
<hr>
<h3><strong>12. FAQ on mod_wsgi Configuration for AlmaLinux 9</strong></h3>
 <strong>Q1: Can I use mod_wsgi with a virtual environment?</strong><br>
A: Yes, simply point <code>WSGIPythonHome</code> to your virtual environment’s location, and make sure all required packages are installed there.</p>
 <strong>Q2: How do I configure mod_wsgi for HTTPS?</strong><br>
A: Configure Apache for SSL by installing <code>mod_ssl</code>, then update your VirtualHost configuration to listen on port 443 and include the SSL certificate and key paths.</p>
 <strong>Q3: How can I use multiple Python versions with mod_wsgi?</strong><br>
A: Install different Python versions and specify the desired version with <code>WSGIPythonHome</code>.</p>
 <strong>Q4: Does mod_wsgi support multiprocessing?</strong><br>
A: Yes, mod_wsgi supports both multi-threading and multi-processing, configurable via the <code>WSGIDaemonProcess</code> directive.</p>
 <strong>Q5: What permissions should my application directory have?</strong><br>
A: Set permissions so that the Apache user (<code>apache</code> or <code>www-data</code>) has read access to the directory and execute access to the files.</p>
<hr>
 With these steps, you’ve successfully configured mod_wsgi on AlmaLinux 9, giving you a reliable, scalable, and production-ready environment for your Python applications. Enjoy the power and flexibility of deploying your Python apps with mod_wsgi!</p>
</div>
<!-- /wp:jetpack/markdown -->