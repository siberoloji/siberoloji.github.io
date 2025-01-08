---
draft: false

title:  'Linux Terminalde İşlemi Arka Plana Gönderme (Ctrl+Z ve fg)'
date: '2016-04-23T16:24:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/linux-terminalde-islemi-arka-plana-gonderme-ctrlz-ve-fg/
 
featured_image: /images/cyber10.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---


Shell varsa çözüm mutlaka vardır, sadece siz henüz bilmiyor olabilirsiniz. Yaşadığınız bir problem veya size zor gelen bir işlemi, emin olun ki başkaları da yaşamıştır. Bunlardan bir kısmı, işin kolayını bulmuştur. Bir kısmı umursamamıştır. Bir kısmı da bu yazıda olduğu gibi öğrenip paylaşmak istemiştir.



Terminalde komutlar ile işlemlerinizi yaparken, nano editör ile bir dosya içerisinde (resolv.conf vb.) düzeltmeler yapmak istediniz. Bu durumda, komut satırına `sudo nano belgeninadı` yazıp editöre girersiniz. Editöre girdiğinizde komut satırı artık kaybolmuştur. Çalıştığınız dosyada işiniz bitmediği halde, komut satırında da bir işlem yapmak isterseniz ne yapmalısınız?



**1.Yol:** Yeni bir TAB-sekme açarım.



**2.Yol:** Ctrl+O ile belgeyi kaydeder, Ctrl+X ile çıkarım. Terminalde komutu yazar, çalıştırır ve sonra tekrar nano editörü açarım.



**3.Yol:** Diğer



Bu seçeneklerden birincisi, görsel bir masaüstü ile çalışıyorsanız olabilir fakat ssh ile bağlandığınız uzak sunucuda bu mümkün olmayabilir. İkinci seçenek ise bilgisayarın icat edildiği ilk çağlardan kalma bir yöntem gibi görünüyor. Bu sorunu çözmenin kısa ve hızlı bir yolu mutlaka olmalı.



İşte böyle kaydet-çık-tekrar gir işlemlerinden sıkılan geliştiriciler Ctrl+Z tuş kombinasyonu ve fg komutunu geliştirmişler. Bu sayede, çalışan editörü, çıkmadan geri plana gönderip tekrar komut satırına geçmeniz mümkün. Hatta, komut satırından, editörde başka bir belge açmanız ve onu da arka plana göndermeniz mümkün. İki açık belgeyi arka plana gönderdikten sonra başka bir belge açıp onu da arka plana göndermeniz ……. diye hikaye böyle devam eder.



**Nasıl mı?**



1.Adım: Önce deneme1.txt, deneme2.txt ve deneme3.txt dosyaları oluşturalım.


```bash
**>**~$ cd /tmp/
/tmp$ echo 'Selam, ben 0 numaralı belgeyim' **>**deneme1.txt
/tmp$ echo 'Selam, ben 2 numaralı belgeyim' **>**deneme2.txt
/tmp$ echo 'Selam, ben 3 numaralı belgeyim' **>**deneme3.txt
```



2.Adım: Nano editör ile belgeleri açıp Ctrl+z tuşları ile arka plana gönderiyoruz. Bu sayede belge kapatılmadan tekrar komut satırına ulaşmış oluyoruz.


```bash
**>**/tmp$ nano deneme1.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
1 txt

/tmp$ nano deneme2.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
2 txt

/tmp$ nano deneme3.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
3 txt
```



Aşağıda da görüldüğü gibi, her Ctrl+Z tuş kombinasyonu ile arka plana gönderilen işlemin yanına bir numara verilir. Bu sayı, söz konusu arka plan görevini geri çağırmanız için kullanılır.


```bash
4 txt
```



3.Adım: Şimdi arka plana gönderdiğimiz bir görevi geri çağıralım. Bunun için `fg` komutunu kullanıyoruz. Zaten ekran çıktılarında da shell bize nano’ya dönmek için fg kullanın diye söylüyor.



Komut satırına sadece fg yazarsanız en son kapatılan işleme geri dönersiniz. Ancak siz 1 numaralı işleme geri gitmek isteseniz fg 1 komutu vermeniz yeterli olacaktır.


```bash
**>**$ fg 1
```



Düzenleme:(10.05.2017) Arka planda çalışan tüm işlemleri görmek isterseniz `jobs` komutunu kullanabilirsiniz.



Bu yazıda nano editör üzerinden konu anlatılsa da vi veya diğer editörlerle de aynı geri plana gönderme yapmanız mümkün.
