---
draft: false

title:  'Linux İçin jpg ve png Resim Sıkıştırma'
date: '2016-12-15T01:54:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Resim sıkıştırma, sadece bilgisayarınızda değil internette kullandığınız Wordpress benzeri içerik yönetim sistemleri içinde tavsiye edilen bir tekniktir. İçerik yönetim sistemleri, resim sıkıştırma işlemlerini, eklentiler kullanarak yükleme anında yapabilmektedir. Sıkıştırmayı, eklenti kullanmadan bilgisayarınızda da yapabilirsiniz. Bu yazıda, bilgisayarınızda bulunan jpg ve png uzantılı dosyaları sıkıştırabileceğiniz iki ayrı programı tanıtacağım.' 
 
url:  /tr/linux-icin-jpg-ve-png-resim-sikistirma/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---


Resim sıkıştırma, sadece bilgisayarınızda değil internette kullandığınız Wordpress benzeri içerik yönetim sistemleri içinde tavsiye edilen bir tekniktir. İçerik yönetim sistemleri, resim sıkıştırma işlemlerini, eklentiler kullanarak yükleme anında yapabilmektedir. Sıkıştırmayı, eklenti kullanmadan bilgisayarınızda da yapabilirsiniz. Bu yazıda, bilgisayarınızda bulunan jpg ve png uzantılı dosyaları sıkıştırabileceğiniz iki ayrı programı tanıtacağım.



1. pngquant



2. jpegoptim



## pngquant kurulum:



Programın kurulumunu aşağıdaki komutu uygulayarak yapabilirsiniz.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo apt install pngquant</pre>
<!-- /wp:preformatted -->


## pngquant kullanım:



png sıkıştırma işlem için komutu kullandığınızda, program sıkıştırmak istediğiniz png uzantılı dosyanıza yeni bir isim vererek kaydeder. Orijinal dosyanızın üzerine yazılmaz. Otomatik isim yerine yeni dosyanın ismini kendiniz -o  parametresi kullanarak belirleyebilirsiniz. Her iki durum için de aşağıda örnek komutları veriyorum.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">pngquant resim.png #yeni resim, resim-f81.png gibi bir isim ile kaydedilir.

pngquant resim.png -o resimzip.png #yeni resim, resimzip.png ismi ile kaydedilir.</pre>
<!-- /wp:preformatted -->


--force  parametresini kullandığınızda, bulunduğunuz klasörde aynı isimli dosya varsa üzerine yazabilirsiniz.



--skip-if-larger  parametresi, yeni üretilen resim, orjinalinden daha büyük boyutlu ise sıkıştırma işlemi yapılmaz.



Detaylı yardım açıklamalarını komut satırında pngquant komutunu vererek inceleyebilirsiniz.



## Jpegoptim Kurulum:



Programın kurulumunu aşağıdaki komutu uygulayarak yapabilirsiniz.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo apt install jpegoptim</pre>
<!-- /wp:preformatted -->


## jpegoptim kullanım:



jpegoptim programı, varsayılan olarak orijinal resmin üzerine yazar. Farklı bir isimle kullanabilmek için, --des= parametresini kullanalarak orijinal resmin bulunduğu klasör haricinde bir hedef klasör belirtmeniz gerekmektedir. -n parametresini kullanarak, sıkşıtırma işlemini gerçekten yapmadan simülasyonunu yaparak resmin ne kadar başarıyla sıkıştırılacağını test edebilirsiniz. Aşağıda, bu kullanımlar için örnek komutları bulabilirsiniz.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">jpegoptim resim.jpg

resim.jpg 942x1006 24bit N JFIF [OK] 105602 --&gt; 98202 bytes (7.01%), optimized.

jpegoptim graduate.jpg

graduate.jpg 53x75 24bit N JFIF [OK] 709 --&gt; 314 bytes (55.71%), optimized.

jpegoptim penguin.jpg --des=/home/umut/

penguin.jpg 53x75 24bit N JFIF [OK] 709 --&gt; 314 bytes (55.71%), optimized.</pre>
<!-- /wp:preformatted -->