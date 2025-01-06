---
draft: false

title:  'OSSIM'
i Anlamak: Açık Kaynaklı Güvenlik Bilgi ve Olay Yönetimi (SIEM) Çözümü'
date: '2024-10-01T21:20:21+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/ossimi-anlamak-acik-kaynakli-guvenlik-bilgi-ve-olay-yonetimi-siem-cozumu/
 
featured_image: /images/kali-linux.webp
categories:
    - Uygulama
tags:
    - OSSIM
---


Günümüzün gelişen dijital ortamında,  siber güvenlik her zamankinden daha önemlidir. Kuruluşlar giderek artan sayıda siber tehdit ile karşı karşıyadır ve hassas bilgileri ve kritik sistemleri korumak karmaşık bir zorluk haline gelmiştir. Bu zorluğun üstesinden gelmenin en etkili yollarından biri, kuruluşların güvenlikle ilgili verileri toplayıp analiz ederek potansiyel tehditleri tespit etmelerine ve bunlara yanıt vermelerine yardımcı olan bir **Güvenlik Bilgi ve Olay Yönetimi (SIEM)** çözümü uygulamaktır. Bu tür çözümlerden biri, bir kuruluşun güvenlik duruşuna kapsamlı görünürlük sağlayan açık kaynaklı bir SIEM platformu olan **OSSIM'dir .**



Bu blog yazısında OSSIM'i, temel özelliklerini, nasıl çalıştığını ve uygun fiyatlı ancak etkili bir siber güvenlik çözümü arayan kuruluşlar için neden değerli bir araç olduğunu inceleyeceğiz.





## OSSIM nedir?



**OSSIM (Açık Kaynaklı Güvenlik Bilgi Yönetimi), AT&amp;T  Cybersecurity** tarafından geliştirilen ve sürdürülen bir SIEM çözümüdür . Güvenlik izleme, tehdit algılama ve olay müdahalesi sağlamak için birden fazla açık kaynaklı araç ve teknolojiyi tek bir platformda birleştirir. OSSIM, uygun fiyatlı olması (açık kaynaklı olması nedeniyle) ve mevcut güvenlik araçlarıyla sorunsuz bir şekilde entegre olma yeteneği nedeniyle her ölçekteki kuruluşta yaygın olarak kullanılır.



OSSIM, birden fazla bireysel çözüme ihtiyaç duymadan geniş bir güvenlik yetenekleri seti sunmak üzere tasarlanmıştır. Bu yetenekler arasında varlık keşfi, güvenlik açığı değerlendirmesi, saldırı tespiti, davranışsal izleme ve güvenlik olayı ilişkilendirmesi yer alır. OSSIM, bu verileri toplayarak ve ilişkilendirerek bir kuruluşun güvenlik durumunun merkezi bir görünümünü sağlar ve potansiyel tehditlerin daha hızlı tanımlanmasını ve azaltılmasını sağlar.





## OSSIM'in Temel Özellikleri



1. **Varlık Keşfi**



OSSIM'in temel özelliklerinden biri, bir kuruluşun ağındaki varlıkları keşfetme ve kataloglama yeteneğidir. Bu, ağın altyapısını anlamak, bağlı cihazları belirlemek ve tüm varlıkların uygun şekilde muhasebeleştirildiğinden emin olmak için çok önemlidir. Güncel bir varlık envanteri tutarak, OSSIM güvenlik ekiplerinin tüm cihazlarda ve ağlarda etkinliği izlemesini sağlar ve hiçbir cihazın izlenmeden veya güvencesiz bırakılmamasını sağlamaya yardımcı olur.



2. **Güvenlik Açığı Değerlendirmesi**



OSSIM, kuruluşların ağ altyapılarındaki zayıflıkları belirlemelerine yardımcı olan güvenlik açığı tarama araçlarını içerir. Bu taramalar, kötü niyetli aktörler tarafından istismar edilebilecek yamalanmamış yazılım, yanlış yapılandırmalar veya açık portlar gibi güvenlik açıklarını ortaya çıkarmak için önemlidir. OSSIM, OpenVAS gibi popüler güvenlik açığı tarayıcılarıyla entegre olarak kuruluşların sistemlerini düzenli olarak değerlendirmelerine ve keşfedilen güvenlik açıklarını gidermelerine olanak tanır.



3. **Saldırı Algılama Sistemleri (IDS)**



**OSSIM, bir ağdaki şüpheli aktiviteleri tespit etmek için yaygın olarak kullanılan iki araç olan Snort** ve **Suricata** dahil olmak üzere yerleşik **Saldırı Tespit Sistemleri (IDS)** ile birlikte gelir . IDS yetenekleri, OSSIM'in trafik modellerini izlemesine ve yetkisiz erişim girişimleri veya kötü amaçlı yazılım iletişimi gibi olası tehditleri belirlemek için veri paketlerini analiz etmesine olanak tanır. Bir saldırı girişimi tespit edildiğinde, OSSIM bir uyarı oluşturur ve güvenlik ekiplerinin hızlı bir şekilde harekete geçmesini sağlar.********



