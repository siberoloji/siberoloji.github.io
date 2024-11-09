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
date: "2016-05-08T17:35:00Z"
excerpt: Filtre, Linux komut satırı için bir girdi anlamına gelir. Bir program tarafından
  üretilebilir, bir dosyadan okunabilir veya kullanıcı tarafından da girilebilir.
  Bu filtre girişinden sonra gerekli işlemler yapılır ve ana doküman, filtreye göre
  işlem görür. Sonuç istenen şekilde ekrana yazılabilir veya başka bir dosyanın içerisine
  de eklenebilir.
guid: https://www.siberoloji.com/?p=1083
id: 1083
image: /assets/images/2024/06/cyber10.jpg
tags:
- linux nasıl
title: Linux ile Metin Filtreleri (head tail sort nl wc uniq sed tac cut)
url: /tr/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/
---

  Filtre, Linux komut satırı için bir girdi anlamına gelir. Bir program tarafından üretilebilir, bir dosyadan okunabilir veya kullanıcı tarafından da girilebilir. Bu filtre girişinden sonra gerekli işlemler yapılır ve ana doküman, filtreye göre işlem görür. Sonuç istenen şekilde ekrana yazılabilir veya başka bir dosyanın içerisine de eklenebilir. 
 

  Bu yazıda, söz konusu işlemler için kullanılan komutları bir bütün olarak göreceğiz. Ayrı ayrı yazılarda ele almaktansa tek bir yazı daha faydalı olacaktır. Çok detaya girilmeden genel kullanım gösterilmiştir. Örneklerimizde aşağıdaki verilerin bulunduğu çalışma dosyasını kullanacağız. Örnekleri takip etmek için aşağıdaki verileri kopyalayıp yapıştırarak kendinize bir examplefile.txt dosyası oluşturun. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->


 ### ***head*** 
<!-- /wp:heading -->

  Bu komut, istenilen dokümanın baş tarafından itibaren istenen sayıda satırı görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır. 
 

  ***Format*** : head [-number of lines to print] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">head examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7</code></pre>
<!-- /wp:code -->

  Yukarıda baştan itibaren ilk 10 satır görüntülendi. Şimdi ise ilk 4 satırı görüntüleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">head -4 examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12</code></pre>
<!-- /wp:code -->


 ### ***tail*** 
<!-- /wp:heading -->

  Tail komutu, head komutunun tam tersi olarak dokümanın sonundan itibaren tarama ve görüntüleme yapar. Bir dokümanın sondan itibaren istenen sayıda satırını görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır. 
 

  ***Format*** : tail [-number of lines to print] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">tail examplefile.txt 
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  Şimdi de sondan 3 satırı görüntüleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">tail -3 examplefile.txt 
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->


 ### ***sort*** 
<!-- /wp:heading -->

  Kendisine verilen metin girdisini, varsayılan olarak alfabetik sıraya dizer. Başka kriterlerle de sıraya dizmek imkanı vardır. Detaylı bilgi için man sayfalarına bakabilirsiniz. 
 

  ***Format*** : sort [-options] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sort examplefile.txt 
Ayşe mangosuyu 7
Betül narsuyu 14
Fatih elmasuyu 20
Galip havuçsuyu 3
Lale şeftalisuyu 7
Melih kavunsuyu 12
Melih kavunsuyu 12
Melih kayısısuyu 39
Osman karpuzsuyu 2
Rasim kirazsuyu 4
Suzan portakalsuyu 12
Suzan portakalsuyu 5
Tarık portakalsuyu 9</code></pre>
<!-- /wp:code -->


 ### ***nl*** 
