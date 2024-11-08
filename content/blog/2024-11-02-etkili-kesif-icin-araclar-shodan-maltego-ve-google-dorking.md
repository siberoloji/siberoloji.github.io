---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Bilgi Toplama
classic-editor-remember:
- classic-editor
date: "2024-11-02T21:25:24Z"
excerpt: Bu yazımızda Shodan, Maltego ve Google Dorking'in keşif araçları olarak nasıl
  çalıştıklarını, özel özelliklerini ve bunları etkili bir şekilde kullanmak için
  en iyi uygulamaları inceleyeceğiz.
guid: https://www.siberoloji.com/?p=5886
id: 5886
image: /assets/images/2024/09/cybersecurity2.webp
tags:
- google dorking
- maltego
- shodan
title: 'Etkili Keşif İçin Araçlar: Shodan, Maltego ve Google Dorking'
url: /tr/etkili-kesif-icin-araclar-shodan-maltego-ve-google-dorking/
---

Siber güvenlik dünyasında keşif, bir hedefin sistemlerini, ağlarını ve olası güvenlik açıklarını anlamanın ilk adımıdır. Bilgi toplama olarak da bilinen keşif, etik hackerların bir hedefin ortamını haritalandırmasını, yapısını anlamasını ve zayıflıkları belirlemesini sağlar. Üç son derece etkili araç—Shodan, Maltego ve Google Dorking—keşif aşamasında istihbarat toplamada önemli bir rol oynar. Bu araçların her biri benzersiz içgörüler sunarak siber güvenlik uzmanlarına bilinçli kararlar almak için ihtiyaç duydukları verileri sağlar.

Bu yazımızda Shodan, Maltego ve Google Dorking'in keşif araçları olarak nasıl çalıştıklarını, özel özelliklerini ve bunları etkili bir şekilde kullanmak için en iyi uygulamaları inceleyeceğiz.

<hr />

<h3><strong>1. Shodan: İnternete Bağlı Cihazlar İçin Arama Motoru</strong></h3>
Shodan sıklıkla "Nesnelerin İnterneti için arama motoru" (IoT) olarak anılır. Web sitelerini dizinleyen geleneksel arama motorlarının aksine, Shodan interneti kendisine bağlı cihazlar için tarar; örneğin sunucular, yönlendiriciler, web kameraları, akıllı televizyonlar ve endüstriyel kontrol sistemleri. Shodan, IP adresleri, bağlantı noktası yapılandırmaları, çalışan hizmetler ve güvenlik açıkları dahil olmak üzere bu cihazlar hakkında değerli veriler sağlar.
<h4><strong>Shodan Nasıl Çalışır?</strong></h4>
Shodan, IP adresleri ve bağlantı noktalarına göre internete bağlı cihazları aramak için web tarayıcılarını kullanır. Bu cihazları analiz ederek işletim sistemleri, açık bağlantı noktaları ve protokoller hakkında ayrıntılar toplar. Shodan daha sonra bu verileri kolayca aranabilir bir biçimde düzenleyerek siber güvenlik uzmanlarının ağ güvenliğini değerlendirmesi için erişilebilir hale getirir.
<h4><strong>Keşifte Shodan'ın Kullanımları</strong></h4>
<ol>
 	<li><strong>Açık Portları ve Hizmetleri Belirleme</strong>
Shodan, hedef sistemde hangi portların açık olduğunu ve bu portlarda çalışan hizmetleri belirleyebilir. Bu bilgi, bilgisayar korsanları için giriş noktalarını ortaya çıkarabilir ve etik bilgisayar korsanlarının olası güvenlik açıklarını anlamalarına yardımcı olabilir.</li>
 	<li><strong>Güvenlik Açığı Olan Cihazları Bulma</strong>
Shodan'ın arama filtreleri kullanıcıların bilinen güvenlik açıklarına sahip cihazları bulmasını sağlar. Örneğin, etik bir bilgisayar korsanı popüler yazılımların eski sürümlerini çalıştıran sistemleri arayabilir ve güvenlik açığı değerlendirmesi için bir başlangıç ​​noktası sağlayabilir.</li>
 	<li><strong>IoT Güvenlik Risklerini Anlama</strong>
