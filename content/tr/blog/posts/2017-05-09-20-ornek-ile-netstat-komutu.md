---
draft: false

title:  '20 Örnek İle Netstat Komutu'
date: '2017-05-09T02:09:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Netstat (network statistics) komut satırından ağ bağlantılarını kontrol etmeye yarayan yardımcı bir programdır. Gelen ve giden bağlantılarla birlikte rotalama tablolarını da görmemizi sağlar. Ağ kartlarına ait istatistiklerle beraber sisteminizdeki açık Portları kontrol etmenize yardımcı olur.' 
 
url:  /tr/20-ornek-ile-netstat-komutu/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
    - netstat
---


Netstat (network statistics) komut satırından ağ bağlantılarını kontrol etmeye yarayan yardımcı bir programdır. Gelen ve giden bağlantılarla birlikte rotalama tablolarını da görmemizi sağlar. Ağ kartlarına ait istatistiklerle beraber sisteminizdeki açık Portları kontrol etmenize yardımcı olur.



Aşağıda, `netstat` komutuna ait 20 farklı örnek gösterilmiştir. `netstat -h` komutuyla yardım dokümanını görüntüleyebilirsiniz. CentOS vb. dağıtımlarda `net-tools` paketi kullanım dışı bırakıldığından `netstat` programını bulamayabilirsiniz. `netstat` yerine `ss` komutunu da kullanabilirsiniz.



Şimdi, sırayla örneklere bakalım.



## 1. TCP ve UDP Protokolünde Dinleme Yapan Tüm Portlar


```bash
netstat -a | more

Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address         Foreign Address         State
tcp        0      0 *****:sunrpc              *****:*****                     LISTEN
tcp        0     52 192.168.0.2:ssh       192.168.0.1:egs         ESTABLISHED
tcp        1      0 192.168.0.2:59292     <a href="http://www.gov.com:http/">www.gov.com:http</a>        CLOSE_WAIT
tcp        0      0 localhost:smtp        *****:*****                     LISTEN
tcp        0      0 *****:59482               *****:*****                     LISTEN
udp        0      0 *****:35036               *****:*****
udp        0      0 *****:npmp-local          *****:*****
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node Path
unix  2      **[** ACC **]**     STREAM     LISTENING     16972  /tmp/orbit-root/linc-76b-0-6fa08790553d6
unix  2      **[** ACC **]**     STREAM     LISTENING     17149  /tmp/orbit-root/linc-794-0-7058d584166d2
unix  2      **[** ACC **]**     STREAM     LISTENING     17161  /tmp/orbit-root/linc-792-0-546fe905321cc
unix  2      **[** ACC **]**     STREAM     LISTENING     15938  /tmp/orbit-root/linc-74b-0-415135cb6aeab
```



## 2. Sadece TCP Portları Listeleme


```bash
netstat -at

Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address          Foreign Address    State
tcp        0      0 *****:ssh                  *****:*****                LISTEN
tcp        0      0 localhost:ipp          *****:*****                LISTEN
tcp        0      0 localhost:smtp         *****:*****                LISTEN
tcp        0     52 192.168.0.2:ssh        192.168.0.1:egs    ESTABLISHED
tcp        1      0 192.168.0.2:59292      <a href="http://www.gov.com:http/">www.gov.com:http</a>   CLOSE_WAIT
```



## 3. UDP Portları Listeleme


```bash
netstat -au

Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address        Foreign Address    State
udp        0      0 *****:35036              *****:*****
udp        0      0 *****:npmp-local         *****:*****
udp        0      0 *****:mdns               *****:*****
```



## 4. Dinleme Yapan Tüm Bağlantıları Listeleme


```bash
netstat -l

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address       Foreign Address     State
tcp        0      0 *****:sunrpc            *****:*****                 LISTEN
tcp        0      0 *****:58642             *****:*****                 LISTEN
tcp        0      0 *****:ssh               *****:*****                 LISTEN
udp        0      0 *****:35036             *****:*****
udp        0      0 *****:npmp-local        *****:*****
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node Path
unix  2      **[** ACC **]**     STREAM     LISTENING     16972  /tmp/orbit-root/linc-76b-0-6fa08790553d6
unix  2      **[** ACC **]**     STREAM     LISTENING     17149  /tmp/orbit-root/linc-794-0-7058d584166d2
unix  2      **[** ACC **]**     STREAM     LISTENING     17161  /tmp/orbit-root/linc-792-0-546fe905321cc
unix  2      **[** ACC **]**     STREAM     LISTENING     15938  /tmp/orbit-root/linc-74b-0-415135cb6aeab
```



