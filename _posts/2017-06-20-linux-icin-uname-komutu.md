---
title: Linux İçin Uname Komutu
layout: post
date: 2017-06-20 09:00:06.000000000 +02:00
type: post
author: siberoloji
img: cyber5.jpg
featured: true
published: true
status: publish
categories:
- Nasıl
- Linux
tags:
- uname
- uname komutu
- uname komut örnekleri

excerpt: Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız. Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini elde edebilirsiniz.
---

Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız. Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini elde edebilirsiniz.

# uname

```uname``` komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim.

```sh
uname --help

Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s.

  -a, --all                print all information, in the following order,
                             except omit -p and -i if unknown:
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

```uname``` komutunu, hiçbir seçenek olmadan verirseniz, ```-s``` seçeneği varsayılan olarak kullanılır.

## ```uname -a```

Yazdırılabilecek tüm bilgi ekrana yazdırılır.

```sh
uname -a
Linux umut-X550JX 4.8.0-42-generic #45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```

## ```uname -s```

Kullanımda bulunan kernel adını ekrana yazdırır.

```sh
uname -s
Linux
```

## ```uname -n```

Bilgisayarınızın, ağ içinde kullanılan host adını gösterir.

```sh
uname -n
umut-X550JX
```

## ```uname -r```

Kullandımda olan Kernel ana dağıtım bilgisini gösterir.

```sh
uname -r
4.8.0-42-generic
```

## ```uname -v```

Kullanımda olan Kernel sürümünün dağıtıma özel sürüm bilgisini, yayınlandığı tarihle birlikte gösterir.

```sh
uname -v
#45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017
```

## ```uname -m```

Kullandığınız bilgisayarın donanım adını gösterir.

```sh
uname -m
x86_64
```

## ```uname -p```

Kullanılan işlemcinin Mimari bilgisini gösterir.

```sh
uname -p
x86_64
```

## ```uname -i```

Kullanılan bilgisayarın donanım platform bilgisini gösterir.

```sh
uname -i
x86_64
```

## ```uname -o```

İşletim sisteminin ne olduğunu gösterir.

```sh
uname -o
GNU/Linux
```

## Faydalı Kullanım

Bu komutun çıktılarını, değişken olarak atayarak, yazacağınız komut veya Bash script dosyalarında kullanabilirsiniz.

```sh
sudo apt-get install linux-headers-$(uname -r)
[sudo] password for umut: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
linux-headers-4.8.0-42-generic is already the newest version (4.8.0-42.45~16.04.1).
```

Gördüğünüz gibi ```uname -r``` komutu hangi değeri alıyorsa, o kernel sürümüne ait headers dosyalarını sisteme yükleme komutunu vermiş olduk. Bu şekilde değişken atamalı kullanım, yazacağınız komutların farklı bilgisayarlarda kullanımını kolaylaştırır.
