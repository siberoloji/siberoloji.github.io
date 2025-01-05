---
draft: false

title:  'How to Locate and Edit Hosts File on a Mac Using Terminal'
date: '2023-06-14T20:53:03+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'The hosts file in an operating system is used to convert domain names to IP addresses. Users can enter their hosts files and go to the IP addresses they define themselves, instead of replies from the DNS server.' 
 
url:  /how-to-locate-and-edit-hosts-file-on-a-mac-using-terminal/
featured_image: /images/terminal-hosts-file-1.png
categories:
    - MAC/iOS
tags:
    - 'hosts file'
    - macos
---


The hosts file in an operating system is used to convert domain names to IP addresses. Users can enter their hosts files and go to the IP addresses they define themselves, instead of replies from the DNS server.



Mac users can find this file in the /private/etc/hosts folder. If you are a user with root privileges, you can edit this file in any text editor.



## How to make changes to the hosts file?


* 
* Let's open the hosts file




Let's open Spotlight with the help of **Command + Spacebar** keys. Let's open the terminal application by typing "Terminal" in the search box.


* 
* Let's open the hosts file with the nano editor from the command line.




When you enter the command, it will ask for your password.


```bash
sudo nano /private/etc/hosts
```



Below is the opened file view.


<!-- wp:image {"id":406,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2023/06/terminal-hosts-file-1.png" alt="" class="wp-image-406" /></figure>
<!-- /wp:image -->


You can save it by making any additions you want to the bottom of this file. For example, let's say your server at home has a fixed IP address of 192.168.1.20 and you want it to go to this IP address when you type myserver.com instead of constantly typing this address into your web browser.


* 
* In this case, you should add the following line to the hosts file.




192.168.1.20 myserver.com



You can save it with Ctrl+O and exit the nano editor with Ctrl+X.


* 
* Flush DNS Cache




In order for your changes to take effect, you must clear the DNS temporary records kept on your computer. The following commands will suffice for this.



macOS Monterey, Big Sur


```bash
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder```



macOS Catalina, Mojave, High Sierra, Sierra, Mountain Lion, Lion


```bash
sudo killall -HUP mDNSResponder```



## Conclusion



In this article, we have made our own IP address definition instead of the results from the DNS server by editing the hosts file. In this way, we explained that even if we do not have a public IP address, we can use our own home server in our system by entering the hostname instead of the IP address.