Birçok IoT cihazı varsayılan veya zayıf güvenlik yapılandırmaları nedeniyle savunmasızdır. Shodan, siber güvenlik uzmanlarının potansiyel güvenlik risklerini değerlendirmesine ve ele almasına olanak tanıyarak, savunmasız IoT cihazlarını belirlemeye yardımcı olur.</li>
 	<li><strong>Ağ Altyapısının Haritalanması</strong>
Etik hackerlar, ilgili cihazları arayarak bir organizasyonun ağ altyapısının üst düzey bir haritasını oluşturabilir. Bu veriler, bağlı cihazlar hakkında ayrıntılar içerir ve olası saldırı yüzeylerinin belirlenmesine yardımcı olabilir.</li>
</ol>
<h4><strong>Shodan Arama Filtreleri ve Teknikleri</strong></h4>
Shodan'ın gücü, kullanıcıların arama sonuçlarını konuma, porta, ürüne ve diğer parametrelere göre daraltmasına olanak tanıyan gelişmiş arama filtrelerinde yatmaktadır:
<ul>
 	<li><strong>ana bilgisayar adı:</strong> <code>hostname:example.com</code> – Belirli bir ana bilgisayar adıyla ilişkili cihazları arar.</li>
 	<li><strong>port:</strong> <code>port:80</code> – Belirli açık porta göre cihazları filtreler.</li>
 	<li><strong>os:</strong> <code>os:"Windows 10"</code> – Belirli bir işletim sistemini çalıştıran cihazları bulur.</li>
 	<li><strong>ülke:</strong> <code>country:"US"</code> – Arama sonuçlarını belirli bir ülkede bulunan cihazlarla sınırlar.</li>
</ul>
<h4><strong>Shodan'ı Kullanmak İçin En İyi Uygulamalar</strong></h4>
<ul>
 	<li><strong>Geniş Aramalarla Başlayın</strong> : Hedef kitlenin ağına genel bir bakış elde etmek için daha geniş aramalarla başlayın.</li>
 	<li><strong>Açık Portlara ve Güvenlik Açığı Olan Servislere Odaklanın</strong> : Saldırılar için giriş noktası olabileceklerinden, açık portlara ve bu portlarda çalışan servislere özellikle dikkat edin.</li>
 	<li><strong>Aramaları Yetkili IP Aralıklarıyla Sınırlandırın</strong> : Yetkili keşif yaparken, aramaları kuruluş tarafından sağlanan belirli IP aralıklarıyla sınırladığınızdan emin olun.</li>
</ul>

<hr />

<h3><strong>2. Maltego: Veri Görselleştirme ve Bağlantıları Eşleme Aracı</strong></h3>
Maltego, siber güvenlikte veri görselleştirme ve ilişki haritalama için kullanılan güçlü bir araçtır. Kullanıcıların birden fazla kaynaktan bilgi toplamasını, bağlantıları görselleştirmesini ve veri noktaları arasındaki ilişkileri belirlemesini sağlar. Maltego ile siber güvenlik uzmanları, alan adları, sosyal medya profilleri ve e-posta adresleri gibi verileri inceleyip analiz edebilir ve gizli bağlantıları ortaya çıkarmalarına yardımcı olabilir.
<h4><strong>Maltego Nasıl Çalışır?</strong></h4>
Maltego, çeşitli kaynaklardan veri toplamak ve bağlamak için "dönüşümler" kullanır. Her dönüşüm, bir etki alanında alt etki alanları aramak veya ilişkili IP adreslerini haritalamak gibi belirli bir görevi gerçekleştirir. Bu veriler daha sonra çeşitli varlıklar arasındaki bağlantıları gösteren bir grafikte görüntülenir ve bu da kalıpları ve ilişkileri tespit etmeyi kolaylaştırır.
<h4><strong>Keşifte Maltego'nun Kullanımları</strong></h4>
<ol>
 	<li><strong>Sosyal Ağları Haritalama</strong>
Maltego, sosyal medyada bireyler, şirketler ve kuruluşlar arasındaki bağlantıları görselleştirebilir ve bu da onu sosyal mühendislik keşfi için değerli bir araç haline getirir.</li>
 	<li><strong>Alan Adı İlişkilerini Keşfetme</strong>
