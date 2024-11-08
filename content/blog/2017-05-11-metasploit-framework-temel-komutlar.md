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
date: "2017-05-11T12:26:00Z"
excerpt: Bu yazımızda, Metasploit Framework içerisinde kullanılan temel komutları
  inceleyeceğiz. Komutların, başlangıçta çok fazla ve karışık olduğunu düşünebilirsiniz
  ancak kendinize zaman tanımanızı tavsiye ediyorum. Kullandıkça aşina olacak ve artık
  otomatik olarak yazar hale geleceksiniz. Komutları yazarken, komutun bir kaç harfini
  yazıp TAB tuşu ile gerisini otomatik tamamlayabilirsiniz. msfconsole içerisinde
  komut ve klasör yolu tamamlama, aynen Linux komut satırındaki gibi çalışır.
guid: https://www.siberoloji.com/?p=1137
id: 1137
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit
- metasploit framework
title: Metasploit Framework Temel Komutlar
url: /tr/metasploit-framework-temel-komutlar/
---

  Bu yazımızda, Metasploit Framework içerisinde kullanılan temel komutları inceleyeceğiz. Komutların, başlangıçta çok fazla ve karışık olduğunu düşünebilirsiniz ancak kendinize zaman tanımanızı tavsiye ediyorum. Kullandıkça aşina olacak ve artık otomatik olarak yazar hale geleceksiniz. Komutları yazarken, komutun bir kaç harfini yazıp TAB tuşu ile gerisini otomatik tamamlayabilirsiniz. msfconsole içerisinde komut ve klasör yolu tamamlama, aynen Linux komut satırındaki gibi çalışır.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="back">back 
<!-- /wp:heading -->

  <code>use</code>&nbsp;komutunu kullanarak seçtiğiniz bir modülü aktif ettiğinizde, modülü kullanmaktan vazgeçebilirsiniz. Bu durumda, bir üst klasöre geri gelmek istediğinizde kullanılır. Teknik olarak çok gerekli değildir çünkü bulunduğunuz modülün içinde de yeni modül seçtiğinizde o modülden çıkmış olusunuz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>ms09_001_write<strong>)</strong> <strong>&gt;</strong> back
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="banner">banner 
<!-- /wp:heading -->

  Rastgele seçilen bir banner görüntüler.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> banner
 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | <strong>||</strong> | <strong>||</strong> | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       <strong>=[</strong> metasploit v4.11.4-2015071402                   <strong>]</strong>
+ -- --<strong>=[</strong> 1467 exploits - 840 auxiliary - 232 post        <strong>]</strong>
+ -- --<strong>=[</strong> 432 payloads - 37 encoders - 8 nops             <strong>]</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="check">check 
<!-- /wp:heading -->

  Bu komutu her exploit desteklemese de ne işe yaradığını açıklayalım. Bir modül seçtiniz ve hedef sistemde uygulamadan önce işe yarayıp yaramayacağını merak ediyorsunuz. Gerekli ayarları&nbsp;<code>set</code>&nbsp;komutuyla yaptıktan sonra&nbsp;<code>check</code>&nbsp;komutuyla ön test yapabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>exploit/windows/smb/ms08_067_netapi<strong>)</strong>:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    172.16.194.134   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use <strong>(</strong>BROWSER, SRVSVC<strong>)</strong>

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting

msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> check

