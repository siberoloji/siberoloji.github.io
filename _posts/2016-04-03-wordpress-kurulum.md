---
layout: post
title: Ubuntu 14.04 Wordpress Kurulum
date: 2016-04-03 18:10:33.000000000 +03:00
type: post
author: siberoloji
img: cyber8.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- ubuntu 14.04 wordpress kurulum
- wordpress
- wordpress kurulum

---
<p><span style="font-weight: 400;">Günümüzde blog yayımcılığı veya içerik yönetim sistemi (CMS) denildiğinde ilk akla gelen sistemlerden birisi de şüphesiz Wordpress uygulamasıdır. MySql veritabanı ve PHP işlemleri temelinde çalışan Wordpress kullanıcılarına çok büyük bir esneklik sağlamaktadır. Bu sebeple çok popüler hale gelmiştir. Bu yazımızda Ubuntu 14.04 İşletim Sistemimize Wordpress Kurulum adımlarını göstereceğiz. Aşağıda açıklanan adımları sırayla takip ederek Wordpress Kurulumunu sunucunuza veya yerel bilgisayarınıza yapabilirsiniz.</span></p>
<h2>Wordpress kurulum için ön gereksinimler</h2>
<p><span style="font-weight: 400;">Sisteminizde LAMP Stack kurulu olması gerekmektedir. Kurulu değilse, bu </span><a href="https://siberoloji.github.io/5-adimda-lamp-kurulum-ubuntu-14-04/" target="_blank"><span style="font-weight: 400;">adresteki</span></a><span style="font-weight: 400;"> çalışmada belirtilen adımları takip ederek kurabilirsiniz.</span></p>
<p><span style="font-weight: 400;">İnternet bağlantınız olmalıdır.</span></p>
<h2>Wordpress kurulum – 1.Adım – Veri Tabanı ve Kullanıcı Oluşturma</h2>
<p><span style="font-weight: 400;">Burada yapacağımız işlemler, Wordpress Kurulum için hazırlık işlemleridir. Wordpress, ihtiyaç duyduğu bilgileri MySql veri tabanından almak ister. Bu sebeple bir veri tabanına ve bu veri tabanı tablolarını kullanma yetkisine sahip bir kullanıcıya ihtiyaç vardır. Sırayla bunları oluşturalım. Komutların sonundaki ; (noktalı virgül) işaretleri komutlara dahildir. Eksik bırakmamalısınız.</span></p>
<p><span style="font-weight: 400;">MySql veri tabanına root olarak bağlanalım. MySql “root” kullanıcı parolasını, LAMP Stack kurulumu esnasında belirlemiş olmalısınız.</span></p>
<pre class="lang:default decode:true ">mysql -u root -p</pre>
<p><span style="font-weight: 400;">Aşağıdaki komutları sırayla kullanarak istediğiniz ismi verebileceğiniz bir veri tabanı oluşturalım. Buradaki örnekte wordpress olarak kullanılacaktır. Bu veri tabanını kullanacak bir kullanıcı oluşturalım. Bu oluşturduğumuz kullanıcıya gerekli yetkileri verelim.</span></p>
<pre class="lang:default decode:true">CREATE DATABASE wordpress;

CREATE USER wordpressuser@localhost IDENTIFIED BY 'merhaba';

GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;

FLUSH PRIVILEGES;

