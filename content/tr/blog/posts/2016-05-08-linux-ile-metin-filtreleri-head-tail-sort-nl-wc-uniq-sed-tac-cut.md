---
draft: false

title:  'Linux ile Metin Filtreleri (head tail sort nl wc uniq sed tac cut)'
date: '2016-05-08T17:35:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Filtre, Linux komut satırı için bir girdi anlamına gelir. Bir program tarafından üretilebilir, bir dosyadan okunabilir veya kullanıcı tarafından da girilebilir. Bu filtre girişinden sonra gerekli işlemler yapılır ve ana doküman, filtreye göre işlem görür. Sonuç istenen şekilde ekrana yazılabilir veya başka bir dosyanın içerisine de eklenebilir.' 
 
url:  /tr/linux-ile-metin-filtreleri-head-tail-sort-nl-wc-uniq-sed-tac-cut/
 
featured_image: /images/cyber10.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
---


Filtre, Linux komut satırı için bir girdi anlamına gelir. Bir program tarafından üretilebilir, bir dosyadan okunabilir veya kullanıcı tarafından da girilebilir. Bu filtre girişinden sonra gerekli işlemler yapılır ve ana doküman, filtreye göre işlem görür. Sonuç istenen şekilde ekrana yazılabilir veya başka bir dosyanın içerisine de eklenebilir.



Bu yazıda, söz konusu işlemler için kullanılan komutları bir bütün olarak göreceğiz. Ayrı ayrı yazılarda ele almaktansa tek bir yazı daha faydalı olacaktır. Çok detaya girilmeden genel kullanım gösterilmiştir. Örneklerimizde aşağıdaki verilerin bulunduğu çalışma dosyasını kullanacağız. Örnekleri takip etmek için aşağıdaki verileri kopyalayıp yapıştırarak kendinize bir examplefile.txt dosyası oluşturun.


```bash
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
Betül narsuyu 14```



**head**



Bu komut, istenilen dokümanın baş tarafından itibaren istenen sayıda satırı görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır.



**Format**: head [-number of lines to print] [path]


```bash
head examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7```



Yukarıda baştan itibaren ilk 10 satır görüntülendi. Şimdi ise ilk 4 satırı görüntüleyelim.


```bash
head -4 examplefile.txt 
Fatih elmasuyu 20
Suzan portakalsuyu 5
Melih kavunsuyu 12
Melih kavunsuyu 12```



**tail**



Tail komutu, head komutunun tam tersi olarak dokümanın sonundan itibaren tarama ve görüntüleme yapar. Bir dokümanın sondan itibaren istenen sayıda satırını görüntüler. Herhangi bir satır sayısı verilmediği takdirde varsayılan değer 10 satırdır.



**Format**: tail [-number of lines to print] [path]


```bash
tail examplefile.txt 
Melih kavunsuyu 12
Rasim kirazsuyu 4
Tarık portakalsuyu 9
Lale şeftalisuyu 7
Suzan portakalsuyu 12
Melih kayısısuyu 39
Ayşe mangosuyu 7
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14```



Şimdi de sondan 3 satırı görüntüleyelim.


```bash
tail -3 examplefile.txt 
Galip havuçsuyu 3
Osman karpuzsuyu 2
Betül narsuyu 14```



**sort**



Kendisine verilen metin girdisini, varsayılan olarak alfabetik sıraya dizer. Başka kriterlerle de sıraya dizmek imkanı vardır. Detaylı bilgi için man sayfalarına bakabilirsiniz.



**Format**: sort [-options] [path]


```bash
sort examplefile.txt 
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
Tarık portakalsuyu 9```



**nl**



Bu komut ismini, number lines yani satırları numaralandır anlamına gelen ifadenin baş harflerinden almaktadır.



**Format**: nl [-options] [path]


```bash
nl examplefile.txt 
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
    13	Betül narsuyu 14```



Bazen çıktıya ekleme yapmak isteyebilirsiniz. Örneğin Satır numaralarından sonra nokta koymak isterseniz ve rakamlardan önce 10 karakter boşluk bırakmak isterseniz  aşağıdaki örneği deneyebilirsiniz.


```bash
nl -s '. ' -w 10 examplefile.txt 
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
        13.Betül narsuyu 14```



Yukarıdaki örnekte 2 farklı komut seçeneği kullanılmıştır. -s seçeneği, satır numarasından sonra . ve boşluk karakterinin ayraç olarak kullanılacağını ifade eder. -w seçeneği, satır numarası öncesinde ne kadar boşluk bırakılacağını bildirir. Bu örnekte, seçeneklerin tırnak işareti içerisinde girildiğine dikkat edin.



**wc**



wc komutu word count (kelime say) ifadesinin baş harflerinden oluşur ve girilen metin belgesinde bulunan kelimelerin sayısını verir. Aksi belirtilmedikçe komut çıktısında satır, kelime ve harf sayıları raporlanır.



**Format**: wc [-options] [path]


```bash
wc examplefile.txt 
13  39 255 examplefile.txt```



Bazen, bu bilgilerden sadece bir tanesi bize gerekli olabilir. Bu durumda, hangi bilgi gerekliyse onun harf seçeneğinin komuta bildirilmesi yeterlidir. -l (line) satır sayısını, -w (word) kelime sayısını, -m karakter sayısını bildirecektir.


```bash
wc -l examplefile.txt 
13 examplefile.txt```



Bu seçeneklerden birden fazlasını da birleştirerek kullanabilirsiniz.


