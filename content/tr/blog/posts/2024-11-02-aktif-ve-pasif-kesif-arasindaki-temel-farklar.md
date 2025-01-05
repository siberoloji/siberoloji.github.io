---
draft: false

title:  'Aktif ve Pasif Keşif Arasındaki Temel Farklar'
date: '2024-11-02T21:39:38+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Aktif ve pasif keşif arasındaki farkları anlamak, güvenlik uzmanları ve ağ yöneticileri için hayati önem taşır. Bilgi toplamaya yönelik bu iki temel yaklaşım farklı amaçlara hizmet eder ve kendi değerlendirme kümeleriyle birlikte gelir.' 
 
url:  /tr/aktif-ve-pasif-kesif-arasindaki-temel-farklar/
 
featured_image: /images/cybersecurityillustration1.webp
categories:
    - 'Bilgi Toplama'
tags:
    - cybersecurity
    - keşif
---

Aktif ve pasif keşif arasındaki farkları anlamak, güvenlik uzmanları ve ağ yöneticileri için hayati önem taşır. Bilgi toplamaya yönelik bu iki temel yaklaşım farklı amaçlara hizmet eder ve kendi değerlendirme kümeleriyle birlikte gelir. Bu kapsamlı kılavuz, her iki yöntemin temel farklılıklarını, uygulamalarını ve çıkarımlarını inceler.
## Keşif Genel Bakışı
Keşif, genellikle "recon" olarak kısaltılır, hedef sistemler, ağlar veya kuruluşlar hakkında bilginin toplandığı güvenlik değerlendirmesinin ön aşamasıdır. Bu bilgi, olası güvenlik açıklarını, güvenlik duruşunu ve sistem mimarisini anlamak için temel oluşturur.
## Pasif Keşif
Tanım ve Özellikler
Pasif keşif, hedef sistemle doğrudan etkileşime girmeden bilgi toplamayı içerir. Bu yöntem:
<ul class="wp-block-list">
 	* Hedef sistemlerde hiçbir iz bırakmaz
 	* Kamuya açık bilgileri kullanır
 	* Hedef tarafından tespit edilemiyor
 	* Bilgi toplamak daha uzun sürer
 	* Sınırlı bilgi derinliğine sahiptir

Yaygın Teknikler

 	* OSINT (Açık Kaynak İstihbaratı)

<ul class="wp-block-list">
 	* Kamu kayıtları aramaları
 	* Sosyal medya analizi
 	* Haber makaleleri
 	* Kurumsal belgeler
 	* İş ilanları


 	* DNS Bilgileri

<ul class="wp-block-list">
 	* WHOIS aramaları
 	* DNS kayıt analizi
 	* Tarihsel DNS verileri
 	* Ters DNS aramaları


 	* Arama Motoru Sonuçları

<ul class="wp-block-list">
 	* Google aptalları
 	* Önbelleğe alınmış sayfalar
 	* Dizinli belgeler
 	* Site yapı analizi


 	* Kamu Veritabanları

<ul class="wp-block-list">
 	* Sertifika şeffaflık günlükleri
 	* Alan adı kayıt kayıtları
 	* Ticaret sicilleri
 	* Patent veri tabanları

Pasif Keşifte Kullanılan Araçlar
<ul class="wp-block-list">
 	* İnternete bağlı cihaz bilgileri için Shodan
 	* E-posta ve alt alan adı toplama için TheHarvester
 	* İlişki haritalaması için Maltego
 	* Otomatik OSINT toplama için yeniden yapılandırma

## Aktif Keşif
Tanım ve Özellikler
Aktif keşif hedef sistemle doğrudan etkileşimi içerir. Bu yöntem:
<ul class="wp-block-list">
 	* İzlenebilir ayak izleri bırakır
 	* Gerçek zamanlı bilgi sağlar
 	* Güvenlik sistemleri tarafından tespit edilebilir
 	* Daha ayrıntılı sonuçlar verir
 	* Bazı yasal riskler taşır

Yaygın Teknikler

 	* Ağ Taraması

<ul class="wp-block-list">
 	* Port tarama
 	* Hizmet sayımı
 	* Sürüm tespiti
 	* Banner kapma


 	* Ana Bilgisayar Keşfi

<ul class="wp-block-list">
 	* Ping taramaları
 	* ARP taraması
 	* TCP/UDP taraması
 	* ICMP araştırması


 	* Güvenlik Açığı Değerlendirmesi

<ul class="wp-block-list">
 	* Hizmet parmak izi
 	* Yapılandırma analizi
 	* Güvenlik testi
 	* Uygunluk denetimi


 	* Uygulama Analizi

<ul class="wp-block-list">
 	* Web uygulaması taraması
 	* API testi
 	* Kimlik doğrulama araştırması
 	* Giriş doğrulama testi

Aktif Keşifte Kullanılan Araçlar
<ul class="wp-block-list">
 	* Ağ taraması için Nmap
 	* Web sunucusu analizi için Nikto
 	* Paket analizi için Wireshark
 	* Web uygulama testleri için Burp Suite

## Temel Farklar
1. Tespit Riski
Pasif Keşif:
<ul class="wp-block-list">
 	* Neredeyse tespit edilemez
 	* Doğrudan sistem etkileşimi yok
 	* Uyarıları tetikleme riski düşük
 	* Gizli operasyonlar için uygundur

