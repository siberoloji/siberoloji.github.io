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
date: "2024-10-04T14:44:58Z"
guid: https://www.siberoloji.com/?p=2309
id: 2309
image: /assets/images/2024/09/almalinux.webp
post_views_count:
- "0"
tags:
- alma linux
- how-to guides
- linux how-to
title: 'AlmaLinux 9: How to Change and Manage Network Settings'
url: /almalinux-9-how-to-change-and-manage-network-settings/
---

<!-- wp:paragraph -->
<p>Network configuration is a critical aspect of managing a server, especially in environments where performance, security, and connectivity are paramount. <strong>AlmaLinux 9</strong>, a stable and reliable CentOS alternative, offers several tools and methods to configure and manage network settings, ranging from command-line utilities to graphical tools. In this blog post, we will walk through how to change and manage network settings in AlmaLinux 9, focusing on both basic and advanced configurations.</p>
  

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Network Configuration in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Understanding NetworkManager and Network Tools</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Viewing Current Network Settings</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring Network Interfaces (Static and DHCP)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configuring DNS and Hostname</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Managing Network Interfaces Using nmcli</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Troubleshooting Network Issues</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Best Practices for Network Management in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Network Configuration in AlmaLinux 9</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Configuring network settings in <strong>AlmaLinux 9</strong> involves managing the system's network interfaces, routing, DNS, and hostname settings. These configurations enable your server to communicate effectively with other machines over a network, whether it's a private local area network (LAN) or the broader internet.</p>
  

<!-- wp:paragraph -->
<p>AlmaLinux 9 uses <strong>NetworkManager</strong> as its primary tool for managing network settings. NetworkManager simplifies the task of configuring and monitoring network interfaces, allowing administrators to manage connections both through a graphical interface and via the command line.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Understanding NetworkManager and Network Tools</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>NetworkManager</strong> is the default service for managing network interfaces in AlmaLinux 9. It allows you to manage Ethernet, Wi-Fi, mobile broadband, and VPN connections. It provides both command-line and graphical user interfaces, making it versatile for various use cases.</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>nmcli</strong>: A command-line tool to interact with NetworkManager.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>nmtui</strong>: A text-based user interface tool that provides an easier, interactive way to manage network settings from the terminal.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>ifconfig</strong>: A deprecated tool but still available for viewing interface details.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>ip</strong>: A modern replacement for <code>ifconfig</code> that can be used for network interface and routing configurations.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Before changing network settings, it's important to understand the current configuration, which brings us to the next step.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. Viewing Current Network Settings</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before making any changes, it’s useful to inspect the current network configuration. You can use a variety of commands to do this.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Active Network Interfaces</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To list all active network interfaces on your system, use the <code>nmcli</code> or <code>ip</code> command.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli device status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will display a list of all network interfaces, along with their connection status.</p>
  

