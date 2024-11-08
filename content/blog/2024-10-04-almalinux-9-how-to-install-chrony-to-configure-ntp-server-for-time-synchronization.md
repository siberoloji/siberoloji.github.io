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
date: "2024-10-04T17:30:25Z"
guid: https://www.siberoloji.com/?p=2326
id: 2326
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- linux how-to
- ntp server
title: 'AlmaLinux 9: How to Install Chrony to Configure NTP Server for Time Synchronization'
url: /almalinux-9-how-to-install-chrony-to-configure-ntp-server-for-time-synchronization/
---

  Time synchronization is essential for maintaining the accuracy of time across multiple systems, especially in network environments. Consistent time settings are crucial for system logs, security protocols, file timestamps, and even distributed systems. In AlmaLinux 9, <strong>Chrony</strong> is the recommended tool for time synchronization. Chrony is a versatile and lightweight implementation of <strong>Network Time Protocol (NTP)</strong>, offering fast and accurate synchronization, even for systems with occasional network disconnections. 
 

  This guide will walk you through the installation of <strong>Chrony</strong>, configuring it as an NTP server, and how to verify that time synchronization is functioning correctly on AlmaLinux 9. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Time Synchronization and NTP</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Why Choose Chrony over Other NTP Solutions?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Installing Chrony on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring Chrony as an NTP Server</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Allowing Client Systems to Sync Time with Chrony</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Verifying Time Synchronization</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Troubleshooting Common Issues with Chrony</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Best Practices for Time Synchronization in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Time Synchronization and NTP</h3>
<!-- /wp:heading -->

  <strong>Network Time Protocol (NTP)</strong> is a protocol designed to synchronize clocks across a network. For distributed computing environments, having accurate time across all systems is essential to ensure the smooth functioning of applications, security services, databases, and event logging. 
 

  Traditionally, the <strong>ntpd</strong> daemon was used for this purpose. However, <strong>Chrony</strong> has emerged as a faster, more accurate, and flexible replacement, particularly in environments where systems experience periodic network outages or are connected to a network with high latency. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Why Choose Chrony Over Other NTP Solutions?</h3>
<!-- /wp:heading -->

  Chrony offers several advantages over traditional NTP solutions like <strong>ntpd</strong>: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Faster Synchronization</strong>: Chrony can quickly adjust the system clock to the correct time, even if the initial clock drift is large.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Better Performance on Unstable Networks</strong>: Chrony is optimized for environments where the server is disconnected from the network for extended periods, such as laptops or edge devices.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Low Resource Usage</strong>: It is lightweight and uses fewer resources compared to other NTP implementations.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Robustness</strong>: It can handle large time offsets without requiring a system reboot and adjusts the time smoothly rather than jumping straight to the correct time.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Given these benefits, Chrony is a perfect fit for AlmaLinux 9, ensuring efficient and reliable time management across server fleets. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. Installing Chrony on AlmaLinux 9</h3>
<!-- /wp:heading -->

  Chrony is included in the default AlmaLinux 9 repositories, so installation is straightforward using the <strong>dnf</strong> package manager. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Update Your System</h4>
<!-- /wp:heading -->

  Before installing Chrony, ensure your system is updated: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf update -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Install Chrony</h4>
<!-- /wp:heading -->

  To install Chrony, use the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install chrony -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Enable and Start the Chrony Service</h4>
<!-- /wp:heading -->

  Once installed, you need to enable Chrony to start automatically at boot and start the service: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable chronyd
sudo systemctl start chronyd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Verify the Status of Chrony</h4>
<!-- /wp:heading -->

  To confirm that the Chrony service is running: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status chronyd</code></pre>
<!-- /wp:code -->

  You should see a message indicating that the Chrony service is active and running. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Configuring Chrony as an NTP Server</h3>
<!-- /wp:heading -->

  Chrony is configured via the <strong>/etc/chrony.conf</strong> file. This configuration file allows you to specify NTP servers, control access to the NTP service, and adjust synchronization parameters. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Open the Chrony Configuration File</h4>
<!-- /wp:heading -->

  To modify the Chrony configuration, open the file in your favorite text editor: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/chrony.conf</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Specify NTP Servers</h4>
<!-- /wp:heading -->

  By default, the file will contain a list of public NTP servers. You can add or replace these with your preferred servers. For example, to use the <strong>pool.ntp.org</strong> servers, ensure your configuration includes: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">pool 2.centos.pool.ntp.org iburst</code></pre>
