---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Nasıl Yapılır
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-12-16T01:56:00Z"
excerpt: Sistem güncellemeleriyle yüklenen yeni kernel dosyalarıyla birlikte eski
  dosyalarınızda /boot klasöründe tutulmaya devam eder. Bir süre sonra dosyaların
  çokluğundan veya boyutundan dolayı sisteminizi açarken "kernel panic" hatası almaya
  başlayabilirsiniz. Aşağıda vereceğim birkaç komut ile sisteminizde gerekli bakım
  ve temizlik işlemini yapmanız mümkün.
guid: https://www.siberoloji.com/?p=1116
id: 1116
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux nasıl
title: Eski Kernel Dosyalarını Temizleme
url: /tr/eski-kernel-dosyalarini-temizleme/
---

 <p>Sistem güncellemeleriyle yüklenen yeni kernel dosyalarıyla birlikte eski dosyalarınızda /boot klasöründe tutulmaya devam eder. Bir süre sonra dosyaların çokluğundan veya boyutundan dolayı sisteminizi açarken "kernel panic" hatası almaya başlayabilirsiniz. Aşağıda vereceğim birkaç komut ile sisteminizde gerekli bakım ve temizlik işlemini yapmanız mümkün.
 

 
 ## 1.Adım: Açık Sistemde Hangi Kernel Sürümü Kullanımda?
<!-- /wp:heading -->

 <p>Öncelikle şu an açık olan sisteminizde hangi kernelin kullanıldığını öğrenelim. Bunun için aşağıdaki komutu kullanmalısınız.
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">uname -a
Linux portlinux-X550JX 4.4.0-53-generic #74-Ubuntu SMP Fri Dec 2 15:59:10 UTC 2016 
x86_64 x86_64 x86_64 GNU/Linux</pre>
<!-- /wp:preformatted -->

 <p>Komut sonucunda elde ettiğimiz çıktıya göre sistemimiz&nbsp;4.4.0-53-generic&nbsp;&nbsp;sürümünü kullanıyor.
 

 
 ## 2.Adım: Sistemimizde Kaç Tane Eski Kernel Sürümü Var?
<!-- /wp:heading -->

 <p>Sistemde halen yüklü bulunan eski kernel dosyalarını görüntülemek için aşağıdaki komutu kullanıyoruz.
 

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

 <p>Bu çıktılara göre, sistemde 4.4.0-***21*** ,&nbsp;4.4.0-***31*** ,&nbsp;4.4.0-***34*** ,&nbsp;4.4.0-***38*** ,&nbsp;4.4.0-***42*** ,&nbsp;4.4.0-***43*** ,&nbsp;***4.4.0-53*** &nbsp;sürümleri bulunuyor.
 

 
 ## 3.Adım: Hangi Dosyalar Kaldırılabilir?
<!-- /wp:heading -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Yukarıda kırmızı ile yazılı sürüm, halen sistemin kullandığı sürüm olduğundan kesinlikle ***kaldırılmamalıdır*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Halen kullanılan sürüm ile ilgili bir hata olduğunda, hatayı düzeltebilmek için bilgisayarınızı eski kernel dosyası ile açmak gerekebilir. Bu yüzden, en yeni sürümden önce çalıştığını bildiğiniz önceki 2 sürümü (4.4.0-***42*** , 4.4.0-***43*** ) ***kaldırmamanızı***  tavsiye ediyorum. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bu durumda (4.4.0-***21*** , 4.4.0-***31*** , 4.4.0-***34*** , 4.4.0-***38*** ) sürümlerinin tamamını veya istediklerinizi ***kaldırabilirsiniz*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## 4. Adım: Eski&nbsp;Kernel Sürümlerini Sistemden Kaldırma Nasıl Yapılır?
<!-- /wp:heading -->

 <p>Aşağıda görmüş olduğunuz&nbsp;sudo apt purge linux-image-&nbsp; ifadesinden sonra, sisteminizden kaldırmak istediğiniz sürüm numarasını, 2.Adımda elde ettiğiniz çıktıdan kontrol ederek girin. Biz bu örnekte4.4.0-***21&nbsp;*** sürümünü kaldırıyoruz. Enter tuşuna bastığınızda apt size kaldırılacak paketleri gösterecektir. Acele etmeden kontrol edin ve Evet seçeneği ile devam edin. İşlem bir miktar uzun sürdüğü için takıldığı düşüncesine kapılmayın. Bekleyin, tamamlanacaktır.
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo apt purge&nbsp;linux-image-4.4.0-21-generic
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
<!-- /wp:heading -->

 <p>Sistemde bulunan kernel sürümlerini tekrar kontrol edelim. Aşağıda gördüğünüz gibi&nbsp;linux-image-4.4.0-21-generic&nbsp;&nbsp;artık sistemde görünmüyor.
 

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
<!-- /wp:heading -->

 <p>Gerçekleştirdiğimiz kaldırma işleminden sonra, kaldırılan kernel sürümünün GRUB başlatıcıda bulunan İleri Düzey Seçenekler listesinden de kaldırılması için GRUB güncellemesi yapalım.
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo update-grub2</pre>
<!-- /wp:preformatted -->

 <p>Yukarıda anlatılan adımları, kaldırmak istediğiniz diğer sürümler için de uygulayabilirsiniz.
 