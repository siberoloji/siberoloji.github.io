---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Uygulama
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-01T21:12:34Z"
guid: https://www.siberoloji.com/?p=2079
id: 2079
image: /assets/images/2024/10/log-management.webp
title: 'OSSEC&#8217;i Anlamak: Açık Kaynaklı Ana Bilgisayar Tabanlı Saldırı Algılama
  Sistemi (HIDS)'
url: /tr/osseci-anlamak-acik-kaynakli-ana-bilgisayar-tabanli-saldiri-algilama-sistemi-hids/
---

   Siber güvenlik tehditlerinin sürekli geliştiği bir çağda , kuruluşların sistemlerini olası saldırılardan izlemek ve korumak için kapsamlı çözümlere ihtiyaçları vardır. Bu çözümlerden biri de <strong>OSSEC'tir</strong> ; çeşitli platformlarda gerçek zamanlı izleme, tehdit algılama ve güvenlik olayı analizi sağlayan açık kaynaklı, ana bilgisayar tabanlı bir saldırı tespit sistemidir (HIDS). OSSEC, çok yönlülüğü, ölçeklenebilirliği ve maliyet etkinliğiyle bilinir ve bu da onu küçük işletmeler, kuruluşlar ve güvenlik meraklıları arasında popüler bir seçim haline getirir. 
 

  Bu blog yazısında OSSEC'i derinlemesine inceleyeceğiz: nedir, nasıl çalışır, temel özellikleri, faydaları, zorlukları ve kuruluşunuzun güvenlik duruşunu iyileştirmek için neden güçlü bir araç olduğunu ele alacağız. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC Nedir?</h2>
<!-- /wp:heading -->

  <strong>OSSEC,&nbsp;</strong><strong>Açık Kaynak Güvenliği (HIDS) ve Olay İlişkisi</strong>&nbsp;anlamına gelir&nbsp;. Günlük dosyalarını, dosya bütünlüğünü, politika uyumluluğunu, kök araçlarını ve gerçek zamanlı uyarıları izleyen açık kaynaklı bir ana bilgisayar tabanlı saldırı tespit sistemidir. OSSEC, bir güvenlik ihlalini gösterebilecek şüpheli etkinliği tespit etmek için günlükler, yapılandırmalar ve dosya değişiklikleri gibi çeşitli kaynaklardan sistem verilerini toplayarak ve analiz ederek çalışır. 
 

  Ağ trafiğini izleyen ağ tabanlı saldırı tespit sistemlerinin (NIDS) aksine,&nbsp;<strong>OSSEC ana bilgisayar tabanlıdır</strong>&nbsp;; yani sistemlerdeki (veya "ana bilgisayarlardaki") etkinlikleri ve davranışları izlemeye odaklanır. Bu, OSSEC'i bireysel sunucuları, iş istasyonlarını ve diğer uç noktaları siber tehditlere karşı korumak için oldukça etkili hale getirir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC'in Temel Özellikleri</h2>
<!-- /wp:heading -->

  OSSEC, ana bilgisayar tabanlı güvenliklerini geliştirmek isteyen kuruluşlar için kapsamlı bir güvenlik çözümü haline getiren çok çeşitli özellikler sunar. Aşağıda bazı temel özellikleri verilmiştir: 
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Log Tabanlı Saldırı Tespiti</strong></h3>
<!-- /wp:heading -->

  OSSEC'in temel işlevlerinden biri, farklı kaynaklardan gelen günlükleri gerçek zamanlı olarak izleme ve analiz etme yeteneğidir. İşletim sistemleri, güvenlik duvarları, web sunucuları ve uygulamalar dahil olmak üzere çeşitli platformlardan günlükleri ayrıştırır. OSSEC, bu günlükleri analiz ederek başarısız oturum açma girişimleri, şüpheli kullanıcı davranışı ve alışılmadık sistem değişiklikleri gibi anormal etkinlikleri tespit edebilir. Günlük tabanlı tespit, tam teşekküllü güvenlik olaylarına dönüşmeden önce tehlike belirtilerini belirlemek için önemlidir. 
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Dosya Bütünlüğü İzleme (FIM)</strong></h3>
<!-- /wp:heading -->

  OSSEC, bir sistemdeki dosyalarda ve dizinlerde yapılan değişiklikleri izleyen güçlü bir&nbsp;<strong>Dosya Bütünlüğü İzleme (FIM)</strong>&nbsp;yeteneği içerir. FIM, genellikle kötü amaçlı yazılım enfeksiyonlarının, veri ihlallerinin veya içeriden gelen tehditlerin göstergesi olan yetkisiz değişiklikleri tespit etmek için hayati önem taşır. OSSEC, kritik sistem dosyaları değiştirildiğinde, silindiğinde veya beklenmedik bir şekilde erişildiğinde yöneticileri uyarabilir ve hassas veriler için temel bir koruma katmanı sağlayabilir. 
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Rootkit Algılama</strong></h3>
<!-- /wp:heading -->

  Rootkit'ler, bir sistemdeki diğer kötü amaçlı yazılımların varlığını gizlemek için tasarlanmış kötü amaçlı yazılımlardır ve bu da genellikle bunların tespit edilmesini zorlaştırır. OSSEC, gizli veya yetkisiz değişiklikler için sistem dosyalarını, süreçleri ve çekirdek modüllerini tarayarak rootkit'leri tespit etmeye yardımcı olur. Rootkit tespiti, derinlere yerleşmiş tehditlerin bile önemli hasara yol açmadan önce tespit edilmesini ve etkisiz hale getirilmesini sağlar. 
 

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Gerçek Zamanlı Uyarılar</strong></h3>
<!-- /wp:heading -->

  OSSEC, izlenen sistemlerde tespit edilen şüpheli veya kötü amaçlı herhangi bir etkinlik için gerçek zamanlı uyarılar üretir. Uyarılar, olayın ciddiyetine göre özelleştirilebilir ve güvenlik ekiplerinin yanıt çabalarını önceliklendirmelerine olanak tanır. Uyarılar genellikle e-posta, syslog veya SIEM (Güvenlik Bilgi ve Olay Yönetimi) platformlarıyla üçüncü taraf entegrasyonları aracılığıyla iletilir ve kuruluşların olası tehditlere hızlı bir şekilde yanıt vermesine yardımcı olur. 
 

