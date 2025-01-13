---
draft: false

title:  'Sızma Testi Safhaları Nelerdir?'
date: '2016-04-16T16:02:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Kullanılan bilişim sisteminin mevcut durumu ve alınması gereken tedbirleri belirlemek amacıyla yapılan testlere Sızma Testi (Penetration Test) adı verilmektedir. Sızma Testi olarak ifade edilen süreç 7 safhadan oluşur. Sızma Testi Safhaları, bazen net olarak birbirinden ayrılmasa da karakter olarak önemli farlılıklar da\_ ihtiva etmektedirler." 
 
url:  /tr/sizma-testi-safhalari-nelerdir/
 
featured_image: /images/cyber4.jpg
categories:
    - 'Sızma Testi Safhaları'
tags:
    - 'sızma testi'
---
Kullanılan bilişim sisteminin mevcut durumu ve alınması gereken tedbirleri belirlemek amacıyla yapılan testlere Sızma Testi (Penetration Test) adı verilmektedir. Sızma Testi olarak ifade edilen süreç 7 safhadan oluşur. Sızma Testi Safhaları, bazen net olarak birbirinden ayrılmasa da karakter olarak önemli farlılıklar da  ihtiva etmektedirler.

Planlamanın ve uygulamanın belli bir prosedüre bağlanması için genel olarak kabul edilen, sürecin 7 safhası bulunduğu yönündedir. Bu safhaları 5 adet olarak ifade eden kaynaklar da bulunmaktadır. Biz çalışmalarımızda 7 safhayı esas alacağız.

Standart olarak bahsedilen konular, hizmet veren taraf olarak güvenlik firmalarına yol gösterdiği gibi hizmet alan taraflara da kontrol ve denetim imkanı sağlamaktadır. Bu sebeple, yazılarımızda açıklayacağımız safhalar ve detaylar, sızma testinin tüm taraflarını ilgilendirmektedir.

Aşağıdaki bölümde Sızma Testi Safhaları listesini ve genel tanımlarını inceleyebilirsiniz.

## **Sızma Testi Safhaları**

**1. Koordinasyon**

Bu safha, yapılacak olan testlerin maksadını tespit ve testte yer alacak sistemlerin neler olacağını belirlemek amacı güder. Hizmet alan ve veren tarafların, birbirlerinin talep ve kabiliyetlerini anlamak için, karşılıklı soruların sorulduğu ve üzerinde konuşulan tüm konularda mutabakat sağlandığı safhadır.

İlerleyen safhalarda, sürecin tıkanıp gecikmelerin yaşanmaması adına “Koordinasyon” olarak adlandırılan bölümde, gerekli tüm koordinasyonun yapılıp tamamlanması beklenir. Sızma Testi hizmeti verecek tarafın, sistem ve kapsam ile ilgili sorularının yanında hizmet alacak tarafın da bir çok konuyu sorarak, kesinliğe kavuşturması gerekir. Şu an için Sızma Testi Safhaları hakkında genel bir açıklama yapmakla yetiniyoruz.

**2. Bilgi Toplama**

Sızma Testi yapılacak sistem veya hedef hakkında bilgi toplama, sürecin 2. safhasıdır. Bu safhada, bilgi toplama işlemleri genellikle “aktif bilgi toplama” ve “pasif bilgi toplama” olarak ayrılmaktadır. Ancak bu ayrım, gerçekte sadece hedefle iletişime geçme durumuna göre bilgi toplamanın çeşitlerini ifade eder.

Bizim burada ifade edeceğimiz bilgi toplama safhası ise, 3 ayrı katmandan oluşmaktadır. Her bir katmanda elde edilen bilgiler başlı başına bir anlam ifade edebileceği gibi, bir sonraki katmana girdi sağlayacak şekilde de kullanılabilir.
#### 1.Katman

Bu katman, bilgi toplamanın en hızlı ve otomatik programlar aracılığı ile gerçekleştirilen kısmıdır. Bu otomatik bilgi toplama araçları, arama motorları ve internet arşivlerini tarayarak hedef hakkında sonuçlar üretirler.

Ayrıca, hedefin belli standart bilgi güvenliği politikaları olup olmadığını ve bu standartlara ne kadar uyulduğunu araştırmayı da kapsar. Bilgi Toplama safhasının gerçekleştirildiğini söyleyebilmek için bu katman mutlaka uygulanmalıdır.
#### 2. Katman

1.Katmanda gerçekleştirilen işlemlerin yanında özellikle elle yapılan detaylı bilgi toplama işlemleridir. Belli bir takım sorulara cevap arayan bilgi toplama yöntemleri ve Açık Kaynak İstihbaratını da kapsar. Daha çok fiziksel yerleşim, adres bilgisi ve iş ilişkilerinin detayları incelenir.
#### 3. Katman

