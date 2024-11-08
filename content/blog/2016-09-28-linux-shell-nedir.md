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
date: "2016-09-28T18:03:00Z"
excerpt: Linux işletim sisteminin yapısında, bilgisayarın donanımı ile iletişim kuran
  yazılıma Kernel (Kabuk) adı verilmektedir. Kullanıcı, doğrudan donanım ile iletişim
  kuramaz. Kernel e bir komut göndermek ve işlemlerin yapılmasını sağlamak gerekmektedir.
  Kullanıcı ile Kernel arasında haberleşme, Shell ismi verilen aracı program sayesinde
  yapılır.
guid: https://www.siberoloji.com/?p=1097
id: 1097
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux
- temel linux
title: Linux Shell Nedir?
url: /tr/linux-shell-nedir/
---

<!-- wp:heading {"level":3} -->
 ### Shell Nedir?</h3>
<!-- /wp:heading -->

  Linux işletim sisteminin yapısında, bilgisayarın donanımı ile iletişim kuran yazılıma Kernel (Kabuk) adı verilmektedir. Kullanıcı, doğrudan donanım ile iletişim kuramaz. Kernel e bir komut göndermek ve işlemlerin yapılmasını sağlamak gerekmektedir. Kullanıcı ile Kernel arasında haberleşme, Shell ismi verilen aracı program sayesinde yapılır.</p>
 

  1960 yılllarında geliştirilen bilgisayarda dahi bu aracı komut yazılımı bulunmaktaydı. 1970 yıllarında Unix Version 7 için Stephen L. Bourne tarafından geliştirilen Shell, geliştiricisinin ismiyle birlikte Bourne Shell olarak anılmaktadır. Berkley, Kaliforniya Üniversitesinde C diliyle geliştirlen C Shell ve AT&amp;T Laboratuvarlarında geliştirilen Korn Shell, tarihsel gelişimine devam etmiştir. Free Software Foundation projesi olan GNU projesi kapsamında geliştirlen Shell ise C ve Korn Shell özelliklerini toplayarak ortaya çıkmıştır. Bu yeni Shell ismine Bourne Again Shell ifadesinin kısaltması olan BASH adı verilmiştir. BASH, günümüzde bir çok Linux dağıtımının kullandığı Shell programının kullanıcıya görünen kısmıdır.</p>
 

  Shell, komutları satırdan kullanıcı girişi ile okuyabildiği gibi toplu bir komutlar dosyasından da okuyarak sırayla yerine getirebilir. Bu toplu komut dosyaları, Shell Scripts olabileceği gibi normal dosyalar da olabilir.</p>
 

  Temel olarak Shell aşağıdaki işlemleri sırasıyla yapan bir döngüye sahiptir.</p>
 

<!-- wp:list {"ordered":true} -->
<ol><!-- wp:list-item -->
<li>Komutu, komut satırından veya dosyadan oku</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Komutu değerlendir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Komutu çalıştır veya gerekli programı çalıştır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonucu ekrana veya istenen yere yazdır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Birinci adıma geri dön.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Shell Nasıl Görünür?</h3>
<!-- /wp:heading -->

  Shell, açıldığında prompt olarak ifade edilen yerde durur ve komutun girilmesini bekler. Burada kullanıcıya kısa bir bilgi veren bir satır vardır.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">linuks@egitim ~$&gt;</pre>
<!-- /wp:preformatted -->

  <strong>Açıklama</strong>:</p>
 

  linuks: Kullanıcı adını gösterir.</p>
 

  egitim: bilgisayarın host adıdır.</p>
 

  ~ işareti: Şu an bulunan klasörü gösteren bölümdür ve ilk açıldığında ~ işaretiyle Home klasörünü gösterir.</p>
 

  $ karakteri: Kullanıcının yetki düzeyini haber verir. $ olduğunda normal kullanıcı, # olduğunda süper yetkili kullanıcı olduğunu gösterir.</p>
 

<!-- wp:heading {"level":3} -->
 ### Komut Yapısı</h3>
<!-- /wp:heading -->

  Linux içerisinde bir komutun nasıl kullanılacağını gösteren şablona syntax adı verilir. Syntax, genel olarak 3 elemandan oluşur.</p>
 

  <strong>Komut [parametreler-seçenekler] argümanlar</strong></p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">touch -t dosya.txt
