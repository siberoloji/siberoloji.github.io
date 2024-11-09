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

  Managing services is a crucial part of system administration, especially in server environments. ***AlmaLinux 9*** , an open-source and community-driven alternative to CentOS, provides robust tools for managing system services. Services refer to processes that run in the background, such as web servers, database engines, and network managers. Proper control over services ensures optimal performance, security, and resource allocation on your server. 
 

  In this blog post, we will explore how to ***list*** , ***enable*** , ***disable*** , and ***configure services***  in AlmaLinux 9, using powerful system utilities like <code>systemctl</code> and <code>service</code>. By the end of this guide, you'll be able to manage your server's services efficiently. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Services in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Understanding Systemd and Service Management 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- How to List Active and Inactive Services 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enabling and Disabling Services 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Starting and Stopping Services 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring Services 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Viewing Service Logs and Status 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Best Practices for Service Management in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Services in AlmaLinux 9
<!-- /wp:heading -->

  Services are essential components of server operations. They are programs or scripts that run in the background to perform various tasks, such as serving web pages, managing databases, or handling network traffic. In AlmaLinux 9, most services are managed by ***systemd*** , a modern init system that manages system processes during startup and runtime. 
 

  Understanding how to control and configure services is crucial for: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Ensuring critical applications are always running. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Improving system performance by disabling unnecessary services. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enhancing security by turning off vulnerable or unwanted services. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Understanding Systemd and Service Management
<!-- /wp:heading -->

  ***Systemd***  is the default system and service manager in AlmaLinux 9, as it is in most modern Linux distributions. It replaces older init systems like SysV and Upstart and introduces a more efficient way to start services and manage their dependencies. 
 

  With ***systemd*** , you use the <code>systemctl</code> command to control services, which provides more functionality and control than older <code>service</code> commands. 
 

  Common <code>systemctl</code> options: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- <code>start</code>: Start a service. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>stop</code>: Stop a service. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>enable</code>: Start a service at boot. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>disable</code>: Prevent a service from starting at boot. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>status</code>: Check the status of a service. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>restart</code>: Restart a running service. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Now that we have an understanding of systemd, let's get into how to list services in AlmaLinux 9. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. How to List Active and Inactive Services
<!-- /wp:heading -->

  To manage services effectively, you first need to see which services are running, inactive, or failed. Listing services allows you to assess the status of each one and take action if needed. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing All Services 
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
<h4 class="wp-block-heading">Listing Only Active Services 
<!-- /wp:heading -->

  If you want to see only the services that are currently running (active), use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl list-units --type=service --state=running</code></pre>
<!-- /wp:code -->

  This will display a list of all active services on your system. This command is especially useful for troubleshooting if a specific service is not functioning as expected. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking Service Status 
<!-- /wp:heading -->

  For detailed information about a specific service, such as <code>sshd</code>, use the <code>status</code> option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl status sshd</code></pre>
<!-- /wp:code -->

  This command gives you a comprehensive breakdown of the service’s status, including its state (running or stopped), uptime, and any recent errors or warnings in the logs. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Enabling and Disabling Services
<!-- /wp:heading -->

  Services can be configured to start automatically at boot time or to remain disabled until manually started. Let’s look at how to enable and disable services. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Enabling a Service at Boot 
<!-- /wp:heading -->

  To ensure a service starts automatically when your system boots, use the <code>enable</code> command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable httpd</code></pre>
<!-- /wp:code -->

  In this example, <code>httpd</code> (Apache web server) is enabled to start on boot. This means whenever the server is rebooted, the <code>httpd</code> service will start automatically. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Disabling a Service at Boot 
<!-- /wp:heading -->

  To prevent a service from starting at boot, use the <code>disable</code> command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl disable httpd</code></pre>
<!-- /wp:code -->

  This will stop the <code>httpd</code> service from running automatically when the server boots. You may want to disable services that are not essential to save system resources. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Starting and Stopping Services
<!-- /wp:heading -->

  In addition to enabling or disabling services at boot time, you can manually start or stop services as needed. This is useful when you want to temporarily activate or deactivate a service without affecting its boot behavior. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Starting a Service 
