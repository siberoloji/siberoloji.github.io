---
layout: post
title: Ubuntu 16.04 ownCloud Kurulum
date: 2016-10-13 20:20:29.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- owncloud
- owncloud kurulum
- ubuntu owncloud
author: siberoloji
---
<p>ownCloud, Dropbox a benzer şekilde dosya paylaşımı yapmanızı sağlayan açık kaynak kodlu bir sunucu yazılımıdır. Doküman, resim ve diğer dosyalarınızı sunucu üzerine yükleyerek paylaşmanıza imkan sağlar. Evinizdeki bilgisayarınıza veya sunucunuza kurarak kendinize ait bir dosya paylaşım sistemi oluşturabilirsiniz.</p>
<p>Yeni kullanıcılar ekleme ve kullanıcılar arası etkileşim özellikleriyle birlikte şirket içinde de kullanımı mümkün olan ownCloud yazılımını Ubuntu 16.04 sürümüne kurulumunu aşağıda açıklayacağız. Ufak farklılar olma ihtimali bulunsa da (<strong>apt</strong> yerine <strong>yum</strong> paket yöneticisi kullanımı vb.) diğer dağıtımlara da (CentOS, Debian) kolayca kurabilirsiniz.</p>
<h3 id="introduction">Ön Gereksinimler</h3>
<p>Bu yazıda anlatılanların başarılı olabilmesi için, sisteminizde önceden bulunması gerekenleri mutlaka kontrol etmelisiniz.</p>
<ul>
<li><strong>sudo yetkili kullanıcı</strong></li>
<li><strong>LAMP Paketleri</strong>: ownCloud, çalışmak için bir sunucuya, veritabanına ve PHP yazılımına ihtiyaç duyar. Bu gerekliliklerin güncel olarak sisteminizde bulunması gerekir. LAMP(Linux, Apache, MySQL, PHP)bu gereklilikleri karşılar. LAMP kurulum için bu <a href="http://www.portlinux.com/linux/5-adimda-lamp-kurulum-ubuntu-16-04/" target="_blank">yazımızı</a> kullanabilirsiniz.</li>
<li><strong>SSL sertifikası (Zorunlu değil)</strong>: Sistemin SSL güvenliği için SSL sertifikası kullanmayı tercih edebilirsiniz. Kritik ve hassas bilgiler depolanacaksa mutlaka tavsiye ediyoruz. SSL sertifikanız yoksa ownCloud size uyarı verecek fakat çalışmaya devam edecektir.</li>
</ul>
<h2 id="step-1-—-owncloud-installation">1.Adım — ownCloud Kurulum</h2>
<p>ownCloud paketleri Ubuntu paket depolarında bulunmamaktadır. O yüzden ownCloud tarafından sunulan paket depolarını sistemimize tanıtalım. Öncelikle depo anahtarını sisteme indirelim.</p>
<pre class="lang:sh decode:true ">curl https://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/Release.key | sudo apt-key add -</pre>
<p>Çıktı</p>
<pre class="lang:sh decode:true ">...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1358  100  1358    0     0   2057      0 --:--:-- --:--:-- --:--:--  2057
OK</pre>
<p>İndirdiğimiz anahtar, güvenlik denetimlerinde kullanılacaktır. Şimdi de ownCloud paket deposunu sisteme tanıtalım.</p>
<p>&nbsp;</p>
<pre class="lang:sh decode:true">echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/ /' | sudo tee /etc/apt/sources.list.d/owncloud.list</pre>
<p>Yeni paket deposunu listemize ekledik. <strong>apt</strong> paket yöneticimizi güncelleyerek kurulabilir paketlerin listesini yenileyelim.</p>
<pre class="lang:sh decode:true ">sudo apt update</pre>
<p>Artık ownCloud sisteme kurulmaya hazır durumda. Aşağıdaki komut ile kurulumu yapalım. Tüm gerekliliklerle birlikte kurulum yapılacaktır.</p>
<pre class="lang:sh decode:true ">sudo apt-get install owncloud</pre>
<p>Kurulum sonunda meydana gelen değişikliklerin Apache sunucu tarafından algılanması için Apache servisini tekrar başlatalım.</p>
<pre class="lang:sh decode:true">sudo systemctl restart apache2</pre>
<div data-unique="step-2-—-mysql-database-configuration"> ownCloud artık sistemimize kuruldu. Şimdi gerekli olan veritabanını oluşturacağız.</div>
<div data-unique="step-2-—-mysql-database-configuration">Bu adıma başlamadan önce bir konuyu hatırlatmakta fayda var. Veritabanı oluşturma esnasında, daha önce LAMP kurarken MySQL için bir root parolası oluşturmuş olmanız gerekiyor. Burada size sorulacak parola Ubuntu İşletim sisteminizin root parolası değildir. MySQL kurulumu esnasında oluşturduğunuz paroladır.</div>
<h2 id="step-2-—-mysql-database-configuration">2. Adım — MySQL Veritabanı Oluşturma</h2>
<p>Başlangıç için MySQL yönetici hesabına erişiyoruz.</p>
<pre class="lang:sh decode:true ">mysql -u root -p</pre>
<p>MySQL veritabanına bağlandığınızda imleç değişecektir. Aşağıdaki komutları sırasıyla girerek uygulayın. Bu işlem sonucunda bir veritabanı oluşturulacak. Bir kullanıcı oluşturulacak ve bu kullanıcıya bir parola belirlenecek. Aşağıdaki 2.komuta tırnak içinde <strong>kullanıcı parolası </strong>yazan yere kendi belirleyeceğiniz parolayı yazın. Bu bilgiler ownCloud web arayüzündeki kurulumda size gerekli olacaktır.</p>
<p>&nbsp;</p>
<pre class="lang:sh decode:true ">CREATE DATABASE owncloud;
GRANT ALL ON owncloud.* to 'owncloud'@'localhost' IDENTIFIED BY 'kullanıcı parolası';
FLUSH PRIVILEGES;
exit</pre>
<p>Bu komutlar ile oluşturduğumuz bilgiler aşağıdadır. Bir sonraki adımda bunları kullanacağız.</p>
<p>Veritabanı Kullanıcı Adı (Database User): <strong>owncloud</strong></p>
<p>Veritabanı Kullanıcı Parolası (Database User Password): <strong>Kullanıcı parolası (siz belirlediniz)</strong></p>
<p>Veritabanı Adı (Database Name): <strong>owncloud</strong></p>
<p>Sunucu: <strong>localhost</strong></p>
<h2 id="step-3-—-owncloud-configuration">3. Adım — ownCloud Aktivasyon</h2>
<p>Kurulumun son aşamasında web tarayıcımızdan web sunucusuna bağlanacağız.</p>
<p>Kurulumu, gerçek bir sunucuda yaptıysanız <em>http://domainadı/owncloud</em> adresini kullanın.</p>
<p>Kurulumu, yerel bir sunucuda yaptıysanız <em>http://localhost/owncloud</em> adresini kullanın.</p>
<p>Aşağıdaki ekran karşınıza gelecektir.</p>
<p><img class="alignnone wp-image-16217 size-large" src="{{ site.baseurl }}/assets/owncloud-1-1024x709.png" alt="owncloud-1" width="1000" height="692" /></p>
<p>Bu ekranda <strong>username</strong> ve <strong>password</strong> yazan yerleri kullanarak, ownCloud yönetici hesap bilgilerini oluşturacağız. Güvenlik açısından <strong>admin</strong> kullanıcı adını<span style="color: #ff0000;"><em> tavsiye etmiyoruz</em></span>. Yöneticiye ait kullanıcı adı ve parolasını oluşturduktan sonra <strong>Storage &amp; database </strong>seçeneğine tıklıyoruz.</p>
<p><img class="alignnone wp-image-16216 size-large" src="{{ site.baseurl }}/assets/owncloud-2-1024x709.png" alt="owncloud-2" width="1000" height="692" /></p>
<p><strong>Data folder</strong> bölümünde herhangi bir değişiklik yapmıyoruz.</p>
<p><strong>MySQL/MariaDB</strong> seçeneğine tıklıyoruz ve açılan <strong>Configure the database </strong>bölümüne, bir önceki adımda oluşturduğumuz veritabanı bilgilerini yazıyoruz.</p>
<p><img class="alignnone wp-image-16215 size-large" src="{{ site.baseurl }}/assets/owncloud-3-1024x709.png" alt="owncloud-3" width="1000" height="692" /></p>
<p><strong>Finish setup</strong> seçeneğine tıklayıp devam ediyoruz. Owncloud karşılama ekranı karşınıza gelecektir.</p>
<p><img class="alignnone wp-image-16213 size-large" src="{{ site.baseurl }}/assets/owncloud-5-1024x705.png" alt="owncloud-5" width="1000" height="688" /></p>
<p>Bu ekranda size, ownCloud sunucunuza Masaüstü Bilgisayar ve Akıllı telefonlardan bağlanabilmek için kullanabileceğiniz istemci programların var olduğu bilgisi verilmektedir. Sağ üst köşede bulunan <strong>x</strong> çarpı işaretiyle bu pencereyi kapatabilirsiniz.</p>
<p><img class="alignnone wp-image-16212 size-large" src="{{ site.baseurl }}/assets/owncloud-6-1024x705.png" alt="owncloud-6" width="1000" height="688" /></p>
<p>Dosyalarınız yükleyip yönetebileceğiniz ekrana ulaştınız. Yönetim ve ayarlar penceresini keşfetmeye başlayabilirsiniz.</p>
<div data-unique="conclusion"> Bu yazıyı paylaşarak bize destek olabilirsiniz.</div>
