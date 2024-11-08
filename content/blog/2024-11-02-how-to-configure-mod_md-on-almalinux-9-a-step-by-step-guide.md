---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
date: "2024-11-02T13:31:08Z"
excerpt: This guide will take you through the process, step-by-step, to ensure a smooth
  setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS.
guid: https://www.siberoloji.com/?p=5854
id: 5854
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- mod_md
title: 'How to Configure mod_md on AlmaLinux 9: A Step-by-Step Guide'
url: /how-to-configure-mod_md-on-almalinux-9-a-step-by-step-guide/
---

<!-- wp:jetpack/markdown {"source":"Configuring mod_md on AlmaLinux 9 is an essential step for users looking to implement automatic management of Let's Encrypt SSL certificates for Apache-based web servers. With **mod_md** (short for *modular mod_md*), Apache 2.4+ users can simplify SSL certificate management by allowing automatic creation, renewal, and loading of certificates. This guide will take you through the process, step-by-step, to ensure a smooth setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS.\n\n\u002d\u002d-\n\n### **1. Introduction to mod_md**\n\n**mod_md** is an Apache module that manages SSL certificates directly on the server. It communicates with the Let's Encrypt certificate authority (CA) to automate the generation and renewal of SSL certificates, ensuring your website remains secure without manual intervention.\n\n\u002d\u002d-\n\n### **2. Why Use mod_md on AlmaLinux 9?**\n\n- **Automated Certificate Management**: mod_md minimizes manual SSL handling by managing the entire SSL lifecycle, from issuing to renewal.\n- **Enhanced Security**: The automatic renewal feature of mod_md keeps your site protected, maintaining a high level of SSL encryption.\n- **Compatibility with Let's Encrypt**: mod_md works seamlessly with Let's Encrypt, one of the most popular CAs for SSL certificates.\n\n\u002d\u002d-\n\n### **3. Prerequisites for mod_md Configuration**\n\nBefore starting the configuration process, ensure that:\n\n1. **AlmaLinux 9** is up and running.\n2. **Apache HTTP Server (version 2.4.30 or higher)** is installed.\n3. **Root or sudo access** to install and configure software.\n4. **Domain name(s)** you own and have control over.\n\n\u002d\u002d-\n\n### **4. Step 1: Installing mod_md on AlmaLinux 9**\n\nThe first step is to check if mod_md is installed as part of the Apache installation on AlmaLinux 9.\n\n1. **Install Apache** (if it isn't already installed):\n\n   ```bash\n   sudo dnf install httpd -y\n   ```\n\n2. **Enable mod_md**:\n\n   AlmaLinux 9 typically includes mod_md in the Apache installation. To confirm, use the command:\n\n   ```bash\n   httpd -M | grep md\n   ```\n\n   If the output shows `md_module`, mod_md is already enabled. If it isn’t, you may need to install additional packages or update Apache.\n\n3. **Start and Enable Apache**:\n\n   ```bash\n   sudo systemctl start httpd\n   sudo systemctl enable httpd\n   ```\n\n\u002d\u002d-\n\n### **5. Step 2: Configuring mod_md**\n\nThe core configuration for mod_md occurs within the Apache configuration files. Follow these steps to ensure mod_md is set up properly:\n\n1. **Edit the Apache configuration file** (typically located in `/etc/httpd/conf/httpd.conf`):\n\n   ```bash\n   sudo nano /etc/httpd/conf/httpd.conf\n   ```\n\n2. **Load mod_md**: Add the following lines if they aren’t present:\n\n   ```apache\n   LoadModule md_module modules/mod_md.so\n   ```\n\n3. **Define Managed Domains**: mod_md requires specifying the domain(s) you wish to manage. Add the following lines to configure mod_md for your domain (replace `yourdomain.com` with your actual domain):\n\n   ```apache\n   MDomain yourdomain.com www.yourdomain.com\n   ```\n\n4. **Specify the Contact Email**: This email is used to communicate with Let's Encrypt in case of issues. Add the line:\n\n   ```apache\n   MDContactEmail admin@yourdomain.com\n   ```\n\n5. **Save and Close** the configuration file.\n\n\u002d\u002d-\n\n### **6. Step 3: Setting up Domain Management (MDomain)**\n\nThe `MDomain` directive defines which domains mod_md should manage. If you have multiple domains, you can add them in the same directive:\n\n```apache\nMDomain example.com www.example.com sub.example.com\n```\n\nmod_md will create a single certificate valid for all specified domains. Ensure that DNS records for each domain point to your server.\n\n\u002d\u002d-\n\n### **7. Step 4: Configuring mod_md for Automatic Certificate Renewal**\n\nmod_md automates certificate renewal for your domains. By default, it will attempt to renew certificates when they are within 30 days of expiration. You can adjust this setting as follows:\n\n1. **Edit Apache configuration file** and add the `MDRenewWindow` directive:\n\n   ```apache\n   MDRenewWindow 33%\n   ```\n\n   This example sets the renewal window to 33% of the certificate’s lifetime, which is approximately 30 days for Let’s Encrypt certificates.\n\n2. **Specify Challenge Types**: Configure mod_md to use the `http-01` challenge (default) for domain validation:\n\n   ```apache\n   MDChallengeHttp01 on\n   ```\n\n   This lets mod_md validate domains via HTTP, which is the most common method.\n\n\u002d\u002d-\n\n### **8. Step 5: Testing and Enabling HTTPS**\n\nWith mod_md set up, you can test it by requesting a certificate manually. Follow these steps:\n\n1. **Restart Apache** to apply the configuration changes:\n\n   ```bash\n   sudo systemctl restart httpd\n   ```\n\n2. **Request a Certificate** manually (useful for testing):\n\n   ```bash\n   sudo apachectl -M yourdomain.com\n   ```\n\n3. **Verify Certificate Installation**:\n\n   Visit `https://yourdomain.com` in your web browser to confirm the SSL certificate is active.\n\n4. **Set HTTPS as the Default Protocol**:\n\n   Edit the Virtual Host configuration for your domain in `/etc/httpd/conf.d/ssl.conf`, adding the following:\n\n   ```apache\n   \n       ServerName yourdomain.com\n       DocumentRoot /var/www/html\n       SSLEngine on\n       SSLCertificateFile /path/to/fullchain.pem\n       SSLCertificateKeyFile /path/to/privkey.pem\n   \n   ```\n\n   Be sure to replace `/path/to/fullchain.pem` and `/path/to/privkey.pem` with the actual paths where mod_md stores certificates (typically under `/var/www/.well-known/acme-challenge`).\n\n\u002d\u002d-\n\n### **9. Troubleshooting Common Issues**\n\n- **Issue**: *Certificate renewal fails.*\n  - **Solution**: Verify DNS settings and domain ownership. Ensure Apache is configured to listen on ports 80 and 443.\n  \n- **Issue**: *Permission denied errors when renewing certificates.*\n  - **Solution**: Check permissions on the challenge directories. Ensure Apache has write access to `.well-known/acme-challenge`.\n\n- **Issue**: *HTTP challenges failing.*\n  - **Solution**: Confirm port 80 is open and no firewall is blocking access. This can usually be checked using `firewalld`.\n\n\u002d\u002d-\n\n### **10. FAQ on mod_md Configuration for AlmaLinux 9**\n\n**Q1: What is the main benefit of using mod_md with Let's Encrypt on AlmaLinux?**  \nA: The primary benefit is automation; mod_md manages SSL certificates, including automatic renewals, without manual intervention.\n\n**Q2: Do I need a dedicated IP address to use mod_md?**  \nA: No, mod_md works with virtual hosts, so a dedicated IP is not required.\n\n**Q3: How can I monitor the status of my certificates?**  \nA: You can use `apachectl -M` or check the `/var/www/.well-known/acme-challenge` directory to monitor certificate status.\n\n**Q4: What if I want to disable mod_md for a specific domain?**  \nA: Remove the `MDomain` directive for that domain from the Apache configuration and restart Apache.\n\n**Q5: How often will mod_md attempt to renew my certificates?**  \nA: By default, mod_md renews certificates within 30 days of expiration, which can be configured with `MDRenewWindow`.\n\n**Q6: Is mod_md compatible with other CAs besides Let's Encrypt?**  \nA: Yes, mod_md supports ACME protocols compatible with other CAs. However, Let's Encrypt is the default choice.\n\n\u002d\u002d-\n\nWith this configuration, mod_md on AlmaLinux 9 enables a smooth, secure, and automatic SSL setup. By following these steps, you ensure your web server is protected with the latest certificates without manual renewals."} -->
<div class="wp-block-jetpack-markdown"> Configuring mod_md on AlmaLinux 9 is an essential step for users looking to implement automatic management of Let’s Encrypt SSL certificates for Apache-based web servers. With <strong>mod_md</strong> (short for <em>modular mod_md</em>), Apache 2.4+ users can simplify SSL certificate management by allowing automatic creation, renewal, and loading of certificates. This guide will take you through the process, step-by-step, to ensure a smooth setup on AlmaLinux 9, an enterprise-grade, open-source Linux OS. 
<hr>
<h3><strong>1. Introduction to mod_md</strong></h3>
 <strong>mod_md</strong> is an Apache module that manages SSL certificates directly on the server. It communicates with the Let’s Encrypt certificate authority (CA) to automate the generation and renewal of SSL certificates, ensuring your website remains secure without manual intervention. 