<!-- wp:heading {"level":3} -->
 ### 5.&nbsp;<strong>Aktif Tepki</strong></h3>
<!-- /wp:heading -->

  OSSEC, belirli olaylar meydana geldiğinde otomatik eylemler gerçekleştirmesini sağlayan bir&nbsp;<strong>Active Response</strong>&nbsp;özelliğine sahiptir. Bu, tekrarlanan başarısız oturum açma girişimlerinden sonra bir IP adresini engellemeyi, şüpheli bir etkinlikten sonra bir kullanıcı hesabını devre dışı bırakmayı veya kurcalanmış hizmetleri yeniden başlatmayı içerebilir. Bu proaktif özellik, tehditleri hemen azaltmaya yardımcı olur ve saldırganların güvenlik açıklarını istismar etme fırsatı penceresini azaltır. 
 

<!-- wp:heading {"level":3} -->
 ### 6.&nbsp;<strong>Çoklu Platform Desteği</strong></h3>
<!-- /wp:heading -->

  <strong>OSSEC'in güçlü yanlarından biri, Linux</strong>&nbsp;,&nbsp;<strong>Windows</strong>&nbsp;,&nbsp;<strong>macOS</strong>&nbsp;ve çeşitli Unix dağıtımları dahil olmak üzere birden fazla işletim sistemini desteklemesidir&nbsp;. Bu çapraz platform desteği, OSSEC'i farklı sistem türlerinin izlenmesi ve korunması gereken heterojen ortamlar için ideal bir çözüm haline getirir. 
 

<!-- wp:heading {"level":3} -->
 ### 7.&nbsp;<strong>Uyumluluk ve Politika Denetimi</strong></h3>
<!-- /wp:heading -->

  OSSEC ayrıca uyumluluk denetimi için de kullanılabilir ve sistemlerin önceden tanımlanmış güvenlik politikalarına uymasını sağlar. Sistem yapılandırmalarını ve günlüklerini izleyerek OSSEC, kuruluşların PCI-DSS, HIPAA ve GDPR gibi çerçeveler için uyumluluk gereksinimlerini karşılamasına yardımcı olur. Araç, sistem yapılandırmalarını, dosya bütünlüğünü ve güvenlik olaylarını ayrıntılı olarak açıklayan raporlar üretebilir ve bu da denetimler sırasında uyumluluğu göstermeyi kolaylaştırır. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC Nasıl Çalışır?</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Ajan Tabanlı ve Ajansız İzleme</h3>
