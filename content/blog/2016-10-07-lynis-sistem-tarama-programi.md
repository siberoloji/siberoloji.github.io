---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Nasıl Yapılır
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
cmplz_hide_cookiebanner:
- ""
date: "2016-10-07T01:36:00Z"
excerpt: Linux Ev kullanıcıları veya sistem yöneticileri tarafından kullanılan veya
  kullanılması gereken önemli tarama programlarından bir tanesi de lynis isimli programdır.
  Bu yazıda, sistemimizin çalışmasını sağlayan servislerin ve hizmetlerin entegre
  ve hatasız çalışıp çalışmadığını kontrol etmek amacıyla kullanılan "lynis" aracının
  kurulum ve kullanımı açıklanacaktır.
guid: https://www.siberoloji.com/?p=1099
id: 1099
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux
- lynis
title: Lynis Sistem Tarama Programı
url: /tr/lynis-sistem-tarama-programi/
---

  Linux Ev kullanıcıları veya sistem yöneticileri tarafından kullanılan veya kullanılması gereken önemli tarama programlarından bir tanesi de lynis isimli programdır. Bu yazıda, sistemimizin çalışmasını sağlayan servislerin ve hizmetlerin entegre ve hatasız çalışıp çalışmadığını kontrol etmek amacıyla kullanılan "lynis" aracının kurulum ve kullanımı açıklanacaktır. 
 

  Program, GPLv3 lisansıyla dağıtılmaktadır ve komut satırından çalışmaktadır. Şirketler için ticari sürümü de bulunan programın, tüm sisteminizi tarayıp sonuç raporunu ''.log'' dosyası şeklinde bilgisayarınıza kaydettiğini belirtelim.&nbsp;Bulunan HATA ve TAVSİYELER konusunda, ticari sürümde doğrudan çözümler sunulduğu halde ücretsiz sürümde hataları, ''log'' dosyası içerisinden kendiniz bulup, gerekli tedbiri de kendiniz almak durumundasınız. Ancak bunu yapmak o kadar da zor değil. 
 

  Aşağıdaki komutlarda bu yazının hazırlandığı tarihte en güncel sürüm olan "2.3.4" kullanılmıştır. Siz, en son sürümü bu&nbsp;<a href="https://cisofy.com/downloads/" target="_blank" rel="noreferrer noopener">bağlantıdan</a>&nbsp;kontrol ederek komutlara '''2.3.4''' yerine en son sürümün numarasını yazabilirsiniz. 
 

 
 ## Lynis Kurulum</h2>
<!-- /wp:heading -->

  Aşağıdaki komutlar yardımıyla sıkıştırılmış arşiv dosyasını /tmp klasörüne indiriyoruz. İndirilen dosyayı /usr/local klasörüne açıyoruz. Arşiv açıldığında /usr/local klasörünün içerisine /lynis isimli klasörü oluşturacaktır. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /tmp
wget <a href="https://cisofy.com/files/lynis-2.3.4.tar.gz">https://cisofy.com/files/lynis-2.3.4.tar.gz</a>
sudo tar -xvf lynis-2.3.4.tar.gz -C /usr/local/</pre>
<!-- /wp:preformatted -->

 
 ## Lynis Tarama</h2>
<!-- /wp:heading -->

  Açılan dosyaların olduğu klasöre girerek lynis programını kurulum yapmadan doğrudan çalıştırabilirsiniz. Çalıştırabilmek için sistemde yönetici yetkilerine&nbsp;sahip olmalısınız. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /usr/local/lynis
