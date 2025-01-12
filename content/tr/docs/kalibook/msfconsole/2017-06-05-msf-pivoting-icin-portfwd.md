---
draft: false

title:  'MSF Pivoting İçin Portfwd'
date: '2017-06-05T13:35:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Port Yönlendirme olarak kullanılan\_portfwd\_komutu, Meterpreter’in sağladığı imkanlardan bir tanesidir. Normalde ağda bulunan fakat doğrudan iletişim kurulamayan cihazlarla iletişim kurmaya yarar. Bunun gerçekleşebilmesi için öncelikle bir\_pivot\_bilgisayara ihtiyacımız bulunmaktadır." 
 
url:  /tr/msf-pivoting-icin-portfwd/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Portfwd



Port Yönlendirme olarak kullanılan `portfwd` komutu, Meterpreter’in sağladığı imkanlardan bir tanesidir. Normalde ağda bulunan fakat doğrudan iletişim kurulamayan cihazlarla iletişim kurmaya yarar. Bunun gerçekleşebilmesi için öncelikle bir **pivot** bilgisayara ihtiyacımız bulunmaktadır.



Pivot olarak adlandırdığımız bilgisayarın bağlanabildiği bir ağ cihazına, port yönlendirme yaparak kendi yerel makinemizden bağlanmamızı sağlar. Bunun nasıl gerçekleştiğini bir örnekle açıklamaya çalışalım. Bu anlatımda 3 adet bilgisayar olduğunu baştan belirtmekte fayda var.


*  Kendi bilgisayarımız: 192.168.1.162 veya 0.0.0.0

* Pivot bilgisayar : 172.16.194.144

* Hedef Bilgisayar : 172.16.194.191




Bizim burada yapmaya çalıştığımız işlem, bir şekilde meterpreter oturum açtığımız **pivot** bilgisayar üzerinden Port Yönlendirme yaparak **hedef** bilgisayarla haberleşmeyi sağlamaktır.



## Yardımı Görüntüleme



Pivot makinede meterpreter oturum açık durumdayken `portfwd –h` komutu ile `portfwd` ile ilgili yardımı görüntüleyebilirsiniz.


```bash
meterpreter > portfwd -h
Usage: portfwd [-h] [add | delete | list | flush] [args]
OPTIONS:
     -L >opt>  The local host to listen on (optional).
     -h        Help banner.
     -l >opt>  The local port to listen on.
     -p >opt>  The remote port to connect on.
     -r >opt>  The remote host to connect on.
meterpreter >
```



## Seçenekler



-L: Dinleme yapacağımız kendi bilgisayarımızın IP adresini ifade eder. Bilgisayarınızda birden fazla ağ kartı yoksa bu seçeneği girmeyebilirsiniz. Varsayılan olarak `localhost` anlamında `0.0.0.0` kullanılacaktır.



-h: Yardım bilgisini görüntüler.



-l: Yerel kendi bilgisayarımızda dinleme yapacağımız Port numarasını ifade eder.



-p: Hedef bilgisayarın Port numarasını ifade eder.



-r: Hedef bilgisayarın IP adresini ifade eder.



## Argümanlar



Add: Yeni bir yönlendirme eklemeye yarar.



Delete: Mevcut bir yönlendirmeyi silmeye yarar.



List: Mevcut durumda tüm yönlendirmelerin listesini görüntülemeye yarar.



Flush: Tüm aktif yönlendirmeleri iptal etmeye yarar.



## Yönlendirme Ekleme



Meterpreter shell oturumunu açtığımız **pivot** bilgisayarda iken vereceğimiz komut aşağıdaki formattadır.


```bash
meterpreter > portfwd add –l 3389 –p 3389 –r  [target host]
```



`-l 3389` Yerel bilgisayarımızda dinleme yapacağımız Port numarası



`-p 3389` Hedef bilgisayar Port numarasıdır.



`-r [target host]` hedef bilgisayar IP adresidir.



Şimdi port yönlendirmeyi yapalım.


```bash
meterpreter > portfwd add –l 3389 –p 3389 –r 172.16.194.191
> Local TCP relay created: 0.0.0.0:3389 >-> 172.16.194.191:3389
meterpreter > 
```



## Yönlendirme Silme



Silme işlemini de **pivot** bilgisayar oturumunda iken aşağıdaki örnekte olduğu gibi yapabiliriz.


```bash
meterpreter > portfwd delete –l 3389 –p 3389 –r 172.16.194.191
> Successfully stopped TCP relay on 0.0.0.0:3389
meterpreter > 
```



## Yönlendirmeleri Listeleme



Aktif olan yönlendirmeleri `portfwd list` komutuyla yapabiliriz.


```bash
meterpreter > portfwd list
0: 0.0.0.0:3389 -> 172.16.194.191:3389
1: 0.0.0.0:1337 -> 172.16.194.191:1337
2: 0.0.0.0:2222 -> 172.16.194.191:2222

3 total local port forwards.
meterpreter >
```



## Tüm Yönlendirmeleri Temizleme



Sistemde aktif olan tüm yönlendirmeleri `portfwd flush` komutuyla iptal edebiliriz.