```bash
wc -lw examplefile.txt 
13  39 examplefile.txt```



**cut**



Cut komutu, bir dosyadaki verileriniz sütunlara ayrılmış ise, içerisinden istediğiniz sütunları almanıza olanak sağlar, CSV (Virgülle ayrılmış değerler) veya boşlukla ayrılmış değerlerden oluşan metinlerden istediğiniz sütunları kopyalama işlemini yapar.



Bizim kullandığımız örnek dosyada veriler boşluk ile ayrılmıştır. İlk sütun isim, ikinci sütun meyvesuyu ve üçüncü sütun ise miktarı belirtmektedir. Biz buradan sadece isimleri almak istersek bunu aşağıdaki şekilde yapabiliriz.



**-f**: Fields ifadesinin baş harfidir ve hangi alanları alacağımızı ifade eder.



**-d**: Delimiter ifadesinin baş harfidir ve alanları ayırmak için kullanılacak karakteri belirtir.



**Format**: cut [-options] [path]


```bash
cut -f 1 -d ' ' examplefile.txt 
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
Betül
```



Bir örnek ile 2 sütunu alıp kullanmayı da görelim.


```bash
cut -f 1,2 -d ' ' examplefile.txt 
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
Betül narsuyu```



**sed**



sed komutu Stream Editor ifadesinden oluşturulmuştur. ARA-BUL/DEĞİŞTİR mantığını kullanır. Açıklamadan da anlaşılacağı gibi bir ifadeyi aramak ve başka bir ifadeyle değiştirmekte kullanılabilir. Başka bir takım kabiliyetleri olsa da burada temel kullanımı göstereceğiz.



**Format**: sed &lt;expression&gt; [path]



Temel olarak expression aşağıdaki yapıdadır.



**Expression**: s/aranacakifade/yeniifade/g



Baş tarafta bulunan **s** substitute yani değiştirme işlemi yapılacağını sed komutuna bildirir. Başka harfler ve işlemler de bulunmaktadır. **s** harfinden sonra kullanılan ilk ve ikinci kesme işareti arasındaki ifade neyin aranacağını, sonraki bölüm ise ne ile değiştirileceğini belirtir. Son kısımda bulunan **g** ifadesi global olarak işlemin gerçekleştirilmesi gerektiğini belirtir. **g** harfi kullanılmayabilir. Boş bırakıldığı takdirde arama esnasında ilk bulunan değer değiştirilir ancak metnin geri kalanında değiştirilme işlemi yapılmaz.



Önce dosya içeriğimize bakalım.


```bash
cat examplefile.txt
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
Betül narsuyu 14```



Aşağıdaki örnek ile dosyamızda bulunan tüm Suzan isimleri Serpil ile değiştirilmektedir.


```bash
sed 's/Suzan/Serpil/g' examplefile.txt 
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
Betül narsuyu 14```



sed, girilen ifadeleri kelime bazında değil tek tek karakter bazında arar ve değiştirir. Bu durumda Suz ile Ser değişimini de yapabilirsiniz. Sed, varsayılan olarak büyük küçük harf duyarlı arama yapar. Aranacak ifade yerine, başka bir bölümde açıklayacağımız [düzenli ifadeler] kullanılarak farklı filtreler de oluşturmanız mümkündür.



Son olarak, sed için girdiğimiz seçeneklerin tırnak içinde yazıldığına dikkat edin. Yanlışlıkla tırnakları koymayı unutursanız, işlemi sonlandırmak için **CTRL+c** tuş kombinasyonunu kullanabilirsiniz.



**uniq**



uniq komutu unique yani biricik, tek anlamına gelen kelimeden oluşturulmuştur. Temel olarak yaptığı işlem, tekrar eden satırlardan sadece birisini almak ve diğer tekrarları devre dışı bırakmaktır. Bazen kayıtlarda çift giriş olabilir. Bu durumda kayıtları düzeltmek ve sadeleştirmek için kullanılmaktadır. Burada dikkat edilmesi gereken önemli konu, tekrar eden satırların alt alta birbirini takip ediyor olması gerektiğidir. Dokümanda tekrar eden satırlar var fakat alt alta değilse, bu durumu çözmek için ne yapılması gerektiğini Piping ve Redirection konusu ile ilgili yazıda ele alacağız.



Örnek dosyamızda bulunan bir takım satırların tekrar ettiğini fark etmişsinizdir. Bu satırları uniq kullanarak ayıklayalım. Önce dosyanın Orijinal haline bakalım. Görüldüğü gibi Melih satırı iki defa ve ard arda tekrar etmektedir.


```bash
cat examplefile.txt
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
Betül narsuyu 14```



Komutun uygulanmasından sonra ise tekrarlanan satırların temizlendiği görülebilir.



**Format**: uniq [options] [path]


```bash
uniq examplefile.txt 
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
Betül narsuyu 14```



**tac**



tac komutu, cat komutunun tam tersi işlem yapar. Dosyanın en alt satırını okur ve ilk satır olarak yazar. Head ve Tail komutlarından farklı olduğunu belirtelim.



Bazen kayıtlar tutulurken, yeni kayıtlar dosyanın en altına yazılıyor olabilir. Siz de bu yeni kayıtları en üstte görmek isteyebilirsiniz. Bu durumda tac kullanımı işinizi kolaylaştıracaktır.



**Format**: tac [path]


```bash
tac examplefile.txt 
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
Fatih elmasuyu 20```
