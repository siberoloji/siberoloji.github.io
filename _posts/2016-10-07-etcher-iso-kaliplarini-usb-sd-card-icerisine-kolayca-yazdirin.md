---
layout: post
title: Etcher, ISO Kalıplarını USB ve SD Card İçerisine Kolayca Yazdırın
date: 2016-10-07 07:07:09.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
tags:
- etcher
- Etcher SD Card oluşturucu
- etcher USB oluşturucu
- iot
- SD Card içine ISO yazdırma
- USB içine ISO yazdırma
author: siberoloji
---
<p>Bir Linux dağıtımını kurmak veya diğer işletim sistemlerinden Linux a geçmek isteyenlerin ilk başarmaları gereken adımın, kendilerine bir kurulum USB veya CD si oluşturmak olduğunu hepimiz biliyoruz. Bunu başarıyla tamamlamak için, her işletim sistemi ve her dağıtım için farklı yöntemler izlemek gerekiyor. Bazıları Rufus tavsiye eder, bazıları kendisinin sürekli kullandığı başka bir program. Bu yazımızda Kurulum medyası oluşturmak için geliştirilen Etcher Programından bahsedeceğiz.</p>
<p>Etcher, AppImage formatında dağıtılan ve çalışması için gerekli tüm bağımlılıkları kendi içerisinde barındıran bir program. Kısacası dağıtım ayırt etmiyor. Linux, Mac ve Windows ile çalışabiliyor. Özellikle Raspberry Pi vb. cihazlar için SD Card içerisine kurulum medyası oluşturmada kullanılabilecek bir program. Öne çıkan özelliklerinden bir tanesi de yanlışlıkla diskin başka bir bölümüne yazma ihtimalinizin olmayışı. Bildiğiniz gibi, Komut satırından USB oluşturuyorsanız, yanlış bir disk adı yazmanız durumunda diskinizde bulunan bilgilerin silinme ihtimali bulunuyor.</p>
<p>Etcher, ilk çalışmada varsayılan olarak sadece harici cihazlara yazmaya ayarlanmış durumda. Bu sebeple sistem bölümlerine zarar verme ihtimali bulunmuyor. Ancak isterseniz ayarlar bölümünden "Dangerous Mode" seçeneğini işaretleyerek diskinizin istediğiniz herhangi bir bölümüne de yazma yetkisini açabilirsiniz.</p>
<p>Aşağıda bir kaç basit adımda kurulum ve kullanım anlatılmıştır.</p>
<h2>1.Adım: Etcher İndirme, Çalıştırma</h2>
<p>Etcher programı resmi <a href="https://www.etcher.io/" target="_blank">web sayfasından</a> indirebilirsiniz. İndirme bağlantısından bilgisayar mimarinize uygun seçeneği işaretleyin ve AppImage dosyasını indirin. Aşağıda, bu yazının hazırlandığı tarihteki en yeni sürümü indirme wget komutuyla yapılmıştır. Sizin indirme dosyanız ve komutlarda gireceğiniz dosya adı indirme tarihine göre değişiklik gösterebilir. Burada indirme Ev klasörüne yapılıyor.</p>
<pre class="lang:sh decode:true ">cd
wget https://resin-production-downloads.s3.amazonaws.com/etcher/1.0.0-beta.15/Etcher-linux-x64.AppImage
chmod a+x Etcher-linux-x64.AppImage
sudo ./Etcher-linux-x64.AppImage</pre>
<h2>2.Adım: ISO Dosyası ve Yazdırılacak Medya Seçimi</h2>
<p>Program çalıştığında ekrana gelecek GUI görsel ara yüzünden adımları takip ederek gerekli seçimleri yaparak USB /SD Card cihazınızı hazırlayabilirsiniz.</p>
<p><img class="alignnone wp-image-16110 size-full" src="{{ site.baseurl }}/assets/etcher1.png" alt="etcher1" width="800" height="380" /><img class="wp-image-16109 size-full alignnone" src="{{ site.baseurl }}/assets/etcher2.png" alt="etcher2" width="800" height="380" /></p>
<h2>3.Adım: Yazdırmanın Tamamlanması</h2>
<p>Yazdırma işlemi tamamlandığında program size işlemin tamamlandığını haber verecektir.</p>
<p><img class="alignnone wp-image-16113 size-full" src="{{ site.baseurl }}/assets/etcher3.png" alt="etcher3" width="815" height="344" /></p>
<h2>NOT:</h2>
<p>Etcher programın çalışması için fuse programı gerekmektedir. Bu program çoğu dağıtımda zaten yüklü durumdadır. Yine de yüklemeniz gerekirse;</p>
<p>Ubuntu için;</p>
<pre class="lang:sh decode:true ">sudo apt install fuse</pre>
<p>CentOS içinde root yetkisiyle;</p>
<pre class="lang:sh decode:true ">yum install fuse</pre>
<p>&nbsp;</p>
