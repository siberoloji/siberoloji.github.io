---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Linux How-to
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-16T21:53:11Z"
excerpt: In the Linux command line, you can define abbreviations for commands that
  you use frequently and that are long to type. Thanks to the abbreviation you define,
  you shorten long commands and save time. In this article, the use of the alias command
  and creating abbreviations will be explained.
guid: https://www.siberoloji.com/?p=682
id: 682
image: /assets/images/2024/01/bash-aliases-cli.png
tags:
- how-to guides
- linux
- linux fundamentals
- linux how-to
- os
- software
title: Defining a shortcut with the alias command in Linux
url: /defining-a-shortcut-with-the-alias-command-in-linux/
---

  In the Linux command line, you can define abbreviations for commands that you use frequently and that are long to type. Thanks to the abbreviation you define, you shorten long commands and save time. In this article, the use of the alias command and creating abbreviations will be explained. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias uptodate='sudo apt update &amp;&amp; sudo apt upgrade'</code></pre>
<!-- /wp:code -->

  Thanks to the update command given above, a long command has been converted into an abbreviation of uptodate. It is possible to multiply these examples. For example, let's shorten the systemctl command to view the services running on our system. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias active_services='systemctl --type=service --state=running'</code></pre>
<!-- /wp:code -->

  You need to make these commands and similar ones permanent. If you want to use alias abbreviations when your system restarts, you must create a file named .bash_aliases in the home folder. You can add any abbreviations you want into this file, one command per line. Below is the screenshot of the file we created. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nano .bash_aliases</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":677,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/01/nano-editor-bash-aliases.png" alt="" class="wp-image-677" /><figcaption class="wp-element-caption">nano editor .bash_aliases</figcaption></figure>
<!-- /wp:image -->

  We can save the file with the Ctrl+o keys and exit with the Ctrl+x key. Finally, since the file needs to be reloaded into the system, let's restart the bash software with the following command. Now, when you type active and press the Tab key, it will auto-complete and the abbreviation will work. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">linux@rpi4:~ $ source .bashrc
linux@rpi4:~ $ active_services</code></pre>
<!-- /wp:code -->

  In this way, your working speed on the command line will increase significantly. 
 