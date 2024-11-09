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
date: "2024-10-04T14:40:54Z"
guid: https://www.siberoloji.com/?p=2307
id: 2307
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- linux how-to
- selinux
title: 'AlmaLinux 9: How to Configure Firewall and SELinux with Example Commands'
url: /almalinux-9-how-to-configure-firewall-and-selinux-with-example-commands/
---

  When setting up a server, security is a top priority, and two essential tools for system security in ***AlmaLinux 9***  are the ***firewall***  and ***SELinux (Security-Enhanced Linux)*** . Both tools protect your system from unauthorized access and vulnerabilities. In this blog, we'll walk through the steps to configure and manage the firewall and SELinux in AlmaLinux 9, using practical example commands. 
 


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Firewalls and SELinux 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Installing and Enabling the Firewall 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring Firewall with Example Commands 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Understanding SELinux in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring SELinux with Example Commands 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Best Practices for Managing Firewall and SELinux 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Firewalls and SELinux
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">What is a Firewall? 
<!-- /wp:heading -->

  A ***firewall***  is a system that monitors and controls incoming and outgoing network traffic based on security rules. In AlmaLinux, the firewall is managed using <code>firewalld</code>, a dynamic tool that allows you to configure firewall rules without disrupting network connections. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">What is SELinux? 
<!-- /wp:heading -->

  ***Security-Enhanced Linux (SELinux)***  is a mandatory access control system that provides a robust mechanism for defining and enforcing security policies on your system. It restricts programs and services to only the resources they are supposed to access, providing an additional layer of protection. 
 

  Both firewall and SELinux are crucial for server security. While the firewall focuses on network traffic, SELinux controls permissions within the operating system. Let's start with configuring the firewall on AlmaLinux 9. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Installing and Enabling the Firewall
<!-- /wp:heading -->

  By default, AlmaLinux 9 comes with ***<code>firewalld</code>***  installed. However, if it's missing for any reason, you can easily install it using the package manager. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Install firewalld: 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install firewalld</code></pre>
<!-- /wp:code -->

  Once installed, enable and start the service to ensure it runs automatically upon system boot. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Enable and start firewalld: 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable firewalld
sudo systemctl start firewalld</code></pre>
<!-- /wp:code -->

  You can verify the firewall status using: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --state</code></pre>
<!-- /wp:code -->

  If everything is configured correctly, it should display <code>running</code>. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. Configuring Firewall with Example Commands
<!-- /wp:heading -->

  Now that the firewall service is running, let's dive into configuring it. In AlmaLinux 9, <code>firewalld</code> is zone-based, which means it applies different rules based on zones (such as public, home, work, etc.). You can also define services, ports, and protocols within these zones. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">List Available Zones: 
<!-- /wp:heading -->

  To see all available zones, run: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --get-zones</code></pre>
<!-- /wp:code -->

  By default, the firewall is set to the <code>public</code> zone. You can check the active zone with: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --get-active-zones</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Allowing a Service 
<!-- /wp:heading -->

  Let's say you want to allow SSH access. To do this, you'll need to enable the SSH service in the active zone. 
 

  Allow SSH in the public zone: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --zone=public --add-service=ssh --permanent</code></pre>
<!-- /wp:code -->

  The <code>--permanent</code> flag ensures that the rule persists after reboot. Without this flag, the change would only apply until the next system restart. After adding a service, reload the firewall to apply the changes: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Allowing a Port 
<!-- /wp:heading -->

  Instead of allowing services, you can also open specific ports. For example, to allow traffic on port 8080 (commonly used by web applications), use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Blocking a Service or Port 
<!-- /wp:heading -->

  To block a service or port, use the <code>--remove</code> option. For instance, to block HTTP access: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --zone=public --remove-service=http --permanent
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  You can use the same command to remove ports: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Listing Active Rules 
<!-- /wp:heading -->

  To check which services and ports are currently allowed: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --list-all</code></pre>
<!-- /wp:code -->

  This will show a detailed breakdown of the services, ports, and protocols in the active zone. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Understanding SELinux in AlmaLinux 9
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">SELinux Modes 
<!-- /wp:heading -->

  SELinux operates in three modes: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Enforcing:***  SELinux policies are strictly enforced, and unauthorized actions are blocked. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Permissive:***  SELinux allows actions but logs policy violations. This mode is useful for troubleshooting. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Disabled:***  SELinux is turned off completely (not recommended for production environments). 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  To check the current SELinux mode, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sestatus</code></pre>
<!-- /wp:code -->

  This will display whether SELinux is enforcing, permissive, or disabled. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Configuring SELinux with Example Commands
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Changing SELinux Modes 
<!-- /wp:heading -->

  To change the SELinux mode temporarily (until the next reboot), use the <code>setenforce</code> command. For example, to switch to ***permissive***  mode: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo setenforce 0</code></pre>
<!-- /wp:code -->

  To switch back to ***enforcing***  mode: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo setenforce 1</code></pre>
<!-- /wp:code -->

  If you want to make a permanent change, edit the SELinux configuration file located at <code>/etc/selinux/config</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/selinux/config</code></pre>
<!-- /wp:code -->

  Find the line that begins with <code>SELINUX=</code> and change it to one of the following values: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- <code>SELINUX=enforcing</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>SELINUX=permissive</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>SELINUX=disabled</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  After making changes, save the file and reboot the system for the new mode to take effect. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Managing SELinux Policies 
<!-- /wp:heading -->

  SELinux policies define what actions are allowed for each process and service. If SELinux is blocking legitimate actions, you can modify policies to allow those actions. 
 

  For example, suppose you're hosting a web server, and SELinux is blocking HTTP access. You can set the appropriate SELinux context for the web directory with the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"
sudo restorecon -Rv /var/www/html</code></pre>
<!-- /wp:code -->

  In this case, <code>httpd_sys_content_t</code> is the default type for files that the web server (<code>httpd</code>) can access. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Viewing SELinux Alerts 
<!-- /wp:heading -->

  To view SELinux alerts (denials), use the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo ausearch -m avc</code></pre>
<!-- /wp:code -->

  This will show a log of denied actions, which is helpful for troubleshooting when SELinux is blocking legitimate processes. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Best Practices for Managing Firewall and SELinux
<!-- /wp:heading -->

  To ensure maximum security and efficiency, consider the following best practices when managing your firewall and SELinux in AlmaLinux 9: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Minimize Open Ports:***  Only open necessary ports and services to reduce your system’s attack surface. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Use Zones Effectively:***  Assign different zones for different network interfaces (e.g., public, trusted) to apply appropriate rules. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Monitor SELinux Logs:***  Regularly check SELinux logs to identify and address potential issues without compromising security. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Test Before Enforcing:***  When configuring SELinux policies, use permissive mode to test before switching to enforcing mode. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Regular Updates:***  Keep both your firewall rules and SELinux policies up to date with the latest security patches. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Conclusion
<!-- /wp:heading -->

  Configuring the firewall and SELinux in AlmaLinux 9 is essential for securing your server. The firewall helps you control network traffic, while SELinux adds another layer of defense by enforcing strict access controls within the operating system. With the example commands provided in this guide, you should be able to configure both tools to meet your security needs. 
 

  Always remember that security is a continuous process, and maintaining a secure system requires regular monitoring, updating rules, and adjusting policies as needed. 
 

  By following the steps in this guide, you'll significantly enhance the security of your AlmaLinux 9 system. 
 