Maltego, bir alan adının ilişkili IP adreslerini, alt alan adlarını ve e-posta adreslerini analiz ederek kullanıcıların hedefin çevrimiçi varlığı ve altyapısı hakkında kapsamlı bir profil oluşturmasına olanak tanır.</li>
 	<li><strong>Veri Noktaları Arasındaki İlişkileri Belirleme</strong>
Maltego'nun dönüşümleri, etik hacker'ların paylaşılan IP adresleri veya e-posta hesapları gibi görünüşte ilgisiz veri noktaları arasındaki ilişkileri haritalandırmasını sağlıyor.</li>
 	<li><strong>Kamuya Açık Bilgilerin Ortaya Çıkarılması</strong>
Maltego, DNS kayıtları, WHOIS bilgileri ve sosyal medya gibi çeşitli kamuya açık kaynaklardan veri çekerek kullanıcıların hedef hakkında geniş yelpazede kamuya açık bilgileri toplamasına yardımcı olur.</li>
</ol>
<h4><strong>Popüler Maltego Dönüşümleri</strong></h4>
Maltego, farklı veri türlerini toplamak için çeşitli dönüşümler sağlar:
<ul>
 	<li><strong>Alan Adından IP'ye Dönüşüm</strong> : Bir alan adıyla ilişkili IP adreslerini alır.</li>
 	<li><strong>WHOIS Veri Dönüşümü</strong> : Bir alan adına ait WHOIS bilgilerini çıkararak kayıt sahibi bilgileri gibi ayrıntıları ortaya çıkarır.</li>
 	<li><strong>Sosyal Ağ Dönüşümleri</strong> : Twitter ve LinkedIn gibi sosyal medya platformlarındaki bağlantıları haritalandırır.</li>
 	<li><strong>Kişiden E-postaya Dönüşüm</strong> : Bir kişiyle ilişkili olası e-posta adreslerini bulur.</li>
</ul>
<h4><strong>Maltego'yu Kullanmak İçin En İyi Uygulamalar</strong></h4>
<ul>
 	<li><strong>Öncelikle Önemli Varlıklara Odaklanın</strong> : Alan adları veya IP adresleri gibi önemli veri noktalarıyla başlayın ve oradan ilgili varlıkları ortaya çıkarmak için genişletin.</li>
 	<li><strong>Derin Analiz İçin Çoklu Dönüşümler Kullanın</strong> : Kapsamlı bilgi toplamak için tek bir veri noktasında birden fazla dönüşüm çalıştırın.</li>
 	<li><strong>Verileri Görsel Olarak Organize Edin</strong> : Maltego'nun gücü veri görselleştirmesinde yatmaktadır, bu nedenle veri ilişkilerini etkili bir şekilde bağlamak ve analiz etmek için grafik özelliğini kullanın.</li>
</ul>

<hr />

<h3><strong>3. Google Dorking: Hedeflenen Bilgiler İçin Gelişmiş Arama Operatörlerinden Yararlanma</strong></h3>
Google Dorking, internetteki tipik arama sonuçlarından sıklıkla gizlenen bilgileri ortaya çıkarmak için gelişmiş arama operatörleri kullanan bir tekniktir. Arama operatörlerini birleştirerek, etik hacker'lar hassas bilgiler içerebilecek dosyalar, dizinler ve diğer açık kaynaklar gibi web sitelerinden belirli bilgileri çıkarabilir.
<h4><strong>Google Dorking Nasıl Çalışır?</strong></h4>
Google Dorking, belirli veriler için hedefli aramalar gerçekleştirmek üzere Google'ın gelişmiş arama yeteneklerine güvenir. <code>intitle:</code>, <code>inurl:</code>, <code>filetype:</code>ve <code>site:</code> gibi arama operatörlerini kullanarak kullanıcılar, arama sonuçlarını yalnızca belirli dosya türlerini, dizinleri veya web sitesi bölümlerini içerecek şekilde daraltabilir.
<h4><strong>Keşifte Google Dorking'in Kullanımları</strong></h4>
<ol>
 	<li><strong>Hassas Dosya ve Dizinleri Bulma</strong>
