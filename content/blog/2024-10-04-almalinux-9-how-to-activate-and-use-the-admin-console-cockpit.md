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
date: "2024-10-04T17:25:34Z"
guid: https://www.siberoloji.com/?p=2324
id: 2324
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- cockpit
- how-to guides
- linux how-to
title: 'AlmaLinux 9: How to Activate and Use the Admin Console Cockpit'
url: /almalinux-9-how-to-activate-and-use-the-admin-console-cockpit/
---

  ***AlmaLinux 9*** , a popular RHEL-based Linux distribution, is known for its stability, enterprise-ready environment, and security features. One powerful tool that administrators can leverage for managing AlmaLinux systems is the ***Cockpit Admin Console*** . Cockpit provides a web-based graphical interface that simplifies system monitoring and management tasks. Whether you're managing a single server or an entire fleet of systems, Cockpit makes essential tasks like managing storage, services, logs, and network settings more accessible.
 

  In this blog post, we'll cover how to activate and use the ***Cockpit Admin Console***  in AlmaLinux 9, walking you through everything from installation to its various use cases.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Cockpit in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Why Use Cockpit? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- How to Install and Activate Cockpit in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Accessing the Cockpit Web Interface 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Managing Services Using Cockpit 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Monitoring System Resources 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Networking and Firewall Management with Cockpit 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Storage and File System Management 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Security Features in Cockpit 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Cockpit in AlmaLinux 9
<!-- /wp:heading -->

  ***Cockpit***  is a web-based server management tool that allows administrators to manage Linux systems via a browser-based interface. It provides an easy-to-use interface while still giving users the ability to execute common administrative tasks such as managing services, configuring network settings, monitoring system performance, and much more.
 

  For AlmaLinux 9, Cockpit offers the following features:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- System monitoring with CPU, memory, and disk usage insights. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Management of services, containers, and users. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Network and firewall configuration. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Log management and troubleshooting. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Why Use Cockpit?
<!-- /wp:heading -->

  While many administrators prefer the command-line interface (CLI) for system management, Cockpit offers several advantages:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Ease of Use*** : Cockpit provides a user-friendly graphical interface accessible from a web browser. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Remote Management*** : You can manage your AlmaLinux 9 system from any remote location using a secure web interface. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Live Updates*** : Cockpit offers real-time monitoring of system status, including logs, system metrics, and storage information. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***No Learning Curve for New Users*** : Beginners or users unfamiliar with Linux can easily navigate the interface to manage the system without diving deep into complex CLI commands. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. How to Install and Activate Cockpit in AlmaLinux 9
<!-- /wp:heading -->

  By default, Cockpit might already be installed on your AlmaLinux 9 system. However, if it's not, the installation process is straightforward.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install Cockpit 
<!-- /wp:heading -->

  First, check whether Cockpit is already installed:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status cockpit</code></pre>
<!-- /wp:code -->

  If it’s not installed, you can install it using the ***dnf***  package manager:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install cockpit</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Enable the Cockpit Service 
<!-- /wp:heading -->

  Once installed, you need to enable Cockpit so that it starts on boot. Use the following command to enable and start the Cockpit service:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable --now cockpit.socket</code></pre>
<!-- /wp:code -->

  The <code>--now</code> flag ensures that the service is started immediately.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Allow Cockpit in the Firewall 
<!-- /wp:heading -->

  Cockpit uses port ***9090***  to provide access to its web interface. Ensure that your firewall allows access to this port:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  With Cockpit installed, enabled, and the firewall configured, you are now ready to access the web interface.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Accessing the Cockpit Web Interface
<!-- /wp:heading -->

  After setting up Cockpit, you can access it through your web browser.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Open the Cockpit Web Interface 
<!-- /wp:heading -->

  Open a browser and navigate to the following URL:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">https://&lt;your-server-ip&gt;:9090</code></pre>
<!-- /wp:code -->

  Replace <code>&lt;your-server-ip&gt;</code> with the IP address or hostname of your AlmaLinux 9 server. If you’re working locally, you can use <code>https://localhost:9090</code>.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Log in to Cockpit 
