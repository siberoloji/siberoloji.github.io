---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-02T14:03:00Z"
excerpt: Linux kullanıcılarının büyük bir kısmı, düzenli olarak güvenlik güncellemelerini
  yükler ve en yeni sürümü kullanırlar. Bildiğimiz kadarıyla, hassas ve dikkatlidirler.
  Fakat bu hassasiyet ve dikkat tek başına yeterli olmayabilir. Güvenli, kuralları
  her kullanıcıya eşit olarak uygulanan bir parola politikanız yoksa güvenlik güncellemelerini
  yüklemek tek başına yeterli olmayabilir.
guid: https://www.siberoloji.com/?p=1028
id: 1028
image: /assets/images/2024/06/cyber8.jpg
tags:
- parola politikası
title: Linux İçin Parola Politikaları
url: /tr/linux-icin-parola-politikalari/
---

  Linux kullanıcılarının büyük bir kısmı, düzenli olarak güvenlik güncellemelerini yükler ve en yeni sürümü kullanırlar. Bildiğimiz kadarıyla, hassas ve dikkatlidirler. Fakat bu hassasiyet ve dikkat tek başına yeterli olmayabilir. Güvenli, kuralları her kullanıcıya eşit olarak uygulanan bir parola&nbsp;politikanız yoksa güvenlik güncellemelerini yüklemek tek başına yeterli olmayabilir. 
 

  Linux dağıtımlarının bir çoğu, kurulum esnasında kullanıcıyı rahatsız etmeyecek kuralların bulunduğu politikaları varsayılan olarak seçerler. Parolanın&nbsp;değiştirilme zorunluluğu, kaç gün arayla değiştirilmesi gerektiği veya kaç gün değiştirilmez ise hesabın kilitleneceği gibi kuralları sonradan belirlemek gerekir. &nbsp; 
 

  Bu tür ayarları yapmak isterseniz,&nbsp;<strong>chage</strong>&nbsp;olarak adlandırılan bir komutu kullanmalısınız. Kullanımı kolay ve basit olan bu komut, seçeceğiniz parola politikalarının oluşturulmasında size çok yardım olacaktır. Yardım (help) ve Kılavuz (man) sayfalarından seçenekleri ve yapabileceklerinizi görmeniz mümkün. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">chage --help
man chage</code></pre>
<!-- /wp:code -->

  Komut satırından alttaki komutu çalıştırırsanız, istediğiniz&nbsp;kullanıcının parola&nbsp;kurallarını görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># siberoloji kısmını, kendi kullanıcı adınız ile değiştirin

$ chage -l siberoloji

Last password change : May 04, 2015
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
$ _</code></pre>
<!-- /wp:code -->

  Üstteki raporda görüldüğü gibi kullanıcının parolası, asla&nbsp;zaman aşımına uğramayacak, pasif hale gelmeyecek, hesap pasif hale gelmeyecek ve parolanın&nbsp;değişiminin üzerinden 99999 gün geçmeden yeni parola belirleme zorunluluğu ortaya çıkmayacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chage -M 90 siberoloji</code></pre>
<!-- /wp:code -->

  Bu komut, belirttiğiniz kullanıcının, en son parola&nbsp;değişiminden itibaren 90 gün sonra parolasını&nbsp;değiştirmek zorunda olduğunu kural olarak belirlemenizi sağlar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chage -m 5 -M 90 -I 30 -W 14 siberoloji</code></pre>
<!-- /wp:code -->

  Komut içerisinde kullanılan seçenekleri tek tek açıklayalım. 
 

  (<em>-m 5</em>)&nbsp;seçeneği ile, bir parola&nbsp;değiştirildikten sonra yeniden değiştirilmesi için, en az 5 günün geçmesi gerektiği belirlenmiştir. 
 

  (<em>-M 90</em>)&nbsp;seçeneği&nbsp;sayesinde, parola&nbsp;değişiminden itibaren 90 gün geçtiğinde, kullanıcı mecburen parolasını&nbsp;değiştirmek zorunda bırakılmıştır. 
 

  (<em>-I 30</em>) kullanıcı,&nbsp;en son oturum açtığından itibaren 30 gün oturum açmamış ise, hesabın pasif hale geçirilmesi kural olarak belirlenmiştir. Tatile çıkıyorsanız veya&nbsp;uzun süre bilgisayarınızdan uzak kalacaksanız dikkatli kullanmanızı öneriyoruz.&nbsp; 
 

  (<em>-W 14</em>)&nbsp;seçeneği, kullanıcıya parolasının&nbsp;zamanının dolmasına 14 gün kaldığından itibaren uyarı ile ikaz edilmesini sağlayacaktır. 
 

  Daha güvenli bir şekilde bilgisayar kullanımına devam etmek için işe kendinizden başlayın ve kendi kullanıcı parola&nbsp;politikalarınızı biraz sıkılaştırmayı&nbsp;deneyin. Bir süre garip gelse de, inanın insan kullandığı sistemi daha güvenli hissediyor. 
 