---
layout: post
title: Açık anahtar şifreleme (Public Key Cryptography) nedir?
date: 2016-04-01 02:02:02.000000000 +03:00
type: post
author: siberoloji
img: cyber4.jpg
published: true
status: publish
categories:
- Araştırma
tags:
- açık anahtar şifreleme
- enigmail
- public key cryptography
- thunderbird enigmail

---
<p class="western">Bu yazımızda, bir çoğumuzun duyduğu ancak kullanmadığı açık/kapalı anahtar şifreleme yöntemini açıklamaya çalıştık. Nasıl yapılır dokümanı olmadığını baştan belirtelim. Sadece çalışma mantığını anlatmaya çalışıyoruz.</p>
<h1 class="western">GİRİŞ:</h1>
<p class="western">Bu yöntem, “simetrik şifreleme yöntemi” olarak bilinen ve şifreleme ile şifre çözmenin aynı anahtar parola ile yapılması metodundan farklıdır.</p>
<p class="western">Açık anahtar şifreleme metodunda, şifre sahibinin 2 adet anahtarı vardır. Bunlara açık anahtar ve özel anahtar adı verilir.</p>
<h2 class="western">1.Açık anahtar:</h2>
<p class="western">Özel anahtarın benzeri bir anahtardır ancak herkese dağıtılır. İster dosya sunucuları ile ister keyserver (anahtar sunucusu) görevi yapan sunucular aracılığı ile herkese verilir. Anlamı şudur; "Bana şifreli bir mesaj göndermek isterseniz bu açık anahtarı kullanabilirsiniz! Çünkü sizin şifreleme için kullandığınız bana ait açık anahtarın şifresini sadece bende bulunan Özel Anahtar açabilir.</p>
<h2 class="western">2.Özel Anahtar:</h2>
<p class="western">Sadece sahibinde bulunur. Sayısal imza, şifreleme ve şifre çözme işlemlerinde kullanılır. Kimse ile paylaşılmaz. Paylaşılır ise hemen yeni bir özel anahtar üretilir ve önceden yayınlanmış açık anahtar iptal edilir.</p>
<h1 class="western">SONUÇ:</h1>
<h3 class="western">Mesajın Şifrelenmesi:</h3>
<p class="western">Güvenli mesajı göndermek isteyen, alıcının açık anahtarı ile şifreleme yapar ve gönderir. O mesaj sadece alıcının özel anahtarı ile açılabilir.</p>
<h3 class="western">Mesajın İmzalanması:</h3>
<p class="western">Güvenli mesajın gerçekten gönderen kişiden geldiğini ispat etmek için GÖNDERİCİ açık anahtar ile ŞİFRELEDİĞİ mesajı <u>kendi</u> ÖZEL ANAHTARI ile İMZALAR.</p>
<p>Bu tür mesaj alışverişi yapan tarafların her birisinde alıcının açık anahtarının kayıtlı olduğu bir cüzdan bulunur.</p>
<h3>Kullanmak İsterseniz, Aşamalar:</h3>
<p>Bu işlemleri yapmak için;<br />
Thunderbird posta programınıza Enigmail eklentisi kurmalısınız.</p>
<p class="western">Enigmail eklentisinin çalışması için Thunderbird Programı İngilizce kullanılmalıdır.<br />
Enigmail eklentisinin çalışması için gpg veya gpg2 kurmalısınız.</p>
<p class="western">Tüm bunlardan sonra Thunderbird içerisinden Enigmail&gt;Kurulum sihirbazı ile kendi özel ve açık anahtarı oluşturmalısınız.<br />
Açık anahtarı insanlara yayınlamalısınız. Bunun için açık anahtarı Export seçeneği ile bir dosyaya aktarıp (pub key) keyserver.pgp.com adresi vb. Anahtar sunuculara yükleyebilirsiniz.<br />
Posta göndermek için karşı tarafın da açık anahtarına sahip olmalısınız.</p>
<p>Başlangıçta alışık olmadığınızdan biraz karışık gelebilir ancak bir miktar zaman ayırıp üzerinde çalışırsanız oldukça güvenli bir posta iletişimi sağlayabilirsiniz.</p>
