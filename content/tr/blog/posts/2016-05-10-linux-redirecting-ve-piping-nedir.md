---
draft: false

title:  'Linux Redirecting ve Piping Nedir?'
date: '2016-05-10T17:42:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bir dosyadaki istediğimiz satırları filtreler yardımıyla tespit ettikten sonra çıktıların varsayılan olarak ekrana yazdırılmakta olduğunu biliyoruz. Yönlendirme (Redirecting ve Piping) kullanarak bu sonuçları istediğimiz başka bir dosyaya veya başka bir komuta girdi olarak yönlendirmemiz mümkündür.' 
 
url:  /tr/linux-redirecting-ve-piping-nedir/
 
featured_image: /images/cyber5.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
---


Metin filtreleri ve Düzenli ifadeleri bu <a href="https://www.siberoloji.com/nasil/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/" target="_blank" rel="noreferrer noopener">yazımızda</a> açıklamıştık. Şimdi ise bunları kullanarak çıktıları yönlendirme ve bu çıktıları başka işlemlere girdi olarak kullanmayı görelim. Bir dosyadaki istediğimiz satırları filtreler yardımıyla tespit ettikten sonra çıktıların varsayılan olarak ekrana yazdırılmakta olduğunu biliyoruz. Yönlendirme (Redirecting ve Piping) kullanarak bu sonuçları istediğimiz başka bir dosyaya veya başka bir komuta girdi olarak yönlendirmemiz mümkündür.



Linux komut satırında çalışırken, her komutun kendisine girdi olarak verilen ve çıktı olarak üretilen verilerle ilgili 3 hali bulunur. Programa bir girdi verdiğinizde bu veri işlenir ve ortaya bir sonuç çıkar. Bu sonuç, arzu edilen çıktı olabileceği gibi bir hata mesajı da olabilir. Hata mesajı da aslında bir çıktı olmasına rağmen, özel bir durum olduğu için farklı ele alınmaktadır.


* 
* STDIN (0) - Standart girdi verisi (Programa işlemesi için tanıtılan veriler)

* STDOUT (1) - Standart çıktı verisi (Sonuç verisidir. Varsayılan olarak ekrana yazılır.)

* STDERR (2) - Standart hata durumu (Hata verisidir. Varsayılan olarak ekrana yazılır.)




Program tarafından üretilen sonuçları, bir dosya veya programa yönlendirerek kullanma işlemine yönlendirme denilmektedir.



Yeni Dosyaya Yönlendirme



Normalde varsayılan olarak ekrana yazdırılan STDOUT yani çıktı, sonradan kullanılmak üzere bir dosya içerisine de kaydedilebilir. Bunu yapabilmek için > işareti ile bir dosya ismi tanımladığınızda sonuç bu dosya içerisine kaydedilir. Dosyanın sistemde olmaması durumunda otomatik olarak oluşturulur. Bu yönlendirme işareti (>) kullanıldığında belirtilen hedef dosya sistemde önceden varsa içeriği temizlenir ve üretilen çıktı dosyaya yazdırılır.



Bunu bir örnek ile açıklayalım. Aşağıdaki örnekte, ev klasöründe redirect isimli bir klasör oluşturulacak ve içerisine metin.txt resim.jpg belge.doc video.mpeg dosyaları oluşturulacaktır. Örneklerde bu dosyaları kullanacağız.


```bash
$ cd 
~$ mkdir redirect 
~$ cd redirect 
~/redirect $ touch metin.txt resim.jpg belge.doc video.mpeg 
~/redirect $ ls 
belge.doc metin.txt resim.jpg video.mpeg
~/redirect $ ls > rapor.txt 
~/redirect $ ls 
belge.doc metin.txt rapor.txt resim.jpg video.mpeg
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg```


#### Açıklamalar



**1.Satır**: cd komutu ile her neredeysek oradan Ev Klasörüne gidildi.



**2.Satır**: mkdir redirect komutu ile redirect isimli klasör oluşturuldu.



**4.Satır**: 4 adet yeni dosya oluşturuldu.



**7.Satır**: ls komutu STDOUT çıktısı rapor.txt dosyasının içerisine yönlendirildi. **ls > rapor.txt**



Örnekte görüldüğü gibi, ls komutunun ekrana yazdırdığı sonuç tek satır olsa da, rapor.txt dosyasında her bir dosya adı ayrı satırlara yazılmıştır. Buradan da anlaşılacağı gibi sonuçları istediğimiz formata çevirip o şekilde dosyaya yazdırabiliriz. En verimli kullanım her bir sonucun bir satıra yazdırılmasıdır.



