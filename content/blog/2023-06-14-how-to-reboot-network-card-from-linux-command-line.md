---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "2"
categories:
- Linux How-to
date: "2023-06-14T17:29:41Z"
excerpt: You can turn your network card off and on with the commands we have explained
  below.
guid: https://www.siberoloji.com/?p=373
id: 373
image: /assets/images/2023/06/bash-1.jpeg
tags:
- how-to guides
- linux
- linux command line
- linux how-to
title: How to reboot network card from Linux command line?
url: /how-to-reboot-network-card-from-linux-command-line/
---

  You may need to reboot your network card when there is a connection problem in your Linux operating system or when you change the IP settings. You do not need to restart your computer or server to do this. You can turn your network card off and on with the commands we have explained below.
 

  ***WARNING: This method is used if you have direct access to your computer. If you are remotely connected to your server via SSH, etc., you will lose access because your network card will be disabled. WARNING!!!*** 
 

 
 ## To stop the network card
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># nmcli networking off</code></pre>
<!-- /wp:code -->

 
 ## To initialize the network card
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code class=""># nmcli networking on</code></pre>
<!-- /wp:code -->

  If you don't have direct access to your server, you can try the "restart" method instead of the shutdown/on method.
 

 
 ## To Restart the network card
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code class="">systemctl restart NetworkManager</code></pre>
<!-- /wp:code -->

 
 ## To check the status of the network card
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code class="">systemctl status NetworkManager</code></pre>
<!-- /wp:code -->

  The commands listed above work on almost all Linux systems. If you have a different network manager on your system, you can refer to the man pages.
 