Aktif Keşif:
<ul class="wp-block-list">
 	* Kolayca tespit edilebilir
 	* Ağ trafiği oluşturur
 	* Güvenlik uyarılarını tetikleyebilir
 	* Sistem günlüklerini bırakır

2. Bilgi Doğruluğu
Pasif Keşif:
<ul class="wp-block-list">
 	* Güncel olmayan bilgiler içerebilir
 	* Kamuya açık verilerle sınırlıdır
 	* Daha az detaylı sonuçlar
 	* Doğrulama gerektirir

Aktif Keşif:
<ul class="wp-block-list">
 	* Güncel bilgi sağlar
 	* Doğrudan sistem geri bildirimi
 	* Ayrıntılı teknik veriler
 	* Gerçek zamanlı sonuçlar

3. Yasal Sonuçlar
Pasif Keşif:
<ul class="wp-block-list">
 	* Genel olarak yasal
 	* Kamuya açık bilgileri kullanır
 	* Düşük sorumluluk riski
 	* Minimum uyumluluk sorunları

Aktif Keşif:
<ul class="wp-block-list">
 	* Yetkilendirme gerektirir
 	* Hizmet şartlarını ihlal edebilir
 	* Olası yasal sonuçlar
 	* Sıkı uyumluluk gereklilikleri

4. Kaynak Gereksinimleri
Pasif Keşif:
<ul class="wp-block-list">
 	* Minimum teknik kaynaklar
 	* Zaman yoğun
 	* Daha düşük beceri gereksinimi
 	* Maliyet etkin

Aktif Keşif:
<ul class="wp-block-list">
 	* Özel araçlara ihtiyaç var
 	* Daha hızlı sonuçlar
 	* Daha yüksek beceri gereksinimi
 	* Daha fazla kaynak yoğun

5. Kullanım Örnekleri
Pasif Keşif:
<ul class="wp-block-list">
 	* İlk araştırma aşaması
 	* Rekabet analizi
 	* Tehdit istihbaratı
 	* Risk değerlendirmesi

Aktif Keşif:
<ul class="wp-block-list">
 	* Güvenlik değerlendirmeleri
 	* Penetrasyon testi
 	* Güvenlik açığı taraması
 	* Ağ haritalama

## En İyi Uygulamalar
Her İki Yaklaşımın Birleştirilmesi

 	* Pasif Keşif ile Başlayın

<ul class="wp-block-list">
 	* Temel bilgileri toplayın
 	* Potansiyel hedefleri belirleyin
 	* Kapsamı anlayın
 	* Aktif fazı planla


 	* Aktif Keşfe Geçiş

<ul class="wp-block-list">
 	* Pasif bulguları doğrulayın
 	* Ayrıntılı verileri toplayın
 	* Belirli sistemleri test edin
 	* Belge sonuçları

Belgeleme Gereksinimleri
Aşağıdakilerin ayrıntılı kayıtlarını tutun:
<ul class="wp-block-list">
 	* Kullanılan yöntemler
 	* Toplanan bilgiler
 	* Faaliyetlerin zaman çizelgesi
 	* Bulgular ve anormallikler

Risk Yönetimi
Dikkate almak:
<ul class="wp-block-list">
 	* Yasal uyumluluk
 	* Yetkilendirme düzeyleri
 	* Güvenlik etkileri
 	* Veri koruma

## Pratik Uygulamalar
Güvenlik Değerlendirmeleri

 	* İlk Aşama

<ul class="wp-block-list">
 	* Pasif tekniklerle başlayın
 	* Harita bilinen altyapı
 	* Anahtar sistemleri tanımlayın
 	* Ayrıntılı değerlendirme planlayın


 	* Detaylı Analiz

<ul class="wp-block-list">
 	* Aktif teknikler kullanın
 	* Bulguları doğrulayın
 	* Test güvenlik kontrolleri
 	* Belge güvenlik açıkları

Olay Müdahalesi

 	* Tehdit İstihbaratı

<ul class="wp-block-list">
 	* IOC'lerin pasif toplanması
 	* Tarihsel veri analizi
 	* Saldırı deseni tanıma
 	* Atıf araştırması


 	* Aktif Tepki

<ul class="wp-block-list">
 	* Gerçek zamanlı izleme
 	* Sistem analizi
 	* Ağ denetimi
 	* Tehdit avcılığı

## Sonuç
Etkin ve pasif keşif arasındaki farkları anlamak, etkili güvenlik değerlendirmesi için çok önemlidir. Her yaklaşımın kapsamlı bir güvenlik programında yeri vardır:
<ul class="wp-block-list">
 	* Pasif keşif, tespit veya yasal sorunlar riski olmadan bir bilgi temeli sağlar
 	* Aktif keşif ayrıntılı, güncel bilgiler sunar ancak dikkatli planlama ve yetkilendirme gerektirir
 	* Birleştirilmiş yaklaşımlar genellikle en kapsamlı sonuçları verir
 	* Her iki yöntem için de uygun dokümantasyon ve risk yönetimi önemlidir

Güvenlik uzmanları bu yaklaşımlar arasında seçim yaparken hedeflerini, yasal gereklilikleri ve mevcut kaynakları dikkatlice değerlendirmelidir. En etkili güvenlik değerlendirmeleri genellikle bilgi toplamayı en üst düzeye çıkarırken riskleri ve olası olumsuz etkileri en aza indiren koordineli, iyi planlanmış bir şekilde her iki yöntemi de kullanır.