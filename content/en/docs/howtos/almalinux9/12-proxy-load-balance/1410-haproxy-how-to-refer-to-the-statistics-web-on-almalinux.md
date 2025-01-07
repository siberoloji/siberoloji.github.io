---
title: "HAProxy: How to Refer to the Statistics Web on AlmaLinux"
linkTitle: HAProxy statistics
description: This post delves into how to set up and refer to the HAProxy statistics web interface on AlmaLinux, a popular choice for server environments due to its stability and RHEL compatibility.
date: 2025-01-02
weight: 1410
url: haproxy-refer-statistics-web-almalinux
draft: false
tags:
  - AlmaLinux
  - haproxy
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux


featured_image: /images/almalinux.webp
---
HAProxy is a widely used open-source solution for load balancing and high availability. Among its robust features is a built-in statistics web interface that provides detailed metrics on server performance, connections, and backend health. This post delves into how to set up and refer to the HAProxy statistics web interface on AlmaLinux, a popular choice for server environments due to its stability and RHEL compatibility.

### Prerequisites

Before proceeding, ensure the following:

- **AlmaLinux Server**: A running instance of AlmaLinux with administrative privileges.
- **HAProxy Installed**: HAProxy version 2.4 or later installed.
- **Firewall Access**: Ability to configure the firewall to allow web access to the statistics page.
- **Basic Command-Line Skills**: Familiarity with Linux command-line operations.

### Step 1: Install HAProxy

If HAProxy is not already installed on your AlmaLinux server, follow these steps:

1. **Update the System**:

   ```bash
   sudo dnf update -y
   ```

2. **Install HAProxy**:

   ```bash
   sudo dnf install haproxy -y
   ```

3. **Verify Installation**:
   Confirm that HAProxy is installed by checking its version:

   ```bash
   haproxy -v
   ```

   Example output:

   ```bash
   HAProxy version 2.4.3 2021/07/07 - https://haproxy.org/
   ```

### Step 2: Configure HAProxy for the Statistics Web Interface

To enable the statistics web interface, modify the HAProxy configuration file:

1. **Open the Configuration File**:

   ```bash
   sudo nano /etc/haproxy/haproxy.cfg
   ```

2. **Add the Statistics Section**:
   Locate the `global` and `defaults` sections and append the following configuration:

   ```bash
   listen stats
       bind :8404
       mode http
       stats enable
       stats uri /haproxy?stats
       stats realm HAProxy\ Statistics
       stats auth admin:password
   ```

   - `bind :8404`: Configures the statistics interface to listen on port 8404.
   - `stats uri /haproxy?stats`: Sets the URL path to access the statistics page.
   - `stats auth admin:password`: Secures access with a username (`admin`) and password (`password`). Replace these with more secure credentials in production.

3. **Save and Exit**:
   Save the changes and exit the editor.

### Step 3: Restart HAProxy Service

Apply the changes by restarting the HAProxy service:

```bash
sudo systemctl restart haproxy
```

Verify that HAProxy is running:

```bash
sudo systemctl status haproxy
```

### Step 4: Configure the Firewall

Ensure the firewall allows traffic to the port specified in the configuration (port 8404 in this example):

1. **Open the Port**:

   ```bash
   sudo firewall-cmd --add-port=8404/tcp --permanent
   ```

2. **Reload Firewall Rules**:

   ```bash
   sudo firewall-cmd --reload
   ```

### Step 5: Access the Statistics Web Interface

1. Open a web browser and navigate to:

   ```bash
   http://<server-ip>:8404/haproxy?stats
   ```

   Replace `<server-ip>` with the IP address of your AlmaLinux server.

2. Enter the credentials specified in the `stats auth` line of the configuration file (e.g., `admin` and `password`).

3. The statistics web interface should display metrics such as:
   - Current session rate
   - Total connections
   - Backend server health
   - Error rates

### Step 6: Customize the Statistics Interface

To enhance or adjust the interface to meet your requirements, consider the following options:

1. **Change the Binding Address**:
   By default, the statistics interface listens on all network interfaces (`bind :8404`). For added security, restrict it to a specific IP:

   ```bash
   bind 127.0.0.1:8404
   ```

   This limits access to localhost. Use a reverse proxy (e.g., NGINX) to manage external access.

2. **Use HTTPS**:
   Secure the interface with SSL/TLS by specifying a certificate:

   ```bash
   bind :8404 ssl crt /etc/haproxy/certs/haproxy.pem
   ```

   Generate or obtain a valid SSL certificate and save it as `haproxy.pem`.

3. **Advanced Authentication**:
   Replace basic authentication with a more secure method, such as integration with LDAP or OAuth, by using HAProxy’s advanced ACL capabilities.

### Troubleshooting

If you encounter issues, consider the following steps:

1. **Check HAProxy Logs**:
   Logs can provide insights into errors:

   ```bash
   sudo journalctl -u haproxy
   ```

2. **Test Configuration**:
   Validate the configuration before restarting HAProxy:

   ```bash
   sudo haproxy -c -f /etc/haproxy/haproxy.cfg
   ```

   If errors are present, they will be displayed.

3. **Verify Firewall Rules**:
   Ensure the port is open:

   ```bash
   sudo firewall-cmd --list-ports
   ```

4. **Check Browser Access**:
   Confirm the server’s IP address and port are correctly specified in the URL.

### Best Practices for Production

1. **Strong Authentication**:
   Avoid default credentials. Use a strong, unique username and password.

2. **Restrict Access**:
   Limit access to the statistics interface to trusted IPs using HAProxy ACLs or firewall rules.

3. **Monitor Regularly**:
   Use the statistics web interface to monitor performance and troubleshoot issues promptly.

4. **Automate Metrics Collection**:
   Integrate HAProxy metrics with monitoring tools like Prometheus or Grafana for real-time visualization and alerts.

### Conclusion

The HAProxy statistics web interface is a valuable tool for monitoring and managing your load balancer’s performance. By following the steps outlined above, you can enable and securely access this interface on AlmaLinux. With proper configuration and security measures, you can leverage the detailed metrics provided by HAProxy to optimize your server infrastructure and ensure high availability for your applications.
