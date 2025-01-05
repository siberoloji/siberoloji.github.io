---
draft: false

title:  'Siber Güvenlik Uzmanı Adayları İçin Yol Haritası'
date: '2016-04-10T14:41:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Teknolojinin günümüzde ulaştığı noktada, siber güvenlik konuları önemini giderek arttırmaya başladı. Gündeme gelen haber ve konular, hizmet sağlayıcılarla birlikte bireysel kullanıcıları da artık daha yakından ilgilendiriyor. Güvenli hizmet seviye ve kalitesi kullanıcılar için tercih kriterlerinin üst sıralarına yerleşmiş durumda. Dünyanın her yerinde olduğu gibi, ülkemizde de siber güvenlik uzmanı ihtiyacı ile ilgili duyuru ve haberleri hepimiz takip ediyoruz. Bu konuda kendisini geliştirmek isteyen uzman adayları için faydalı olacağını düşündüğümüz bir yol haritası ve tavsiye listesi hazırladık.' 
 
url:  /tr/siber-guvenlik-uzmani-adaylari-icin-yol-haritasi/
 
featured_image: /images/cyber6.jpg
categories:
    - 'Siber Güvenlik'
tags:
    - 'siber güvenlik yol haritası'
---


Teknolojinin günümüzde ulaştığı noktada, siber güvenlik konuları önemini giderek arttırmaya başladı. Gündeme gelen haber ve konular, hizmet sağlayıcılarla birlikte bireysel kullanıcıları da artık daha yakından ilgilendiriyor. Güvenli hizmet seviye ve kalitesi kullanıcılar için tercih kriterlerinin üst sıralarına yerleşmiş durumda. Dünyanın her yerinde olduğu gibi, ülkemizde de siber güvenlik uzmanı ihtiyacı ile ilgili duyuru ve haberleri hepimiz takip ediyoruz. Bu konuda kendisini geliştirmek isteyen uzman adayları için faydalı olacağını düşündüğümüz bir yol haritası ve tavsiye listesi hazırladık.



Başlangıç olarak belirtmemiz gereken ilk konu, öğrenmeye sistematik olarak yaklaşmak gerektiğidir. Belli bir mantık sırasıyla ve birbirini tamamlayacak şekilde yapılacak öğrenme metodu, yaşanacak süreçte tıkanıp geriye dönmeleri önleyecektir. Öğrenmeye başladığınız bir konuyu tam olarak kavramadan diğerine geçmek, ne yazık ki siber güvenlik uzmanı eğitiminde işe yaramıyor. Maalesef, Kali Linux kurmak ve hemen içindeki araçları kullanmaya başlamak bir sonuç vermiyor.



## Siber Güvenlik Uzmanı Adayı Hangi Konuları Bilmeli?



**1. İşletim Sistemi**



Yapılacak bir test esnasında ulaşacağınız nokta İşletim Sistemidir. Hedef İşletim sistemine ulaştığınızda, nereye bakacağınızı, ne yapacağınızı bilmiyorsanız hareket alanınız oldukça kısıtlı olacaktır. Bu sebeple, derinlikli işletim sistemi bilgisi her siber güvenlik uzmanı için olmazsa olmaz şarttır.



İşletim sistemi bilgisi, nereye tıklayacağını bilmekten çok ayrı bir konudur. Normal kullanıcı veya root yetkili kullanıcı olarak işletim sisteminin komut satırına ulaştığınızda fare ile tıklayacağınız bir ekran yoktur. Bu yüzden tüm işlemleri komut satırından yapmanız gerekeceğini varsaymalısınız.



Ulaştığınız sistemin nasıl çalıştığını çok iyi bilmelisiniz. Örneğin log dosyalarının nerelerde tutulduğu, registry kayıtlarına nasıl ulaşılacağı ve komut satırından ağ bağlantılarını inceleme ve yönetme en temel öğrenilmesi gereken konular arasındadır. Tüm donanım ve yazılımlar, İşletim Sistemini Platform olarak kullanan ikincil yapılardır. Bu yüzden asıl olarak, yazılımım üzerinde çalıştığı platformun davranış tarzlarını mutlaka bilmeniz gerekmektedir. Windows, Linux veya Unix tabanlı işletim sistemleri hakkında ciddi bir eğitim süreci listemizde ilk sırada yer alıyor.



