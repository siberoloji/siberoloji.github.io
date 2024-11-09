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
date: "2016-04-23T16:24:00Z"
guid: https://www.siberoloji.com/?p=1066
id: 1066
image: /assets/images/2024/06/cyber10.jpg
tags:
- linux nasıl
title: Linux Terminalde İşlemi Arka Plana Gönderme (Ctrl+Z ve fg)
url: /tr/linux-terminalde-islemi-arka-plana-gonderme-ctrlz-ve-fg/
---

  Shell varsa çözüm mutlaka vardır, sadece siz henüz bilmiyor olabilirsiniz. Yaşadığınız bir problem veya size zor gelen bir işlemi, emin olun ki başkaları da yaşamıştır. Bunlardan bir kısmı, işin kolayını bulmuştur. Bir kısmı umursamamıştır. Bir kısmı da bu yazıda olduğu gibi öğrenip paylaşmak istemiştir. 
 

  Terminalde komutlar ile işlemlerinizi yaparken, nano editör ile bir dosya içerisinde (resolv.conf vb.) düzeltmeler yapmak istediniz. Bu durumda, komut satırına&nbsp;<code>sudo nano belgeninadı</code>&nbsp;yazıp editöre girersiniz. Editöre girdiğinizde komut satırı artık kaybolmuştur. Çalıştığınız dosyada işiniz bitmediği halde, komut satırında da bir işlem yapmak isterseniz ne yapmalısınız? 
 

  ***1.Yol:*** &nbsp;Yeni bir TAB-sekme açarım. 
 

  ***2.Yol:*** &nbsp;Ctrl+O ile belgeyi kaydeder, Ctrl+X ile çıkarım. Terminalde komutu yazar, çalıştırır ve sonra tekrar nano editörü açarım. 
 

  ***3.Yol:*** &nbsp;Diğer 
 

  Bu seçeneklerden birincisi, görsel bir masaüstü ile çalışıyorsanız olabilir fakat ssh ile bağlandığınız uzak sunucuda bu mümkün olmayabilir. İkinci seçenek ise bilgisayarın icat edildiği ilk çağlardan kalma bir yöntem gibi görünüyor. Bu sorunu çözmenin kısa ve hızlı bir yolu mutlaka olmalı. 
 

  İşte böyle kaydet-çık-tekrar gir işlemlerinden sıkılan geliştiriciler Ctrl+Z tuş kombinasyonu ve fg komutunu geliştirmişler. Bu sayede, çalışan editörü, çıkmadan geri plana gönderip tekrar komut satırına geçmeniz mümkün. Hatta, komut satırından, editörde başka bir belge açmanız ve onu da arka plana göndermeniz mümkün. İki açık belgeyi arka plana gönderdikten sonra başka bir belge açıp onu da arka plana göndermeniz ……. diye hikaye böyle devam eder. 
 

  ***Nasıl mı?***  
 

  1.Adım: Önce deneme1.txt, deneme2.txt ve deneme3.txt dosyaları oluşturalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***&gt;*** ~$ cd /tmp/
/tmp$ echo 'Selam, ben 0 numaralı belgeyim' ***&gt;*** deneme1.txt
/tmp$ echo 'Selam, ben 2 numaralı belgeyim' ***&gt;*** deneme2.txt
/tmp$ echo 'Selam, ben 3 numaralı belgeyim' ***&gt;*** deneme3.txt
</code></pre>
<!-- /wp:code -->

  2.Adım: Nano editör ile belgeleri açıp Ctrl+z tuşları ile arka plana gönderiyoruz. Bu sayede belge kapatılmadan tekrar komut satırına ulaşmış oluyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***&gt;*** /tmp$ nano deneme1.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
1 txt

/tmp$ nano deneme2.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
2 txt

/tmp$ nano deneme3.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
3 txt
</code></pre>
<!-- /wp:code -->

  Aşağıda da görüldüğü gibi, her Ctrl+Z tuş kombinasyonu ile arka plana gönderilen işlemin yanına bir numara verilir. Bu sayı, söz konusu arka plan görevini geri çağırmanız için kullanılır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">4 txt
</code></pre>
<!-- /wp:code -->

  3.Adım:&nbsp;Şimdi arka plana gönderdiğimiz bir görevi geri çağıralım. Bunun için&nbsp;<code>fg</code>&nbsp;komutunu kullanıyoruz. Zaten ekran çıktılarında da shell bize nano’ya dönmek için fg kullanın diye söylüyor. 
 

  Komut satırına sadece fg yazarsanız en son kapatılan işleme geri dönersiniz. Ancak siz 1 numaralı işleme geri gitmek isteseniz fg 1 komutu vermeniz yeterli olacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***&gt;*** $ fg 1
</code></pre>
<!-- /wp:code -->

  <em>Düzenleme:(10.05.2017)</em>&nbsp;Arka planda çalışan tüm işlemleri görmek isterseniz&nbsp;<code>jobs</code>&nbsp;komutunu kullanabilirsiniz. 
 

  Bu yazıda nano editör üzerinden konu anlatılsa da vi veya diğer editörlerle de aynı geri plana gönderme yapmanız mümkün. 
 