<strong>[</strong><strong>*</strong><strong>]</strong> Verifying vulnerable status... <strong>(</strong>path: 0x0000005a<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> System is not vulnerable <strong>(</strong>status: 0x00000000<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> The target is not exploitable.
msf  exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="color">color 
<!-- /wp:heading -->

  msfconsole içinden alacağınız çıktı ve bilgilerin renklendirilmesini sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> color
Usage: color <strong>&gt;</strong>'true'|'false'|'auto'<strong>&gt;</strong>

Enable or disable color output.
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="connect">connect 
<!-- /wp:heading -->

  Küçük bir telnet veya netcat programıdır diyebiliriz. SSL desteği vardır ve dosya gönderme vb. işlemleri yapabilirsiniz. Kulanmak için, bağlanmak istediğiniz IP adresini ve port numarasını belirtmeniz durumunda&nbsp;<code>msfconsole</code>&nbsp;içerisinden uzak bilgisayara ulaşabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> connect 192.168.1.1 23
<strong>[</strong><strong>*</strong><strong>]</strong> Connected to 192.168.1.1:23
DD-WRT v24 std <strong>(</strong>c<strong>)</strong> 2008 NewMedia-NET GmbH
Release: 07/27/08 <strong>(</strong>SVN revision: 10011<strong>)</strong>
DD-WRT login:
</code></pre>
<!-- /wp:code -->

  <code>connect</code>&nbsp;komutu ile ilgili detaylı seçeneklerini&nbsp;<code>-h</code>&nbsp;parametresiyle görebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> connect -h
Usage: connect <strong>[</strong>options]  

Communicate with a host, similar to interacting via netcat, taking advantage of
any configured session pivoting.

OPTIONS:

    -C        Try to use CRLF <strong>for </strong>EOL sequence.
    -P &lt;opt&gt;  Specify source port.
    -S &lt;opt&gt;  Specify source address.
    -c &lt;opt&gt;  Specify which Comm to use.
    -h        Help banner.
    -i &lt;opt&gt;  Send the contents of a file.
    -p &lt;opt&gt;  List of proxies to use.
    -s        Connect with SSL.
    -u        Switch to a UDP socket.
    -w &lt;opt&gt;  Specify connect timeout.
    -z        Just try to connect, <strong>then return</strong>.

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="edit">edit 
<!-- /wp:heading -->

  Aktif olarak seçilmiş modülün kodlarında değişiklik yapmak isterseniz&nbsp;<code>edit</code>&nbsp;komutuyla metin editörünü açıp gerekli işlemleri yapabilirsiniz. Varsayılan olarak Vim editör açılacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms10_061_spoolss<strong>)</strong> <strong>&gt;</strong> edit
<strong>[</strong><strong>*</strong><strong>]</strong> Launching /usr/bin/vim /usr/share/metasploit-framework/modules/exploits/windows/smb/ms10_061_spoolss.rb

<em>##</em>
<em># This module requires Metasploit: http//metasploit.com/download</em>
<em># Current source: <a href="https://github.com/rapid7/metasploit-framework">https://github.com/rapid7/metasploit-framework</a></em>
<em>##</em>

require 'msf/core'
require 'msf/windows_error'

class Metasploit3 <strong>&gt;</strong> Msf::Exploit::Remote
  Rank <strong>=</strong> ExcellentRanking

  include Msf::Exploit::Remote::DCERPC
  include Msf::Exploit::Remote::SMB
  include Msf::Exploit::EXE
  include Msf::Exploit::WbemExec

  def initialize<strong>(</strong>info <strong>=</strong> <strong>{})</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="exit">exit 
<!-- /wp:heading -->

  msfconsole’dan çıkmaya yarar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms10_061_spoolss<strong>)</strong> <strong>&gt;</strong> exit
root@kali:~#
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="help">help 
<!-- /wp:heading -->

  Kullanılabilir durumda olan komutların listesini ve kısa açıklamalarını ekrana görüntülemeye yarar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> help

Core Commands
<strong>=============</strong>

    Command       Description
    -------       -----------
    ?             Help menu
    back          Move back from the current context
    banner        Display an awesome metasploit banner
    cd            Change the current working directory
    color         Toggle color
    connect       Communicate with a host
...snip...

Database Backend Commands
<strong>=========================</strong>

    Command           Description
    -------           -----------
    creds             List all credentials <strong>in </strong>the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file <strong>(</strong>filetype will be auto-detected<strong>)</strong>
...snip...
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="info">info 
<!-- /wp:heading -->

  İstediğiniz herhangi bir modül hakkında detaylı bilgileri&nbsp;<code>info</code>&nbsp;komutuyla inceleyebilirsiniz. Herhangi bir modülü kullanmadan önce&nbsp;<code>info</code>&nbsp;komutuyla, modül detaylarını mutlaka okumanızı tavsiye ediyoruz. Sadece isminden hareketle başarılı olamayabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  exploit<strong>(</strong>ms09_050_smb2_negotiate_func_index<strong>)</strong> <strong>&gt;</strong> info exploit/windows/smb/ms09_050_smb2_negotiate_func_index 

       Name: Microsoft SRV2.SYS SMB Negotiate ProcessID Function Table Dereference
     Module: exploit/windows/smb/ms09_050_smb2_negotiate_func_index
    Version: 14774
   Platform: Windows
 Privileged: Yes
    License: Metasploit Framework License <strong>(</strong>BSD<strong>)</strong>
       Rank: Good

