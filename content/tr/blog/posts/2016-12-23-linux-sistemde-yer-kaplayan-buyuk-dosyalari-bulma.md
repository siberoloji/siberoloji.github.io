---
draft: false

title:  'Linux Sistemde Yer Kaplayan Büyük Dosyaları Bulma'
date: '2016-12-23T02:01:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bilgisayarınıza indirdiğiniz dosyaların bir kısmını, sonradan işime yarar diyerek tutuyor olabilirsiniz. Bir süre sonra diskinizin kapasitesi azalmaya başlar. Siz de bu dosyaları silmek için, yüzlerce dosya arasında araştırma yapmaya başlarsınız. Bu yazıda find komutunu kullanarak, bilgisayarınızda bulunan büyük dosyaları bulmanın\_yolunu açıklamak istiyorum." 
 
url:  /tr/linux-sistemde-yer-kaplayan-buyuk-dosyalari-bulma/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---
Bilgisayarınıza indirdiğiniz dosyaların bir kısmını, sonradan işime yarar diyerek tutuyor olabilirsiniz. Bir süre sonra diskinizin kapasitesi azalmaya başlar. Siz de bu dosyaları silmek için, yüzlerce dosya arasında araştırma yapmaya başlarsınız. Bu yazıda find komutunu kullanarak, bilgisayarınızda bulunan büyük dosyaları bulmanın yolunu açıklamak istiyorum.

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

find .  : Yukarıda vermiş olduğumuz komut, bulunduğumuz klasörü ve alt klasörlerindeki tüm dosyaları arar. Komutu verdiğiniz yer önemlidir. Bu örnekte, komut home klasöründe ve sudo yetkisi olmadan verilmiştir. Baş tarafına sudo yetkisi eklediğinizde sonuçlar değişebilir.

-xdev  : find komutua ait bu parametre, sadece üzerinde çalıştığımız diskte işlem yapılmasını sağlar. Sisteminize bağlı diğer disk bölümlerinin aranmasını engeller.

-ls  : Sonuçların listelenmesini sağlar.

sort  : Elde ettiğimiz sonuçlara sıralama işlemi yapmamızı sağlar.

-n  : Sıralamanın sayılar değerlerle yapılacağını belirtir.

-k 7  : Sıralamanın, bir kriter girilerek yapılmasını sağlar. Bizim örneğimizde 7. sütun olan boyut (size) sütunu kullanılmıştır.

tail -5  : Sort komutu ile küçükten büyüğe yapılan sıralamanın sonucunda, en büyük dosyalar listenin en sonunda yer alacaktır. tail -5  komutu ile en son 5 satırın ekranda görüntülenmesi sağlanır. İsterseniz, tail -10  şeklinde değiştirerek en büyük 10 dosyayı da bulabilirsiniz.

Size sadece, bulunan dosyaların hangilerinin yedekleme diskine aktarılacağını, hangilerinin sileceğine karar vermek kalıyor. Sizin de kullandığınız faydalı komutlar varsa, bize bildirebilirsiniz. Burada açıklamaları ile birlikte yayınlayabiliriz.
