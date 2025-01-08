---
draft: false

title:  'OSSEC'
i Anlamak: Açık Kaynaklı Ana Bilgisayar Tabanlı Saldırı Algılama Sistemi (HIDS)'
date: '2024-10-01T21:12:34+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/osseci-anlamak-acik-kaynakli-ana-bilgisayar-tabanli-saldiri-algilama-sistemi-hids/
 
featured_image: /images/log-management.webp
categories:
    - Uygulama
---


 Siber güvenlik tehditlerinin sürekli geliştiği bir çağda , kuruluşların sistemlerini olası saldırılardan izlemek ve korumak için kapsamlı çözümlere ihtiyaçları vardır. Bu çözümlerden biri de **OSSEC'tir** ; çeşitli platformlarda gerçek zamanlı izleme, tehdit algılama ve güvenlik olayı analizi sağlayan açık kaynaklı, ana bilgisayar tabanlı bir saldırı tespit sistemidir (HIDS). OSSEC, çok yönlülüğü, ölçeklenebilirliği ve maliyet etkinliğiyle bilinir ve bu da onu küçük işletmeler, kuruluşlar ve güvenlik meraklıları arasında popüler bir seçim haline getirir.



Bu blog yazısında OSSEC'i derinlemesine inceleyeceğiz: nedir, nasıl çalışır, temel özellikleri, faydaları, zorlukları ve kuruluşunuzun güvenlik duruşunu iyileştirmek için neden güçlü bir araç olduğunu ele alacağız.
## OSSEC Nedir?



**OSSEC, ****Açık Kaynak Güvenliği (HIDS) ve Olay İlişkisi** anlamına gelir . Günlük dosyalarını, dosya bütünlüğünü, politika uyumluluğunu, kök araçlarını ve gerçek zamanlı uyarıları izleyen açık kaynaklı bir ana bilgisayar tabanlı saldırı tespit sistemidir. OSSEC, bir güvenlik ihlalini gösterebilecek şüpheli etkinliği tespit etmek için günlükler, yapılandırmalar ve dosya değişiklikleri gibi çeşitli kaynaklardan sistem verilerini toplayarak ve analiz ederek çalışır.



Ağ trafiğini izleyen ağ tabanlı saldırı tespit sistemlerinin (NIDS) aksine, **OSSEC ana bilgisayar tabanlıdır** ; yani sistemlerdeki (veya "ana bilgisayarlardaki") etkinlikleri ve davranışları izlemeye odaklanır. Bu, OSSEC'i bireysel sunucuları, iş istasyonlarını ve diğer uç noktaları siber tehditlere karşı korumak için oldukça etkili hale getirir.
## OSSEC'in Temel Özellikleri



OSSEC, ana bilgisayar tabanlı güvenliklerini geliştirmek isteyen kuruluşlar için kapsamlı bir güvenlik çözümü haline getiren çok çeşitli özellikler sunar. Aşağıda bazı temel özellikleri verilmiştir:



1. **Log Tabanlı Saldırı Tespiti**



OSSEC'in temel işlevlerinden biri, farklı kaynaklardan gelen günlükleri gerçek zamanlı olarak izleme ve analiz etme yeteneğidir. İşletim sistemleri, güvenlik duvarları, web sunucuları ve uygulamalar dahil olmak üzere çeşitli platformlardan günlükleri ayrıştırır. OSSEC, bu günlükleri analiz ederek başarısız oturum açma girişimleri, şüpheli kullanıcı davranışı ve alışılmadık sistem değişiklikleri gibi anormal etkinlikleri tespit edebilir. Günlük tabanlı tespit, tam teşekküllü güvenlik olaylarına dönüşmeden önce tehlike belirtilerini belirlemek için önemlidir.



2. **Dosya Bütünlüğü İzleme (FIM)**



OSSEC, bir sistemdeki dosyalarda ve dizinlerde yapılan değişiklikleri izleyen güçlü bir **Dosya Bütünlüğü İzleme (FIM)** yeteneği içerir. FIM, genellikle kötü amaçlı yazılım enfeksiyonlarının, veri ihlallerinin veya içeriden gelen tehditlerin göstergesi olan yetkisiz değişiklikleri tespit etmek için hayati önem taşır. OSSEC, kritik sistem dosyaları değiştirildiğinde, silindiğinde veya beklenmedik bir şekilde erişildiğinde yöneticileri uyarabilir ve hassas veriler için temel bir koruma katmanı sağlayabilir.



