---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Siber Güvenlik
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-03-31T13:53:00Z"
excerpt: Bu yazımızda, bir çoğumuzun duyduğu ancak kullanmadığı açık/kapalı anahtar
  şifreleme yöntemini açıklamaya çalıştık. Nasıl yapılır dokümanı olmadığını baştan
  belirtelim. Sadece çalışma mantığını anlatmaya çalışıyoruz.
guid: https://www.siberoloji.com/?p=1024
id: 1024
image: /assets/images/2024/06/cyber4.jpg
tags:
- açık anahtar şifreleme
title: Açık anahtar şifreleme (Public Key Cryptography) nedir?
url: /tr/acik-anahtar-sifreleme-public-key-cryptography-nedir/
---

  Bu yazımızda, bir çoğumuzun duyduğu ancak kullanmadığı açık/kapalı anahtar şifreleme yöntemini açıklamaya çalıştık. Nasıl yapılır dokümanı olmadığını baştan belirtelim. Sadece çalışma mantığını anlatmaya çalışıyoruz. 
 

<!-- wp:heading {"level":1} -->
# GİRİŞ: 
<!-- /wp:heading -->

  Bu yöntem, “simetrik şifreleme yöntemi” olarak bilinen ve şifreleme ile şifre çözmenin aynı anahtar parola ile yapılması metodundan farklıdır. 
 

  Açık anahtar şifreleme metodunda, şifre sahibinin 2 adet anahtarı vardır. Bunlara açık anahtar ve özel anahtar adı verilir. 
 

 
 ## 1.Açık anahtar:</h2>
<!-- /wp:heading -->

  Özel anahtarın benzeri bir anahtardır ancak herkese dağıtılır. İster dosya sunucuları ile ister keyserver (anahtar sunucusu) görevi yapan sunucular aracılığı ile herkese verilir. Anlamı şudur; "Bana şifreli bir mesaj göndermek isterseniz bu açık anahtarı kullanabilirsiniz! Çünkü sizin şifreleme için kullandığınız bana ait açık anahtarın şifresini sadece bende bulunan Özel Anahtar açabilir. 
 

 
 ## 2.Özel Anahtar:</h2>
<!-- /wp:heading -->

  Sadece sahibinde bulunur. Sayısal imza, şifreleme ve şifre çözme işlemlerinde kullanılır. Kimse ile paylaşılmaz. Paylaşılır ise hemen yeni bir özel anahtar üretilir ve önceden yayınlanmış açık anahtar iptal edilir. 
 

<!-- wp:heading {"level":1} -->
# SONUÇ: 
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Mesajın Şifrelenmesi:</h3>
<!-- /wp:heading -->

  Güvenli mesajı göndermek isteyen, alıcının açık anahtarı ile şifreleme yapar ve gönderir. O mesaj sadece alıcının özel anahtarı ile açılabilir. 
 

<!-- wp:heading {"level":3} -->
 ### Mesajın İmzalanması:</h3>
<!-- /wp:heading -->

  Güvenli mesajın gerçekten gönderen kişiden geldiğini ispat etmek için GÖNDERİCİ açık anahtar ile ŞİFRELEDİĞİ mesajı&nbsp;kendi&nbsp;ÖZEL ANAHTARI ile İMZALAR. 
 

  Bu tür mesaj alışverişi yapan tarafların her birisinde alıcının açık anahtarının kayıtlı olduğu bir cüzdan bulunur. 
 

<!-- wp:heading {"level":3} -->
 ### Kullanmak İsterseniz, Aşamalar:</h3>
<!-- /wp:heading -->

  Bu işlemleri yapmak için;<br>Thunderbird posta programınıza Enigmail eklentisi kurmalısınız. 
 

  Enigmail eklentisinin çalışması için Thunderbird Programı İngilizce kullanılmalıdır.<br>Enigmail eklentisinin çalışması için gpg veya gpg2 kurmalısınız. 
 

  Tüm bunlardan sonra Thunderbird içerisinden Enigmail&gt;Kurulum sihirbazı ile kendi özel ve açık anahtarı oluşturmalısınız.<br>Açık anahtarı insanlara yayınlamalısınız. Bunun için açık anahtarı Export seçeneği ile bir dosyaya aktarıp (pub key)&nbsp;<a href="http://keyserver.pgp.com/">keyserver.pgp.com</a>&nbsp;adresi vb. Anahtar sunuculara yükleyebilirsiniz.<br>Posta göndermek için karşı tarafın da açık anahtarına sahip olmalısınız. 
 

  Başlangıçta alışık olmadığınızdan biraz karışık gelebilir ancak bir miktar zaman ayırıp üzerinde çalışırsanız oldukça güvenli bir posta iletişimi sağlayabilirsiniz. 
 