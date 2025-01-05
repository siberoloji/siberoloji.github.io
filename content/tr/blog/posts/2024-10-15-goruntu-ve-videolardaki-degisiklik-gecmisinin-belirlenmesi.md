---
draft: false

title:  'Görüntü ve Videolardaki Değişiklik Geçmişinin Belirlenmesi'
date: '2024-10-15T17:13:52+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/goruntu-ve-videolardaki-degisiklik-gecmisinin-belirlenmesi/
featured_image: /images/osint.webp
categories:
    - 'Açık Kaynak İstihbaratı (AKİ)'
tags:
    - aki
    - 'cyber security'
    - osint
    - 'siber güvenlik'
---


Dosyalardan OSINT meta verisi çıkarmak için görüntü ve videolardaki değişiklik geçmişini belirlemek, siber güvenlik uzmanları, araştırmacılar ve açık kaynaklı istihbarat (OSINT) ile ilgilenen herkes için önemli bir beceridir. Bu blog yazısı, dijital dosyalardaki meta verilerin önemini, bu verileri çıkarmak için kullanılabilen araçları ve bu bilgilerin çeşitli alanlardaki pratik uygulamalarını inceleyecektir.



## Metaveriyi anlamak



**Meta Veri Nedir?**



Meta veriler genellikle "veriler hakkında veriler" olarak tanımlanır. Bir dosyanın içeriği, bağlamı ve yapısı hakkında bilgi sağlar. Görüntüler ve videolar için meta veriler şunları içerebilir:


* **Oluşturulma Tarihi:** Dosyanın ilk oluşturulduğu tarih.

* **Değişiklik Tarihi:** Dosyanın en son düzenlendiği tarih.

* **Dosya Türü:** Dosyanın biçimi (örneğin JPEG, PNG, MP4).

* **Yazar Bilgileri:** Dosyanın yaratıcısı.

* **Konum Verileri:** Görüntünün veya videonun çekildiği yerin GPS koordinatları.

* **Aygıt Bilgileri:** Dosyayı oluşturmak için kullanılan aygıta ilişkin ayrıntılar.




Bu veriler, adli soruşturmalar, güvenlik değerlendirmeleri ve hatta hukuki konular da dahil olmak üzere çeşitli uygulamalar için kritik öneme sahip olabilir.



**Meta Veri Neden Önemlidir?**



Dijital ayak izlerinin bireyler ve kuruluşlar hakkında önemli içgörülere yol açabildiği bir çağda, meta verileri anlamak hayati önem taşır. Yalnızca dosya içeriğinden anlaşılamayabilecek hassas bilgileri ortaya çıkarabilir. Örneğin:


* **Gizlilik Riskleri:** Görüntülerdeki GPS verileri kişisel konumlarınızı açığa çıkarabilir.

* **Güvenlik Açıkları:** Yazar adları ve kullanılan yazılımlar sosyal mühendislik saldırılarında kullanılabilir.

* **Hukuki Sonuçlar:** Fikri mülkiyetle ilgili hukuki uyuşmazlıklarda değişiklik tarihleri ​​kritik öneme sahip olabilir.




## Meta Veri Çıkarımı İçin Araçlar



Görüntülerden ve videolardan meta veri çıkarmak için çeşitli araçlar mevcuttur. İşte en etkili olanlardan bazıları:



1. Exif Aracı



**Genel Bakış:**



ExifTool, çok çeşitli dosyalardaki meta verileri okuyan, yazan ve düzenleyen güçlü bir komut satırı uygulamasıdır. JPEG, TIFF, PNG, MP4 ve diğer birçok formatı destekler.



**Kurulum:**



ExifTool'u bir Linux sistemine kurmak için genellikle aşağıdaki komutu kullanabilirsiniz:


```bash
sudo apt-get install libimage-exiftool-perl
```



**Temel Kullanım:**



Bir görüntü dosyasından tüm meta verileri çıkarmak için:


```bash
exiftool image.jpg```



GPS konumu veya oluşturulma tarihi gibi belirli etiketleri çıkarmak için:


```bash
exiftool -GPSPosition image.jpg
exiftool -CreateDate image.jpg```



Bir dizindeki tüm görselleri toplu olarak işlemek için:


```bash
exiftool -r /path/to/directory/```



2. MetaLookup



**Genel Bakış:**



MetaLookup, resimler (PNG, JPEG), PDF'ler ve Office belgeleri dahil olmak üzere çeşitli dosya biçimlerinden meta verileri çıkaran bir diğer kullanışlı araçtır.



**Kurulum:**



Depoyu GitHub'dan kopyalayabilir ve pip kullanarak gerekli kütüphaneleri yükleyebilirsiniz:


```bash
git clone https://github.com/JMousqueton/MetaLookup.git
cd MetaLookup
pip install -r requirements.txt```



