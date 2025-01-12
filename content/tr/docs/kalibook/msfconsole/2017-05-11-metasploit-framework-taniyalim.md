---
draft: false
title: Metasploit Framework Tanıyalım
date: 2017-05-11T02:13:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework’ü etkin ve tam kapasiteli kullanabilmek için ihtiyaç duyabileceğiniz temel bilgilere ve komutlara birlikte bakalım.
url: /tr/metasploit-framework-taniyalim/
translationKey: metasploit-framework-basics
featured_image: /images/metasploit.jpg
weight: 20
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---


Metasploit Framework’ü etkin ve tam kapasiteli kullanabilmek için ihtiyaç duyabileceğiniz temel bilgilere ve komutlara birlikte bakalım istedim. Acele edip hızlı gitmektense, önce işimizi kolaylaştıracak temel bilgileri görelim.

## Mimari ve Kütüphaneler

![MSF Hiyerarşisi](/images/msfarch.png)

Metasploit, kısaca yukarıda gördüğünüz mimari diyagramında gösterilen elemanlardan oluşmaktadır. Bu temel elemanları kısaca tanıyalım

## Rex

Metasploit için en temel başlangıç kütüphanesidir. Soket, protokol, SSL, SMB, HTTP, XOR, Base64, Unicode işlemlerinin yapıldığı merkezdir.

## Msf::Core

Rex kütüphanesi üzerine bina edilen Core katmanı, dışarıdan modül ve eklentilerin de eklenmesini sağlayan ayarların yönetildiği kısımdır. Temel API sağlar. Çerçeve dediğimiz Framework burasıdır.

## Msf::Base

Bu katman, temel API lerin daha da basitleştirildiği kısımdır.

## Msf::GUI

Kullanıcının gördüğü kısımdır. Arayüz ve komutların girişinin yapıldığı kısımlar burada bulunur.

## Dosya sistemi

![MSF Dosyaları](/images/msffile.png)

MSF dosya sistemi, kullanıcının işini kolaylaştıracak şekilde oluşturulmuştur ve klasörler anlamlıdır. Bir programı kullanacaksanız, dosya sistemini ve hangi klasörde neyin bulunduğunu bilmek başlangıç için çok önemlidir. Linux işletim sisteminize Metasploit Framework yazılımını, dağıtımınızın yazılım merkezi aracılığı ile yüklemiş iseniz gerekli klasörleri `/usr/share` içerisinde bulabilirsin. Debian paketi olarak indirip yüklediyseniz `/opt/metasploit-framework/` klasörü içerisinde bulabilirsiniz.

Bazı ana klasörlerin hangi bilgileri ihtiva ettiğine bakalım.

* `data`: Metasploit tarafından kullanılan ve değiştirilebilir dosyalar bu klasördedir.

* `documentation`: MSF hakkında yardım ve açıklama dokümanları bulunur

* `external`: Kaynak kodlar ve 3. taraf kütüphaneleri bu klasördedir.

* `lib`: MSF kullandığı ana kütüphaneler bulunur.

* `modules`: MSF yüklendiğinde indeksinde bulunan modüller bu klasördedir.

* `plugins`: Program başlarken yüklenecek eklentiler buradadır.

* `scripts`: Meterpreter ve diğer script kodları bulunur.

* `tools`: Çeşitli komut satırı araçları bulunur.

## Modüller ve Yerleri

## Modüller

Metasploit Framework, modüllerden oluşturulmuştur. Bu modüller kısaca nelerdir?

**Payload**: Karşı sistemde çalışmak üzere tasarlanan script kodlarına Payload adı verilmektedir.

**Exploits**: Payload kullanan modüllere exploit adı verilmektedir.

**Auxiliary**: Payload kullanmayan modüllere Auxiliary modülleri adı verilir.

**Encoders**: Payload scriptlerinin karşı tarafa gitmesini, ulaştırılmasını sağlayan modüllerdir.

**Nops**: Payload scriptlerinin sürekli ve sağlıklı çalışmasını sağlayan modüllerdir.

## Modüller Nerededir?

Temel modüller ve kullanıcı modülleri olarak ikiye ayırabileceğimiz modüllerin hangi klasörde bulunduğuna bakalım.

