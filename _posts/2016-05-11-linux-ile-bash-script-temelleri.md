---
layout: post
title: Linux ile BASH Script Temelleri
date: 2016-05-11 18:43:56.000000000 +03:00
type: post
img: linux-howto.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- bash için script yazma
- bash script
- bash script temelleri
- linux bash script

---
<p lang="tr-TR">Bu yazıda, temel Linux gezinme ve komut bilginizin olduğu farz edilmiştir. Temel bilgilerinizi birleştirerek Script yazmayı göreceğiz. Script yazma konusu gerçekte çok detaylı olduğundan, burada genel hatlarıyla ele alınacaktır. Bash Script konusunda daha ayrıntılı bilgi için diğer kaynaklara da bakmanızı tavsiye ediyoruz.</p>
<p lang="tr-TR">Bu konuda anlatılanların bir kısmını ilk defa görüyorsanız endişe etmeyin. Sitemizdeki ilgili diğer yazılara bakarak o konuları da kolaylıkla inceleyebilirsiniz.</p>
<p lang="tr-TR">[highlight bgcolor="#DDFF99" txtcolor="#000"]Bash Script[/highlight], bilgisayar terimleri açısından bakıldığında Bash Senaryosu anlamına gelmektedir. Bir başka ifade ile, Shell ortamında meydana gelebilecek ihtimallere göre senaryolar yazarak, mümkün olan tüm durumları karşılayan program geliştirmektir. Tiyatroda senaryo, oyuncular tarafından sahnelenirken, burada bilgisayar tarafından sahnelenmektedir. Bir A durumu meydana geldiğinde ekrana şunu yaz. Bir B durumu meydana geldiğinde dosyayı kopyala vb. işlemlerin hepsinin bir dosya içerisinde Script (Senaryo) olarak toplanmasına Bash Scripting denilmektedir.</p>
<p lang="tr-TR">Bash script sayesinde, sık sık karşılaşılan durumlar için kullanıcı müdahalesine gerek kalmadan işlemlerin otomatikleştirilmesi sağlanabilir. Her gün belli zamanlarda sisteminizin tüm dosyalarının kontrol edilerek içlerinden sadece bir önceki güne göre değişenlerin yedeğini alan bir program yazılabilir. Bu tür işlemleri her gün kullanıcı manuel olarak yapabileceği gibi bir programa da yaptırabilir.</p>
<p lang="tr-TR">Böyle bir programı C, Python vb. Programlama dillerini kullanarak yazabilirsiniz. Bu durumda yazdığınız program, çalışmak için bir derleyiciye ihtiyaç duyacaktır. Bir script de aynı şekilde çalışmak için bir derleyiciye ihtiyaç duyar (bash shell). Biz örneklerimizde Bourne Again Shell (bash) kullanıyoruz.</p>
<p lang="tr-TR"><em>Bir komut, shell içerisinde çalışıyorsa onu Script içerisine de yerleştirebilirsiniz. </em></p>
<p lang="tr-TR"><em>Bir komut Script içerisine yerleştirilebiliyorsa, komut satırında da çalışıyor olmalıdır.</em></p>
<p lang="tr-TR">Burada ifade edilen kuralı şöyle uyguluyoruz. Script yazarken, parçaların çalışıp çalışmadığını komut satırında test edebilirsiniz. Aldığınız test sonucu doğruysa, Script içerisine ekleyebilirsiniz.</p>
<p lang="tr-TR">Bash Script, esasen düz metin satırlarından oluşan bir dosyadır. İstediğiniz bir metin editörü kullanarak yazabilirsiniz. Nano, vi veya emacs bunlardan bir kaçıdır.</p>
<h3 class="western">Basit Bir Örnek</h3>
<p lang="tr-TR">Basit bir örnek yardımıyla konuya giriş yapıyoruz. Aşağıda bulunan dosya içeriğini kopyalayıp bir editör yardımıyla myscript.sh olarak kaydedelim..</p>
<pre class="lang:sh decode:true" title="myscript.sh dosyasının içeriği">#!/bin/bash
# Basit bir Bash Script
# Umut 10/05/2016
echo İşte sizin Ev klasörünüzdeki dosyalar:
ls ~</pre>
<p lang="tr-TR">Kaydettiğimiz dosyanın özelliğini executable (x) olarak değiştirmemiz gerekmektedir. Komut satırından <b>chmod +x myscript.sh</b> komutunu kullanabilir, Görsel Arayüz (GUI) içerisinde ise dosya yöneticisinde dosyaya sağ tıklayıp çalıştırılabilir hale getirebilirsiniz.</p>
<pre class="lang:java decode:true">chmod +x myscript.sh
ls -l myscript.sh
-rwxr-xr-x 1 umut umut 112 May 10 21:12 myscript.sh</pre>
<p lang="tr-TR">Yukarıdaki komut ile yetki kontrolü yaptık. Şimdi de aşağıdaki komutla Script dosyamızı çalıştıralım. Burada dosyanın başına ./ yazıldığına dikkat edin. Bu konuyu aşağıda ayrı bir başlıkta açıkladık.</p>
<pre class="lang:java decode:true" title="myscript.sh Script Çıktısı">./myscript.sh
---ÇIKTI---
İşte sizin Ev klasöründeki dosyalar:
Downloads Pictures Templates
Dropbox test.txt</pre>
<p lang="tr-TR"><b>Script Kodlarının Açıklaması</b>:</p>
<pre class="lang:sh decode:true" title="myscript.sh dosyasının içeriği">#!/bin/bash
# Basit bir Bash Script
# Umut 10/05/2016
echo İşte sizin Ev klasörünüzdeki dosyalar:
ls ~</pre>
<p lang="tr-TR"><b>.</b><b>sh uzantısı </b></p>
<p lang="tr-TR">Linux, çalışma esnasında dosya uzantılarına ihtiyaç duymayan bir İşletim sistemidir. Dosya uzantıları, kullanıcıların dosyaları daha hızlı algılaması için kullanılırlar ancak zorunlu değillerdir. myscript dosyamızın uzantısı .sh olmak zorunda olmadığı halde .sh ifadesi onun bir bash script dosyası olduğunu hemen anlamamıza yardımcı olmaktadır.</p>
<pre class="lang:sh decode:true">#!/bin/bash</pre>
<p lang="tr-TR"><b>#!:</b>Bir script dosyasının ilk satırı bu iki karakterle başlamalıdır. <b>Shebang </b>olarak ifade edilen bu karakterlerden hemen sonra, boşluk bırakmadan hangi bash programı kullanılacaksa o programın mutlak adresi yazılır.</p>
<p lang="tr-TR"><b></b> <strong>/bin/bash:</strong> Burada belirtilmesi gereken diğer bir konu da sisteminizde hangi bash yazılımını kullandığınızdır.<em> which bash</em> komutunun sonucu size mutlak adresi söyleyecektir. #! ifadesinden sonra herhangi bir bash adresi yazmasanız da Script çalışabilir. Fakat sizin yazdığınız Script başka bir sistemde çalıştırılmak istendiğinde hata verme ihtimali vardır. Bu sebeple bash adresini yazmayı alışkanlık haline getirmek daha sağlıklı olacaktır.</p>
<pre class="lang:sh decode:true "># Basit bir Bash Script</pre>
<p lang="tr-TR"># ifadesiyle başlayan satırlar yorum satırlarıdır. Bu satırları Bash yorum olarak farz edecek ve işleme almayacaktır. Dosyanın sahibi, oluşturulma tarihi ve oluşturulma maksadı vb. bilgilere burada yer verebilirsiniz.</p>
<p lang="tr-TR">Kodlarınız ve satırlar çoğaldıkça,  hangi kodların ne işe yaradığını tekrar hatırlamak zorlaşacaktır. Aynı zamanda kodlarınızı bir başkasının incelemesi gerektiğinde, yorum bölümleri oldukça önem kazanır. Kodlarınızın yanına kısa yorumlar ve açıklamalar eklemeyi alışkanlık haline getirmek oldukça önemlidir. Her satıra gerek olmasa da kodlarınızın önemli bölümlerine yorum ve açıklamalar yazmanızı tavsiye ediyoruz.</p>
<pre class="lang:sh decode:true ">echo İşte sizin Ev klasörünüzdeki dosyalar</pre>
<p lang="tr-TR">Burada, echo komutu ile bir mesajı ekrana yazdırıyoruz. Bu örnekte sabit bir metin kullandık ancak ilerleyen bölümlerde değişkenlerin ve diğer değerlerin ekrana yazdırılması için sık sık <em>echo</em> komutunu kullanacağız.</p>
<pre class="lang:sh decode:true ">ls ~</pre>
<p lang="tr-TR">Son satırımızda ls komutu ile Ev klasörünün listesini ekrana yazdırıyoruz.</p>
<p lang="tr-TR">Yukarıdaki örnek Script kavramının açıklanması için oluşturulmuştur. Görünürde sadece iki satır komutu çalıştırmak gibi basit bir işlevi yerine getirmiş olabilir. Script dosyalarının içeriği geliştirildikçe, çok daha karışık işlemleri nasıl basitleştirdiklerini aşağıda göreceğiz.</p>
<h3 class="western" lang="tr-TR">Neden ./ ?</h3>
<p lang="tr-TR">Linux komut satırına bir program yazdığınızda, sisteminiz o programı PATH adı verilen değişkende tutulan klasörlerde arayacaktır. Sizin oluşturduğunuz myscript.sh dosyası, muhtemelen bu klasörlerin içerisinde bir yerde değildir çünkü Linux güvenlik açısından kullanıcının erişebileceği klasör yetkilerini sınırlar.</p>
<p lang="tr-TR">Linux sisteminizin, yazdığınız komutu hangi klasörlerde aradığını echo $PATH komutu ile öğrenebilirsiniz. myscript.sh dosyanız bu klasörlerde değil başka bir yerde kayıtlıdır. Bu durumda Linux'a PATH klasörlerinde arama, şu an bulunduğum klasördeki myscript.sh programını çalıştır diye belirtmeniz gereklidir. İşte şu an bulunduğum klasör ifadesi ./ işaretiyle gerçekleştirilir.</p>
<p lang="tr-TR">İsterseniz PATH değişkenine klasör ilave edebilirsiniz ancak bu güvenlik açısından her zaman iyi olmayabilir. Yazdığınız Script içerisinde bağıl adresleme (./) kullanarak kod yazmak, başka kullanıcıların da bu scripti kullanabilmesine imkan verir.</p>
<h3 class="western" lang="tr-TR">Değişkenler</h3>
<p lang="tr-TR">Değişkenler hafızalarında değerler tutan, referans olarak kullanılan ve gerektiğinde değişebilen kullanımlardır. Hafızada bir miktar yer ayırıp içerisinde bir değer tutarsınız ve ihtiyacınız olduğunda başka bir hafıza alanı kullanmadan değişkenin değerini değiştirip tekrar kullanabilirsiniz. Çok kullanışlı bir yapı olan değişkenlerin kullanımında uyulması gereken bazı kurallar bulunmaktadır. Bu kurallara mutlaka uymalısınız.</p>
<ul>
<li>
<p lang="tr-TR">Bir değişken tanılarken onun ADINI yazarız ve hiç boşluk bırakmadan eşittir (=) işaretiyle devam ederiz. Eşittir işaretinden sonra da boşluk bırakmadan TEK DÜZ TIRNAK içerisinde değeri yazarız. <b>Not</b>: Tırnaklar içerisine bir değer değil de bir komut sonucu da yazdırılabilir ancak onu birazdan göreceğiz.</p>
</li>
<li>
<p lang="tr-TR">Bir değişkene atıfta bulunup referans göstermek istediğinizde, değişken isminin başına ( $ ) işareti konulmalıdır.</p>
</li>
</ul>
<p lang="tr-TR">Örnek:</p>
<p lang="tr-TR">Öncelikle degiskenornek.sh isimli bir dosya oluşturalım.</p>
<pre class="lang:sh decode:true" title="Nano editörle degiskenornek.sh dosyasını oluşturup açıyoruz.">nano degiskenornek.sh</pre>
<p lang="tr-TR">Açılan dosyaya, aşağıdaki kodları yapıştırın. Bazı sistemlerde yapıştırma Shift+Ctrl+v ile yapılır. Yapıştırma işleminden sonra Ctrl+x ile çıkış isteği yapalım ve kaydetmek istiyor musunuz? sorusuna EVET cevabı verelim.</p>
<pre class="lang:java decode:true" title="degiskenornek.sh dosyasının içeriği">#!/bin/bash
# Basit bir değişken örneği
# Umut 11/05/2016
name='Umut'
echo Merhaba $name</pre>
<p class="lang:sh decode:true " title="degiskenornek.sh Script Çıktısı">Aşağıdaki komut yardımıyla dosyayı çalıştırılabilir yaptık ve çalıştırdık.</p>
<pre class="lang:java decode:true">chmod +x degiskenornek.sh 
./degiskenornek.sh 
---ÇIKTI---
Merhaba Umut</pre>
<p lang="tr-TR"><b>Açıklama:</b></p>
<pre class="lang:sh decode:true">name='Umut'</pre>
<p lang="tr-TR">name değişkenin adıdır. Atıfta bulunacağımız zaman $name olarak çağırmalıyız. Eşittir işaretinin sağ ve solunda boşluk olmadığına dikkat edin. TEK DÜZ TIRNAK içerisine de değerimiz (Umut) yazılmıştır.</p>
<pre class="lang:sh decode:true ">echo Merhaba $name</pre>
<p lang="tr-TR">Burada ise echo komutundan Merhaba sabit değeri ile $name değişken değerini alarak ekrana yazdırması söylenmiştir.</p>
<p lang="tr-TR"><b>ALIŞTIRMA</b>: degiskenornek.sh dosyasını tekrar açıp içerisine surname değişkenini ve değerini tanımlayın. Echo komutunu</p>
<pre class="lang:sh decode:true ">echo Merhaba $name $surname</pre>
<p lang="tr-TR">olarak değiştirip kaydedin ve çıkın. Yazdığınız scripti tekrar çalıştırın.</p>
<h3 class="western" lang="tr-TR">Script Çalıştırdığınızda Arka Plandaki Değişkenler</h3>
<p lang="tr-TR">Siz bir Script yazıp çalıştırdığınızda, sizin tanımladığınız değişkenlere ilave olarak sisteminiz de otomatik olarak bir takım değişkenleri hayata geçirir. Bunlardan bazılarını aşağıda açıkladık:</p>
<ul>
<li>
<p lang="tr-TR"><b>$0</b> – Scriptin adı bu değişkende tutulur.</p>
</li>
<li>
<p lang="tr-TR"><b>$1 - $9</b> – Scripte komut satırından (dışarıdan gönderilen) argümanlar 1 ile 9 arasındaki değişkenlerde kayıt edilir.</p>
</li>
<li>
<p lang="tr-TR"><b>$#</b> - Scripte dışarıdan gönderilen toplam argüman sayısı bu değişkende tutulur.</p>
</li>
<li>
<p lang="tr-TR"><b>$*</b> - Scripte dışarıdan gönderilen argümanların tamamı anlamına gelir.</p>
</li>
</ul>
<p lang="tr-TR"><b>Örnek</b>:</p>
<p lang="tr-TR">Yukarıdaki örnekte yaptığımıza benzer şekilde aşağıdaki nano komutuyla bir dosya oluşturalım.</p>
<pre class="lang:java decode:true" title="Nano editörle otomatikornek.sh oluşturulup açalım">nano otomatikornek.sh</pre>
<p lang="tr-TR">Açılan dosyaya, aşağıdaki Script kodlarını yapıştıralım.</p>
<pre class="lang:sh decode:true" title="otomatikornek.sh Script Dosya İçeriği">#!/bin/bash
# Basitin biraz ötesinde değişken örneği
# Umut 11/05/2016

