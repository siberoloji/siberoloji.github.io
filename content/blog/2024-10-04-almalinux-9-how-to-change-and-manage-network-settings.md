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
<p>Network configuration is a critical aspect of managing a server, especially in environments where performance, security, and connectivity are paramount. ***AlmaLinux 9*** , a stable and reliable CentOS alternative, offers several tools and methods to configure and manage network settings, ranging from command-line utilities to graphical tools. In this blog post, we will walk through how to change and manage network settings in AlmaLinux 9, focusing on both basic and advanced configurations.
  


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Network Configuration in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Understanding NetworkManager and Network Tools 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Viewing Current Network Settings 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring Network Interfaces (Static and DHCP) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring DNS and Hostname 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Managing Network Interfaces Using nmcli 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Troubleshooting Network Issues 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Best Practices for Network Management in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Network Configuration in AlmaLinux 9
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Configuring network settings in ***AlmaLinux 9***  involves managing the system's network interfaces, routing, DNS, and hostname settings. These configurations enable your server to communicate effectively with other machines over a network, whether it's a private local area network (LAN) or the broader internet.
  

<!-- wp:paragraph -->
<p>AlmaLinux 9 uses ***NetworkManager***  as its primary tool for managing network settings. NetworkManager simplifies the task of configuring and monitoring network interfaces, allowing administrators to manage connections both through a graphical interface and via the command line.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Understanding NetworkManager and Network Tools
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>***NetworkManager***  is the default service for managing network interfaces in AlmaLinux 9. It allows you to manage Ethernet, Wi-Fi, mobile broadband, and VPN connections. It provides both command-line and graphical user interfaces, making it versatile for various use cases.
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***nmcli*** : A command-line tool to interact with NetworkManager. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***nmtui*** : A text-based user interface tool that provides an easier, interactive way to manage network settings from the terminal. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***ifconfig*** : A deprecated tool but still available for viewing interface details. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***ip*** : A modern replacement for <code>ifconfig</code> that can be used for network interface and routing configurations. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Before changing network settings, it's important to understand the current configuration, which brings us to the next step.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. Viewing Current Network Settings
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before making any changes, it’s useful to inspect the current network configuration. You can use a variety of commands to do this.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing Active Network Interfaces 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To list all active network interfaces on your system, use the <code>nmcli</code> or <code>ip</code> command.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli device status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will display a list of all network interfaces, along with their connection status.
  

<!-- wp:paragraph -->
<p>Alternatively, you can use:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ip addr</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will give you detailed information about all available network interfaces, including their IP addresses.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Displaying Routing Table 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To view the routing table and see how your network traffic is routed:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ip route</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will display the default gateway and other routing information, which is essential for understanding how the network is configured.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking DNS Configuration 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To check the DNS settings, you can inspect the <code>/etc/resolv.conf</code> file:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /etc/resolv.conf</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This file lists the nameservers your system uses to resolve domain names to IP addresses.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Configuring Network Interfaces (Static and DHCP)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Network interfaces in AlmaLinux 9 can be configured to use either ***DHCP (Dynamic Host Configuration Protocol)***  or a ***static IP address*** . In a DHCP setup, the server automatically assigns an IP address, while a static IP configuration requires manual settings for the IP, netmask, gateway, and DNS.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring a Static IP Address 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To configure a network interface with a static IP address, use <code>nmcli</code>. First, identify the network interface you want to configure:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli device status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Assume your network interface is named <code>ens33</code>. To assign a static IP, use the following command:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.addresses 192.168.1.100/24
nmcli con mod ens33 ipv4.gateway 192.168.1.1
nmcli con mod ens33 ipv4.dns 8.8.8.8
nmcli con mod ens33 ipv4.method manual</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Finally, bring the connection up:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command sets a static IP address of <code>192.168.1.100</code>, with a subnet mask of <code>/24</code>, and configures <code>192.168.1.1</code> as the default gateway and Google's DNS <code>8.8.8.8</code>.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configuring DHCP 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To configure the same network interface to use DHCP, you can switch the interface back to automatic configuration:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.method auto
nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This tells NetworkManager to obtain an IP address automatically from the DHCP server.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Configuring DNS and Hostname
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Correctly configuring DNS and the system's hostname is crucial for ensuring proper network communication.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Changing DNS Servers 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>DNS servers can be configured using <code>nmcli</code>. For example, to set Google's DNS servers (<code>8.8.8.8</code> and <code>8.8.4.4</code>), you can modify the connection like this:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con mod ens33 ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This updates the DNS servers for the <code>ens33</code> interface.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Changing Hostname 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To change the hostname in AlmaLinux 9, use the <code>hostnamectl</code> command:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo hostnamectl set-hostname new-hostname</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>new-hostname</code> with the desired hostname for your server. This will change the system’s hostname, and you can verify the change by typing:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">hostnamectl</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Managing Network Interfaces Using nmcli
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The ***nmcli***  tool provides extensive capabilities for managing network connections. Let's cover a few common tasks using <code>nmcli</code>.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing All Network Connections 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To see all network connections (both active and inactive):
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con show</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This lists all the available connections configured on your system.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Creating a New Network Connection 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To create a new connection with a static IP address:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con add type ethernet ifname ens33 con-name static-con ipv4.addresses 192.168.1.101/24 ipv4.gateway 192.168.1.1 ipv4.dns 8.8.8.8 ipv4.method manual</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command adds a new connection named <code>static-con</code> for the <code>ens33</code> interface.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Bringing Up and Down Network Connections 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To bring a connection down (disconnect):
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con down ens33</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>To bring the connection back up:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nmcli con up ens33</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Troubleshooting Network Issues
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Even with careful configuration, network issues can arise. Here are some common troubleshooting techniques:
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Checking the Status of NetworkManager 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>First, verify that ***NetworkManager***  is running:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">systemctl status NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If it's not running, you can start it with:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Testing Connectivity 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use the <code>ping</code> command to check basic connectivity:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ping 8.8.8.8</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This tests whether the server can reach Google’s DNS servers. If this fails, it might indicate a problem with your gateway or ISP.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Reviewing Logs 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Check system logs for any network-related errors:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">journalctl -xe | grep NetworkManager</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will show detailed logs of network-related events.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Best Practices for Network Management in AlmaLinux 9
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Use Static IP for Servers*** : For production servers, always configure a static IP to ensure consistent access to the system. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Minimize Manual Configuration*** : Leverage <code>nmcli</code> or <code>nmtui</code> for most network configurations to avoid manual editing of configuration files. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Monitor Network Connections*** : Regularly monitor network interfaces, DNS configurations, and routing tables to identify potential misconfigurations. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Backup Configurations*** : Before making any changes to your network settings, ensure you have a backup of the current configuration to revert to in case something goes wrong. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Use NetworkManager*** : Stick with ***NetworkManager***  as it simplifies managing complex networking setups compared to older tools like <code>ifconfig</code>. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 9. Conclusion
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Configuring and managing network settings in ***AlmaLinux 9***  is straightforward when using the ***NetworkManager***  service and its associated tools like ***nmcli*** . By understanding how to configure network interfaces, manage DNS, and troubleshoot potential issues, you can ensure that your AlmaLinux server is well-connected and operating efficiently.
  

<!-- wp:paragraph -->
<p>Whether you're setting up a server with a static IP or relying on DHCP for dynamic configurations, following best practices in network management will help keep your AlmaLinux 9 systems stable and secure.
  