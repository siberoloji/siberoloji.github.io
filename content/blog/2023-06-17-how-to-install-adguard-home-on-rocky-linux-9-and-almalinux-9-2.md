---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "78"
categories:
- Linux How-to
date: "2023-06-17T16:01:56Z"
guid: https://www.siberoloji.com/?p=415
id: 415
image: /assets/images/2023/06/adguard.webp
tags:
- adguard
- dns
- how-to guides
- linux how-to
title: How to Install AdGuard Home on Rocky Linux 9 and AlmaLinux 9 ?
url: /how-to-install-adguard-home-on-rocky-linux-9-and-almalinux-9-2/
---

  AdGuard Home is open source DNS server software that aims to block advertisement and follower codes in traffic to your network. You can do ad blocking across your entire network by installing it on a server in your home or small office. 
 

  In this article, we will share the Adguard Home installation on our server using Rocky Linux 9 and AlmaLinux 9. 
 

  You must perform the following steps in order on your command line. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Let's update the system packages. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf clean all &amp;&amp; sudo dnf update<br>sudo dnf groupinstall "Development Tools"</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Let's download and install AdGuard packages from GitHub 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Let's open the necessary permissions for the firewall. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --add-service={dns,http,https} --permanent<br>sudo firewall-cmd --add-port=3000/tcp --permanent<br>sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  Adguard application has been installed on the server. To make final settings and create a user, you should visit http://localhost:3000 or http://serveripaddress:3000 in a web browser. 
 

  Finally, you can enter the IP address of the server you have installed in the DNS IP addresses  
 