```bash
meterpreter > portfwd flush
> Successfully stopped TCP relay on 0.0.0.0:3389
> Successfully stopped TCP relay on 0.0.0.0:1337
> Successfully stopped TCP relay on 0.0.0.0:2222
> Successfully flushed 3 rules
meterpreter > portfwd list

0 total local port forwards
meterpreter >
```



## Örnek



Aşağıda örnek olarak bir senaryoyu bulabilirsiniz.



## Hedef Bilgisayar



Aşağıdaki komut çıktısında görüldüğü gibi, hedef bilgisayar `172.16.194.141` IP adresine sahiptir.


```bash
C:\> ipconfig

Windows IP Configuration

Ethernet adapter Local Area Connection 3:

   Connection-specific DNS Suffix . : localdomain
   IP Address.  .  .  .  .  .  .  .  . 172.16.194.141
   Subnet Mask.  .  . .  .  .  .  .  . 255.255.255.0
   Default Gateway. . .  .  .  .  .  . 172.16.194.2

C:\>
```



## Pivot Bilgisayar



**Pivot** bilgisayar aşağıdaki çıktıda görüldüğü gibi, hem `172.16.194.0/24` ağına hem de `192.168.1.0/24` ağına bağlanabilmektedir. Bizim yerel bilgisayarımızda bu `192.168.1.0/24` ağında bulunuyor.


```bash
meterpreter > ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0

VMware Accelerated AMD PCNet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:aa:00:aa:00:aa
IP Address  : 172.16.194.144
Netmask     : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:bb:00:bb:00:bb
IP Address  : 192.168.1.191
Netmask     : 255.0.0.0
```



## Yerel Bilgisayar



Birazdan aşağıda göreceğiniz yönlendirme sonucunda yerel bilgisayarımızın (192.168.1.162 IP numaralı), **pivot** makine üzerinden `172.16.194.141` IP adresine `ping` sinyali gönderebildiğini görebiliyoruz.


```bash
root@kali:~# ifconfig eth1
eth1     Link encap:Ethernet  HWaddr 0a:0b:0c:0d:0e:0f  
         inet addr:192.168.1.162  Bcast:192.168.1.255  Mask:255.255.255.0
         inet6 addr: fe80::20c:29ff:fed6:ab38/64 Scope:Link
         UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
         RX packets:1357685 errors:0 dropped:0 overruns:0 frame:0
         TX packets:823428 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:1000 
         RX bytes:318385612 (303.6 MiB)  TX bytes:133752114 (127.5 MiB)
         Interrupt:19 Base address:0x2000


root@kali:~# ping 172.16.194.141
PING 172.16.194.141 (172.16.194.141) 56(84) bytes of data.
64 bytes from 172.16.194.141: icmp_req=1 ttl=128 time=240 ms
64 bytes from 172.16.194.141: icmp_req=2 ttl=128 time=117 ms
64 bytes from 172.16.194.141: icmp_req=3 ttl=128 time=119 ms
^C
--- 172.16.194.141 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 117.759/159.378/240.587/57.430 ms

root@kali:~#
```



Peki bu haberleşmeyi nasıl başardık?



## Yönlendirme Yapalım



**pivot** bilgisayarda açtığımız meterpreter shell içerisinde iken aşağıdaki yönlendirme işlemini gerçekleştirdik.


```bash
meterpreter > portfwd add –l 3389 –p 3389 –r 172.16.194.141
```



Yönlendirme komutunu **pivot** bilgisayarda verdikten sonra yerel bilgisayarımızda `netstat -antp` komutuyla bizim de dinlemeyi `3389` numaralı port üzerinden yaptığımızı kontrol edebilirsiniz.


```bash
root@kali:~# netstat -antp
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*****               LISTEN      8397/sshd  
.....
tcp        0      0 0.0.0.0:3389            0.0.0.0:*****               LISTEN      2045/.ruby.bin      
.....
tcp6       0      0 :::22                   :::*****                    LISTEN      8397/sshd
root@kali:~#
```



Bu durumda yerel bilgisayarımızdan hedef bilgisayara `rdesktop` uzak masaüstü bağlantısı açabilir veya diğer işlemleri yapabiliriz.



Örneğin `exploit/windows/smb/ms08_067_netapi` modülünü kullanabiliriz. Bu modüldeki değişkenleri, yönlendirme sonucu ulaştığımız hedef bilgisayarın IP adresi ve Port numarasını girerek kullanabiliriz.



Konunun biraz kafa karıştırıcı olduğunu düşünebilirsiniz. Bir miktar deneme ve antrenman yapmanızı tavsiye ediyorum.



Şöyle düşünün, hedef bilgisayara ulaşmak için **pivot** makineye meterpreter shell açıyoruz. **pivot** bilgisayarın haberleşebildiği diğer IP adresinde aktif bulunan (örneğin SAMBA, 445 portu) servise önce yönlendirme yapıyoruz. Ardından yerel bilgisayarımızdan hedef bilgisayara bağlanabiliyoruz.



Doğru IP ve Port numaralarını yönlendirme yaptığınıza dikkat etmelisiniz.
