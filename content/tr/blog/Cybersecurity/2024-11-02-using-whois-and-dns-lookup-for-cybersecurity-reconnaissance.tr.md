---
draft: false
title: Siber Güvenlik Keşif için WHOIS ve DNS Aramasını Kullanma
date: 2024-11-02T21:57:31+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Alan araştırması ve analizi, siber güvenlik keşifinin temel yönleridir. Bir güvenlik uzmanının cephaneliğindeki en değerli araçlardan ikisi WHOIS ve DNS arama hizmetleridir.
url: /tr/siber-guvenlik-kesif-icin-whois-ve-dns-aramasini-kullanma/
featured_image: /images/cybersecurityillustration1.webp
categories:
    - Bilgi Toplama
tags:
    - cybersecurity
    - dns araması
    - whois
---

Alan araştırması ve analizi, siber güvenlik keşifinin temel yönleridir. Bir güvenlik uzmanının cephaneliğindeki en değerli araçlardan ikisi WHOIS ve DNS arama hizmetleridir. Bu araçların nasıl etkili bir şekilde kullanılacağını anlamak, ağ altyapısı ve potansiyel güvenlik açıkları hakkında önemli bilgiler sağlayabilir. Bu kapsamlı kılavuz, meşru güvenlik değerlendirmesi ve savunma amaçları için bu araçlardan nasıl yararlanılacağını araştırıyor.
## WHOIS'i Anlama
WHOIS, kayıtlı alan adları, IP adresleri ve sahipleri hakkında bilgi sağlayan bir sorgu ve yanıt protokolüdür. İlk olarak 1980'lerde geliştirilen WHOIS, ağ yöneticileri, güvenlik uzmanları ve araştırmacılar için gerekli olmaya devam ediyor.
Temel WHOIS Veri Noktaları
WHOIS sorguları tipik olarak şunları ortaya çıkarır:

Kayıt Sahibi Bilgileri
– Kuruluş Adı
– İletişim bilgileri (genellikle gizlilik korumalı olsa da)
– Fiziksel adres
– E-posta adresi

İdari Ayrıntılar
– Alan adı kayıt tarihi
– Son kullanma tarihi
– Son güncelleme tarihi
– Kayıt şirketi bilgileri

Teknik Bilgiler
– İsim sunucuları
– DNSSEC durumu
– Kayıt Durumu
## WHOIS Aramalarını Gerçekleştirme
Komut Satırı Yöntemi

whois example.com
Çevrimiçi Hizmetler

