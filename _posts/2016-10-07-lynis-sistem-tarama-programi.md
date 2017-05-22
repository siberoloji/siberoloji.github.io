---
layout: post
title: Lynis Sistem Tarama Programı
date: 2016-10-07 21:36:06.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
tags:
- featured
- lynis
- lynis kurulum
- lynis sistem tarama
- lynis tarama programı
author: siberoloji
---
<p>Linux Ev kullanıcıları veya sistem yöneticileri tarafından kullanılan veya kullanılması gereken önemli tarama programlarından bir tanesi de lynis isimli programdır. Bu yazıda, sistemimizin çalışmasını sağlayan servislerin ve hizmetlerin entegre ve hatasız çalışıp çalışmadığını kontrol etmek amacıyla kullanılan "lynis" aracının kurulum ve kullanımı açıklanacaktır.</p>
<p>Program, GPLv3 lisansıyla dağıtılmaktadır ve komut satırından çalışmaktadır. Şirketler için ticari sürümü de bulunan programın, tüm sisteminizi tarayıp sonuç raporunu ''.log'' dosyası şeklinde bilgisayarınıza kaydettiğini belirtelim. Bulunan HATA ve TAVSİYELER konusunda, ticari sürümde doğrudan çözümler sunulduğu halde ücretsiz sürümde hataları, ''log'' dosyası içerisinden kendiniz bulup, gerekli tedbiri de kendiniz almak durumundasınız. Ancak bunu yapmak o kadar da zor değil.</p>
<p>Aşağıdaki komutlarda bu yazının hazırlandığı tarihte en güncel sürüm olan "2.3.4" kullanılmıştır. Siz, en son sürümü bu <a href="https://cisofy.com/downloads/" target="_blank">bağlantıdan</a> kontrol ederek komutlara '''2.3.4''' yerine en son sürümün numarasını yazabilirsiniz.</p>
<h2>Lynis Kurulum</h2>
<p>Aşağıdaki komutlar yardımıyla sıkıştırılmış arşiv dosyasını /tmp klasörüne indiriyoruz. İndirilen dosyayı /usr/local klasörüne açıyoruz. Arşiv açıldığında /usr/local klasörünün içerisine /lynis isimli klasörü oluşturacaktır.</p>
<pre class="lang:sh decode:true ">cd /tmp
wget https://cisofy.com/files/lynis-2.3.4.tar.gz
sudo tar -xvf lynis-2.3.4.tar.gz -C /usr/local/</pre>
<h2>Lynis Tarama</h2>
<p>Açılan dosyaların olduğu klasöre girerek lynis programını kurulum yapmadan doğrudan çalıştırabilirsiniz. Çalıştırabilmek için sistemde yönetici yetkilerine sahip olmalısınız.</p>
<p>&nbsp;</p>
<pre class="lang:sh decode:true">cd /usr/local/lynis
sudo ./lynis -c -Q</pre>
<p><strong>-c seçeneği</strong>: (--check-all) tüm kontrolleri yapmayı sağlar</p>
<p><strong>-Q seçeneği</strong>: Her adımda kullanıcıdan onaya gerek olmadan otomatik devam etmesini sağlar.</p>
<p>Tarama aşağıdaki tüm başlıklarda sisteminizi kontrol edecektir.</p>
<ul>
<li>Sistem Araçları: Sistemdeki ikilik (binary) dosyaları</li>
<li>Boot ve Servisler: Açılış yükleyicisi, başlangıç hizmetleri</li>
<li>Çekirdek: Çalışma seviyesi (run level), yüklenmiş modüller, çekirdek ayarları</li>
<li>Hafıza ve İşlemler: zombi işlemler, G/Ç bekleyen işlemler</li>
<li>Kullanıcılar, Gruplar, Yetkilendirme: Grup Kimlikleri, sudo Yetkilileri, Parola süreleri</li>
<li>Kabuklar, Terminaller</li>
<li>Dosya Sistemleri: Bağlanma noktaları, /tmp dosyaları, kök (root) dosya sistemi</li>
<li>Veri Depolarıo: usb-kayıt yerleri, firewire ohci</li>
<li>NFS</li>
<li>Yazılımlar: isim servileri: DNS arama, BIND</li>
<li>Portlar ve Paketler: İstismar edilebilir, zaafiyet içeren/Yükseltilebilir paketler</li>
<li>Ağ: İsim sunucularınız, sözde ağ arayüzleri, bağlantılar</li>
<li>Yazıcılar: cups ayarları</li>
<li>Yazılım: e-posta ve mesajlaşma</li>
<li>Yazılım: firewall: iptables, pf</li>
<li>Yazılım: Web sunucu: Apache, nginx</li>
<li>SSH Desteği: SSH Ayarları</li>
<li>SNMP Desteği</li>
<li>Varitabanları: MySQL root parolası</li>
<li>LDAP Servisleri</li>
<li>Yazılım: php: php seçenekleri</li>
<li>Squid Desteği</li>
<li>Log Dosyaları: syslog yönetici, log klasörleri</li>
<li>Güvenli Olmayan Servisler: inetd</li>
<li>Banner ve Kimlik Doğrulama</li>
<li>Zamanlanmış Görevler: crontab/cronjob, atd</li>
<li>Hesap Yönetimi: sysstat data, auditd</li>
<li>Zaman ve Senkronizasyon: ntp yöneticisi</li>
<li>Kriptolama: SSL sertifika zaman aşımı</li>
<li>Sanallaştırma</li>
<li>Güvenlik Çerçeve Hizmetleri: AppArmor, SELinux, grsecurity durumu</li>
<li>Yazılım: Dosya bütünlüğü</li>
<li>Yazılım: Zararlı Tarayıcılar</li>
<li>Ev Klasörleri: Kabuk geçmiş dosyaları</li>
</ul>
<p>Tarama sona erdiğinde tüm sonuçlar oluşturulan ''<em>/var/log/lynis.log</em>'' dosyasına kaydedilir.</p>
<h2>Lynis Tarama Sonuçlarını İnceleme</h2>
<p>Tarama ve testlerin sonucunda oluşturulan sonuçların yazıldığı /var/log/lynis.log dosyasını incelememiz gerekmektedir. İşte bu işlem ticari sürümde otomatik yapılırken biz elle yapacağız. Bunun için rapor dosyasını 3 şekilde inceleme imkanımız var;</p>
<ul>
<li>Tüm dosyayı inceleme</li>
<li>Önemli İkazları İnceleme</li>
<li>Tavsiyeleri İnceleme</li>
</ul>
<h3>Tüm dosyayı inceleme</h3>
<p>Bol zamanınız varsa ve tüm analizleri incelemek isterseniz, aşağıdaki komut raporu terminale yazdıracaktır. Terminalin geriye dönük tarihsel geçmiş satır ayarlarının oldukça büyük olması gerektiğini hatırlatalım. Aksi takdirde raporun ilk satırları hafızada kalmayabilir.</p>
<pre class="lang:sh decode:true">sudo cat /var/log/lynis.log</pre>
<h3>Önemli İkazları İnceleme</h3>
<p>Rapor dosyasında önemli ikazlar "Warning" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok işe yarayacaktır.</p>
<pre class="">sudo grep Warning /var/log/lynis.log</pre>
<pre>[18:51:33] Warning: Found one or more vulnerable packages. [PKGS-7392]  
[18:51:33] Warning: Couldn't find 2 responsive nameservers [NETW-2705]</pre>
<p>Uç birim çıktısında görüldüğü gibi, bu sistemde PKGS-7392 ve NETW-2705 kodlu iki adet önemli ve ilgilenilmesi gereken konu bulunmaktadır.</p>
<h3>Tavsiyeleri İnceleme</h3>
<p>Rapor dosyasında Tavsiye edilen konular "Suggestion" ikazı ile kaydedilir. Dolayısıyla bizim, bu ifadeyi filtreleyerek ilgili satırları ekrana yazdırmamız gerekmektedir. Bunun için aşağıdaki komut çok kullanılabilir. Komutun hemen altında uçbirim çıktısı da görülmektedir.</p>
<pre class="">sudo grep Suggestion /var/log/lynis.log
</pre>
<pre class="">20:02:44] Suggestion: Default umask in /etc/login.defs could be more strict like 027 [AUTH-9328]  
20:02:44] Suggestion: Default umask in /etc/init.d/rc could be more strict like 027 [AUTH-9328]</pre>
<h2>Yardım Bilgilerini Görüntüleme</h2>
<p>Aşağıdaki komutlar ile özet ve detaylı yardım sayfalarını görüntüleyebilirsiniz.</p>
<pre class="lang:sh decode:true">sudo ./lynis --help
sudo ./lynis show options</pre>
<p>Tarama programının sonucunda oluşturulan tavsiyeler (Suggestion) sisteminizi sıkılaştırmak için dikkate almanız konusunda tavsiye niteliğinde olsa da önemli ikazları (Warning) ciddi olarak değerlendirmelisiniz.</p>
<p>&nbsp;</p>
