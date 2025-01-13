---
draft: false

title:  'Lynis Sistem Tarama Programı'
date: '2016-10-07T01:36:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux Ev kullanıcıları veya sistem yöneticileri tarafından kullanılan veya kullanılması gereken önemli tarama programlarından bir tanesi de lynis isimli programdır. Bu yazıda, sistemimizin çalışmasını sağlayan servislerin ve hizmetlerin entegre ve hatasız çalışıp çalışmadığını kontrol etmek amacıyla kullanılan "lynis" aracının kurulum ve kullanımı açıklanacaktır.' 
 
url:  /tr/lynis-sistem-tarama-programi/ 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - linux
    - lynis
---
Linux Ev kullanıcıları veya sistem yöneticileri tarafından kullanılan veya kullanılması gereken önemli tarama programlarından bir tanesi de lynis isimli programdır. Bu yazıda, sistemimizin çalışmasını sağlayan servislerin ve hizmetlerin entegre ve hatasız çalışıp çalışmadığını kontrol etmek amacıyla kullanılan "lynis" aracının kurulum ve kullanımı açıklanacaktır.

Program, GPLv3 lisansıyla dağıtılmaktadır ve komut satırından çalışmaktadır. Şirketler için ticari sürümü de bulunan programın, tüm sisteminizi tarayıp sonuç raporunu ''.log'' dosyası şeklinde bilgisayarınıza kaydettiğini belirtelim. Bulunan HATA ve TAVSİYELER konusunda, ticari sürümde doğrudan çözümler sunulduğu halde ücretsiz sürümde hataları, ''log'' dosyası içerisinden kendiniz bulup, gerekli tedbiri de kendiniz almak durumundasınız. Ancak bunu yapmak o kadar da zor değil.

Aşağıdaki komutlarda bu yazının hazırlandığı tarihte en güncel sürüm olan "2.3.4" kullanılmıştır. Siz, en son sürümü bu <a href="https://cisofy.com/downloads/" target="_blank" rel="noreferrer noopener">bağlantıdan</a> kontrol ederek komutlara '''2.3.4''' yerine en son sürümün numarasını yazabilirsiniz.

## Lynis Kurulum

Aşağıdaki komutlar yardımıyla sıkıştırılmış arşiv dosyasını /tmp klasörüne indiriyoruz. İndirilen dosyayı /usr/local klasörüne açıyoruz. Arşiv açıldığında /usr/local klasörünün içerisine /lynis isimli klasörü oluşturacaktır.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /tmp
wget <a href="https://cisofy.com/files/lynis-2.3.4.tar.gz">https://cisofy.com/files/lynis-2.3.4.tar.gz</a>
sudo tar -xvf lynis-2.3.4.tar.gz -C /usr/local/</pre>
<!-- /wp:preformatted -->
## Lynis Tarama

Açılan dosyaların olduğu klasöre girerek lynis programını kurulum yapmadan doğrudan çalıştırabilirsiniz. Çalıştırabilmek için sistemde yönetici yetkilerine sahip olmalısınız.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cd /usr/local/lynis
sudo ./lynis -c -Q</pre>
<!-- /wp:preformatted -->
**-c seçeneği**: (--check-all) tüm kontrolleri yapmayı sağlar

**-Q seçeneği**: Her adımda kullanıcıdan onaya gerek olmadan otomatik devam etmesini sağlar.

Tarama aşağıdaki tüm başlıklarda sisteminizi kontrol edecektir.
* 
* Sistem Araçları: Sistemdeki ikilik (binary) dosyaları

* Boot ve Servisler: Açılış yükleyicisi, başlangıç hizmetleri

* Çekirdek: Çalışma seviyesi (run level), yüklenmiş modüller, çekirdek ayarları

* Hafıza ve İşlemler: zombi işlemler, G/Ç bekleyen işlemler

* Kullanıcılar, Gruplar, Yetkilendirme: Grup Kimlikleri, sudo Yetkilileri, Parola süreleri

* Kabuklar, Terminaller

* Dosya Sistemleri: Bağlanma noktaları, /tmp dosyaları, kök (root) dosya sistemi

* Veri Depolarıo: usb-kayıt yerleri, firewire ohci

