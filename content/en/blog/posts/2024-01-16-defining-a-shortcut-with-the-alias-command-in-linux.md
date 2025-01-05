---
draft: false

title:  'Defining a shortcut with the alias command in Linux'
date: '2024-01-16T21:53:11+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In the Linux command line, you can define abbreviations for commands that you use frequently and that are long to type. Thanks to the abbreviation you define, you shorten long commands and save time. In this article, the use of the alias command and creating abbreviations will be explained.' 
 
url:  /defining-a-shortcut-with-the-alias-command-in-linux/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '1'
featured_image: /images/bash-aliases-cli.png
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux fundamentals'
    - 'linux how-to'
    - os
    - software
---


In the Linux command line, you can define abbreviations for commands that you use frequently and that are long to type. Thanks to the abbreviation you define, you shorten long commands and save time. In this article, the use of the alias command and creating abbreviations will be explained.


```bash
alias uptodate='sudo apt update &amp;&amp; sudo apt upgrade'```



Thanks to the update command given above, a long command has been converted into an abbreviation of uptodate. It is possible to multiply these examples. For example, let's shorten the systemctl command to view the services running on our system.


```bash
alias active_services='systemctl --type=service --state=running'```



You need to make these commands and similar ones permanent. If you want to use alias abbreviations when your system restarts, you must create a file named .bash_aliases in the home folder. You can add any abbreviations you want into this file, one command per line. Below is the screenshot of the file we created.


```bash
nano .bash_aliases
```


<!-- wp:image {"id":677,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2024/01/nano-editor-bash-aliases.png" alt="" class="wp-image-677" /><figcaption class="wp-element-caption">nano editor .bash_aliases</figcaption></figure>
<!-- /wp:image -->


We can save the file with the Ctrl+o keys and exit with the Ctrl+x key. Finally, since the file needs to be reloaded into the system, let's restart the bash software with the following command. Now, when you type active and press the Tab key, it will auto-complete and the abbreviation will work.


```bash
linux@rpi4:~ $ source .bashrc
linux@rpi4:~ $ active_services
```



In this way, your working speed on the command line will increase significantly.
