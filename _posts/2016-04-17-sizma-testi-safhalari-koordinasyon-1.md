---
layout: post
title: Sızma Testi Safhaları (Koordinasyon -1)
date: 2016-04-17 15:38:27.000000000 +03:00
type: post
img: cyber3.jpg
published: true
status: publish
categories:
- Araştırma
tags:
- koordinasyon
- koordinasyon safhası
- sızma testi safhaları

---
<p>Sızma Testi Safhaları Nelerdir? başlıklı yazımızda (<a href="https://www.siberoloji.com/featured/securityresearch/pentest/sizma-testi-safhalari-nelerdir/" target="_blank">bkz.</a>), safhaların genel tanım ve içeriğini incelemiştik. Bu yazımızda, 1. Safha olan Koordinasyon konusuna detaylı olarak bakacağız.</p>
<p>Hazırladığımız bu yazılarda, Sızma Testi süreçlerini Hizmet veren firma ve müşteri ilişkisi içerisinde inceleme niyetindeyiz. Testi gerçekleştiren Sızma Testi uzmanları için teknik yazılar ve NASIL dokümanlarını hazırlamak ise projemizin bir sonraki aşamasını oluşturacak.</p>
<h1 class="western">Koordinasyon</h1>
<p>Bir süreç hayata geçirilmek isteniyorsa, gerçekleştirilecek uygulama safhasından önce her zaman koordinasyon gereklidir. Planlamanın vazgeçilmez bir parçası olarak koordinasyon; tarafların birbirleriyle ortak anlayış içerisinde ve etkili iletişim mekanizmalarını çalıştırmaları olarak tanımlanabilir. Birbiriyle ortak dil kullanma, zaman açısından uyumlu çalışma ve bir konu ifade edildiğinde aynı şeyi anlama vb. anlamları bulunan koordinasyon ve koordinasyon tedbirleri taraflar arasında 1.Safhada tespit edilir ve karara bağlanır.</p>
<p>Koordinasyon tedbirleri, uyum ve verimli çalışma için tarafların aynı amaca yoğunlaşması ve hedeften sapılmasını engelleyen tedbirleri ifade eder. Örneğin, bir işlemin en geç başlama zamanı, en geç bitirilme zamanı, incelenecek uygulama veya IP aralığı gibi tüm kapsam ve kararlaştırılan noktalara koordinasyon tedbiri olarak bakılabilir.</p>
<p>Aşağıda bulunan şablon, uzun tecrübeler sonucu elde edilen bilgiler ışığında hazırlanmış bir listedir. Koordinasyon toplantıları için yol göstermesi amacıyla burada yer veriyoruz. İhtiyaca göre genişletip daraltmak mümkündür.</p>
<h1 class="western">Koordinasyon Toplantı Başlıkları</h1>
<h2 class="western"><strong>Amaç</strong></h2>
<p>Bu nokta, hizmet alan tarafın beklenti ve düşüncelerinin firmayla paylaşıldığı kısımdır. Gerçekleştirilmek istenen testlerin neler olduğu ve hangi düşünceler ile bu testleri yapılacağı ortaya konulur. Böylece hizmet veren firma yetkilileri, gerçekleştirmekle yükümlü olacakları testlerin mahiyetini kavrayarak, genel çerçeveyi zihinlerinde oluşturabilirler.</p>
<p>Testler sonucunda ulaşılmak istenen birincil, ikincil ve nihai hedefler (<a href="https://www.siberoloji.com/arastirma/sizma-testi-safhalari-koordinasyon-3/" target="_blank">bkz.</a>) tespit edilir. Bazı durumlarda, yapılmak istenen testlerin birbiriyle uyumsuz ve eş zamanlı yapılamayacağı ortaya çıkabilir. Bu nokta hizmet sağlayan firma, danışmanlık hizmeti olarak farklı önerileri sunabilir. Bütün bu görüşmeler neticesinde amaç ve hedefler belirlenir ve karara bağlanır.</p>
<h2 class="western"><strong>Kapsam</strong></h2>
<p>Yapılacak olan Sızma Testinin teknik anlamda hangi sistemleri kapsayacağının net olarak belirlendiği aşamadır. Kısaca, Amaç bölümünde tespit edilen hedefler çerçevesinde detayların belirlenmesidir. Bu detaylar neticesinde gerçekleştirilecek olan testlerin süresi ve iş gücü ihtiyacı da ortaya çıkacaktır.</p>
<h3 class="western">Teste Konu Sistemler</h3>
<p>Halen çalışır durumda bulunan sistemin bir çok katman ve üyeleri bulunur. Bu sistemlerden hangilerinin test edileceği tam olarak belirlenmelidir. Örneğin, hizmet alan firmanın stok ve muhasebe sistemlerinin teste dahil edilip edilmeyeceği veya bu sistemlerin, sadece yedekleme kısımlarının testinin yeterli olacağı vb. konular görüşülür. Genel ifadeyle söylemek gerekirse, topoloji üzerinde bulunan elemanların kapsama dahil olanları veya hariç olanları tespit edilir.</p>
<p>Ağ Testi, Web Uygulamaları Testi, Kablosuz Sistemler Testi, Fiziksel Güvenlik Testi, Sosyal Mühendislik Testlerinden hangilerinin yapılacağı ve bu testlere hangi topoloji elemanlarının dahil olup olmayacağı hassasiyetle belirlenir.</p>
<p>Uygulama konusu olacak bu testlerle ilgili detaylı soruları bu bağlantıdaki (<a href="https://www.siberoloji.com/arastirma/sizma-testi-safhalari-koordinasyon-2/">bkz.</a>) yazımızda bulabilirsiniz.</p>
<h3 class="western">Yasal Kısıtlama ve İzinler</h3>
<p>Teste konu sistemlerin belirlenmesinden sonra, bu konuda yasal kısıtlamaların bulunup bulunmadığına mutlaka dikkat edilmesi gerekmektedir. Kişisel verilerin korunması, özel hayatın gizliliği ve diğer benzeri kanuni çerçevelerin hükümleri doğrultusunda hareket edilmesi gerektiği hatırdan çıkarılmamalıdır.</p>
<p>Yapılacak testlerin çok kritik bir başka bağıl sistemi aksatması veya devre dışı bırakması durumunda, hukuki sorumluluk doğma ihtimali bulunur. Önceden izin alınması gerekli merciler varsa bunun için atılması gerekli adımlar da bu noktada belirlenir.</p>
<h3 class="western">Çerçeve ve IP Aralıkları</h3>
<p>Bazı durumlarda, hizmet alan firmanın alt yapısı geniş bir coğrafi alana yayılmış olabilir. Coğrafi olarak geniş alana yayılmış sistemlerin tek bir noktadan testi, maliyet ve zaman planlaması açısından uygunluk göstermeyebilir. Bu tür durumlarda testler, zaman ve mekanca parçalara ayrılabilir.</p>
<p>Bununla birlikte, alan geniş olmasa dahi sistemde belli IP aralıkları özel maksatlarla tahsis edilmiş ve kısıtlı istemcilerle iletişim kuruyor olabilir. Yapılacak testlerde, bu kısıtlı iletişim kanallarında trafik yoğunluğu oluşacağından, hariç tutma veya farklı bir zamanda (Örneğin gece) yapılması kararlaştırılır.</p>
<h2 class="western"><strong>Koordinasyon Tedbirleri</strong></h2>
<p>Kararlaştırılacak koordinasyon tedbirleri, ekiplerin kurulması ve uyumlu çalışması için vazgeçilmezdir. Kaynakların israfını engeller ve amaç birliğinin sağlanmasına katkıda bulunur. Bu sebeple en ince detaylarına kadar belirlenmeye çalışılmalıdır. Geçmiş tecrübeleri de dikkate alarak yapılan bir planlanma, meydana gelebilecek aksaklıkları önler.</p>
<h3 class="western">Zaman Planlaması</h3>
<p>Kapsam bölümünde tespit edilen konular ışığında, yürütülecek sürecin zaman planlaması yapılır. İhtiyaç duyulan toplam zaman ve bu toplam zamanın parçalara bölünerek aşama aşama planlanması kritik öneme sahiptir. Bir fikir vermesi açısından KİM? NEREDE? NE ZAMAN? NASIL? NE YAPACAK? Sorularına cevap aradığımız koordinasyon işlemlerindeki NE ZAMAN? sorusuna cevap aranır ve açıklığa kavuşturulur.</p>
<h3 class="western">Mekan ve Güvenlik Planlaması</h3>
<p>Gerçekleştirilecek testler esnasında görevlendirilen ekiplerin çalışma alanları ve tesislere giriş çıkışları, geçmiş güvenlik kayıtları (clearance) bu noktada görüşülür. Ayrıca ekiplere sağlanacak sosyal imkanlar ve ihtiyaçlar<b> </b>bu aşamada belirlenir.</p>
<p>Hizmet alan tarafın, kendi içerisinde uyguladığı güvenlik politikaları ile ekiplerin çalışma usulleri arasında bir uyumsuzluk çıkmaması için gerekli olan müsaadeler kararlaştırılır.</p>
<h3 class="western">İletişim Konuları</h3>
<p>Test sürecinin planlanması ve icrası esnasında hem yönetim hem de testi yapan ekiplerin kimlerle irtibat halinde olacakları belirlenir. İletişimin sağlıklı yapılamaması aksamalara yol açar, zaman planlaması kesintiye uğrayabilir. Bu tür istenmeyen durumların oluşmaması için, irtibat sisteminin etkili bir şekilde kurulması ve tüm taraflara bilgi verilmesi esastır.</p>
<p>İşlemler esnasında normal iletişim ihtiyaçları haricinde ortaya çıkan olağan dışı durumlar için aşağıda ayrı bir başlık bulunmaktadır.</p>
<h3 class="western">3. Taraflarla Koordinasyon</h3>
<p>Hizmet alan tarafın sistemleri, 3.taraf firmalardan hizmet alıyor olabilir. Örneğin, bulut sistemleri, İnternet servis sağlayıcıları veya güvenlik çözümleri sağlayıcıları. Böyle bir 3.taraf söz konusu ile onlarla koordinasyon mutlak yapılmalıdır. Gerekirse, tarafların zamanca koordinasyonu için ayrı bir inceleme yapılmalıdır. Bazı durumlarda saat farklarından dolayı koordinasyon eksiklikleri oluşabilmektedir.</p>
<h3 class="western">Sosyal Mühendislik Konuları</h3>
<p>Kapsam maddesinde tespit edilen testler içerisinde Sosyal Mühendislik testi mevcut ise, bununla ilgili hususlar netleştirilmelidir. Yapılacak sosyal mühendislik testlerinde kullanılacak teknikler veya gerekiyorsa çalışanların eposta listeleri gibi konular karara bağlanmalıdır.</p>
<h3 class="western">Acil Durum Konuları</h3>
<p>Testler esnasında istenmeyen durumlar ortaya çıkabilir. Bu tür durumlarda olayın ne şekilde, kime rapor edileceği mutlaka önceden tespit edilmelidir. Bu raporlama işleminin, hangi güvenli iletişim tekniği kullanılarak yapılacağı belirlenmelidir. Gerekirse açık ve kapalı anahtar değişiminin kimler arasında yapılacağı belirlenir.</p>
<p>İstenmeyen durumların neler olabileceği önceden bir miktar tahmin edilebilse de mümkün olan her türlü ihtimal öngörülemeyebilir. Bu durumlar, hizmet alan firmanın kapsamı, büyüklüğü veya fiziksel yapısına göre değişiklik gösterebilir.</p>
<p>Örneğin, küçük bir komut hatası bir Router cihazının kullanım dışı kalmasına yol açabilir. Bu durumda, cihazın tekrar yükleme ve kurulum yazılımının hazır bulundurulması, alınabilecek tedbirler arasında gösterilebilir. İlave olarak, bunun kime haber verileceği ve kim tarafından yapılacağının da tespit edilmesi gerekir.</p>
<h2 class="western"><strong>Diğer Konular</strong></h2>
<h3 class="western">Kapsam Dışı Veriler</h3>
<p>Tüm bu testler esnasında, belirlenen çerçeve dışına çıkılmamaya çalışılsa da bazen kapsam dışı veriler elde edilebilir. Bu konuda ne yapılacağı net ve açık bir şekilde karara bağlanmalıdır. Örneğin, “bir sisteme ulaşıldığını ispat için sadece dosya listesi kayıt altına alınacak, web kamerasından fotoğraf çekme, dosya indirme yapılmayacak” vb. kurallar belirlenmelidir.</p>
<h3 class="western">Ödeme Yöntemi</h3>
<p>Ödeme yöntemi, icra edilecek faaliyetin büyüklüğü, kaynak ihtiyacı ve koordinasyonun sonunda görüşülmeli ve taraflar arasında kararlaştırılmalıdır. Genellikle takip edilen yöntem, nihai sonuç raporunun tesliminden sonra ödeme şeklindedir. Taraflar arasında uzun süreli bir tedarik veya hizmet anlaşması mevcut ise belli bir oranın peşin, geri kalanının rapor tesliminden sonra ödenmesi şeklinde karar da verilebilir.</p>
<p>Yukarıda genel olarak açıklamaya çalıştığımız konular, Sızma Testi faaliyetinin 1. Safhası olan Koordinasyonun içeriğidir. Burada bahsedilen konular daraltılıp genişletilebilir. Umarız hizmet alacak ve verecek olan taraflara yol gösterici ve bilgilendirici olmuştur. Görüş ve önerilerinizi bize bildirebilirsiniz.</p>