<!-- /wp:heading -->

  Bu komut ismini, number lines yani satırları numaralandır anlamına gelen ifadenin baş harflerinden almaktadır. 
 

  ***Format*** : nl [-options] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nl examplefile.txt 
     1	Fatih elmasuyu 20
     2	Suzan portakalsuyu 5
     3	Melih kavunsuyu 12
     4	Melih kavunsuyu 12
     5	Rasim kirazsuyu 4
     6	Tarık portakalsuyu 9
     7	Lale şeftalisuyu 7
     8	Suzan portakalsuyu 12
     9	Melih kayısısuyu 39
    10	Ayşe mangosuyu 7
    11	Galip havuçsuyu 3
    12	Osman karpuzsuyu 2
    13	Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  Bazen çıktıya ekleme yapmak isteyebilirsiniz. Örneğin Satır numaralarından sonra nokta koymak isterseniz ve rakamlardan önce 10 karakter boşluk bırakmak isterseniz&nbsp; aşağıdaki örneği deneyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nl -s '. ' -w 10 examplefile.txt 
         1. Fatih elmasuyu 20
         2. Suzan portakalsuyu 5
         3. Melih kavunsuyu 12
         4. Melih kavunsuyu 12
         5. Rasim kirazsuyu 4
         6. Tarık portakalsuyu 9
         7. Lale şeftalisuyu 7
         8. Suzan portakalsuyu 12
         9. Melih kayısısuyu 39
        10.Ayşe mangosuyu 7
        11.Galip havuçsuyu 3
        12.Osman karpuzsuyu 2
        13.Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  Yukarıdaki örnekte 2 farklı komut seçeneği kullanılmıştır. -s seçeneği, satır numarasından sonra . ve boşluk karakterinin ayraç olarak kullanılacağını ifade eder. -w seçeneği, satır numarası öncesinde ne kadar boşluk bırakılacağını bildirir. Bu örnekte, seçeneklerin tırnak işareti içerisinde girildiğine dikkat edin. 
 


 ### ***wc*** 
<!-- /wp:heading -->

  wc komutu word count (kelime say) ifadesinin baş harflerinden oluşur ve girilen metin belgesinde bulunan kelimelerin sayısını verir. Aksi belirtilmedikçe komut çıktısında satır, kelime ve harf sayıları raporlanır. 
 

  ***Format*** : wc [-options] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">wc examplefile.txt 
13  39 255 examplefile.txt</code></pre>
<!-- /wp:code -->

  Bazen, bu bilgilerden sadece bir tanesi bize gerekli olabilir. Bu durumda, hangi bilgi gerekliyse onun harf seçeneğinin komuta bildirilmesi yeterlidir. -l (line) satır sayısını, -w (word) kelime sayısını, -m karakter sayısını bildirecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">wc -l examplefile.txt 
13 examplefile.txt</code></pre>
<!-- /wp:code -->

  Bu seçeneklerden birden fazlasını da birleştirerek kullanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">wc -lw examplefile.txt 
13  39 examplefile.txt</code></pre>
<!-- /wp:code -->


 ### ***cut*** 
<!-- /wp:heading -->

  Cut komutu, bir dosyadaki verileriniz sütunlara ayrılmış ise, içerisinden istediğiniz sütunları almanıza olanak sağlar, CSV (Virgülle ayrılmış değerler) veya boşlukla ayrılmış değerlerden oluşan metinlerden istediğiniz sütunları kopyalama işlemini yapar. 
 

  Bizim kullandığımız örnek dosyada veriler boşluk ile ayrılmıştır. İlk sütun isim, ikinci sütun meyvesuyu ve üçüncü sütun ise miktarı belirtmektedir. Biz buradan sadece isimleri almak istersek bunu aşağıdaki şekilde yapabiliriz. 
 

  ***-f*** : Fields ifadesinin baş harfidir ve hangi alanları alacağımızı ifade eder. 
 

  ***-d*** : Delimiter ifadesinin baş harfidir ve alanları ayırmak için kullanılacak karakteri belirtir. 
 

  ***Format*** : cut [-options] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cut -f 1 -d ' ' examplefile.txt 
Fatih
Suzan
Melih
Melih
Rasim
Tarık
Lale
Suzan
Melih
Ayşe
Galip
Osman
Betül</code></pre>
<!-- /wp:code -->

  Bir örnek ile 2 sütunu alıp kullanmayı da görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cut -f 1,2 -d ' ' examplefile.txt 
Fatih elmasuyu
Suzan portakalsuyu
Melih kavunsuyu
Melih kavunsuyu
Rasim kirazsuyu
Tarık portakalsuyu
Lale şeftalisuyu
Suzan portakalsuyu
Melih kayısısuyu
Ayşe mangosuyu
Galip havuçsuyu
Osman karpuzsuyu
Betül narsuyu</code></pre>
<!-- /wp:code -->


 ### ***sed*** 
