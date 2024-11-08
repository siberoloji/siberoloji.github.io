---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Raspberry Pi
cmplz_hide_cookiebanner:
- ""
date: "2024-10-15T16:53:41Z"
guid: https://www.siberoloji.com/?p=3597
id: 3597
image: /assets/images/2024/10/raspberrypi.webp
title: Raspberry Pi 4 ile NAS Sunucusu Nasıl Oluşturulur
url: /tr/raspberry-pi-4-ile-nas-sunucusu-nasil-olusturulur/
---

  Günümüzün dijital dünyasında, merkezi depolama çözümlerine olan ihtiyaç artıyor. Medya dosyalarını, yedeklemeleri veya belgeleri depolamak isteyip istemediğinize bakılmaksızın, bir Ağ Bağlantılı Depolama (NAS) sunucusu, yerel bir ağdaki veya hatta uzaktan cihazlar arasında dosyalara erişmek için kullanışlı bir yol sunar. Ticari NAS cihazları mevcut olsa da pahalı olabilirler. Neyse ki, bir Raspberry Pi 4 ile kendi bütçe dostu NAS sunucunuzu oluşturabilirsiniz.</p>
 

  Bu detaylı kılavuzda, Raspberry Pi 4 kullanarak bir NAS sunucusu kurma sürecini adım adım anlatacağız. Sonunda, evinizdeki veya ofisinizdeki çeşitli cihazlardan erişilebilen tam işlevli bir NAS'a sahip olacaksınız.</p>
 

<!-- wp:heading {"level":3} -->
 ### NAS Sunucusu Nedir?</h3>
<!-- /wp:heading -->

  Ağ Bağlantılı Depolama (NAS) sunucusu, cihazlar arasında merkezi veri depolama ve dosya paylaşımı sağlayan, bir ağa bağlı özel bir cihazdır. Bir NAS ile birden fazla kullanıcı ağ üzerinden sorunsuz bir şekilde verilere erişebilir ve bunları paylaşabilir. NAS sunucuları genellikle şunlar için kullanılır:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Medya akışı</strong> (film, müzik, fotoğraf)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bilgisayarlar ve mobil cihazlar için <strong>yedekleme depolaması</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Ev veya ofis ağı içinde <strong>dosya paylaşımı</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Dünyanın her yerinden dosyalara <strong>uzaktan erişim</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Raspberry Pi 4 ile NAS sunucusu oluşturmak uygun maliyetli, enerji açısından verimli ve özelleştirilebilir olduğundan kişisel kullanım veya küçük ölçekli iş ortamları için idealdir.</p>
 

<!-- wp:heading {"level":3} -->
 ### Neden Raspberry Pi 4?</h3>
<!-- /wp:heading -->

  Raspberry Pi 4, önceki modellere kıyasla geliştirilmiş donanımı nedeniyle bir NAS sunucusu için mükemmel bir adaydır. Temel özellikleri şunlardır:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Dört çekirdekli 64-bit işlemci</strong> : Ağ trafiğini yönetme ve dosya yönetimi için daha iyi performans sağlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>8 GB'a Kadar RAM</strong> : Birden fazla kullanıcıyı ve dosya işlemlerini yönetmek için yeterli bellek.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gigabit Ethernet portu</strong> : Yerel ağınız üzerinden hızlı ve kararlı dosya aktarımı sağlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>USB 3.0 bağlantı noktaları</strong> : Sabit diskler veya SSD'ler gibi harici depolama aygıtlarını bağlamak ve yüksek hızlı veri erişimi sağlamak için gereklidir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Raspberry Pi 4 ayrıca düşük güçte çalışıyor, bu da 7/24 çevrimiçi kalması gereken bir NAS sunucusu için ideal.</p>
 

<!-- wp:heading {"level":3} -->
 ### İhtiyacınız Olanlar</h3>
