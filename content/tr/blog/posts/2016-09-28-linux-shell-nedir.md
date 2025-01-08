---
draft: false

title:  'Linux Shell Nedir?'
date: '2016-09-28T18:03:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux işletim sisteminin yapısında, bilgisayarın donanımı ile iletişim kuran yazılıma Kernel (Kabuk) adı verilmektedir. Kullanıcı, doğrudan donanım ile iletişim kuramaz. Kernel e bir komut göndermek ve işlemlerin yapılmasını sağlamak gerekmektedir. Kullanıcı ile Kernel arasında haberleşme, Shell ismi verilen aracı program sayesinde yapılır.' 
 
url:  /tr/linux-shell-nedir/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Temel Linux'
tags:
    - linux
    - 'temel linux'
---


Shell Nedir?



Linux işletim sisteminin yapısında, bilgisayarın donanımı ile iletişim kuran yazılıma Kernel (Kabuk) adı verilmektedir. Kullanıcı, doğrudan donanım ile iletişim kuramaz. Kernel e bir komut göndermek ve işlemlerin yapılmasını sağlamak gerekmektedir. Kullanıcı ile Kernel arasında haberleşme, Shell ismi verilen aracı program sayesinde yapılır.



1960 yılllarında geliştirilen bilgisayarda dahi bu aracı komut yazılımı bulunmaktaydı. 1970 yıllarında Unix Version 7 için Stephen L. Bourne tarafından geliştirilen Shell, geliştiricisinin ismiyle birlikte Bourne Shell olarak anılmaktadır. Berkley, Kaliforniya Üniversitesinde C diliyle geliştirlen C Shell ve AT&amp;T Laboratuvarlarında geliştirilen Korn Shell, tarihsel gelişimine devam etmiştir. Free Software Foundation projesi olan GNU projesi kapsamında geliştirlen Shell ise C ve Korn Shell özelliklerini toplayarak ortaya çıkmıştır. Bu yeni Shell ismine Bourne Again Shell ifadesinin kısaltması olan BASH adı verilmiştir. BASH, günümüzde bir çok Linux dağıtımının kullandığı Shell programının kullanıcıya görünen kısmıdır.



Shell, komutları satırdan kullanıcı girişi ile okuyabildiği gibi toplu bir komutlar dosyasından da okuyarak sırayla yerine getirebilir. Bu toplu komut dosyaları, Shell Scripts olabileceği gibi normal dosyalar da olabilir.



Temel olarak Shell aşağıdaki işlemleri sırasıyla yapan bir döngüye sahiptir.


*  Komutu, komut satırından veya dosyadan oku

* Komutu değerlendir.

* Komutu çalıştır veya gerekli programı çalıştır.

* Sonucu ekrana veya istenen yere yazdır.

* Birinci adıma geri dön.




Shell Nasıl Görünür?



Shell, açıldığında prompt olarak ifade edilen yerde durur ve komutun girilmesini bekler. Burada kullanıcıya kısa bir bilgi veren bir satır vardır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">linuks@egitim ~$></pre>
<!-- /wp:preformatted -->


**Açıklama**:



linuks: Kullanıcı adını gösterir.



egitim: bilgisayarın host adıdır.



~ işareti: Şu an bulunan klasörü gösteren bölümdür ve ilk açıldığında ~ işaretiyle Home klasörünü gösterir.



$ karakteri: Kullanıcının yetki düzeyini haber verir. $ olduğunda normal kullanıcı, # olduğunda süper yetkili kullanıcı olduğunu gösterir.



Komut Yapısı



Linux içerisinde bir komutun nasıl kullanılacağını gösteren şablona syntax adı verilir. Syntax, genel olarak 3 elemandan oluşur.



**Komut [parametreler-seçenekler] argümanlar**


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">touch -t dosya.txt
</pre>
<!-- /wp:preformatted -->


Açıklama:



touch: Kullanılan komuttur.



-t: kullanılan parametredir.



Dosya.txt: argümandır.



