---
layout: post
title: Linux ile Metin Filtreleri (head tail sort nl wc uniq sed tac cut)
date: 2016-05-08 14:45:35.000000000 +03:00
type: post
img: cyber10.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- linux cut komutu
- linux head komutu
- linux komutları
- linux nl komutu
- linux sed komutu
- linux sort komutu
- linux tac komutu
- linux tail komutu
- linux uniq komutu
- linux wc komutu

---
<p lang="tr-TR">Filtre, Linux komut satırı için bir girdi anlamına gelir. Bir program tarafından üretilebilir, bir dosyadan okunabilir veya kullanıcı tarafından da girilebilir. Bu filtre girişinden sonra gerekli işlemler yapılır ve ana doküman, filtreye göre işlem görür. Sonuç istenen şekilde ekrana yazılabilir veya başka bir dosyanın içerisine de eklenebilir.</p>
<p lang="tr-TR">Bu yazıda, söz konusu işlemler için kullanılan komutları bir bütün olarak göreceğiz. Ayrı ayrı yazılarda ele almaktansa tek bir yazı daha faydalı olacaktır. Çok detaya girilmeden genel kullanım gösterilmiştir. Örneklerimizde aşağıdaki verilerin bulunduğu çalışma dosyasını kullanacağız. Örnekleri takip etmek için aşağıdaki verileri kopyalayıp yapıştırarak kendinize bir examplefile.txt dosyası oluşturun.</p>
<pre class="lang:sh decode:true" title="Alıştırmalar için examplefile.txt dosyası içeriği">Fatih elmasuyu 20
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
Betül narsuyu 14</pre>
<p><a name="head"></a></p>
<h3><strong>head</strong></h3>
<p lang="tr-TR">Bu komut, istenilen dokümanın baş tarafından itibaren istenen sayıda satırı görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır.</p>
<p lang="tr-TR"><strong>Format</strong>: head [-number of lines to print] [path]</p>
<pre class="lang:sh decode:true">head examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7</pre>
<p lang="tr-TR">Yukarıda baştan itibaren ilk 10 satır görüntülendi. Şimdi ise ilk 4 satırı görüntüleyelim.</p>
<pre class="lang:sh decode:true">head -4 examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12</pre>
<p><a name="tail"></a></p>
<h3><strong>tail</strong></h3>
<p lang="tr-TR">Tail komutu, head komutunun tam tersi olarak dokümanın sonundan itibaren tarama ve görüntüleme yapar. Bir dokümanın sondan itibaren istenen sayıda satırını görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır.</p>
<p lang="tr-TR"><strong>Format</strong>: tail [-number of lines to print] [path]</p>
<pre class="lang:sh decode:true">tail examplefile.txt 
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</pre>
<p lang="tr-TR">Şimdi de sondan 3 satırı görüntüleyelim.</p>
<pre class="lang:sh decode:true">tail -3 examplefile.txt 
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14</pre>
<p><a name="sort"></a></p>
<h3><strong>sort</strong></h3>
<p lang="tr-TR">Kendisine verilen metin girdisini, varsayılan olarak alfabetik sıraya dizer. Başka kriterlerle de sıraya dizmek imkanı vardır. Detaylı bilgi için man sayfalarına bakabilirsiniz.</p>
<p lang="tr-TR"><strong>Format</strong>: sort [-options] [path]</p>
<pre class="lang:sh decode:true">sort examplefile.txt 
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
Tarık portakalsuyu 9</pre>
<p><a name="nl"></a></p>
<h3><strong>nl</strong></h3>
<p lang="tr-TR">Bu komut ismini, number lines yani satırları numaralandır anlamına gelen ifadenin baş harflerinden almaktadır.</p>
<p lang="tr-TR"><strong>Format</strong>: nl [-options] [path]</p>
<pre class="lang:sh decode:true">nl examplefile.txt 
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
    13	Betül narsuyu 14</pre>
<p lang="tr-TR">Bazen çıktıya ekleme yapmak isteyebilirsiniz. Örneğin Satır numaralarından sonra nokta koymak isterseniz ve rakamlardan önce 10 karakter boşluk bırakmak isterseniz  aşağıdaki örneği deneyebilirsiniz.</p>
<pre class="lang:sh decode:true">nl -s '. ' -w 10 examplefile.txt 
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
        13.Betül narsuyu 14</pre>
