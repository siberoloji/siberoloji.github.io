---
layout: post
title: Sistemde Yer Kaplayan Büyük Dosyaları Bulma
date: 2016-12-23 20:26:58.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- find komutu
- linux dosya boyutları
- linux en büyük dosyaları bulma
author: siberoloji
---
<p>Bilgisayarınıza indirdiğiniz dosyaların bir kısmını, sonradan işime yarar diyerek tutuyor olabilirsiniz. Bir süre sonra diskinizin kapasitesi azalmaya başlar. Siz de bu dosyaları silmek için, yüzlerce dosya arasında araştırma yapmaya başlarsınız. Bu yazıda find komutunu kullanarak, bilgisayarınızda bulunan büyük dosyaları bulmanın yolunu açıklamak istiyorum.</p>
<p>Aşağıdaki örnekte, find komutunu kullanarak elde ettiğimiz sonucu, Linux filtreleme komutları yardımıyla listeliyoruz ve en büyük 5 dosyayı ekrana yazdırıyoruz.</p>
<pre class="lang:sh decode:true">find . -xdev -ls | sort -n -k 7 | tail -5

 20324812 1860964 -rw-r--r-- 1 umut umut 1905615064 Nov 2  00:40 ./Downloads/ubuntu1604_amd64.deb
 20325627 2876456 -rw-r--r-- 1 umut umut 2945482752 Jul 27 11:37 ./Downloads/linux-2016.1-amd64.iso
 4325458 3004804  -rw-r--r-- 1 umut umut 3076767744 Oct 20 06:51 ./Downloads/ad64.iso
 20324879 3948552 -rw-r--r-- 1 umut umut 4043309056 Oct 30 2015  ./Downloads/rhel-x86_64-dvd.iso
 21237459 4228176 -rw-r--r-- 1 umut umut 4329570304 Sep 19 07:18 ./Downloads/CentOS-7-64-DVD.iso

</pre>
<h2>Açıklama:</h2>
<p><span class="lang:sh decode:true crayon-inline ">find .</span>  : Yukarıda vermiş olduğumuz komut, bulunduğumuz klasörü ve alt klasörlerindeki tüm dosyaları arar. Komutu verdiğiniz yer önemlidir. Bu örnekte, komut home klasöründe ve sudo yetkisi olmadan verilmiştir. Baş tarafına sudo yetkisi eklediğinizde sonuçlar değişebilir.</p>
<p><span class="lang:sh decode:true crayon-inline ">-xdev</span>  : find komutua ait bu parametre, sadece üzerinde çalıştığımız diskte işlem yapılmasını sağlar. Sisteminize bağlı diğer disk bölümlerinin aranmasını engeller.</p>
<p><span class="lang:sh decode:true crayon-inline ">-ls</span>  : Sonuçların listelenmesini sağlar.</p>
<p><span class="lang:sh decode:true crayon-inline ">sort</span>  : Elde ettiğimiz sonuçlara sıralama işlemi yapmamızı sağlar.</p>
<p><span class="lang:sh decode:true crayon-inline ">-n</span>  : Sıralamanın sayılar değerlerle yapılacağını belirtir.</p>
<p><span class="lang:sh decode:true crayon-inline ">-k 7</span>  : Sıralamanın, bir kriter girilerek yapılmasını sağlar. Bizim örneğimizde 7. sütun olan boyut (size) sütunu kullanılmıştır.</p>
<p><span class="lang:sh decode:true crayon-inline">tail -5</span>  : Sort komutu ile küçükten büyüğe yapılan sıralamanın sonucunda, en büyük dosyalar listenin en sonunda yer alacaktır. <span class="lang:sh decode:true crayon-inline ">tail -5</span>  komutu ile en son 5 satırın ekranda görüntülenmesi sağlanır. İsterseniz, <span class="lang:sh decode:true crayon-inline ">tail -10</span>  şeklinde değiştirerek en büyük 10 dosyayı da bulabilirsiniz.</p>
<p>Size sadece, bulunan dosyaların hangilerinin yedekleme diskine aktarılacağını, hangilerinin sileceğine karar vermek kalıyor. Sizin de kullandığınız faydalı komutlar varsa, bize bildirebilirsiniz. Burada açıklamaları ile birlikte yayınlayabiliriz.</p>
<p>Okuma Tavsiyesi: <a href="http://www.portlinux.com/linux/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/" target="_blank">Linux Metin Filtreleri</a></p>