Provided by:
  Laurent Gaffie &lt;laurent.gaffie@gmail.com&gt;
  hdm &lt;hdm@metasploit.com&gt;
  sf &lt;stephen_fewer@harmonysecurity.com&gt;

Available targets:
  Id  Name
  --  ----
  0   Windows Vista SP1/SP2 and Server 2008 <strong>(</strong>x86<strong>)</strong>

Basic options:
  Name   Current Setting  Required  Description
  ----   ---------------  --------  -----------
  RHOST                   yes       The target address
  RPORT  445              yes       The target port
  WAIT   180              yes       The number of seconds to wait <strong>for </strong>the attack to complete.

Payload information:
  Space: 1024

Description:
  This module exploits an out of bounds <strong>function </strong>table dereference <strong>in 
  </strong>the SMB request validation code of the SRV2.SYS driver included with 
  Windows Vista, Windows 7 release candidates <strong>(</strong>not RTM<strong>)</strong>, and Windows 
  2008 Server prior to R2. Windows Vista without SP1 does not seem 
  affected by this flaw.

References:
  <a href="http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx</a>
  <a href="http://cve.mitre.org/cgi-bin/cvename.cgi?name">http://cve.mitre.org/cgi-bin/cvename.cgi?name</a><strong>=</strong>2009-3103
  <a href="http://www.securityfocus.com/bid/36299">http://www.securityfocus.com/bid/36299</a>
  <a href="http://www.osvdb.org/57799">http://www.osvdb.org/57799</a>
  <a href="http://seclists.org/fulldisclosure/2009/Sep/0039.html">http://seclists.org/fulldisclosure/2009/Sep/0039.html</a>
  <a href="http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx</a>

msf  exploit<strong>(</strong>ms09_050_smb2_negotiate_func_index<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="irb">irb 
<!-- /wp:heading -->

  Bu komutu verdiğinizde doğrudan Ruby komut girişimcisine gidersiniz. msfconsole içerisinden Ruby ile script yazmanızı sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> irb
<strong>[</strong><strong>*</strong><strong>]</strong> Starting IRB shell...

<strong>&gt;&gt;</strong> puts "Hello, metasploit!"
Hello, metasploit!
<strong>=&gt;</strong> nil
<strong>&gt;&gt;</strong> Framework::Version
<strong>=&gt;</strong> "4.8.2-2014022601"
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="jobs">jobs 
<!-- /wp:heading -->

  Arka planda çalışır durumdaki modülleri listeleme, kapatma vb. işlemleri listelemenizi sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> jobs -h
Usage: jobs <strong>[</strong>options]

Active job manipulation and interaction.

OPTIONS:

    -K        Terminate all running jobs.
    -h        Help banner.
    -i &lt;opt&gt;  Lists detailed information about a running job.
    -k &lt;opt&gt;  Terminate the specified job name.
    -l        List all running jobs.
    -v        Print more detailed info.  Use with -i and -l

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="kill">kill 
<!-- /wp:heading -->

  Çalışan bir prosesin&nbsp;<code>job id</code>&nbsp;numarasını verdiğiniz takdirde işlemin kapanmasını sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms10_002_aurora<strong>)</strong> <strong>&gt;</strong> kill 0
Stopping job: 0...

<strong>[</strong><strong>*</strong><strong>]</strong> Server stopped.
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="load">load 
<!-- /wp:heading -->

  Metasploit klasörlerinden plugin (eklenti) yüklemenizi sağlar. Parametreler, key=val formatında belirtilmelidir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> load
Usage: load &lt;path&gt; <strong>[</strong>var<strong>=</strong>val var<strong>=</strong>val ...]
</code></pre>
<!-- /wp:code -->

  <code>load</code>&nbsp;komutuyla eklentinin tam yolunu vermezseniz, öncelikle kullanıcı klasörlerine&nbsp;<code>~/.msf4/plugins</code>&nbsp;bakılır. Orada bulunamaz ise eklenti için metasploit-framework ana klasörlerine&nbsp;<code>/usr/share/metasploit-framework/plugins</code>&nbsp;bakılır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> load pcap_log
<strong>[</strong><strong>*</strong><strong>]</strong> PcapLog plugin loaded.
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully loaded plugin: pcap_log
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="loadpath">loadpath 
<!-- /wp:heading -->

  msfconsole çalışır durumda iken, istediğiniz bir modülü yüklemenizi sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> loadpath /home/secret/modules