**Komut**: (**Ne yapılacak?)**Bir işlemin yapılması için kullanıcının hizmetine sunulan programdır. Komutlar Linux içerisinde bir kısım klasörlerde tutulur ve çalıştırılmak için kullanıcının çağırmasını beklerler. Burada iki ayrımdan bahsetmek gerekmektedir.



1. Komutlar, normal kullanıcının kullanabileceği ve yetkili kullanıcıların kullanabileceği komutlar olarak ayrıma tabi tutulurlar. Bu ayırıma göre sistemde (/bin /sbin vb.) farklı klasörlerde bulunurlar.



2. Komutların bir kısmı, Shell tarafından içerisinde gömülü olarak sunulurlar. Bunların sistemde kayıt edildiği ayrı bir dosyası yoktur. Örneğin cd komutu buna örnektir. Bu durumda Shell komutları harici ve dahili komutlar olarak ikiye ayırır.



Bir komutun harici veya dahili olup olmadığını anlamak için type komutu kullanılır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ type echo
echo is a shell builtin #Dahili komuttur.
$ type date
date is /bin/date #Harici komuttur ve kayıtlı adresi gösterilir.</pre>
<!-- /wp:preformatted -->


**Parametreler-Seçenekler**: (**Nasıl Yapılacak?)**Bir komutun iş yapma şeklini etkileyen ifadelerdir. Kullanılırken – (tire) ile başlarlar. Her komutun farklı parametre seçenekleri bulunur. Bunları listeleyebilmek için [komut - - help] formatı kullanıldığında ilgili komutun kısa bir yardım metni ekranda görüntülenir ve parametre vb. Temel açıklamalar kullanıcıya özetlenir.



**Argümanlar**: (**Üzerinde çalışılacak dosya nedir?****) **Komutun kendisi ve parametreleri yazıldıktan sonra üzerinde işlem yapılacak dosya veya ifadelere Argüman adı verilmektedir. Baş tarafına – (tire) işareti koymaya gerek yoktur.



Tüm komutlar girilirken elemanlar boşluklarla ayrılır. Boşluk sayısının Shell için önemi yoktur. Komutun anlaşılması ve kullanıcı gözüne uygun görünmesi için tek boşluk kullanımı genel kabul görmüştür.



$ echo



Echo komutu, kendisine verilen argüman veya parametreye göre kullanıcıya geri bildirimde bulunan bir komuttur. Echo komutuna bir string metin argümanı gönderirseniz aynen ekrana geri yazar. Sistemde bulunan bir değişken adını gönderirseniz, değişkenin o anda sahip olduğu değeri ekrana yazdırır. Girilen parametre bir sistem değişkeni ise baş tarafına $ işareti koyulduğuna dikkat edilmelidir. Aşağıda örnekleri görelim.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ echo merhaba, nasılsınız?
Merhaba, nasılsınız?
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games</pre>
<!-- /wp:preformatted -->


Yukarıda PATH değişkeninin değerlerin listelenmiştir. Aralarında : ile ayrılan ifadeler, PATH değişkeninde tutulan klasör adresleridir. Bu adresler, kullanıcının komut satırına bir komut yazdığında aranacak yollarını gösterir.



Shell bir komut girildiğinde öncelikle dahili komut ise kendi dahili komutunu çalıştırır. Dahili komut değilse yazılan komut için önce /usr/local/sbin klasörüne bakar. Bulunamadığı takdirde sıradaki diğer klasöre bakılır. Bu değişken sayesinde kullanıcının bütün komutların hangi klasörde tutulduğunu ezberlemesinin önüne geçilmiş olmaktadır.



Bazı programlar yüklendiğinde güvenlik nedeniyle, yukarıda bulunan klasörler dışında başka bir adrese kaydedilirler. Bu adresler, kurulum esnasında kullanıcıya bildirilir. Eğer PATH değişkeninde bulunan adresler dışında bir komut çalıştırılmak istenirse, tam adresi yazılmalıdır.



$ history



Shell aracılığı ile komutlar sisteme gönderildiğinde, geçmiş komutlar sisteme kayıt edilir. Örneğin, geçmişte kullandığımız bir komut ezberimizde olmayabilir. Bu komutu tekrar kullanmak için, history komutunu ve kabiliyetlerini kullanabilirsiniz.



