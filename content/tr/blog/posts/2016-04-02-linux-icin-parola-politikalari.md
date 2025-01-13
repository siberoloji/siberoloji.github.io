---
draft: false

title:  'Linux İçin Parola Politikaları'
date: '2016-04-02T14:03:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Linux kullanıcılarının büyük bir kısmı, düzenli olarak güvenlik güncellemelerini yükler ve en yeni sürümü kullanırlar. Bildiğimiz kadarıyla, hassas ve dikkatlidirler. Fakat bu hassasiyet ve dikkat tek başına yeterli olmayabilir. Güvenli, kuralları her kullanıcıya eşit olarak uygulanan bir parola\_politikanız yoksa güvenlik güncellemelerini yüklemek tek başına yeterli olmayabilir." 
 
url:  /tr/linux-icin-parola-politikalari/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Temel Linux'
tags:
    - 'parola politikası'
---
Linux kullanıcılarının büyük bir kısmı, düzenli olarak güvenlik güncellemelerini yükler ve en yeni sürümü kullanırlar. Bildiğimiz kadarıyla, hassas ve dikkatlidirler. Fakat bu hassasiyet ve dikkat tek başına yeterli olmayabilir. Güvenli, kuralları her kullanıcıya eşit olarak uygulanan bir parola politikanız yoksa güvenlik güncellemelerini yüklemek tek başına yeterli olmayabilir.

Linux dağıtımlarının bir çoğu, kurulum esnasında kullanıcıyı rahatsız etmeyecek kuralların bulunduğu politikaları varsayılan olarak seçerler. Parolanın değiştirilme zorunluluğu, kaç gün arayla değiştirilmesi gerektiği veya kaç gün değiştirilmez ise hesabın kilitleneceği gibi kuralları sonradan belirlemek gerekir.  

Bu tür ayarları yapmak isterseniz, **chage** olarak adlandırılan bir komutu kullanmalısınız. Kullanımı kolay ve basit olan bu komut, seçeceğiniz parola politikalarının oluşturulmasında size çok yardım olacaktır. Yardım (help) ve Kılavuz (man) sayfalarından seçenekleri ve yapabileceklerinizi görmeniz mümkün.
```bash
chage --help
man chage```

Komut satırından alttaki komutu çalıştırırsanız, istediğiniz kullanıcının parola kurallarını görebilirsiniz.
```bash
# siberoloji kısmını, kendi kullanıcı adınız ile değiştirin

$ chage -l siberoloji

Last password change : May 04, 2015
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
$ _```

Üstteki raporda görüldüğü gibi kullanıcının parolası, asla zaman aşımına uğramayacak, pasif hale gelmeyecek, hesap pasif hale gelmeyecek ve parolanın değişiminin üzerinden 99999 gün geçmeden yeni parola belirleme zorunluluğu ortaya çıkmayacaktır.
```bash
sudo chage -M 90 siberoloji```

Bu komut, belirttiğiniz kullanıcının, en son parola değişiminden itibaren 90 gün sonra parolasını değiştirmek zorunda olduğunu kural olarak belirlemenizi sağlar.
```bash
sudo chage -m 5 -M 90 -I 30 -W 14 siberoloji```

Komut içerisinde kullanılan seçenekleri tek tek açıklayalım.

(-m 5) seçeneği ile, bir parola değiştirildikten sonra yeniden değiştirilmesi için, en az 5 günün geçmesi gerektiği belirlenmiştir.

(-M 90) seçeneği sayesinde, parola değişiminden itibaren 90 gün geçtiğinde, kullanıcı mecburen parolasını değiştirmek zorunda bırakılmıştır.

(-I 30) kullanıcı, en son oturum açtığından itibaren 30 gün oturum açmamış ise, hesabın pasif hale geçirilmesi kural olarak belirlenmiştir. Tatile çıkıyorsanız veya uzun süre bilgisayarınızdan uzak kalacaksanız dikkatli kullanmanızı öneriyoruz. 

(-W 14) seçeneği, kullanıcıya parolasının zamanının dolmasına 14 gün kaldığından itibaren uyarı ile ikaz edilmesini sağlayacaktır.

Daha güvenli bir şekilde bilgisayar kullanımına devam etmek için işe kendinizden başlayın ve kendi kullanıcı parola politikalarınızı biraz sıkılaştırmayı deneyin. Bir süre garip gelse de, inanın insan kullandığı sistemi daha güvenli hissediyor.
