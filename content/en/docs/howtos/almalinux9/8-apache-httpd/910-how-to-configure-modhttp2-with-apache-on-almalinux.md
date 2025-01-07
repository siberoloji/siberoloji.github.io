---
title: How to Configure mod_http2 with Apache on AlmaLinux
linkTitle: mod_http2 with Apache
description: This guide will walk you through the steps to enable and configure `mod_http2` with Apache on AlmaLinux, ensuring your server delivers optimized performance.
date: 2024-12-18
weight: 910
url: configure-mod-http2-apache-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux


featured_image: /images/almalinux.webp
---
The HTTP/2 protocol is the modern standard for faster and more efficient communication between web servers and clients. It significantly improves web performance with features like multiplexing, header compression, and server push. Configuring `mod_http2` on Apache for AlmaLinux allows you to harness these benefits while staying up to date with industry standards.

This detailed guide will walk you through the steps to enable and configure `mod_http2` with Apache on AlmaLinux, ensuring your server delivers optimized performance.

---

### Prerequisites

Before proceeding, ensure you have the following:

1. **AlmaLinux 8 or later** installed on your server.
2. **Apache web server (httpd)** installed and running.
3. **SSL/TLS certificates** (e.g., from Let's Encrypt) configured on your server, as HTTP/2 requires HTTPS.
4. Basic knowledge of Linux commands and terminal usage.

---

### Step 1: Update the System and Apache

Keeping your system and software updated ensures stability and security. Update all packages with the following commands:

```bash
sudo dnf update -y
sudo dnf install httpd -y
```

After updating Apache, check its version:

```bash
httpd -v
```

Ensure you’re using Apache version 2.4.17 or later, as HTTP/2 support was introduced in this version. AlmaLinux’s default repositories provide a compatible version.

---

### Step 2: Enable Required Modules

Apache requires specific modules for HTTP/2 functionality. These modules include:

1. **mod_http2**: Implements the HTTP/2 protocol.
2. **mod_ssl**: Enables SSL/TLS, which is mandatory for HTTP/2.

Enable these modules using the following commands:

```bash
sudo dnf install mod_http2 mod_ssl -y
```

Verify that the modules are installed and loaded:

```bash
httpd -M | grep http2
httpd -M | grep ssl
```

If they’re not enabled, load them by editing the Apache configuration file.

---

### Step 3: Configure mod_http2 in Apache

To enable HTTP/2 globally or for specific virtual hosts, you need to modify Apache’s configuration files.

1. **Edit the Main Configuration File**

   Open the main Apache configuration file:

   ```bash
   sudo nano /etc/httpd/conf/httpd.conf
   ```

   Add or modify the following lines to enable HTTP/2:

   ```apache
   LoadModule http2_module modules/mod_http2.so
   Protocols h2 h2c http/1.1
   ```

   - `h2`: Enables HTTP/2 over HTTPS.
   - `h2c`: Enables HTTP/2 over plain TCP (rarely used; optional).

2. **Edit the SSL Configuration**

   HTTP/2 requires HTTPS, so update the SSL configuration:

   ```bash
   sudo nano /etc/httpd/conf.d/ssl.conf
   ```

   Add the `Protocols` directive to the SSL virtual host section:

   ```apache
   <VirtualHost *:443>
       Protocols h2 http/1.1
       SSLEngine on
       SSLCertificateFile /path/to/certificate.crt
       SSLCertificateKeyFile /path/to/private.key
       ...
   </VirtualHost>
   ```

   Replace `/path/to/certificate.crt` and `/path/to/private.key` with the paths to your SSL certificate and private key.

3. **Save and Exit**  
   Press `Ctrl+O` to save the file, then `Ctrl+X` to exit.

---

### Step 4: Restart Apache

Restart Apache to apply the changes:

```bash
sudo systemctl restart httpd
```

Verify that the service is running without errors:

```bash
sudo systemctl status httpd
```

---

### Step 5: Verify HTTP/2 Configuration

After enabling HTTP/2, you should verify that your server is using the protocol. There are several ways to do this:

1. **Using curl**

   Run the following command to test the HTTP/2 connection:

   ```bash
   curl -I --http2 -k https://your-domain.com
   ```

   Look for the `HTTP/2` in the output. If successful, you’ll see something like this:

   ```plaintext
   HTTP/2 200
   ```

2. **Using Browser Developer Tools**

   Open your website in a browser like Chrome or Firefox. Then:
   - Open the **Developer Tools** (right-click > Inspect or press `F12`).
   - Navigate to the **Network** tab.
   - Reload the page and check the **Protocol** column. It should show `h2` for HTTP/2.

3. **Online HTTP/2 Testing Tools**

   Use tools like [KeyCDN’s HTTP/2 Test](https://tools.keycdn.com/http2-test) to verify your configuration.

---

### Step 6: Optimize HTTP/2 Configuration (Optional)

To fine-tune HTTP/2 performance, you can adjust several Apache directives.

1. **Adjust Maximum Concurrent Streams**

   Control the maximum number of concurrent streams per connection by adding the following directive to your configuration:

   ```apache
   H2MaxSessionStreams 100
   ```

   The default is usually sufficient, but for high-traffic sites, increasing this value can improve performance.

2. **Enable Server Push**

   HTTP/2 Server Push allows Apache to proactively send resources to the client. Enable it by adding:

   ```apache
   H2Push on
   ```

   For example, to push CSS and JS files, use:

   ```apache
   <Location />
       Header add Link "</styles.css>; rel=preload; as=style"
       Header add Link "</script.js>; rel=preload; as=script"
   </Location>
   ```

3. **Enable Compression**

   Use `mod_deflate` to compress content, which works well with HTTP/2:

   ```apache
   AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css application/javascript
   ```

4. **Prioritize HTTPS**

   Ensure your site redirects all HTTP traffic to HTTPS to fully utilize HTTP/2:

   ```apache
   <VirtualHost *:80>
       ServerName your-domain.com
       Redirect permanent / https://your-domain.com/
   </VirtualHost>
   ```

---

### Troubleshooting HTTP/2 Issues

If HTTP/2 isn’t working as expected, check the following:

1. **Apache Logs**
   Review the error logs for any configuration issues:

   ```bash
   sudo tail -f /var/log/httpd/error_log
   ```

2. **OpenSSL Version**
   HTTP/2 requires OpenSSL 1.0.2 or later. Check your OpenSSL version:

   ```bash
   openssl version
   ```

   If it’s outdated, upgrade to a newer version.

3. **Firewall Rules**
   Ensure ports 80 (HTTP) and 443 (HTTPS) are open:

   ```bash
   sudo firewall-cmd --add-service=http --permanent
   sudo firewall-cmd --add-service=https --permanent
   sudo firewall-cmd --reload
   ```

---

### Conclusion

Configuring `mod_http2` with Apache on AlmaLinux enhances your server's performance and provides a better user experience by utilizing the modern HTTP/2 protocol. With multiplexing, server push, and improved security, HTTP/2 is a must-have for websites aiming for speed and efficiency.

By following this guide, you’ve not only enabled HTTP/2 on your AlmaLinux server but also optimized its configuration for maximum performance. Take the final step to test your setup and enjoy the benefits of a modern, efficient web server.

For any questions or further clarification, feel free to leave a comment below!
