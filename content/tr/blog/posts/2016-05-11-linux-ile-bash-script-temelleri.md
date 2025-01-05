---
draft: false

title:  'Linux ile BASH Script Temelleri'
date: '2016-05-11T17:51:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazıda, temel Linux gezinme ve komut bilginizin olduğu farz edilmiştir. Temel bilgilerinizi birleştirerek Script yazmayı göreceğiz. Script yazma konusu gerçekte çok detaylı olduğundan, burada genel hatlarıyla ele alınacaktır. Bash Script konusunda daha ayrıntılı bilgi için diğer kaynaklara da bakmanızı tavsiye ediyoruz.' 
 
url:  /tr/linux-ile-bash-script-temelleri/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
---


Bu yazıda, temel Linux gezinme ve komut bilginizin olduğu farz edilmiştir. Temel bilgilerinizi birleştirerek Script yazmayı göreceğiz. Script yazma konusu gerçekte çok detaylı olduğundan, burada genel hatlarıyla ele alınacaktır. Bash Script konusunda daha ayrıntılı bilgi için diğer kaynaklara da bakmanızı tavsiye ediyoruz.



Bu konuda anlatılanların bir kısmını ilk defa görüyorsanız endişe etmeyin. Sitemizdeki ilgili diğer yazılara bakarak o konuları da kolaylıkla inceleyebilirsiniz.



**Bash Script**, bilgisayar terimleri açısından bakıldığında Bash Senaryosu anlamına gelmektedir. Bir başka ifade ile, Shell ortamında meydana gelebilecek ihtimallere göre senaryolar yazarak, mümkün olan tüm durumları karşılayan program geliştirmektir. Tiyatroda senaryo, oyuncular tarafından sahnelenirken, burada bilgisayar tarafından sahnelenmektedir. Bir A durumu meydana geldiğinde ekrana şunu yaz. Bir B durumu meydana geldiğinde dosyayı kopyala vb. işlemlerin hepsinin bir dosya içerisinde Script (Senaryo) olarak toplanmasına Bash Scripting denilmektedir.



Bash script sayesinde, sık sık karşılaşılan durumlar için kullanıcı müdahalesine gerek kalmadan işlemlerin otomatikleştirilmesi sağlanabilir. Her gün belli zamanlarda sisteminizin tüm dosyalarının kontrol edilerek içlerinden sadece bir önceki güne göre değişenlerin yedeğini alan bir program yazılabilir. Bu tür işlemleri her gün kullanıcı manuel olarak yapabileceği gibi bir programa da yaptırabilir.



Böyle bir programı C, Python vb. Programlama dillerini kullanarak yazabilirsiniz. Bu durumda yazdığınız program, çalışmak için bir derleyiciye ihtiyaç duyacaktır. Bir script de aynı şekilde çalışmak için bir derleyiciye ihtiyaç duyar (bash shell). Biz örneklerimizde Bourne Again Shell (bash) kullanıyoruz.



Bir komut, shell içerisinde çalışıyorsa onu Script içerisine de yerleştirebilirsiniz.



Bir komut Script içerisine yerleştirilebiliyorsa, komut satırında da çalışıyor olmalıdır.



Burada ifade edilen kuralı şöyle uyguluyoruz. Script yazarken, parçaların çalışıp çalışmadığını komut satırında test edebilirsiniz. Aldığınız test sonucu doğruysa, Script içerisine ekleyebilirsiniz.



Bash Script, esasen düz metin satırlarından oluşan bir dosyadır. İstediğiniz bir metin editörü kullanarak yazabilirsiniz. Nano, vi veya emacs bunlardan bir kaçıdır.



Basit Bir Örnek



Basit bir örnek yardımıyla konuya giriş yapıyoruz. Aşağıda bulunan dosya içeriğini kopyalayıp bir editör yardımıyla myscript.sh olarak kaydedelim..


```bash
#!/bin/bash
# Basit bir Bash Script
# Umut 10/05/2016
echo İşte sizin Ev klasörünüzdeki dosyalar:
ls ~```