## 5. TCP Dinleme Yapan Portları Listeleme


```bash
netstat -lt

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address  State
tcp        0      0 *****:dctp                      *****:*****              LISTEN
tcp        0      0 *****:mysql                     *****:*****              LISTEN
tcp        0      0 *****:sunrpc                    *****:*****              LISTEN
tcp        0      0 *****:munin                     *****:*****              LISTEN
tcp        0      0 *****:ftp                       *****:*****              LISTEN
tcp        0      0 localhost.localdomain:ipp   *****:*****              LISTEN
tcp        0      0 localhost.localdomain:smtp  *****:*****              LISTEN
tcp        0      0 *****:http                      *****:*****              LISTEN
tcp        0      0 *****:ssh                       *****:*****              LISTEN
tcp        0      0 *****:https                     *****:*****              LISTEN
```



## 6. UDP Dinleme Yapan Portları Listeleme


```bash
netstat -lu

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address    State
udp        0      0 *****:39578                     *****:*****
udp        0      0 *****:meregister                *****:*****
udp        0      0 *****:vpps-qua                  *****:*****
udp        0      0 *****:openvpn                   *****:*****
udp        0      0 *****:mdns                      *****:*****
udp        0      0 *****:sunrpc                    *****:*****
udp        0      0 *****:ipp                       *****:*****
udp        0      0 *****:60222                     *****:*****
udp        0      0 *****:mdns                      *****:*****
```



## 7. UNIX Protokolünde Dinleme Yapan Portları Listeleme


```bash
netstat -lx

Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node Path
unix  2      **[** ACC **]**     STREAM     LISTENING     4171   @ISCSIADM_ABSTRACT_NAMESPACE
unix  2      **[** ACC **]**     STREAM     LISTENING     5767   /var/run/cups/cups.sock
unix  2      **[** ACC **]**     STREAM     LISTENING     7082   @/tmp/fam-root-
unix  2      **[** ACC **]**     STREAM     LISTENING     6157   /dev/gpmctl
unix  2      **[** ACC **]**     STREAM     LISTENING     6215   @/var/run/hald/dbus-IcefTIUkHm
unix  2      **[** ACC **]**     STREAM     LISTENING     6038   /tmp/.font-unix/fs7100
unix  2      **[** ACC **]**     STREAM     LISTENING     6175   /var/run/avahi-daemon/socket
unix  2      **[** ACC **]**     STREAM     LISTENING     4157   @ISCSID_UIP_ABSTRACT_NAMESPACE
unix  2      **[** ACC **]**     STREAM     LISTENING     60835836 /var/lib/mysql/mysql.sock
unix  2      **[** ACC **]**     STREAM     LISTENING     4645   /var/run/audispd_events
unix  2      **[** ACC **]**     STREAM     LISTENING     5136   /var/run/dbus/system_bus_socket
unix  2      **[** ACC **]**     STREAM     LISTENING     6216   @/var/run/hald/dbus-wsUBI30V2I
unix  2      **[** ACC **]**     STREAM     LISTENING     5517   /var/run/acpid.socket
unix  2      **[** ACC **]**     STREAM     LISTENING     5531   /var/run/pcscd.comm
```



## 8. İstatistikleri Protokole Göre Görüntüleme


```bash
netstat -s

Ip:
2461 total packets received
0 forwarded
0 incoming packets discarded
2431 incoming packets delivered
2049 requests sent out
Icmp:
0 ICMP messages received
0 input ICMP message failed.
ICMP input histogram:
1 ICMP messages sent
0 ICMP messages failed
ICMP output histogram:
destination unreachable: 1
Tcp:
159 active connections openings
1 passive connection openings
4 failed connection attempts
0 connection resets received
1 connections established
2191 segments received
1745 segments send out
24 segments retransmited
0 bad segments received.
4 resets sent
Udp:
243 packets received
1 packets to unknown port received.
0 packet receive errors
281 packets sent
```



