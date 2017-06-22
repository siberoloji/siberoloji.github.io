---
title: Linux İçin lsb_release Komutu
layout: post
date: 2017-06-22 09:00:06.000000000 +02:00
type: post
author: siberoloji
img: cyber7.jpg
featured: true
published: true
status: publish
categories:
- Nasıl
- Linux
tags:
- lsb_release
- lsb_release komutu
- lsb_release komut örnekleri

excerpt: Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz lsb_release komutunu açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri elde edebilirsiniz.
---

Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz ```lsb_release``` komutunu açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri elde edebilirsiniz.

# lsb_relase

```lsb_relase``` komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Bu komut, ```lsb-core``` olarak adlandırılan paketin bir parçasıdır. ```lsb_release``` komutunu verdiğinizde herhangi bir çıktı alamıyorsanız ```sudo apt install lsb-core``` komutuyla gerekli paketleri yükleyebilirsiniz. 

Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim.

```sh
lsb_release --help


Options:
  -h, --help         show this help message and exit
  -v, --version      show LSB modules this system supports
  -i, --id           show distributor ID
  -d, --description  show description of this distribution
  -r, --release      show release number of this distribution
  -c, --codename     show code name of this distribution
  -a, --all          show all of the above information
  -s, --short        show requested information in short format
```

```lsb_release``` komutunu, hiçbir seçenek olmadan verirseniz, ```-v``` seçeneği varsayılan olarak kullanılır.

## ```lsb_release -v```

Kullandığınız dağıtımın desteklediği, sisteminizde yüklü olan ilave LSB modüllerini listeler. ```No LSB modules are available.``` sonucu alıyorsanız, ```sudo apt install lsb-core``` komutunu vererek kurabileceğiniz LSB modüllerini görebilirsiniz. İhtiyacınız yoksa kurmanıza gerek yoktur.

```sh
lsb_release -v
No LSB modules are available.
```

## ```lsb_release -i```

Linux dağıtımını sağlayan otoritenin ID kimlik bilgisini görüntüler.

```sh
lsb_release -i
Distributor ID:	LinuxMint
```

## ```lsb_release -d```

Kullandığınız dağıtımın açıklamasını görüntüler.

```sh
lsb_release -d
Description:	Linux Mint 18.1 Serena
```

## ```lsb_release -r```

Kullandığınız dağıtımın sürüm numarasını görüntüler.

```sh
lsb_release -r
Release:	18.1
```

## ```lsb_release -c```

Kullandığınız dağıtımın kod adını görüntüler.

```sh
lsb_release -c
Codename:	serena
```

## ```lsb_release -a```

Yukarıda açıklanan seçeneklerin tamamını bir seferde görüntüler.

```sh
lsb_release -a
No LSB modules are available.
Distributor ID:	LinuxMint
Description:	Linux Mint 18.1 Serena
Release:	18.1
Codename:	serena
```

## ```lsb_release -as```

```-s``` seçeneği yardımcı bir seçenektir. Kısa bilgi anlamına gelir. Görüntülenmek istenen bilginin, sol tarafındaki başlık adı olmadan sadece bilginin kendisini görüntülemeye yarar. Bash proglamada kullanımda oldukça faydalı olabilir. 

```sh
lsb_release -as
No LSB modules are available.
LinuxMint
Linux Mint 18.1 Serena
18.1
serena
```