Loaded 0 modules.
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="unload">unload 
<!-- /wp:heading -->

  <code>load</code>&nbsp;komutuyla yüklediğiniz eklentinin sistemden ayrılmasını sağlar.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> unload pcap_log
Unloading plugin pcap_log...unloaded.
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="resource">resource 
<!-- /wp:heading -->

  Bazı modüller, script komutlarının içinden dış kaynaklara atıfta bulunurlar. Örneğin (password dictionary) vb. kaynakları msfconsole içerisinde kullanmak için&nbsp;<code>resource</code>&nbsp;komutunu kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> resource
Usage: resource path1 <strong>[</strong>path2 ...]
</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> resource karma.rc
<strong>[</strong><strong>*</strong><strong>]</strong> Processing karma.rc <strong>for </strong>ERB directives.
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> db_connect postgres:toor@127.0.0.1/msfbook
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> use auxiliary/server/browser_autopwn
...snip...
</code></pre>
<!-- /wp:code -->

  Bu tür resource dosyaları, işlerinizi oldukça hızlandırabilir. msfconsole dışından, msfconsole resource dosyası göndermek için&nbsp;<code>-r</code>&nbsp;parametresini kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# echo version <strong>&gt;</strong> version.rc
root@kali:~# msfconsole -r version.rc

 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | <strong>||</strong> | <strong>||</strong> | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       <strong>=[</strong> metasploit v4.8.2-2014021901 <strong>[</strong>core:4.8 api:1.0] <strong>]</strong>
+ -- --<strong>=[</strong> 1265 exploits - 695 auxiliary - 202 post <strong>]</strong>
+ -- --<strong>=[</strong> 330 payloads - 32 encoders - 8 nops      <strong>]</strong>

<strong>[</strong><strong>*</strong><strong>]</strong> Processing version.rc <strong>for </strong>ERB directives.
resource <strong>(</strong>version.rc<strong>)&gt;</strong> version
Framework: 4.8.2-2014022601
Console  : 4.8.2-2014022601.15168
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="route">route 
<!-- /wp:heading -->

  <code>route</code>&nbsp;komutu, hedef bilgisayardaki iletişimin rotasını değiştirmeye yarar.&nbsp;<code>add</code>,&nbsp;<code>delete</code>&nbsp;ve&nbsp;<code>list</code>&nbsp;seçenekleri bulunur. Komuta&nbsp;<strong>subnet</strong>,&nbsp;<strong>netmask</strong>,&nbsp;<strong>gateway</strong>&nbsp;parametrelerini göndermeniz gerekir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> route -h
Usage: route <strong>[</strong>-h<strong>]</strong> command <strong>[</strong>args]
</code></pre>
<!-- /wp:code -->

  Hedef bilgisayarda meterpreter session açtığınızda&nbsp;<code>route</code>&nbsp;komutunu parametresiz olarak verirseniz mevcut iletişim tablosunu görebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Supported commands:

   add    <strong>[</strong>subnet] <strong>[</strong>netmask] <strong>[</strong>gateway]
   delete <strong>[</strong>subnet] <strong>[</strong>netmask] <strong>[</strong>gateway]
   list

meterpreter <strong>&gt;</strong>
meterpreter <strong>&gt;</strong> route

Network routes
<strong>==============</strong>

    Subnet           Netmask          Gateway
    ------           -------          -------
    0.0.0.0          0.0.0.0          172.16.1.254
    127.0.0.0        255.0.0.0        127.0.0.1
    172.16.1.0       255.255.255.0    172.16.1.100
    172.16.1.100     255.255.255.255  127.0.0.1
    172.16.255.255   255.255.255.255  172.16.1.100
    224.0.0.0        240.0.0.0        172.16.1.100
    255.255.255.255  255.255.255.255  172.16.1.100
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="search">search 
<!-- /wp:heading -->

  msfconsole içerisinde arama yapmanızı sağlar. Basitçe aradığınız herhangi bir ifadeyi yazabileceğiniz gibi parametreler sayesinde aramayı daraltmanız da mümkündür.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search usermap_script

Matching Modules
<strong>================</strong>

   Name                                Disclosure Date  Rank       Description
   ----                                ---------------  ----       -----------
   exploit/multi/samba/usermap_script  2007-05-14       excellent  Samba "username map script" Command Execution

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="help-1">help</h2>
<!-- /wp:heading -->

  Anahtar kelimeleri kullanarak aramalarınızı çeşitlendirebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> help search
Usage: search <strong>[</strong>keywords]

