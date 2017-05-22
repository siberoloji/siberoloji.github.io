---
layout: post
title: Bozuk USB Flash Diskleri Onarma
date: 2016-12-25 15:16:02.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- bozuk flash diskleri onarma
- featured
- flash disk tanıma problemi
- linux usb flash onarma
- linux usb tamir
- usb tamir
author: siberoloji
---
<p>Bilginin taşınmasında oldukça kolaylık sağlayan USB Flash diskler bazen bilgisayar tarafından tanınmayabilirler. Sisteme taktığınızda, otomatik olarak bulunup kullanıma girmesi gereken cihazlar, bir takım hatalar nedeniyle kullanılamaz hale gelmiş olabilir. Bu yazıda, Linux kullanıcılarının, USB Onarma için kullanabilecekleri 2 yöntemden bahsedeceğiz.</p>
<blockquote><p><strong>Önemli:</strong> Burada anlatılan yöntemlerden ikincisi, diskinizdeki verileri silmektedir. USB Onarma işlemi yapılacak diskte önemli verileriniz varsa, öncelikle Photorec ve Testdik uygulamalarıyla veri kurtarma işlemi yapmanızı tavsiye ediyoruz.</p></blockquote>
<h2>Hazırlık</h2>
<p>USB onarma işlemini yapacağınız cihazınızı bilgisayarınıza taktınız. Sistem tarafından USB cihaza bir disk ismi ve numarası verilir. Bu ifadeyi öncelikle bilmemiz gerekmektedir. Yanlış bir ifade kullanırsanız, istenmeyen sonuçlar ortaya çıkabilir. Komut satırından <span class="lang:sh decode:true  crayon-inline ">lsblk</span>  komutunu verin. Tüm disklerin isimleri listelenecektir.</p>
<pre class="lang:sh decode:true ">lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 931,5G  0 disk 
├─sda1   8:1    0  55,9G  0 part /
├─sda2   8:2    0     1K  0 part 
├─sda3   8:3    0 195,3G  0 part 
├─sda4   8:4    0 339,5G  0 part 
├─sda5   8:5    0   326G  0 part /home
└─sda6   8:6    0  14,9G  0 part 
sdb      8:16   1  14,5G  0 disk 
└─sdb1   8:17   1  14,5G  0 part /media/umut/YENI BIRIM
sr0     11:0    1  1024M  0 rom</pre>
<p>Bu çıktıda görüldüğü gibi, bizim üzerinde çalışacağımız cihaz sdb1 olarak adlandırılmış. Yazının devamında anlatılacak yöntemlerde bu ifade kullanılacaktır.</p>
<h2>1.Yöntem: Bozuk Sektör ve Bit Değerlerini Temizleme</h2>
<p>Bazen USB cihazınızın bir takım sektörlerindeki veriler bozulur. Bu bozuk değerler okuma hatasına yol açar. Özellikle doğru şekilde bilgisayardan ayrılmayan cihazlarda bu problem yaşanmaktadır. USB onarma ihtiyacı olan cihazınızda ilk önce bu ihtimali deneyin. Aşağıdaki örnekte <span class="lang:sh decode:true  crayon-inline ">sudo fsck /dev/sdb1</span>  komutu çalıştırılmış ve <span class="lang:sh decode:true  crayon-inline ">fsck</span>  aracı kullanılarak <span class="lang:sh decode:true  crayon-inline ">sdb1</span>  cihazının dosya sistemi kontrol edilmiştir. Siz komut içerisinde <span class="lang:sh decode:true  crayon-inline ">sdb1</span>  yerine kendi sisteminizin verdiği adı <span class="lang:sh decode:true  crayon-inline ">lsblk</span>  komutuyla tespit edip kullanmalısınız.</p>
<pre class="lang:sh decode:true">sudo fsck /dev/sdb1

