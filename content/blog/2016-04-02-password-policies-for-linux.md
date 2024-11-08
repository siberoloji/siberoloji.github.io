---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-02T14:04:00Z"
guid: https://www.siberoloji.com/?p=1316
id: 1316
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux
- linux fundamentals
- os
title: Password policies for Linux
url: /password-policies-for-linux/
---

<!-- wp:paragraph -->
<p>The majority of Linux users regularly install security updates and use the latest version. As far as we know, they are sensitive and careful. But this sensitivity and attention alone may not be enough. If you do not have a secure password policy that applies equally to every user, installing security updates alone may not be enough.</p>
  

<!-- wp:paragraph -->
<p>Most Linux distributions select policies that do not disturb the user during installation by default. It is necessary to determine rules later, such as the requirement to change the password, the number of days between changes, or the number of days after which the account will be locked. &nbsp;</p>
  

<!-- wp:paragraph -->
<p>If you want to make such settings,&nbsp;&nbsp;&nbsp;you should use a command called&nbsp;<strong>chage</strong>&nbsp;. This easy-to-use and simple command will help you a lot in creating the password policies you choose. You can see the options and what you can do on the help and man pages.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">chage --help
man chage</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If you run the command below from the command line, you can see the password rules of the user you want.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># change siberoloji with your username.

$ chage -l siberoloji

Last password change : May 04, 2015
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
$ _</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>As can be seen in the report above, the user's password will never expire, become inactive, the account will not become inactive, and there will be no need to create a new password before 99999 days have passed since the password was changed.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chage -M 90 siberoloji</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command allows you to set a rule that the user you specify must change their password after 90 days from the last password change.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chage -m 5 -M 90 -I 30 -W 14 siberoloji</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Let's explain the options used in the command one by one.</p>
  

<!-- wp:paragraph -->
<p>With the (&nbsp;<em>-m 5</em>&nbsp;) option, it is determined that after a password is changed, at least 5 days must pass before it can be changed again.</p>
  

<!-- wp:paragraph -->
<p>Thanks to the (&nbsp;<em>-M 90</em>&nbsp;) option, the user is forced to change his password after 90 days have passed since the password was changed.</p>
  

<!-- wp:paragraph -->
<p>(&nbsp;<em>-I 30</em>&nbsp;) If the user has not logged in for 30 days since the last login, it is determined that the account will be deactivated. If you are going on vacation or will be away from your computer for a long time, we recommend that you use it with caution.&nbsp;</p>
  

<!-- wp:paragraph -->
<p>The (&nbsp;<em>-W 14</em>&nbsp;) option will warn the user with a warning when there are 14 days left for his password to expire.</p>
  

<!-- wp:paragraph -->
<p>To continue using your computer more securely, start with yourself and try tightening your own user password policies. Although it may seem strange for a while, believe me, people feel more secure the system they use.</p>
  