Keywords:
  name      :  Modules with a matching descriptive name
  path      :  Modules with a matching path or reference name
  platform  :  Modules affecting this platform
  type      :  Modules of a specific type <strong>(</strong>exploit, auxiliary, or post<strong>)</strong>
  app       :  Modules that are client or server attacks
  author    :  Modules written by this author
  cve       :  Modules with a matching CVE ID
  bid       :  Modules with a matching Bugtraq ID
  osvdb     :  Modules with a matching OSVDB ID

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="name">name</h2>
<!-- /wp:heading -->

  “name” anahtar kelimesi ile arama.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search name:mysql

Matching Modules
<strong>================</strong>

   Name                                               Disclosure Date  Rank       Description
   ----                                               ---------------  ----       -----------
   auxiliary/admin/mysql/mysql_enum                                    normal     MySQL Enumeration Module
   auxiliary/admin/mysql/mysql_sql                                     normal     MySQL SQL Generic Query
   auxiliary/analyze/jtr_mysql_fast                                    normal     John the Ripper MySQL Password Cracker <strong>(</strong>Fast Mode<strong>)</strong>
   auxiliary/scanner/mysql/mysql_authbypass_hashdump  2012-06-09       normal     MySQL Authentication Bypass Password Dump
   auxiliary/scanner/mysql/mysql_hashdump                              normal     MYSQL Password Hashdump
   auxiliary/scanner/mysql/mysql_login                                 normal     MySQL Login Utility
   auxiliary/scanner/mysql/mysql_schemadump                            normal     MYSQL Schema Dump
   auxiliary/scanner/mysql/mysql_version                               normal     MySQL Server Version Enumeration
   exploit/linux/mysql/mysql_yassl_getname            2010-01-25       good       MySQL yaSSL CertDecoder::GetName Buffer Overflow
   exploit/linux/mysql/mysql_yassl_hello              2008-01-04       good       MySQL yaSSL SSL Hello Message Buffer Overflow
   exploit/windows/mysql/mysql_payload                2009-01-16       excellent  Oracle MySQL <strong>for </strong>Microsoft Windows Payload Execution
   exploit/windows/mysql/mysql_yassl_hello            2008-01-04       average    MySQL yaSSL SSL Hello Message Buffer Overflow
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="path">path</h2>
<!-- /wp:heading -->

  “path” anahtar kelimesi ile modül klasörlerinde arama.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search path:scada

Matching Modules
<strong>================</strong>

   Name                                                 Disclosure Date  Rank     Description
   ----                                                 ---------------  ----     -----------
   auxiliary/admin/scada/igss_exec_17                   2011-03-21       normal   Interactive Graphical SCADA System Remote Command Injection
   exploit/windows/scada/citect_scada_odbc              2008-06-11       normal   CitectSCADA/CitectFacilities ODBC Buffer Overflow
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="platform">platform</h2>
<!-- /wp:heading -->

  “platform” anahtar kelimesi ile arama</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search platform:aix

Matching Modules
<strong>================</strong>

   Name                                  Disclosure Date  Rank    Description
   ----                                  ---------------  ----    -----------
   payload/aix/ppc/shell_bind_tcp                         normal  AIX Command Shell, Bind TCP Inline
   payload/aix/ppc/shell_find_port                        normal  AIX Command Shell, Find Port Inline
   payload/aix/ppc/shell_interact                         normal  AIX execve shell <strong>for </strong>inetd
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="type">type</h2>
<!-- /wp:heading -->

  “type” anahtar kelimesi ile arama</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search type:exploit

Matching Modules
<strong>================</strong>

   Name                                                Disclosure Date  Rank    Description
   ----                                                ---------------  ----    -----------
   post/linux/gather/checkvm                                            normal  Linux Gather Virtual Environment Detection
   post/linux/gather/enum_cron                                          normal  Linux Cron Job Enumeration
   post/linux/gather/enum_linux                                         normal  Linux Gather System Information
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="author">author</h2>
<!-- /wp:heading -->

  “author” anahtar kelimesi ile yazara göre arama.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search author:dookie