sudo ./lynis -c -Q</pre>
<!-- /wp:preformatted -->

  <strong>-c seçeneği</strong>: (--check-all) tüm kontrolleri yapmayı sağlar 
 

  <strong>-Q seçeneği</strong>: Her adımda kullanıcıdan onaya gerek olmadan otomatik devam etmesini sağlar. 
 

  Tarama aşağıdaki tüm başlıklarda sisteminizi kontrol edecektir. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Sistem Araçları: Sistemdeki ikilik (binary) dosyaları</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Boot ve Servisler: Açılış yükleyicisi, başlangıç hizmetleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Çekirdek: Çalışma seviyesi (run level), yüklenmiş modüller, çekirdek ayarları</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Hafıza ve İşlemler: zombi işlemler, G/Ç bekleyen işlemler</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kullanıcılar, Gruplar, Yetkilendirme: Grup Kimlikleri, sudo Yetkilileri, Parola süreleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kabuklar, Terminaller</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Dosya Sistemleri: Bağlanma noktaları, /tmp dosyaları, kök (root) dosya sistemi</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Veri Depolarıo: usb-kayıt yerleri, firewire ohci</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>NFS</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılımlar: isim servileri: DNS arama, BIND</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Portlar ve Paketler: İstismar edilebilir, zaafiyet içeren/Yükseltilebilir paketler</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Ağ: İsim sunucularınız, sözde ağ arayüzleri, bağlantılar</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazıcılar: cups ayarları</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: e-posta ve mesajlaşma</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: firewall: iptables, pf</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: Web sunucu: Apache, nginx</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>SSH Desteği: SSH Ayarları</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>SNMP Desteği</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Varitabanları: MySQL root parolası</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>LDAP Servisleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: php: php seçenekleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Squid Desteği</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Log Dosyaları: syslog yönetici, log klasörleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Güvenli Olmayan Servisler: inetd</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Banner ve Kimlik Doğrulama</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Zamanlanmış Görevler: crontab/cronjob, atd</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Hesap Yönetimi: sysstat data, auditd</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Zaman ve Senkronizasyon: ntp yöneticisi</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kriptolama: SSL sertifika zaman aşımı</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sanallaştırma</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Güvenlik Çerçeve Hizmetleri: AppArmor, SELinux, grsecurity durumu</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: Dosya bütünlüğü</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazılım: Zararlı Tarayıcılar</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Ev Klasörleri: Kabuk geçmiş dosyaları</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Tarama sona erdiğinde tüm sonuçlar oluşturulan ''<em>/var/log/lynis.log</em>'' dosyasına kaydedilir. 
 

 
 ## Lynis Tarama Sonuçlarını İnceleme</h2>
<!-- /wp:heading -->

  Tarama ve testlerin sonucunda oluşturulan sonuçların yazıldığı /var/log/lynis.log dosyasını incelememiz gerekmektedir. İşte bu işlem ticari sürümde otomatik yapılırken biz elle&nbsp;yapacağız. Bunun için rapor dosyasını 3 şekilde inceleme imkanımız var; 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Tüm dosyayı inceleme</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Önemli İkazları İnceleme</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Tavsiyeleri İnceleme</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Tüm dosyayı inceleme</h3>
<!-- /wp:heading -->

  Bol zamanınız varsa ve tüm analizleri incelemek isterseniz, aşağıdaki komut raporu terminale yazdıracaktır. Terminalin geriye dönük tarihsel geçmiş satır ayarlarının oldukça büyük olması gerektiğini hatırlatalım. Aksi takdirde raporun ilk satırları hafızada kalmayabilir. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo cat /var/log/lynis.log</pre>
<!-- /wp:preformatted -->

<!-- wp:heading {"level":3} -->
 ### Önemli İkazları İnceleme</h3>
<!-- /wp:heading -->

  Rapor dosyasında önemli ikazlar "Warning" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok işe yarayacaktır. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo grep Warning /var/log/lynis.log</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">[18:51:33] Warning: Found one or more vulnerable packages. [PKGS-7392]  
[18:51:33] Warning: Couldn't find 2 responsive nameservers [NETW-2705]</pre>
<!-- /wp:preformatted -->

  Uç birim çıktısında görüldüğü gibi, bu sistemde PKGS-7392 ve NETW-2705 kodlu iki adet önemli ve ilgilenilmesi gereken konu bulunmaktadır. 
 

<!-- wp:heading {"level":3} -->
 ### Tavsiyeleri İnceleme</h3>
<!-- /wp:heading -->

  Rapor dosyasında Tavsiye edilen konular "Suggestion" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok kullanılabilir. Komutun hemen altında uçbirim çıktısı da görülmektedir. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo grep Suggestion /var/log/lynis.log
</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">20:02:44] Suggestion: Default umask in /etc/login.defs could be more strict like 027 [AUTH-9328]  
20:02:44] Suggestion: Default umask in /etc/init.d/rc could be more strict like 027 [AUTH-9328]</pre>
<!-- /wp:preformatted -->

 
 ## Yardım Bilgilerini Görüntüleme</h2>
<!-- /wp:heading -->

  Aşağıdaki komutlar ile özet ve detaylı yardım sayfalarını görüntüleyebilirsiniz. 
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo ./lynis --help
sudo ./lynis show options</pre>
<!-- /wp:preformatted -->

  Tarama programının sonucunda oluşturulan tavsiyeler (Suggestion) sisteminizi sıkılaştırmak için dikkate almanız konusunda tavsiye niteliğinde olsa da önemli ikazları (Warning) ciddi olarak değerlendirmelisiniz. 
 