Dikkatli kullanıcıların fark etmiş olabileceği bir diğer konu da, başlangıçta olmayan rapor.txt dosyasının da sonuçların yazıldığı rapor.txt dosyasının içeriğinde bulunmasıdır. Oysa komutu verdiğimizde (ls > rapor.txt) klasörde bu dosya yoktu. Dosya içeriğinin **belge.doc ****metin.txt resim.jpg ****video.mpeg** isimlerine sahip olması beklenirken **belge.doc ****metin.txt rapor.txt resim.jpg ****video.mpeg** halinde olduğunu görebilirsiniz.



Bu durumu şöyle açıklayalım. ls > rapor.txt komutu, yazım biçimiyle "listemeyi  yap, rapor.txt dosyasına yönledir" sırasıyla çalışacak algısı meydana getirir. Ancak gerçekte Shell akıllı davranır ve komutun hatasız çalışması için gerekli şartları hazırlar. Önce klasör içerine rapor.txt dosyasını oluşturur ve klasörün bu haliyle durumunu ls komut çıktısı olarak rapor.txt dosyasının içerisine yazdırır.



Mevcut Bir Dosyaya Yönlendirme



Bir komut çıktısını > işaretiyle yönlendirdiğimizde, hedef dosyanın içeriğinin silindiğini belirtmiştik. Çıktının, hedef dosyanın içeriği silinmeden, var olan bir dosyanın sonuna ilave edilmesi için >> yönlendirme işaretini kullanabiliriz.



Aynı örnek klasörle devam edelim. Öncelikle echo komutu kullanarak > yönlendirmesiyle **metin.txt** dosyamızın içerisine bir ifade ekleyelim. Sonra cat komutu ile dosya içeriğini görüntüleyelim ve sonucu >> yönlendirmesi kullanarak **rapor.txt** dosyamızın içeriğini silmeden en altına ilave edelim.


```bash
~/redirect $ echo ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin >metin.txt
~/redirect $ cat metin.txt
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
~/redirect $ cat metin.txt >>rapor.txt
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
~/redirect $```



Mevcut Dosyadan Veri Alma



Bir komutun çıktısını dosyaya yönlendirmenin sonrasında, şimdi de bir dosyadan veriyi girdi olarak almayı açıklayalım. Bunun için < işaretini kullanıyoruz. < işaretiyle belirtilen adresten alınan veri, komuta STDIN yani girdi olarak gönderilir.



Aşağıdaki örnekte, wc komutuna, metin.txt dosyasından okuma yapması (**<** ile veri almasını) ve harfleri sayması (-**m** ile ), sonucunu da raport.txt dosyasının sonuna ilave etmesi (**>>** ile) söylenmiştir.


```bash
~/redirect $ wc -m < metin.txt >>rapor.txt
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
70```



Hataları Yönlendirme STDERR(2)



Komutlar için girdi (STDIN(0)) ve normal çıktıları (STDOUT(1)) yönlendirmeden sonra, şimdi de hata kodlarını (STDERR(2)) yönlendirmeye bakalım. Dikkat ederseniz, STDERR hata mesajlarının yanında 2 rakamı bulunmaktadır. Bu rakamın kullanımını örneklerde göreceğiz.



Bir yönlendirme işaretinin önüne 2>> rakamını koyarsanız, o ifade "hatayı yönlendir" anlamına gelir. Boş bırakılması, varsayılan olarak aslında önünde 1 olduğu anlamına gelmektedir.



Aşağıdaki örnekte, redirect/ klasöründeki **belge.doc** ve **met.txt** dosyalarının detayları listelenmek istenmekte ancak iki dosyadan var olan hakkında bilgi verilirken diğer dosya var olmadığı içn hata mesajı üretilmektedir. Üretilen hatayı ayrı bir dosyaya yönlendirmek için 2>hatalar.txt ifadesi kullanılmakta ve hata kodu (STDERR(2)) ayrı bir dosyaya kaydedilmektedir.


```bash
~/redirect $ ls -l belge.doc met.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt 2> hatalar.txt
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
cat hatalar.txt
ls: cannot access met.txt: No such file or directory
```



Yukarıdaki örnekte 2> yönlendirmesiyle komutun sadece hatalı kısmı hatalar.txt dosyasına kaydedilmektedir. Bazı durumlarda, hem standart çıktının (STDOUT(1)) hem de hata kodunun aynı dosyaya kaydedilmesini isteyebiliriz. Bu durumda izlenmesi gereken yol şöyle özetlenebilir. STDERR çıktısını da STDOUT çıktısına yönlendir ve tüm yönlendirmeleri bir dosyaya kaydet.