Matching Modules
<strong>================</strong>

   Name                                                       Disclosure Date  Rank     Description
   ----                                                       ---------------  ----     -----------
   exploit/osx/http/evocam_webserver                          2010-06-01       average  MacOS X EvoCam HTTP GET Buffer Overflow
   exploit/osx/misc/ufo_ai                                    2009-10-28       average  UFO: Alien Invasion IRC Client Buffer Overflow Exploit
   exploit/windows/browser/amaya_bdo                          2009-01-28       normal   Amaya Browser v11.0 bdo tag overflow
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="multiple">multiple</h2>
<!-- /wp:heading -->

  Birden fazla anahtar kelime kriteri girerek arama yapabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search cve:2011 author:jduck platform:linux

Matching Modules
<strong>================</strong>

   Name                                         Disclosure Date  Rank     Description
   ----                                         ---------------  ----     -----------
   exploit/linux/misc/netsupport_manager_agent  2011-01-08       average  NetSupport Manager Agent Remote Buffer Overflow
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="sessions">sessions 
<!-- /wp:heading -->

  <code>sessions</code>&nbsp;komutuyla oturumları yönetebilirsiniz. Oturumlar, kullandığınız her bir modülün o anda aktif olarak faaliyetlerinin organize edildiği işlemleri ifade eder.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf &gt; sessions -h
Usage: sessions [options]

Active session manipulation and interaction.

OPTIONS:

    -K        Terminate all sessions
    -c &lt;opt&gt;  Run a command on the session given with -i, or all
    -d &lt;opt&gt;  Detach an interactive session
    -h        Help banner
    -i &lt;opt&gt;  Interact with the supplied session ID
    -k &lt;opt&gt;  Terminate session
    -l        List all active sessions
    -q        Quiet mode
    -r        Reset the ring buffer for the session given with -i, or all
    -s &lt;opt&gt;  Run a script on the session given with -i, or all
    -u &lt;opt&gt;  Upgrade a win32 shell to a meterpreter session
    -v        List verbose fields
</code></pre>
<!-- /wp:code -->

  O anda bulunan tüm session (oturum) listesini görmek için&nbsp;<code>-l</code>&nbsp;parametresini kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>3proxy<strong>)</strong> <strong>&gt;</strong> sessions -l

Active sessions
<strong>===============</strong>

  Id  Description    Tunnel
  --  -----------    ------
  1   Command shell  192.168.1.101:33191 -&gt; 192.168.1.104:4444
To interact with a given session, you just need to use the ‘-i’ switch followed by the Id number of the session.

msf exploit<strong>(</strong>3proxy<strong>)</strong> <strong>&gt;</strong> sessions -i 1
<strong>[</strong><strong>*</strong><strong>]</strong> Starting interaction with 1...

C:WINDOWSsystem32&gt;
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="set">set 
<!-- /wp:heading -->

  <code>set</code>&nbsp;komutu, seçtiğiniz ve&nbsp;<code>use</code>&nbsp;komutuyla aktif hale getirdiğiniz modülün ayarlanması gereken seçenek ve parametrelerini düzenlemek için kullanılır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>ms09_050_smb2_negotiate_func_index<strong>)</strong> <strong>&gt;</strong> set RHOST 172.16.194.134
RHOST <strong>=&gt;</strong> 172.16.194.134
msf auxiliary<strong>(</strong>ms09_050_smb2_negotiate_func_index<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>exploit/windows/smb/ms09_050_smb2_negotiate_func_index<strong>)</strong>:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST  172.16.194.134   yes       The target address
   RPORT  445              yes       The target port
   WAIT   180              yes       The number of seconds to wait <strong>for </strong>the attack to complete.

Exploit target:

   Id  Name
   --  ----
   0   Windows Vista SP1/SP2 and Server 2008 <strong>(</strong>x86<strong>)</strong>
</code></pre>
<!-- /wp:code -->

  <code>set</code>&nbsp;komutuyla gerekli ayarlamaları yapabileceğiniz gibi aktif olan modülün kullanabileceği&nbsp;<code>encoders</code>&nbsp;listesini de görmek isteyebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  exploit<strong>(</strong>ms09_050_smb2_negotiate_func_index<strong>)</strong> <strong>&gt;</strong> show encoders

Compatible Encoders
<strong>===================</strong>

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   generic/none                             normal     The "none" Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat<strong>(</strong>2<strong>)</strong>-based Context Keyed Payload Encoder
   x86/context_time                         manual     time<strong>(</strong>2<strong>)</strong>-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="unset">unset 
<!-- /wp:heading -->

  <code>set</code>&nbsp;komutunun tersidir ve bir önceki adımda ayarladığınız parametreyi iptal eder. Ayarladığınız tüm değişkenleri&nbsp;<code>unset all</code>&nbsp;komutuyla iptal edebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> set RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf <strong>&gt;</strong> set THREADS 50
