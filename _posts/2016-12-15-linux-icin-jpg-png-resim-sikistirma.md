---
layout: post
title: Linux İçin jpg ve png Resim Sıkıştırma
date: 2016-12-15 19:56:14.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- jpg sıkıştırma
- linux resim sıkıştırma
- png sıkıştırma
author: siberoloji
---
<p>Resim sıkıştırma, sadece bilgisayarınızda değil internette kullandığınız Wordpress benzeri içerik yönetim sistemleri içinde tavsiye edilen bir tekniktir. İçerik yönetim sistemleri, resim sıkıştırma işlemlerini, eklentiler kullanarak yükleme anında yapabilmektedir. Sıkıştırmayı, eklenti kullanmadan bilgisayarınızda da yapabilirsiniz. Bu yazıda, bilgisayarınızda bulunan jpg ve png uzantılı dosyaları sıkıştırabileceğiniz iki ayrı programı tanıtacağım.</p>
<p>1. pngquant</p>
<p>2. jpegoptim</p>
<h2>pngquant kurulum:</h2>
<p>Programın kurulumunu aşağıdaki komutu uygulayarak yapabilirsiniz.</p>
<pre class="lang:sh decode:true ">sudo apt install pngquant</pre>
<p>&nbsp;</p>
<h2>pngquant kullanım:</h2>
<p>png sıkıştırma işlem için komutu kullandığınızda, program sıkıştırmak istediğiniz png uzantılı dosyanıza yeni bir isim vererek kaydeder. Orijinal dosyanızın üzerine yazılmaz. Otomatik isim yerine yeni dosyanın ismini kendiniz <span class="lang:sh decode:true  crayon-inline ">-o </span> parametresi kullanarak belirleyebilirsiniz. Her iki durum için de aşağıda örnek komutları veriyorum.</p>
<pre class="lang:sh decode:true ">pngquant resim.png #yeni resim, resim-f81.png gibi bir isim ile kaydedilir.

pngquant resim.png -o resimzip.png #yeni resim, resimzip.png ismi ile kaydedilir.</pre>
<p>&nbsp;</p>
<p><span class="lang:sh decode:true  crayon-inline ">--force</span>  parametresini kullandığınızda, bulunduğunuz klasörde aynı isimli dosya varsa üzerine yazabilirsiniz.</p>
<p><span class="lang:sh decode:true  crayon-inline ">--skip-if-larger</span>  parametresi, yeni üretilen resim, orjinalinden daha büyük boyutlu ise sıkıştırma işlemi yapılmaz.</p>
<p>Detaylı yardım açıklamalarını komut satırında pngquant komutunu vererek inceleyebilirsiniz.</p>
<h2>Jpegoptim Kurulum:</h2>
<p>Programın kurulumunu aşağıdaki komutu uygulayarak yapabilirsiniz.</p>
<pre class="lang:sh decode:true ">sudo apt install jpegoptim</pre>
<p>&nbsp;</p>
<h2>jpegoptim kullanım:</h2>
<p>jpegoptim programı, varsayılan olarak orijinal resmin üzerine yazar. Farklı bir isimle kullanabilmek için, --des= parametresini kullanalarak orijinal resmin bulunduğu klasör haricinde bir hedef klasör belirtmeniz gerekmektedir. -n parametresini kullanarak, sıkşıtırma işlemini gerçekten yapmadan simülasyonunu yaparak resmin ne kadar başarıyla sıkıştırılacağını test edebilirsiniz. Aşağıda, bu kullanımlar için örnek komutları bulabilirsiniz.</p>
<pre class="lang:sh decode:true ">jpegoptim resim.jpg

resim.jpg 942x1006 24bit N JFIF [OK] 105602 --&gt; 98202 bytes (7.01%), optimized.

jpegoptim graduate.jpg

graduate.jpg 53x75 24bit N JFIF [OK] 709 --&gt; 314 bytes (55.71%), optimized.

jpegoptim penguin.jpg --des=/home/umut/

penguin.jpg 53x75 24bit N JFIF [OK] 709 --&gt; 314 bytes (55.71%), optimized.</pre>
<p>Kurulum ve kullanım hakkında yaşadığınız tecrübeleri yorum bölümünden bize iletebilirsiniz.</p>
