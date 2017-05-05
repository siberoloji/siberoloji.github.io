---
layout: post
title: Linux Terminalde İşlemi Arka Plana Gönderme (Ctrl+Z ve fg)
date: 2016-04-23 11:42:21.000000000 +03:00
type: post
published: true
status: publish
categories:
---
<p>Shell varsa çözüm mutlaka vardır, sadece siz henüz bilmiyor olabilirsiniz. Yaşadığınız bir problem veya size zor gelen bir işlemi, emin olun ki başkaları da yaşamıştır. Bunlardan bir kısmı, işin kolayını bulmuştur. Bir kısmı umursamamıştır. Bir kısmı da bu yazıda olduğu gibi öğrenip paylaşmak istemiştir.<br />
Terminalde komutlar ile işlemlerinizi yaparken, nano editör ile bir dosya içerisinde (resolv.conf vb.) düzeltmeler yapmak istediniz. Bu durumda, komut satırına sudo nano belgeninadı yazıp editöre girersiniz. Editöre girdiğinizde komut satırı artık kaybolmuştur. Çalıştığınız dosyada işiniz bitmediği halde, komut satırında da bir işlem yapmak isterseniz ne yapmalısınız?</p>
<p>1.Yol: Yeni bir TAB-sekme açarım.</p>
<p>2. Yol: Ctrl+O ile belgeyi kaydeder, Ctrl+X ile çıkarım. Terminalde komutu yazar, çalıştırır ve sonra tekrar nano editörü açarım.</p>
<p>3. Yol: Diğer</p>
<p>Bu seçeneklerden birincisi, görsel bir masaüstü ile çalışıyorsanız olabilir fakat ssh ile bağlandığınız uzak sunucuda bu mümkün olmayabilir.</p>
<p>İkinci seçenek ise bilgisayarın icat edildiği ilk çağlardan kalma bir yöntem gibi görünüyor. Bu sorunu çözmenin kısa ve hızlı bir yolu mutlaka olmalı.</p>
<p>İşte böyle kaydet-çık-tekrar gir işlemlerinden sıkılan geliştiriciler Ctrl+Z tuş kombinasyonu ve fg komutunu geliştirmişler. Bu sayede, çalışan editörü, çıkmadan geri plana gönderip tekrar komut satırına geçmeniz mümkün. Hatta, komut satırından, editörde başka bir belge açmanız ve onu da arka plana göndermeniz mümkün. İki açık belgeyi arka plana gönderdikten sonra başka bir belge açıp onu da arka plana göndermeniz ....... diye hikaye böyle devam eder. Nasıl mı?</p>
<p>1. Adım: Önce deneme1.txt, deneme2.txt ve deneme3.txt dosyaları oluşturalım.</p>
<pre class="lang:sh decode:true">~$ cd /tmp/
/tmp$ echo 'Selam, ben 0 numaralı belgeyim' &gt;deneme1.txt
/tmp$ echo 'Selam, ben 2 numaralı belgeyim' &gt;deneme2.txt
/tmp$ echo 'Selam, ben 3 numaralı belgeyim' &gt;deneme3.txt</pre>
<p>2. Adım: Nano editör ile belgeleri açıp Ctrl+z tuşları ile arka plana gönderiyoruz. Bu sayede belge kapatılmadan tekrar komut satırına ulaşmış oluyoruz.</p>
<pre class="lang:sh decode:true">/tmp$ nano deneme1.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
1txt

/tmp$ nano deneme2.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
2txt

/tmp$ nano deneme3.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
3txt</pre>
<p>Aşağıda da görüldüğü gibi, her Ctrl+Z tuş kombinasyonu ile arka plana gönderilen işlemin yanına bir numara verilir. Bu sayı, söz konusu arka plan görevini geri çağırmanız için kullanılır.</p>
<p>4txt</p>
<p>3. Adım: Şimdi arka plana gönderdiğimiz bir görevi geri çağıralım. Bunun için <strong>fg</strong> komutunu kullanıyoruz. Zaten ekran çıktılarında da shell bize nano'ya dönmek için fg kullanın diye söylüyor.</p>
<p>Komut satırına sadece fg yazarsanız en son kapatılan işleme geri dönersiniz. Ancak siz 1 numaralı işleme geri gitmek isteseniz fg 1 komutu vermeniz yeterli olacaktır.</p>
<pre class="lang:sh decode:true ">$ fg 1</pre>
<p>Bu yazıda nano editör üzerinden konu anlatılsa da vi veya diğer editörlerle de aynı geri plana gönderme yapmanız mümkün.</p>
