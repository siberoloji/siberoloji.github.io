---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-03T14:18:00Z"
excerpt: 'systemctl aracı, systemd’nin kendisini ve servis yöneticisini kontrol etmeye
  yarıyor. System Control ifadesinin kısaltılmış halidir. Öncelikle, systemctl komutu
  ile sistemimizin başlangıçta ne durumda olduğunu kontrol edelim. '
guid: https://www.siberoloji.com/?p=1032
id: 1032
image: /assets/images/2024/06/linux2.png
tags:
- systemctl
- systemd
title: systemd &#8211; systemctl kullanımına başlangıç
url: /tr/systemd-systemctl-kullanimina-baslangic/
---

 <p>Systemd konusunda önceki <a href="https://www.siberoloji.com/systemd-nedir-genel-yapisi-nasildir/" data-type="post" data-id="1036" target="_blank" rel="noreferrer noopener">giriş</a> ve <a href="https://www.siberoloji.com/systemd-araclari-genel-kullanim-alanlari/" data-type="post" data-id="1034" target="_blank" rel="noreferrer noopener">genel</a> kullanım yazılarında bahsedilen araçlardan, systemctl aracını birlikte incelemeye başlayalım.
 

 <p>Bildiğiniz gibi, systemctl aracı, systemd’nin kendisini ve servis yöneticisini kontrol etmeye yarıyor. System Control ifadesinin kısaltılmış halidir. Öncelikle, systemctl komutu ile sistemimizin başlangıçta ne durumda olduğunu kontrol edelim. Bunun için komut satırına systemctl yazmanız yeterli.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">komut:
systemctl
çıktı:
UNIT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LOAD &nbsp; ACTIVE SUB &nbsp; &nbsp; &nbsp; &nbsp; DESCRIPTION
...
rc-local.service &nbsp; &nbsp; loaded failed failed &nbsp; &nbsp; &nbsp;/etc/rc.local Compatibility
resolvconf.service &nbsp; loaded active exited &nbsp; &nbsp; &nbsp;Nameserver information manager rsyslog.service &nbsp; &nbsp; &nbsp;loaded active running &nbsp; &nbsp; System Logging Service
...
LOAD &nbsp;&nbsp;= Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB &nbsp;&nbsp;&nbsp;= The low-level unit activation state, values depend on unit type.
152 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.</code></pre>
<!-- /wp:code -->

 <p>Bunun sonucunda sisteminizin başlama durumunda yüklenen, yüklenmeyen tüm servisler ile ilgili bir rapor ekrana görüntülenir. Bu ekranda, LOAD - ACTIVE - SUB sütünları, yüklenen ünitenin durumu hakkında bilgiler verir. Bu sütunlardaki bilgilere göre sisteminizin hatalarını tespit edip, diğer systemd araçlarının da yardımıyla hataları düzeltebilirsiniz.
 

 <p>Yukarıda verilen komutun çıktısı, normalde çok daha detaylı ve uzundur ancak buraya kısa halini aldık.&nbsp;Raporun sonunda,&nbsp;<em>152 loaded units listed &nbsp;</em>ifadesiyle, toplam 152 ünitenin listelendiğini görebiliyoruz.
 

 <p>Komutun çıktısında, kırmızı ikaz ile gösterilen problem hakkında detaylı bilgi almak için&nbsp;***systemctl*** &nbsp;aracının&nbsp;***status*** &nbsp;unite komutunu ve bilgi almak istediğimiz unitenin ismini kullanacağız.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">komut:
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
May 10 10:04:17 ubuntu systemd[1]: rc-local.service failed.</code></pre>
<!-- /wp:code -->

 <p>Detaylarını daha sonra açıklayacağımız bu durum raporları, sistemimiz hakkında nerelerde problem yaşandığını öğrenmekte oldukça faydalı olacaktır. Systemctl aracının kullanımı, yukarıda gösterilen ve benzeri şekillerde, durum komutları ve parametrelerle olmaktadır.
 

 <p>Systemd araçlarından systemctrl aracına kısaca bakmış olduk. İlerleyen yazılarda, unite komutları, unite dosya komutları ve sistem komutlarını systemctl aracı ile kullanmayı inceleyeceğiz.
 