<!-- /wp:heading -->

  OSSEC iki ana modda çalışır:&nbsp;<strong>ajan tabanlı</strong>&nbsp;ve&nbsp;<strong>ajansız</strong>&nbsp;izleme. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Ajan tabanlı izleme,</strong> ana makineye bir OSSEC ajanı yüklemeyi içerir. Bu ajan, günlük dosyaları, dosya bütünlüğü bilgileri ve sistem etkinliği gibi verileri toplar ve analiz için OSSEC sunucusuna (genellikle <strong>OSSEC Yöneticisi</strong> olarak anılır ) gönderir. Ajan tabanlı yaklaşım daha kapsamlı izleme sağlar ve derin görünürlük gerektiren sistemler için tercih edilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ajansız izleme,</strong> ana bilgisayara bir ajanın yüklenmesini gerektirmez. Bunun yerine, OSSEC ağ cihazları, güvenlik duvarları ve yazıcılar gibi sistemlerden veri toplamak için uzaktan günlük toplama ve diğer izleme mekanizmalarına güvenir. Bu mod, ajan tabanlı izlemeden daha az ayrıntılı kontrol sunsa da, bir ajan yüklemenin pratik olmadığı cihazlar için yararlıdır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Merkezi Yönetim ve Ölçeklenebilirlik</h3>
<!-- /wp:heading -->

  <strong>OSSEC, birden fazla aracının merkezi bir OSSEC Yöneticisine rapor verdiği merkezi bir yönetim</strong>&nbsp;yaklaşımı kullanır&nbsp;. Bu kurulum, yöneticilerin büyük ortamları tek bir konumdan izlemesine olanak tanır ve bu sayede birçok sistem genelinde olayları ilişkilendirmek ve uyarıları yönetmek daha kolay hale gelir. OSSEC, binlerce aracı destekleyecek şekilde ölçeklenebilir ve bu da onu coğrafi olarak dağıtılmış varlıklara sahip büyük işletmeler için uygun bir çözüm haline getirir. 
 

<!-- wp:heading {"level":3} -->
 ### Olay Korelasyonu ve Analizi</h3>
<!-- /wp:heading -->

  OSSEC, güvenlik olaylarını analiz etmek için birden fazla kaynaktan veri toplar ve ilişkilendirir. Günlük girişlerini, dosya değişikliklerini ve sistem davranışını değerlendirmek için önceden oluşturulmuş&nbsp;<strong>kuralları</strong>&nbsp;kullanır . Bu kurallar sürekli olarak güncellenir ve bir kuruluşun belirli güvenlik ihtiyaçlarını karşılamak üzere özelleştirilebilir. OSSEC, birden fazla olayı ilişkilendirerek potansiyel tehditleri tespit etmede daha fazla bağlam ve doğruluk sağlayabilir, yanlış pozitifler ve gözden kaçan olaylar riskini azaltabilir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC Kullanmanın Faydaları</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Açık Kaynaklı ve Maliyet Etkin</strong></h3>
<!-- /wp:heading -->

  OSSEC'in en büyük avantajlarından biri açık kaynaklı ve ücretsiz olmasıdır. Bu, pahalı ticari saldırı tespit sistemleri için bütçesi olmayan küçük ve orta ölçekli işletmeler (KOBİ'ler) dahil olmak üzere her boyuttaki işletme için oldukça uygun maliyetli bir çözüm olmasını sağlar. Ücretsiz olmasına rağmen, OSSEC birçok ticari alternatife kıyasla güçlü bir özellik seti sunar. 
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Kapsamlı Ana Bilgisayar Tabanlı Güvenlik</strong></h3>
<!-- /wp:heading -->

  Ağ tabanlı çözümlerin aksine, OSSEC ana bilgisayar düzeyinde derinlemesine izleme sağlar. Bu, içeriden saldırılar, yetkisiz dosya erişimi veya kök kitler gibi geleneksel ağ güvenlik araçlarını atlatabilecek tehditleri tespit edebileceği anlamına gelir. Kapsamlı yaklaşımı, sunucular, masaüstleri ve bulut örnekleri dahil olmak üzere kritik uç noktaların güvenliğini sağlamaya yardımcı olur. 
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Gerçek Zamanlı Tehdit Algılama ve Yanıtlama</strong></h3>
<!-- /wp:heading -->

  OSSEC'in gerçek zamanlı uyarılar ve otomatik yanıtlar sağlama yeteneği, kuruluşların tehditleri hızlı bir şekilde, genellikle önemli bir hasara yol açmadan önce tespit edip yanıtlamalarına olanak tanır. Bu hızlı tespit ve yanıtlama yeteneği, özellikle yüksek riskli ortamlarda saldırıların etkisini en aza indirmede kritik öneme sahiptir. 
 

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Genişletilebilirlik ve Esneklik</strong></h3>
<!-- /wp:heading -->

  OSSEC son derece genişletilebilirdir ve kullanıcıların kendi özel güvenlik ihtiyaçlarına göre özel kurallar ve entegrasyonlar oluşturmasına olanak tanır. Ayrıca popüler güvenlik araçları ve SIEM platformlarıyla entegre olarak kuruluşların birleşik bir güvenlik izleme ve olay müdahale altyapısı oluşturmasını sağlar. OSSEC'in esnekliği, onu benzersiz güvenlik gereksinimleri olan kuruluşlar için harika bir seçim haline getirir. 
 