fsck from util-linux 2.27.1
fsck.fat 3.0.28 (2015-05-16)
0x41: Dirty bit is set. Fs was not properly unmounted and some data may be corrupt.
1) Remove dirty bit
2) No action
? 1
Perform changes ? (y/n) y
/dev/sdb1: 1942 files, 699119/1892224 clusters</pre>
<p>Komut çıktısında görüldüğü gibi <span class="lang:sh decode:true  crayon-inline">sdb1</span>  USB Onarma yapılmak istenen cihazda, <span class="lang:sh decode:true  crayon-inline">Dirty bit</span> , yani "<strong>bilgisayardan</strong> <strong>hatalı çıkarmadan kaynaklı problem</strong>" tespit edilmiştir. Bunun sonucunda <span class="lang:sh decode:true  crayon-inline">1) Remove dirty Bit</span>  ve <span class="lang:sh decode:true  crayon-inline ">2)No action</span>  seçenekleri kullanıcıya sorulmaktadır. 1 Numaralı seçeneği kullanarak problemi düzeltebilirsiniz.</p>
<h2>2.Yöntem: Diski Formatlama</h2>
<p>Bazen, 1.Yöntemde anlatılan <span class="lang:sh decode:true  crayon-inline ">fsck</span>  komutu ile USB Onarma işlemi işe yaramaz. Diskin tamamını formatlamanız gerekebilir. Bunun için kullanacağınız en uygun araç <span class="lang:sh decode:true  crayon-inline ">dd</span>  komutudur. Aşağıdaki komut örneğinde, diskimizin tüm veri bitlerinin üzerine <span class="lang:sh decode:true  crayon-inline ">zero</span>  yani 0 değeri yazılarak temizlenmektedir. Biz komutta <span class="lang:sh decode:true  crayon-inline ">sdb</span>  ifadesini kullandık. Siz kendi cihazınızın adını, sonundaki rakam olmadan yazmalısınız.</p>
<pre class="">sudo dd if=/dev/zero of=/dev/sdb</pre>
<p><span class="lang:sh decode:true  crayon-inline ">if=/dev/zero</span>  : input file, yani verinin okunacağı adresi belirtir. Burada veri <span class="lang:sh decode:true  crayon-inline ">zero</span>  dosyasından okunmaktadır. <span class="lang:sh decode:true  crayon-inline ">/dev/zero</span>  Linux tarafından kullanılan özel bir cihaz türüdür. İçerisinden <span class="lang:sh decode:true  crayon-inline ">zero</span>  değerler okunur ve hedefe yani <span class="lang:sh decode:true  crayon-inline ">of</span>  ile tanımlanan alana yazılır.</p>
<p><span class="lang:sh decode:true  crayon-inline">of=/dev/sdb</span>  : output file, <span class="lang:sh decode:true  crayon-inline ">if=/dev/zero</span>  parametresi ile okunan veriler, burada belirtilen hedefe (<span class="lang:sh decode:true  crayon-inline ">/dev/sdb</span> ) yazdırılır.</p>
<h3>Yeni Dosya Sistemini Oluşturma</h3>
<p>Yukarıda gerçekleştirdiğimiz, tüm diske sıfır değerleri yazdırma işleminden sonra diskin yeni dosya sistemini oluşturmamız gerekiyor. Diskimizin hangi dosya sistemine sahip olmasını istiyorsak, ona göre aşağıdaki komutlardan bir tanesini seçerek uyguluyoruz.</p>
<h4>Fat32</h4>
<p>Oluşturacağınız dosya sistemi hem Windows, hem Linux İşletim sistemleri tarafından tanınır.</p>
<div class="holsh-div">
<div class="bash">
<pre class="">sudo mkfs.msdos -f 32 /dev/sdb1</pre>
</div>
</div>
<h4>Ext4</h4>
<p>Oluşturacağınız dosya sistemi Linux işletim sistemleri tarafından tanınır. Windows İşletim Sistemi kullanan cihazlar tanımaz, okuyamaz.</p>
<div class="holsh-div">
<div class="bash">
<pre class="">sudo mkfs.ext4 -f /dev/sdb1</pre>
</div>
</div>
<h4 id="MTE_in_content_ad2">NTFS</h4>
<div>Oluşturacağınız dosya sistemi hem Windows, hem Linux İşletim sistemleri tarafından tanınır.</div>
<div class="holsh-div">
<div class="bash">
<pre class="">sudo mkfs.ntfs -f /dev/sdb1</pre>
</div>
</div>
<h2>Sonuç</h2>
<p>Burada anlatılan yöntemler sonucunda USB Onarma başarıyla sonuçlanmamış ise diskinizde farklı bir problem var demektir. Başka bir bilgisayarda, farklı bir işletim sisteminde denemenizi de tavsiye ediyoruz.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
