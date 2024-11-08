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
date: "2016-04-03T14:40:00Z"
guid: https://www.siberoloji.com/?p=1323
id: 1323
image: /assets/images/2024/06/linux2.png
tags:
- linux
- linux fundamentals
- os
- systemd
title: systemd – Getting started with systemctl
url: /systemd-getting-started-with-systemctl/
---

<!-- wp:paragraph -->
<p>Let's start examining the systemctl tool, one of the tools mentioned in the previous introduction  and  general usage articles on systemd .</p>
  

<!-- wp:paragraph -->
<p>As you know, the systemctl tool is used to control systemd itself and its service manager. It is the abbreviation of System Control. First, let's check the initial state of our system with the systemctl command. To do this, just type systemctl on the command line.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">komut:
systemctl
çıktı:
UNIT                 LOAD   ACTIVE SUB         DESCRIPTION
...
rc-local.service     loaded failed failed      /etc/rc.local Compatibility
resolvconf.service   loaded active exited      Nameserver information manager rsyslog.service      loaded active running     System Logging Service
...
LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
152 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>As a result, a report regarding all installed and unloaded services when your system starts is displayed on the screen. On this screen, the LOAD – ACTIVE – SUB columns provide information about the status of the loaded unit. According to the information in these columns, you can detect the errors of your system and fix the errors with the help of other systemd tools.</p>
  

<!-- wp:paragraph -->
<p>The output of the command given above is normally much more detailed and longer, but we have included it here in short. At the end of the report,  we can see that a total of 152 units are listed with the statement <em>152 loaded units listed</em>.</p>
  

<!-- wp:paragraph -->
<p>To get detailed information about the problem shown with a red warning in the output of the command,  we will use <strong>the status</strong> unit command of <strong>the systemctl</strong>  tool  and the name of the unit we want to get information about.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">komut:
systemctl status rc-local.service
çıktı:
● rc-local.service - /etc/rc.local Compatibility
Loaded: loaded (/lib/systemd/system/rc-local.service; static; vendor preset: enabled)
Active: failed (Result: exit-code) since Paz 2015-05-10 10:04:17 EEST; 42min ago
Process: 696 ExecStart=/etc/rc.local start (code=exited, status=1/FAILURE)
May 10 10:04:17 ubuntu systemd[1]: Starting /etc/rc.local Compatibility...
May 10 10:04:17 ubuntu systemd[1]: rc-local.service: control process exited, code=exited status=1
May 10 10:04:17 ubuntu systemd[1]: Failed to start /etc/rc.local Compatibility.
May 10 10:04:17 ubuntu systemd[1]: Unit rc-local.service entered failed state.
May 10 10:04:17 ubuntu systemd[1]: rc-local.service failed.</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>These status reports, the details of which we will explain later, will be very useful in finding out where there are problems with our system. The use of the Systemctl tool is done with status commands and parameters, as shown above and similar.</p>
  

<!-- wp:paragraph -->
<p>We have briefly looked at the systemctl tool from the systemd tools. In the following articles, we will examine using unit commands, unit file commands and system commands with the systemctl tool.</p>
  