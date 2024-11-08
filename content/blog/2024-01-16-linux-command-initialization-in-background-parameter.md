---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-16T14:32:40Z"
excerpt: When you enter a command while working on the Linux command line, you have
  to wait until that command is finished if you want to enter another command. To
  solve this, you can make new windows and new connections, but there is another solution.
guid: https://www.siberoloji.com/?p=670
id: 670
image: /assets/images/2024/01/linuxbgfgcommands.png
tags:
- linux
- linux fundamentals
- os
- software
title: Linux command initialization in background &amp; parameter
url: /linux-command-initialization-in-background-parameter/
---

<!-- wp:paragraph -->
<p>When you enter a command while working on the Linux command line, you have to wait until that command is finished if you want to enter another command. To solve this, you can make new windows and new connections, but there is another solution.</p>
  

<!-- wp:paragraph -->
<p>You can start the command you will give first, in the background. For example, if you want to start a long copy process in the background and deal with other tasks, it will be sufficient to put an &amp; sign at the end of the command.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">linux@rpi4:~ $ sudo apt update &amp;
[1] 7336
linux@rpi4:~ $ jobs
[1]+  Stopped                 sudo apt update
linux@rpi4:~ $ fg 1
sudo apt update
[sudo] password for linux: 
Hit:1 http://deb.debian.org/debian bookworm InRelease
Hit:2 http://archive.raspberrypi.com/debian bookworm InRelease
Hit:3 http://deb.debian.org/debian-security bookworm-security InRelease
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
linux@rpi4:~ $ 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>As you can see above, we started the update process in the background with the <code>sudo apt update &amp;</code> command. In this case, the system showed us the job number of the job that started in the background as <code>[1]</code>. If more than one job is being done in the background, we can see their list with the jobs command. We can also bring a background process back to the foreground with the <code>fg 1</code> command. If we want to do the opposite, we can send a running job to the background using the <kbd>Ctrl+z </kbd>keys.</p>
  

<!-- wp:paragraph -->
<p>The most important convenience that should be emphasized here is that the command line comes back to our use as soon as we give the command with the <code>&amp;</code> sign.</p>
  