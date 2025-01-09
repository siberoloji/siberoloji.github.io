---
draft: false

title:  'Metasploit İçinde Meterpreter Tanıyalım'
date: '2017-05-14T12:44:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, Metasploit Framework tarafından kullanıcıya sağlanan komut satırı ortamı olarak bilinen Meterpreter’in kısaca tanımaya çalışacağız. İlerleyen yazılarda Meterpreter içerisinde kullanılan komutlar ve örneklerini bol bol göreceğiz. Burada kısaca giriş yapıyoruz.' 
 
url:  /tr/metasploit-icinde-meterpreter-taniyalim/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Bu yazımızda, Metasploit Framework tarafından kullanıcıya sağlanan komut satırı ortamı olarak bilinen Meterpreter’in kısaca tanımaya çalışacağız. İlerleyen yazılarda Meterpreter içerisinde kullanılan komutlar ve örneklerini bol bol göreceğiz. Burada kısaca giriş yapıyoruz.



## Meterpreter Nedir?



Meterpreter, ileri düzey bir Metasploit payload tipidir. Dinamik olarak hedef bilgisayarda DLL Enjeksiyon mantığı ile çalışır. Ağda, sahneleyici payloadları ve soketleri kullanarak yerel bilgisayarla haberleşir. Komut geçmişi, komut tamamlama vb. kabiliyetleri bulunur. Kısaca, Karşı taraf bilgisayarda çalışan çok etkili bir komut satırıdır diyebiliriz.



## Meterpreter Nasıl Çalışır?



Metasploit içinde kullanılan sahneleyici (stager) modül çalışır. Bu modül genellikle bind, reverse, findtag, passivex modüllerinden bir tanesidir. Sahneleyici modül, DLL enjeksiyonunu kullanarak sistemde çalışır ve Metasploit Framework’e TLS/1.0 üzerinden haberleşmeyi sağlar. Haberleşme sağlanınca GET isteği gönderilir ve bu isteği alan Metasploit gerekli ayarlamaları yapar. Karşı tarafta çalışan bilgisayarın yetkilerine göre gerekli modüller yüklenir ve açılan komut satırı kullanıcıya devredilir.



## Meterpreter Tasarım Hedefleri



## Gizlilik



Meterpreter tamamen RAM üzerinde çalışır ve Hard Diske herhangi bir yazma işlemi yapmaz. Meterpreter çalıştığında karşı sistemde yeni bir proses oluşturulmaz. Meterpreter, Metasploit ile iletişimini kriptolu olarak yapar. Tüm bu imkanlar, karşı tarafta olabildiğince az iz bırakır.



## Güçlü



Meterpreter, kanallara bölünmüş bir haberleşme kullanır. Meterpreter’in kullandığı TLV Protokolünün bir kaç kısıtı bulunmaktadır.



## Genişletilebilir



Meterpreter çalıştığı anda bile yeni modüllerle genişletilebilir. Yeni kodlar ve özellikler eklendiğinde tekrar derlenmesine gerek yoktur.



## Çalışma Anında Yeni Özellik Ekleme



Yeni özellikler, uzantılar (extensions) yüklenerek eklenir. İstemci, DLL dosyalarını soket üzerinden yükler. Karşı taraf üzerinde çalışan Meterpreter sunucu, DLL dosyasını hafızaya yükler. Yeni özellik, karşı tarafta çalışan sunucu tarafından otomatik olarak tanınır. Yerel bilgisayardaki istemci, metasploit tarafından sağlanan API arayüzünü yükler ve hemen kullanmaya başlayabilir. Tüm işlemler yaklaşık 1 sn. içinde gerçekleşir.



## Sonuç



Bu yazıda anlatılanlar, programcı olanlara çok anlamlı gelse de ortalama kullanıcılara pek bir anlam ifade etmemiş olabilir. Zararı yoktur. Meterpreter’in kullanıcıya, çok etkili bir komut satırı ile işlem yapmaya yaradığını bilmek yeterlidir.