<!-- wp:paragraph -->
<p>Alternatively, you can use:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ip addr</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will give you detailed information about all available network interfaces, including their IP addresses.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Displaying Routing Table</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To view the routing table and see how your network traffic is routed:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ip route</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will display the default gateway and other routing information, which is essential for understanding how the network is configured.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking DNS Configuration</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To check the DNS settings, you can inspect the <code>/etc/resolv.conf</code> file:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /etc/resolv.conf</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This file lists the nameservers your system uses to resolve domain names to IP addresses.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Configuring Network Interfaces (Static and DHCP)</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Network interfaces in AlmaLinux 9 can be configured to use either <strong>DHCP (Dynamic Host Configuration Protocol)</strong> or a <strong>static IP address</strong>. In a DHCP setup, the server automatically assigns an IP address, while a static IP configuration requires manual settings for the IP, netmask, gateway, and DNS.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring a Static IP Address</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To configure a network interface with a static IP address, use <code>nmcli</code>. First, identify the network interface you want to configure:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli device status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Assume your network interface is named <code>ens33</code>. To assign a static IP, use the following command:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.addresses 192.168.1.100/24
nmcli con mod ens33 ipv4.gateway 192.168.1.1
nmcli con mod ens33 ipv4.dns 8.8.8.8
nmcli con mod ens33 ipv4.method manual</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Finally, bring the connection up:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command sets a static IP address of <code>192.168.1.100</code>, with a subnet mask of <code>/24</code>, and configures <code>192.168.1.1</code> as the default gateway and Google's DNS <code>8.8.8.8</code>.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring DHCP</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To configure the same network interface to use DHCP, you can switch the interface back to automatic configuration:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.method auto
nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This tells NetworkManager to obtain an IP address automatically from the DHCP server.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Configuring DNS and Hostname</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Correctly configuring DNS and the system's hostname is crucial for ensuring proper network communication.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Changing DNS Servers</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>DNS servers can be configured using <code>nmcli</code>. For example, to set Google's DNS servers (<code>8.8.8.8</code> and <code>8.8.4.4</code>), you can modify the connection like this:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This updates the DNS servers for the <code>ens33</code> interface.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Changing Hostname</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To change the hostname in AlmaLinux 9, use the <code>hostnamectl</code> command:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo hostnamectl set-hostname new-hostname</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>new-hostname</code> with the desired hostname for your server. This will change the system’s hostname, and you can verify the change by typing:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">hostnamectl</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Managing Network Interfaces Using nmcli</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>nmcli</strong> tool provides extensive capabilities for managing network connections. Let's cover a few common tasks using <code>nmcli</code>.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing All Network Connections</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To see all network connections (both active and inactive):</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con show</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This lists all the available connections configured on your system.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Creating a New Network Connection</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To create a new connection with a static IP address:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con add type ethernet ifname ens33 con-name static-con ipv4.addresses 192.168.1.101/24 ipv4.gateway 192.168.1.1 ipv4.dns 8.8.8.8 ipv4.method manual</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command adds a new connection named <code>static-con</code> for the <code>ens33</code> interface.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Bringing Up and Down Network Connections</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To bring a connection down (disconnect):</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con down ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>To bring the connection back up:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Troubleshooting Network Issues</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Even with careful configuration, network issues can arise. Here are some common troubleshooting techniques:</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking the Status of NetworkManager</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>First, verify that <strong>NetworkManager</strong> is running:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl status NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If it's not running, you can start it with:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Testing Connectivity</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use the <code>ping</code> command to check basic connectivity:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ping 8.8.8.8</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This tests whether the server can reach Google’s DNS servers. If this fails, it might indicate a problem with your gateway or ISP.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Reviewing Logs</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Check system logs for any network-related errors:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">journalctl -xe | grep NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will show detailed logs of network-related events.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Best Practices for Network Management in AlmaLinux 9</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Use Static IP for Servers</strong>: For production servers, always configure a static IP to ensure consistent access to the system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Minimize Manual Configuration</strong>: Leverage <code>nmcli</code> or <code>nmtui</code> for most network configurations to avoid manual editing of configuration files.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Monitor Network Connections</strong>: Regularly monitor network interfaces, DNS configurations, and routing tables to identify potential misconfigurations.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Backup Configurations</strong>: Before making any changes to your network settings, ensure you have a backup of the current configuration to revert to in case something goes wrong.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Use NetworkManager</strong>: Stick with <strong>NetworkManager</strong> as it simplifies managing complex networking setups compared to older tools like <code>ifconfig</code>.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 9. Conclusion</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Configuring and managing network settings in <strong>AlmaLinux 9</strong> is straightforward when using the <strong>NetworkManager</strong> service and its associated tools like <strong>nmcli</strong>. By understanding how to configure network interfaces, manage DNS, and troubleshoot potential issues, you can ensure that your AlmaLinux server is well-connected and operating efficiently.</p>
  

<!-- wp:paragraph -->
<p>Whether you're setting up a server with a static IP or relying on DHCP for dynamic configurations, following best practices in network management will help keep your AlmaLinux 9 systems stable and secure.</p>
  