---
layout: post
title: Linux Dosya Hiyerarşisinde Mutlak ve Bağıl Adresler
date: 2016-10-10 07:51:54.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Linux Blog
tags:
- bağıl adres
- linux dosya yapısı
- mutlak adres
- mutlak ve bağıl adres
author: siberoloji
---
<p class="western">Bir Linux Kullanıcısı <a href="https://forum.ubuntu-tr.net/index.php?topic=53974.0" target="_blank">sormuş</a>; "<em>cd /Downloads</em> ile <em>cd Downloads/</em> arasındaki fark nedir?" Bunun açıklanması için Linux Dosya Hiyerarşisinde kullanılan mutlak ve bağıl adresler kavramına bakacağız.</p>
<pre class="lang:sh decode:true">cd /Downloads 
bash: cd: /Downloads: No such file or directory
cd Downloads/</pre>
<p>Linux dosya sisteminde çalışırken, dosya ve klasörlerin adreslerini ifade etmek istediğinizde, iki tip adres başlangıcı olduğunu hatırlamalısınız. Bildiğiniz gibi / işareti root yani en üst klasörü, başlangıcı ifade eder. Bir adresi yazacağınız zaman / (slash) ile başlarsanız, adres root (kök) klasöründen başlanarak aranır. Dosya, klasör adresini / işareti olmadan başlatırsanız, adresi şu an bulunduğunuz noktadan alta doğru ifade edeceğiniz anlamına gelir. İsterseniz bunu örneklerle açıklayalım.</p>
<p>Örnek: Şu anda /home/linuks klasörünün içindesiniz. Bu klasörden bir dosyayı üst klasör olan /home klasörüne kopyalamak için <em>cp birdosya home/</em> komutu verirseniz, başlangıç noktası root olmadığından, linuks/ klasörünün içinde home/ klasörü aranacaktır. Oysa home/ klasörü root klasörünün hemen altında yer alır.</p>
<pre class="lang:sh decode:true western">linuks@egitim:~$ pwd #Bulunduğumuz yeri gösterir. 
/home/linuks 
linuks@egitim:~$ cd home #Bulunduğumuz klasörde home isimli klasörü arar. Bulamaz.
bash: cd: home: No such file or directory
linuks@egitim:~$ cd /home #root klasörünün içinde aranır. Ve bulunur.
linuks@egitim:/home$ pwd #Bulunduğumuz yeri gösterir.
/home</pre>
<p>Şimdi /home klasörünün içindeyiz. Bu klasörün altında bulunan linuks klasörüne girmek için cd /linuks yazmak hata olur. Onun yerine cd linuks yazmanız ve bu klasörün (home) içerisinde ara komutunu vermeniz gerekmektedir.</p>
<p><strong>Özetleyecek olursak;</strong></p>
<ol>
<li>Belirteceğiniz adresi / işaretiyle başlatırsanız, ağaç yapısının en üstünden aşağıya doğru eksiksiz yazmanız gerekmektedir. Buna mutlak (absolute) adres belirtme denir.</li>
<li>Belirteceğiniz adres, bulunduğunuz klasörün alt kısımlarındaysa, üst kısımları yazmanıza yani / ile başlamanıza gerek yoktur. Buna da bağıl (relative) adres belirtme denir.</li>
</ol>
<p><em>cd /Downloads</em>; kök klasörünün içinde Downloads isimli bir klasör olmadığından hata vermesi normaldir.</p>
<p><em>cd /opt</em>; Kök klasörü / altında opt isimli klasör olduğundan hata vermeden girecektir.</p>
<p><em>cd Downloads</em> dediğinizde, o an hangi klasörde olduğunuz önemlidir.  Downloads klasörü ve benzeri klasörleri içinde bulunduran klasörde iseniz girersiniz. Başka bir klasörde iseniz tam adresi yazmanız gerekmektedir. Tam adres yazımında ev klasörünü uzun uzun yazmamak adına ~ işareti geliştirilmiştir. ~ işareti, o an aktif olan kullanıcının Ev klasörü anlamındadır.</p>
<pre class="lang:sh decode:true ">cd ~
pwd</pre>
<p>&nbsp;</p>