Kaydettiğimiz dosyanın özelliğini executable (x) olarak değiştirmemiz gerekmektedir. Komut satırından **chmod +x myscript.sh** komutunu kullanabilir, Görsel Arayüz (GUI) içerisinde ise dosya yöneticisinde dosyaya sağ tıklayıp çalıştırılabilir hale getirebilirsiniz.


```bash
chmod +x myscript.sh
ls -l myscript.sh
-rwxr-xr-x 1 umut umut 112 May 10 21:12 myscript.sh
```



Yukarıdaki komut ile yetki kontrolü yaptık. Şimdi de aşağıdaki komutla Script dosyamızı çalıştıralım. Burada dosyanın başına ./ yazıldığına dikkat edin. Bu konuyu aşağıda ayrı bir başlıkta açıkladık.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">./myscript.sh
---ÇIKTI---
İşte sizin Ev klasöründeki dosyalar:
Downloads Pictures Templates
Dropbox test.txt</pre>
<!-- /wp:preformatted -->


**Script Kodlarının Açıklaması**:


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Basit bir Bash Script
# Umut 10/05/2016
echo İşte sizin Ev klasörünüzdeki dosyalar:
ls ~</pre>
<!-- /wp:preformatted -->


**.****sh uzantısı**



Linux, çalışma esnasında dosya uzantılarına ihtiyaç duymayan bir İşletim sistemidir. Dosya uzantıları, kullanıcıların dosyaları daha hızlı algılaması için kullanılırlar ancak zorunlu değillerdir. myscript dosyamızın uzantısı .sh olmak zorunda olmadığı halde .sh ifadesi onun bir bash script dosyası olduğunu hemen anlamamıza yardımcı olmaktadır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash</pre>
<!-- /wp:preformatted -->


**#!:**Bir script dosyasının ilk satırı bu iki karakterle başlamalıdır. **Shebang **olarak ifade edilen bu karakterlerden hemen sonra, boşluk bırakmadan hangi bash programı kullanılacaksa o programın mutlak adresi yazılır.



**/bin/bash:** Burada belirtilmesi gereken diğer bir konu da sisteminizde hangi bash yazılımını kullandığınızdır. which bash komutunun sonucu size mutlak adresi söyleyecektir. #! ifadesinden sonra herhangi bir bash adresi yazmasanız da Script çalışabilir. Fakat sizin yazdığınız Script başka bir sistemde çalıştırılmak istendiğinde hata verme ihtimali vardır. Bu sebeple bash adresini yazmayı alışkanlık haline getirmek daha sağlıklı olacaktır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted"># Basit bir Bash Script</pre>
<!-- /wp:preformatted -->


# ifadesiyle başlayan satırlar yorum satırlarıdır. Bu satırları Bash yorum olarak farz edecek ve işleme almayacaktır. Dosyanın sahibi, oluşturulma tarihi ve oluşturulma maksadı vb. bilgilere burada yer verebilirsiniz.



Kodlarınız ve satırlar çoğaldıkça,  hangi kodların ne işe yaradığını tekrar hatırlamak zorlaşacaktır. Aynı zamanda kodlarınızı bir başkasının incelemesi gerektiğinde, yorum bölümleri oldukça önem kazanır. Kodlarınızın yanına kısa yorumlar ve açıklamalar eklemeyi alışkanlık haline getirmek oldukça önemlidir. Her satıra gerek olmasa da kodlarınızın önemli bölümlerine yorum ve açıklamalar yazmanızı tavsiye ediyoruz.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo İşte sizin Ev klasörünüzdeki dosyalar</pre>
<!-- /wp:preformatted -->


Burada, echo komutu ile bir mesajı ekrana yazdırıyoruz. Bu örnekte sabit bir metin kullandık ancak ilerleyen bölümlerde değişkenlerin ve diğer değerlerin ekrana yazdırılması için sık sık echo komutunu kullanacağız.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">ls ~</pre>
<!-- /wp:preformatted -->


Son satırımızda ls komutu ile Ev klasörünün listesini ekrana yazdırıyoruz.



Yukarıdaki örnek Script kavramının açıklanması için oluşturulmuştur. Görünürde sadece iki satır komutu çalıştırmak gibi basit bir işlevi yerine getirmiş olabilir. Script dosyalarının içeriği geliştirildikçe, çok daha karışık işlemleri nasıl basitleştirdiklerini aşağıda göreceğiz.



