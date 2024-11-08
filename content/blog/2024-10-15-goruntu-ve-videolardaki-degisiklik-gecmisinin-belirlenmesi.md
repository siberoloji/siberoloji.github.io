---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Açık Kaynak İstihbaratı (AKİ)
date: "2024-10-15T17:13:52Z"
guid: https://www.siberoloji.com/?p=3609
id: 3609
image: /assets/images/2024/10/osint.webp
tags:
- aki
- cyber security
- osint
- siber güvenlik
title: Görüntü ve Videolardaki Değişiklik Geçmişinin Belirlenmesi
url: /tr/goruntu-ve-videolardaki-degisiklik-gecmisinin-belirlenmesi/
---

  Dosyalardan OSINT meta verisi çıkarmak için görüntü ve videolardaki değişiklik geçmişini belirlemek, siber güvenlik uzmanları, araştırmacılar ve açık kaynaklı istihbarat (OSINT) ile ilgilenen herkes için önemli bir beceridir. Bu blog yazısı, dijital dosyalardaki meta verilerin önemini, bu verileri çıkarmak için kullanılabilen araçları ve bu bilgilerin çeşitli alanlardaki pratik uygulamalarını inceleyecektir. 
 

 
 ## Metaveriyi anlamak</h2>
<!-- /wp:heading -->

  <strong>Meta Veri Nedir?</strong> 
 

  Meta veriler genellikle "veriler hakkında veriler" olarak tanımlanır. Bir dosyanın içeriği, bağlamı ve yapısı hakkında bilgi sağlar. Görüntüler ve videolar için meta veriler şunları içerebilir: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Oluşturulma Tarihi:</strong> Dosyanın ilk oluşturulduğu tarih.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Değişiklik Tarihi:</strong> Dosyanın en son düzenlendiği tarih.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Dosya Türü:</strong> Dosyanın biçimi (örneğin JPEG, PNG, MP4).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yazar Bilgileri:</strong> Dosyanın yaratıcısı.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Konum Verileri:</strong> Görüntünün veya videonun çekildiği yerin GPS koordinatları.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Aygıt Bilgileri:</strong> Dosyayı oluşturmak için kullanılan aygıta ilişkin ayrıntılar.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Bu veriler, adli soruşturmalar, güvenlik değerlendirmeleri ve hatta hukuki konular da dahil olmak üzere çeşitli uygulamalar için kritik öneme sahip olabilir. 
 

  <strong>Meta Veri Neden Önemlidir?</strong> 
 

  Dijital ayak izlerinin bireyler ve kuruluşlar hakkında önemli içgörülere yol açabildiği bir çağda, meta verileri anlamak hayati önem taşır. Yalnızca dosya içeriğinden anlaşılamayabilecek hassas bilgileri ortaya çıkarabilir. Örneğin: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Gizlilik Riskleri:</strong> Görüntülerdeki GPS verileri kişisel konumlarınızı açığa çıkarabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Güvenlik Açıkları:</strong> Yazar adları ve kullanılan yazılımlar sosyal mühendislik saldırılarında kullanılabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Hukuki Sonuçlar:</strong> Fikri mülkiyetle ilgili hukuki uyuşmazlıklarda değişiklik tarihleri ​​kritik öneme sahip olabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Meta Veri Çıkarımı İçin Araçlar</h2>
<!-- /wp:heading -->

  Görüntülerden ve videolardan meta veri çıkarmak için çeşitli araçlar mevcuttur. İşte en etkili olanlardan bazıları: 
 

<!-- wp:heading {"level":3} -->
 ### 1. Exif Aracı</h3>
<!-- /wp:heading -->

  <strong>Genel Bakış:</strong> 
 

  ExifTool, çok çeşitli dosyalardaki meta verileri okuyan, yazan ve düzenleyen güçlü bir komut satırı uygulamasıdır. JPEG, TIFF, PNG, MP4 ve diğer birçok formatı destekler. 
 

  <strong>Kurulum:</strong> 
 

  ExifTool'u bir Linux sistemine kurmak için genellikle aşağıdaki komutu kullanabilirsiniz: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get install libimage-exiftool-perl</code></pre>
<!-- /wp:code -->

  <strong>Temel Kullanım:</strong> 
 

  Bir görüntü dosyasından tüm meta verileri çıkarmak için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">exiftool image.jpg</code></pre>
<!-- /wp:code -->

  GPS konumu veya oluşturulma tarihi gibi belirli etiketleri çıkarmak için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">exiftool -GPSPosition image.jpg
exiftool -CreateDate image.jpg</code></pre>
<!-- /wp:code -->

  Bir dizindeki tüm görselleri toplu olarak işlemek için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">exiftool -r /path/to/directory/</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. MetaLookup</h3>
<!-- /wp:heading -->

  <strong>Genel Bakış:</strong> 
 

  MetaLookup, resimler (PNG, JPEG), PDF'ler ve Office belgeleri dahil olmak üzere çeşitli dosya biçimlerinden meta verileri çıkaran bir diğer kullanışlı araçtır. 
 

  <strong>Kurulum:</strong> 
 

  Depoyu GitHub'dan kopyalayabilir ve pip kullanarak gerekli kütüphaneleri yükleyebilirsiniz: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">git clone https://github.com/JMousqueton/MetaLookup.git