<!-- wp:heading {"level":3} -->
 ### 5.&nbsp;<strong>Platformlar Arası Destek</strong></h3>
<!-- /wp:heading -->

  Birden fazla işletim sistemi desteğiyle OSSEC, Windows tabanlı ağlardan Linux sunucularına ve macOS uç noktalarına kadar çeşitli ortamlarda dağıtılabilir. Bu çapraz platform uyumluluğu, işletim sistemlerinden bağımsız olarak tüm sistemlerin izlenmesini ve korunmasını sağlar. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC Kullanımının Zorlukları</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Yapılandırma Karmaşıklığı</strong></h3>
<!-- /wp:heading -->

  OSSEC güçlü olsa da, özellikle ana bilgisayar tabanlı saldırı tespit sistemlerine yeni başlayan kullanıcılar için yapılandırılması karmaşık olabilir. Kuralları özelleştirmek, aracıları yönetmek ve uyarıları yapılandırmak önemli miktarda zaman ve çaba gerektirebilir. Ancak sistemin esnekliği ve kapsamlı belgeleri bu zorluğun hafifletilmesine yardımcı olur. 
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Sınırlı Kullanıcı Arayüzü</strong></h3>
<!-- /wp:heading -->

  OSSEC'in yerel arayüzü metin tabanlıdır ve bu, grafiksel panoları tercih eden kullanıcılar için bir zorluk olabilir. Üçüncü taraf grafiksel arayüzler mevcut olsa da ( OSSEC'in işlevselliğini genişleten&nbsp;<strong>Wazuh</strong>&nbsp;gibi ), entegre bir GUI'nin olmaması bazı kullanıcılar için bir dezavantaj olabilir. 
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Yanlış Pozitifler</strong></h3>
<!-- /wp:heading -->

  Birçok saldırı tespit sistemi gibi, OSSEC de özellikle meşru değişikliklerin sıklıkla gerçekleştiği oldukça dinamik ortamlarda yanlış pozitifler üretebilir. Ancak, uygun kural ayarlaması ve yapılandırmasıyla bu yanlış pozitifler en aza indirilebilir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## OSSEC ve Diğer Saldırı Algılama Sistemleri</h2>
<!-- /wp:heading -->

  <strong>OSSEC genellikle Tripwire</strong>&nbsp;veya&nbsp;<strong>AIDE gibi diğer HIDS çözümleriyle ve&nbsp;</strong><strong>Snort</strong>&nbsp;gibi ağ tabanlı saldırı tespit sistemleriyle (NIDS)&nbsp;karşılaştırılır&nbsp;. NIDS çözümleri ağ trafiğini izlemeye odaklanırken, OSSEC'in gücü ana bilgisayarı izleme yeteneğinde yatmaktadır ve bu da onu ağ tabanlı güvenlik araçlarının vazgeçilmez bir tamamlayıcısı haline getirir. OSSEC ayrıca açık kaynaklı yapısı, kapsamlı özellik seti ve güçlü topluluk desteğiyle öne çıkar ve daha pahalı ticari çözümlere uygulanabilir bir alternatif sunar. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Çözüm</h2>
<!-- /wp:heading -->

  OSSEC, kuruluşlara gerçek zamanlı izleme, dosya bütünlüğü denetimi, günlük analizi ve etkin yanıt yetenekleri sağlayan kapsamlı, açık kaynaklı ana bilgisayar tabanlı bir saldırı tespit sistemidir. Çoklu platform desteği, ölçeklenebilirliği ve çok çeşitli güvenlik tehditlerini tespit etme yeteneği, onu kritik uç noktaları güvence altına almak ve uyumluluğu sürdürmek için vazgeçilmez bir araç haline getirir. 
 

  Maliyet etkin, özelleştirilebilir ve topluluk odaklı bir güvenlik çözümü arayan işletmeler için OSSEC, işlevsellik ve esnekliğin mükemmel bir dengesini sunar. Yapılandırmak için biraz uzmanlık gerektirebilirken ve optimize edilmesi, kapsamlı güvenlik ve gerçek zamanlı tehdit tespiti açısından sağladığı faydalar, onu her kuruluşun  siber güvenlik araç setine değerli bir katkı haline getirir. 
 

  OSSEC'i güvenlik altyapınıza entegre ederek, olası tehditleri tespit etme ve bunlara yanıt verme yeteneğinizi artırabilir, sistemlerinizi ve verilerinizi hem iç hem de dış saldırılara karşı koruyabilirsiniz. 
 