Neden ./ ?



Linux komut satırına bir program yazdığınızda, sisteminiz o programı PATH adı verilen değişkende tutulan klasörlerde arayacaktır. Sizin oluşturduğunuz myscript.sh dosyası, muhtemelen bu klasörlerin içerisinde bir yerde değildir çünkü Linux güvenlik açısından kullanıcının erişebileceği klasör yetkilerini sınırlar.



Linux sisteminizin, yazdığınız komutu hangi klasörlerde aradığını echo $PATH komutu ile öğrenebilirsiniz. myscript.sh dosyanız bu klasörlerde değil başka bir yerde kayıtlıdır. Bu durumda Linux'a PATH klasörlerinde arama, şu an bulunduğum klasördeki myscript.sh programını çalıştır diye belirtmeniz gereklidir. İşte şu an bulunduğum klasör ifadesi ./ işaretiyle gerçekleştirilir.



İsterseniz PATH değişkenine klasör ilave edebilirsiniz ancak bu güvenlik açısından her zaman iyi olmayabilir. Yazdığınız Script içerisinde bağıl adresleme (./) kullanarak kod yazmak, başka kullanıcıların da bu scripti kullanabilmesine imkan verir.



Değişkenler



Değişkenler hafızalarında değerler tutan, referans olarak kullanılan ve gerektiğinde değişebilen kullanımlardır. Hafızada bir miktar yer ayırıp içerisinde bir değer tutarsınız ve ihtiyacınız olduğunda başka bir hafıza alanı kullanmadan değişkenin değerini değiştirip tekrar kullanabilirsiniz. Çok kullanışlı bir yapı olan değişkenlerin kullanımında uyulması gereken bazı kurallar bulunmaktadır. Bu kurallara mutlaka uymalısınız.


* 
* Bir değişken tanılarken onun ADINI yazarız ve hiç boşluk bırakmadan eşittir (=) işaretiyle devam ederiz. Eşittir işaretinden sonra da boşluk bırakmadan TEK DÜZ TIRNAK içerisinde değeri yazarız. **Not**: Tırnaklar içerisine bir değer değil de bir komut sonucu da yazdırılabilir ancak onu birazdan göreceğiz.

* Bir değişkene atıfta bulunup referans göstermek istediğinizde, değişken isminin başına ( $ ) işareti konulmalıdır.




Örnek:



Öncelikle degiskenornek.sh isimli bir dosya oluşturalım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">nano degiskenornek.sh</pre>
<!-- /wp:preformatted -->


Açılan dosyaya, aşağıdaki kodları yapıştırın. Bazı sistemlerde yapıştırma Shift+Ctrl+v ile yapılır. Yapıştırma işleminden sonra Ctrl+x ile çıkış isteği yapalım ve kaydetmek istiyor musunuz? sorusuna EVET cevabı verelim.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Basit bir değişken örneği
# Umut 11/05/2016
name='Umut'
echo Merhaba $name</pre>
<!-- /wp:preformatted -->


Aşağıdaki komut yardımıyla dosyayı çalıştırılabilir yaptık ve çalıştırdık.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">chmod +x degiskenornek.sh 
./degiskenornek.sh 
---ÇIKTI---
Merhaba Umut</pre>
<!-- /wp:preformatted -->


**Açıklama:**


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">name='Umut'</pre>
<!-- /wp:preformatted -->


name değişkenin adıdır. Atıfta bulunacağımız zaman $name olarak çağırmalıyız. Eşittir işaretinin sağ ve solunda boşluk olmadığına dikkat edin. TEK DÜZ TIRNAK içerisine de değerimiz (Umut) yazılmıştır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo Merhaba $name</pre>
<!-- /wp:preformatted -->


Burada ise echo komutundan Merhaba sabit değeri ile $name değişken değerini alarak ekrana yazdırması söylenmiştir.



**ALIŞTIRMA**: degiskenornek.sh dosyasını tekrar açıp içerisine surname değişkenini ve değerini tanımlayın. Echo komutunu


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo Merhaba $name $surname</pre>
<!-- /wp:preformatted -->