cd MetaLookup
pip install -r requirements.txt</code></pre>
<!-- /wp:code -->

  <strong>Kullanım:</strong> 
 

  Tek bir dosyadan meta verileri çıkarmak için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">python Metalookup.py -f /path/to/file.jpg</code></pre>
<!-- /wp:code -->

  Bir dizindeki tüm dosyalardan meta verileri çıkarmak için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">python Metalookup.py -d /path/to/directory/</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 3. Metagoofil</h3>
<!-- /wp:heading -->

  <strong>Genel Bakış:</strong> 
 

  Metagoofil, web sitelerinde bulunan herkese açık belgelerden meta verileri çıkarmak için özel olarak tasarlanmıştır. Çeşitli belge türlerinden (PDF'ler, DOC'lar) kullanıcı adları ve e-posta adresleri gibi bilgileri toplayabilir. 
 

  <strong>Kurulum:</strong> 
 

  Metagoofil Kali Linux'a şu şekilde kurulabilir: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">apt-get install metagoofil</code></pre>
<!-- /wp:code -->

  <strong>Kullanım Örneği:</strong> 
 

  Belirli bir web sitesindeki belgelerden meta verileri çıkarmak için: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">metagoofil -d targetdomain.com -t pdf,xls -l 20 -n 10 -o output_directory</code></pre>
<!-- /wp:code -->

  Bu komut belirtilen etki alanındaki PDF ve Excel dosyalarını  arayacak ve ilgili meta verileri belirtilen dizine çıktı olarak gönderecektir. 
 

 
 ## Meta Veri Çıkarımının Pratik Uygulamaları</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Adli Soruşturmalar</h3>
<!-- /wp:heading -->

  Adli soruşturmalarda, meta veri çıkarmak dijital dosyalarla ilgili önemli kanıtlar sağlayabilir. Örneğin, kolluk kuvvetleri genellikle dijital fotoğrafları ne zaman çekildiklerini veya değiştirildiklerini belirlemek için analiz eder. Bu bilgi zaman çizelgeleri oluşturmaya veya mazeretleri doğrulamaya yardımcı olabilir. 
 

<!-- wp:heading {"level":3} -->
 ### 2. Siber Güvenlik Değerlendirmeleri</h3>
<!-- /wp:heading -->

  Siber güvenlik uzmanları, bir kuruluşun dijital varlıklarındaki olası güvenlik açıklarını belirlemek için meta veri çıkarma araçlarını kullanır. Belge özelliklerini veya görüntü verilerini analiz ederek, kötü niyetli aktörler tarafından istismar edilebilecek hassas bilgileri ortaya çıkarabilirler. 
 

<!-- wp:heading {"level":3} -->
 ### 3. Sosyal Mühendislik Saldırıları</h3>
<!-- /wp:heading -->

  Saldırganlar, hedefli sosyal mühendislik saldırıları oluşturmak için çıkarılan meta verileri kullanabilir. Örneğin, yukarıda belirtilenler gibi OSINT teknikleri aracılığıyla kullanıcı adları veya e-posta adresleri bulurlarsa, bu kişilere özel kimlik avı saldırıları deneyebilirler. 
 

<!-- wp:heading {"level":3} -->
 ### 4. Gizlilik Koruması</h3>
<!-- /wp:heading -->

  Gizlilikleri konusunda endişe duyan kişiler, dosyaları çevrimiçi olarak paylaşmadan önce dosyalarına yerleştirilen meta verilerin farkında olmalıdır. ExifTool veya MetaSmash gibi araçları kullanmak, kullanıcıların GPS koordinatları veya yazar bilgileri gibi hassas verileri kamuya açıklanmadan önce kaldırmasına olanak tanır. 
 

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  OSINT meta veri çıkarma yoluyla görüntü ve videolardaki değişiklik geçmişini belirlemek yalnızca teknik bir beceri değildir; siber güvenlik veya dijital adli bilimlerle ilgilenen herkes için olmazsa olmaz bir uygulamadır. ExifTool, MetaLookup ve Metagoofil gibi güçlü araçları kullanarak profesyoneller, güvenlik önlemlerini artıran veya soruşturmalar sırasında kritik kanıtlar sağlayan değerli içgörüler ortaya çıkarabilir. 
 

  Giderek dijitalleşen bir dünyada yol almaya devam ederken, meta verilerin nasıl yönetileceğini ve çıkarılacağını anlamak, gizliliği korumak ve çeşitli alanlarda güvenliği sürdürmek için daha da önemli hale gelecektir. İster siber güvenlik uzmanı olun, ister kişisel bilgilerinizi korumak isteyen bir birey olun, bu tekniklerde ustalaşmak, dijital varlığınız hakkında bilinçli kararlar almanızı sağlayacaktır. 
 

  Alıntılar:<br>[1] https://www.hackers-arise.com/post/2019/07/02/osint-part-5-collecting-metadata-with-metagoofil<br>[2] https://github.com/JMousqueton/MetaLookup<br>[3] https://www.youtube.com/watch?v=3ss4CPrt0WY<br>[4] https://aardwolfsecurity.com/metasmash-a-powerful-metadata-extraction-tool/<br>[5] https://viperone.gitbook.io/pentest-everything/everything/everything-osint/metadata-osint<br>[6] https://www.osintteam.com/using-exiftool-to-extract-metadata-from-image-files/<br>[7] https://osintteam.blog/osint-metadata-analiz-ce873026d077?gi=1d3944a8b2ed<br>[8] https://www.youtube.com/watch?v=WMIZBxJWvVc 
 