<!-- /wp:heading -->

  You will be prompted to enter the ***root***  credentials or a user account with ***sudo***  privileges. If your system has SELinux enabled, ensure that SELinux policies allow web-based administrative tools to function properly.
 

  You may also see a warning about the security certificate. Since Cockpit uses a self-signed certificate by default, you can proceed by adding an exception in your browser.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Managing Services Using Cockpit
<!-- /wp:heading -->

  Once logged in, you will be greeted with the Cockpit dashboard, where you can monitor and manage various system functions.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing and Controlling Services 
<!-- /wp:heading -->

  From the main dashboard, click on the ***Services***  section. Here you can:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Start*** , ***stop*** , ***restart*** , or ***disable***  services. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- View the status of each service (whether running or inactive). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Manage systemd services, which makes it easy to perform tasks without needing to memorize or type commands in the terminal. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  For example, if you want to restart the ***Apache HTTP Server***  (<code>httpd</code>), you can do it with a single click in Cockpit’s interface, instead of using the command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Monitoring System Resources
<!-- /wp:heading -->

  One of the key features of Cockpit is real-time system monitoring. This includes:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***CPU usage*** : Displays the current and historical CPU load. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Memory usage*** : Shows the current memory allocation and swap usage. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Disk I/O*** : Provides insights into disk operations per second and throughput. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Processes*** : Allows you to monitor active processes and their resource consumption. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  This section is particularly useful for diagnosing performance bottlenecks or monitoring long-term resource usage trends.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Networking and Firewall Management with Cockpit
<!-- /wp:heading -->

  Managing networking through Cockpit is another major feature.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring Network Interfaces 
<!-- /wp:heading -->

  In the ***Networking***  tab, you can:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- View active and inactive network interfaces. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configure static IP addresses or switch to ***DHCP*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Monitor real-time network traffic on each interface. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  This is especially helpful for administrators managing remote servers, as it eliminates the risk of losing SSH access due to misconfigured network settings.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Managing Firewall Rules 
<!-- /wp:heading -->

  Cockpit integrates firewall management, allowing you to:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Add or remove ***firewall rules*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Open or close ports. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enable or disable specific services (like SSH, HTTP, etc.). 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Instead of running commands like <code>firewall-cmd</code>, you can handle all firewall settings visually through the web interface.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Storage and File System Management
<!-- /wp:heading -->

  Cockpit simplifies storage management tasks that might otherwise involve a series of complex commands.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Disks and File Systems 
<!-- /wp:heading -->

  In the ***Storage***  section, you can:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- View mounted file systems and available disk space. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Create, format, and manage partitions. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Monitor ***RAID***  arrays, if applicable. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Additionally, you can configure LVM (Logical Volume Management) to manage volumes, making it easier to resize file systems without using the CLI.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 9. Security Features in Cockpit
<!-- /wp:heading -->

  Cockpit provides several security-related features to help you manage and protect your system.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">User Management 
<!-- /wp:heading -->

  In the ***Accounts***  section, you can:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Add or remove users. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Set user privileges (standard user or admin). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enable or disable ***sudo***  access for specific users. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing System Logs 
<!-- /wp:heading -->

  The ***Logs***  section aggregates all system logs in one place, allowing you to review security events, errors, and other important messages. This centralized log viewing feature simplifies troubleshooting and system auditing.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">System Updates 
<!-- /wp:heading -->

  Cockpit also allows you to manage system updates. You can check for updates, apply them, and even schedule updates to ensure that your system remains secure and up to date.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 10. Conclusion
<!-- /wp:heading -->

  The ***Cockpit Admin Console***  in AlmaLinux 9 is a powerful tool that simplifies server management by providing a clean, easy-to-use graphical interface. From monitoring system performance and managing services to configuring network settings and securing your server, Cockpit offers a comprehensive management solution that can benefit both seasoned administrators and newcomers alike.
 

  By enabling and using Cockpit, you can reduce the time spent on routine maintenance tasks and make system administration more efficient—whether you're working on a single server or managing an entire infrastructure.
 

  Now that you know how to activate and use Cockpit, take advantage of this tool to streamline your workflow and ensure your AlmaLinux 9 system remains healthy and secure.
 