### Temel Modüller

MSF her yüklendiğinde kurulup hazır hale gelen modüller, yukarıda belirttiğimiz `/usr/share/metasploit-framework/modules/` klasöründe veya `/opt/metasploit-framework/modules/` içerisinde bulunurlar. Windows kullanıcıları da Program Files klasörü içerisine bakabilirler.

### Kullanıcı Modülleri

Metasploit’in kullanıcıya tanıdığı en büyük imkan, kendi modülünü çerçeveye dahil edebilmesidir. Bir script yazdınız veya indirdiniz kullanmak istiyorsunuz. Bu kodlara kullanıcı modülleri denir ve kullanıcının ev klasörünün içerisinde başında nokta olan gizli bir klasörde tutulurlar. Tam olarak adresi `~/.msf4/modules/` bu şekildedir. `~` Ev klasörü anlamına gelmektedir. Klasörü dosya yöneticisinde görmek için “Gizli Dosyaları Göster” seçeneğini aktif hale getirebilirsiniz.

### Kullanıcı modüllerini sisteme tanıtma

MSF, kullanıcıya başlarken veya başladıktan sonra kendi ilave modüllerini yükleme imkanı sunar. Bunun başlarken ve başladıktan sonra nasıl yapıldığını görelim.

Aşağıda anlatılan iki yöntemde de komutlara vereceğiniz klasör adreslerinin içerisinde, msf isimlendirme konvansiyonuna uygun klasörler bulunmalıdır. Örneğin, `~/.msf4/modules/` klasöründen bir exploit yüklemek isterseniz, o exploitin `~/.msf4/modules/exploit/` klasöründe bulunuyor olması gerekir.

Tam olarak klasörlerin isimlerini ve isimlendirme şablonunun programınızın kurulu olduğu klasör içerisinden öğrenebilirsiniz. Benim bilgisayarım için örnek çıktı aşağıdaki klasör yapısındadır.

```bash
umut@umut-X550JX /opt/metasploit-framework/embedded/framework/modules $ ls -l
total 24
drwxr-xr-x 20 root root 4096 May 10 14:46 auxiliary
drwxr-xr-x 11 root root 4096 May 10 14:46 encoders
drwxr-xr-x 19 root root 4096 May 10 14:46 exploits
drwxr-xr-x 10 root root 4096 May 10 14:46 nops
drwxr-xr-x  5 root root 4096 May 10 14:46 payloads
drwxr-xr-x 12 root root 4096 May 10 14:46 post
```

####  Başlarken kullanıcı modüllerini yükleme

Yukarıda belirttiğimiz gibi kullanıcı modülleri `~/.msf4/modules/` klasöründeydi. Bu klasörü `msfconsole` komutuna söylediğimizde, ilave modüllerde yüklenir ve sistem öyle başlar. Bunu aşağıdaki komutta görüldüğü gibi `-m` parametresi ile yapabiliriz.

```bash
umut@umut-X550JX ~ $ msfconsole -m ~/.msf4/modules/
Found a database at /home/umut/.msf4/db, checking to see **if **it is started
Starting database at /home/umut/.msf4/db...success
%%%%%%%%%%%%%%%%%%%%%%%%%%% Hacked: All the things %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                        Press SPACE BAR to **continue**



       [ metasploit v4.14.17-dev-                        ]
+ -- --[ 1648 exploits - 946 auxiliary - 291 post        ]
+ -- --[ 486 payloads - 40 encoders - 9 nops             ]
+ -- --[ Free Metasploit Pro trial: <a href="http://r-7.co/trymsp">http://r-7.co/trymsp</a> ]

msf > 
```

####  Başladıktan sonra modül tanıtma

MSF programını `msfconsole` komutuyla başlattınız ve bir takım işlemleriniz devam ediyor. Sisteme yeni bir modül tanıtmak için, programı kapatmanıza gerek yok. `loadpath` komutuyla modülün olduğu yolu tarif ettiğinizde, yükleme gerçekleşecektir.

```bash
msf > loadpath /home/umut/.msf4/modules
Loaded 0 modules:
msf > 
```

{{<youtube "5B8EftRWxGY">}}