Çok ileri düzey sızma testlerinde gerekli olabilecek ve detaylı bilgi toplama işlemleridir. Uzun zamana yayılmış ve mümkün olan her türlü tekniğin kullanıldığı katmandır. Her sızma testinde yapılma zorunluluğu yoktur. Bu katmana ait bilgi toplama daha çok devletler düzeyini ilgilendirir.

**3. Tehdit Modelleme**

Bu safhada, hizmet alan tarafın Varlıkları ve bu varlıklara karşı mevcut olabilecek Potansiyel Tehditler analiz edilir. Klasik SWOT analizi yaklaşımına benzer bir yöntem izlenebilir. Burada önemli nokta, varlıkların ve değerlerinin doğru tespit edilerek, önem derecesine göre tehditlerin doğru analiz edilmesidir.

En önemli kriterlerden bir tanesi de tehdidin tekrar tekrar meydana gelme olasılığıdır. Bu durum genellikle, hizmet alan tarafın kullandığı sistemler konusunda, hangi tedarikçiye ne kadar vazgeçilmeyecek derecede bağlandığıyla doğrudan ilgilidir.

Tüm bu yapılan analizler neticesinde tehditler ve potansiyel tehditler ortaya konulur.

**4. Zafiyet Analizi**

Hedef sistemin fiziksel veya programlardan kaynaklanan mantıksal açıklarını, zayıf yönlerini ortaya çıkarma amacı ile ilgilidir. Bu zafiyetleri tespit için gerçekleştirilecek deneme ve test yöntemlerinin uygulanması safhasıdır.

Uygulama esnasında 1. Safha olan koordinasyon esnasında belirlenmiş kısıtlayıcı kurallara mutlaka uygun hareket edilmelidir. Zaman ve imkanlar da dikkate alınarak tespit edilen hedefleri gerçekleştirmek esastır.

Örneğin: Hedefimiz, yetkili kullanıcı olarak web sunucuya erişim sağlamak ise, bu hedefe yönelik olarak zafiyet tespit edilmeye çalışılmalıdır. Bu çalışmalar esnasında testi yapanın karşısına başka zafiyetler çıkabilir. Bunlar ayrıca raporlanmak üzere kaydedilse dahi asıl hedeften sapılmamalıdır.

**5. Sisteme Giriş**

Sisteme giriş safhası, önceden gerçekleştirilen 4 safhanın sonucunda, mevcut bulunan güvenlik tedbirlerini devre dışı bırakarak sisteme giriş noktasını kullanmak ile ilgilidir.

Zafiyet analizi ve bilgi toplama safhaları yeterince verimli olarak gerçekleştirilmiş ise bu safha, belirli tekniklerin uygulanmasından ibarettir. Çünkü elde edilen bilgiler ve analizler sistemde hangi zafiyetlerin bulunduğunu önceki safhada zaten ortaya çıkarmıştır. Geriye kalan, bu zafiyeti istismar eden uygulamayı devreye sokmaktır.

**6. Giriş Sonrası İşlemler**

Bu safhanın ilk amacı, içerisine erişim sağlanılan sistemin üzerinden bulundurduğu bilgileri ve kıymet derecesidir.

Sistemin diskinde kayıtlı veriler ne derecede hassas? Bu sistem, diğer sistemlere erişim için kullanışlı mı? Bir sonraki adım için kalıcılık sağlamak gerekli ise bu sistem kullanılabilir mi?

Bütün bu sorulara vereceğimiz cevapların yanında 1.safha olan Koordinasyon safhasında tespit edilen kurallar ve kapsamın sınırları çok önemlidir.

**7. Raporlama**

Sızma Testi Safhaları sonunda elde edilen bulgular ve sonuçlar bir rapor halinde hizmet alan tarafa sunulur. Bu raporun belirli bir formatı yoktur. Aslında her firma kendine özgün bir rapor üretebilir. Bir şablon kısıtı olmasa da, raporun belli bir takım özellikleri taşıması beklenmelidir.

Genellikle ilk kısımda, konuyu özetleyen ve teknik detaylardan arındırılmış bir “Uygulama Özeti” olması beklenir. İkici kısım, gerekli çalışmaları yapacak teknik personele yol gösteren “Teknik Rapor” kısımdır. Bu bölümde, tüm safhalar esnasında gerçekleştirilen işlemler teknik detaylarıyla raporlanır. Tespit edilen zafiyetler, önem derecesi ifade edilir. Son olarak, sonuç kısmında ise düşünce ve tavsiyelere yer verilerek rapor tamamlanır.

Bu yazımızda kısaca açıklamasını yaptığımız safhaların detaylarına ilerleyen yazılarımızda yer vereceğiz.
