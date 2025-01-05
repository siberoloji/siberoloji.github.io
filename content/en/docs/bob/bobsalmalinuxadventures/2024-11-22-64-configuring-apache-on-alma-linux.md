---
draft: false
title: Configuring Apache on AlmaLinux
linkTitle: Configuring Apache
keywords:
  - Apache on AlmaLinux
description: Known for its flexibility and stability, Apache on AlmaLinux was a perfect fit for web services
date: 2024-11-24
url: configuring-apache-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 640
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure took him into the world of web services. His team needed a reliable web server to host the company’s website, and Apache was the obvious choice. Known for its flexibility and stability, Apache on AlmaLinux was a perfect fit.  

> *“If I can serve files with SSH, I can surely serve web pages with Apache!”* Bob thought, excited to dive in.

---

### **Chapter Outline: "Bob Configures Apache Web Server on AlmaLinux"**

1. **Introduction: Why Apache?**  
   - A brief overview of the Apache HTTP server and its key features.
   - Bob learns about Virtual Hosts, SSL, and modules.

2. **Installing Apache on AlmaLinux**  
   - Installing the `httpd` package.
   - Enabling and starting the Apache service.

3. **Configuring the Default Website**  
   - Setting up the default document root.
   - Testing Apache with a basic HTML page.

4. **Setting Up Virtual Hosts**  
   - Hosting multiple websites on the same server.
   - Configuring and testing Virtual Hosts.

5. **Enabling and Testing SSL with Let’s Encrypt**  
   - Installing Certbot.
   - Enabling HTTPS for secure connections.

6. **Optimizing Apache Performance**  
   - Enabling caching with `mod_cache`.
   - Configuring other useful modules like `mod_rewrite`.

7. **Troubleshooting Common Apache Issues**  
   - Diagnosing problems with logs and commands.

8. **Conclusion: Bob Reflects on His Apache Journey**

---

#### **1. Introduction: Why Apache?**

Bob discovered that Apache is one of the most popular web servers globally, powering countless websites. Its modular architecture allows for flexibility, making it suitable for everything from small personal blogs to enterprise applications.

> *“Apache is the Swiss army knife of web servers—let’s get it running!”* Bob said, ready to begin.

---

### **Part 1: Installing Apache on AlmaLinux**

#### **Step 1: Installing the Apache HTTP Server**  

To get started, Bob installed the `httpd` package, which contains the Apache HTTP server.  

- Install Apache:

  ```bash
  sudo dnf install -y httpd
  ```

#### **Step 2: Enabling and Starting the Apache Service**  

Bob enabled Apache to start automatically at boot and then started the service.  

- Enable Apache at boot:

  ```bash
  sudo systemctl enable httpd --now
  ```

- Check the status of the Apache service:

  ```bash
  sudo systemctl status httpd
  ```

  If running successfully, Bob would see:

  ```bash
  ● httpd.service - The Apache HTTP Server
       Active: active (running) since ...
  ```

> *“Apache is up and running—time to see it in action!”* Bob said, ready to test his new server.

---

### **Part 2: Configuring the Default Website**

#### **Step 1: Setting Up the Default Document Root**  

The default document root for Apache on AlmaLinux is `/var/www/html`. Bob placed a simple HTML file there to test the setup.

- Create a test HTML file:

  ```bash
  echo "<h1>Welcome to Bob's Apache Server!</h1>" | sudo tee /var/www/html/index.html
  ```

#### **Step 2: Testing Apache**  

Bob opened a browser and navigated to his server’s IP address (`http://<server-ip>`). If everything was working, he saw the welcome message displayed.

> *“It works! I’m officially a web server admin now!”* Bob cheered.

---

### **Part 3: Setting Up Virtual Hosts**

Bob’s manager asked him to host multiple websites on the same server. He learned that Apache’s Virtual Hosts feature makes this easy.

#### **Step 1: Creating Directory Structures**  

Bob created separate directories for each website under `/var/www`.  

- Example for two sites (`site1` and `site2`):

  ```bash
  sudo mkdir -p /var/www/site1 /var/www/site2
  ```

- Add a sample HTML file for each site:

  ```bash
  echo "<h1>Welcome to Site 1</h1>" | sudo tee /var/www/site1/index.html
  echo "<h1>Welcome to Site 2</h1>" | sudo tee /var/www/site2/index.html
  ```

#### **Step 2: Configuring Virtual Hosts**  

Bob created separate configuration files for each site.

- Create a Virtual Host file for `site1`:

  ```bash
  sudo nano /etc/httpd/conf.d/site1.conf
  ```

  Add the following configuration:

  ```plaintext
  <VirtualHost *:80>
      ServerName site1.local
      DocumentRoot /var/www/site1
      ErrorLog /var/log/httpd/site1-error.log
      CustomLog /var/log/httpd/site1-access.log combined
  </VirtualHost>
  ```

- Repeat for `site2` with the respective details.

#### **Step 3: Testing Virtual Hosts**  

- Add the server names to the local `/etc/hosts` file for testing:

  ```plaintext
  127.0.0.1   site1.local
  127.0.0.1   site2.local
  ```

- Restart Apache:

  ```bash
  sudo systemctl restart httpd
  ```

- Visit `http://site1.local` and `http://site2.local` in the browser. Each site displayed its respective message.

> *“Virtual Hosts make managing multiple sites a breeze!”* Bob said, impressed.

---

### **Part 4: Enabling and Testing SSL with Let’s Encrypt**

Bob knew that secure connections (HTTPS) were critical for modern websites.

#### **Step 1: Installing Certbot**  

Bob installed Certbot to obtain and manage SSL certificates.

- Install Certbot and Apache plugin:

  ```bash
  sudo dnf install -y certbot python3-certbot-apache
  ```

#### **Step 2: Obtaining and Enabling an SSL Certificate**  

Bob ran Certbot to obtain a certificate for his site.

- Example for `site1.com`:

  ```bash
  sudo certbot --apache -d site1.com
  ```

Certbot automatically configured Apache for HTTPS. Bob tested the site with `https://site1.com` and saw the green lock icon.

---

### **Part 5: Optimizing Apache Performance**

Bob explored performance optimizations to ensure his server could handle traffic efficiently.

- **Enable caching** with `mod_cache`:

  ```bash
  sudo dnf install -y mod_cache
  ```

- **Rewrite rules** with `mod_rewrite`:

  ```bash
  sudo nano /etc/httpd/conf/httpd.conf
  ```

  Add:

  ```plaintext
  LoadModule rewrite_module modules/mod_rewrite.so
  ```

- Restart Apache to apply changes:

  ```bash
  sudo systemctl restart httpd
  ```

---

### **Part 6: Troubleshooting Apache**

Bob encountered a few hiccups, but he was ready to troubleshoot:

1. **Apache not starting**:
   - Check the logs:

     ```bash
     sudo journalctl -u httpd
     ```

2. **Forbidden error (403)**:
   - Ensure proper permissions:

     ```bash
     sudo chmod -R 755 /var/www
     ```

3. **Website not loading**:
   - Verify Virtual Host configuration and DNS settings.

---

### **Conclusion: Bob Reflects on His Apache Journey**

With Apache configured and optimized, Bob successfully hosted multiple secure websites. He leaned back, proud of his accomplishments.  

> Next, Bob plans to explore **Nginx as a Reverse Proxy on AlmaLinux**.