<!-- /wp:code -->

  The <code>iburst</code> option ensures that Chrony makes several requests in quick succession when the server is unreachable, improving the speed of initial synchronization. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Configure Chrony as an NTP Server for Your Network</h4>
<!-- /wp:heading -->

  If you want to configure your AlmaLinux 9 server to serve time for other machines in your network, you will need to allow other systems to synchronize with it. Add the following lines to your <strong>/etc/chrony.conf</strong> file to allow access from a specific subnet: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">allow 192.168.1.0/24</code></pre>
<!-- /wp:code -->

  This example grants access to all machines within the <strong>192.168.1.0/24</strong> subnet. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Restart the Chrony Service</h4>
<!-- /wp:heading -->

  After making changes to the <strong>/etc/chrony.conf</strong> file, restart Chrony for the changes to take effect: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart chronyd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Allowing Client Systems to Sync Time with Chrony</h3>
<!-- /wp:heading -->

  If you’ve configured your AlmaLinux server to act as an NTP server, client systems in your network can now synchronize time with it. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install Chrony on Client Systems</h4>
<!-- /wp:heading -->

  Just like on the server, install Chrony on the client system: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install chrony -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Configure the Client to Use Your NTP Server</h4>
<!-- /wp:heading -->

  On each client, edit the <strong>/etc/chrony.conf</strong> file to include your AlmaLinux 9 server as the NTP server: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">server &lt;your-almalinux-server-ip&gt; iburst</code></pre>
<!-- /wp:code -->

  Replace <code>&lt;your-almalinux-server-ip&gt;</code> with the IP address of the server you configured in Step 4. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Start and Enable Chrony on the Client</h4>
<!-- /wp:heading -->

  Start the Chrony service on the client machine: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable --now chronyd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Verifying Time Synchronization</h3>
<!-- /wp:heading -->

  Once Chrony is configured, you can verify that the synchronization is working properly. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Check Chrony Sources</h4>
<!-- /wp:heading -->

  On both the server and client systems, use the following command to view the list of NTP sources Chrony is using: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">chronyc sources</code></pre>
<!-- /wp:code -->

  You should see your NTP servers listed along with their status. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Check Synchronization Status</h4>
<!-- /wp:heading -->

  To verify if the system clock is synchronized, use the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">chronyc tracking</code></pre>
<!-- /wp:code -->

  This command shows the current state of time synchronization, including the reference NTP server, current system time offset, and other important metrics. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Troubleshooting Common Issues with Chrony</h3>
<!-- /wp:heading -->

  If you run into issues with time synchronization, here are a few troubleshooting steps: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Check Firewall Settings</strong>: Ensure that NTP traffic is allowed on your server by configuring your firewall to allow port <strong>123/UDP</strong>. You can use <strong>firewall-cmd</strong> to enable NTP on the firewall:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Verify Network Connectivity</strong>: Ensure that the client can reach the NTP server over the network. Use <code>ping</code> or <code>telnet</code> to verify connectivity.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Check Log Files</strong>: If Chrony is not working as expected, check the logs for more details:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">journalctl -u chronyd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Best Practices for Time Synchronization in AlmaLinux 9</h3>
<!-- /wp:heading -->

  To ensure reliable time synchronization, follow these best practices: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Use Multiple NTP Servers</strong>: Configure more than one NTP server for redundancy, ensuring accurate time even if one server becomes unreachable.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Monitor Time Drift</strong>: Use tools like <strong>chronyc tracking</strong> to regularly monitor time drift and ensure accurate synchronization.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ensure Firewall Rules</strong>: Confirm that NTP traffic is allowed through firewalls on both server and client systems to prevent connectivity issues.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 9. Conclusion</h3>
<!-- /wp:heading -->

  Chrony is a powerful and efficient tool for time synchronization in AlmaLinux 9, offering numerous advantages over traditional NTP solutions like <strong>ntpd</strong>. By following the steps in this guide, you can easily install and configure Chrony to act as both an NTP client and server. This ensures that your systems have accurate time synchronization, which is crucial for logging, security, and network operations. 
 

  By using Chrony, you not only improve the precision of your system’s timekeeping but also make your network more resilient to connection outages and time drifts. Ensure you follow best practices for time synchronization and regularly verify your setup to avoid any future issues. 
 