**2. Ağ İletişimi ve Protokol Bilgisi**



İşletim Sistemlerinin çalışma ve davranış yapısını hatırı sayılır seviyede öğrenmenin ardından sıra bu sistemlerin birbiriyle haberleşmesi kısmına gelmektedir. Birbirine bağlanan sistemlerin oluşturduğu ağın yapısı ve iletişimi esnasında kullanılan protokoller çok iyi derecede bilinmelidir.



Burada bilginin seviyesini tarif etmek için bir açıklama yapalım. Ağ ve protokol bilgisi, OSI modelinin katmanlarını ezbere saymaktan çok ileride bir konudur. Her katmanı, paketlerin yapısı ve içeriğini ciddi şekilde özümsemek gerekmektedir. Hangi katmanda hangi işlemler yapılıyor? Sistem bu işlemlere ne şekilde tepki veriyor? Tüm buna benzer sorular, tereddüde yer bırakmayacak şekilde öğrenilmelidir.



TCP ile UDP protokollerinin farkları ve routing olarak tanımlanan, paketlerin ağ ortamında seyahati de bu konulara dahildir. DNS, ARP veya DHCP konularının detaylı olarak bilinmesi ile ağ ve protokol bilgisinin olgunlaşması için göz ardı edilemeyecek konular arasında yer almaktadır.



Bir işlemin Veri Bağı katmanında mı yoksa Fiziksel Katmanda mı gerçekleştiği konusunda tereddüt yaşıyorsanız sonraki aşamaya geçmemenizi tavsiye ediyoruz.



**3. Proses Bilgisi ve Saldırı Türleri**



Bu madde, yukarıda açıklanan 2. maddenin devamı niteliğindedir. Ağ ve Protokol bilgisiniz eksik ise ARP spoof veya MiTM saldırılarını analiz etmek imkansızdır. Araya girme ve paketleri değiştirme işlemleri için çalışabilmeniz adına 2. Maddede ifade edilen konuların bilinmesi çok önemlidir. Prosesleri bilmelisiniz ki nereye bakacağınızı keşfedin. Böyle bir prosesin olduğunu bilmiyorsanız, nereye bakacağınızı deneyerek bulamazsınız.



Bu konuda vurgulamak istediğimiz nokta, Meraktır. Nasıl çalışıyor? Sorusu her zaman sizi meşgul etmeli ve sabırla öğrenme gayreti içerisinde olmalısınız.



**4. Temel Script Yazma Kabiliyeti**



VBS ve Bash Script yazmayı öğrenmenizi şiddetle tavsiye ediyoruz. Bu sayede bir çok işlemi otomatik olarak sistemin işlemcisine yaptırabilirsiniz. Elle uğraşmak, zaman kaybı ve hata demektir. İnsan gözüyle yapılan inceleme, bilginin gözden kaçırılma ihtimalini artırmaktadır. Yazacağınız scriptler ile oluşturacağınız kriterler, hem otomatik olarak verileri analiz eder, sürat kazandırır, hem de hatayı en aza indirir.



Script yazma konusunda belli bir seviyeye ulaştığınızda doğal olarak Python gibi bir programlama diliyle daha güçlü programlar yazmaya başlayabilirsiniz. Edineceğiniz tecrübeler zaten sizi bu noktaya ulaştıracaktır. Script yazmayı öğrenmek, atlanacak bir konu değildir. Mutlaka öğrenilmeli ve komut satırından çalışmaya dost olmalısınız.



**5. Firewall**



