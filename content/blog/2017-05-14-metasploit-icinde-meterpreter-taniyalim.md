---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-05-14T12:44:00Z"
excerpt: Bu yazımızda, Metasploit Framework tarafından kullanıcıya sağlanan komut
  satırı ortamı olarak bilinen Meterpreter’in kısaca tanımaya çalışacağız. İlerleyen
  yazılarda Meterpreter içerisinde kullanılan komutlar ve örneklerini bol bol göreceğiz.
  Burada kısaca giriş yapıyoruz.
guid: https://www.siberoloji.com/?p=1147
id: 1147
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: Metasploit İçinde Meterpreter Tanıyalım
url: /tr/metasploit-icinde-meterpreter-taniyalim/
---

  Bu yazımızda, Metasploit Framework tarafından kullanıcıya sağlanan komut satırı ortamı olarak bilinen Meterpreter’in kısaca tanımaya çalışacağız. İlerleyen yazılarda Meterpreter içerisinde kullanılan komutlar ve örneklerini bol bol göreceğiz. Burada kısaca giriş yapıyoruz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-nedir">Meterpreter Nedir? 
<!-- /wp:heading -->

  Meterpreter, ileri düzey bir Metasploit payload tipidir. Dinamik olarak hedef bilgisayarda DLL Enjeksiyon mantığı ile çalışır. Ağda, sahneleyici payloadları ve soketleri kullanarak yerel bilgisayarla haberleşir. Komut geçmişi, komut tamamlama vb. kabiliyetleri bulunur. Kısaca, Karşı taraf bilgisayarda çalışan çok etkili bir komut satırıdır diyebiliriz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-nasıl-çalışır">Meterpreter Nasıl Çalışır? 
<!-- /wp:heading -->

  Metasploit içinde kullanılan sahneleyici (stager) modül çalışır. Bu modül genellikle bind, reverse, findtag, passivex modüllerinden bir tanesidir. Sahneleyici modül, DLL enjeksiyonunu kullanarak sistemde çalışır ve Metasploit Framework’e TLS/1.0 üzerinden haberleşmeyi sağlar. Haberleşme sağlanınca GET isteği gönderilir ve bu isteği alan Metasploit gerekli ayarlamaları yapar. Karşı tarafta çalışan bilgisayarın yetkilerine göre gerekli modüller yüklenir ve açılan komut satırı kullanıcıya devredilir. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-tasarım-hedefleri">Meterpreter Tasarım Hedefleri 
<!-- /wp:heading -->

 
<h2 class="wp-block-heading" id="gizlilik">Gizlilik</h2>
<!-- /wp:heading -->

  Meterpreter tamamen RAM üzerinde çalışır ve Hard Diske herhangi bir yazma işlemi yapmaz. Meterpreter çalıştığında karşı sistemde yeni bir proses oluşturulmaz. Meterpreter, Metasploit ile iletişimini kriptolu olarak yapar. Tüm bu imkanlar, karşı tarafta olabildiğince az iz bırakır. 
 

 
<h2 class="wp-block-heading" id="güçlü">Güçlü</h2>
<!-- /wp:heading -->

  Meterpreter, kanallara bölünmüş bir haberleşme kullanır. Meterpreter’in kullandığı TLV Protokolünün bir kaç kısıtı bulunmaktadır. 
 

 
<h2 class="wp-block-heading" id="genişletilebilir">Genişletilebilir</h2>
<!-- /wp:heading -->

  Meterpreter çalıştığı anda bile yeni modüllerle genişletilebilir. Yeni kodlar ve özellikler eklendiğinde tekrar derlenmesine gerek yoktur. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="çalışma-anında-yeni-özellik-ekleme">Çalışma Anında Yeni Özellik Ekleme 
<!-- /wp:heading -->

  Yeni özellikler, uzantılar (extensions) yüklenerek eklenir. İstemci, DLL dosyalarını soket üzerinden yükler. Karşı taraf üzerinde çalışan Meterpreter sunucu, DLL dosyasını hafızaya yükler. Yeni özellik, karşı tarafta çalışan sunucu tarafından otomatik olarak tanınır. Yerel bilgisayardaki istemci, metasploit tarafından sağlanan API arayüzünü yükler ve hemen kullanmaya başlayabilir. Tüm işlemler yaklaşık 1 sn. içinde gerçekleşir. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="sonuç">Sonuç 
<!-- /wp:heading -->

  Bu yazıda anlatılanlar, programcı olanlara çok anlamlı gelse de ortalama kullanıcılara pek bir anlam ifade etmemiş olabilir. Zararı yoktur. Meterpreter’in kullanıcıya, çok etkili bir komut satırı ile işlem yapmaya yaradığını bilmek yeterlidir. 
 