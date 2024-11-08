---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Bilgi Toplama
classic-editor-remember:
- classic-editor
date: "2024-11-02T21:39:38Z"
excerpt: Aktif ve pasif keşif arasındaki farkları anlamak, güvenlik uzmanları ve ağ
  yöneticileri için hayati önem taşır. Bilgi toplamaya yönelik bu iki temel yaklaşım
  farklı amaçlara hizmet eder ve kendi değerlendirme kümeleriyle birlikte gelir.
guid: https://www.siberoloji.com/?p=5892
id: 5892
image: /assets/images/2024/09/cybersecurityillustration1.webp
tags:
- cybersecurity
- keşif
title: Aktif ve Pasif Keşif Arasındaki Temel Farklar
url: /tr/aktif-ve-pasif-kesif-arasindaki-temel-farklar/
---

Aktif ve pasif keşif arasındaki farkları anlamak, güvenlik uzmanları ve ağ yöneticileri için hayati önem taşır. Bilgi toplamaya yönelik bu iki temel yaklaşım farklı amaçlara hizmet eder ve kendi değerlendirme kümeleriyle birlikte gelir. Bu kapsamlı kılavuz, her iki yöntemin temel farklılıklarını, <span class="google-anno-t">uygulamalarını</span> ve çıkarımlarını inceler.
 ## Keşif Genel Bakışı</h2>
Keşif, genellikle "recon" olarak kısaltılır, hedef sistemler, ağlar veya kuruluşlar hakkında bilginin toplandığı güvenlik değerlendirmesinin ön aşamasıdır. Bu bilgi, olası güvenlik açıklarını, güvenlik duruşunu ve sistem mimarisini anlamak için temel oluşturur.
 ## Pasif Keşif</h2>
 ### Tanım ve Özellikler</h3>
Pasif keşif, hedef sistemle doğrudan etkileşime girmeden bilgi toplamayı içerir. Bu yöntem:
<ul class="wp-block-list">
 	<li>Hedef sistemlerde hiçbir iz bırakmaz</li>
 	<li>Kamuya açık bilgileri kullanır</li>
 	<li>Hedef tarafından tespit edilemiyor</li>
 	<li>Bilgi toplamak daha uzun sürer</li>
 	<li>Sınırlı bilgi derinliğine sahiptir</li>
</ul>
 ### Yaygın Teknikler</h3>
<ol class="wp-block-list">
 	<li>OSINT (Açık Kaynak İstihbaratı)</li>
</ol>
<ul class="wp-block-list">
 	<li>Kamu kayıtları aramaları</li>
 	<li>Sosyal medya analizi</li>
 	<li>Haber makaleleri</li>
 	<li>Kurumsal belgeler</li>
 	<li>İş ilanları</li>
</ul>
<ol class="wp-block-list">
 	<li>DNS Bilgileri</li>
</ol>
<ul class="wp-block-list">
 	<li>WHOIS aramaları</li>
 	<li>DNS kayıt analizi</li>
 	<li>Tarihsel DNS verileri</li>
 	<li>Ters DNS aramaları</li>
</ul>
<ol class="wp-block-list">
 	<li>Arama Motoru Sonuçları</li>
</ol>
<ul class="wp-block-list">
 	<li>Google aptalları</li>
 	<li>Önbelleğe alınmış sayfalar</li>
 	<li>Dizinli belgeler</li>
 	<li>Site yapı analizi</li>
</ul>
<ol class="wp-block-list">
 	<li>Kamu Veritabanları</li>
</ol>
<ul class="wp-block-list">
 	<li>Sertifika şeffaflık günlükleri</li>
 	<li>Alan adı kayıt kayıtları</li>
 	<li>Ticaret sicilleri</li>
 	<li>Patent veri tabanları</li>
</ul>
 ### Pasif Keşifte Kullanılan Araçlar</h3>
<ul class="wp-block-list">
 	<li>İnternete bağlı cihaz bilgileri için Shodan</li>
 	<li>E-posta ve alt alan adı toplama için TheHarvester</li>
 	<li>İlişki haritalaması için Maltego</li>
 	<li>Otomatik OSINT toplama için yeniden yapılandırma</li>
</ul>
 ## Aktif Keşif</h2>
 ### Tanım ve Özellikler</h3>
Aktif keşif hedef sistemle doğrudan etkileşimi içerir. Bu yöntem:
<ul class="wp-block-list">
 	<li>İzlenebilir ayak izleri bırakır</li>
 	<li>Gerçek zamanlı bilgi sağlar</li>
 	<li>Güvenlik sistemleri tarafından tespit edilebilir</li>
 	<li>Daha ayrıntılı sonuçlar verir</li>
 	<li>Bazı yasal riskler taşır</li>