<p lang="tr-TR">Yukarıdaki örnekte 2 farklı komut seçeneği kullanılmıştır. -s seçeneği, satır numarasından sonra . ve boşluk karakterinin ayraç olarak kullanılacağını ifade eder. -w seçeneği, satır numarası öncesinde ne kadar boşluk bırakılacağını bildirir. Bu örnekte, seçeneklerin tırnak işareti içerisinde girildiğine dikkat edin.</p>
<p><a name="wc"></a></p>
<h3><strong>wc</strong></h3>
<p lang="tr-TR">wc komutu word count (kelime say) ifadesinin baş harflerinden oluşur ve girilen metin belgesinde bulunan kelimelerin sayısını verir. Aksi belirtilmedikçe komut çıktısında satır, kelime ve harf sayıları raporlanır.</p>
<p lang="tr-TR"><strong>Format</strong>: wc [-options] [path]</p>
<pre class="lang:sh decode:true">wc examplefile.txt 
13  39 255 examplefile.txt</pre>
<p lang="tr-TR">Bazen, bu bilgilerden sadece bir tanesi bize gerekli olabilir. Bu durumda, hangi bilgi gerekliyse onun harf seçeneğinin komuta bildirilmesi yeterlidir. -l (line) satır sayısını, -w (word) kelime sayısını, -m karakter sayısını bildirecektir.</p>
<pre class="lang:sh decode:true">wc -l examplefile.txt 
13 examplefile.txt</pre>
<p lang="tr-TR">Bu seçeneklerden birden fazlasını da birleştirerek kullanabilirsiniz.</p>
<pre class="lang:sh decode:true">wc -lw examplefile.txt 
13  39 examplefile.txt</pre>
<p><a name="cut"></a></p>
<h3><strong>cut</strong></h3>
<p lang="tr-TR">Cut komutu, bir dosyadaki verileriniz sütunlara ayrılmış ise, içerisinden istediğiniz sütunları almanıza olanak sağlar, CSV (Virgülle ayrılmış değerler) veya boşlukla ayrılmış değerlerden oluşan metinlerden istediğiniz sütunları kopyalama işlemini yapar.</p>
<p lang="tr-TR">Bizim kullandığımız örnek dosyada veriler boşluk ile ayrılmıştır. İlk sütun isim, ikinci sütun meyvesuyu ve üçüncü sütun ise miktarı belirtmektedir. Biz buradan sadece isimleri almak istersek bunu aşağıdaki şekilde yapabiliriz.</p>
<p lang="tr-TR"><strong>-f</strong>: Fields ifadesinin baş harfidir ve hangi alanları alacağımızı ifade eder.</p>
<p lang="tr-TR"><strong>-d</strong>: Delimiter ifadesinin baş harfidir ve alanları ayırmak için kullanılacak karakteri belirtir.</p>
<p lang="tr-TR"><strong>Format</strong>: cut [-options] [path]</p>
<pre class="lang:sh decode:true">cut -f 1 -d ' ' examplefile.txt 
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
Betül</pre>
<p lang="tr-TR">Bir örnek ile 2 sütunu alıp kullanmayı da görelim.</p>
<pre class="lang:sh decode:true">cut -f 1,2 -d ' ' examplefile.txt 
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
Betül narsuyu</pre>
<p><a name="sed"></a></p>
<h3><strong>sed</strong></h3>
<p lang="tr-TR">sed komutu Stream Editor ifadesinden oluşturulmuştur. ARA-BUL/DEĞİŞTİR mantığını kullanır. Açıklamadan da anlaşılacağı gibi bir ifadeyi aramak ve başka bir ifadeyle değiştirmekte kullanılabilir. Başka bir takım kabiliyetleri olsa da burada temel kullanımı göstereceğiz.</p>
<p lang="tr-TR"><strong>Format</strong>: sed &lt;expression&gt; [path]</p>
<p lang="tr-TR">Temel olarak expression aşağıdaki yapıdadır.</p>
<p lang="tr-TR"><strong>Expression</strong>: s/aranacakifade/yeniifade/g</p>
<p lang="tr-TR">Baş tarafta bulunan <strong>s</strong> substitute yani değiştirme işlemi yapılacağını sed komutuna bildirir. Başka harfler ve işlemler de bulunmaktadır. <strong>s</strong> harfinden sonra kullanılan ilk ve ikinci kesme işareti arasındaki ifade neyin aranacağını, sonraki bölüm ise ne ile değiştirileceğini belirtir. Son kısımda bulunan <strong>g</strong> ifadesi global olarak işlemin gerçekleştirilmesi gerektiğini belirtir. <strong>g</strong> harfi kullanılmayabilir. Boş bırakıldığı takdirde arama esnasında ilk bulunan değer değiştirilir ancak metnin geri kalanında değiştirilme işlemi yapılmaz.</p>
<p lang="tr-TR">Önce dosya içeriğimize bakalım.</p>
<pre class="lang:sh decode:true">cat examplefile.txt
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
Betül narsuyu 14</pre>
<p lang="tr-TR">Aşağıdaki örnek ile dosyamızda bulunan tüm Suzan isimleri Serpil ile değiştirilmektedir.</p>
<pre class="lang:sh decode:true">sed 's/Suzan/Serpil/g' examplefile.txt 
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
Betül narsuyu 14</pre>
<p lang="tr-TR">sed, girilen ifadeleri kelime bazında değil tek tek karakter bazında arar ve değiştirir. Bu durumda Suz ile Ser değişimini de yapabilirsiniz. Sed, varsayılan olarak büyük küçük harf duyarlı arama yapar. Aranacak ifade yerine, başka bir bölümde açıklayacağımız [düzenli ifadeler] kullanılarak farklı filtreler de oluşturmanız mümkündür.</p>
<p lang="tr-TR">Son olarak, sed için girdiğimiz seçeneklerin tırnak içinde yazıldığına dikkat edin. Yanlışlıkla tırnakları koymayı unutursanız, işlemi sonlandırmak için <strong>CTRL+c</strong> tuş kombinasyonunu kullanabilirsiniz.</p>
<p><a name="uniq"></a></p>
<h3><strong>uniq</strong></h3>
<p lang="tr-TR">uniq komutu unique yani biricik, tek anlamına gelen kelimeden oluşturulmuştur. Temel olarak yaptığı işlem, tekrar eden satırlardan sadece birisini almak ve diğer tekrarları devre dışı bırakmaktır. Bazen kayıtlarda çift giriş olabilir. Bu durumda kayıtları düzeltmek ve sadeleştirmek için kullanılmaktadır. Burada dikkat edilmesi gereken önemli konu, tekrar eden satırların alt alta birbirini takip ediyor olması gerektiğidir. Dokümanda tekrar eden satırlar var fakat alt alta değilse, bu durumu çözmek için ne yapılması gerektiğini Piping ve Redirection konusu ile ilgili yazıda ele alacağız.</p>
<p lang="tr-TR">Örnek dosyamızda bulunan bir takım satırların tekrar ettiğini fark etmişsinizdir. Bu satırları uniq kullanarak ayıklayalım. Önce dosyanın Orijinal haline bakalım. Görüldüğü gibi Melih satırı iki defa ve ard arda tekrar etmektedir.</p>
<pre class="lang:sh decode:true">cat examplefile.txt
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
Betül narsuyu 14</pre>
<p lang="tr-TR">Komutun uygulanmasından sonra ise tekrarlanan satırların temizlendiği görülebilir.</p>
<p lang="tr-TR"><strong>Format</strong>: uniq [options] [path]</p>
<pre class="lang:sh decode:true">uniq examplefile.txt 
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
Betül narsuyu 14</pre>
<p><a name="tac"></a></p>
<h3><strong>tac</strong></h3>
<p lang="tr-TR">tac komutu, cat komutunun tam tersi işlem yapar. Dosyanın en alt satırını okur ve ilk satır olarak yazar. Head ve Tail komutlarından farklı olduğunu belirtelim.</p>
<p lang="tr-TR">Bazen kayıtlar tutulurken, yeni kayıtlar dosyanın en altına yazılıyor olabilir. Siz de bu yeni kayıtları en üstte görmek isteyebilirsiniz. Bu durumda tac kullanımı işinizi kolaylaştıracaktır.</p>
<p lang="tr-TR"><strong>Format</strong>: tac [path]</p>
<pre class="lang:sh decode:true">tac examplefile.txt 
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
Fatih elmasuyu 20</pre>
<p>Bu yazının devamında Linux Piping ve Redirection özelliklerini bu <a href="https://www.siberoloji.com/nasil/linux-redirecting-piping-nedir/" target="_blank">bağlantıdan</a> inceleyebilirsiniz.</p>
<p><strong>Bu yazıda incelenenler:</strong></p>
<p><a href="#head">head</a>, <a href="#tail">tail</a>, <a href="#sort">sort</a>, <a href="#nl">nl</a>, <a href="#wc">wc</a>, <a href="#cut">cut</a>, <a href="#sed">sed</a>, <a href="#uniq">uniq</a>, <a href="#tac">tac</a></p>
