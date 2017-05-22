---
layout: post
title: 5 Adımda LAMP Kurulum (Ubuntu 16.04)
date: 2016-09-19 21:44:38.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- lamp kurulum
- ubuntu 16.04 lamp kurulum
- ubuntu lamp kurulum
author: siberoloji
---
<p><span style="font-weight: 400;">Ubuntu Linux kurulu bilgisayarınızı yerel bir sunucuya dönüştürebilirsiniz. Herhangi bir host firmasından paket satın almadan Wordpress, Joomla vb. uygulamaları evinizde deneyip, web sitenizi tasarlayabilirsiniz. Üstelik deneme ve yeniden yüklemeler çok daha hızlı olacaktır. Bunun için Ubuntu İşletim sisteminize, LAMP kurulum yapmalısınız. LAMP (Linux, <a href="http://www.apache.org/" target="_blank">Apache</a>, <a href="https://www.mysql.com/" target="_blank">MySql</a>, Php) servislerinin bir araya getirilmesi ile oluşur. Bu servislerin baş harfleri kullanılarak ifade edilir. </span><br />
<span style="font-weight: 400;">Bu yazıda, Ubuntu 16.04 LTS sürümüne LAMP kurulum işlemleri adım adım anlatılacaktır. Adımları dikkatlice takip ederseniz, sonunda sizin de bilgisayarınızda bir Apache Sunucunuz olacak ve içerisinde istediğiniz web sitesini, içeriğini çalıştırabileceksiniz.</span></p>
<h2>LAMP kurulum için ön gereksinimler</h2>
<p><span style="font-weight: 400;">Kurulum yapacağınız bilgisayarda, root kullanıcısı dışında bir kullanıcı ile oturum açıyor olmalısınız. Genelde zaten böyledir ancak hatırlatmakta fayda var.</span></p>
<p><span style="font-weight: 400;">İnternet bağlantınız olmalıdır.</span></p>
<h2>LAMP kurulum - 1.Adım - Apache Kurulum</h2>
<p><span style="font-weight: 400;">Apache web sunucusu, şu anda dünyada en popüler sunucudur. Bir web sitesi işletmek için tercih edilenler arasında ilk sıralardadır. Biz de Apache kuralım. Aşağıdaki iki komutu sırayla uygulamalı ve parolanızı girerek paketleri yüklemelisiniz.</span></p>
<pre class="lang:default decode:true">sudo apt update
sudo apt install apache2</pre>
<p><span style="font-weight: 400;">Kurulum işlemi bittiğinde, Apache Web Sunucunun kurulup kurulmadığını web tarayıcınızda, adres satırına aşağıdaki adreslerden birisini yazarak kontrol edebilirsiniz. </span></p>
<p><span style="font-weight: 400;">Adres satırına </span></p>
<p><a href="http://localhost" target="_blank"><span style="font-weight: 400;">http://localhost</span></a></p>
<p><span style="font-weight: 400;">veya </span></p>
<p><a href="http://yerel_ağ_IP_adresiniz" target="_blank"><span style="font-weight: 400;">http://<span style="color: #ff0000;">yerel_ağ_IP_adresiniz</span></span></a></p>
<p><span style="font-weight: 400;">yazarak sayfaya gitmeye çalışın. Yerel Ağ, IP adresinizi <em>ifconfig</em> komutuyla öğrenebilirsiniz. İşler yolunda gitmiş ise aşağıda resimde gördüğünüz sayfa yüklenecektir.</span></p>
<h2> <img class="size-full wp-image-14455 alignnone" src="{{ site.baseurl }}/assets/apache2works.png" alt="apache2works" width="677" height="270" /></h2>
<h2>LAMP kurulum - 2.Adım - MySql Kurulum</h2>
<p><span style="font-weight: 400;">Artık bilgisayarımızda bir Apache Sunucu var. Bir takım bilgi ve servisleri sunabilir. Şimdi sıra sunulacak bu bilgilerin kayıtlı olacağı bir veri tabanı oluşturmaya geldi. Veri tabanı kullanımı, sunulacak bilgilerin organize edilmesi için çok faydalıdır. Burada, MySql veri tabanı sistemini kuracağız. </span></p>
<p><span style="font-weight: 400;">Öncelikle aşağıdaki komutlar yardımıyla MySql için gerekli paketleri kuralım. Sizden paketlerin kurulumu esnasında MySql sistemi içerisinde bulunan “root” kullanıcısı için bir parola oluşturmanız istenecektir. Bu “root” kullanıcısı ile Linux Sisteminizin “root” kullanıcısı </span><b>ayrıdır</b><span style="font-weight: 400;">. Karıştırmayın ve MySql içerisinde, tüm yetkilere sahip “root” kullanıcısı için bir parola belirleyin. Türkçe karakter kullanmamanızı tavsiye ediyoruz.</span></p>
<pre class="lang:default decode:true">sudo apt install mysql-server</pre>
<p><span style="font-weight: 400;">MySql kurulumu tamamlandı fakat</span><span style="font-weight: 400;">, MySql içerisinde bulunan ve gerekli olmayan deneme veri tabanlarını ve varsayılan ayarları kaldırmamız güvenlik açısından önemlidir. “Unutmayın, veri tabanlarının ilk kurulum için bulundurduğu, varsayılan ayarları kullanmaya devam ederseniz, sunucunuz büyük tehlike altında demektir.”</span></p>
<p><span style="font-weight: 400;">Bu komutu verdiğinizde, sizden parola girmeniz istenecektir. Burada girilecek parola, MySql için oluşturduğunuz “root” kullanıcı parolanızdır. Parolayı değiştirmek isteyip istemediğiniz sorulduğunda n tuşu ile “no-hayır” cevabıyla devam edebilirsiniz. Sırayla sizden bir takım işlemleri onaylamanız istenecek. Bunları ENTER tuşu ile kabul ederek devam etmenizi öneriyoruz.</span></p>
<pre class="lang:default decode:true">sudo mysql_secure_installation</pre>
<p><span style="font-weight: 400;">Artık MqSql veri tabanınız kuruldu ve çalışmaya hazır durumda. </span></p>
<h2>LAMP kurulum - 3.Adım - PHP Kurulum</h2>
<p><span style="font-weight: 400;">Apache Sunucu içerisinde komutları, kodları, dinamik web içeriklerini çalıştıracak bir sisteme ihtiyacımız var. Gerektiğinde MySql veri tabanına bağlanacak veya veri tabanından aldığı bilgileri oturum açmış kullanıcıya gösterecek. Tüm bu ve benzeri işlemler için PHP kurmamız gerekiyor. Aşağıdaki komut, PHP kurulumunu sorunsuzca yapacaktır.</span></p>
<pre class="lang:default decode:true">sudo apt install php libapache2-mod-php php-mcrypt php-mysql</pre>
<p><span style="font-weight: 400;">Kurulum sonrasında bir takım ayarlamalar yapmamız faydalı olacaktır. Bunlardan bir tanesi de klasör arama ayarı. Kullanıcı, web tarayıcısından bir klasör çağırdığında Apache öncelikle index.html dosyasını arar. Fakat biz öncelikle index.php dosyasını aramasını ve bulduğunda göstermesini istiyoruz. Bunun için dir.conf dosyamızın içerisinde bir değişiklik yapmalıyız.</span></p>
<pre class="lang:default decode:true">sudo nano /etc/apache2/mods-enabled/dir.conf</pre>
<p><span style="font-weight: 400;">Aşağıda görünen satırda index.php ifadesini, bulunduğu yerden silip en baş tarafa yerleştirelim.</span></p>
<pre class="lang:sh decode:true ">&lt;IfModule mod_dir.c&gt;
DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
&lt;/IfModule&gt;</pre>
<p><span style="font-weight: 400;">Yeni hali aşağıdaki gibi olmalı.</span></p>
<pre class="lang:sh decode:true">&lt;IfModule mod_dir.c&gt;
DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
&lt;/IfModule&gt;</pre>
<p><span style="font-weight: 400;">İşlemi tamamladığınızda <strong>Ctrl+x</strong> tuşları ile çıkış yapın ve kaydetmeyi y tuşuyla onaylayın. Yeni yaptığımız ayarların etkin olması için Apache Sunucusunu tekrar başlatmalısınız. </span></p>
<pre class="lang:sh decode:true">sudo systemctl restart apache2</pre>
<p>Apache servisinin durumunu aşağıdaki komutla kontrol edebilirsiniz.</p>
<pre class="lang:sh decode:true">sudo systemctl status apache2</pre>
<h2>LAMP kurulum - 4.Adım - PHP Modülleri Kurulum (Opsiyonel)</h2>
<p><span style="font-weight: 400;">PHP kurulumundan sonra, işlerinizi kolaylaştıracak bir takım ilave PHP modülleri kurmak isteyebilirsiniz. Hangi modüllerinin kurulabilir olduğunu aşağıdaki komutla görebilirsiniz. Ekrana gelecek listede kısa modül açıklamaları mevcut. Detaylı olarak modülün açıklamasını isterseniz ikinci sırada örneği verilen komutu kullanabilirsiniz. Bir modülü kurmaya karar verdiğinizde ise üçüncü sırada bulunan komut örneği işe yarayacaktır.</span></p>
<pre class="lang:default decode:true ">KURULABİLİR MODÜLLERİN LİSTESİ İÇİN
apt-cache search php- | less