</ul>
 ### Yaygın Teknikler</h3>
<ol class="wp-block-list">
 	<li>Ağ Taraması</li>
</ol>
<ul class="wp-block-list">
 	<li>Port tarama</li>
 	<li>Hizmet sayımı</li>
 	<li>Sürüm tespiti</li>
 	<li>Banner kapma</li>
</ul>
<ol class="wp-block-list">
 	<li>Ana Bilgisayar Keşfi</li>
</ol>
<ul class="wp-block-list">
 	<li>Ping taramaları</li>
 	<li>ARP taraması</li>
 	<li>TCP/UDP taraması</li>
 	<li>ICMP araştırması</li>
</ul>
<ol class="wp-block-list">
 	<li>Güvenlik Açığı Değerlendirmesi</li>
</ol>
<ul class="wp-block-list">
 	<li>Hizmet parmak izi</li>
 	<li>Yapılandırma analizi</li>
 	<li>Güvenlik testi</li>
 	<li>Uygunluk denetimi</li>
</ul>
<ol class="wp-block-list">
 	<li>Uygulama Analizi</li>
</ol>
<ul class="wp-block-list">
 	<li>Web uygulaması taraması</li>
 	<li>API testi</li>
 	<li>Kimlik doğrulama araştırması</li>
 	<li>Giriş doğrulama testi</li>
</ul>
 ### Aktif Keşifte Kullanılan Araçlar</h3>
<ul class="wp-block-list">
 	<li>Ağ taraması için Nmap</li>
 	<li><span class="google-anno-t">Web sunucusu</span> analizi için Nikto</li>
 	<li>Paket analizi için Wireshark</li>
 	<li>Web uygulama testleri için Burp Suite</li>
</ul>
 ## Temel Farklar</h2>
 ### 1. Tespit Riski</h3>
Pasif Keşif:
<ul class="wp-block-list">
 	<li>Neredeyse tespit edilemez</li>
 	<li>Doğrudan sistem etkileşimi yok</li>
 	<li>Uyarıları tetikleme riski düşük</li>
 	<li>Gizli operasyonlar için uygundur</li>
</ul>
Aktif Keşif:
<ul class="wp-block-list">
 	<li>Kolayca tespit edilebilir</li>
 	<li>Ağ trafiği oluşturur</li>
 	<li>Güvenlik uyarılarını tetikleyebilir</li>
 	<li>Sistem günlüklerini bırakır</li>
</ul>
 ### 2. Bilgi Doğruluğu</h3>
Pasif Keşif:
<ul class="wp-block-list">
 	<li>Güncel olmayan bilgiler içerebilir</li>
 	<li>Kamuya açık verilerle sınırlıdır</li>
 	<li>Daha az detaylı sonuçlar</li>
 	<li>Doğrulama gerektirir</li>
</ul>
Aktif Keşif:
<ul class="wp-block-list">
 	<li>Güncel bilgi sağlar</li>
 	<li>Doğrudan sistem geri bildirimi</li>
 	<li>Ayrıntılı teknik veriler</li>
 	<li>Gerçek zamanlı sonuçlar</li>
</ul>
 ### 3. Yasal Sonuçlar</h3>
Pasif Keşif:
<ul class="wp-block-list">
 	<li>Genel olarak yasal</li>
 	<li>Kamuya açık bilgileri kullanır</li>
 	<li>Düşük sorumluluk riski</li>
 	<li>Minimum uyumluluk sorunları</li>
</ul>
Aktif Keşif:
<ul class="wp-block-list">
 	<li>Yetkilendirme gerektirir</li>
 	<li>Hizmet şartlarını ihlal edebilir</li>
 	<li>Olası yasal sonuçlar</li>
 	<li>Sıkı uyumluluk gereklilikleri</li>
</ul>
 ### 4. Kaynak Gereksinimleri</h3>
Pasif Keşif:
<ul class="wp-block-list">
 	<li>Minimum teknik kaynaklar</li>
 	<li>Zaman yoğun</li>
 	<li>Daha düşük beceri gereksinimi</li>
 	<li>Maliyet etkin</li>
</ul>
Aktif Keşif:
<ul class="wp-block-list">
 	<li>Özel araçlara ihtiyaç var</li>
 	<li>Daha hızlı sonuçlar</li>
 	<li>Daha yüksek beceri gereksinimi</li>
 	<li>Daha fazla kaynak yoğun</li>
</ul>
 ### 5. Kullanım Örnekleri</h3>
Pasif Keşif:
<ul class="wp-block-list">
 	<li>İlk araştırma aşaması</li>
 	<li>Rekabet analizi</li>
 	<li>Tehdit istihbaratı</li>
 	<li>Risk değerlendirmesi</li>
