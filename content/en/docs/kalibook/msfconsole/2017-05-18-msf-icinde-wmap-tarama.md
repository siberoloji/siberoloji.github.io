---
draft: false
title: WMAP Scanning in MSF
linkTitle: WMAP Scanning
weight: 190
translationKey: wmap-scanning-in-msf
date: 2017-05-18T13:06:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: WMAP tool is a web application vulnerability scanner that provides users with extensive capabilities. Originally derived from the sqlmap program.
url: /wmap-scanning-in-msf/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
WMAP is a web application vulnerability scanning tool that provides users with a wide range of capabilities. It was originally derived from the **sqlmap** program. In this article, we will see the use of WMAP integrated into Metasploit.

## Installing wmap

First, let's create a new database with the `workspace -a wmap` command. Then let's load the plugin with the `load wmap` command.

```bash
msf > workspace -a wmap
> Added workspace: wmap
msf > workspace
default
metas3
***** wmap
msf > load wmap

.-.-.-.-.-.-..---..---.
| | | **||** | | **||** | **||** |-'
`-----'`-'-'-'`-^-'`-'
[WMAP 1.5.1] === et [ ] <a href="http://metasploit.com/">metasploit.com</a> 2012
[*] Successfully loaded plugin: wmap
```

Let's display the commands provided by the wmap plugin with the `help` command.

```bash
msf > help

wmap Commands
=============

Command Description
------- -----------
wmap_modules Manage wmap modules
wmap_nodes Manage nodes
wmap_run Test targets
wmap_sites Manage sites
wmap_targets Manage targets
wmap_vulns Display web vulns

...snip...
```

## Setting wmap_sites

Before starting web application scanning, we need to add the target URL address to the `wmap_sites` table with the `-a` parameter. Then, if you issue the `wmap_sites -l` command, you can see the registered URL addresses.

```bash
msf > wmap_sites -h
> Usage: wmap_targets [options]
 -h Display this help text
 -a [url] Add site (vhost,url)
 -l List all available sites
 -s [id] Display site structure (vhost,url|ids) (level)


msf > wmap_sites -a <a href="http://172.16.194.172/">http://172.16.194.172</a>
> Site created.
msf > wmap_sites -l
> Available sites
**===============**

Id Host Vhost Port Proto # Pages # Forms
-- ---- ----- ---- ----- ------- -------
0 172.16.194.172 172.16.194.172 80 http 0 0
```

## Setting wmap_targets

`wmap_sites` tables are a table that keeps records. It lists addresses that you can use in the future. We need to set the address where the scan will be performed to the `wmap_targets` table with the `-t` parameter.

```bash
msf > wmap_targets -h
> Usage: wmap_targets [options]
 -h Display this help text
 -t [urls] Define target sites (vhost1,url[space]vhost2,url)
 -d [ids] Define target sites (id1, id2, id3 ...)
 -c Clean target sites list
 -l List all target sites


msf > wmap_targets -t <a href="http://172.16.194.172/mutillidae/index.php">http://172.16.194.172/mutillidae/index.php</a>
```

In modules, just as we control the variable settings we make with `show options`, we can control the list of targets to be scanned with the `wmap_targets -l` command.

```bash
msf > wmap_targets -l
> Defined targets
**===============**

Id Vhost Host Port SSL Path
-- ----- ---- ---- --- ----
0 172.16.194.172 172.16.194.172 80 false /mutillidae/index.php
```

## Running wmap_run

The `wmap_run -e` command will run the plugin and start the scan. You can use the `-h` parameter for help. The `-t` parameter can be used to see which modules the `wmap_run -e` command will use.

```bash
msf > wmap_run -h
> Usage: wmap_run [options]
 -h Display this help text
 -t Show all enabled modules
 -m [regex] Launch only modules that name match provided regex.
 -p [regex] Only test path defined by regex.
 -e [/path/to/profile] Launch profile modules against all matched targets.
 (No profile file runs all enabled modules.)

msf > wmap_run -t

>Testing target:
> Site: 192.168.1.100 (192.168.1.100)
> Port: 80 SSL: false
> ===================================================================================
> Testing started. 2012-01-16 15:46:42 -0500
>
[ SSL testing ]
> ===================================================================================
> Target is not SSL. SSL modules disabled.
>
[ Web Server testing ]
> ===================================================================================
> Loaded auxiliary/admin/http/contentkeeper_fileaccess ...
> Loaded auxiliary/admin/http/tomcat_administration ...
> Loaded auxiliary/admin/http/tomcat_utf8_traversal ...
> Loaded auxiliary/admin/http/trendmicro_dlp_traversal ...
..snip...

msf >
```

When you use the `wmap_run -e` command to start the scan, the scan will start.

```bash
msf > wmap_run -e
> Using ALL wmap enabled modules.
[-] NO WMAP NODES DEFINED. Executing local modules
>Testing target:
> Site: 172.16.194.172 (172.16.194.172)
> Port: 80 SSL: false
====================================================================================
> Testing started. 2012-06-27 09:29:13 -0400
>
[ SSL testing ]
====================================================================================
> Target is not SSL. SSL modules disabled.
>
[Web Server testing]
====================================================================================
> Module auxiliary/scanner/http/http_version

> 172.16.194.172:80 Apache/2.2.8 (Ubuntu) DAV/2 ( Powered by PHP/5.2.4-2ubuntu5.10 )
> Module auxiliary/scanner/http/open_proxy
> Module auxiliary/scanner/http/robots_txt


..snip...
..snip...
..snip...


> Module auxiliary/scanner/http/soap_xml
> Path: /
>Server 172.16.194.172:80 returned HTTP 404 for /. Use a different one.
> Module auxiliary/scanner/http/trace_axd
> Path: /
> Module auxiliary/scanner/http/verb_auth_bypass
>
[ Unique Query testing ]
====================================================================================
> Module auxiliary/scanner/http/blind_sql_query
> Module auxiliary/scanner/http/error_sql_injection
> Module auxiliary/scanner/http/http_traversal
> Module auxiliary/scanner/http/rails_mass_assignment
> Module exploit/multi/http/lcms_php_exec
>
[ Query testing ]
====================================================================================
>
[General testing]
====================================================================================
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Launch completed **in **212.01512002944946 seconds.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> Done.
```

## Viewing Results

When the scan is complete, you can issue the `wmap_vulns -l` command to view the vulnerabilities found.

```bash
msf > wmap_vulns -l
> + [172.16.194.172] (172.16.194.172): scraper /
> scraper Scraper
> GET Metasploitable2 - Linux
> + [172.16.194.172] (172.16.194.172): directory /dav/
> directory Directory found.
> GET Res code: 200
> + [172.16.194.172] (172.16.194.172): directory /cgi-bin/
> directory Directoy found.
> GET Res code: 403

...snip...

msf >
```

`vulns` command will show details of vulnerabilities found.

```bash
msf > vulns
> Time: 2012-01-16 20:58:49 UTC Vuln: host=172.16.2.207 port=80 proto=tcp name=auxiliary/scanner/http/options refs=CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561

msf >
```

As seen in the sample output, the reference name of the vulnerability is reported in the `refs=CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561` section. From this point on, we need to collect detailed information and conduct research on this vulnerability.
