---
layout: post
title: Bilgi Toplama İşlemleri -2- Hedef Seçimi
date: 2016-04-24 23:59:24.000000000 +03:00
type: post
img: cyber3.jpg
published: true
status: publish
categories:
- Araştırma
tags:
- angajman kuralları
- bilgi toplama
- hedef seçimi
- pentest
- sızma testi

---
<p class="western">Sızma Testi 2. Safhası olan Bilgi Toplama işlemlerine bu <a href="https://www.siberoloji.com/arastirma/bilgi-toplama-islemleri-temel-yaklasim/">bağlantıda</a> bulunan yazımızla giriş yapmıştık. O yazı içerisinde belirttiğimiz ana konulardan birisi olan Hedef Seçimi başlığını açıklamaya çalışacağız.</p>
<h3 class="western">Hedefin Net Tanımı</h3>
<p>Bir bilişim sistemi hakkında bilgi toplama işlemleri başladığında, kaçınılmaz olarak bir çok alan adı veya IP adresi keşfedilecektir. Bazen, organizasyonların .com uzantılı sistemleri olmakla birlikte .net veya .xyz tarzında adresleri de bulunur. Bu noktada, testi yapan ekibin, koordinasyon esnasında tespit edilen kapsamın dışına kesinlikle çıkmaması gerektiği net olarak belirtilmelidir.</p>
<p>Kapsam, kısıtlayıcı kurallara bağlanmışsa ana çerçevenin dışına çıkılmaz. Bazı sistemler, çok faydalı ve kullanışlı bilgiler içerse dahi, aşağıda açıklayacağımız angajman kurallarına sıkı sıkıya bağlı kalmak esas olmalıdır. Aksi takdirde hem yasal hem de etik olarak problemin meydana gelmesi kaçınılmazdır.</p>
<h3 class="western">Angajman Kuralları ve Sınırlar</h3>
<p>Koordinasyon toplantılarında tespit edilen kapsamın, detaylı olarak kurallara bağlanmasıyla ortaya çıkan -net ve şüpheye yer bırakmayan- kurallara angajman kuralları denilmektedir. Örneğin, X sunucusu test edilirken kapsam dışı bir veri kaynağından gelen paketler, analiz yazılımına kayıt edilebilir. Bu veriler tespit edildiği anda, hangi davranış tarzının izleneceğini dikte eden kurallar, test ekibine hem sınır koyar hem de serbestliğinin derecesini belirler.</p>
<p>Angajman kuralları ve sınırların tespitinde, güvenlik hizmeti veren firmanın geçmiş tecrübeleri önemli bir kriterdir. Bu sebeple koordinasyon toplantısında bu kurallar tespit edilirken güvenlik firmasının hizmet alacak firmayı uyarması ve yönlendirmesi büyük öneme sahiptir.</p>
<p>Test ekibinin bir üyesi, konsantre olduğu başka bir konu sebebiyle bazı durumlarda bu kuralları unutabilir. İşte bu sebeple, sızma testlerinin bir kişi tarafından yapılması arzu edilmez. Mümkünse en az iki kişi olması tercih edilmelidir. Eğer ekip 3 kişiden oluşur ise, görev paylaşımı, zaman planlaması daha etkili olacak ve verimlilik de artacaktır. Bu sayede, bir ekip üyesinin gözünden kaçan kural ve kısıtın diğer üye tarafından fark edilmesi mümkün olabilecektir.</p>
<h3 class="western">Test Süresi ve Zaman Planına Uymak</h3>
<p>Sızma Testi için planlanan toplam sürenin ne kadarı Bilgi Toplama safhasına ayrılmıştır? Bu süre içerisinde gerçekleştirilebilecek ve gerçekleştirilemeyecek tarzda testler bulunabilir. Bazı testler ve analizler özelliklerine göre 1-2 ay sürebilmektedir.</p>
<p>Planlanan zamanın dışına çıkacak testler, hesapta olmayan zaman ihtiyacı ve iş gücü anlamına gelir. Bu durum hizmet alan firmaya hesapta olmayan maliyet yükü getirebilir. Angajman kurallarına bağlı olarak yapılacak testlerin, zaman kalırsa yapılacak testlerin ve gerçekleştirilmesi mümkün olmayan testlerin belirlenmesi ve test ekibine talimat olarak verilmesi çok önemlidir.</p>
<p>Örneğin, bir sunucunun Ağ bağlantıları keşfi yapılır iken bir yandan da tespit edilen bir grup IP adresinin ilettiği paketleri analiz etmek ilk anda hızlı ve etkin bir karar gibi görünebilir. Ancak ağ keşfi esnasında ortaya çıkacak bir aksaklık ve hata, diğer paket analiz işlemlerini de boşa çıkarabilir. Bu durumda toplam 5 saat sürecek bir işlem, kaynakların bölünerek teksif edilmesinden dolayı daha uzun sürecektir. Bu karar, test ekibi lideri tarafından geçmiş tecrübelerine dayanarak verilmelidir.</p>
<p>Buradan varacağımız sonuç, zamanı en baştan koordinasyon esnasında doğru planlamanın esas olduğudur. Toplam 10 saat ihtiyaç gerektiren bir işlemi 5 saat olarak planlamak, gerçekçilikten uzak olacak ve test ekibini de stres altına sokacaktır.</p>
<p>Geçmiş tecrübeler göstermiştir ki toplam planlanan zamana, hesapta olmayan gecikmeler için %20 pay ilave edilmelidir. Bu %20 zamanca ihtiyat tedbiri, duruma göre kullanılabilir veya gerek kalmayabilir. Kullanılmadığı takdirde, hizmet alan firmaya bildirilmeli ve maliyet hesabından düşülmelidir. Aksi takdirde faturalanması da etik bir davranış olmayacaktır.</p>
<p>Bu zaman planlaması Koordinasyon safhasının alt maddesi olan <a href="https://www.siberoloji.com/arastirma/sizma-testi-safhalari-koordinasyon-1/" target="_blank">Kontrol Tedbirleri</a> bölümünde ve diğer konular altında yer alan Ödeme Yöntemi bölümünde net olarak ortaya konulmalı ve yazılı hale getirilmelidir.</p>
<h3 class="western">Testin Nihai Hedefini Unutmamak</h3>
<p>Bilgi toplama işlemleri esnasında, testin nihai amacını unutmamak gerekir. Bu işlemler, testin nihai hedefini destekleyen tarzda araçlar kullanılarak yapılmalıdır.</p>
<p>Nihai hedefe katkısı olmayacak yazılımları kullanmak boşa zaman kaybı olacaktır. Bu sebeple, her adımda “Toplanacak bu bilgi, nihai hedefe ulaşmada ne derecede kritik öneme sahip?” sorusu dikkate alınmalıdır.</p>
