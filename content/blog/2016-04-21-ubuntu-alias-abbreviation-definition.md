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
date: "2016-04-21T23:30:00Z"
guid: https://www.siberoloji.com/?p=1355
id: 1355
image: /assets/images/2024/06/linux-howto.jpg
tags:
- how-to guides
- linux how-to
title: Ubuntu Alias ​​Abbreviation Definition
url: /ubuntu-alias-abbreviation-definition/
---

  In this article, we showed how to shorten long commands that we constantly use on the Linux command line, using aliases. Although we demonstrated it using Ubuntu Operating system, it can also be used in other Linux distributions. 
 

  Using Alias ​​helps you implement the operations you do on the command line very quickly. The abbreviation you define with a few letters displays a very long command and executes it immediately. 
 

  <strong>NOTE</strong>&nbsp;: There is no need to re-create the bash_aliases file created for the first time during permanent use. You can edit this file, which is hidden in the Home folder, by opening it with any editor. 
 

  You can copy and use the commands used in this video from below. 
 

<!-- wp:heading {"level":3} -->
 ### Alias ​​temporary use</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias lsa='ls -al'</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Alias ​​permanent use</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd 
touch .bash_aliases 
nano .bash_aliases 
alias upd='sudo apt-get update; sudo apt-get -y upgrade' 
Ctrl-x ile çıkış 
Evet cevabı ile kayıt 
source .bashrc 
upd</code></pre>
<!-- /wp:code -->

  You can let us know about other topics you would like explained how it is done. 
 