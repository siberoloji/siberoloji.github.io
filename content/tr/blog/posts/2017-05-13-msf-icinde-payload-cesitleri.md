---
draft: false

title:  'MSF İçinde Payload Çeşitleri?'
date: '2017-05-13T12:37:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Payload Grupları Nelerdir? 
Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız." 
 
url:  /tr/msf-icinde-payload-cesitleri/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Payload Grupları Nelerdir?



Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız.



## Tekil payloadlar (Singles)



Bu tür payload modülleri, ihtiyaç duydukları bütün kodları ve işlemleri kendi bünyesinde barındırırlar. Çalışmak için herhangi bir yardımcıya ihtiyaç duymazlar. Örneğin, hedef sisteme bir kullanıcı ekleyen payload, işlemini yapar ve durur. Başka bir komut satırına vb. ihtiyaç duymaz.



Tek başlarına bir program olduklarında netcat vb. programlar tarafından fark edilip yakalanabilirler.



“windows/shell_bind_tcp” isimlendirmesine dikkat edelim. Windows için shell_bind_tcp tekil bir payload olarak çalışır. Bir sonraki bölümde farklı bir isimlendirme göreceğiz.



## Sahneleyiciler (Stagers)



Sahneleyici payload modülleri, hedef bilgisayar ile yerel bilgisayar arasında ağ bağlantısı kuran kodlardır. Genellikle küçük kodlar barındırırlar. Çalışabilmek için bir sahneye ihtiyaç duyarlar. Metasploit Framework, en uygun olan payload modülünü kullanacak, başarılı olmaz ise daha az başarı vadeden payload otomatik olarak seçilecektir.



`windows/shell/bind_tcp` isimlendirmesine dikkat edelim. Burada `bind_tcp` sahneleyicidir ve bir sahneye ihtiyaç duyar. İşte bu isimlendirmede, `windows` ile `bind_tcp` arasında bulunan `shell` sahneyi ifade etmektedir.



## Sahneler (Stages)



Sahne olarak ifade ettiğimiz payload modül tipleri, sahneleyiciler tarafından kullanılırlar. Aracılık ettiklerinden `windows/shell/bind_tcp` isimlendirmesinde orta kısma yazılırlar. Herhangi bir boyut kısıtlamaları yoktur. Meterpreter, VNC Injection ve iPhone ‘ipwn’ Shell bunlara örnek olarak verilebilir.



## Payload Tipleri Nelerdir?



Yazının ilk bölümünde Payloadları 3 gruba ayırmıştık. Şimdi payloadları tiplerine göre inceleyelim.



## Inline (Non Staged)



Bu tür payloadlar, ihtiyaç duydukları sahneyi (shell) de kendi içlerinde bulundurduklarından daha stabil çalışırlar. Boyutları bir miktar büyük olduklarında karşı tarafın farketmesi de daha kolay olmaktadır. Bazı Exploitler, kısıtlamalarından dolayı bu payloadları kullanamayabilirler.



## Staged



Sahneleyiciler, karşı taraftan aldığı bir bilgiyi yine karşı tarafta çalıştırmak istediğinde kendisine sağlanan sahneyi (stage) kullanır. Bu tip payloadlara Sahlenen (Staged) adı verilmektedir.



## Meterpreter



Meterpreter, Meta-Interpreter ifadelerinin birleşiminden oluşan ismiyle tam anlamıyla bir komut satırı programıdır. dll enjeksiyonu aracılığıyla ve doğrudan RAM hafızasında çalışır. Hard Diskte hernagi bir kalıntı bırakmaz. Meterpreter üzerinden kod çalıştırmak veya iptal etmek, çok kullanışlıdır.



## PassiveX



PassiveX olarak ifade edilen payload tipleri firewall atlatmak için kullanılırlar. ActiveX kullanarak gizli bir Internet Explorer prosesi oluştururlar. Bu tür payload tipleri hedef bilgisayar ile haberleşmek için HTTP istek ve cevaplarını kullanır.



## NoNX



NX (No eXecute) bit adı verilen kısıtlı alanlar, işlemcinin belli hafıza alanlarına müdahale etmesini yasaklamakta kullanılır. Eğer bir program RAM hafızanın kısıtlı alanına müdahale etmek isterse, bu istek işlemci tarafından yerine getirilmez ve bu davranış DEP (Data Execution Prevention) sistemi tarafından engellenir. İşte NoNX payload tipleri bu kısıtlamayı aşmak için kullanılırlar.



## Ord



Ordinal payload modülleri, Windows içinde çalışırlar ve neredeyse tüm Windows sürümlerinde çalışabilecek tarzda basittirler. Neredeyse tüm sürümlerde çalışabilir olmalarına rağmen, bu tip payloadların çalışması için bir ön gereklilik bulunmaktadır. Sistemde ws2_32.dll önceden yüklü bulunmalıdır. Ayrıca çok kararlı değildirler.



## IPv6



Bu tip payload modülleri IPv6 ağ haberleşmesi için kullanılmak üzere tasarlanmışlardır.



## Reflective DLL injection



Bu tür payload modülleri, hedef sistemin hafızasına yerleşirler. Hard Diske dokunmazlar ve VNC, Meterpreter gibi payload tiplerinin çalışmasına yardım ederler.



## Video Anlatım
