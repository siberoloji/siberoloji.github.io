---
layout: post
title: Linux İçin Parola Politikaları
date: 2016-04-02 08:46:10.000000000 +03:00
type: post
img: cyber8.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
tags:
- güvenlik ve parola
- linux şifre politikaları
- parola politikaları
- şifre politikaları

---
<p><span style="font-weight: 400;">Linux kullanıcılarının büyük bir kısmı, düzenli olarak güvenlik güncellemelerini yükler ve en yeni sürümü kullanırlar. Bildiğimiz kadarıyla, hassas ve dikkatlidirler. Fakat bu hassasiyet ve dikkat tek başına yeterli olmayabilir. Güvenli, kuralları her kullanıcıya eşit olarak uygulanan bir parola politikanız yoksa güvenlik güncellemelerini yüklemek tek başına yeterli olmayabilir.</span></p>
<p><span style="font-weight: 400;">Linux dağıtımlarının bir çoğu, kurulum esnasında kullanıcıyı rahatsız etmeyecek kuralların bulunduğu politikaları varsayılan olarak seçerler. Parolanın değiştirilme zorunluluğu, kaç gün arayla değiştirilmesi gerektiği veya kaç gün değiştirilmez ise hesabın kilitleneceği gibi kuralları sonradan belirlemek gerekir.  </span></p>
<p><span style="font-weight: 400;">Bu tür ayarları yapmak isterseniz, </span><b>chage</b><span style="font-weight: 400;"> olarak adlandırılan bir komutu kullanmalısınız. Kullanımı kolay ve basit olan bu komut, seçeceğiniz parola politikalarının oluşturulmasında size çok yardım olacaktır. Yardım (help) ve Kılavuz (man) sayfalarından seçenekleri ve yapabileceklerinizi görmeniz mümkün.</span></p>
<pre class="lang:default decode:true " title="chage Yardımı ve Kullanım Kılavuzunu görüntülemek için">chage --help
man chage</pre>
<p><span style="font-weight: 400;">Komut satırından alttaki komutu çalıştırırsanız, istediğiniz kullanıcının parola kurallarını görebilirsiniz.</span></p>
<pre class="lang:default decode:true" title="Kullanıcının mevcut şifre kurallarını görmek için"># siberoloji kısmını, kendi kullanıcı adınız ile değiştirin

$ chage -l siberoloji

Last password change : May 04, 2015
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
$ _</pre>
<p><span style="font-weight: 400;">Üstteki raporda görüldüğü gibi kullanıcının parolası, asla zaman aşımına uğramayacak, pasif hale gelmeyecek, hesap pasif hale gelmeyecek ve parolanın değişiminin üzerinden 99999 gün geçmeden yeni parola belirleme zorunluluğu ortaya çıkmayacaktır.</span></p>
<pre class="lang:default decode:true " title="Örnek-1:">sudo chage -M 90 siberoloji</pre>
<p>Bu komut, belirttiğiniz kullanıcının, en son parola değişiminden itibaren 90 gün sonra parolasını değiştirmek zorunda olduğunu kural olarak belirlemenizi sağlar.</p>
<pre class="lang:default decode:true " title="Örnek-2:">sudo chage -m 5 -M 90 -I 30 -W 14 siberoloji</pre>
<p>Komut içerisinde kullanılan seçenekleri tek tek açıklayalım.</p>
<p><span style="font-weight: 400;">(<em>-m 5</em>)</span><span style="font-weight: 400;"> seçeneği ile, bir parola değiştirildikten sonra yeniden değiştirilmesi için, en az 5 günün geçmesi gerektiği belirlenmiştir.</span></p>
<p><span style="font-weight: 400;">(<em>-M 90</em>)</span><span style="font-weight: 400;"> seçeneği sayesinde, parola değişiminden itibaren 90 gün geçtiğinde, kullanıcı mecburen parolasını değiştirmek zorunda bırakılmıştır.</span></p>
<p><span style="font-weight: 400;">(<em>-I 30</em>) kullanıcı, </span><span style="font-weight: 400;">en son oturum açtığından itibaren 30 gün oturum açmamış ise, hesabın pasif hale geçirilmesi kural olarak belirlenmiştir. Tatile çıkıyorsanız veya uzun süre bilgisayarınızdan uzak kalacaksanız dikkatli kullanmanızı öneriyoruz. </span></p>
<p><span style="font-weight: 400;">(<em>-W 14</em>)</span><span style="font-weight: 400;"> seçeneği, kullanıcıya parolasının zamanının dolmasına 14 gün kaldığından itibaren uyarı ile ikaz edilmesini sağlayacaktır.</span></p>
<p>Daha güvenli bir şekilde bilgisayar kullanımına devam etmek için işe kendinizden başlayın ve kendi kullanıcı parola politikalarınızı biraz sıkılaştırmayı deneyin. Bir süre garip gelse de, inanın insan kullandığı sistemi daha güvenli hissediyor.</p>