Google Dorking, etik hackerların Excel sayfaları, PDF'ler veya yapılandırma dosyaları gibi hassas bilgiler içerebilecek ifşa edilmiş dosyaları aramasına olanak tanır.</li>
 	<li><strong>Güvenli Olmayan Giriş Sayfalarını Bulma</strong>
Google Dorking ile kullanıcılar, HTTPS'si olmayan veya iki faktörlü kimlik doğrulaması gerektiren güvenli olmayan giriş sayfalarını bulabilirler.</li>
 	<li><strong>Açığa Çıkmış Yönetim Panellerini Belirleme</strong>
Birçok web sitesinde düzgün bir şekilde güvence altına alınmamış veya gizlenmemiş yönetim oturum açma sayfaları bulunur. Google Dorking bu sayfaları bulmanıza yardımcı olarak olası güvenlik açıklarına ilişkin içgörüler sağlayabilir.</li>
 	<li><strong>E-posta Adreslerini ve İletişim Bilgilerini Ortaya Çıkarma</strong>
Google Dorking, herkese açık iletişim sayfalarını veya dizinlerini arayarak e-posta adreslerini ortaya çıkarabilir; bu da sosyal mühendislik amaçları için yararlı olabilir.</li>
</ol>
<h4><strong>Yaygın Google Dorking Operatörleri</strong></h4>
Google Dorking için bazı yararlı operatörler şunlardır:
<ul>
 	<li><strong>site:</strong> <code>site:example.com</code> – Arama sonuçlarını belirli bir etki alanıyla sınırlar.</li>
 	<li><strong>filetype:</strong> <code>filetype:pdf</code> – PDF'ler gibi belirli dosya türlerini arar.</li>
 	<li><strong>intitle:</strong> <code>intitle:"index of"</code> – Başlığında belirli anahtar kelimeler bulunan sayfaları bulur; genellikle dizinleri bulmak için kullanılır.</li>
 	<li><strong>inurl:</strong> <code>inurl:login</code> – URL'de belirli anahtar sözcükleri olan sayfaları arar, genellikle giriş sayfalarını bulmak için kullanılır.</li>
</ul>
<h4><strong>Google Dorking için En İyi Uygulamalar</strong></h4>
<ul>
 	<li><strong>Operatörleri Birleştirme</strong> : Birden fazla operatör kullanmak sonuçları daraltabilir ve daha kesin bilgiler elde etmenizi sağlayabilir.</li>
 	<li><strong>Hassas Verilere Erişimden Kaçının</strong> : Google Dorking çok sayıda bilgiyi ortaya çıkarsa da, etik hackerlar potansiyel olarak hassas verilere erişmekten veya bunları indirmekten kaçınmalıdır.</li>
 	<li><strong>Dikkatli ve İzinli Kullanın</strong> : Tüm keşif araçlarında olduğu gibi, Google Dorking'i kurumsal verileri keşfetmek için kullanmadan önce yetkilendirildiğinizden emin olun.</li>
</ul>

<hr />

<h3><strong>Shodan, Maltego ve Google Dorking'i karşılaştırma</strong></h3>
Bu araçların her biri keşif için benzersiz güçler ve yetenekler sunmaktadır:
<table>
<thead>
<tr>
<th><strong>Alet</strong></th>
<th><strong>En İyisi İçin</strong></th>
<th><strong>Temel Özellikler</strong></th>
<th><strong>Sınırlamalar</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Şodan</strong></td>
<td>Nesnelerin İnterneti (IoT) ve ağ cihazı keşfi</td>
<td>Bağlı cihazları arar, açık portları ortaya çıkarır</td>
<td>Genel cihazları ifşa edebilir ancak tüm özel sistemleri ifşa edemez</td>
</tr>
<tr>
<td><strong>Malta</strong></td>
<td>İlişki haritalama ve veri görselleştirme</td>
<td>Bağlantıları görselleştirir, birden fazla veri dönüşümü kullanır</td>
<td>Tam kullanım için dönüşüm bilgisi gerekir</td>
</tr>
<tr>
<td><strong>Google Dorking</strong></td>
<td>Dosyaları, dizinleri ve genel kaynakları bulma</td>
<td>Hedeflenen bilgiler için gelişmiş arama operatörleri</td>
<td>Google tarafından indekslenen verilerle sınırlıdır</td>
</tr>
</tbody>
</table>
Bu araçlar birbirini tamamlayarak keşif aşamasında bilgi toplamaya yönelik kapsamlı bir yaklaşım sunar.