<hr>
<h3><strong>2. Why Use mod_md on AlmaLinux 9?</strong></h3>
<ul>
<li><strong>Automated Certificate Management</strong>: mod_md minimizes manual SSL handling by managing the entire SSL lifecycle, from issuing to renewal.</li>
<li><strong>Enhanced Security</strong>: The automatic renewal feature of mod_md keeps your site protected, maintaining a high level of SSL encryption.</li>
<li><strong>Compatibility with Let’s Encrypt</strong>: mod_md works seamlessly with Let’s Encrypt, one of the most popular CAs for SSL certificates.</li>
</ul>
<hr>
<h3><strong>3. Prerequisites for mod_md Configuration</strong></h3>
 Before starting the configuration process, ensure that: 
<ol>
<li><strong>AlmaLinux 9</strong> is up and running.</li>
<li><strong>Apache HTTP Server (version 2.4.30 or higher)</strong> is installed.</li>
<li><strong>Root or sudo access</strong> to install and configure software.</li>
<li><strong>Domain name(s)</strong> you own and have control over.</li>
</ol>
<hr>
<h3><strong>4. Step 1: Installing mod_md on AlmaLinux 9</strong></h3>
 The first step is to check if mod_md is installed as part of the Apache installation on AlmaLinux 9. 
<ol>
<li>
 <strong>Install Apache</strong> (if it isn’t already installed): 
