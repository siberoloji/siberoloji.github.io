---
layout: post
title: Linux Redirecting ve Piping Nedir?
date: 2016-05-10 16:54:14.000000000 +03:00
type: post
img: cyber5.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- linux komutları
- linux piping
- linux redirecting
- Linux STDERR
- Linux STDIN
- Linux STDOUT

---
<p lang="tr-TR">Metin filtreleri ve Düzenli ifadeleri bu <a href="https://www.siberoloji.com/nasil/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/" target="_blank">yazımızda</a> açıklamıştık. Şimdi ise bunları kullanarak çıktıları yönlendirme ve bu çıktıları başka işlemlere girdi olarak kullanmayı görelim. Bir dosyadaki istediğimiz satırları filtreler yardımıyla tespit ettikten sonra çıktıların varsayılan olarak ekrana yazdırılmakta olduğunu biliyoruz. Yönlendirme (Redirecting ve Piping) kullanarak bu sonuçları istediğimiz başka bir dosyaya veya başka bir komuta girdi olarak yönlendirmemiz mümkündür.</p>
<p lang="tr-TR">Linux komut satırında çalışırken, her komutun kendisine girdi olarak verilen ve çıktı olarak üretilen verilerle ilgili 3 hali bulunur. Programa bir girdi verdiğinizde bu veri işlenir ve ortaya bir sonuç çıkar. Bu sonuç, arzu edilen çıktı olabileceği gibi bir hata mesajı da olabilir. Hata mesajı da aslında bir çıktı olmasına rağmen, özel bir durum olduğu için farklı ele alınmaktadır.</p>
<ul>
<li>
<p lang="tr-TR" align="left">STDIN (0) - Standart girdi verisi (Programa işlemesi için tanıtılan veriler)</p>
</li>
<li>
<p lang="tr-TR" align="left">STDOUT (1) - Standart çıktı verisi (Sonuç verisidir. Varsayılan olarak ekrana yazılır.)</p>
</li>
<li>
<p lang="tr-TR" align="left">STDERR (2) - Standart hata durumu (Hata verisidir. Varsayılan olarak ekrana yazılır.)</p>
</li>
</ul>
<p lang="tr-TR">Program tarafından üretilen sonuçları, bir dosya veya programa yönlendirerek kullanma işlemine yönlendirme denilmektedir.</p>
<h3 class="western" lang="tr-TR">Yeni Dosyaya Yönlendirme</h3>
<p>Normalde varsayılan olarak ekrana yazdırılan STDOUT yani çıktı, sonradan kullanılmak üzere bir dosya içerisine de kaydedilebilir. Bunu yapabilmek için &gt; işareti ile bir dosya ismi tanımladığınızda sonuç bu dosya içerisine kaydedilir. Dosyanın sistemde olmaması durumunda otomatik olarak oluşturulur. Bu yönlendirme işareti (&gt;) kullanıldığında belirtilen hedef dosya sistemde önceden varsa içeriği temizlenir ve üretilen çıktı dosyaya yazdırılır.</p>
<p>Bunu bir örnek ile açıklayalım. Aşağıdaki örnekte, ev klasöründe redirect isimli bir klasör oluşturulacak ve içerisine <em>metin.txt resim.jpg belge.doc video.mpeg</em> dosyaları oluşturulacaktır. Örneklerde bu dosyaları kullanacağız.</p>
<pre class="lang:sh decode:true ">$ cd 
~$ mkdir redirect 
~$ cd redirect 
~/redirect $ touch metin.txt resim.jpg belge.doc video.mpeg 
~/redirect $ ls 
belge.doc metin.txt resim.jpg video.mpeg
~/redirect $ ls &gt; rapor.txt 
~/redirect $ ls 
belge.doc metin.txt rapor.txt resim.jpg video.mpeg
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg</pre>
<h4 class="western">Açıklamalar</h4>
<p class="lang:sh decode:true "><strong>1.Satır</strong>: cd komutu ile her neredeysek oradan Ev Klasörüne gidildi.</p>
<p class="lang:sh decode:true "><strong>2.Satır</strong>: mkdir redirect komutu ile redirect isimli klasör oluşturuldu.</p>
<p class="lang:sh decode:true "><strong>4.Satır</strong>: 4 adet yeni dosya oluşturuldu.</p>
<p class="lang:sh decode:true "><strong>7.Satır</strong>: ls komutu STDOUT çıktısı rapor.txt dosyasının içerisine yönlendirildi. <strong>ls &gt; rapor.txt</strong></p>
<p>Örnekte görüldüğü gibi, ls komutunun ekrana yazdırdığı sonuç tek satır olsa da, rapor.txt dosyasında her bir dosya adı ayrı satırlara yazılmıştır. Buradan da anlaşılacağı gibi sonuçları istediğimiz formata çevirip o şekilde dosyaya yazdırabiliriz. En verimli kullanım her bir sonucun bir satıra yazdırılmasıdır.</p>
<p><span lang="tr-TR">Dikkatli kullanıcı</span><span lang="tr-TR">l</span><span lang="tr-TR">arın fark etmiş olabileceği bir diğer konu da, başlangıçta olmayan rapor.txt dosyasının da sonuçların yazıldığı rapor.txt dosyasının içeriğinde bulunmasıdır. Oysa komutu verdiğimizde (ls &gt; rapor.txt) klasörde bu dosya yoktu. Dosya içeriğinin </span><span lang="tr-TR"><b>belge.doc </b></span><b>metin.txt resim.jpg </b><span lang="tr-TR"><b>video.mpeg</b></span> <span lang="tr-TR">isimlerine sahip olması beklenirken </span><span lang="tr-TR"><b>belge.doc </b></span><b>metin.txt rapor.txt resim.jpg </b><span lang="tr-TR"><b>video.mpeg</b></span><span lang="tr-TR"> halinde olduğunu görebilirsiniz. </span></p>
<p>Bu durumu şöyle açıklayalım. ls &gt; rapor.txt komutu, yazım biçimiyle "listemeyi  yap, rapor.txt dosyasına yönledir" sırasıyla çalışacak algısı meydana getirir. Ancak gerçekte Shell akıllı davranır ve komutun hatasız çalışması için gerekli şartları hazırlar. Önce klasör içerine rapor.txt dosyasını oluşturur ve klasörün bu haliyle durumunu ls komut çıktısı olarak rapor.txt dosyasının içerisine yazdırır.</p>
<h3 class="western">Mevcut Bir Dosyaya Yönlendirme</h3>
<p>Bir komut çıktısını &gt; işaretiyle yönlendirdiğimizde, hedef dosyanın içeriğinin silindiğini belirtmiştik. Çıktının, hedef dosyanın içeriği silinmeden, var olan bir dosyanın sonuna ilave edilmesi için &gt;&gt; yönlendirme işaretini kullanabiliriz.</p>
<p>Aynı örnek klasörle devam edelim. Öncelikle echo komutu kullanarak &gt; yönlendirmesiyle <b>metin.txt</b> dosyamızın içerisine bir ifade ekleyelim. Sonra cat komutu ile dosya içeriğini görüntüleyelim ve sonucu &gt;&gt; yönlendirmesi kullanarak <strong>rapor.txt</strong> dosyamızın içeriğini silmeden en altına ilave edelim.</p>
<pre class="lang:sh decode:true">~/redirect $ echo ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin &gt;metin.txt
~/redirect $ cat metin.txt
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
~/redirect $ cat metin.txt &gt;&gt;rapor.txt
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
~/redirect $</pre>
<h3 class="western">Mevcut Dosyadan Veri Alma</h3>
<p>Bir komutun çıktısını dosyaya yönlendirmenin sonrasında, şimdi de bir dosyadan veriyi girdi olarak almayı açıklayalım. Bunun için &lt; işaretini kullanıyoruz. &lt; işaretiyle belirtilen adresten alınan veri, komuta STDIN yani girdi olarak gönderilir.</p>
<p>Aşağıdaki örnekte, wc komutuna, metin.txt dosyasından okuma yapması (<b>&lt;</b> ile veri almasını) ve harfleri sayması (-<b>m</b> ile ), sonucunu da raport.txt dosyasının sonuna ilave etmesi (<b>&gt;&gt;</b> ile) söylenmiştir.</p>
<pre class="lang:java decode:true">~/redirect $ wc -m &lt; metin.txt &gt;&gt;rapor.txt
~/redirect $ cat rapor.txt
belge.doc
metin.txt
rapor.txt
resim.jpg
video.mpeg
ben metin.txt dosyasıyım. Beni rapor.txt dosyasının sonuna ilave edin
70</pre>
<h3 class="western">Hataları Yönlendirme STDERR(2)</h3>
<p>Komutlar için girdi (STDIN(0)) ve normal çıktıları (STDOUT(1)) yönlendirmeden sonra, şimdi de hata kodlarını (STDERR(2)) yönlendirmeye bakalım. Dikkat ederseniz, STDERR hata mesajlarının yanında 2 rakamı bulunmaktadır. Bu rakamın kullanımını örneklerde göreceğiz.</p>
<p>Bir yönlendirme işaretinin önüne 2&gt;&gt; rakamını koyarsanız, o ifade "hatayı yönlendir" anlamına gelir. Boş bırakılması, varsayılan olarak aslında önünde 1 olduğu anlamına gelmektedir.</p>
<p>Aşağıdaki örnekte, redirect/ klasöründeki <strong>belge.doc</strong> ve <strong>met.txt</strong> dosyalarının detayları listelenmek istenmekte ancak iki dosyadan var olan hakkında bilgi verilirken diğer dosya var olmadığı içn hata mesajı üretilmektedir. Üretilen hatayı ayrı bir dosyaya yönlendirmek için 2&gt;hatalar.txt ifadesi kullanılmakta ve hata kodu (STDERR(2)) ayrı bir dosyaya kaydedilmektedir.</p>
<pre class="lang:sh decode:true">~/redirect $ ls -l belge.doc met.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt 2&gt; hatalar.txt
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
cat hatalar.txt
ls: cannot access met.txt: No such file or directory</pre>
<p>Yukarıdaki örnekte 2&gt; yönlendirmesiyle komutun sadece hatalı kısmı hatalar.txt dosyasına kaydedilmektedir. Bazı durumlarda, hem standart çıktının (STDOUT(1)) hem de hata kodunun aynı dosyaya kaydedilmesini isteyebiliriz. Bu durumda izlenmesi gereken yol şöyle özetlenebilir. STDERR çıktısını da STDOUT çıktısına yönlendir ve tüm yönlendirmeleri bir dosyaya kaydet.</p>
<p>Aşağıdaki örnekte, 2&gt;&amp;1 yönlendirmesi kullanılmıştır. Bu kullanımda, 2&gt; hata çıktısı &amp;1 kullanılarak STDOUT çıktısına yönlendirilmiş ve toplam sonuç, sonuc.txt dosyasına kaydedilmiştir. &amp;1 kullanımı, bir veri akışına ilave veri eklemekte kullanılır. DİKKAT: &amp; işaretini koymadığınız takdirde, hata kodu 1 isimli dosyaya yönlendirilir.</p>
<p class="lang:sh decode:true "><strong>ls -l belge.doc met.txt&gt;sonuc.txt</strong> komutunun sonucunda sadece hatasız olarak gerçekleşen kısım sonuc.txt dosyasına yazılır.</p>
<p class="lang:sh decode:true "><strong>ls -l belge.doc met.txt&gt;sonuc.txt 2&gt;&amp;1</strong> komutu sayesinde hata kodu ve hatasız kısım birleştirilir ve sonuc.txt dosyasına yazılır.</p>
<pre class="lang:sh decode:true">~/redirect $ ls -l belge.doc met.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt&gt;sonuc.txt
ls: cannot access met.txt: No such file or directory
~/redirect $ cat sonuc.txt  
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $ ls -l belge.doc met.txt&gt;sonuc.txt 2&gt;&amp;1 #Hem hata hem de normal sonuç sonuc.txt dosyasına yazılmış.
~/redirect $ cat sonuc.txt
ls: cannot access met.txt: No such file or directory
-rw-r--r-- 1 umut umut 0 May 9 22:05 belge.doc
~/redirect $</pre>
<h3 class="western">Piping</h3>
<p>Türkçe karşılığı ile tam anlamını bulmayan piping işlemi, bir programın çıktısını<strong> dosya yerine başka bir programa yönlendirme</strong> ile ilgilidir. Bunun yapılabilmesi için | işareti kullanılır. Bu işareti klavyelerinizde Sol taraftaki Shift tuşunun yanında bulunan &lt;&gt; işaretleri ile aynı tuş üzerinde bulabilirsiniz. AltGr tuşu ile birlikte &lt;&gt; tuşuna bastığınızda ekrana yazılır. Bu | işaretin tam olarak yaptığı, sol taraftaki programın çıktısını sağ taraftaki programa girdi olarak aktarmaktır.</p>
<p>Aşağıdaki örneklerde, önceden yaptığımız alıştırmalarda kullanılan klasör kullanılmaya devam ediliyor.</p>
<p><strong>Örnek-1</strong></p>
<pre class="lang:sh decode:true">~/redirect $ ls 
belge.doc hatalar.txt metin.txt rapor.txt resim.jpg sonuc.txt video.mpeg
~/redirect $ ls | head -3 #Klasör içeriğinin çıktısı head komutuna girdi olarak gönderiliyor.
belge.doc
hatalar.txt
metin.txt</pre>
<p><strong>Örnek-2</strong></p>
<p>Buradaki örnekte piping 2 defa kullanılmıştır. ls komut çıktısı head komutuna ve onun çıktısı ise tail komutuna yönlendirilmiştir.</p>
<pre class="lang:sh decode:true">ls | head -3 | tail -1
metin.txt</pre>
<p><strong>TAVSİYE</strong>:Bu yönlendirme teknikleri kullanılırken en sık karşılaşılan hatalardan birisi de tüm komutu bir seferde yazmaya çalışmaktır. Sonuçta elde edilen çıktı, arzu edilen sonuç olmadığında, nerede hata yapıldığı ile uzun zaman geçirilmektedir. Bu tür zaman kaybını önlemek için, inşa edeceğiniz yönlendirme ve filtreleri adım adım deneyerek artırmak suretiyle son haline doğru gider ve her aşamada çıktı kontrolü yaparsanız, yavaş ilerlemiş olsanız da hatalar için geri dönmeyle uğraşmazsınız.</p>
<p>Piping işlemini dosya yönlendirme ile birlikte de kullanabilirsiniz.</p>
<pre class="lang:sh decode:true">ls | head -3 | tail -1 &gt; piping.txt
cat piping.txt
metin.txt
</pre>
<p><strong>Örnek-3</strong></p>
<p>Bu örnekte, Ev klasörümüzde bulunan ve grup yetkilerine göre (read-only) özellikteki dosya ve klasörleri listeletiyoruz. ls komutunun çıktısını grep komutuna girdi olarak yönlendiriyoruz. grep komutunda oluşturduğumuz düzenli ifade ile filtre uygulayarak sonucu ekrana yazdırıyoruz.</p>
<pre class="lang:sh decode:true">ls -l ~ | grep '^....r'
-rw-r--r-- 1 umut umut 2806 Dec 6 18:13 portscan.html
drwxr-xr-x 2 umut umut 4096 Nov 18 23:22 Public
drwxr-xr-x 4 umut umut 4096 May 10 11:58 redirect</pre>
<p>Aşağıdaki komutu sizlerin incelemesine bırakıyoruz. Ne işlemler yapıldığını komutu parçalara ayırarak inceleyebilirsiniz. Sonuç her bilgisayarda farklı çıkacaktır. (tail, sed, cut, sort ve uniq için <a href="https://www.siberoloji.com/nasil/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/" target="_blank">bakınız</a>.)</p>
<pre class="lang:sh decode:true">ls -l /home | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq -c
1 kids
1 root
1 linux</pre>
<p>Arşivinizde bulunan kullanışlı düzenli ifade ve yönlendirme örneklerini bizimle paylaşırsanız burada yayınlayabiliriz.</p>
