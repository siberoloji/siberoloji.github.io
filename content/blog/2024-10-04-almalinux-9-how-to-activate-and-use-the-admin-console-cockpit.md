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

  <strong>AlmaLinux 9</strong>, a popular RHEL-based Linux distribution, is known for its stability, enterprise-ready environment, and security features. One powerful tool that administrators can leverage for managing AlmaLinux systems is the <strong>Cockpit Admin Console</strong>. Cockpit provides a web-based graphical interface that simplifies system monitoring and management tasks. Whether you're managing a single server or an entire fleet of systems, Cockpit makes essential tasks like managing storage, services, logs, and network settings more accessible.</p>
 

  In this blog post, we'll cover how to activate and use the <strong>Cockpit Admin Console</strong> in AlmaLinux 9, walking you through everything from installation to its various use cases.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Cockpit in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Why Use Cockpit?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>How to Install and Activate Cockpit in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Accessing the Cockpit Web Interface</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Managing Services Using Cockpit</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitoring System Resources</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Networking and Firewall Management with Cockpit</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Storage and File System Management</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Security Features in Cockpit</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Cockpit in AlmaLinux 9</h3>
<!-- /wp:heading -->

  <strong>Cockpit</strong> is a web-based server management tool that allows administrators to manage Linux systems via a browser-based interface. It provides an easy-to-use interface while still giving users the ability to execute common administrative tasks such as managing services, configuring network settings, monitoring system performance, and much more.</p>
 

  For AlmaLinux 9, Cockpit offers the following features:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>System monitoring with CPU, memory, and disk usage insights.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Management of services, containers, and users.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Network and firewall configuration.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Log management and troubleshooting.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Why Use Cockpit?</h3>
<!-- /wp:heading -->

  While many administrators prefer the command-line interface (CLI) for system management, Cockpit offers several advantages:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Ease of Use</strong>: Cockpit provides a user-friendly graphical interface accessible from a web browser.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Remote Management</strong>: You can manage your AlmaLinux 9 system from any remote location using a secure web interface.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Live Updates</strong>: Cockpit offers real-time monitoring of system status, including logs, system metrics, and storage information.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>No Learning Curve for New Users</strong>: Beginners or users unfamiliar with Linux can easily navigate the interface to manage the system without diving deep into complex CLI commands.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. How to Install and Activate Cockpit in AlmaLinux 9</h3>
<!-- /wp:heading -->

  By default, Cockpit might already be installed on your AlmaLinux 9 system. However, if it's not, the installation process is straightforward.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install Cockpit</h4>
<!-- /wp:heading -->

  First, check whether Cockpit is already installed:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status cockpit</code></pre>
<!-- /wp:code -->

  If it’s not installed, you can install it using the <strong>dnf</strong> package manager:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install cockpit</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Enable the Cockpit Service</h4>
<!-- /wp:heading -->

  Once installed, you need to enable Cockpit so that it starts on boot. Use the following command to enable and start the Cockpit service:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable --now cockpit.socket</code></pre>
<!-- /wp:code -->

  The <code>--now</code> flag ensures that the service is started immediately.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Allow Cockpit in the Firewall</h4>
<!-- /wp:heading -->

  Cockpit uses port <strong>9090</strong> to provide access to its web interface. Ensure that your firewall allows access to this port:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  With Cockpit installed, enabled, and the firewall configured, you are now ready to access the web interface.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Accessing the Cockpit Web Interface</h3>
<!-- /wp:heading -->

  After setting up Cockpit, you can access it through your web browser.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Open the Cockpit Web Interface</h4>
<!-- /wp:heading -->

  Open a browser and navigate to the following URL:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">https://&lt;your-server-ip&gt;:9090</code></pre>
<!-- /wp:code -->

  Replace <code>&lt;your-server-ip&gt;</code> with the IP address or hostname of your AlmaLinux 9 server. If you’re working locally, you can use <code>https://localhost:9090</code>.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Log in to Cockpit</h4>
<!-- /wp:heading -->

  You will be prompted to enter the <strong>root</strong> credentials or a user account with <strong>sudo</strong> privileges. If your system has SELinux enabled, ensure that SELinux policies allow web-based administrative tools to function properly.</p>
 

  You may also see a warning about the security certificate. Since Cockpit uses a self-signed certificate by default, you can proceed by adding an exception in your browser.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Managing Services Using Cockpit</h3>