<pre><code class="language-bash">sudo dnf install httpd -y
</code></pre>
</li>
<li>
 <strong>Enable mod_md</strong>: 
 AlmaLinux 9 typically includes mod_md in the Apache installation. To confirm, use the command: 
<pre><code class="language-bash">httpd -M | grep md
</code></pre>
 If the output shows <code>md_module</code>, mod_md is already enabled. If it isn’t, you may need to install additional packages or update Apache. 
</li>
<li>
 <strong>Start and Enable Apache</strong>: 
<pre><code class="language-bash">sudo systemctl start httpd
sudo systemctl enable httpd
</code></pre>
</li>
</ol>
<hr>
<h3><strong>5. Step 2: Configuring mod_md</strong></h3>
 The core configuration for mod_md occurs within the Apache configuration files. Follow these steps to ensure mod_md is set up properly: 
<ol>
<li>
 <strong>Edit the Apache configuration file</strong> (typically located in <code>/etc/httpd/conf/httpd.conf</code>): 
<pre><code class="language-bash">sudo nano /etc/httpd/conf/httpd.conf
</code></pre>
</li>
<li>
 <strong>Load mod_md</strong>: Add the following lines if they aren’t present: 
<pre><code class="language-apache">LoadModule md_module modules/mod_md.so
</code></pre>
</li>
<li>
 <strong>Define Managed Domains</strong>: mod_md requires specifying the domain(s) you wish to manage. Add the following lines to configure mod_md for your domain (replace <code>yourdomain.com</code> with your actual domain): 
<pre><code class="language-apache">MDomain yourdomain.com www.yourdomain.com
</code></pre>
</li>
<li>
 <strong>Specify the Contact Email</strong>: This email is used to communicate with Let’s Encrypt in case of issues. Add the line: 
<pre><code class="language-apache">MDContactEmail admin@yourdomain.com
</code></pre>
</li>
<li>
 <strong>Save and Close</strong> the configuration file. 
</li>
</ol>
<hr>
<h3><strong>6. Step 3: Setting up Domain Management (MDomain)</strong></h3>
 The <code>MDomain</code> directive defines which domains mod_md should manage. If you have multiple domains, you can add them in the same directive: 
<pre><code class="language-apache">MDomain example.com www.example.com sub.example.com
</code></pre>
 mod_md will create a single certificate valid for all specified domains. Ensure that DNS records for each domain point to your server. 
<hr>
<h3><strong>7. Step 4: Configuring mod_md for Automatic Certificate Renewal</strong></h3>
 mod_md automates certificate renewal for your domains. By default, it will attempt to renew certificates when they are within 30 days of expiration. You can adjust this setting as follows: 
<ol>
<li>
 <strong>Edit Apache configuration file</strong> and add the <code>MDRenewWindow</code> directive: 
