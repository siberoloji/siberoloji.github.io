---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classic-editor-remember:
- block-editor
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-04T14:49:21Z"
guid: https://www.siberoloji.com/?p=2312
id: 2312
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- linux how-to
title: 'AlmaLinux 9: How to List, Enable, Disable, and Configure Services'
url: /almalinux-9-how-to-list-enable-disable-and-configure-services/
---

  Managing services is a crucial part of system administration, especially in server environments. <strong>AlmaLinux 9</strong>, an open-source and community-driven alternative to CentOS, provides robust tools for managing system services. Services refer to processes that run in the background, such as web servers, database engines, and network managers. Proper control over services ensures optimal performance, security, and resource allocation on your server. 
 

  In this blog post, we will explore how to <strong>list</strong>, <strong>enable</strong>, <strong>disable</strong>, and <strong>configure services</strong> in AlmaLinux 9, using powerful system utilities like <code>systemctl</code> and <code>service</code>. By the end of this guide, you'll be able to manage your server's services efficiently. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Services in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Understanding Systemd and Service Management</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>How to List Active and Inactive Services</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enabling and Disabling Services</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Starting and Stopping Services</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring Services</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Viewing Service Logs and Status</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Best Practices for Service Management in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Services in AlmaLinux 9</h3>
<!-- /wp:heading -->

  Services are essential components of server operations. They are programs or scripts that run in the background to perform various tasks, such as serving web pages, managing databases, or handling network traffic. In AlmaLinux 9, most services are managed by <strong>systemd</strong>, a modern init system that manages system processes during startup and runtime. 
 

  Understanding how to control and configure services is crucial for: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Ensuring critical applications are always running.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Improving system performance by disabling unnecessary services.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enhancing security by turning off vulnerable or unwanted services.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Understanding Systemd and Service Management</h3>
<!-- /wp:heading -->

  <strong>Systemd</strong> is the default system and service manager in AlmaLinux 9, as it is in most modern Linux distributions. It replaces older init systems like SysV and Upstart and introduces a more efficient way to start services and manage their dependencies. 
 

  With <strong>systemd</strong>, you use the <code>systemctl</code> command to control services, which provides more functionality and control than older <code>service</code> commands. 
 

  Common <code>systemctl</code> options: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><code>start</code>: Start a service.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>stop</code>: Stop a service.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>enable</code>: Start a service at boot.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>disable</code>: Prevent a service from starting at boot.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>status</code>: Check the status of a service.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>restart</code>: Restart a running service.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Now that we have an understanding of systemd, let's get into how to list services in AlmaLinux 9. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. How to List Active and Inactive Services</h3>
<!-- /wp:heading -->

  To manage services effectively, you first need to see which services are running, inactive, or failed. Listing services allows you to assess the status of each one and take action if needed. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing All Services</h4>
<!-- /wp:heading -->

  To list all services—both active and inactive—use the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl list-unit-files --type=service</code></pre>
<!-- /wp:code -->

  This command will display a detailed list of services, their current state, and whether they are enabled or disabled at boot. 
 

  Example output: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">UNIT FILE                               STATE
sshd.service                             enabled
firewalld.service                        enabled
httpd.service                            disabled
crond.service                            enabled</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing Only Active Services</h4>
<!-- /wp:heading -->

  If you want to see only the services that are currently running (active), use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl list-units --type=service --state=running</code></pre>
<!-- /wp:code -->

  This will display a list of all active services on your system. This command is especially useful for troubleshooting if a specific service is not functioning as expected. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking Service Status</h4>
<!-- /wp:heading -->

  For detailed information about a specific service, such as <code>sshd</code>, use the <code>status</code> option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl status sshd</code></pre>
<!-- /wp:code -->

  This command gives you a comprehensive breakdown of the service’s status, including its state (running or stopped), uptime, and any recent errors or warnings in the logs. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Enabling and Disabling Services</h3>
<!-- /wp:heading -->

  Services can be configured to start automatically at boot time or to remain disabled until manually started. Let’s look at how to enable and disable services. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Enabling a Service at Boot</h4>
<!-- /wp:heading -->

  To ensure a service starts automatically when your system boots, use the <code>enable</code> command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd</code></pre>
<!-- /wp:code -->

  In this example, <code>httpd</code> (Apache web server) is enabled to start on boot. This means whenever the server is rebooted, the <code>httpd</code> service will start automatically. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Disabling a Service at Boot</h4>
<!-- /wp:heading -->

  To prevent a service from starting at boot, use the <code>disable</code> command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl disable httpd</code></pre>
