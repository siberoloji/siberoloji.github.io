---
draft: false

title:  'Linux Dosya Hiyerarşisinde Mutlak ve Bağıl Adresler'
date: '2016-10-10T01:43:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "cd /Downloads\_ile\_cd Downloads/\_arasındaki fark nedir?\"\_Bunun açıklanması için Linux Dosya Hiyerarşisinde\_kullanılan mutlak ve bağıl adresler kavramına bakacağız." 
 
url:  /tr/linux-dosya-hiyerarsisinde-mutlak-ve-bagil-adresler/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
---


Bir Linux Kullanıcısı <a href="https://forum.ubuntu-tr.net/index.php?topic=53974.0" target="_blank" rel="noreferrer noopener">sormuş</a>; "cd /Downloads ile cd Downloads/ arasındaki fark nedir?" Bunun açıklanması için Linux Dosya Hiyerarşisinde kullanılan mutlak ve bağıl adresler kavramına bakacağız.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /Downloads 
bash: cd: /Downloads: No such file or directory
cd Downloads/</pre>
<!-- /wp:preformatted -->


Linux dosya sisteminde çalışırken, dosya ve klasörlerin adreslerini ifade etmek istediğinizde, iki tip adres başlangıcı olduğunu hatırlamalısınız. Bildiğiniz gibi / işareti root yani en üst klasörü, başlangıcı ifade eder. Bir adresi yazacağınız zaman / (slash) ile başlarsanız, adres root (kök) klasöründen başlanarak aranır. Dosya, klasör adresini / işareti olmadan başlatırsanız, adresi şu an bulunduğunuz noktadan alta doğru ifade edeceğiniz anlamına gelir. İsterseniz bunu örneklerle açıklayalım.



Örnek: Şu anda /home/linuks klasörünün içindesiniz. Bu klasörden bir dosyayı üst klasör olan /home klasörüne kopyalamak için cp birdosya home/ komutu verirseniz, başlangıç noktası root olmadığından, linuks/ klasörünün içinde home/ klasörü aranacaktır. Oysa home/ klasörü root klasörünün hemen altında yer alır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">linuks@egitim:~$ pwd #Bulunduğumuz yeri gösterir. 
/home/linuks 
linuks@egitim:~$ cd home #Bulunduğumuz klasörde home isimli klasörü arar. Bulamaz.
bash: cd: home: No such file or directory
linuks@egitim:~$ cd /home #root klasörünün içinde aranır. Ve bulunur.
linuks@egitim:/home$ pwd #Bulunduğumuz yeri gösterir.
/home</pre>
<!-- /wp:preformatted -->


Şimdi /home klasörünün içindeyiz. Bu klasörün altında bulunan linuks klasörüne girmek için cd /linuks yazmak hata olur. Onun yerine cd linuks yazmanız ve bu klasörün (home) içerisinde ara komutunu vermeniz gerekmektedir.



**Özetleyecek olursak;**


*  Belirteceğiniz adresi / işaretiyle başlatırsanız, ağaç yapısının en üstünden aşağıya doğru eksiksiz yazmanız gerekmektedir. Buna mutlak (absolute) adres belirtme denir.

* Belirteceğiniz adres, bulunduğunuz klasörün alt kısımlarındaysa, üst kısımları yazmanıza yani / ile başlamanıza gerek yoktur. Buna da bağıl (relative) adres belirtme denir.




cd /Downloads; kök klasörünün içinde Downloads isimli bir klasör olmadığından hata vermesi normaldir.



cd /opt; Kök klasörü / altında opt isimli klasör olduğundan hata vermeden girecektir.



cd Downloads dediğinizde, o an hangi klasörde olduğunuz önemlidir.  Downloads klasörü ve benzeri klasörleri içinde bulunduran klasörde iseniz girersiniz. Başka bir klasörde iseniz tam adresi yazmanız gerekmektedir. Tam adres yazımında ev klasörünü uzun uzun yazmamak adına ~ işareti geliştirilmiştir. ~ işareti, o an aktif olan kullanıcının Ev klasörü anlamındadır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd ~
pwd</pre>
<!-- /wp:preformatted -->