THREADS <strong>=&gt;</strong> 50
msf <strong>&gt;</strong> set

Global
<strong>======</strong>

  Name     Value
  ----     -----
  RHOSTS   192.168.1.0/24
  THREADS  50

msf <strong>&gt;</strong> unset THREADS
Unsetting THREADS...
msf <strong>&gt;</strong> unset all
Flushing datastore...
msf <strong>&gt;</strong> set

Global
<strong>======</strong>

No entries <strong>in </strong>data store.

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="setg">setg 
<!-- /wp:heading -->

  Bir modül seçtiniz ve aktif hale getirdiniz. Muhtemelen o modülün RHOST değişkenini ayarlayacaksınız. Bunu&nbsp;<code>set RHOST</code>&nbsp;komutuyla yapabilirsiniz ancak farklı bir modüle geçtiğinizde RHOST değeriniz (Hedef IP) değişmemiş olsa bile önceki modülde yaptığınız ayar, yeni modüle taşınmaz. İşte&nbsp;<code>setg</code>&nbsp;komutuyla bir değişken ayarının, tüm modüllerde aktif halde, tekrar tekrar ayarlamaya gerek kalmadan kullanmanızı sağlar. Bu ayarı kullansanız da son olarak&nbsp;<code>show options</code>&nbsp;komutu ile kontrol yapmanızı tavsiye ediyoruz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> setg LHOST 192.168.1.101
LHOST <strong>=&gt;</strong> 192.168.1.101
msf <strong>&gt;</strong> setg RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf <strong>&gt;</strong> setg RHOST 192.168.1.136
RHOST <strong>=&gt;</strong> 192.168.1.136
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="save">save 
<!-- /wp:heading -->

  Tüm ayarlamaları yaptınız ve msfconsole dan çıkmak istiyorsunuz. Tekrar girdiğinizde, önceki ayarlarınızı tekrar kullanmak istiyorsanız&nbsp;<code>save</code>&nbsp;komutunu vererek kayıt edin. Bu sayede zamandan tasarruf edebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> save
Saved configuration to: /root/.msf4/config
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="show">show 
<!-- /wp:heading -->

  <code>show</code>&nbsp;komutunu hiçbir parametre vermeden kullanırsanız metasploit içerisindeki tüm modüllerin listesini görebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show

Encoders
<strong>========</strong>

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic <strong>${</strong>IFS<strong>}</strong> Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf<strong>(</strong>1<strong>)</strong> via PHP magic_quotes Utility Command Encoder
...snip...
</code></pre>
<!-- /wp:code -->

  <code>show</code>&nbsp;komutunu aşağıdaki formatlarda da kullanabilirsiniz.</p>
 

 
<h2 class="wp-block-heading" id="show-auxiliary">show auxiliary</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show auxiliary
Auxiliary
<strong>=========</strong>

   Name                                                  Disclosure Date  Rank    Description
   ----                                                  ---------------  ----    -----------
   admin/2wire/xslt_password_reset                       2007-08-15       normal  2Wire Cross-Site Request Forgery Password Reset Vulnerability
   admin/backupexec/dump                                                  normal  Veritas Backup Exec Windows Remote File Access
   admin/backupexec/registry                                              normal  Veritas Backup Exec Server Registry Access
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="show-exploits">show exploits</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show exploits

Exploits
<strong>========</strong>

   Name                                                           Disclosure Date  Rank       Description
   ----                                                           ---------------  ----       -----------
   aix/rpc_cmsd_opcode21                                          2009-10-07       great      AIX Calendar Manager Service Daemon <strong>(</strong>rpc.cmsd<strong>)</strong> Opcode 21 Buffer Overflow
   aix/rpc_ttdbserverd_realpath                                   2009-06-17       great      ToolTalk rpc.ttdbserverd _tt_internal_realpath Buffer Overflow <strong>(</strong>AIX<strong>)</strong>
   bsdi/softcart/mercantec_softcart                               2004-08-19       great      Mercantec SoftCart CGI Overflow
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="show-payloads">show payloads</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show payloads

Payloads
<strong>========</strong>

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   aix/ppc/shell_bind_tcp                                            normal  AIX Command Shell, Bind TCP Inline
   aix/ppc/shell_find_port                                           normal  AIX Command Shell, Find Port Inline
   aix/ppc/shell_interact                                            normal  AIX execve shell <strong>for </strong>inetd