3. **Rootkit Algılama**



Rootkit'ler, bir sistemdeki diğer kötü amaçlı yazılımların varlığını gizlemek için tasarlanmış kötü amaçlı yazılımlardır ve bu da genellikle bunların tespit edilmesini zorlaştırır. OSSEC, gizli veya yetkisiz değişiklikler için sistem dosyalarını, süreçleri ve çekirdek modüllerini tarayarak rootkit'leri tespit etmeye yardımcı olur. Rootkit tespiti, derinlere yerleşmiş tehditlerin bile önemli hasara yol açmadan önce tespit edilmesini ve etkisiz hale getirilmesini sağlar.



4. **Gerçek Zamanlı Uyarılar**



OSSEC, izlenen sistemlerde tespit edilen şüpheli veya kötü amaçlı herhangi bir etkinlik için gerçek zamanlı uyarılar üretir. Uyarılar, olayın ciddiyetine göre özelleştirilebilir ve güvenlik ekiplerinin yanıt çabalarını önceliklendirmelerine olanak tanır. Uyarılar genellikle e-posta, syslog veya SIEM (Güvenlik Bilgi ve Olay Yönetimi) platformlarıyla üçüncü taraf entegrasyonları aracılığıyla iletilir ve kuruluşların olası tehditlere hızlı bir şekilde yanıt vermesine yardımcı olur.



5. **Aktif Tepki**



OSSEC, belirli olaylar meydana geldiğinde otomatik eylemler gerçekleştirmesini sağlayan bir **Active Response** özelliğine sahiptir. Bu, tekrarlanan başarısız oturum açma girişimlerinden sonra bir IP adresini engellemeyi, şüpheli bir etkinlikten sonra bir kullanıcı hesabını devre dışı bırakmayı veya kurcalanmış hizmetleri yeniden başlatmayı içerebilir. Bu proaktif özellik, tehditleri hemen azaltmaya yardımcı olur ve saldırganların güvenlik açıklarını istismar etme fırsatı penceresini azaltır.



6. **Çoklu Platform Desteği**



**OSSEC'in güçlü yanlarından biri, Linux** , **Windows** , **macOS** ve çeşitli Unix dağıtımları dahil olmak üzere birden fazla işletim sistemini desteklemesidir . Bu çapraz platform desteği, OSSEC'i farklı sistem türlerinin izlenmesi ve korunması gereken heterojen ortamlar için ideal bir çözüm haline getirir.



7. **Uyumluluk ve Politika Denetimi**



OSSEC ayrıca uyumluluk denetimi için de kullanılabilir ve sistemlerin önceden tanımlanmış güvenlik politikalarına uymasını sağlar. Sistem yapılandırmalarını ve günlüklerini izleyerek OSSEC, kuruluşların PCI-DSS, HIPAA ve GDPR gibi çerçeveler için uyumluluk gereksinimlerini karşılamasına yardımcı olur. Araç, sistem yapılandırmalarını, dosya bütünlüğünü ve güvenlik olaylarını ayrıntılı olarak açıklayan raporlar üretebilir ve bu da denetimler sırasında uyumluluğu göstermeyi kolaylaştırır.
## OSSEC Nasıl Çalışır?



Ajan Tabanlı ve Ajansız İzleme



OSSEC iki ana modda çalışır: **ajan tabanlı** ve **ajansız** izleme.


* **Ajan tabanlı izleme,** ana makineye bir OSSEC ajanı yüklemeyi içerir. Bu ajan, günlük dosyaları, dosya bütünlüğü bilgileri ve sistem etkinliği gibi verileri toplar ve analiz için OSSEC sunucusuna (genellikle **OSSEC Yöneticisi** olarak anılır ) gönderir. Ajan tabanlı yaklaşım daha kapsamlı izleme sağlar ve derin görünürlük gerektiren sistemler için tercih edilir.