</pre>
<!-- /wp:preformatted -->

  Açıklama:</p>
 

  touch: Kullanılan komuttur.</p>
 

  -t: kullanılan parametredir.</p>
 

  Dosya.txt: argümandır.</p>
 

  <strong>Komut</strong>: (<strong>Ne yapılacak?)</strong>Bir işlemin yapılması için kullanıcının hizmetine sunulan programdır. Komutlar Linux içerisinde bir kısım klasörlerde tutulur ve çalıştırılmak için kullanıcının çağırmasını beklerler. Burada iki ayrımdan bahsetmek gerekmektedir.</p>
 

  1. Komutlar, normal kullanıcının kullanabileceği ve yetkili kullanıcıların kullanabileceği komutlar olarak ayrıma tabi tutulurlar. Bu ayırıma göre sistemde (/bin /sbin vb.) farklı klasörlerde bulunurlar.</p>
 

  2. Komutların bir kısmı, Shell tarafından içerisinde gömülü olarak sunulurlar. Bunların sistemde kayıt edildiği ayrı bir dosyası yoktur. Örneğin cd komutu buna örnektir. Bu durumda Shell komutları harici ve dahili komutlar olarak ikiye ayırır.</p>
 

  Bir komutun harici veya dahili olup olmadığını anlamak için type komutu kullanılır.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ type echo
echo is a shell builtin #Dahili komuttur.
$ type date
date is /bin/date #Harici komuttur ve kayıtlı adresi gösterilir.</pre>
<!-- /wp:preformatted -->

  <strong>Parametreler-Seçenekler</strong>: (<strong>Nasıl Yapılacak?)</strong>Bir komutun iş yapma şeklini etkileyen ifadelerdir. Kullanılırken – (tire) ile başlarlar. Her komutun farklı parametre seçenekleri bulunur. Bunları listeleyebilmek için [komut - - help] formatı kullanıldığında ilgili komutun kısa bir yardım metni ekranda görüntülenir ve parametre vb. Temel açıklamalar kullanıcıya özetlenir.</p>
 

  <strong>Argümanlar</strong>: (<strong>Üzerinde çalışılacak dosya nedir?</strong><strong>)&nbsp;</strong>Komutun kendisi ve parametreleri yazıldıktan sonra üzerinde işlem yapılacak dosya veya ifadelere Argüman adı verilmektedir. Baş tarafına – (tire) işareti koymaya gerek yoktur.</p>
 

  Tüm komutlar girilirken elemanlar boşluklarla ayrılır. Boşluk sayısının Shell için önemi yoktur. Komutun anlaşılması ve kullanıcı gözüne uygun görünmesi için tek boşluk kullanımı genel kabul görmüştür.</p>
 

<!-- wp:heading {"level":3} -->
 ### $ echo</h3>
<!-- /wp:heading -->

  Echo komutu, kendisine verilen argüman veya parametreye göre kullanıcıya geri bildirimde bulunan bir komuttur. Echo komutuna bir string metin argümanı gönderirseniz aynen ekrana geri yazar. Sistemde bulunan bir değişken adını gönderirseniz, değişkenin o anda sahip olduğu değeri ekrana yazdırır. Girilen parametre bir sistem değişkeni ise baş tarafına $ işareti koyulduğuna dikkat edilmelidir. Aşağıda örnekleri görelim.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ echo merhaba, nasılsınız?
Merhaba, nasılsınız?
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games</pre>
<!-- /wp:preformatted -->

  Yukarıda PATH değişkeninin değerlerin listelenmiştir. Aralarında : ile ayrılan ifadeler, PATH değişkeninde tutulan klasör adresleridir. Bu adresler, kullanıcının komut satırına bir komut yazdığında aranacak yollarını gösterir.</p>
 

  Shell bir komut girildiğinde öncelikle dahili komut ise kendi dahili komutunu çalıştırır. Dahili komut değilse yazılan komut için önce /usr/local/sbin klasörüne bakar. Bulunamadığı takdirde sıradaki diğer klasöre bakılır. Bu değişken sayesinde kullanıcının bütün komutların hangi klasörde tutulduğunu ezberlemesinin önüne geçilmiş olmaktadır.</p>
 

  Bazı programlar yüklendiğinde güvenlik nedeniyle, yukarıda bulunan klasörler dışında başka bir adrese kaydedilirler. Bu adresler, kurulum esnasında kullanıcıya bildirilir. Eğer PATH değişkeninde bulunan adresler dışında bir komut çalıştırılmak istenirse, tam adresi yazılmalıdır.</p>
 

<!-- wp:heading {"level":3} -->
 ### $ history</h3>
