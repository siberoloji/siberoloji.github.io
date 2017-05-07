---
layout: post
title: Speech Dispatcher Servisini Kaldırma
date: 2017-05-02 18:43:56.000000000 +03:00
type: post
img: cyber1.jpg
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- speech-dispacther
- screen_reader 
- orca_screen_readeropenvpn
---

Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissettiğiniz gereksiz servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz.

speech-dispatcher olarak geçen ekran okuyucu, görme problemi olanlar için geliştirlmiş bir ekran okuma yardımcısıdır. Sisteminizden kaldırmak için aşağıdaki komutları kullanabilirsiniz. Verilen başlıklardan istediğiniz birini seçip uygulamak yeterlidir.

## Sadece speech-dispatcher kaldırma
```sh
sudo apt-get remove speech-dispatcher
```
## speech-dispatcher ve bağımlılıkları kaldırma
```sh
sudo apt-get remove --auto-remove speech-dispatcher
```

## speech dispacher ve ayarlarını kaldırma

```sh
sudo apt-get purge speech-dispatcher
```

## speech-dispacther, ayarlarını ve bağımlılıklarını kaldırma

```sh
sudo apt-get purge --auto-remove speech-dispatcher
```