...snip...
</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show payloads

Compatible Payloads
<strong>===================</strong>

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   generic/custom                                                    normal  Custom Payload
   generic/debug_trap                                                normal  Generic x86 Debug Trap
   generic/shell_bind_tcp                                            normal  Generic Command Shell, Bind TCP Inline
...snip...
</code></pre>
<!-- /wp:code -->

  <code>show options</code>&nbsp;komutu, aktif olan modülün seçeneklerini ve ayarlanabilecek değişkenlerini gösterir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST                     yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use <strong>(</strong>BROWSER, SRVSVC<strong>)</strong>

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting
</code></pre>
<!-- /wp:code -->

  Seçtiğiniz modülün hangi işletim sistemlerinde kullanabileceğinden emin değilseniz&nbsp;<code>show targets</code>&nbsp;komutunu kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show targets

Exploit targets:

   Id  Name
   --  ----
   0   Automatic Targeting
   1   Windows 2000 Universal
   10  Windows 2003 SP1 Japanese <strong>(</strong>NO NX<strong>)</strong>
   11  Windows 2003 SP2 English <strong>(</strong>NO NX<strong>)</strong>
   12  Windows 2003 SP2 English <strong>(</strong>NX<strong>)</strong>
...snip...
</code></pre>
<!-- /wp:code -->

  Modül hakkında en detaylı bilgiyi görmek için&nbsp;<code>show advanced</code>&nbsp;komutunu kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show advanced

Module advanced options:

   Name           : CHOST
   Current Setting:
   Description    : The local client address

   Name           : CPORT
   Current Setting:
   Description    : The local client port

...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="show-encoders">show encoders</h2>
<!-- /wp:heading -->

  Metasploit içerisindeki kullanabileceğiniz tüm encoder listesini görmek için&nbsp;<code>show encoders</code>&nbsp;komutunu kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show encoders
Compatible Encoders
<strong>===================</strong>

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic <strong>${</strong>IFS<strong>}</strong> Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf<strong>(</strong>1<strong>)</strong> via PHP magic_quotes Utility Command Encoder
   generic/none                             normal     The "none" Encoder
   mipsbe/longxor                           normal     XOR Encoder
   mipsle/longxor                           normal     XOR Encoder
   php/base64                               great      PHP Base64 encoder
   ppc/longxor                              normal     PPC LongXOR Encoder
   ppc/longxor_tag                          normal     PPC LongXOR Encoder
   sparc/longxor_tag                        normal     SPARC DWORD XOR Encoder
   x64/xor                                  normal     XOR Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat<strong>(</strong>2<strong>)</strong>-based Context Keyed Payload Encoder
   x86/context_time                         manual     time<strong>(</strong>2<strong>)</strong>-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="show-nops">show nops</h2>
<!-- /wp:heading -->

  NOP Generator denilen kod üreticilerinin listesini&nbsp;<code>show nops</code>&nbsp;komutu ile ile görebilirsiniz</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> show nops
NOP Generators
<strong>==============</strong>

   Name             Disclosure Date  Rank    Description
   ----             ---------------  ----    -----------
   armle/simple                      normal  Simple
   php/generic                       normal  PHP Nop Generator
   ppc/simple                        normal  Simple
   sparc/random                      normal  SPARC NOP generator
   tty/generic                       normal  TTY Nop Generator
   x64/simple                        normal  Simple
   x86/opty2                         normal  Opty2
   x86/single_byte                   normal  Single Byte
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="use">use 
<!-- /wp:heading -->

  Yaptığınız aramalar sonunda bir modülü kullanmaya karar verdiniz. İşte bu noktada&nbsp;<code>use</code>&nbsp;komutuyla modülü aktif hale getirebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use dos/windows/smb/ms09_001_write
msf auxiliary<strong>(</strong>ms09_001_write<strong>)</strong> <strong>&gt;</strong> show options

Module options:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST                   yes       The target address
   RPORT  445              yes       Set the SMB service port

msf auxiliary<strong>(</strong>ms09_001_write<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Herhangi bir çalışma esnasında bir komut ile yardım almak istediğinizde <code>help</code> komutunu kullanabilirsiniz.</p>
 

  Video Anlatım</p>
 

<!-- wp:embed {"url":"https://youtu.be/UOtw6CfPGlo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://youtu.be/UOtw6CfPGlo
</div></figure>
<!-- /wp:embed -->