* NFS

* Yazılımlar: isim servileri: DNS arama, BIND

* Portlar ve Paketler: İstismar edilebilir, zaafiyet içeren/Yükseltilebilir paketler

* Ağ: İsim sunucularınız, sözde ağ arayüzleri, bağlantılar

* Yazıcılar: cups ayarları

* Yazılım: e-posta ve mesajlaşma

* Yazılım: firewall: iptables, pf

* Yazılım: Web sunucu: Apache, nginx

* SSH Desteği: SSH Ayarları

* SNMP Desteği

* Varitabanları: MySQL root parolası

* LDAP Servisleri

* Yazılım: php: php seçenekleri

* Squid Desteği

* Log Dosyaları: syslog yönetici, log klasörleri

* Güvenli Olmayan Servisler: inetd

* Banner ve Kimlik Doğrulama

* Zamanlanmış Görevler: crontab/cronjob, atd

* Hesap Yönetimi: sysstat data, auditd

* Zaman ve Senkronizasyon: ntp yöneticisi

* Kriptolama: SSL sertifika zaman aşımı

* Sanallaştırma

* Güvenlik Çerçeve Hizmetleri: AppArmor, SELinux, grsecurity durumu

* Yazılım: Dosya bütünlüğü

* Yazılım: Zararlı Tarayıcılar

* Ev Klasörleri: Kabuk geçmiş dosyaları
Tarama sona erdiğinde tüm sonuçlar oluşturulan ''/var/log/lynis.log'' dosyasına kaydedilir.

## Lynis Tarama Sonuçlarını İnceleme

Tarama ve testlerin sonucunda oluşturulan sonuçların yazıldığı /var/log/lynis.log dosyasını incelememiz gerekmektedir. İşte bu işlem ticari sürümde otomatik yapılırken biz elle yapacağız. Bunun için rapor dosyasını 3 şekilde inceleme imkanımız var;
* 
* Tüm dosyayı inceleme

* Önemli İkazları İnceleme

* Tavsiyeleri İnceleme
Tüm dosyayı inceleme

Bol zamanınız varsa ve tüm analizleri incelemek isterseniz, aşağıdaki komut raporu terminale yazdıracaktır. Terminalin geriye dönük tarihsel geçmiş satır ayarlarının oldukça büyük olması gerektiğini hatırlatalım. Aksi takdirde raporun ilk satırları hafızada kalmayabilir.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo cat /var/log/lynis.log</pre>
<!-- /wp:preformatted -->
Önemli İkazları İnceleme

Rapor dosyasında önemli ikazlar "Warning" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok işe yarayacaktır.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo grep Warning /var/log/lynis.log</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">[18:51:33] Warning: Found one or more vulnerable packages. [PKGS-7392]  
[18:51:33] Warning: Couldn't find 2 responsive nameservers [NETW-2705]</pre>
<!-- /wp:preformatted -->
Uç birim çıktısında görüldüğü gibi, bu sistemde PKGS-7392 ve NETW-2705 kodlu iki adet önemli ve ilgilenilmesi gereken konu bulunmaktadır.

Tavsiyeleri İnceleme

Rapor dosyasında Tavsiye edilen konular "Suggestion" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok kullanılabilir. Komutun hemen altında uçbirim çıktısı da görülmektedir.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo grep Suggestion /var/log/lynis.log
</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">20:02:44] Suggestion: Default umask in /etc/login.defs could be more strict like 027 [AUTH-9328]  
20:02:44] Suggestion: Default umask in /etc/init.d/rc could be more strict like 027 [AUTH-9328]</pre>
<!-- /wp:preformatted -->
## Yardım Bilgilerini Görüntüleme

Aşağıdaki komutlar ile özet ve detaylı yardım sayfalarını görüntüleyebilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo ./lynis --help
sudo ./lynis show options</pre>
<!-- /wp:preformatted -->
Tarama programının sonucunda oluşturulan tavsiyeler (Suggestion) sisteminizi sıkılaştırmak için dikkate almanız konusunda tavsiye niteliğinde olsa da önemli ikazları (Warning) ciddi olarak değerlendirmelisiniz.