4. **Log Yönetimi ve Olay İlişkilendirmesi**



OSSIM'in temel işlevlerinden biri, güvenlik duvarları, sunucular, yönlendiriciler ve IDS sistemleri gibi çeşitli kaynaklardan günlükleri bir araya getirme yeteneğidir. Bu günlükler daha sonra olası güvenlik olaylarını tespit etmek için analiz edilir. OSSIM'in olay ilişkilendirme motoru, görünüşte ilgisiz olaylar arasındaki ilişkileri belirleyebildiği için özellikle güçlüdür. Bu ilişkilendirme, güvenlik ekiplerinin bir olayın bağlamını anlamalarına yardımcı olarak, birden fazla sistemi veya cihazı kapsayan karmaşık saldırıları gözden kaçırma riskini azaltır.



5. **Davranışsal İzleme**



OSSIM'in davranışsal izleme yetenekleri, normal kullanıcı veya ağ davranışından sapmaları algılamasını sağlar. Bu, geleneksel algılama yöntemlerinden kaçabilen içeriden gelen tehditleri veya gelişmiş kalıcı tehditleri (APT'ler) algılamak için önemlidir. OSSIM, kullanıcı davranışını, ağ trafiğini ve sistem performansını izleyerek, yetkisiz veri erişimi veya bir ağ içinde yanal hareket gibi olası bir güvenlik olayını gösterebilecek olağandışı etkinlikleri işaretleyebilir.



6. **Tehdit İstihbaratı Entegrasyonu**



**OSSIM, algılama yeteneklerini geliştirmek için tehdit istihbarat beslemeleriyle** bütünleşir . Tehdit istihbaratı, kötü amaçlı IP adresleri, kötü amaçlı yazılım imzaları ve tehlike göstergeleri (IoC'ler) dahil olmak üzere bilinen tehditler hakkında gerçek zamanlı bilgi sağlar. OSSIM, dahili olayları harici tehdit verileriyle ilişkilendirerek kuruluşların ortaya çıkan tehditlerin önünde kalmasına ve olaylara daha etkili bir şekilde yanıt vermesine yardımcı olur.



7. **Olay Müdahalesi ve Raporlama**



OSSIM, tehditleri tespit etmenin yanı sıra, kuruluşların otomatik uyarılar ve ayrıntılı raporlar aracılığıyla olay yanıtını yönetmesine yardımcı olur. Güvenlik ekipleri, OSSIM'in panosunu kullanarak olayları izleyebilir, günlükleri inceleyebilir ve tehdidin ciddiyetine göre yanıtları önceliklendirebilir. Raporlama özellikleri, paydaşlarla paylaşılabilen veya uyumluluk amaçları için kullanılabilen özelleştirilebilir raporların oluşturulmasına olanak tanır.





## OSSIM Nasıl Çalışır?



Verilerin Toplanması ve Merkezileştirilmesi



OSSIM'in işlevselliğinin özünde, ağ genelindeki çeşitli kaynaklardan güvenlikle ilgili verileri bir araya getirme yeteneği yer alır. Bu veriler güvenlik duvarlarından, IDS/IPS sistemlerinden, uç noktalardan ve sunuculardan ve diğer cihazlardan gelir. OSSIM, bu verileri merkezileştirerek güvenlik ekipleri için tek bir bakış açısı sağlar ve kuruluşun genel güvenlik duruşunu izlemeyi ve analiz etmeyi kolaylaştırır.



Olay Korelasyonu



Veriler toplandıktan sonra, OSSIM'in olay ilişkilendirme motoru günlükleri ve güvenlik olaylarını analiz ederek kalıpları ve olası güvenlik olaylarını tespit eder. Olay ilişkilendirme, güvenlik ekiplerinin birden fazla adım veya sistem içeren karmaşık saldırıları tanımlamasına olanak tanıdığı için önemlidir. Örneğin, bir dizi başarısız oturum açma girişiminin ardından alışılmadık bir IP adresinden başarılı bir oturum açma, kaba kuvvet saldırısına işaret edebilir. OSSIM bu olayları ilişkilendirir ve bir uyarı oluşturarak güvenlik ekiplerinin hızlı yanıt vermesine yardımcı olur.



Tehdit Algılama ve Uyarılar



OSSIM şüpheli bir etkinlik algıladığında, güvenlik ekibi için bir uyarı oluşturur. Bu uyarılar, kuruluşun tercihlerine ve güvenlik politikalarına göre yapılandırılabilir. Sistem, uyarıları tehdidin ciddiyetine göre önceliklendirir ve en kritik olayların önce ele alınmasını sağlar. Güvenlik analistleri daha sonra uyarıyı araştırabilir, ilişkili günlükleri inceleyebilir ve tehdidi azaltmak için uygun eylemi gerçekleştirebilir.



Diğer Araçlar ile Entegrasyon



OSSIM, diğer güvenlik araçlarıyla sorunsuz bir şekilde çalışmak üzere tasarlanmıştır. Ağ taraması için **Nmap** , sistem performansını izlemek için **Nagios , IDS yetenekleri için ****Snort** ve **Suricata** ve güvenlik açığı taraması için **OpenVAS** gibi popüler açık kaynaklı araçlarla entegre olur . Bu entegrasyon, kuruluşların pahalı, tescilli çözümlere yatırım yapma ihtiyacı duymadan kapsamlı bir güvenlik altyapısı oluşturmasına olanak tanır.





## OSSIM Kullanmanın Faydaları



1. **Maliyet Etkin Çözüm**



OSSIM'in en büyük avantajlarından biri açık kaynaklı ve ücretsiz olmasıdır. Bu, onu özellikle pahalı SIEM çözümlerine yatırım yapacak kaynakları olmayan küçük ve orta ölçekli işletmeler (KOBİ'ler) olmak üzere sınırlı bütçeli kuruluşlar için cazip bir seçenek haline getirir. Daha gelişmiş özelliklere sahip ticari SIEM çözümleri mevcut olsa da OSSIM, sağlam bir yetenek setini ücretsiz olarak sunar.