<!-- /wp:heading -->

  Shell aracılığı ile komutlar sisteme gönderildiğinde, geçmiş komutlar sisteme kayıt edilir. Örneğin, geçmişte kullandığımız bir komut ezberimizde olmayabilir. Bu komutu tekrar kullanmak için, history komutunu ve kabiliyetlerini kullanabilirsiniz.</p>
 

  Kayıtlı bulunan tüm geçmişi listelemek için history komutunu kullanırken, istediğiniz sayıda geçmiş komutu da rakamsal olarak girerek listeletebilirsiniz. Aşağıdaki örnekte en son girilen 10 komut listelenmiştir.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">linuks@egitim:~/linux$ history 10 
1994 set +u
1995 ls
1996 echo merhaba &gt;dosya1.txt
1997 cat dosya1.txt
1998 clear
1999 touch dosya123
2000 touch dosya456
2001 cat dosya123
2002 touch dosya456
2003 history 10
linuks@egitim:~/linux$</pre>
<!-- /wp:preformatted -->

<!-- wp:heading {"level":3} -->
 ### Değişkenler</h3>
<!-- /wp:heading -->

  Değişkenler, hafızada ayrılan bölümde kendisine atanan değeri tutan veri kayıt alanlarıdır. Adından da anlaşıldığı gibi değişkendirler ve tuttukları veriler değişebilir. Örneğin bir matematik işleminde sonuç birinci işlemde 12 ise sonuc=12 olarak ifade edilir. Burada sonuc ifadesi değişkenin adını, 12 ise değişkenin o anda tutulan değeridir. Sonuc=9 dediğinizde değişkenin adı sabit kaldır ve tuttuğu değer değişir.</p>
 

  Linux Shell kullanımında değişkenleri ikiye ayırır.</p>
 

  <strong>Shell değişkeni</strong>: O anda çalışılan shell ortamında kullanılan ve diğer proseslerce tanınmayan değişkenlerdir. Programlamada kullanılan public ve private ifadelerine benzetilebilirler.</p>
 

  <strong>Enviromental değişken</strong>: Bir değişkeni bir alt prosese veya sisteminin tamamına tanıttığınızda ise artık değişken Enviromental durumuna getirilmiş olur ve değişkenin tuttuğu değer yeni Shell ortamına veya başka programların kullanımına aktarılabilir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Değişken Tanımlama</h4>
<!-- /wp:heading -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ foo=bar 	#foo değişkeninin değeri bar olarak tanımlandı.
$ echo foo	#echo komutu ile foo ifadesi ekrana yazdırıldı.
foo		#Değişkenin değerinin yazdırılmadığına dikkat edin.
$ echo $foo	#foo değişkeninin hafızada tutulan değeri istendi.
bar		#foo değişkeninin değeri ekrana yazdırıldı.</pre>
<!-- /wp:preformatted -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">$ export</h4>
<!-- /wp:heading -->

  Shell değişkenlerinin diğer prosesler tarafından enviromental değişken haline getirilmesi gerektiğini yukarıda ifade etmiştik. Sistemde tanımlı tüm enviromental değişkenler otomatikman Shell tarafından tanınırlar. Doayısı ile Enviromental değişkenlerin Shell değişkeni haline getirilmelerine gerek yoktur.</p>
 

  Bir Shell değişkenini, enviromental değişken haline getirmek için export komutu kullanılmaktadır.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ foo=bar	#foo isimli shell değişkeninin değeri bar olarak tanımlandı
$ export foo	#foo değişkeni export komutu ile enviromental değişken haline getirildi.
$ export foo=bar #Değişken tek satırda tanımlanıp enviromental değişken haline getirilebilir.</pre>
<!-- /wp:preformatted -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Tırnak içi ifadeler</h4>
<!-- /wp:heading -->

  Shell içerisinde çalışırken kullanılan syntax yapısında önemli bir nokta da tırnak içinde belirtilen ifadelerdir. ' ' tek tırnak ve “ “ çift tırnak işaretleri ile belirtilen ifadeler ile tırnak kullanılmadan belirtilen ifadeler Shell tarafından farklı algılanırlar. &nbsp;Aşağıdaki örnekte tek ve çift tırnak arasında fark yok gibi görünse de bir takım kullanımlarda farklılıkları bulunmaktadır. m.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$ touch New File #New ve File isminde iki dosya oluşturulur. 
$ touch 'New File' #New File isminde tek bir dosya oluşturulur. 
$ touch “Yeni Dosya” #Yeni Dosya isminde tek bir dosya oluşturulur.</pre>
<!-- /wp:preformatted -->