İSTENEN BİR MODÜLÜN DETAY BİLGİSİ İÇİN
apt-cache show istenenmodüladı
Örn:
apt-cache show php-cli

İSTENEN MODÜLÜ KURMAK İÇİN
sudo apt install istenenmodüladı
Örn:
sudo apt install php-cli</pre>
<p><span style="font-weight: 400;">Artık kurulumlar bitti. Kurduğumuz sistemin PHP kodlarını çalıştırıp çalıştırmadığını test etmek ister misiniz? Çok basit bir işlem yapacağız. </span></p>
<h2>LAMP kurulum - 5.Adım - Kurulumu Test Et</h2>
<p><span style="font-weight: 400;">Apache sunucu, kendisinden bir dosya istendiğinde bunu web root olarak ifade edilen klasörde arar. Bu klasör aslında Linux İşletim Sisteminizde “<em>/var/www/html</em>” klasörüdür. O zaman bu klasörün içerisinde bir test.php dosyası oluşturup bakalım. “Apache sunucu bu dosyayı isteğimizde çalıştırabilecek mi?” Aşağıdaki komutla test.php dosyamızı oluşturuyoruz. Komut,  boş olarak dosyayı açacaktır.</span></p>
<pre class="lang:default decode:true ">sudo nano /var/www/html/test.php</pre>
<p><span style="font-weight: 400;">Açılan test.php dosyasının içine aşağıdaki kodları yazıp kaydediyoruz. Ctrl+x tuşları çıkış için yardımcı olacaktır.</span></p>
<pre class="lang:default decode:true ">&lt;?php
phpinfo();
?&gt;</pre>
<p><span style="font-weight: 400;">Şimdi sunucu klasörümüzün içerisinde <em>test.php</em> adlı bir dosyamız var. Bunu web tarayıcımız aracılığıyla istersek, Apache sunucunun bunu bulup bize sunması beklenir. Web tarayıcısı adres satırına aşağıdaki adreslerden istediğiniz şekli yazabilirsiniz.</span></p>
<p><a href="http://localhost/test.php" target="_blank"><span style="font-weight: 400;">http://localhost/<span style="color: #ff0000;">test.php</span></span></a></p>
<p><span style="font-weight: 400;">veya </span></p>
<p><a href="http://yerel_ağ_IP_adresiniz/test.php" target="_blank"><span style="font-weight: 400;">http://<span style="color: #ff0000;">yerel_ağ_IP_adresiniz</span>/test.php</span></a></p>
<p><span style="font-weight: 400;">Aşağıda resimde görülen ekran sizde de açıldıysa başardınız demektir.</span></p>
<p>Test sonucu başarılı ise, oluşturduğumuz test.php dosyasını silebilirsiniz.</p>
<pre class="lang:sh decode:true">sudo rm /var/www/html/test.php</pre>
<p><img class="alignnone wp-image-15995" src="{{ site.baseurl }}/assets/phpversion.png" alt="phpversion" width="700" height="467" /></p>
<p>&nbsp;</p>
<p>Bilgisayarınızı kapatıp açtığınızda Apache servisi otomatik olarak başlamayabilir. Önceden girebildiğiniz sayfalara giremezseniz endişe etmeyin.</p>
<pre class="lang:default decode:true">sudo systemctl restart apache2</pre>
<p><span style="font-weight: 400;">Artık siz de bilgisayarınızda bir sunucuya sahipsiniz. Wordpress, Joomla, Moodle gibi içerik yönetim sistemlerini kurarak gerekli testleri yapabilirsiniz. </span></p>