2. **Kapsamlı Güvenlik İzleme**



OSSIM, kapsamlı güvenlik izleme sağlayan çok çeşitli özellikler sunar. Varlık keşfinden saldırı tespitine ve günlük yönetimine kadar OSSIM,  siber güvenliğin tüm temel yönlerini kapsar . Bu özellikleri tek bir platformda merkezileştirerek OSSIM, güvenlik izleme sürecini basitleştirir ve birden fazla, farklı araca olan ihtiyacı azaltır.



3. **Topluluk Desteği ve Dokümantasyon**



Açık kaynaklı bir proje olarak OSSIM, büyük ve aktif bir kullanıcı ve geliştirici topluluğundan faydalanır. Bu topluluk, platformun devam eden gelişimine katkıda bulunarak en son güvenlik eğilimleri ve tehditlerle güncel kalmasını sağlar. Ayrıca, OSSIM için kapsamlı belgeler ve kullanıcıların yardım alabileceği veya fikirlerini paylaşabileceği forumlar mevcuttur.



4. **Esneklik ve Özelleştirme**



OSSIM'in açık kaynaklı yapısı, bir organizasyonun özel ihtiyaçlarını karşılamak üzere özelleştirilebileceği anlamına gelir. Güvenlik ekipleri özel kurallar oluşturabilir, yeni araçlar entegre edebilir ve platformun davranışını kendi benzersiz güvenlik ortamlarına uyacak şekilde değiştirebilir. Bu esneklik, OSSIM'i özel güvenlik gereksinimleri olan organizasyonlar için çok yönlü bir seçenek haline getirir.





## OSSIM Kullanımının Zorlukları



OSSIM güçlü bir SIEM çözümü olsa da bazı zorluklarla birlikte gelir. Birincisi, özellikle büyük veya karmaşık ağ ortamlarında kaynak yoğun olabilir. OSSIM'i yönetmek ve sürdürmek, platformu yapılandırmak ve verilerini yorumlamak SIEM deneyimi olmayanlar için karmaşık olabileceğinden, özel bir güvenlik uzmanları ekibi de gerektirebilir.



Ek olarak, OSSIM güçlü bir özellik seti sağlarken, ticari SIEM çözümlerinde bulunan öngörücü analiz veya makine öğrenimi tabanlı tehdit tespiti gibi daha gelişmiş yeteneklerin bazılarından yoksun olabilir. Daha karmaşık güvenlik ihtiyaçları olan kuruluşların OSSIM'i ek araçlarla desteklemesi veya açık kaynaklı ve ticari çözümleri birleştiren bir hibrit yaklaşımı düşünmesi gerekebilir.





## Çözüm



OSSIM, kapsamlı bir güvenlik izleme, tehdit algılama ve olay ilişkilendirme özellikleri seti sunan güçlü ve uygun maliyetli bir açık kaynaklı SIEM çözümüdür. Önemli maliyetlere katlanmadan siber güvenlik duruşlarını iyileştirmek isteyen kuruluşlar için ideal bir çözümdür. Esnekliği, entegrasyon yetenekleri ve aktif topluluk desteğiyle OSSIM, her ölçekteki işletme için popüler bir seçim olmaya devam etmektedir. Ancak, herhangi bir güvenlik aracında olduğu gibi, faydalarından tam olarak yararlanmak için uygun yapılandırma, sürekli izleme ve uzmanlık gereklidir.



Siber tehditlerin sürekli geliştiği bir çağda, OSSIM kuruluşlara güvenlik olaylarını etkili bir şekilde tespit etmek, yanıtlamak ve azaltmak için gereken görünürlüğü ve içgörüyü sağlar. Bu açık kaynaklı platformdan yararlanarak, işletmeler güvenlik operasyonlarını iyileştirebilir ve varlıklarını giderek artan potansiyel tehditler listesinden daha iyi koruyabilir.
