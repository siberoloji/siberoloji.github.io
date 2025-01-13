---
draft: false
title: Bob Builds and Manages Web Servers with AlmaLinux
linkTitle: Set up and manage web servers
keywords: ""
description: Set up and manage web servers using Apache and Nginx on AlmaLinux.
date: 2024-12-11
url: bob-builds-manages-web-servers-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 910
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to set up and manage **web servers** using **Apache** and **Nginx** on AlmaLinux. Web servers form the backbone of modern applications, and mastering them would make Bob an indispensable system administrator.

> *“Web servers bring the internet to life—time to set up mine!”* Bob said as he prepared to dive in.

---

### **Chapter Outline: "Bob Builds and Manages Web Servers"**

1. **Introduction: Apache vs. Nginx**
   - Overview of web server use cases.
   - Differences between Apache and Nginx.

2. **Setting Up Apache on AlmaLinux**
   - Installing and configuring Apache.
   - Hosting multiple websites with virtual hosts.

3. **Setting Up Nginx**
   - Installing and configuring Nginx.
   - Using Nginx as a reverse proxy.

4. **Securing Web Servers**
   - Enabling HTTPS with Let’s Encrypt.
   - Configuring firewalls and SELinux.

5. **Optimizing Web Server Performance**
   - Caching and load balancing with Nginx.
   - Using Apache’s `mod_cache` and tuning.

6. **Monitoring and Managing Web Servers**
   - Monitoring logs and resource usage.
   - Automating maintenance tasks.

7. **Conclusion: Bob Reflects on Web Server Mastery**

---

### **Part 1: Apache vs. Nginx**

Bob learned that **Apache** and **Nginx** are the most widely used web servers, each with unique strengths.

#### **Apache**

- Modular and easy to configure.
- Great for dynamic content with `.htaccess` support.

#### **Nginx**

- Lightweight and high-performance.
- Excellent as a reverse proxy and for static content.

> *“Both have their strengths—let’s master them!”* Bob said.

---

### **Part 2: Setting Up Apache on AlmaLinux**

#### **Step 1: Installing Apache**

- Install Apache:

  ```bash
  sudo dnf install -y httpd
  ```

- Enable and start Apache:

  ```bash
  sudo systemctl enable httpd --now
  ```

- Test the setup:

  ```bash
  curl http://localhost
  ```

#### **Step 2: Hosting Multiple Websites**

- Create directories for two websites:

  ```bash
  sudo mkdir -p /var/www/site1 /var/www/site2
  ```

- Create test `index.html` files:

  ```bash
  echo "Welcome to Site 1" | sudo tee /var/www/site1/index.html
  echo "Welcome to Site 2" | sudo tee /var/www/site2/index.html
  ```

- Configure virtual hosts:

  ```bash
  sudo nano /etc/httpd/conf.d/site1.conf
  ```

  ```plaintext
  <VirtualHost *:80>
      DocumentRoot "/var/www/site1"
      ServerName site1.local
  </VirtualHost>
  ```

  ```bash
  sudo nano /etc/httpd/conf.d/site2.conf
  ```

  ```plaintext
  <VirtualHost *:80>
      DocumentRoot "/var/www/site2"
      ServerName site2.local
  </VirtualHost>
  ```

- Restart Apache:

  ```bash
  sudo systemctl restart httpd
  ```

- Test the setup by editing `/etc/hosts` to resolve the domain names locally.

> *“Virtual hosts make it easy to host multiple sites!”* Bob noted.

---

### **Part 3: Setting Up Nginx**

#### **Step 1: Installing Nginx**

- Install Nginx:

  ```bash
  sudo dnf install -y nginx
  ```

- Enable and start Nginx:

  ```bash
  sudo systemctl enable nginx --now
  ```

- Test the setup:

  ```bash
  curl http://localhost
  ```

#### **Step 2: Using Nginx as a Reverse Proxy**

- Create a reverse proxy configuration:

  ```bash
  sudo nano /etc/nginx/conf.d/reverse_proxy.conf
  ```

- Add the following content:

  ```plaintext
  server {
      listen 80;
      server_name proxy.local;

      location / {
          proxy_pass http://127.0.0.1:8080;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      }
  }
  ```

- Restart Nginx:

  ```bash
  sudo systemctl restart nginx
  ```

> *“Nginx is now a gateway for my backend services!”* Bob said.

---

### **Part 4: Securing Web Servers**

#### **Step 1: Enabling HTTPS with Let’s Encrypt**

- Install Certbot:

  ```bash
  sudo dnf install -y certbot python3-certbot-nginx
  ```

- Obtain an SSL certificate for Nginx:

  ```bash
  sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
  ```

- Test automatic renewal:

  ```bash
  sudo certbot renew --dry-run
  ```

#### **Step 2: Configuring Firewalls and SELinux**

- Allow HTTP and HTTPS in the firewall:

  ```bash
  sudo firewall-cmd --add-service=http --permanent
  sudo firewall-cmd --add-service=https --permanent
  sudo firewall-cmd --reload
  ```

- Enable SELinux rules:

  ```bash
  sudo setsebool -P httpd_can_network_connect 1
  ```

> *“HTTPS and SELinux keep my web servers secure!”* Bob said.

---

### **Part 5: Optimizing Web Server Performance**

#### **Step 1: Caching with Nginx**

- Add caching to the reverse proxy:

  ```plaintext
  location / {
      proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m;
      proxy_cache my_cache;
      proxy_pass http://127.0.0.1:8080;
  }
  ```

- Restart Nginx:

  ```bash
  sudo systemctl restart nginx
  ```

#### **Step 2: Tuning Apache**

- Enable `mod_cache` in Apache:

  ```bash
  sudo nano /etc/httpd/conf/httpd.conf
  ```

  ```plaintext
  LoadModule cache_module modules/mod_cache.so
  LoadModule cache_disk_module modules/mod_cache_disk.so
  ```

- Configure caching:

  ```plaintext
  <IfModule mod_cache.c>
      CacheQuickHandler off
      CacheLock on
      CacheRoot /var/cache/httpd
      CacheEnable disk /
      CacheHeader on
  </IfModule>
  ```

- Restart Apache:

  ```bash
  sudo systemctl restart httpd
  ```

> *“Caching ensures my websites load faster!”* Bob said.

---

### **Part 6: Monitoring and Managing Web Servers**

#### **Step 1: Monitoring Logs**

- Check access and error logs:

  ```bash
  sudo tail -f /var/log/httpd/access_log /var/log/httpd/error_log
  sudo tail -f /var/log/nginx/access.log /var/log/nginx/error.log
  ```

#### **Step 2: Automating Maintenance**

- Schedule a cron job to clean logs:

  ```bash
  sudo crontab -e
  ```

- Add the following:

  ```plaintext
  0 3 * * * find /var/log/nginx /var/log/httpd -name "*.log" -mtime +7 -delete
  ```

> *“Maintenance tasks keep my servers running smoothly!”* Bob noted.

---

### **Conclusion: Bob Reflects on Web Server Mastery**

Bob successfully configured Apache and Nginx on AlmaLinux, secured them with HTTPS, and optimized their performance. With robust monitoring and automation, he felt confident managing production-ready web servers.

> Next, Bob plans to explore **Building CI/CD Pipelines with AlmaLinux**, integrating automation into software delivery.