Aşağıdaki örnekte, 2>&amp;1 yönlendirmesi kullanılmıştır. Bu kullanımda, 2> hata çıktısı &amp;1 kullanılarak STDOUT çıktısına yönlendirilmiş ve toplam sonuç, sonuc.txt dosyasına kaydedilmiştir. &amp;1 kullanımı, bir veri akışına ilave veri eklemekte kullanılır. DİKKAT: &amp; işaretini koymadığınız takdirde, hata kodu 1 isimli dosyaya yönlendirilir.



**ls -l belge.doc met.txt>sonuc.txt** komutunun sonucunda sadece hatasız olarak gerçekleşen kısım sonuc.txt dosyasına yazılır.



**ls -l belge.doc met.txt>sonuc.txt 2>&amp;1** komutu sayesinde hata kodu ve hatasız kısım birleştirilir ve sonuc.txt dosyasına yazılır.


```bash
~/redirect $ ls -l belge.doc met.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt>sonuc.txt
ls: cannot access met.txt: No such file or directory
~/redirect $ cat sonuc.txt  
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt>sonuc.txt 2>&amp;1 #Hem hata hem de normal sonuç sonuc.txt dosyasına yazılmış.
~/redirect $ cat sonuc.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $```



Piping



Türkçe karşılığı ile tam anlamını bulmayan piping işlemi, bir programın çıktısını** dosya yerine başka bir programa yönlendirme** ile ilgilidir. Bunun yapılabilmesi için | işareti kullanılır. Bu işareti klavyelerinizde Sol taraftaki Shift tuşunun yanında bulunan <> işaretleri ile aynı tuş üzerinde bulabilirsiniz. AltGr tuşu ile birlikte <> tuşuna bastığınızda ekrana yazılır. Bu | işaretin tam olarak yaptığı, sol taraftaki programın çıktısını sağ taraftaki programa girdi olarak aktarmaktır.



Aşağıdaki örneklerde, önceden yaptığımız alıştırmalarda kullanılan klasör kullanılmaya devam ediliyor.



**Örnek-1**


```bash
~/redirect $ ls 
belge.doc hatalar.txt metin.txt rapor.txt resim.jpg sonuc.txt video.mpeg
~/redirect $ ls | head -3 #Klasör içeriğinin çıktısı head komutuna girdi olarak gönderiliyor.
belge.doc
hatalar.txt
metin.txt```



**Örnek-2**



Buradaki örnekte piping 2 defa kullanılmıştır. ls komut çıktısı head komutuna ve onun çıktısı ise tail komutuna yönlendirilmiştir.


```bash
ls | head -3 | tail -1
metin.txt```



**TAVSİYE**:Bu yönlendirme teknikleri kullanılırken en sık karşılaşılan hatalardan birisi de tüm komutu bir seferde yazmaya çalışmaktır. Sonuçta elde edilen çıktı, arzu edilen sonuç olmadığında, nerede hata yapıldığı ile uzun zaman geçirilmektedir. Bu tür zaman kaybını önlemek için, inşa edeceğiniz yönlendirme ve filtreleri adım adım deneyerek artırmak suretiyle son haline doğru gider ve her aşamada çıktı kontrolü yaparsanız, yavaş ilerlemiş olsanız da hatalar için geri dönmeyle uğraşmazsınız.



Piping işlemini dosya yönlendirme ile birlikte de kullanabilirsiniz.


```bash
ls | head -3 | tail -1 > piping.txt
cat piping.txt
metin.txt
```



**Örnek-3**



Bu örnekte, Ev klasörümüzde bulunan ve grup yetkilerine göre (read-only) özellikteki dosya ve klasörleri listeletiyoruz. ls komutunun çıktısını grep komutuna girdi olarak yönlendiriyoruz. grep komutunda oluşturduğumuz düzenli ifade ile filtre uygulayarak sonucu ekrana yazdırıyoruz.


```bash
ls -l ~ | grep '^....r'
-rw-r--r-- 1 umut umut 2806 Dec 6 18:13 portscan.html
drwxr-xr-x 2 umut umut 4096 Nov 18 23:22 Public
drwxr-xr-x 4 umut umut 4096 May 10 11:58 redirect```



Aşağıdaki komutu sizlerin incelemesine bırakıyoruz. Ne işlemler yapıldığını komutu parçalara ayırarak inceleyebilirsiniz. Sonuç her bilgisayarda farklı çıkacaktır. (tail, sed, cut, sort ve uniq için <a href="https://www.siberoloji.com/nasil/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/" target="_blank" rel="noreferrer noopener">bakınız</a>.)


```bash
ls -l /home | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq -c
1 kids
1 root
1 linux```



Arşivinizde bulunan kullanışlı düzenli ifade ve yönlendirme örneklerini bizimle paylaşırsanız burada yayınlayabiliriz.
