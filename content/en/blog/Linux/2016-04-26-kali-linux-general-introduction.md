---
draft: false

title:  'Kali Linux General Introduction'
date: '2016-04-26T01:30:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /kali-linux-general-introduction/
 
featured_image: /images/cyber4.jpg
categories:
    - 'Linux Fundamentals'
tags:
    - linux
    - 'linux fundamentals'
    - os
---
As activities in the field of information systems security, testing and examination become more widespread, the number of Operating Systems developed according to emerging needs also increases. Some Linux distributions are available on CD/DVD etc. Kali Linux and some other parts are distributed as both executable and installable.

Ready-made programs installed in these distributions can be classified according to their purposes and targets. There are also commercial software among the programs, many of which are open source. Commercial software makes some of its features available for free use in its community versions. User, Pro etc. If he wants to use the version, he can purchase a license by paying the fee.

<a href="http://distrowatch.com/" target="_blank" rel="noreferrer noopener"></a> When we examine the Forensics category and statistics on the Distrowatch.com site, you can find the names of the distributions in order of popularity below.

1. Kali Linux (11) 2. BackBox Linux (56) 3. BlackArch Linux (77) 4. CAINE (121) 5. DEFT Linux (184) 6. Parrot Security OS (228) 7. NetSecL OS (242) 8 Matriux (0)

In this study, we will examine the Kali Linux distribution.

## Kali Linux

The distribution, known as Backtrack when it was first released, was created based on the Ubuntu Operating System. Backtrack was actually created by the merger of distributions called WHAX and Auditor Security Collection. As of March 2013, it is based on Debian and started to be distributed under the name Kali Linux .

It is based on the Debian testing version and updates it according to this version. It supports Armel, armhf, i386 and x86_64 architectures. When the distribution, which uses GNOME as the desktop environment, is installed, there are about 600 programs ready for use.

## Some pre-installed programs

Armitage

nmap

Wireshark

John the Ripper

Aircrack-ng

Burp Suite

OWASP ZAP

Metasploit Framework

## Kali Linux General Features

It is possible to access the source codes of the programs used from git repositories.  You can examine the source codes by visiting <a href="http://git.kali.org/gitweb/" target="_blank" rel="noreferrer noopener">http://git.kali.org/gitweb/</a>  and even reorganize them to suit your own needs.

File System Hierarchy follows FHS standards. The file system (FHS Standard) that users know from other distributions is used.

Software developed for the operating system is digitally signed by its programmers.

Kali Linux was developed specifically for the use of system security experts. For this reason, it is possible to encounter some obstacles for normal daily use.

## Kali Linux, how is it different from other distributions?

The user uses the root account.

Network services are disabled.

Modified Linux Kernel is used.

Minimum and stable packages are preferred.
