---
draft: false

title:  'Learning our IP Address from the terminal'
date: '2016-04-25T01:26:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /learning-our-ip-address-from-the-terminal/
 
featured_image: /images/linux2.png
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - 'linux how-to'
---
Sometimes, when working in the terminal (bash, SSH etc.) you may need to learn the public IP address assigned to your modem by your ISP. You may need this IP address to use it in a program or to make adjustments. In our article, we will see how we can learn our IP address from the command line. Attention: We are not talking about your IP address on your internal network between your modem and your computer. You can learn it with the ifconfig command.

There are many methods to find out the IP address from the command line, let's see them one by one.
```bash
dig +short myip.opendns.com @resolver1.opendns.com
```
```bash
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
```
```bash
host myip.opendns.com resolver1.opendns.com
```
```bash
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'```

In this method, your IP address is recorded in a shell variable. You can use it later whenever you need it.
```bash
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "Açık IP adresim: ${myip}"```

You can also learn with the help of 3rd party sites. Any of the commands below will be useful.
```bash
curl icanhazip.com
curl ipecho.net/plain
curl ifconfig.co```