* **Ajansız izleme,** ana bilgisayara bir ajanın yüklenmesini gerektirmez. Bunun yerine, OSSEC ağ cihazları, güvenlik duvarları ve yazıcılar gibi sistemlerden veri toplamak için uzaktan günlük toplama ve diğer izleme mekanizmalarına güvenir. Bu mod, ajan tabanlı izlemeden daha az ayrıntılı kontrol sunsa da, bir ajan yüklemenin pratik olmadığı cihazlar için yararlıdır.




Merkezi Yönetim ve Ölçeklenebilirlik



**OSSEC, birden fazla aracının merkezi bir OSSEC Yöneticisine rapor verdiği merkezi bir yönetim** yaklaşımı kullanır . Bu kurulum, yöneticilerin büyük ortamları tek bir konumdan izlemesine olanak tanır ve bu sayede birçok sistem genelinde olayları ilişkilendirmek ve uyarıları yönetmek daha kolay hale gelir. OSSEC, binlerce aracı destekleyecek şekilde ölçeklenebilir ve bu da onu coğrafi olarak dağıtılmış varlıklara sahip büyük işletmeler için uygun bir çözüm haline getirir.



Olay Korelasyonu ve Analizi



OSSEC, güvenlik olaylarını analiz etmek için birden fazla kaynaktan veri toplar ve ilişkilendirir. Günlük girişlerini, dosya değişikliklerini ve sistem davranışını değerlendirmek için önceden oluşturulmuş **kuralları** kullanır . Bu kurallar sürekli olarak güncellenir ve bir kuruluşun belirli güvenlik ihtiyaçlarını karşılamak üzere özelleştirilebilir. OSSEC, birden fazla olayı ilişkilendirerek potansiyel tehditleri tespit etmede daha fazla bağlam ve doğruluk sağlayabilir, yanlış pozitifler ve gözden kaçan olaylar riskini azaltabilir.
## OSSEC Kullanmanın Faydaları



1. **Açık Kaynaklı ve Maliyet Etkin**



OSSEC'in en büyük avantajlarından biri açık kaynaklı ve ücretsiz olmasıdır. Bu, pahalı ticari saldırı tespit sistemleri için bütçesi olmayan küçük ve orta ölçekli işletmeler (KOBİ'ler) dahil olmak üzere her boyuttaki işletme için oldukça uygun maliyetli bir çözüm olmasını sağlar. Ücretsiz olmasına rağmen, OSSEC birçok ticari alternatife kıyasla güçlü bir özellik seti sunar.



2. **Kapsamlı Ana Bilgisayar Tabanlı Güvenlik**



Ağ tabanlı çözümlerin aksine, OSSEC ana bilgisayar düzeyinde derinlemesine izleme sağlar. Bu, içeriden saldırılar, yetkisiz dosya erişimi veya kök kitler gibi geleneksel ağ güvenlik araçlarını atlatabilecek tehditleri tespit edebileceği anlamına gelir. Kapsamlı yaklaşımı, sunucular, masaüstleri ve bulut örnekleri dahil olmak üzere kritik uç noktaların güvenliğini sağlamaya yardımcı olur.



3. **Gerçek Zamanlı Tehdit Algılama ve Yanıtlama**



OSSEC'in gerçek zamanlı uyarılar ve otomatik yanıtlar sağlama yeteneği, kuruluşların tehditleri hızlı bir şekilde, genellikle önemli bir hasara yol açmadan önce tespit edip yanıtlamalarına olanak tanır. Bu hızlı tespit ve yanıtlama yeteneği, özellikle yüksek riskli ortamlarda saldırıların etkisini en aza indirmede kritik öneme sahiptir.



4. **Genişletilebilirlik ve Esneklik**



OSSEC son derece genişletilebilirdir ve kullanıcıların kendi özel güvenlik ihtiyaçlarına göre özel kurallar ve entegrasyonlar oluşturmasına olanak tanır. Ayrıca popüler güvenlik araçları ve SIEM platformlarıyla entegre olarak kuruluşların birleşik bir güvenlik izleme ve olay müdahale altyapısı oluşturmasını sağlar. OSSEC'in esnekliği, onu benzersiz güvenlik gereksinimleri olan kuruluşlar için harika bir seçim haline getirir.



