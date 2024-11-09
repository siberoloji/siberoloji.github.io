---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Nasıl Yapılır
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-12-23T02:01:00Z"
excerpt: Bilgisayarınıza indirdiğiniz dosyaların bir kısmını, sonradan işime yarar
  diyerek tutuyor olabilirsiniz. Bir süre sonra diskinizin kapasitesi azalmaya başlar.
  Siz de bu dosyaları silmek için, yüzlerce dosya arasında araştırma yapmaya başlarsınız.
  Bu yazıda find komutunu kullanarak, bilgisayarınızda bulunan büyük dosyaları bulmanın yolunu
  açıklamak istiyorum.
guid: https://www.siberoloji.com/?p=1123
id: 1123
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux nasıl
title: Linux Sistemde Yer Kaplayan Büyük Dosyaları Bulma
url: /tr/linux-sistemde-yer-kaplayan-buyuk-dosyalari-bulma/
---

  Bilgisayarınıza indirdiğiniz dosyaların bir kısmını, sonradan işime yarar diyerek tutuyor olabilirsiniz. Bir süre sonra diskinizin kapasitesi azalmaya başlar. Siz de bu dosyaları silmek için, yüzlerce dosya arasında araştırma yapmaya başlarsınız. Bu yazıda find komutunu kullanarak, bilgisayarınızda bulunan büyük dosyaları bulmanın&nbsp;yolunu açıklamak istiyorum.
 

  Aşağıdaki örnekte, find komutunu kullanarak elde ettiğimiz sonucu, Linux filtreleme komutları yardımıyla listeliyoruz ve en büyük 5 dosyayı ekrana yazdırıyoruz.
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">find . -xdev -ls | sort -n -k 7 | tail -5

 20324812 1860964 -rw-r--r-- 1 umut umut 1905615064 Nov 2  00:40 ./Downloads/ubuntu1604_amd64.deb
 20325627 2876456 -rw-r--r-- 1 umut umut 2945482752 Jul 27 11:37 ./Downloads/linux-2016.1-amd64.iso
 4325458 3004804  -rw-r--r-- 1 umut umut 3076767744 Oct 20 06:51 ./Downloads/ad64.iso
 20324879 3948552 -rw-r--r-- 1 umut umut 4043309056 Oct 30 2015  ./Downloads/rhel-x86_64-dvd.iso
 21237459 4228176 -rw-r--r-- 1 umut umut 4329570304 Sep 19 07:18 ./Downloads/CentOS-7-64-DVD.iso

</pre>
<!-- /wp:preformatted -->

 
 ## Açıklama:
<!-- /wp:heading -->

  find .&nbsp; : Yukarıda vermiş olduğumuz komut, bulunduğumuz klasörü ve alt klasörlerindeki tüm dosyaları arar. Komutu verdiğiniz yer önemlidir. Bu örnekte, komut home klasöründe ve sudo yetkisi olmadan verilmiştir. Baş tarafına sudo yetkisi eklediğinizde sonuçlar değişebilir.
 

  -xdev&nbsp; : find komutua ait bu parametre, sadece üzerinde çalıştığımız diskte işlem yapılmasını sağlar. Sisteminize bağlı diğer disk bölümlerinin aranmasını engeller.
 

  -ls&nbsp; : Sonuçların listelenmesini sağlar.
 

  sort&nbsp; : Elde ettiğimiz sonuçlara sıralama işlemi yapmamızı sağlar.
 

  -n&nbsp; : Sıralamanın sayılar değerlerle yapılacağını belirtir.
 

  -k 7&nbsp; : Sıralamanın, bir kriter girilerek yapılmasını sağlar. Bizim örneğimizde 7. sütun olan boyut (size) sütunu kullanılmıştır.
 

  tail -5&nbsp; : Sort komutu ile küçükten büyüğe yapılan sıralamanın sonucunda, en büyük dosyalar listenin en sonunda yer alacaktır.&nbsp;tail -5&nbsp; komutu ile en son 5 satırın ekranda görüntülenmesi sağlanır. İsterseniz,&nbsp;tail -10&nbsp; şeklinde değiştirerek en büyük 10 dosyayı da bulabilirsiniz.
 

  Size sadece, bulunan dosyaların hangilerinin yedekleme diskine aktarılacağını, hangilerinin sileceğine karar vermek kalıyor. Sizin de kullandığınız faydalı komutlar varsa, bize bildirebilirsiniz. Burada açıklamaları ile birlikte yayınlayabiliriz.
 