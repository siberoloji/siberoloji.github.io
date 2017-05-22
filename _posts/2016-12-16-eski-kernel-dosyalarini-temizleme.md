---
layout: post
title: Eski Kernel Dosyalarını Temizleme
date: 2016-12-16 22:15:36.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- eski kernel temizleme
- kernel kaldırma
- linux eski kernel sürümü kaldırma
author: siberoloji
---
<p>Sistem güncellemeleriyle yüklenen yeni kernel dosyalarıyla birlikte eski dosyalarınızda /boot klasöründe tutulmaya devam eder. Bir süre sonra dosyaların çokluğundan veya boyutundan dolayı sisteminizi açarken "kernel panic" hatası almaya başlayabilirsiniz. Aşağıda vereceğim birkaç komut ile sisteminizde gerekli bakım ve temizlik işlemini yapmanız mümkün.</p>
<h2>1.Adım: Açık Sistemde Hangi Kernel Sürümü Kullanımda?</h2>
<p>Öncelikle şu an açık olan sisteminizde hangi kernelin kullanıldığını öğrenelim. Bunun için aşağıdaki komutu kullanmalısınız.</p>
<pre class="lang:sh decode:true">uname -a
Linux portlinux-X550JX 4.4.0-53-generic #74-Ubuntu SMP Fri Dec 2 15:59:10 UTC 2016 
x86_64 x86_64 x86_64 GNU/Linux</pre>
<p>Komut sonucunda elde ettiğimiz çıktıya göre sistemimiz <span class="lang:sh decode:true crayon-inline ">4.4.0-53-generic</span>  sürümünü kullanıyor.</p>
<h2>2.Adım: Sistemimizde Kaç Tane Eski Kernel Sürümü Var?</h2>
<p>Sistemde halen yüklü bulunan eski kernel dosyalarını görüntülemek için aşağıdaki komutu kullanıyoruz.</p>
<pre class="lang:sh decode:true bbcode_code ">dpkg --get-selections | grep linux-image-

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
<p>Bu çıktılara göre, sistemde 4.4.0-<strong>21</strong>, 4.4.0-<strong>31</strong>, 4.4.0-<strong>34</strong>, 4.4.0-<strong>38</strong>, 4.4.0-<strong>42</strong>, 4.4.0-<strong>43</strong>, <strong><span style="color: #ff0000;">4.4.0-53</span></strong> sürümleri bulunuyor.</p>
<h2>3.Adım: Hangi Dosyalar Kaldırılabilir?</h2>
<ul>
<li>Yukarıda kırmızı ile yazılı sürüm, halen sistemin kullandığı sürüm olduğundan kesinlikle <strong>kaldırılmamalıdır</strong>.</li>
<li>Halen kullanılan sürüm ile ilgili bir hata olduğunda, hatayı düzeltebilmek için bilgisayarınızı eski kernel dosyası ile açmak gerekebilir. Bu yüzden, en yeni sürümden önce çalıştığını bildiğiniz önceki 2 sürümü (4.4.0-<strong>42</strong>, 4.4.0-<strong>43</strong>) <strong>kaldırmamanızı</strong> tavsiye ediyorum.</li>
<li>Bu durumda (4.4.0-<strong>21</strong>, 4.4.0-<strong>31</strong>, 4.4.0-<strong>34</strong>, 4.4.0-<strong>38</strong>) sürümlerinin tamamını veya istediklerinizi <strong>kaldırabilirsiniz</strong>.</li>
</ul>
<h2>4. Adım: Eski Kernel Sürümlerini Sistemden Kaldırma Nasıl Yapılır?</h2>
<p>Aşağıda görmüş olduğunuz <span class="lang:sh decode:true crayon-inline ">sudo apt purge linux-image-</span>  ifadesinden sonra, sisteminizden kaldırmak istediğiniz sürüm numarasını, 2.Adımda elde ettiğiniz çıktıdan kontrol ederek girin. Biz bu örnekte4.4.0-<strong>21 </strong>sürümünü kaldırıyoruz. Enter tuşuna bastığınızda apt size kaldırılacak paketleri gösterecektir. Acele etmeden kontrol edin ve Evet seçeneği ile devam edin. İşlem bir miktar uzun sürdüğü için takıldığı düşüncesine kapılmayın. Bekleyin, tamamlanacaktır.</p>
<pre class="lang:sh decode:true bbcode_code">sudo apt purge linux-image-4.4.0-21-generic
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
<h2>5.Adım: Son İşlemler</h2>
<p>Sistemde bulunan kernel sürümlerini tekrar kontrol edelim. Aşağıda gördüğünüz gibi <span class="lang:sh decode:true crayon-inline ">linux-image-4.4.0-21-generic </span> artık sistemde görünmüyor.</p>
<pre class="lang:sh decode:true bbcode_code">dpkg --get-selections | grep linux-image-

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
<h2>6.Adım: GRUB Başlatıcıyı Güncelleme</h2>
<p>Gerçekleştirdiğimiz kaldırma işleminden sonra, kaldırılan kernel sürümünün GRUB başlatıcıda bulunan İleri Düzey Seçenekler listesinden de kaldırılması için GRUB güncellemesi yapalım.</p>
<pre class="lang:sh decode:true ">sudo update-grub2</pre>
<p>Yukarıda anlatılan adımları, kaldırmak istediğiniz diğer sürümler için de uygulayabilirsiniz.</p>
<p>Gerçekleştirdiğiniz uygulama ve bu yazı ile ilgili görüşlerinizi Yorum bölümünden bize iletebilirsiniz.</p>