</ul>
Aktif Keşif:
<ul class="wp-block-list">
 	<li>Güvenlik değerlendirmeleri</li>
 	<li>Penetrasyon testi</li>
 	<li>Güvenlik açığı taraması</li>
 	<li>Ağ haritalama</li>
</ul>
 ## En İyi Uygulamalar</h2>
 ### Her İki Yaklaşımın Birleştirilmesi</h3>
<ol class="wp-block-list">
 	<li>Pasif Keşif ile Başlayın</li>
</ol>
<ul class="wp-block-list">
 	<li>Temel bilgileri toplayın</li>
 	<li>Potansiyel hedefleri belirleyin</li>
 	<li>Kapsamı anlayın</li>
 	<li>Aktif fazı planla</li>
</ul>
<ol class="wp-block-list">
 	<li>Aktif Keşfe Geçiş</li>
</ol>
<ul class="wp-block-list">
 	<li>Pasif bulguları doğrulayın</li>
 	<li>Ayrıntılı verileri toplayın</li>
 	<li>Belirli sistemleri test edin</li>
 	<li>Belge sonuçları</li>
</ul>
 ### Belgeleme Gereksinimleri</h3>
Aşağıdakilerin ayrıntılı kayıtlarını tutun:
<ul class="wp-block-list">
 	<li>Kullanılan yöntemler</li>
 	<li>Toplanan bilgiler</li>
 	<li>Faaliyetlerin zaman çizelgesi</li>
 	<li>Bulgular ve anormallikler</li>
</ul>
 ### Risk Yönetimi</h3>
Dikkate almak:
<ul class="wp-block-list">
 	<li>Yasal uyumluluk</li>
 	<li>Yetkilendirme düzeyleri</li>
 	<li>Güvenlik etkileri</li>
 	<li>Veri koruma</li>
</ul>
 ## Pratik Uygulamalar</h2>
 ### Güvenlik Değerlendirmeleri</h3>
<ol class="wp-block-list">
 	<li>İlk Aşama</li>
</ol>
<ul class="wp-block-list">
 	<li>Pasif tekniklerle başlayın</li>
 	<li>Harita bilinen altyapı</li>
 	<li>Anahtar sistemleri tanımlayın</li>
 	<li>Ayrıntılı değerlendirme planlayın</li>
</ul>
<ol class="wp-block-list">
 	<li>Detaylı Analiz</li>
</ol>
<ul class="wp-block-list">
 	<li>Aktif teknikler kullanın</li>
 	<li>Bulguları doğrulayın</li>
 	<li>Test güvenlik kontrolleri</li>
 	<li>Belge güvenlik açıkları</li>
</ul>
 ### Olay Müdahalesi</h3>
<ol class="wp-block-list">
 	<li>Tehdit İstihbaratı</li>
</ol>
<ul class="wp-block-list">
 	<li>IOC'lerin pasif toplanması</li>
 	<li>Tarihsel veri analizi</li>
 	<li>Saldırı deseni tanıma</li>
 	<li>Atıf araştırması</li>
</ul>
<ol class="wp-block-list">
 	<li>Aktif Tepki</li>
</ol>
<ul class="wp-block-list">
 	<li>Gerçek zamanlı izleme</li>
 	<li>Sistem analizi</li>
 	<li>Ağ denetimi</li>
 	<li>Tehdit avcılığı</li>
</ul>
 ## Sonuç</h2>
Etkin ve pasif keşif arasındaki farkları anlamak, etkili güvenlik değerlendirmesi için çok önemlidir. Her yaklaşımın kapsamlı bir güvenlik programında yeri vardır:
<ul class="wp-block-list">
 	<li>Pasif keşif, tespit veya yasal sorunlar riski olmadan bir bilgi temeli sağlar</li>
 	<li>Aktif keşif ayrıntılı, güncel bilgiler sunar ancak dikkatli planlama ve yetkilendirme gerektirir</li>
 	<li>Birleştirilmiş yaklaşımlar genellikle en kapsamlı sonuçları verir</li>
 	<li>Her iki yöntem için de uygun dokümantasyon ve risk yönetimi önemlidir</li>
</ul>
Güvenlik uzmanları bu yaklaşımlar arasında seçim yaparken hedeflerini, yasal gereklilikleri ve mevcut kaynakları dikkatlice değerlendirmelidir. En etkili güvenlik değerlendirmeleri genellikle bilgi toplamayı en üst düzeye çıkarırken riskleri ve olası olumsuz etkileri en aza indiren koordineli, iyi planlanmış bir şekilde her iki yöntemi de kullanır.