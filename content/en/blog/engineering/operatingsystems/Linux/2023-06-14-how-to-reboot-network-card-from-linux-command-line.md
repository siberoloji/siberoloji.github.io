---
draft: false

title:  'How to reboot network card from Linux command line?'
date: '2023-06-14T17:29:41+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'You can turn your network card off and on with the commands we have explained below.' 
 
url:  /how-to-reboot-network-card-from-linux-command-line/
burst_total_pageviews_count:
    - '2'
featured_image: /images/bash-1.jpeg
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux command line'
    - 'linux how-to'
---
You may need to reboot your network card when there is a connection problem in your Linux operating system or when you change the IP settings. You do not need to restart your computer or server to do this. You can turn your network card off and on with the commands we have explained below.

**WARNING: This method is used if you have direct access to your computer. If you are remotely connected to your server via SSH, etc., you will lose access because your network card will be disabled. WARNING!!!**

## To stop the network card
```bash
# nmcli networking off```

## To initialize the network card
<!-- wp:code -->
<pre class="wp-block-code"><code class=""># nmcli networking on
```

If you don't have direct access to your server, you can try the "restart" method instead of the shutdown/on method.

## To Restart the network card
<!-- wp:code -->
<pre class="wp-block-code"><code class="">systemctl restart NetworkManager```

## To check the status of the network card
<!-- wp:code -->
<pre class="wp-block-code"><code class="">systemctl status NetworkManager```

The commands listed above work on almost all Linux systems. If you have a different network manager on your system, you can refer to the man pages.