<!-- /wp:code -->

  This will stop the <code>httpd</code> service from running automatically when the server boots. You may want to disable services that are not essential to save system resources. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Starting and Stopping Services</h3>
<!-- /wp:heading -->

  In addition to enabling or disabling services at boot time, you can manually start or stop services as needed. This is useful when you want to temporarily activate or deactivate a service without affecting its boot behavior. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Starting a Service</h4>
<!-- /wp:heading -->

  To start a service immediately, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

  This command will start the <code>httpd</code> service right away. However, if the service is disabled, it will not start at the next boot unless you enable it. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Stopping a Service</h4>
<!-- /wp:heading -->

  To stop a running service, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl stop httpd</code></pre>
<!-- /wp:code -->

  This will stop the service from running, but will not change its boot behavior (enabled or disabled). Stopping services that you do not need is an effective way to free up system resources. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Restarting a Service</h4>
<!-- /wp:heading -->

  Sometimes, services need to be restarted to apply configuration changes or to refresh the service state. To restart a service, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

  This will stop and then immediately start the service again. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Configuring Services</h3>
<!-- /wp:heading -->

  Service configuration typically involves editing the service’s configuration files, which define how the service operates, its dependencies, and its environment. Each service has its own configuration files, usually located in <code>/etc</code> or its subdirectories. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editing Service Configuration Files</h4>
<!-- /wp:heading -->

  For example, the configuration file for the <strong>Apache</strong> (<code>httpd</code>) service is usually located at: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  You can edit this file using a text editor such as <code>nano</code> or <code>vim</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  After making changes to a service's configuration, you need to reload or restart the service for the changes to take effect. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Reloading a Service</h4>
<!-- /wp:heading -->

  Some services support a "reload" operation, which re-reads the configuration without fully stopping and starting the service: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl reload httpd</code></pre>
<!-- /wp:code -->

  Reloading is less disruptive than a full restart and is preferred for services like web servers and database servers, where downtime must be minimized. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Viewing Service Logs and Status</h3>
<!-- /wp:heading -->

  Service logs provide essential insights into how a service is performing and help troubleshoot any issues that arise. With <strong>systemd</strong>, you can view logs directly from the <code>journalctl</code> command. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Logs for a Specific Service</h4>
<!-- /wp:heading -->

  To view the logs for a specific service, such as <code>httpd</code>, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo journalctl -u httpd</code></pre>
<!-- /wp:code -->

  This will display all logs related to the <code>httpd</code> service. You can scroll through these logs to find specific errors, warnings, or events that can help you diagnose issues. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Filtering Logs by Time</h4>
<!-- /wp:heading -->

  You can filter logs by time to see recent events using the <code>--since</code> option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo journalctl -u httpd --since "2023-10-01"</code></pre>
<!-- /wp:code -->

  This will show only logs generated since October 1, 2023, which can help narrow down logs when troubleshooting. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Best Practices for Service Management in AlmaLinux 9</h3>
<!-- /wp:heading -->

  Effective service management is critical to maintaining the stability, performance, and security of your AlmaLinux 9 server. Here are some best practices to keep in mind: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Disable Unnecessary Services</strong>: Services that are not required for your server's functionality should be disabled to save resources and reduce potential security risks.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Monitor Service Logs Regularly</strong>: Use <code>journalctl</code> to check logs frequently, especially for critical services like web servers, firewalls, and databases.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Automate with Systemd Timers</strong>: Consider using <code>systemd</code> timers instead of traditional cron jobs to schedule tasks. They offer better integration with the systemd ecosystem.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Test Configuration Changes</strong>: Always test changes to service configuration files in a development or testing environment before applying them to production.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Backup Configuration Files</strong>: Before making any significant changes to service configurations, make sure to back up the original configuration files.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 9. Conclusion</h3>
<!-- /wp:heading -->

  Managing services on <strong>AlmaLinux 9</strong> is a critical skill for system administrators, whether you're running a web server, database, or any other service. By mastering the use of <code>systemctl</code>, you can easily list, enable, disable, start, stop, and configure services. With the best practices outlined in this guide, you can maintain a well-functioning and secure server environment. 
 

  AlmaLinux’s reliance on <strong>systemd</strong> and <strong>systemctl</strong> ensures that service management is efficient and powerful, helping you control the services that run on your system with ease. 
 

  By regularly monitoring, enabling only essential services, and configuring them properly, you will be able to optimize both performance and security on your AlmaLinux 9 server. 
 