clear
echo Ben: Benim adım $0 ve ben komut satırından toplam $# argüman gönderdim.
echo Bilgisayar: Evet, gönderdikleriniz bunlardı: $*
echo Bilgisayar: Ve gönderdiğiniz 2. argüman da $2, doğru mu? :\)
</pre>
<p class="lang:sh decode:true " title="otomatikornek.sh Script Çıktısı">Dosyayı çalıştırılabilir yapalım ve çalıştıralım.</p>
<pre class="lang:sh decode:true">chmod +x otomatikornek.sh 
./otomatikornek.sh Umut Serhat Mesut 
---ÇIKTI---
Benim adım ./otomatikornek.sh ve ben komut satırından toplam 3 argüman gönderdim. 
Bilgisayar: Evet, gönderdikleriniz bunlardı: Umut Serhat Mesut 
Bilgisayar: Ve gönderdiğiniz 2. argüman da Serhat , doğru mu? :)</pre>
<p lang="tr-TR"><b>Açıklama:</b></p>
<pre class="lang:sh decode:true ">echo Ben: Benim adım $0 ve ben komut satırından toplam $# argüman gönderdim.</pre>
<p lang="tr-TR">Bu satırda $0 ile script dosyasının ismi çağrılmış ve $# ile toplam argüman sayısı kullanılmıştır.</p>
<pre class="lang:sh decode:true ">echo Bilgisayar: Evet, gönderdikleriniz bunlardı: $*</pre>
<p lang="tr-TR">Bu satırda $* ile değişkenlerin tamamı yazdırılmıştır.</p>
<pre class="lang:sh decode:true ">echo Bilgisayar: Ve gönderdiğiniz 2. argüman da $2, doğru mu? :\)</pre>
<p lang="tr-TR">Bu satırda $2 ile gönderilen 2.sıradaki argüman değişkeni çağrılmış ve ekrana yazdırılmıştır.</p>
<p lang="tr-TR"><b>ALIŞTIRMA</b>:</p>
<p lang="tr-TR">Scripte 1 argüman gönderseydik ne olurdu?</p>
<p lang="tr-TR">Scriptte :\) yazdığımız halde çıktıda neden : ) olarak görünüyor?</p>
<h3 class="western" lang="tr-TR">Ters Tırnaklar</h3>
<p lang="tr-TR">Yukarıdaki örneklerde değişkenlerimizi TEK DÜZ TIRNAK içerisinde sabit string değerler olarak tanımladık. Bazen bir değişkene, bir komutun sonucunu kaydetmek isteyebiliriz. Bu durumda sabit değil bir komutu tanımlamamız gerekecektir. Böyle durumlarda değişkenin eşittir işaretinin sağ tarafında bulunan ifadeyi TERS TIRNAK (`ifade`) içerisinde yazmamız gerekecektir. Klavyelerimizde yeri pek bilinmeyen bu işaret genellikle , ve ; tuşunda (TR Q) bulunur. AltGr tuşuyla birlikte virgül karakterinin bulunduğu tuşa basarak yazabilirsiniz. Bununla ilgili bir örnek yapalım.</p>
<p lang="tr-TR">Örnek:</p>
<p lang="tr-TR">Bu komut ile terstirnak.sh dosyasını nano editörde oluşturalım.</p>
<pre class="lang:java decode:true " title="Nano editör ile terstirnak.sh oluşturuyoruz">nano terstirnak.sh</pre>
<p lang="tr-TR">Aşağıdaki script kodlarını terstirnak.sh dosyası içerisine yapıştıralım ve Ctrl+x ile çıkış isteği yapalım.</p>
<pre class="lang:sh decode:true " title="terstirnak.sh Script Dosya İçeriği">#!/bin/bash
# Basit bir TERS TIRNAK içinde değişken örneği
# Umut 11/05/2016

