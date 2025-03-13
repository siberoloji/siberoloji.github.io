---
title: How to Install Django 4 on AlmaLinux
linkTitle: Install Django 4
description: In this guide, we will walk you through the steps to install Django 4 on AlmaLinux
date: 2025-01-08T11:16:16.195Z
weight: 1840
url: install-django-4-almalinux
translationKey: install-django-4-almalinux
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - django 4
featured_image: /images/almalinux.webp
---
Django is one of the most popular Python frameworks for building robust, scalable web applications. With its "batteries-included" approach, Django offers a range of tools and features to streamline web development, from handling user authentication to database migrations. In this guide, we will walk you through the steps to install Django 4 on AlmaLinux, a stable and secure enterprise Linux distribution derived from RHEL.

---

### **Why Choose Django 4?**

Django 4 introduces several enhancements and optimizations, including:

1. **New Features**:
   - Async support for ORM queries.
   - Functional middleware for better performance.
2. **Enhanced Security**:
   - More secure cookie settings.
   - Improved cross-site scripting (XSS) protection.
3. **Modernized Codebase**:
   - Dropped support for older Python versions, ensuring compatibility with the latest tools.

Django 4 is ideal for developers seeking cutting-edge functionality without compromising stability.

---

### **Prerequisites**

Before starting, ensure you have the following:

- **AlmaLinux installed**: This guide assumes you have administrative access.
- **Python 3.8 or newer**: Django 4 requires Python 3.8 or higher.
- **Sudo privileges**: Many steps require administrative rights.

---

### **Step 1: Update the System**

Start by updating your system to ensure you have the latest packages and security updates:

```bash
sudo dnf update -y
```

---

### **Step 2: Install Python**

Django requires Python 3.8 or newer. AlmaLinux may not have the latest Python version pre-installed, so follow these steps to install Python.

#### Enable the Required Repositories

First, enable the Extra Packages for Enterprise Linux (EPEL) and CodeReady Builder (CRB) repositories:

```bash
sudo dnf install -y epel-release
sudo dnf config-manager --set-enabled crb
```

#### Install Python

Next, install Python 3.9 or a newer version:

```bash
sudo dnf install -y python39 python39-pip python39-devel
```

#### Verify the Python Installation

Check the installed Python version:

```bash
python3.9 --version
```

You should see an output like:

```
Python 3.9.x
```

---

### **Step 3: Install and Configure Virtual Environment**

It’s best practice to use a virtual environment to isolate your Django project dependencies. Virtual environments ensure your project doesn’t interfere with system-level Python packages or other projects.

#### Install `venv`

The `venv` module comes with Python 3.9, so you don’t need to install it separately. If it’s not already installed, ensure the `python39-devel` package is present.

#### Create a Virtual Environment

Create a directory for your project and initialize a virtual environment:

```bash
mkdir my_django_project
cd my_django_project
python3.9 -m venv venv
```

#### Activate the Virtual Environment

Activate the virtual environment with the following command:

```bash
source venv/bin/activate
```

Your terminal prompt will change to indicate the virtual environment is active, e.g., `(venv)`.

---

### **Step 4: Install Django 4**

With the virtual environment activated, install Django using `pip`:

```bash
pip install django==4.2
```

You can verify the installation by checking the Django version:

```bash
python -m django --version
```

The output should show:

```
4.2.x
```

---

### **Step 5: Create a Django Project**

With Django installed, you can now create a new Django project.

#### Create a New Project

Run the following command to create a Django project named `myproject`:

```bash
django-admin startproject myproject .
```

This command initializes a Django project in the current directory. The project structure will look like this:

```
my_django_project/
├── manage.py
├── myproject/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── venv/
```

#### Run the Development Server

Start the built-in Django development server to test the setup:

```bash
python manage.py runserver
```

Open your browser and navigate to `http://127.0.0.1:8000`. You should see the Django welcome page, confirming that your installation was successful.

---

### **Step 6: Configure the Firewall**

If you want to access your Django development server from other devices, configure the AlmaLinux firewall to allow traffic on port 8000.

#### Allow Port 8000

Run the following commands to open port 8000:

```bash
sudo firewall-cmd --permanent --add-port=8000/tcp
sudo firewall-cmd --reload
```

Now, you can access the server from another device using your AlmaLinux machine’s IP address.

---

### **Step 7: Configure Database Support**

By default, Django uses SQLite, which is suitable for development. For production, consider using a more robust database like PostgreSQL or MySQL.

#### Install PostgreSQL

Install PostgreSQL and its Python adapter:

```bash
sudo dnf install -y postgresql-server postgresql-devel
pip install psycopg2
```

#### Update Django Settings

Edit the `settings.py` file to configure PostgreSQL as the database:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'mydatabase',
        'USER': 'myuser',
        'PASSWORD': 'mypassword',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

#### Apply Migrations

Run migrations to set up the database:

```bash
python manage.py migrate
```

---

### **Step 8: Deploy Django with a Production Server**

The Django development server is not suitable for production. Use a WSGI server like Gunicorn with Nginx or Apache for a production environment.

#### Install Gunicorn

Install Gunicorn using `pip`:

```bash
pip install gunicorn
```

#### Test Gunicorn

Run Gunicorn to serve your Django project:

```bash
gunicorn myproject.wsgi:application
```

#### Install and Configure Nginx

Install Nginx as a reverse proxy:

```bash
sudo dnf install -y nginx
```

Create a new configuration file for your Django project:

```bash
sudo nano /etc/nginx/conf.d/myproject.conf
```

Add the following configuration:

```nginx
server {
    listen 80;
    server_name your_domain_or_ip;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

Restart Nginx to apply the changes:

```bash
sudo systemctl restart nginx
```

---

### **Step 9: Secure the Application**

For production, secure your application by enabling HTTPS with a free SSL certificate from Let’s Encrypt.

#### Install Certbot

Install Certbot for Nginx:

```bash
sudo dnf install -y certbot python3-certbot-nginx
```

#### Obtain an SSL Certificate

Run the following command to obtain and configure an SSL certificate:

```bash
sudo certbot --nginx -d your_domain
```

Certbot will automatically configure Nginx to use the SSL certificate.

---

### **Conclusion**

By following this guide, you’ve successfully installed Django 4 on AlmaLinux, set up a project, configured the database, and prepared the application for production deployment. AlmaLinux provides a secure and stable platform for Django, making it a great choice for developing and hosting web applications.

Django 4’s features, combined with AlmaLinux’s reliability, enable you to build scalable, secure, and modern web applications. Whether you’re developing for personal projects or enterprise-grade systems, this stack is a powerful foundation for your web development journey. Happy coding!
