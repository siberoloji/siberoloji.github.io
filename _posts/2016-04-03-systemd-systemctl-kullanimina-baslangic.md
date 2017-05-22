---
layout: post
title: systemd - systemctl kullanımına başlangıç
date: 2016-04-03 08:53:44.000000000 +03:00
type: post
author: siberoloji
img: linux2.png
published: true
status: publish
categories:
- Araştırma
- Linux
tags:
- systemctl
- systemctl açılış durumu
- systemctl boot durumu
- systemctl status
- systemd systemctl

---
<p>Systemd konusunda önceki <a href="https://siberoloji.github.io/systemd-nedir-genel-yapisi-nasil-calisir/" target="_blank">giriş</a> ve <a href="https://siberoloji.github.io/systemd-araclari-genel-kullanim-alanlari/" target="_blank">genel</a> kullanım yazılarında bahsedilen araçlardan, systemctl aracını birlikte incelemeye başlayalım.</p>
<p>Bildiğiniz gibi, systemctl aracı, systemd’nin kendisini ve servis yöneticisini kontrol etmeye yarıyor. System Control ifadesinin kısaltılmış halidir. Öncelikle, systemctl komutu ile sistemimizin başlangıçta ne durumda olduğunu kontrol edelim. Bunun için komut satırına systemctl yazmanız yeterli.</p>
<pre class="lang:default decode:true ">komut:
systemctl
çıktı:
UNIT                 LOAD   ACTIVE SUB         DESCRIPTION
...
rc-local.service     loaded failed failed      /etc/rc.local Compatibility
resolvconf.service   loaded active exited      Nameserver information manager rsyslog.service      loaded active running     System Logging Service
...
LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
152 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.</pre>
<p>Bunun sonucunda sisteminizin başlama durumunda yüklenen, yüklenmeyen tüm servisler ile ilgili bir rapor ekrana görüntülenir. Bu ekranda, LOAD - ACTIVE - SUB sütünları, yüklenen ünitenin durumu hakkında bilgiler verir. Bu sütunlardaki bilgilere göre sisteminizin hatalarını tespit edip, diğer systemd araçlarının da yardımıyla hataları düzeltebilirsiniz.</p>
<p>Yukarıda verilen komutun çıktısı, normalde çok daha detaylı ve uzundur ancak buraya kısa halini aldık. Raporun sonunda, <i>152 loaded units listed  </i>ifadesiyle, toplam 152 ünitenin listelendiğini görebiliyoruz.</p>
<p>Komutun çıktısında, kırmızı ikaz ile gösterilen problem hakkında detaylı bilgi almak için <strong>systemctl</strong> aracının <strong>status</strong> unite komutunu ve bilgi almak istediğimiz unitenin ismini kullanacağız.</p>
<pre class="lang:default decode:true ">komut:
systemctl status rc-local.service
çıktı:
● rc-local.service - /etc/rc.local Compatibility
Loaded: loaded (/lib/systemd/system/rc-local.service; static; vendor preset: enabled)
Active: failed (Result: exit-code) since Paz 2015-05-10 10:04:17 EEST; 42min ago
Process: 696 ExecStart=/etc/rc.local start (code=exited, status=1/FAILURE)
May 10 10:04:17 ubuntu systemd[1]: Starting /etc/rc.local Compatibility...
May 10 10:04:17 ubuntu systemd[1]: rc-local.service: control process exited, code=exited status=1
May 10 10:04:17 ubuntu systemd[1]: Failed to start /etc/rc.local Compatibility.
May 10 10:04:17 ubuntu systemd[1]: Unit rc-local.service entered failed state.
May 10 10:04:17 ubuntu systemd[1]: rc-local.service failed.</pre>
<p>Detaylarını daha sonra açıklayacağımız bu durum raporları, sistemimiz hakkında nerelerde problem yaşandığını öğrenmekte oldukça faydalı olacaktır. Systemctl aracının kullanımı, yukarıda gösterilen ve benzeri şekillerde, durum komutları ve parametrelerle olmaktadır.</p>
<p>Systemd araçlarından systemctrl aracına kısaca bakmış olduk. İlerleyen yazılarda, unite komutları, unite dosya komutları ve sistem komutlarını systemctl aracı ile kullanmayı inceleyeceğiz.</p>
