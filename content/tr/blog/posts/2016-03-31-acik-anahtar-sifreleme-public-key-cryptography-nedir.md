---
draft: false

title:  'Açık anahtar şifreleme (Public Key Cryptography) nedir?'
date: '2016-03-31T13:53:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, bir çoğumuzun duyduğu ancak kullanmadığı açık/kapalı anahtar şifreleme yöntemini açıklamaya çalıştık. Nasıl yapılır dokümanı olmadığını baştan belirtelim. Sadece çalışma mantığını anlatmaya çalışıyoruz.' 
 
url:  /tr/acik-anahtar-sifreleme-public-key-cryptography-nedir/
 
featured_image: /images/cyber4.jpg
categories:
    - 'Siber Güvenlik'
tags:
    - 'açık anahtar şifreleme'
---


Bu yazımızda, bir çoğumuzun duyduğu ancak kullanmadığı açık/kapalı anahtar şifreleme yöntemini açıklamaya çalıştık. Nasıl yapılır dokümanı olmadığını baştan belirtelim. Sadece çalışma mantığını anlatmaya çalışıyoruz.



# GİRİŞ:



Bu yöntem, “simetrik şifreleme yöntemi” olarak bilinen ve şifreleme ile şifre çözmenin aynı anahtar parola ile yapılması metodundan farklıdır.



Açık anahtar şifreleme metodunda, şifre sahibinin 2 adet anahtarı vardır. Bunlara açık anahtar ve özel anahtar adı verilir.



## 1.Açık anahtar:



Özel anahtarın benzeri bir anahtardır ancak herkese dağıtılır. İster dosya sunucuları ile ister keyserver (anahtar sunucusu) görevi yapan sunucular aracılığı ile herkese verilir. Anlamı şudur; "Bana şifreli bir mesaj göndermek isterseniz bu açık anahtarı kullanabilirsiniz! Çünkü sizin şifreleme için kullandığınız bana ait açık anahtarın şifresini sadece bende bulunan Özel Anahtar açabilir.



## 2.Özel Anahtar:



Sadece sahibinde bulunur. Sayısal imza, şifreleme ve şifre çözme işlemlerinde kullanılır. Kimse ile paylaşılmaz. Paylaşılır ise hemen yeni bir özel anahtar üretilir ve önceden yayınlanmış açık anahtar iptal edilir.



# SONUÇ:



Mesajın Şifrelenmesi:



Güvenli mesajı göndermek isteyen, alıcının açık anahtarı ile şifreleme yapar ve gönderir. O mesaj sadece alıcının özel anahtarı ile açılabilir.



Mesajın İmzalanması:



Güvenli mesajın gerçekten gönderen kişiden geldiğini ispat etmek için GÖNDERİCİ açık anahtar ile ŞİFRELEDİĞİ mesajı kendi ÖZEL ANAHTARI ile İMZALAR.



Bu tür mesaj alışverişi yapan tarafların her birisinde alıcının açık anahtarının kayıtlı olduğu bir cüzdan bulunur.



Kullanmak İsterseniz, Aşamalar:



Bu işlemleri yapmak için; Thunderbird posta programınıza Enigmail eklentisi kurmalısınız.



Enigmail eklentisinin çalışması için Thunderbird Programı İngilizce kullanılmalıdır. Enigmail eklentisinin çalışması için gpg veya gpg2 kurmalısınız.



Tüm bunlardan sonra Thunderbird içerisinden Enigmail&gt;Kurulum sihirbazı ile kendi özel ve açık anahtarı oluşturmalısınız. Açık anahtarı insanlara yayınlamalısınız. Bunun için açık anahtarı Export seçeneği ile bir dosyaya aktarıp (pub key) <a href="http://keyserver.pgp.com/">keyserver.pgp.com</a> adresi vb. Anahtar sunuculara yükleyebilirsiniz. Posta göndermek için karşı tarafın da açık anahtarına sahip olmalısınız.



Başlangıçta alışık olmadığınızdan biraz karışık gelebilir ancak bir miktar zaman ayırıp üzerinde çalışırsanız oldukça güvenli bir posta iletişimi sağlayabilirsiniz.
