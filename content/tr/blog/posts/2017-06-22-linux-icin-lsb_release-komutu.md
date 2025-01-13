---
draft: false

title:  'Linux İçin lsb_release Komutu'
date: '2017-06-22T14:07:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz\_lsb_release\_komutunu açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri elde edebilirsiniz." 
 
url:  /tr/linux-icin-lsb_release-komutu/
 
featured_image: /images/cyber7.jpg
categories:
    - 'Temel Linux'
tags:
    - linux
    - 'linux nasıl'
    - lsb_release
---
Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz `lsb_release` komutunu açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri elde edebilirsiniz.

## lsb_relase

`lsb_relase` komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Bu komut, `lsb-core` olarak adlandırılan paketin bir parçasıdır. `lsb_release` komutunu verdiğinizde herhangi bir çıktı alamıyorsanız `sudo apt install lsb-core` komutuyla gerekli paketleri yükleyebilirsiniz.

Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim.
```bash
lsb_release --help
Options:
  -h, --help         show this help message and exit
  -v, --version      show LSB modules this system supports
  -i, --id           show distributor ID
  -d, --description  show description of this distribution
  -r, --release      show release number of this distribution
  -c, --codename     show code name of this distribution
  -a, --all          show all of the above information
  -s, --short        show requested information **in **short format
```

`lsb_release` komutunu, hiçbir seçenek olmadan verirseniz, `-v` seçeneği varsayılan olarak kullanılır.

## 

Kullandığınız dağıtımın desteklediği, sisteminizde yüklü olan ilave LSB modüllerini listeler. `No LSB modules are available.` sonucu alıyorsanız, `sudo apt install lsb-core` komutunu vererek kurabileceğiniz LSB modüllerini görebilirsiniz. İhtiyacınız yoksa kurmanıza gerek yoktur.
```bash
lsb_release -v
No LSB modules are available.
```

## 

Linux dağıtımını sağlayan otoritenin ID kimlik bilgisini görüntüler.
```bash
lsb_release -i
Distributor ID:	LinuxMint
```

## 

Kullandığınız dağıtımın açıklamasını görüntüler.
```bash
lsb_release -d
Description:	Linux Mint 18.1 Serena
```

## 

Kullandığınız dağıtımın sürüm numarasını görüntüler.
```bash
lsb_release -r
Release:	18.1
```

## 

Kullandığınız dağıtımın kod adını görüntüler.
```bash
lsb_release -c
Codename:	serena
```

## 

Yukarıda açıklanan seçeneklerin tamamını bir seferde görüntüler.
```bash
lsb_release -a
No LSB modules are available.
Distributor ID:	LinuxMint
Description:	Linux Mint 18.1 Serena
Release:	18.1
Codename:	serena
```

## 

`-s` seçeneği yardımcı bir seçenektir. Kısa bilgi anlamına gelir. Görüntülenmek istenen bilginin, sol tarafındaki başlık adı olmadan sadece bilginin kendisini görüntülemeye yarar. Bash proglamada kullanımda oldukça faydalı olabilir.
```bash
lsb_release -as
No LSB modules are available.
LinuxMint
Linux Mint 18.1 Serena
18.1
serena
```
