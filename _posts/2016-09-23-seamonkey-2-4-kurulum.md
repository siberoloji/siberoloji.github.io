---
layout: post
title: SeaMonkey 2.4 Kurulum
date: 2016-09-23 22:14:10.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- seamonkey 2.40
- seamonkey 2.40 kararlı sürüm
- seamonkey kurulum
author: siberoloji
---
<p>İnternette gezinmek için kullanılan web tarayıcısı olmanın yanında e-posta okuma, web editor, IRC chat ve benzeri özelliklerin hepsini tek bir programda toplayan SeaMonkey programını Linux işletim sisteminize kurmak isterseniz bu yazıda anlatılan adımları sırasıyla takip edebilirsiniz.</p>
<p>Seamonkey, kurulum gerektirmeyen bir programdır. Doğrudan indirdiğimiz dosyayı bir klasöre çıkarıp çalıştırabiliriz. Komutlar Klasör isimlerini İngilizce kullananlar için verilmiştir. Klasör isimlerini Türkçe kullanıyorsanız sadece cd Desktop/ yerine cd Masaüstü/ komutunu kullanmalısınız. Diğer komutlar aynen kullanılabilir.</p>
<h2>Seamonkey 1.Adım</h2>
<p>Öncelikle, komut satırında Masaüstüne giderek seamonkey2 isimli bir klasör oluşturalım ve bu klasöre girelim.</p>
<pre class="lang:sh decode:true " title="Türkçe kullananlar için cd Desktop/ yerine cd Masaüstü/ kullanılmalıdır.">cd
cd Desktop/
mkdir seamonkey2
cd seamonkey2</pre>
<h2>Seamonkey 2.Adım</h2>
<p>wget komutu yardımıyla en son kararlı sürüm olan seamonkey 2.40 sıkıştırılmış arşiv dosyasını indirelim. Farklı ve yeni sürümleri indirmek isterseniz <a href="http://download.cdn.mozilla.net/pub/seamonkey/releases/" target="_blank">http://download.cdn.mozilla.net/pub/seamonkey/releases/</a> adresini ziyaret edebilirsiniz.</p>
<pre class="lang:sh decode:true ">wget http://download.cdn.mozilla.net/pub/seamonkey/releases/2.40/linux-i686/tr/seamonkey-2.40.tar.bz2
ls</pre>
<h2>Seamonkey 3.Adım</h2>
<p>İndirme işlemi tamamlandığında dosyayı tar programı ile açalım.</p>
<pre class="lang:sh decode:true ">tar jxvf seamonkey-2.40.tar.bz2</pre>
<h2>Seamonkey 4.Adım</h2>
<p>Sıkıştırılmış arşiv dosyası, bulunduğumuz klasörün içerisine seamonkey isimli yeni bir klasör oluşturacaktır. O klasöre girelim.</p>
<pre class="lang:sh decode:true ">cd seamonkey</pre>
<h2>Seamonkey 5.Adım</h2>
<p>Son olarak aşağıdaki komut ile programı çalıştıralım.</p>
<pre class="lang:sh decode:true ">./seamonkey</pre>
<p>&nbsp;</p>
<p>İndirme ve çalıştırma esnasında aldığınız hataları yorumlar kısmında paylaşırsanız, yardımcı olmaya çalışacağımızı belirtiyoruz.</p>
