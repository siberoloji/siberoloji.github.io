---
draft: false

title:  'Fish &#8211; Komut Satırına Farklı Bir Yaklaşım'
date: '2016-04-26T17:28:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux denildiğinde herhalde ilk akla gelen konulardan bir tanesi de komut satırı ve terminaldir. Komut satırında yazdığınız ifadeleri işleyen kabuk (shell) ise farklı sürümleriyle kullanıcılara sunulur. Bash, Dash, Zsh, Csh bunlara örnek olarak verilebilir. Bu yazımızda size Fish kabuk programının kurulumunu açıklayacağız.' 
 
url:  /tr/fish-komut-satirina-farkli-bir-yaklasim/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - linux
    - 'linux fish'
---


Linux denildiğinde herhalde ilk akla gelen konulardan bir tanesi de komut satırı ve terminaldir. Komut satırında yazdığınız ifadeleri işleyen kabuk (shell) ise farklı sürümleriyle kullanıcılara sunulur. Bash, Dash, Zsh, Csh bunlara örnek olarak verilebilir. Bu yazımızda size Fish kabuk programının kurulumunu açıklayacağız.



Fish, kullanıcı dostu olarak bilinen bir kabuk programıdır. Komut tamamlama, komut içerisinde farklı formları farklı renklendirme özelliklerine sahiptir. Komut yazımı esnasında çeşitli tavsiyeler sunar ve bunları, o an bulunduğunuz klasörü de dikkate alarak yapar. Önerileri yön tuşlarıyla kolayca seçebilirsiniz. Yardım komutlarını otomatik olarak web tarayıcıda açması da kullanım kolaylığı açısında vurgulanması gereken özelliklerinden birisidir.



## Debian için Fish Kurulum:


```bash
---------------- Debian 8 ----------------
echo 'deb <a href="http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/">http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/</a> /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish

---------------- Debian 7 ----------------
echo 'deb <a href="http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/">http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/</a> /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```



## Ubuntu için Fish Kurulum:


```bash
---------------- Ubuntu ----------------
sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get install python-software-properties
sudo apt-get update
sudo apt-get install fish
```



## Fedora için Fish Kurulum:


```bash
---------------- Fedora 22 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_22/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_22/shells:fish:release:2.repo</a>
yum install fish

---------------- Fedora 21 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_21/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_21/shells:fish:release:2.repo</a>
yum install fish

---------------- Fedora 20 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_20/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_20/shells:fish:release:2.repo</a>
yum install fish
```



## CentOS için Fish Kurulum:


```bash
---------------- CentOS 7 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo</a>
yum install fish

---------------- CentOS 6 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo</a>
yum install fish
```



## RHEL için Fish Kurulum:


```bash
---------------- RHEL 7 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo</a>
yum install fish

---------------- RHEL 6 ----------------
cd /etc/yum.repos.d/
wget <a href="http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo">http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo</a>
yum install fish
```



**Başlatmak için**


```bash
fish
```



Denemenizi tavsiye ediyorum. Fish, Komut satırına farklı bir yaklaşım getiriyor. Ayrıntılı kullanım dokümanlarını programın <a href="http://fishshell.com/" target="_blank" rel="noreferrer noopener">adresinde</a> bulabilirsiniz.
