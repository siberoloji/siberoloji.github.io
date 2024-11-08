---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-25T01:26:00Z"
guid: https://www.siberoloji.com/?p=1367
id: 1367
image: /assets/images/2024/06/linux2.png
tags:
- how-to guides
- linux how-to
title: Learning our IP Address from the terminal
url: /learning-our-ip-address-from-the-terminal/
---

  Sometimes, when working in the terminal (bash, SSH etc.) you may need to learn the public IP address assigned to your modem by your ISP. You may need this IP address to use it in a program or to make adjustments. In our article, we will see how we can learn our IP address from the command line. Attention: We are not talking about your IP address on your internal network between your modem and your computer. You can learn it with the ifconfig command. 
 

  There are many methods to find out the IP address from the command line, let's see them one by one. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig +short myip.opendns.com @resolver1.opendns.com</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig TXT +short o-o.myaddr.l.google.com @ns1.google.com</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">host myip.opendns.com resolver1.opendns.com</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'</code></pre>
<!-- /wp:code -->

  In this method, your IP address is recorded in a shell variable. You can use it later whenever you need it. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "Açık IP adresim: ${myip}"</code></pre>
<!-- /wp:code -->

  You can also learn with the help of 3rd party sites. Any of the commands below will be useful. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">curl icanhazip.com
curl ipecho.net/plain
curl ifconfig.co</code></pre>
<!-- /wp:code -->