<!-- /wp:heading -->

  Başlamadan önce aşağıdaki bileşenlerin hazır olduğundan emin olun:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Raspberry Pi 4</strong> (Daha iyi performans için 4GB veya 8GB modeli önerilir)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Raspberry Pi'nin işletim sistemi için <strong>MicroSD kart (16 GB veya üzeri)</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Harici USB sabit disk veya SSD</strong> (dosyalarınızı depolamak için)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>USB 3.0 destekli hub</strong> (isteğe bağlı ancak birden fazla sabit disk kullanılıyorsa önerilir)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Raspberry Pi 4 güç kaynağı</strong> (resmi veya yüksek kaliteli üçüncü taraf)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Pi'yi yönlendiricinize bağlamak için <strong>Ethernet kablosu</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>İlk kurulum için klavye, fare ve monitör</strong> (başsız yapılandırma kullanılıyorsa isteğe bağlı)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Raspberry Pi OS</strong> (Debian tabanlı, daha önce Raspbian olarak biliniyordu)</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Şimdi NAS sunucunuzu oluşturmak için adım adım sürece geçelim.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adım 1: Raspberry Pi 4'ü Kurun</h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1.1 Raspberry Pi İşletim Sistemini Kurun</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>En son <strong>Raspberry Pi işletim sistemini</strong> resmi Raspberry Pi web sitesinden indirin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>İşletim sistemi imajını MicroSD kartınıza yazmak için <strong>Raspberry Pi Imager</strong> veya <strong>Balena Etcher</strong> gibi yazılımları kullanın .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>MicroSD kartı Raspberry Pi 4'ünüze takın ve açın. Klavye, fare ve monitör kullanıyorsanız, standart kurulumla devam edin. Başsız (çevre birimleri olmadan) kurulum yapıyorsanız, SD kartı takmadan önce SD kartın önyükleme bölümünde adlandırılmış boş bir dosya oluşturarak <strong>SSH erişimini etkinleştirebilirsiniz.</strong><code>ssh</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1.2 Güncelleme ve Yükseltme</h4>
<!-- /wp:heading -->

  Raspberry Pi OS yüklendikten ve çalışmaya başladıktan sonra sisteminizi güncellemeniz önemlidir. Bir terminal penceresi açın ve aşağıdaki komutları girin:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt update
sudo apt upgrade</code></pre>
<!-- /wp:code -->

  Bu, en son yazılım güncellemelerine ve güvenlik yamalarına sahip olmanızı sağlar.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adım 2: Dosya Paylaşımı için Samba'yı Kurun ve Yapılandırın</h3>
<!-- /wp:heading -->

  <strong>Farklı cihazlarda dosya paylaşımını etkinleştirmek için Samba'yı</strong>&nbsp;kullanacağız&nbsp;. Samba, Linux ve Windows cihazları arasında dosya ve yazıcı paylaşımına izin veren popüler bir yazılım paketidir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.1 Samba'yı yükleyin</h4>
<!-- /wp:heading -->

  Samba'yı yüklemek için aşağıdaki komutu çalıştırın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt install samba samba-common-bin</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.2 Dosya Depolama için Bir Dizin Oluşturma</h4>
<!-- /wp:heading -->

  Paylaşılan dosyalarınızı depolayacağınız bir klasör oluşturun. Örneğin, dizinde şu şekilde adlandırılan bir klasör&nbsp;<code>shared</code>oluşturalım&nbsp;<code>/home/pi</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">mkdir /home/pi/shared</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.3 Samba'yı yapılandırın</h4>
<!-- /wp:heading -->

  Sonra, dosya paylaşımı için ayarları belirtmek üzere Samba'nın yapılandırma dosyasını düzenlememiz gerekiyor. Yapılandırma dosyasını bir metin düzenleyici kullanarak açın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/samba/smb.conf</code></pre>
<!-- /wp:code -->

  Dosyanın en altına gidin ve aşağıdaki yapılandırmayı ekleyin:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[Shared]
   comment = Shared Folder
   path = /home/pi/shared
   browseable = yes
   writeable = yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   public = no</code></pre>
<!-- /wp:code -->

  Bu yapılandırma, ağ üzerinden erişilebilen paylaşılan bir klasör oluşturacaktır. İzinler, klasöre okuma ve yazma erişimi sağlar.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.4 Samba Kullanıcısı Oluşturma</h4>
<!-- /wp:heading -->

  NAS sunucunuzu güvence altına almak için, paylaşılan dosyalara erişebilen bir Samba kullanıcısı oluşturun. Bir kullanıcı eklemek için aşağıdaki komutu kullanın (&nbsp;<code>pi</code>gerekirse kullanıcı adınızla değiştirin):</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo smbpasswd -a pi</code></pre>
<!-- /wp:code -->

  Kullanıcı için bir parola ayarlamanız istenecektir. İşlem tamamlandıktan sonra, değişiklikleri uygulamak için Samba hizmetini yeniden başlatın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart smbd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Adım 3: Harici Sabit Sürücüyü Bağlayın</h3>
<!-- /wp:heading -->

  Bir NAS sunucusu genellikle dosyaları depolamak için harici bir sabit sürücüye güvenir. Harici sürücünüzü Raspberry Pi 4'e bağlayalım.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3.1 Harici Sürücüyü Tanımlayın</h4>
<!-- /wp:heading -->

  Öncelikle harici sabit diskinizi Raspberry Pi 4'ün USB 3.0 portlarından birine takın. Sürücünün adını bulmak için şu komutu çalıştırın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo fdisk -l</code></pre>