## 9. TCP Protokol İstatistiklerini Gösterme


```bash
netstat -st

Tcp:
2805201 active connections openings
1597466 passive connection openings
1522484 failed connection attempts
37806 connection resets received
1 connections established
57718706 segments received
64280042 segments send out
3135688 segments retransmited
74 bad segments received.
17580 resets sent
```



## 10. UDP Protokol İstatistiklerini Gösterme


```bash
netstat -su

Udp:
1774823 packets received
901848 packets to unknown port received.
0 packet receive errors
2968722 packets sent
```



## 11. PID Numarasıyla Portu Kullanan Servisi Görüntüleme


```bash
netstat -tp

Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address         Foreign Address    State       PID/Program name
tcp        0      0 192.168.0.2:ssh       192.168.0.1:egs    ESTABLISHED 2179/sshd
tcp        1      0 192.168.0.2:59292     <a href="http://www.gov.com:http/">www.gov.com:http</a>   CLOSE_WAIT  1939/clock-applet
```



## 12. Promiscuous Mod Görüntüleme


```bash
netstat -ac 5 | grep tcp

tcp        0      0 *****:sunrpc                    *****:*****                         LISTEN
tcp        0      0 *****:58642                     *****:*****                         LISTEN
tcp        0      0 *****:ssh                       *****:*****                         LISTEN
tcp        0      0 localhost:ipp               *****:*****                         LISTEN
tcp        0      0 localhost:smtp              *****:*****                         LISTEN
tcp        1      0 192.168.0.2:59447           <a href="http://www.gov.com:http/">www.gov.com:http</a>            CLOSE_WAIT
tcp        0     52 192.168.0.2:ssh             192.168.0.1:egs             ESTABLISHED
tcp        0      0 *****:sunrpc                    *****:*****                         LISTEN
tcp        0      0 *****:ssh                       *****:*****                         LISTEN
tcp        0      0 localhost:ipp               *****:*****                         LISTEN
tcp        0      0 localhost:smtp              *****:*****                         LISTEN
tcp        0      0 *****:59482                     *****:*****                         LISTEN
```



## 13. Kernel IP Rotalamayı Görüntüleme


```bash
netstat -r

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
192.168.0.0     *****               255.255.255.0   U         0 0          0 eth0
link-local      *****               255.255.0.0     U         0 0          0 eth0
default         192.168.0.1     0.0.0.0         UG        0 0          0 eth0
```



## 14. Ağ Kartın Veri Aktarımlarını Görüntüleme


```bash
netstat -i
Kernel Interface table
Iface       MTU Met    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500   0     4459      0      0      0     4057      0      0      0 BMRU
lo        16436   0        8      0      0      0        8      0      0      0 LRU
```



## 15. Kernel Ağ Arayüz Tablosunu Görüntüleme


```bash
netstat -ie

Kernel Interface table
eth0      Link encap:Ethernet  HWaddr 00:0C:29:B4:DA:21
inet addr:192.168.0.2  Bcast:192.168.0.255  Mask:255.255.255.0
inet6 addr: fe80::20c:29ff:feb4:da21/64 Scope:Link
UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
RX packets:4486 errors:0 dropped:0 overruns:0 frame:0
TX packets:4077 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:1000
RX bytes:2720253 (2.5 MiB)  TX bytes:1161745 (1.1 MiB)
Interrupt:18 Base address:0x2000
lo        Link encap:Local Loopback
inet addr:127.0.0.1  Mask:255.0.0.0
inet6 addr: ::1/128 Scope:Host
UP LOOPBACK RUNNING  MTU:16436  Metric:1
RX packets:8 errors:0 dropped:0 overruns:0 frame:0
TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:0
RX bytes:480 (480.0 b)  TX bytes:480 (480.0 b)
```



## 16. IPv4 ve IPv6 Bilgilerini Görüntüleme