<hr />

<h3><strong>Etik Hususlar ve Yasal Sınırlar</strong></h3>
Shodan, Maltego ve Google Dorking gibi keşif araçları güçlüdür, ancak sorumlu bir şekilde kullanılmaları gerekir. Sistemlerde yetkisiz keşif yapmak yasadışı olabilir ve gizlilik politikalarını ihlal edebilir. Etik hackerlar her zaman şunları yapmalıdır:
<ul>
 	<li>Verileri toplamadan önce hedef kuruluştan açık izin alın.</li>
 	<li>Penetrasyon testi sözleşmelerinde ve etik hackleme yönergelerinde belirtilen kurallara uyun.</li>
 	<li>Keşfedilen tüm güvenlik açıklarının ilgili taraflara bildirildiğinden emin olun.</li>
</ul>
Siber güvenlik uzmanları etik standartlara bağlı kalarak, yasal sınırları aşmadan bir kuruluşun güvenlik duruşunu iyileştirmek için bu araçları kullanabilirler.

<hr />

<h3><strong>Sonuç</strong></h3>
Shodan, Maltego ve Google Dorking, siber güvenlik profesyonellerinin sırt çantasındaki vazgeçilmez araçlardır. İnternete bağlı cihazlar, sosyal ağlar, web sitesi yapıları ve çok daha fazlası hakkında içgörüler sunarak etik hackerların güvenlik açıklarını belirlemesine ve olası tehditleri değerlendirmesine yardımcı olurlar. Bu araçlar birlikte kullanıldığında, hedef ortamın kapsamlı bir görünümünü sunarak etkili güvenlik değerlendirmeleri için temel oluşturan kapsamlı bir keşif aşamasına olanak tanır.

Her aracın yeteneklerini ve sınırlamalarını anlamak, etik hackerların verileri verimli ve etik bir şekilde toplamasına, kuruluşları olası tehditlerden korumasına ve siber güvenlik savunmalarını güçlendirmesine olanak tanır. Doğru bilgiyle, bu keşif araçları kuruluşların saldırganlardan bir adım önde olmasını sağlayabilir.

<hr />

<h3><strong>Keşif Araçları Hakkında SSS: Shodan, Maltego ve Google Dorking</strong></h3>
<strong>1. Shodan'ın temel amacı nedir?</strong>
Shodan, bağlı cihazları internette tarayarak, açığa çıkan portlar, servisler ve güvenlik açıkları hakkında bilgi sağlar.

<strong>2. Maltego keşifte nasıl yardımcı olur?</strong>
Maltego, veri noktaları arasındaki ilişkileri ve bağlantıları görselleştirerek ağ yapılarını ve sosyal ağları haritalamaya yardımcı olur.

<strong>3. Google Dorking nedir ve yasal mıdır?</strong>
Google Dorking, çevrimiçi olarak belirli bilgileri bulmak için gelişmiş arama operatörlerinin kullanılmasıdır. Yasal olsa da, özellikle yetkili hedeflerle sorumlu bir şekilde kullanılmalıdır.

<strong>4. Shodan özel ağları tarayabilir mi?</strong>
Hayır, Shodan yalnızca internete bakan cihazları tarar. Özel ağların veya güvenlik duvarlarının arkasındaki cihazlara erişemez.

<strong>5. Bu keşif araçlarını kullanmak için en iyi uygulamalar nelerdir?</strong>
En iyi uygulamalar, bu araçları yalnızca izinle kullanmayı, geniş aramalarla başlamayı ve hassas verilere doğrudan erişmekten kaçınmayı içerir.

<strong>6. Keşif için etik izin neden önemlidir?</strong>
Etik izin, yasal ve gizlilik standartlarına uyumu garanti eder ve siber güvenlik uzmanlarını yasal sonuçlardan korur.