**Kullanım:**



Tek bir dosyadan meta verileri çıkarmak için:


```bash
python Metalookup.py -f /path/to/file.jpg```



Bir dizindeki tüm dosyalardan meta verileri çıkarmak için:


```bash
python Metalookup.py -d /path/to/directory/```



3. Metagoofil



**Genel Bakış:**



Metagoofil, web sitelerinde bulunan herkese açık belgelerden meta verileri çıkarmak için özel olarak tasarlanmıştır. Çeşitli belge türlerinden (PDF'ler, DOC'lar) kullanıcı adları ve e-posta adresleri gibi bilgileri toplayabilir.



**Kurulum:**



Metagoofil Kali Linux'a şu şekilde kurulabilir:


```bash
apt-get install metagoofil
```



**Kullanım Örneği:**



Belirli bir web sitesindeki belgelerden meta verileri çıkarmak için:


```bash
metagoofil -d targetdomain.com -t pdf,xls -l 20 -n 10 -o output_directory
```



Bu komut belirtilen etki alanındaki PDF ve Excel dosyalarını  arayacak ve ilgili meta verileri belirtilen dizine çıktı olarak gönderecektir.



## Meta Veri Çıkarımının Pratik Uygulamaları



1. Adli Soruşturmalar



Adli soruşturmalarda, meta veri çıkarmak dijital dosyalarla ilgili önemli kanıtlar sağlayabilir. Örneğin, kolluk kuvvetleri genellikle dijital fotoğrafları ne zaman çekildiklerini veya değiştirildiklerini belirlemek için analiz eder. Bu bilgi zaman çizelgeleri oluşturmaya veya mazeretleri doğrulamaya yardımcı olabilir.



2. Siber Güvenlik Değerlendirmeleri



Siber güvenlik uzmanları, bir kuruluşun dijital varlıklarındaki olası güvenlik açıklarını belirlemek için meta veri çıkarma araçlarını kullanır. Belge özelliklerini veya görüntü verilerini analiz ederek, kötü niyetli aktörler tarafından istismar edilebilecek hassas bilgileri ortaya çıkarabilirler.



3. Sosyal Mühendislik Saldırıları



Saldırganlar, hedefli sosyal mühendislik saldırıları oluşturmak için çıkarılan meta verileri kullanabilir. Örneğin, yukarıda belirtilenler gibi OSINT teknikleri aracılığıyla kullanıcı adları veya e-posta adresleri bulurlarsa, bu kişilere özel kimlik avı saldırıları deneyebilirler.



4. Gizlilik Koruması



Gizlilikleri konusunda endişe duyan kişiler, dosyaları çevrimiçi olarak paylaşmadan önce dosyalarına yerleştirilen meta verilerin farkında olmalıdır. ExifTool veya MetaSmash gibi araçları kullanmak, kullanıcıların GPS koordinatları veya yazar bilgileri gibi hassas verileri kamuya açıklanmadan önce kaldırmasına olanak tanır.



## Sonuç



OSINT meta veri çıkarma yoluyla görüntü ve videolardaki değişiklik geçmişini belirlemek yalnızca teknik bir beceri değildir; siber güvenlik veya dijital adli bilimlerle ilgilenen herkes için olmazsa olmaz bir uygulamadır. ExifTool, MetaLookup ve Metagoofil gibi güçlü araçları kullanarak profesyoneller, güvenlik önlemlerini artıran veya soruşturmalar sırasında kritik kanıtlar sağlayan değerli içgörüler ortaya çıkarabilir.



Giderek dijitalleşen bir dünyada yol almaya devam ederken, meta verilerin nasıl yönetileceğini ve çıkarılacağını anlamak, gizliliği korumak ve çeşitli alanlarda güvenliği sürdürmek için daha da önemli hale gelecektir. İster siber güvenlik uzmanı olun, ister kişisel bilgilerinizi korumak isteyen bir birey olun, bu tekniklerde ustalaşmak, dijital varlığınız hakkında bilinçli kararlar almanızı sağlayacaktır.



Alıntılar: [1] https://www.hackers-arise.com/post/2019/07/02/osint-part-5-collecting-metadata-with-metagoofil [2] https://github.com/JMousqueton/MetaLookup [3] https://www.youtube.com/watch?v=3ss4CPrt0WY [4] https://aardwolfsecurity.com/metasmash-a-powerful-metadata-extraction-tool/ [5] https://viperone.gitbook.io/pentest-everything/everything/everything-osint/metadata-osint [6] https://www.osintteam.com/using-exiftool-to-extract-metadata-from-image-files/ [7] https://osintteam.blog/osint-metadata-analiz-ce873026d077?gi=1d3944a8b2ed [8] https://www.youtube.com/watch?v=WMIZBxJWvVc