olarak değiştirip kaydedin ve çıkın. Yazdığınız scripti tekrar çalıştırın.



Script Çalıştırdığınızda Arka Plandaki Değişkenler



Siz bir Script yazıp çalıştırdığınızda, sizin tanımladığınız değişkenlere ilave olarak sisteminiz de otomatik olarak bir takım değişkenleri hayata geçirir. Bunlardan bazılarını aşağıda açıkladık:


* 
* **$0** – Scriptin adı bu değişkende tutulur.

* **$1 - $9** – Scripte komut satırından (dışarıdan gönderilen) argümanlar 1 ile 9 arasındaki değişkenlerde kayıt edilir.

* **$#** - Scripte dışarıdan gönderilen toplam argüman sayısı bu değişkende tutulur.

* **$*** - Scripte dışarıdan gönderilen argümanların tamamı anlamına gelir.




**Örnek**:



Yukarıdaki örnekte yaptığımıza benzer şekilde aşağıdaki nano komutuyla bir dosya oluşturalım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">nano otomatikornek.sh</pre>
<!-- /wp:preformatted -->


Açılan dosyaya, aşağıdaki Script kodlarını yapıştıralım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Basitin biraz ötesinde değişken örneği
# Umut 11/05/2016

clear
echo Ben: Benim adım $0 ve ben komut satırından toplam $# argüman gönderdim.
echo Bilgisayar: Evet, gönderdikleriniz bunlardı: $*
echo Bilgisayar: Ve gönderdiğiniz 2. argüman da $2, doğru mu? :\)
</pre>
<!-- /wp:preformatted -->


Dosyayı çalıştırılabilir yapalım ve çalıştıralım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">chmod +x otomatikornek.sh 
./otomatikornek.sh Umut Serhat Mesut 
---ÇIKTI---
Benim adım ./otomatikornek.sh ve ben komut satırından toplam 3 argüman gönderdim. 
Bilgisayar: Evet, gönderdikleriniz bunlardı: Umut Serhat Mesut 
Bilgisayar: Ve gönderdiğiniz 2. argüman da Serhat , doğru mu? :)</pre>
<!-- /wp:preformatted -->


**Açıklama:**


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo Ben: Benim adım $0 ve ben komut satırından toplam $# argüman gönderdim.</pre>
<!-- /wp:preformatted -->


Bu satırda $0 ile script dosyasının ismi çağrılmış ve $# ile toplam argüman sayısı kullanılmıştır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo Bilgisayar: Evet, gönderdikleriniz bunlardı: $*</pre>
<!-- /wp:preformatted -->


Bu satırda $* ile değişkenlerin tamamı yazdırılmıştır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo Bilgisayar: Ve gönderdiğiniz 2. argüman da $2, doğru mu? :\)</pre>
<!-- /wp:preformatted -->


Bu satırda $2 ile gönderilen 2.sıradaki argüman değişkeni çağrılmış ve ekrana yazdırılmıştır.



**ALIŞTIRMA**:



Scripte 1 argüman gönderseydik ne olurdu?



Scriptte :\) yazdığımız halde çıktıda neden : ) olarak görünüyor?



Ters Tırnaklar



Yukarıdaki örneklerde değişkenlerimizi TEK DÜZ TIRNAK içerisinde sabit string değerler olarak tanımladık. Bazen bir değişkene, bir komutun sonucunu kaydetmek isteyebiliriz. Bu durumda sabit değil bir komutu tanımlamamız gerekecektir. Böyle durumlarda değişkenin eşittir işaretinin sağ tarafında bulunan ifadeyi TERS TIRNAK (`ifade`) içerisinde yazmamız gerekecektir. Klavyelerimizde yeri pek bilinmeyen bu işaret genellikle , ve ; tuşunda (TR Q) bulunur. AltGr tuşuyla birlikte virgül karakterinin bulunduğu tuşa basarak yazabilirsiniz. Bununla ilgili bir örnek yapalım.



Örnek:



Bu komut ile terstirnak.sh dosyasını nano editörde oluşturalım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">nano terstirnak.sh</pre>
<!-- /wp:preformatted -->