<!-- /wp:code -->

  Listede harici sabit sürücünüzü arayın (genellikle bir adı&nbsp;<code>/dev/sda1</code>veya benzeri bir adı vardır).</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3.2 Sürücüyü Bağlayın</h4>
<!-- /wp:heading -->

  Sürücü için bir bağlama noktası oluşturun:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /mnt/external</code></pre>
<!-- /wp:code -->

  Sürücüyü şu dizine bağlayın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mount /dev/sda1 /mnt/external</code></pre>
<!-- /wp:code -->

  Bağlantıyı kalıcı hale getirmek için (yani önyüklemede otomatik olarak bağlanmak için), sürücüyü dosyaya eklemeniz gerekir&nbsp;<code>/etc/fstab</code>. Dosyayı açın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/fstab</code></pre>
<!-- /wp:code -->

  En alta şu satırı ekleyin:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/dev/sda1 /mnt/external auto defaults 0 0</code></pre>
<!-- /wp:code -->

  Kaydedin ve çıkın. Artık harici sürücünüz başlangıçta otomatik olarak bağlanacaktır.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adım 4: Diğer Aygıtlardan NAS'a Erişimi Yapılandırın</h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4.1 Windows'tan NAS'a Erişim</h4>
<!-- /wp:heading -->

  Windows bilgisayarınızda&nbsp;<strong>Dosya Gezgini'ni</strong>&nbsp;açın ve adres çubuğuna Raspberry Pi'nin IP adresini şu şekilde yazın:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">\\192.168.X.XXX</code></pre>
<!-- /wp:code -->

  Samba kullanıcı adınızı ve parolanızı girmeniz istenecektir. Kimlik doğrulamasından sonra, paylaşılan klasöre erişebileceksiniz.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4.2 macOS'tan NAS'a erişim</h4>
<!-- /wp:heading -->

  macOS aygıtında&nbsp;<strong>Finder'ı</strong>&nbsp;açın , tuşuna basın&nbsp;<code>Cmd + K</code>ve Raspberry Pi'nin IP adresini şu şekilde girin:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">smb://192.168.X.XXX</code></pre>
<!-- /wp:code -->

  Samba kimlik bilgileriniz istenecek ve kimliğiniz doğrulandıktan sonra paylaşılan klasöre erişebileceksiniz.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adım 5: İsteğe bağlı – Uzaktan Erişimi Ayarlayın</h3>
<!-- /wp:heading -->

  NAS sunucunuza evinizin veya ofisinizin ağı dışından uzaktan erişmek istiyorsanız,&nbsp;<strong>OpenVPN</strong>&nbsp;veya&nbsp;<strong>WireGuard</strong>&nbsp;aracılığıyla uzaktan erişim ayarlayabilirsiniz . Ayrıca,&nbsp;<strong>dinamik DNS (DDNS),</strong>&nbsp;periyodik olarak değişirse NAS sunucunuzun IP adresini yönetmenize yardımcı olabilir.</p>
 

<!-- wp:heading {"level":3} -->
 ### Adım 6: NAS Kurulumunuzu Optimize Edin</h3>
<!-- /wp:heading -->

  Temel kurulum tamamlanmış olsa da yapabileceğiniz birkaç iyileştirme ve optimizasyon var:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Daha fazla depolama alanı ekleyin</strong> : Depolama kapasitenizi genişletmek için ek harici sürücüler bağlayın. Yedeklilik için bir RAID yapılandırması bile ayarlayabilirsiniz.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Otomatik yedeklemeler</strong> : NAS'ınıza yedeklemeleri otomatikleştirmek için <strong>rsync</strong> gibi yazılımları kullanın .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Medya akışı : Raspberry Pi'nize </strong><strong>Plex</strong> veya <strong>Emby</strong> gibi medya sunucusu yazılımları yükleyerek videoları ve müzikleri cihazlarınıza aktarın.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Sonuç</h3>
<!-- /wp:heading -->

  Raspberry Pi 4 ile bir NAS sunucusu oluşturmak, dosyaları eviniz veya ofis ağınız genelinde depolamak ve paylaşmak için kişisel bir bulut oluşturmanın uygun maliyetli ve güçlü bir yoludur. Samba ile Windows, macOS veya Linux cihazlarından dosyalara kolayca erişebilir ve bu da onu depolama ihtiyaçlarınız için esnek bir çözüm haline getirir.</p>
 

  Bu kılavuzu takip ederek, ek depolama, otomatik yedeklemeler veya medya akışı yetenekleriyle daha da özelleştirilebilen tam işlevli bir NAS sunucusuna sahip olacaksınız. Kişisel kullanım veya küçük bir işletme için olsun, bir Raspberry Pi 4 NAS sunucusu uygun bir fiyata performans, ölçeklenebilirlik ve kolaylık sunar.</p>
 