5. **Platformlar Arası Destek**



Birden fazla işletim sistemi desteğiyle OSSEC, Windows tabanlı ağlardan Linux sunucularına ve macOS uç noktalarına kadar çeşitli ortamlarda dağıtılabilir. Bu çapraz platform uyumluluğu, işletim sistemlerinden bağımsız olarak tüm sistemlerin izlenmesini ve korunmasını sağlar.
## OSSEC Kullanımının Zorlukları



1. **Yapılandırma Karmaşıklığı**



OSSEC güçlü olsa da, özellikle ana bilgisayar tabanlı saldırı tespit sistemlerine yeni başlayan kullanıcılar için yapılandırılması karmaşık olabilir. Kuralları özelleştirmek, aracıları yönetmek ve uyarıları yapılandırmak önemli miktarda zaman ve çaba gerektirebilir. Ancak sistemin esnekliği ve kapsamlı belgeleri bu zorluğun hafifletilmesine yardımcı olur.



2. **Sınırlı Kullanıcı Arayüzü**



OSSEC'in yerel arayüzü metin tabanlıdır ve bu, grafiksel panoları tercih eden kullanıcılar için bir zorluk olabilir. Üçüncü taraf grafiksel arayüzler mevcut olsa da ( OSSEC'in işlevselliğini genişleten **Wazuh** gibi ), entegre bir GUI'nin olmaması bazı kullanıcılar için bir dezavantaj olabilir.



3. **Yanlış Pozitifler**



Birçok saldırı tespit sistemi gibi, OSSEC de özellikle meşru değişikliklerin sıklıkla gerçekleştiği oldukça dinamik ortamlarda yanlış pozitifler üretebilir. Ancak, uygun kural ayarlaması ve yapılandırmasıyla bu yanlış pozitifler en aza indirilebilir.
## OSSEC ve Diğer Saldırı Algılama Sistemleri



**OSSEC genellikle Tripwire** veya **AIDE gibi diğer HIDS çözümleriyle ve ****Snort** gibi ağ tabanlı saldırı tespit sistemleriyle (NIDS) karşılaştırılır . NIDS çözümleri ağ trafiğini izlemeye odaklanırken, OSSEC'in gücü ana bilgisayarı izleme yeteneğinde yatmaktadır ve bu da onu ağ tabanlı güvenlik araçlarının vazgeçilmez bir tamamlayıcısı haline getirir. OSSEC ayrıca açık kaynaklı yapısı, kapsamlı özellik seti ve güçlü topluluk desteğiyle öne çıkar ve daha pahalı ticari çözümlere uygulanabilir bir alternatif sunar.
## Çözüm



OSSEC, kuruluşlara gerçek zamanlı izleme, dosya bütünlüğü denetimi, günlük analizi ve etkin yanıt yetenekleri sağlayan kapsamlı, açık kaynaklı ana bilgisayar tabanlı bir saldırı tespit sistemidir. Çoklu platform desteği, ölçeklenebilirliği ve çok çeşitli güvenlik tehditlerini tespit etme yeteneği, onu kritik uç noktaları güvence altına almak ve uyumluluğu sürdürmek için vazgeçilmez bir araç haline getirir.



Maliyet etkin, özelleştirilebilir ve topluluk odaklı bir güvenlik çözümü arayan işletmeler için OSSEC, işlevsellik ve esnekliğin mükemmel bir dengesini sunar. Yapılandırmak için biraz uzmanlık gerektirebilirken ve optimize edilmesi, kapsamlı güvenlik ve gerçek zamanlı tehdit tespiti açısından sağladığı faydalar, onu her kuruluşun  siber güvenlik araç setine değerli bir katkı haline getirir.



OSSEC'i güvenlik altyapınıza entegre ederek, olası tehditleri tespit etme ve bunlara yanıt verme yeteneğinizi artırabilir, sistemlerinizi ve verilerinizi hem iç hem de dış saldırılara karşı koruyabilirsiniz.