sistem=`uname -a`
echo Sistem bilginiz: $sistem</pre>
<p class="lang:java decode:true " title="terstirnak.sh Script Çıktısı">terstirnak.sh dosyasını çalışır hale getirelim ve çalıştıralım.</p>
<pre class="lang:sh decode:true" title="terstirnak.sh Script Çıktısı">chmod +x terstirnak.sh 
./terstirnak.sh 
---ÇIKTI---
Sistem bilginiz: Linux umut-X550JX 4.4.0-21-generic #37~14.04.1-Ubuntu SMP Wed Apr 20 16:33:38 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux</pre>
<p lang="tr-TR"><b>Açıklama</b>:</p>
<pre class="lang:sh decode:true ">sistem=`uname -a`</pre>
<p lang="tr-TR">uname -a bir komuttur. Echo ekrana Ters Tırnaklar içerisindeki ifadeyi aynen değil, komutun sonucunu yazdırmıştır.</p>
<p lang="tr-TR"><strong>ALIŞTIRMA</strong>:</p>
<p lang="tr-TR">Script dosyasındaki sistem değişkenine başka komutlar yazarak sonuçları gözlemleyin.</p>
<h3 class="western" lang="tr-TR">Basit Bir Yedekleme Script Dosyası</h3>
<p lang="tr-TR">Aşağıda, ismini verdiğiniz bir klasörü, yedeklerinizin bulunduğu bir diğer klasöre yedekleme yapan Script verilmiştir. İsterseniz ayrı bir .sh dosyası oluşturarak deneyebilirsiniz. İsterseniz de kodlar üzerinden hangi işlemlerin yapıldığını takip edebilirsiniz. Şu ana kadar anlatılanların pekişmesi açısından üzerinde çalışmanızı tavsiye ediyoruz.</p>
<p lang="tr-TR">Script, Sisteminize bir zarar meydana getirmemesi için oluşturacağı klasör ve dosyaları /tmp klasörüne kaydedecektir.</p>
<pre class="lang:java decode:true " title="Nano Editörle backup.sh dosyası oluşturuyoruz.">nano backup.sh</pre>
<pre class="lang:sh decode:true" title="backup.sh Script Dosya İçeriği">#!/bin/bash
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
<pre class="lang:java decode:true" title="backup.sh Scripti ve gönderilen Argüman">chmod +x backup.sh
./backup.sh yedekleme</pre>
<h3 class="western">If -Then-Else Kullanımı</h3>
<p lang="tr-TR">Yukarıdaki yedekleme örneğinde işlemlerin hatasız yapıldığı farz edilmiştir. Yapılan işlemlerin herhangi bir adımında sorun çıkması durumda ne yapılacağı senaryoda yoktur. Bu tür durumlar için Script yazarken kullanılan şart ve durumsal yapılardan bir tanesi If yapısıdır.</p>
<p lang="tr-TR">If yapısı, bir şartı kontrol eder ve o şart sağlanıyorsa işlemi yapar. Sağlanmıyorsa işlemi iptal eder. Bir nevi ön kontrol yapar. Kontrol, işlem gerçekleşmeden önce yapılmaktadır.</p>
<p lang="tr-TR">Aşağıdaki örneği, önceki örneklerde olduğu gibi bir .sh dosyası oluşturup kaydedebilir veya kodlar üzerinden de inceleyerek anlamaya çalışabilirsiniz.</p>
<pre class="lang:sh decode:true" title="Bir Yedekleme Örnek Script Kodları">#!/bin/bash
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
<p lang="tr-TR"><b>Açıklama</b>:</p>
<p lang="tr-TR"><u>1.Kullanım:</u></p>
<pre class="" lang="tr-TR">if şart=eşleşiyor
then
işlemleri yap
exit
fi</pre>
<p lang="tr-TR">Yukarıdaki örnekte ilk if kullanımı [ $# != 1 ] şartı ile kontrol yapmaktadır. Bu şart, Scripte dışarıdan girilen argüman sayısının bire eşit olmaması durumudur. Öyleyse burada Script'e girilen argüman bire eşit değilse yani (0 veya Birden fazla argüman girildiyse) bir takım işlemleri yapıp çıkması istenmiştir.</p>
<p lang="tr-TR"><u>2.Kullanım:</u></p>
<pre class="" lang="tr-TR">if şart1=eşleşiyor
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
<p lang="tr-TR">Yukarıdaki örnek içerisinde 2.kullanım şekli de if yapısını ELSE yani diğer türlü olduğunda yapılacak işlemleri de tanımlayarak algoritmayı genişleterek kullandık. Üstelik şart1 gerçekleştiğinde yapılacak işlemler arasına da bir if kullanımı yerleştirerek içiçe kullanımı da göstermiş olduk. Bu tarz kullanımda if kontrol mekanizmasına [-d /tmp/backups/$1_$date ] şartı ile yedeğin bugün içerisinde önceden alınıp alınmadığı kontrol ettiriliyor. Alınmışsa takip edilecek yol ve işlemler belirtiliyor. Alınmamış ise (ELSE) yapılacak işlemler belirtiliyor.</p>
<p lang="tr-TR"><u>3.Kullanım:</u></p>
<pre class="" lang="tr-TR">echo 'Bu klasörün bugün yedeği alınmış. Yine de üstüne yazılsın mı?'
read answer 
if [ $answer != 'y' ]
then
exit</pre>
<p lang="tr-TR">Burada ise, kullanıcıya bir soru soruluyor ve cevabı bekleniyor. Girilen cevap <b>read answer</b> komutu ile answer değişkenine yerleştiriliyor, sonrasında if-then yapısıyla kontrol ediliyor. Girilen cevap y değilse <strong>[!='y']</strong> çıkılıyor.</p>
<p lang="tr-TR"><b>ALIŞTIRMA</b>: Kullanıcı cevap olarak y tuşuna basması gerektiğini nereden bilecek?</p>
<p lang="tr-TR">[highlight bgcolor="#DDFF99" txtcolor="#000"]Bu yazı yeterince uzun oldu. BASH Script ile ilgili diğer konuları bir başka yazıda ele alacağız.[/highlight]</p>
