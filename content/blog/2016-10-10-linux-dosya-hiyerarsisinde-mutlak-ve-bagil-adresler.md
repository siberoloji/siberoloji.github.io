---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-10-10T01:43:00Z"
excerpt: cd /Downloadsilecd Downloads/arasındaki fark nedir?"Bunun açıklanması
  için Linux Dosya Hiyerarşisindekullanılan mutlak ve bağıl adresler kavramına bakacağız.
guid: https://www.siberoloji.com/?p=1103
id: 1103
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux nasıl
title: Linux Dosya Hiyerarşisinde Mutlak ve Bağıl Adresler
url: /tr/linux-dosya-hiyerarsisinde-mutlak-ve-bagil-adresler/
---

  Bir Linux Kullanıcısı&nbsp;<a href="https://forum.ubuntu-tr.net/index.php?topic=53974.0" target="_blank" rel="noreferrer noopener">sormuş</a>; "<em>cd /Downloads</em>&nbsp;ile&nbsp;<em>cd Downloads/</em>&nbsp;arasındaki fark nedir?"&nbsp;Bunun açıklanması için Linux Dosya Hiyerarşisinde&nbsp;kullanılan mutlak ve bağıl adresler kavramına bakacağız. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /Downloads&nbsp;
bash: cd: /Downloads: No such file or directory
cd Downloads/</pre>
<!-- /wp:preformatted -->

  Linux dosya sisteminde çalışırken, dosya ve klasörlerin adreslerini ifade etmek istediğinizde, iki tip adres başlangıcı olduğunu hatırlamalısınız. Bildiğiniz gibi / işareti root yani en üst klasörü, başlangıcı ifade eder. Bir adresi yazacağınız zaman / (slash) ile başlarsanız, adres root (kök) klasöründen başlanarak aranır. Dosya, klasör adresini / işareti olmadan başlatırsanız, adresi şu an bulunduğunuz noktadan alta doğru ifade edeceğiniz anlamına gelir. İsterseniz bunu örneklerle açıklayalım. 
 

  Örnek: Şu anda /home/linuks klasörünün içindesiniz. Bu klasörden bir dosyayı üst klasör olan /home klasörüne kopyalamak için&nbsp;<em>cp birdosya home/</em>&nbsp;komutu verirseniz, başlangıç noktası root olmadığından, linuks/ klasörünün içinde home/ klasörü aranacaktır. Oysa home/ klasörü root klasörünün hemen altında yer alır. 
 

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
 

  ***Özetleyecek olursak;***  
 

<!-- wp:list {"ordered":true} -->
 <!-- wp:list-item -->
- Belirteceğiniz adresi / işaretiyle başlatırsanız, ağaç yapısının en üstünden aşağıya doğru eksiksiz yazmanız gerekmektedir. Buna mutlak (absolute) adres belirtme denir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Belirteceğiniz adres, bulunduğunuz klasörün alt kısımlarındaysa, üst kısımları yazmanıza yani / ile başlamanıza gerek yoktur. Buna da bağıl (relative) adres belirtme denir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  <em>cd /Downloads</em>; kök klasörünün içinde Downloads isimli bir klasör olmadığından hata vermesi normaldir. 
 

  <em>cd /opt</em>; Kök klasörü / altında opt isimli klasör olduğundan hata vermeden girecektir. 
 

  <em>cd Downloads</em>&nbsp;dediğinizde, o an hangi klasörde olduğunuz önemlidir. &nbsp;Downloads klasörü ve benzeri klasörleri içinde bulunduran klasörde iseniz girersiniz. Başka bir klasörde iseniz tam adresi yazmanız gerekmektedir. Tam adres yazımında ev klasörünü uzun uzun yazmamak adına ~ işareti geliştirilmiştir.&nbsp;~ işareti, o an aktif olan kullanıcının Ev klasörü anlamındadır. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd ~
pwd</pre>
<!-- /wp:preformatted -->