<pre><code class="language-apache">MDRenewWindow 33%
</code></pre>
 This example sets the renewal window to 33% of the certificate’s lifetime, which is approximately 30 days for Let’s Encrypt certificates. 
</li>
<li>
 <strong>Specify Challenge Types</strong>: Configure mod_md to use the <code>http-01</code> challenge (default) for domain validation: 
<pre><code class="language-apache">MDChallengeHttp01 on
</code></pre>
 This lets mod_md validate domains via HTTP, which is the most common method. 
</li>
</ol>
<hr>
<h3><strong>8. Step 5: Testing and Enabling HTTPS</strong></h3>
 With mod_md set up, you can test it by requesting a certificate manually. Follow these steps: 
<ol>
<li>
 <strong>Restart Apache</strong> to apply the configuration changes: 
<pre><code class="language-bash">sudo systemctl restart httpd
</code></pre>
</li>
<li>
 <strong>Request a Certificate</strong> manually (useful for testing): 
<pre><code class="language-bash">sudo apachectl -M yourdomain.com
</code></pre>
</li>
<li>
 <strong>Verify Certificate Installation</strong>: 
 Visit <code>https://yourdomain.com</code> in your web browser to confirm the SSL certificate is active. 
</li>
<li>
 <strong>Set HTTPS as the Default Protocol</strong>: 
 Edit the Virtual Host configuration for your domain in <code>/etc/httpd/conf.d/ssl.conf</code>, adding the following: 
<pre><code class="language-apache">&lt;VirtualHost *:443&gt;
    ServerName yourdomain.com
    DocumentRoot /var/www/html
    SSLEngine on
    SSLCertificateFile /path/to/fullchain.pem
    SSLCertificateKeyFile /path/to/privkey.pem
&lt;/VirtualHost&gt;
</code></pre>
 Be sure to replace <code>/path/to/fullchain.pem</code> and <code>/path/to/privkey.pem</code> with the actual paths where mod_md stores certificates (typically under <code>/var/www/.well-known/acme-challenge</code>). 
</li>
</ol>
<hr>
<h3><strong>9. Troubleshooting Common Issues</strong></h3>
<ul>
<li>
 <strong>Issue</strong>: <em>Certificate renewal fails.</em> 
<ul>
<li><strong>Solution</strong>: Verify DNS settings and domain ownership. Ensure Apache is configured to listen on ports 80 and 443.</li>
</ul>
</li>
<li>
 <strong>Issue</strong>: <em>Permission denied errors when renewing certificates.</em> 
<ul>
<li><strong>Solution</strong>: Check permissions on the challenge directories. Ensure Apache has write access to <code>.well-known/acme-challenge</code>.</li>
</ul>
</li>
<li>
 <strong>Issue</strong>: <em>HTTP challenges failing.</em> 
<ul>
<li><strong>Solution</strong>: Confirm port 80 is open and no firewall is blocking access. This can usually be checked using <code>firewalld</code>.</li>
</ul>
</li>
</ul>
<hr>
<h3><strong>10. FAQ on mod_md Configuration for AlmaLinux 9</strong></h3>
 <strong>Q1: What is the main benefit of using mod_md with Let’s Encrypt on AlmaLinux?</strong><br>
A: The primary benefit is automation; mod_md manages SSL certificates, including automatic renewals, without manual intervention. 
 <strong>Q2: Do I need a dedicated IP address to use mod_md?</strong><br>
A: No, mod_md works with virtual hosts, so a dedicated IP is not required. 
 <strong>Q3: How can I monitor the status of my certificates?</strong><br>
A: You can use <code>apachectl -M</code> or check the <code>/var/www/.well-known/acme-challenge</code> directory to monitor certificate status. 
 <strong>Q4: What if I want to disable mod_md for a specific domain?</strong><br>
A: Remove the <code>MDomain</code> directive for that domain from the Apache configuration and restart Apache. 
 <strong>Q5: How often will mod_md attempt to renew my certificates?</strong><br>
A: By default, mod_md renews certificates within 30 days of expiration, which can be configured with <code>MDRenewWindow</code>. 
 <strong>Q6: Is mod_md compatible with other CAs besides Let’s Encrypt?</strong><br>
A: Yes, mod_md supports ACME protocols compatible with other CAs. However, Let’s Encrypt is the default choice. 
<hr>
 With this configuration, mod_md on AlmaLinux 9 enables a smooth, secure, and automatic SSL setup. By following these steps, you ensure your web server is protected with the latest certificates without manual renewals. 
</div>
<!-- /wp:jetpack/markdown -->