<!-- /wp:heading -->

  To start a service immediately, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start httpd</code></pre>
<!-- /wp:code -->

  This command will start the <code>httpd</code> service right away. However, if the service is disabled, it will not start at the next boot unless you enable it. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Stopping a Service 
<!-- /wp:heading -->

  To stop a running service, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl stop httpd</code></pre>
<!-- /wp:code -->

  This will stop the service from running, but will not change its boot behavior (enabled or disabled). Stopping services that you do not need is an effective way to free up system resources. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Restarting a Service 
<!-- /wp:heading -->

  Sometimes, services need to be restarted to apply configuration changes or to refresh the service state. To restart a service, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

  This will stop and then immediately start the service again. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Configuring Services
<!-- /wp:heading -->

  Service configuration typically involves editing the service’s configuration files, which define how the service operates, its dependencies, and its environment. Each service has its own configuration files, usually located in <code>/etc</code> or its subdirectories. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editing Service Configuration Files 
<!-- /wp:heading -->

  For example, the configuration file for the ***Apache***  (<code>httpd</code>) service is usually located at: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  You can edit this file using a text editor such as <code>nano</code> or <code>vim</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/httpd/conf/httpd.conf</code></pre>
<!-- /wp:code -->

  After making changes to a service's configuration, you need to reload or restart the service for the changes to take effect. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Reloading a Service 
<!-- /wp:heading -->

  Some services support a "reload" operation, which re-reads the configuration without fully stopping and starting the service: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl reload httpd</code></pre>
<!-- /wp:code -->

  Reloading is less disruptive than a full restart and is preferred for services like web servers and database servers, where downtime must be minimized. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Viewing Service Logs and Status
<!-- /wp:heading -->

  Service logs provide essential insights into how a service is performing and help troubleshoot any issues that arise. With ***systemd*** , you can view logs directly from the <code>journalctl</code> command. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Logs for a Specific Service 
<!-- /wp:heading -->

  To view the logs for a specific service, such as <code>httpd</code>, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo journalctl -u httpd</code></pre>
<!-- /wp:code -->

  This will display all logs related to the <code>httpd</code> service. You can scroll through these logs to find specific errors, warnings, or events that can help you diagnose issues. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Filtering Logs by Time 
<!-- /wp:heading -->

  You can filter logs by time to see recent events using the <code>--since</code> option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo journalctl -u httpd --since "2023-10-01"</code></pre>
<!-- /wp:code -->

  This will show only logs generated since October 1, 2023, which can help narrow down logs when troubleshooting. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Best Practices for Service Management in AlmaLinux 9
<!-- /wp:heading -->

  Effective service management is critical to maintaining the stability, performance, and security of your AlmaLinux 9 server. Here are some best practices to keep in mind: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Disable Unnecessary Services*** : Services that are not required for your server's functionality should be disabled to save resources and reduce potential security risks. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Monitor Service Logs Regularly*** : Use <code>journalctl</code> to check logs frequently, especially for critical services like web servers, firewalls, and databases. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Automate with Systemd Timers*** : Consider using <code>systemd</code> timers instead of traditional cron jobs to schedule tasks. They offer better integration with the systemd ecosystem. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Test Configuration Changes*** : Always test changes to service configuration files in a development or testing environment before applying them to production. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Backup Configuration Files*** : Before making any significant changes to service configurations, make sure to back up the original configuration files. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 9. Conclusion
<!-- /wp:heading -->

  Managing services on ***AlmaLinux 9***  is a critical skill for system administrators, whether you're running a web server, database, or any other service. By mastering the use of <code>systemctl</code>, you can easily list, enable, disable, start, stop, and configure services. With the best practices outlined in this guide, you can maintain a well-functioning and secure server environment. 
 

  AlmaLinux’s reliance on ***systemd***  and ***systemctl***  ensures that service management is efficient and powerful, helping you control the services that run on your system with ease. 
 

  By regularly monitoring, enabling only essential services, and configuring them properly, you will be able to optimize both performance and security on your AlmaLinux 9 server. 
 