Aşağıdaki script kodlarını terstirnak.sh dosyası içerisine yapıştıralım ve Ctrl+x ile çıkış isteği yapalım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Basit bir TERS TIRNAK içinde değişken örneği
# Umut 11/05/2016

sistem=`uname -a`
echo Sistem bilginiz: $sistem</pre>
<!-- /wp:preformatted -->


terstirnak.sh dosyasını çalışır hale getirelim ve çalıştıralım.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">chmod +x terstirnak.sh 
./terstirnak.sh 
---ÇIKTI---
Sistem bilginiz: Linux umut-X550JX 4.4.0-21-generic #37~14.04.1-Ubuntu SMP Wed Apr 20 16:33:38 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux</pre>
<!-- /wp:preformatted -->


**Açıklama**:


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sistem=`uname -a`</pre>
<!-- /wp:preformatted -->


uname -a bir komuttur. Echo ekrana Ters Tırnaklar içerisindeki ifadeyi aynen değil, komutun sonucunu yazdırmıştır.



**ALIŞTIRMA**:



Script dosyasındaki sistem değişkenine başka komutlar yazarak sonuçları gözlemleyin.



Basit Bir Yedekleme Script Dosyası



Aşağıda, ismini verdiğiniz bir klasörü, yedeklerinizin bulunduğu bir diğer klasöre yedekleme yapan Script verilmiştir. İsterseniz ayrı bir .sh dosyası oluşturarak deneyebilirsiniz. İsterseniz de kodlar üzerinden hangi işlemlerin yapıldığını takip edebilirsiniz. Şu ana kadar anlatılanların pekişmesi açısından üzerinde çalışmanızı tavsiye ediyoruz.



Script, Sisteminize bir zarar meydana getirmemesi için oluşturacağı klasör ve dosyaları /tmp klasörüne kaydedecektir.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">nano backup.sh</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Bir yedekleme örneği
# Umut 11/05/2016

clear
date=`date +%F`
mkdir /tmp/$1&amp;&amp;touch /tmp/$1/dosya1.txt /tmp/$1/dosya2.txt
echo /tmp Klasörüne $1 Klasörü ve içeriği oluşturuldu.
sleep 5
mkdir -p /tmp/backups/$1_$date
echo /tmp Klasörüne /backup klasörü ve $1_$date Klasörü oluşturuldu.
sleep 5
cp -R /tmp/$1 /tmp/backups/$1_$date
echo /tmp klasöründe bulunan $1 klasör içeriği /tmp/backups/$1_$date klasörüne yedeklendi.
sleep 5
echo Yedekleme tamamlandı.
echo isterseniz /tmp/$1 klasörünü ve
echo /tmp/backups/$1_$date klasörünü silebilirsiniz.
echo /tmp klasörü sisteminizi kapattığınızda kendisi zaten silinir.
sleep 1
echo ESAS KLASÖR İÇERİĞİ
ls -l /tmp/$1
sleep 1
echo YEDEKLENEN KLASÖR İÇERİĞİ
ls -l /tmp/backups/$1_$date/$1/
echo Script sona erdi…</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">chmod +x backup.sh
./backup.sh yedekleme</pre>
<!-- /wp:preformatted -->


If -Then-Else Kullanımı



Yukarıdaki yedekleme örneğinde işlemlerin hatasız yapıldığı farz edilmiştir. Yapılan işlemlerin herhangi bir adımında sorun çıkması durumda ne yapılacağı senaryoda yoktur. Bu tür durumlar için Script yazarken kullanılan şart ve durumsal yapılardan bir tanesi If yapısıdır.



If yapısı, bir şartı kontrol eder ve o şart sağlanıyorsa işlemi yapar. Sağlanmıyorsa işlemi iptal eder. Bir nevi ön kontrol yapar. Kontrol, işlem gerçekleşmeden önce yapılmaktadır.



Aşağıdaki örneği, önceki örneklerde olduğu gibi bir .sh dosyası oluşturup kaydedebilir veya kodlar üzerinden de inceleyerek anlamaya çalışabilirsiniz.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#!/bin/bash
# Bir yedekleme örneği
# Umut 11/05/2016

