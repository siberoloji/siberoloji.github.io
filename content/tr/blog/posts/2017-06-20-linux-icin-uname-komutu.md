---
draft: false

title:  'Linux İçin uname Komutu'
date: '2017-06-20T14:05:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız. Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini elde edebilirsiniz.' 
 
url:  /tr/linux-icin-uname-komutu/
 
featured_image: /images/cyber5.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
    - uname
---


Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız. Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini elde edebilirsiniz.



## uname



`uname` komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim.


```bash
uname --help

Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s.

  -a, --all                print all information, **in the following order,
                             except omit -p and -i **if **unknown:
  -s, --kernel-name        print the kernel name
  -n, --nodename           print the network node hostname
  -r, --kernel-release     print the kernel release
  -v, --kernel-version     print the kernel version
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type (non-portable)
  -i, --hardware-platform  print the hardware platform (non-portable)
  -o, --operating-system   print the operating system
      --help     display this help and exit
      --version  output version information and exit
```



`uname` komutunu, hiçbir seçenek olmadan verirseniz, `-s` seçeneği varsayılan olarak kullanılır.



## 



Yazdırılabilecek tüm bilgi ekrana yazdırılır.


```bash
uname -a
Linux umut-X550JX 4.8.0-42-generic #45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```



## 



Kullanımda bulunan kernel adını ekrana yazdırır.


```bash
uname -s
Linux
```



## 



Bilgisayarınızın, ağ içinde kullanılan host adını gösterir.


```bash
uname -n
umut-X550JX
```



## 



Kullandımda olan Kernel ana dağıtım bilgisini gösterir.


```bash
uname -r
4.8.0-42-generic
```



## 



Kullanımda olan Kernel sürümünün dağıtıma özel sürüm bilgisini, yayınlandığı tarihle birlikte gösterir.


```bash
uname -v
#45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017
```



## 



Kullandığınız bilgisayarın donanım adını gösterir.


```bash
uname -m
x86_64
```



## 



Kullanılan işlemcinin Mimari bilgisini gösterir.


```bash
uname -p
x86_64
```



## 



Kullanılan bilgisayarın donanım platform bilgisini gösterir.


```bash
uname -i
x86_64
```



## 



İşletim sisteminin ne olduğunu gösterir.


```bash
uname -o
GNU/Linux
```



## Faydalı Kullanım



Bu komutun çıktılarını, değişken olarak atayarak, yazacağınız komut veya Bash script dosyalarında kullanabilirsiniz.


```bash
sudo apt-get install linux-headers-$(uname -r)
[sudo] password for **umut: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
linux-headers-4.8.0-42-generic is already the newest version (4.8.0-42.45~16.04.1).
```



Gördüğünüz gibi `uname -r` komutu hangi değeri alıyorsa, o kernel sürümüne ait headers dosyalarını sisteme yükleme komutunu vermiş olduk. Bu şekilde değişken atamalı kullanım, yazacağınız komutların farklı bilgisayarlarda kullanımını kolaylaştırır.
