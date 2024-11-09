---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-05-13T12:37:00Z"
excerpt: |-
  Payload Grupları Nelerdir?

  Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız.
guid: https://www.siberoloji.com/?p=1141
id: 1141
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Payload Çeşitleri?
url: /tr/msf-icinde-payload-cesitleri/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="payload-grupları-nelerdir">Payload Grupları Nelerdir? 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız.
  

 
<h2 class="wp-block-heading" id="tekil-payloadlar-singles">Tekil payloadlar (Singles)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu tür payload modülleri, ihtiyaç duydukları bütün kodları ve işlemleri kendi bünyesinde barındırırlar. Çalışmak için herhangi bir yardımcıya ihtiyaç duymazlar. Örneğin, hedef sisteme bir kullanıcı ekleyen payload, işlemini yapar ve durur. Başka bir komut satırına vb. ihtiyaç duymaz.
  

<!-- wp:paragraph -->
<p>Tek başlarına bir program olduklarında netcat vb. programlar tarafından fark edilip yakalanabilirler.
  

<!-- wp:paragraph -->
<p>“windows/shell_bind_tcp” isimlendirmesine dikkat edelim. Windows için shell_bind_tcp tekil bir payload olarak çalışır. Bir sonraki bölümde farklı bir isimlendirme göreceğiz.
  

 
<h2 class="wp-block-heading" id="sahneleyiciler-stagers">Sahneleyiciler (Stagers)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sahneleyici payload modülleri, hedef bilgisayar ile yerel bilgisayar arasında ağ bağlantısı kuran kodlardır. Genellikle küçük kodlar barındırırlar. Çalışabilmek için bir sahneye ihtiyaç duyarlar. Metasploit Framework, en uygun olan payload modülünü kullanacak, başarılı olmaz ise daha az başarı vadeden payload otomatik olarak seçilecektir.
  

<!-- wp:paragraph -->
<p><code>windows/shell/bind_tcp</code>&nbsp;isimlendirmesine dikkat edelim. Burada&nbsp;<code>bind_tcp</code>&nbsp;sahneleyicidir ve bir sahneye ihtiyaç duyar. İşte bu isimlendirmede,&nbsp;<code>windows</code>&nbsp;ile&nbsp;<code>bind_tcp</code>&nbsp;arasında bulunan&nbsp;<code>shell</code>&nbsp;sahneyi ifade etmektedir.
  

 
<h2 class="wp-block-heading" id="sahneler-stages">Sahneler (Stages)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sahne olarak ifade ettiğimiz payload modül tipleri, sahneleyiciler tarafından kullanılırlar. Aracılık ettiklerinden&nbsp;<code>windows/shell/bind_tcp</code>&nbsp;isimlendirmesinde orta kısma yazılırlar. Herhangi bir boyut kısıtlamaları yoktur. Meterpreter, VNC Injection ve iPhone ‘ipwn’ Shell bunlara örnek olarak verilebilir.
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="payload-tipleri-nelerdir">Payload Tipleri Nelerdir? 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Yazının ilk bölümünde Payloadları 3 gruba ayırmıştık. Şimdi payloadları tiplerine göre inceleyelim.
  

 
<h2 class="wp-block-heading" id="inline-non-staged">Inline (Non Staged)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu tür payloadlar, ihtiyaç duydukları sahneyi (shell) de kendi içlerinde bulundurduklarından daha stabil çalışırlar. Boyutları bir miktar büyük olduklarında karşı tarafın farketmesi de daha kolay olmaktadır. Bazı Exploitler, kısıtlamalarından dolayı bu payloadları kullanamayabilirler.
  

 
<h2 class="wp-block-heading" id="staged">Staged
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sahneleyiciler, karşı taraftan aldığı bir bilgiyi yine karşı tarafta çalıştırmak istediğinde kendisine sağlanan sahneyi (stage) kullanır. Bu tip payloadlara Sahlenen (Staged) adı verilmektedir.
  

 
<h2 class="wp-block-heading" id="meterpreter">Meterpreter
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter, Meta-Interpreter ifadelerinin birleşiminden oluşan ismiyle tam anlamıyla bir komut satırı programıdır. dll enjeksiyonu aracılığıyla ve doğrudan RAM hafızasında çalışır. Hard Diskte hernagi bir kalıntı bırakmaz. Meterpreter üzerinden kod çalıştırmak veya iptal etmek, çok kullanışlıdır.
  

 
<h2 class="wp-block-heading" id="passivex">PassiveX
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PassiveX olarak ifade edilen payload tipleri firewall atlatmak için kullanılırlar. ActiveX kullanarak gizli bir Internet Explorer prosesi oluştururlar. Bu tür payload tipleri hedef bilgisayar ile haberleşmek için HTTP istek ve cevaplarını kullanır.
  

 
<h2 class="wp-block-heading" id="nonx">NoNX
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>NX (No eXecute) bit adı verilen kısıtlı alanlar, işlemcinin belli hafıza alanlarına müdahale etmesini yasaklamakta kullanılır. Eğer bir program RAM hafızanın kısıtlı alanına müdahale etmek isterse, bu istek işlemci tarafından yerine getirilmez ve bu davranış DEP (Data Execution Prevention) sistemi tarafından engellenir. İşte NoNX payload tipleri bu kısıtlamayı aşmak için kullanılırlar.
  

 
<h2 class="wp-block-heading" id="ord">Ord
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Ordinal payload modülleri, Windows içinde çalışırlar ve neredeyse tüm Windows sürümlerinde çalışabilecek tarzda basittirler. Neredeyse tüm sürümlerde çalışabilir olmalarına rağmen, bu tip payloadların çalışması için bir ön gereklilik bulunmaktadır. Sistemde ws2_32.dll önceden yüklü bulunmalıdır. Ayrıca çok kararlı değildirler.
  

 
<h2 class="wp-block-heading" id="ipv6">IPv6
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu tip payload modülleri IPv6 ağ haberleşmesi için kullanılmak üzere tasarlanmışlardır.
  

 
<h2 class="wp-block-heading" id="reflective-dll-injection">Reflective DLL injection
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu tür payload modülleri, hedef sistemin hafızasına yerleşirler. Hard Diske dokunmazlar ve VNC, Meterpreter gibi payload tiplerinin çalışmasına yardım ederler.
  

 
<h2 class="wp-block-heading" id="video-anlatım">Video Anlatım
<!-- /wp:heading -->