if [ $# != 1 ]
then
clear
echo Kullanım: Yedeklenecek klasörü belirten 1 tek klasör adı girmelisiniz.
exit
fi

if [ ! -d /tmp/$1 ]
then
clear
echo 'Adını verdiğiniz klasör bulunmuyor. Yeni klasör ve içeriği oluşturulacak'
mkdir /tmp/$1&amp;&amp;touch /tmp/$1/dosya1.txt /tmp/$1/dosya2.txt
echo /tmp Klasörüne $1 Klasörü ve içeriği oluşturuldu.
sleep 5
fi

echo ---------------------------
date=`date +%F`

# Bugün yedeği alınmış başka bir klasör var mı diye bakıyoruz?

if [ -d /tmp/backups/$1_$date ]
then
echo 'Bu klasörün bugün yedeği alınmış. Yine de üstüne yazılsın mı?'
read answer
    if [ $answer != 'y' ]
    then
    exit
    fi
else
mkdir -p /tmp/backups/$1_$date
echo /tmp Klasörüne /backup klasörü ve $1_$date Klasörü oluşturuldu.
sleep 5
fi

cp -R /tmp/$1 /tmp/backups/$1_$date
echo /tmp klasöründe bulunan $1 klasör içeriği /tmp/backups/$1_$date klasörüne yedeklendi.
sleep 5

echo Yedekleme tamamlandı.
echo isterseniz /tmp/$1 klasörünü ve
echo /tmp/backups/$1_$date klasörünü silebilirsiniz.
echo /tmp klasörü sisteminizi kapattığınızda kendisi zaten silinir.
sleep 1

echo ESAS KLASÖR İÇERİĞİ
ls -l /tmp/$1
sleep 1

echo YEDEKLENEN KLASÖR İÇERİĞİ
ls -l /tmp/backups/$1_$date/$1/
echo Script sona erdi…</pre>
<!-- /wp:preformatted -->


**Açıklama**:



1.Kullanım:


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">if şart=eşleşiyor
then
işlemleri yap
exit
fi</pre>
<!-- /wp:preformatted -->


Yukarıdaki örnekte ilk if kullanımı [ $# != 1 ] şartı ile kontrol yapmaktadır. Bu şart, Scripte dışarıdan girilen argüman sayısının bire eşit olmaması durumudur. Öyleyse burada Script'e girilen argüman bire eşit değilse yani (0 veya Birden fazla argüman girildiyse) bir takım işlemleri yapıp çıkması istenmiştir.



2.Kullanım:


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">if şart1=eşleşiyor
then
işlemleri yap

   if şart2=eşleşiyor
   then
   işlemleri yap
   exit
   fi

else
şart1 gerçekleşmediğinde bu işlemleri yap
exit
fi:</pre>
<!-- /wp:preformatted -->


Yukarıdaki örnek içerisinde 2.kullanım şekli de if yapısını ELSE yani diğer türlü olduğunda yapılacak işlemleri de tanımlayarak algoritmayı genişleterek kullandık. Üstelik şart1 gerçekleştiğinde yapılacak işlemler arasına da bir if kullanımı yerleştirerek içiçe kullanımı da göstermiş olduk. Bu tarz kullanımda if kontrol mekanizmasına [-d /tmp/backups/$1_$date ] şartı ile yedeğin bugün içerisinde önceden alınıp alınmadığı kontrol ettiriliyor. Alınmışsa takip edilecek yol ve işlemler belirtiliyor. Alınmamış ise (ELSE) yapılacak işlemler belirtiliyor.



3.Kullanım:


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">echo 'Bu klasörün bugün yedeği alınmış. Yine de üstüne yazılsın mı?'
read answer 
if [ $answer != 'y' ]
then
exit</pre>
<!-- /wp:preformatted -->


Burada ise, kullanıcıya bir soru soruluyor ve cevabı bekleniyor. Girilen cevap **read answer** komutu ile answer değişkenine yerleştiriliyor, sonrasında if-then yapısıyla kontrol ediliyor. Girilen cevap y değilse **[!='y']** çıkılıyor.



**ALIŞTIRMA**: Kullanıcı cevap olarak y tuşuna basması gerektiğini nereden bilecek?
