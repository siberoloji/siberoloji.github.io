---
draft: false

title:  'Speech Dispatcher Servisini Kaldırma'
date: '2017-05-02T02:05:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissetmediğiniz gereksiz servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz.' 
 
url:  /tr/speech-dispatcher-servisini-kaldirma/
 
featured_image: /images/cyber1.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---


Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissetmediğiniz gereksiz servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz.



speech-dispatcher olarak geçen ekran okuyucu, görme problemi olanlar için geliştirlmiş bir ekran okuma yardımcısıdır. Sisteminizden kaldırmak için aşağıdaki komutları kullanabilirsiniz. Verilen başlıklardan istediğiniz birini seçip uygulamak yeterlidir.



## Sadece speech-dispatcher kaldırma


```bash
sudo apt-get remove speech-dispatcher

```


## speech-dispatcher ve bağımlılıkları kaldırma


```bash
sudo apt-get remove --auto-remove speech-dispatcher

```


## speech dispacher ve ayarlarını kaldırma


```bash
sudo apt-get purge speech-dispatcher

```


## speech-dispacther, ayarlarını ve bağımlılıklarını kaldırma


```bash
sudo apt-get purge --auto-remove speech-dispatcher
```