---
layout: post
title: Dmitry, a simple and powerful tool
date: 2016-03-22 01:01:47.000000000 +02:00
type: post
img: cyber1.jpg
published: true
status: publish
categories:
- Araştırma
tags:
- dmitry
- dmitry tool
- information gathering

---
<p>When we start to talk about penetration tests, the fist phase will always be “Information Gathering”. Different sources are categorizing the types of information gathering from separate scopes. Active or passive, online or offline etc. I will try to introduce you a helpful tool with this post, called Dmitry.</p>
<p>Dmitry (Deepmagic Information Gathering Tool) is a GPLv3 licensed program written with C language by James Greig. It is UNIX/(GNU) Linux Command Line Application so working in the command line. I did no come across to it's GUI version so far. Dmitry's main ability is gathering information as much as it can. The sources may vary with the parameters you gave. It is able to gather possible subdomains, email addresses, uptime information, tcp port scan, whois lookups. Some functions can be thought as active information gathering so you should be careful if not permitted.</p>
<h2>Main feature of Dmitry:</h2>
<ul>
<li>Perform an Internet Number whois lookup.</li>
<li>Retrieve possible uptime data, system and server data.</li>
<li>Perform a SubDomain search on a target host.</li>
<li>Perform an E-Mail address search on a target host.</li>
<li>Perform a TCP Portscan on the host target.</li>
<li>A Modular program allowing user specified modules</li>
</ul>
<p>The program is tested with the following platforms according to the information from the <a href="http://mor-pah.net/software/dmitry-deepmagic-information-gathering-tool/" target="_blank">main page</a> of the application.</p>
<h2>Dmitry Tested Platforms:</h2>
<ul>
<li>FreeBSD 4.* 5.* 6.0</li>
<li>MacOSX 10.*</li>
<li>SuSE Linux 8.*</li>
<li>linux LFS 6.1</li>
<li>OpenBSD 3.8</li>
</ul>
<p>When you installed Dmitry, you can get help information with the help parameter. You should use one – for help. Here is the commnad line output.</p>
<pre class="lang:default decode:true " title="Help Output">root@kali:~# dmitry -h
Deepmagic Information Gathering Tool
"There be some deep magic going on"

dmitry: invalid option -- 'h'
Usage: dmitry [-winsepfb] [-t 0-9] [-o %host.txt] host
  -o     Save output to %host.txt or to file specified by -o file
  -i     Perform a whois lookup on the IP address of a host
  -w     Perform a whois lookup on the domain name of a host
  -n     Retrieve Netcraft.com information on a host
  -s     Perform a search for possible subdomains
  -e     Perform a search for possible email addresses
  -p     Perform a TCP port scan on a host
* -f     Perform a TCP port scan on a host showing output reporting filtered ports
* -b     Read in the banner received from the scanned port
* -t 0-9 Set the TTL in seconds when scanning a TCP port ( Default 2 )
*Requires the -p flagged to be passed</pre>
<p>After you read the output, you can see that it is able to look whois information from Ip address or hostname. Also it can gather information from Netcraft.com and look for possible subdomains. Dmitry can search for possible email addresses. TCP scan option is considered as active information gathering.</p>
<p>You can see Dmitry's example of usage below.</p>
<pre class="lang:default decode:true " title="Usage Example">root@kali:~# dmitry -winsepo example.txt example.com
Deepmagic Information Gathering Tool
"There be some deep magic going on"

Writing output to 'example.txt'

HostIP:93.184.216.119
HostName:example.com

Gathered Inet-whois information for 93.184.216.119
---------------------------------</pre>
<p>Please feel free to add your comments and opinions to the disqus section.</p>
<p>Sources:</p>
<p><a href="http://mor-pah.net/software/" target="_blank">http://mor-pah.net/software/</a></p>
<p><a href="http://tools.kali.org/information-gathering/" target="_blank">http://tools.kali.org/information-gathering/</a></p>