<!-- /wp:heading -->

  sed komutu Stream Editor ifadesinden oluşturulmuştur. ARA-BUL/DEĞİŞTİR mantığını kullanır. Açıklamadan da anlaşılacağı gibi bir ifadeyi aramak ve başka bir ifadeyle değiştirmekte kullanılabilir. Başka bir takım kabiliyetleri olsa da burada temel kullanımı göstereceğiz. 
 

  ***Format*** : sed &lt;expression&gt; [path] 
 

  Temel olarak expression aşağıdaki yapıdadır. 
 

  ***Expression*** : s/aranacakifade/yeniifade/g 
 

  Baş tarafta bulunan&nbsp;***s*** &nbsp;substitute yani değiştirme işlemi yapılacağını sed komutuna bildirir. Başka harfler ve işlemler de bulunmaktadır.&nbsp;***s*** &nbsp;harfinden sonra kullanılan ilk ve ikinci kesme işareti arasındaki ifade neyin aranacağını, sonraki bölüm ise ne ile değiştirileceğini belirtir. Son kısımda bulunan&nbsp;***g*** &nbsp;ifadesi global olarak işlemin gerçekleştirilmesi gerektiğini belirtir.&nbsp;***g*** &nbsp;harfi kullanılmayabilir. Boş bırakıldığı takdirde arama esnasında ilk bulunan değer değiştirilir ancak metnin geri kalanında değiştirilme işlemi yapılmaz. 
 

  Önce dosya içeriğimize bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat examplefile.txt
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  Aşağıdaki örnek ile dosyamızda bulunan tüm Suzan isimleri Serpil ile değiştirilmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sed 's/Suzan/Serpil/g' examplefile.txt 
Fatih elmasuyu 20
Serpil portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Serpil portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  sed, girilen ifadeleri kelime bazında değil tek tek karakter bazında arar ve değiştirir. Bu durumda Suz ile Ser değişimini de yapabilirsiniz. Sed, varsayılan olarak büyük küçük harf duyarlı arama yapar. Aranacak ifade yerine, başka bir bölümde açıklayacağımız [düzenli ifadeler] kullanılarak farklı filtreler de oluşturmanız mümkündür. 
 

  Son olarak, sed için girdiğimiz seçeneklerin tırnak içinde yazıldığına dikkat edin. Yanlışlıkla tırnakları koymayı unutursanız, işlemi sonlandırmak için&nbsp;***CTRL+c*** &nbsp;tuş kombinasyonunu kullanabilirsiniz. 
 


 ### ***uniq*** 
<!-- /wp:heading -->

  uniq komutu unique yani biricik, tek anlamına gelen kelimeden oluşturulmuştur. Temel olarak yaptığı işlem, tekrar eden satırlardan sadece birisini almak ve diğer tekrarları devre dışı bırakmaktır. Bazen kayıtlarda çift giriş olabilir. Bu durumda kayıtları düzeltmek ve sadeleştirmek için kullanılmaktadır. Burada dikkat edilmesi gereken önemli konu, tekrar eden satırların alt alta birbirini takip ediyor olması gerektiğidir. Dokümanda tekrar eden satırlar var fakat alt alta değilse, bu durumu çözmek için ne yapılması gerektiğini Piping ve Redirection konusu ile ilgili yazıda ele alacağız. 
 

  Örnek dosyamızda bulunan bir takım satırların tekrar ettiğini fark etmişsinizdir. Bu satırları uniq kullanarak ayıklayalım. Önce dosyanın Orijinal haline bakalım. Görüldüğü gibi Melih satırı iki defa ve ard arda tekrar etmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat examplefile.txt
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->

  Komutun uygulanmasından sonra ise tekrarlanan satırların temizlendiği görülebilir. 
 

  ***Format*** : uniq [options] [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uniq examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</code></pre>
<!-- /wp:code -->


 ### ***tac*** 
<!-- /wp:heading -->

  tac komutu, cat komutunun tam tersi işlem yapar. Dosyanın en alt satırını okur ve ilk satır olarak yazar. Head ve Tail komutlarından farklı olduğunu belirtelim. 
 

  Bazen kayıtlar tutulurken, yeni kayıtlar dosyanın en altına yazılıyor olabilir. Siz de bu yeni kayıtları en üstte görmek isteyebilirsiniz. Bu durumda tac kullanımı işinizi kolaylaştıracaktır. 
 

  ***Format*** : tac [path] 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">tac examplefile.txt 
Betül narsuyu 14
Osman karpuzsuyu 2
Galip havuçsuyu 3
Ayşe mangosuyu 7
Melih kayısısuyu 39
Suzan portakalsuyu 12
Lale şeftalisuyu 7
Tarık portakalsuyu 9
Rasim kirazsuyu 4
Melih kavunsuyu 12
Melih kavunsuyu 12
Suzan portakalsuyu 5
Fatih elmasuyu 20</code></pre>
<!-- /wp:code -->