exit</pre>
<p><span style="font-weight: 400;">Yukarıda yazılı komutları sırayla uyguladıysanız ve problemsiz tamamlandıysa veri tabanınız Wordpress için hazır demektir. Burada elimizdeki bilgileri özetlemekte fayda var.</span></p>
<p><span style="font-weight: 400;">VERİ TABANI ADI: wordpress</span></p>
<p><span style="font-weight: 400;">VERİ TABANI KULLANICI ADI: wordpressuser</span></p>
<p><span style="font-weight: 400;">VERİ TABANI PAROLASI: merhaba</span></p>
<h2>Wordpress kurulum – 2.Adım – Wordpress İndirme</h2>
<p><span style="font-weight: 400;">Wordpress kurulum için elinizde bulunan indirilmiş dosya varsa bunu kullanabilirsiniz ancak en son sürümü indirmenizi tavsiye ederiz. Wordpress, sunucularında latest.tar.gz isimli en son sürümü indirilebilir olarak sunar. Sürüm numarası yazmanıza gerek yoktur. Şimdi sırayla bu dosyayı indirip açalım.</span></p>
<pre class="lang:default decode:true ">cd ~
wget http://wordpress.org/latest.tar.gz</pre>
<p><span style="font-weight: 400;">İndirdiğimiz dosya sıkıştırılmıştır. Bunu açmamız gerekiyor.</span></p>
<pre class="lang:default decode:true ">tar xzvf latest.tar.gz</pre>
<p><span style="font-weight: 400;">Artık /home klasörümüzün içinde wordpress isimli bir klasör var ve içeriği kurulmaya hazır durumda. Son olarak, Wordpress kurulum sonrası sistemimize Fotoğraf yükleyebilmek veya ssh ile bağlanabilmek için gerekli iki paketi Ubuntu depolarından indirmemiz gerekiyor.</span></p>
<pre class="lang:default decode:true ">sudo apt-get update
sudo apt-get install php5-gd libssh2-php</pre>
<h2>Wordpress kurulum – 3.Adım – Wordpress Ayarları</h2>
<p><span style="font-weight: 400;">Wordpress kurulum tamamlandıktan sonra hemen hemen tüm ayarları web arayüzünden yapabilirsiniz. Ancak şimdi komut satırından bir takım işlemler yapmamız gerekiyor. Önceki adımda oluşturulan wordpress klasörüne gidelim.</span></p>
<pre class="lang:default decode:true ">cd ~/wordpress</pre>
<p><span style="font-weight: 400;">Wordpress için gerekli wp-config.php dosyasını oluşturmalıyız. Bu dosyanın oluşturulması için hazır gelen örnek dosyadan türeterek wp-config.php dosyamızı oluşturalım. </span></p>
<pre class="lang:default decode:true ">cp wp-config-sample.php wp-config.php</pre>
<p><span style="font-weight: 400;">Bu adımda, oluşturduğumuz veri tabanı ve kullanıcı bilgilerini wp-config.php dosyasının içerisine yerleştireceğiz. Böylece Wordpress, veri tabanı ile iletişim kurabilecek.</span></p>
<pre class="lang:default decode:true ">nano wp-config.php</pre>
<pre class="lang:default decode:true">// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', 'merhaba');</pre>
<p><span style="font-weight: 400;">Dosyada sadece bu değişiklikleri yapmanız yeterli. Bittiğinde Ctrl+x tuşları yardımıyla kaydedip çıkabilirsiniz.</span></p>
<h2>Wordpress kurulum – 4.Adım – Wordpress’i Web Root klasörüne Kopyala</h2>
<p><span style="font-weight: 400;">Wordpress klasörümüzde gerekli ayarlamaları da yaptıktan sonra artık PHP tarafından bulunabilir hale getirmemiz gerekiyor. Apache sunucu, dosyaları /var/www/html klasöründe aradığına göre dosyalarımızı oraya kopyalayalım. Bu işlem için <em>rsync</em> komutunu kullanacağız. Bu komut sayesinde dosyaların yetki ayarları gibi konularda problem yaşamazsınız.</span></p>
<pre class="lang:default decode:true ">sudo rsync -avP ~/wordpress/ /var/www/html/
cd /var/www/html
ls</pre>
<p><span style="font-weight: 400;">Artık asıl web root klasöründeyiz. Şimdi bu dosyalara sahiplendirme işlemi yapalım. Oturum açtığınız Linux kullanıcısına, bu dosyaları kullanma yetkileri vermemiz gerekiyor. Biz, <em>umut</em> olarak kullanacağız ancak siz kendi kullanıcı adınızı tanımlamalısınız. Ayrıca bir de grup yetkisi tanımlamamız gerekli. Grubumuz, www-data olarak kullanılacak. </span></p>
<pre class="lang:default decode:true ">sudo chown -R umut:www-data *</pre>
<p><span style="font-weight: 400;">Wordpress içerisine yüklediğiniz resim ve diğer materyallerin kullanım yetkisi Wordpress varsayılan ayarlarda biraz kısıtlıdır. Bunu kendi klasörümüzü oluşturarak ve sunucumuza bu klasöre yazma yetkisi vererek çözeceğiz.</span></p>
<pre class="lang:default decode:true ">mkdir /var/www/html/wp-content/uploads
sudo chown -R :www-data /var/www/html/wp-content/uploads</pre>
<p><span style="font-weight: 400;">Wordpress için gerekli tüm altyapı hazırlandı. Artık web arayüzümüzden son kurulum adımlarını tamamladığımızda Wordpress Web sitemiz hazır olacak.</span></p>
<h2>Wordpress kurulum – 5.Adım – Wordpress Kurulum Tamamla</h2>
<p><span style="font-weight: 400;">Web tarayıcınızdan kurulum yapmaya başlamadan önce Apache sunucunuzun tüm ayarlarını güncellemes için tekrar başlatın.</span></p>
<pre class="lang:default decode:true ">sudo service apache2 restart</pre>
<p><span style="font-weight: 400;">Web tarayıcınızın adres kutusuna</span></p>
<p><span style="font-weight: 400;"><a href="http://localhost/" target="_blank">http://localhost/</a> </span><span style="font-weight: 400;">adresini yazarak Wordpress kurulum arayüzüne ulaşın. Bu sayfada dolduracağınız bilgiler oturum açma bilgilerinizdir. Oluşturduğunuz kullanıcı Yönetici yetkilerine sahiptir. </span></p>
<p><span style="font-weight: 400;">UYARI: Web sitelerine yapılan saldırılarda, varsayılan kullanıcı adları admin, administrator oldukça fazla sayıda denenmektedir. O sebeple tahmini zor, sözlüklerde olmayan bir kullanıcı adı seçmek güvenlik açısından faydalı olacaktır.</span></p>
<p><img class="alignnone wp-image-14481 size-medium" src="{{ site.baseurl }}/assets/wordpress1-300x290.png" alt="wordpress1" width="300" height="290" /></p>
<p><img class="alignnone wp-image-14480 size-medium" src="{{ site.baseurl }}/assets/wordpress2-768x490-300x191.png" alt="wordpress2-768x490" width="300" height="191" /></p>
<p><img class="alignnone wp-image-14479 size-medium" src="{{ site.baseurl }}/assets/wordpress3-768x362-300x141.png" alt="wordpress3-768x362" width="300" height="141" /></p>