<!-- /wp:heading -->

  Once logged in, you will be greeted with the Cockpit dashboard, where you can monitor and manage various system functions.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing and Controlling Services</h4>
<!-- /wp:heading -->

  From the main dashboard, click on the <strong>Services</strong> section. Here you can:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Start</strong>, <strong>stop</strong>, <strong>restart</strong>, or <strong>disable</strong> services.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>View the status of each service (whether running or inactive).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Manage systemd services, which makes it easy to perform tasks without needing to memorize or type commands in the terminal.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  For example, if you want to restart the <strong>Apache HTTP Server</strong> (<code>httpd</code>), you can do it with a single click in Cockpit’s interface, instead of using the command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart httpd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Monitoring System Resources</h3>
<!-- /wp:heading -->

  One of the key features of Cockpit is real-time system monitoring. This includes:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>CPU usage</strong>: Displays the current and historical CPU load.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Memory usage</strong>: Shows the current memory allocation and swap usage.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Disk I/O</strong>: Provides insights into disk operations per second and throughput.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Processes</strong>: Allows you to monitor active processes and their resource consumption.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  This section is particularly useful for diagnosing performance bottlenecks or monitoring long-term resource usage trends.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Networking and Firewall Management with Cockpit</h3>
<!-- /wp:heading -->

  Managing networking through Cockpit is another major feature.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring Network Interfaces</h4>
<!-- /wp:heading -->

  In the <strong>Networking</strong> tab, you can:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>View active and inactive network interfaces.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configure static IP addresses or switch to <strong>DHCP</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitor real-time network traffic on each interface.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  This is especially helpful for administrators managing remote servers, as it eliminates the risk of losing SSH access due to misconfigured network settings.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Managing Firewall Rules</h4>
<!-- /wp:heading -->

  Cockpit integrates firewall management, allowing you to:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Add or remove <strong>firewall rules</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open or close ports.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enable or disable specific services (like SSH, HTTP, etc.).</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Instead of running commands like <code>firewall-cmd</code>, you can handle all firewall settings visually through the web interface.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Storage and File System Management</h3>
<!-- /wp:heading -->

  Cockpit simplifies storage management tasks that might otherwise involve a series of complex commands.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Disks and File Systems</h4>
<!-- /wp:heading -->

  In the <strong>Storage</strong> section, you can:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>View mounted file systems and available disk space.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create, format, and manage partitions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitor <strong>RAID</strong> arrays, if applicable.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Additionally, you can configure LVM (Logical Volume Management) to manage volumes, making it easier to resize file systems without using the CLI.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 9. Security Features in Cockpit</h3>
<!-- /wp:heading -->

  Cockpit provides several security-related features to help you manage and protect your system.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">User Management</h4>
<!-- /wp:heading -->

  In the <strong>Accounts</strong> section, you can:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Add or remove users.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Set user privileges (standard user or admin).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enable or disable <strong>sudo</strong> access for specific users.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing System Logs</h4>
<!-- /wp:heading -->

  The <strong>Logs</strong> section aggregates all system logs in one place, allowing you to review security events, errors, and other important messages. This centralized log viewing feature simplifies troubleshooting and system auditing.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">System Updates</h4>
<!-- /wp:heading -->

  Cockpit also allows you to manage system updates. You can check for updates, apply them, and even schedule updates to ensure that your system remains secure and up to date.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 10. Conclusion</h3>
<!-- /wp:heading -->

  The <strong>Cockpit Admin Console</strong> in AlmaLinux 9 is a powerful tool that simplifies server management by providing a clean, easy-to-use graphical interface. From monitoring system performance and managing services to configuring network settings and securing your server, Cockpit offers a comprehensive management solution that can benefit both seasoned administrators and newcomers alike.</p>
 

  By enabling and using Cockpit, you can reduce the time spent on routine maintenance tasks and make system administration more efficient—whether you're working on a single server or managing an entire infrastructure.</p>
 

  Now that you know how to activate and use Cockpit, take advantage of this tool to streamline your workflow and ensure your AlmaLinux 9 system remains healthy and secure.</p>
 