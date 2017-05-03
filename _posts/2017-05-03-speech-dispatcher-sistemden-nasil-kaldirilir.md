---
title: Speech-dispatcher sistemden nasıl kaldırılır?
date: 2017-04-18 22:49
categories: "k2"
tags: ["linux komutları", "strings", "komut satırı"]
permalink: "linux-strings-komutu-kulanimi"
summary: "Bu yazıda, komut satırında ikili (binary) dosyalarda arama yapmada kolaylık sağlayan 'strings' komutu ele alınmıştır."
image: "linux-strings-komutu-kulanimi.jpg"
thumb: "linux-strings-komutu-kulanimi.jpg"
author: "siberoloji"
---

Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissettiğiniz gereksiz servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz.

speech-dispatcher olarak geçen ekran okuyucu, görme problemi olanlar için geliştirlmiş bir ekran okuma yardımcısıdır. Sisteminizden kaldırmak için aşağıdaki komutları kullanabilirsiniz. Verilen başlıklardan istediğiniz birini seçip uygulamak yeterlidir.

* Sadece speech-dispatcher kaldırma

`sudo apt-get remove speech-dispatcher`

* speech-dispatcher ve bağımlılıkları kaldırma

`sudo apt-get remove --auto-remove speech-dispatcher`

* speech dispacher ve ayarlarını kaldırma

`sudo apt-get purge speech-dispatcher`

* speech-dispacther, ayarlarını ve bağımlılıklarını kaldırma

`sudo apt-get purge --auto-remove speech-dispatcher`