Kayıtlı bulunan tüm geçmişi listelemek için history komutunu kullanırken, istediğiniz sayıda geçmiş komutu da rakamsal olarak girerek listeletebilirsiniz. Aşağıdaki örnekte en son girilen 10 komut listelenmiştir.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">linuks@egitim:~/linux$ history 10 
1994 set +u
1995 ls
1996 echo merhaba >dosya1.txt
1997 cat dosya1.txt
1998 clear
1999 touch dosya123
2000 touch dosya456
2001 cat dosya123
2002 touch dosya456
2003 history 10
linuks@egitim:~/linux$</pre>
<!-- /wp:preformatted -->


Değişkenler



Değişkenler, hafızada ayrılan bölümde kendisine atanan değeri tutan veri kayıt alanlarıdır. Adından da anlaşıldığı gibi değişkendirler ve tuttukları veriler değişebilir. Örneğin bir matematik işleminde sonuç birinci işlemde 12 ise sonuc=12 olarak ifade edilir. Burada sonuc ifadesi değişkenin adını, 12 ise değişkenin o anda tutulan değeridir. Sonuc=9 dediğinizde değişkenin adı sabit kaldır ve tuttuğu değer değişir.



Linux Shell kullanımında değişkenleri ikiye ayırır.



**Shell değişkeni**: O anda çalışılan shell ortamında kullanılan ve diğer proseslerce tanınmayan değişkenlerdir. Programlamada kullanılan public ve private ifadelerine benzetilebilirler.



**Enviromental değişken**: Bir değişkeni bir alt prosese veya sisteminin tamamına tanıttığınızda ise artık değişken Enviromental durumuna getirilmiş olur ve değişkenin tuttuğu değer yeni Shell ortamına veya başka programların kullanımına aktarılabilir.


#### Değişken Tanımlama


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ foo=bar 	#foo değişkeninin değeri bar olarak tanımlandı.
$ echo foo	#echo komutu ile foo ifadesi ekrana yazdırıldı.
foo		#Değişkenin değerinin yazdırılmadığına dikkat edin.
$ echo $foo	#foo değişkeninin hafızada tutulan değeri istendi.
bar		#foo değişkeninin değeri ekrana yazdırıldı.</pre>
<!-- /wp:preformatted -->

#### $ export



Shell değişkenlerinin diğer prosesler tarafından enviromental değişken haline getirilmesi gerektiğini yukarıda ifade etmiştik. Sistemde tanımlı tüm enviromental değişkenler otomatikman Shell tarafından tanınırlar. Doayısı ile Enviromental değişkenlerin Shell değişkeni haline getirilmelerine gerek yoktur.



Bir Shell değişkenini, enviromental değişken haline getirmek için export komutu kullanılmaktadır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ foo=bar	#foo isimli shell değişkeninin değeri bar olarak tanımlandı
$ export foo	#foo değişkeni export komutu ile enviromental değişken haline getirildi.
$ export foo=bar #Değişken tek satırda tanımlanıp enviromental değişken haline getirilebilir.</pre>
<!-- /wp:preformatted -->

#### Tırnak içi ifadeler



Shell içerisinde çalışırken kullanılan syntax yapısında önemli bir nokta da tırnak içinde belirtilen ifadelerdir. ' ' tek tırnak ve “ “ çift tırnak işaretleri ile belirtilen ifadeler ile tırnak kullanılmadan belirtilen ifadeler Shell tarafından farklı algılanırlar.  Aşağıdaki örnekte tek ve çift tırnak arasında fark yok gibi görünse de bir takım kullanımlarda farklılıkları bulunmaktadır. m.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ touch New File #New ve File isminde iki dosya oluşturulur. 
$ touch 'New File' #New File isminde tek bir dosya oluşturulur. 
$ touch “Yeni Dosya” #Yeni Dosya isminde tek bir dosya oluşturulur.</pre>
<!-- /wp:preformatted -->