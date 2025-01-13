---
draft: false

title:  'Eski Kernel Dosyalarını Temizleme'
date: '2016-12-16T01:56:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Sistem güncellemeleriyle yüklenen yeni kernel dosyalarıyla birlikte eski dosyalarınızda /boot klasöründe tutulmaya devam eder. Bir süre sonra dosyaların çokluğundan veya boyutundan dolayı sisteminizi açarken "kernel panic" hatası almaya başlayabilirsiniz. Aşağıda vereceğim birkaç komut ile sisteminizde gerekli bakım ve temizlik işlemini yapmanız mümkün.' 
 
url:  /tr/eski-kernel-dosyalarini-temizleme/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---
Sistem güncellemeleriyle yüklenen yeni kernel dosyalarıyla birlikte eski dosyalarınızda /boot klasöründe tutulmaya devam eder. Bir süre sonra dosyaların çokluğundan veya boyutundan dolayı sisteminizi açarken "kernel panic" hatası almaya başlayabilirsiniz. Aşağıda vereceğim birkaç komut ile sisteminizde gerekli bakım ve temizlik işlemini yapmanız mümkün.

## 1.Adım: Açık Sistemde Hangi Kernel Sürümü Kullanımda?

Öncelikle şu an açık olan sisteminizde hangi kernelin kullanıldığını öğrenelim. Bunun için aşağıdaki komutu kullanmalısınız.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">uname -a
Linux portlinux-X550JX 4.4.0-53-generic #74-Ubuntu SMP Fri Dec 2 15:59:10 UTC 2016 
x86_64 x86_64 x86_64 GNU/Linux</pre>
<!-- /wp:preformatted -->
Komut sonucunda elde ettiğimiz çıktıya göre sistemimiz 4.4.0-53-generic  sürümünü kullanıyor.

## 2.Adım: Sistemimizde Kaç Tane Eski Kernel Sürümü Var?

Sistemde halen yüklü bulunan eski kernel dosyalarını görüntülemek için aşağıdaki komutu kullanıyoruz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">dpkg --get-selections | grep linux-image-

linux-image-4.4.0-21-generic install
linux-image-4.4.0-31-generic install
linux-image-4.4.0-34-generic install
linux-image-4.4.0-38-generic install
linux-image-4.4.0-42-generic install
linux-image-4.4.0-43-generic install
linux-image-4.4.0-53-generic install
linux-image-extra-4.4.0-21-generic install
linux-image-extra-4.4.0-31-generic install
linux-image-extra-4.4.0-34-generic install
linux-image-extra-4.4.0-42-generic install
linux-image-extra-4.4.0-43-generic install
linux-image-extra-4.4.0-53-generic install</pre>
<!-- /wp:preformatted -->
Bu çıktılara göre, sistemde 4.4.0-**21**, 4.4.0-**31**, 4.4.0-**34**, 4.4.0-**38**, 4.4.0-**42**, 4.4.0-**43**, **4.4.0-53** sürümleri bulunuyor.

## 3.Adım: Hangi Dosyalar Kaldırılabilir?
* 
* Yukarıda kırmızı ile yazılı sürüm, halen sistemin kullandığı sürüm olduğundan kesinlikle **kaldırılmamalıdır**.

* Halen kullanılan sürüm ile ilgili bir hata olduğunda, hatayı düzeltebilmek için bilgisayarınızı eski kernel dosyası ile açmak gerekebilir. Bu yüzden, en yeni sürümden önce çalıştığını bildiğiniz önceki 2 sürümü (4.4.0-**42**, 4.4.0-**43**) **kaldırmamanızı** tavsiye ediyorum.

* Bu durumda (4.4.0-**21**, 4.4.0-**31**, 4.4.0-**34**, 4.4.0-**38**) sürümlerinin tamamını veya istediklerinizi **kaldırabilirsiniz**.
## 4. Adım: Eski Kernel Sürümlerini Sistemden Kaldırma Nasıl Yapılır?

Aşağıda görmüş olduğunuz sudo apt purge linux-image-  ifadesinden sonra, sisteminizden kaldırmak istediğiniz sürüm numarasını, 2.Adımda elde ettiğiniz çıktıdan kontrol ederek girin. Biz bu örnekte4.4.0-**21 **sürümünü kaldırıyoruz. Enter tuşuna bastığınızda apt size kaldırılacak paketleri gösterecektir. Acele etmeden kontrol edin ve Evet seçeneği ile devam edin. İşlem bir miktar uzun sürdüğü için takıldığı düşüncesine kapılmayın. Bekleyin, tamamlanacaktır.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo apt purge linux-image-4.4.0-21-generic
Reading package lists... Done
Building dependency tree 
Reading state information... Done
The following packages will be REMOVED:
 linux-image-4.4.0-21-generic* linux-image-extra-4.4.0-21-generic* linux-kernel-generic*
0 upgraded, 0 newly installed, 3 to remove and 0 not upgraded.
After this operation, 217 MB disk space will be freed.
Do you want to continue? [Y/n] 
Reading database ... 496426 files and directories currently installed.)
Removing linux-kernel-generic (4.4.0-21) ...
Removing linux-image-extra-4.4.0-21-generic (4.4.0-21.37) ...
...
Progress: [ 28%] [#############################.........................................]</pre>
<!-- /wp:preformatted -->
## 5.Adım: Son İşlemler

Sistemde bulunan kernel sürümlerini tekrar kontrol edelim. Aşağıda gördüğünüz gibi linux-image-4.4.0-21-generic  artık sistemde görünmüyor.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">dpkg --get-selections | grep linux-image-

linux-image-4.4.0-31-generic install
linux-image-4.4.0-34-generic install
linux-image-4.4.0-38-generic install
linux-image-4.4.0-42-generic install
linux-image-4.4.0-43-generic install
linux-image-4.4.0-53-generic install
linux-image-extra-4.4.0-31-generic install
linux-image-extra-4.4.0-34-generic install
linux-image-extra-4.4.0-42-generic install
linux-image-extra-4.4.0-43-generic install
linux-image-extra-4.4.0-53-generic install</pre>
<!-- /wp:preformatted -->
## 6.Adım: GRUB Başlatıcıyı Güncelleme

Gerçekleştirdiğimiz kaldırma işleminden sonra, kaldırılan kernel sürümünün GRUB başlatıcıda bulunan İleri Düzey Seçenekler listesinden de kaldırılması için GRUB güncellemesi yapalım.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo update-grub2</pre>
<!-- /wp:preformatted -->
Yukarıda anlatılan adımları, kaldırmak istediğiniz diğer sürümler için de uygulayabilirsiniz.