Birkaç güvenilir çevrimiçi WHOIS hizmeti şunları içerir:
– ICANN Araması
- Whois.net
– DomainTools
– Bölgesel İnternet Kayıtları (RIR'ler) web siteleri
## WHOIS Gizlilik Hususları
Modern WHOIS verileri genellikle gizlilik korumasını içerir:
– GDPR uyumluluk önlemleri
– Alan adı gizlilik hizmetleri
– Redakte edilmiş iletişim bilgileri
– Proxy kayıt hizmetleri
## DNS Arama Teknikleri
DNS (Alan Adı Sistemi) aramaları, alan adı altyapısı ve yapılandırması hakkında ayrıntılı bilgi sağlar. Çeşitli DNS kayıt türlerini ve bunların etkilerini anlamak güvenlik değerlendirmesi için çok önemlidir.
Temel DNS Kayıt Türleri
A Kayıtlar (Adres)
– Ana bilgisayar adlarını IPv4 adreslerine eşler
- Ana bilgisayar konumlarını belirlemek için kritik
– Ağ altyapısını ortaya çıkarabilir

AAAA Kayıtları
– Ana bilgisayar adlarını IPv6 adreslerine eşler
– IPv6'nın benimsenmesi büyüdükçe giderek daha önemli hale geliyor
– Güvenlik değerlendirmelerinde genellikle göz ardı edilir

MX Kayıtları (Mail Exchange)
– Posta sunucularını tanımlar
– Posta teslimine öncelik verir
– E-posta altyapısını ortaya çıkarır

TXT Kayıtları
– Metin bilgisi içerir
– Genellikle SPF kayıtlarını içerir
– Güvenlik politikalarını ortaya çıkarabilir

CNAME Kayıtları (Kanonik İsim)
– Alan adı takma adlarını gösterir
- Alanlar arasındaki ilişkileri ortaya çıkarır
– Altyapıyı izlemek için kullanışlıdır

NS Kayıtları (İsim Sunucu)
– Yetkili ad sunucularını listeler
– Etki alanı çözümü için kritik
– Barındırma sağlayıcılarını gösterebilir
## DNS Arama Araçları
Komut Satırı Araçları

dig (Alan Adı Bilgisi Groper)
dig example.com ANY
dig @8.8.8.8 example.com MX
dig +short example.com NS
nslookup
nslookup -type=any example.com
nslookup -type=mx example.com
Ev sahibi
host -a example.com
host -t mx example.com
Çevrimiçi DNS Araçları

DNS çöp kutusu
Güvenlik Yolları
GörünümDNS.info
MX Araç Kutusu
Güvenlik Uygulamaları
## Tehdit İstihbaratı
WHOIS ve DNS verileri tehdit istihbaratına şu şekilde katkıda bulunur:
- Kötü amaçlı alan adlarını belirleme
– Alan adı kayıt kalıplarını takip etme
– Altyapı ilişkilerini ortaya çıkarmak
- Olay müdahalesini destekleme

Etki Alanı Çömelme Tespiti

Bu araçlar aşağıdakileri tanımlamaya yardımcı olur:
– Typosquatting girişimleri
– Kimlik avı alanları
– Marka taklitleri
– Kötü amaçlı yönlendirmeler

Altyapı Analizi

Güvenlik uzmanları şunları yapabilir:
– Harita ağı topolojisi
- Kritik hizmetleri belirleyin
– Güvenlik yapılandırmalarını değerlendirin
– Değişiklikleri izleyin
Keşif için En İyi Uygulamalar
Dokümantasyon

Ayrıntılı kayıtları tutun:
– Sorgu sonuçları
– Zaman içindeki değişiklikler
– Olağandışı bulgular
– Altyapı kalıpları

Düzenli İzleme

Aşağıdakiler için rutin kontrolleri uygulayın:
– Alan Adı Sona Erme
– DNS yapılandırma değişiklikleri
– Yeni alt alanlar
– Değiştirilmiş kayıtlar

Otomasyon Hususları

Senaryoları geliştirmek için:
– Birden fazla alanı izleyin
– Değişiklikleri takip edin
– Raporlar oluşturun
– Şüpheli değişikliklerde uyarı

Analiz Teknikleri

Desen Tanıma

Ara:
– Ortak kayıt detayları
– Benzer adlandırma kalıpları
– Paylaşılan altyapı
– Zamansal ilişkiler

Altyapı Haritalama

Haritalar oluşturun:
– Alan ilişkileri
– IP adresi kullanımı
– Posta sunucu yapılandırmaları
– İsim sunucusu kalıpları

Tarihsel Analiz

Değişiklikleri takip edin:
– Kayıt detayları
– DNS yapılandırmaları
– IP atamaları
– Güvenlik politikaları

Yasal ve Etik Hususlar

Uyumluluk Gereksinimleri

Aşağıdakilere uygunluğu sağlayın:
– Gizlilik yasaları
– Hizmet şartları
– Kullanım politikaları
– Veri koruma düzenlemeleri
## Sorumlu Kullanım
Etik keşif uygulaması:
– Gizliliğe saygı duymak
– Hız limitlerini takip etmek
– Belgeleme amaçları
– Gizliliğin korunması

Araç Entegrasyonu

Güvenlik Bilgileri ve Olay Yönetimi (SIEM)

WHOIS ve DNS verilerini aşağıdakilerle entegre edin:
– Günlük analizi
– Uyarı sistemleri
– Korelasyon kuralları
– Tehdit tespiti

Otomatik Yanıt Sistemleri

Sistemleri şu şekilde yapılandırın:
– Değişiklikleri izleyin
– Şüpheli etkinlik uyarısı
– Kayıt kalıplarını takip edin
– Potansiyel tehditleri belirleyin
## Sonuç
WHOIS ve DNS arama araçları, siber güvenlik keşif için temel olmaya devam ediyor. Doğru kullanıldığında, ağ altyapısı ve olası güvenlik endişeleri hakkında değerli bilgiler sağlarlar. Düzenli izleme, uygun dokümantasyon ve etik kullanım, bu araçların güvenlik programlarına etkili bir şekilde katkıda bulunmasını sağlar.

Gizlilik ve yasal gerekliliklere saygı duyarken bu araçlardan nasıl yararlanılacağını anlamak, güvenlik profesyonellerinin şunları yapmasını sağlar:
– Kapsamlı değerlendirmeler yapın
– Potansiyel tehditleri belirleyin
– Altyapı değişikliklerini izleyin
– Destek olay müdahalesi

İnternet gelişmeye devam ettikçe, bu temel ama güçlü araçlarla yeterliliği korumak, etkili siber güvenlik uygulamaları için gerekli olmaya devam ediyor.