```bash
netstat -g

IPv6/IPv4 Group Memberships
Interface       RefCnt Group
--------------- ------ ---------------------
lo              1      all-systems.mcast.net
eth0            1      224.0.0.251
eth0            1      all-systems.mcast.net
lo              1      ff02::1
eth0            1      ff02::202
eth0            1      ff02::1:ffb4:da21
eth0            1      ff02::1
```



## 17. Netstat Bilgilerini Sürekli Görüntüleme


```bash
netstat -c

Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address               Foreign Address             State
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg007.shr.prod.s:36944 TIME_WAIT
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg010.shr.prod.s:42110 TIME_WAIT
tcp        0    132 <a href="http://tecmint.com/">tecmint.com</a>:ssh    115.113.134.3.static-:64662 ESTABLISHED
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   crawl-66-249-71-240.g:41166 TIME_WAIT
tcp        0      0 localhost.localdomain:54823 localhost.localdomain:smtp  TIME_WAIT
tcp        0      0 localhost.localdomain:54822 localhost.localdomain:smtp  TIME_WAIT
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg010.shr.prod.s:42091 TIME_WAIT
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg007.shr.prod.s:36998 TIME_WAIT
```



## 18. Desteklenmeyen ve Yapılandırılmamış Adres Türleri


```bash
netstat --verbose

netstat: no support for** `AF IPX' on this system.
netstat: no support for `AF AX25' on this system.
netstat: no support for** `AF X25' on this system.
netstat: no support for `AF NETROM' on this system.
```



## 19. Dinleme Yapan Programları Listelemek


```bash
netstat -ap | grep http

tcp        0      0 *****:http                      *****:*****                         LISTEN      9056/httpd
tcp        0      0 *****:https                     *****:*****                         LISTEN      9056/httpd
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg008.shr.prod.s:35248 TIME_WAIT   -
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg007.shr.prod.s:57783 TIME_WAIT   -
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg007.shr.prod.s:57769 TIME_WAIT   -
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg008.shr.prod.s:35270 TIME_WAIT   -
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg009.shr.prod.s:41637 TIME_WAIT   -
tcp        0      0 <a href="http://tecmint.com/">tecmint.com</a>:http   sg2nlhg009.shr.prod.s:41614 TIME_WAIT   -
unix  2      **[** **]**         STREAM     CONNECTED     88586726 10394/httpd
```



## 20. Sistem Özetini ve Açık UDP / TCP Portları Görme


```bash
netstat -tulpn

netstat -tulpn
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address   State       PID/Program name
tcp        0      0 127.0.1.1:53            0.0.0.0:*****         LISTEN      -               
tcp        0      0 127.0.0.1:631           0.0.0.0:*****         LISTEN      -               
tcp        0      0 0.0.0.0:445             0.0.0.0:*****         LISTEN      -               
tcp        0      0 0.0.0.0:139             0.0.0.0:*****         LISTEN      -               
tcp6       0      0 :::445                  :::*****              LISTEN      -               
tcp6       0      0 :::139                  :::*****              LISTEN      -               
udp        0      0 0.0.0.0:631             0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:5353            0.0.0.0:*****                     8706/chrome --disab
udp        0      0 0.0.0.0:5353            0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:36671           0.0.0.0:*****                     -               
udp        0      0 127.0.1.1:53            0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:68              0.0.0.0:*****                     -               
udp        0      0 192.168.1.2:123         0.0.0.0:*****                     -               
udp        0      0 127.0.0.1:123           0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:123             0.0.0.0:*****                     -               
udp        0      0 192.168.1.255:137       0.0.0.0:*****                     -               
udp        0      0 192.168.1.2:137         0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:137             0.0.0.0:*****                     -               
udp        0      0 192.168.1.255:138       0.0.0.0:*****                     -               
udp        0      0 192.168.1.2:138         0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:138             0.0.0.0:*****                     -               
udp        0      0 0.0.0.0:45208           0.0.0.0:*****                     -               
udp6       0      0 :::5353                 :::*****                          8706/chrome --disab
udp6       0      0 :::5353                 :::*****                          -               
udp6       0      0 :::59535                :::*****                          -               
udp6       0      0 fe80::7c42:9730:43f:123 :::*****                          -               
udp6       0      0 :::123                  :::*****                          -               ```