Siber Güvenlik Uzmanı, firewall çalışma mantığını mutlaka öğrenmelidir. Bunu yapmanın en iyi yolu kendinize bir firewall alıp, bulup üzerinde çalışmaktır. Firewall yönetimini öğrenmek her zaman işe yarayacaktır. İzinler, kısıtlamalar ve kuralları bilmek Access Control işlemlerini öğrenmek, onların çalışma mantığını kavramada önemli bir adımdır. IP Spoofing konusu, Firewall konusu ile doğrudan ilgilidir. Bu konuda araştırma yapmalı ve öğrenmelisiniz. Daha sonra PIX ve ASA konularına geçip bütün işlemlere tekrar başlamak en doğrusu olacaktır.



**6. Forensics**



Dijital ortamlarda araştırma ve analiz yapma, delil toplama uzmanlık gerektiren bir konudur. Bu konuda bilgi sahibi olmak için ciddi bir araştırma yapmalısınız. Bir sisteme girildiğinde, nerelerde izler bırakıldığını öğrenmemek, yapacağınız araştırmalarda delil toplama işlemini sağlık yapamamanız anlamına gelir.



Dijital analiz ve log inceleme için 1. Maddede bahsettiğimiz İşletim Sistemi Bilgisi yine karşımıza çıkmaktadır. İşletim Sistemini çok iyi bilirseniz, Forensics tekniklerini uygulama konusunda ilerlemek çok daha verimli olacaktır.



**7. Programlama Bilgisi**



Bir Siber Güvenlik Uzmanı, programlamayı ileri derecede bilmelidir. Buradaki ileri derece, nesne yönelimli programlamayı çok iyi bilmek ve istediği algoritmayı kodlamayı başarmak değildir. Özellikle port tarayıcı gibi basit bir programdan başlayarak socketler ve ağ üzerinde işlemler yapabilen amaca yönelik programlar yazabilmektir.



Github benzeri platformlarda yayınlanan açık kaynak kodlu port tarayıcı vb. programların kodlarını, zaman ayırarak incelemeniz size oldukça zaman kazandıracaktır. Kodları inceleyebiliyor ve kendiniz yazabiliyorsanız ilerleme kaydetmişsiniz demektir.



**8. Veri Tabanı bilgisi**



Veri tabanları, bütün sistemlerin işini kolaylaştırmaktadır. Bu sebeple, veri bir yerde depolanıyorsa mutlaka bir veri tabanı vardır diyebiliriz. Oracle, SQL vb. Veri tabanlarını bilmek oldukça önemlidir. Ulaşacağınız sistemler mutlaka bir veri tabanı kullanıyor olacaktır. Veri tabanları konusunda çok ileri seviye uzman olmanız beklenmese de en azından Tutorial olarak belirtilen dokümanları anlayarak okumuş ve temel sorguları yapabiliyor olmanız gerekir. Sorguların yanında tablolar ve izinler, kullanıcı yetkileri mutlaka öğrenilmesi gereken veri tabanı konularıdır.



**9. Sabır**



Yukarıda belirttiğimiz konu başlıklarının, kısa zamanda öğrenilecek konular olmadığını sanırım fark ettiniz. Gerçekten uzun zaman gerektiren ve olabildiğince soyut konular olduğunu belirtmek gerek. Tüm bu konularda bıkmadan sabırla çalışabileceğinizi düşünüyorsanız, Siber Güvenlik Uzmanı Adayı olduğunuzu söyleyebilirsiniz.



Unutmayın. Her başarı hikayesi bir küçük adımla başlar. Bir noktadan çalışmaya başlamak istiyorsanız, listede belirttiğimiz konuları sırayla ve sabırla öğrenmeye başlayın. Öğrendiğiniz konuları blog yazılarıyla veya bir takım seminerler düzenleyerek başkalarıyla paylaşmanın da önemli olduğunu mutlaka söylemek istiyoruz. Bu sayede bilginiz hem kalıcı hale gelecek, hem de tam olarak bilmediğiniz noktaları fark edeceksiniz. Seminerlerinize bu satırların yazarını da davet ederseniz seve seve katılmaya çalışacağımı belirtmek isterim.
