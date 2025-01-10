---
draft: false
title: MSF İçinde Kendi Tarayıcınızı Yazma
weight: 100
translationKey:: creation-of-your-own-scanner
date: 2017-05-16T12:58:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.
url: /tr/msf-icinde-kendi-tarayicinizi-yazma/
featured_image: /images/metasploit.jpg
categories:
        - Metasploit Framework
tags:
        - cybersecurity
        - metasploit framework
linkTitle: Kendi Tarayıcınızı Yazma
keywords:
        - exploit
---
Bazen yapmak istediğiniz işleme tam olarak uyan bir modül bulamazsınız. 2-3 farklı modülün yaptığı işlemleri tek modülde toplamak istersiniz. Örneğin, evinizdeki ağınızı zafiyetlere karşı taramak ve kayıt altına almak isteyebilirsiniz. Metasploit Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.

Programlama diliyle söyleyecek olursak, Metasploit Framework içinde kullanılan bütün sınıflara (class) erişim ve kullanım imkanınız bulunmaktadır.

## Tarayıcıların bazı özellikleri

* Tüm exploit sınıf ve modüllerine erişim sağlarlar.

* Proxy, SSL ve raporlama desteği bulunur.

* Tarayıcı için THREAD yönetimi ve istenen aralıkta tarama desteği

* Yazması ve çalıştırması çok kolaydır.

Yazması ve çalıştırması kolay dense de kodlama biliyor olmanız size çok zaman kazandıracaktır. Bunu da ifade edelim. Aşağıdaki örnekte, TCP Exploit Modülü, `include` komutu ile sisteme dahil edilmekte ve bu modülün TCP bağlantı değişkenleri, istenen IP adresine bağlanmak için kullanılmaktadır. 12345 Portuna bağlantı sağlandıktan sonra sunucuya “HELLO SERVE” mesajı gönderilmektedir. Son olarak da sunucunun verdiği cevap ekrana yazdırılmaktadır.

```bash
require 'msf/core'
class Metasploit3 < Msf::Auxiliary
        include Msf::Exploit::Remote::Tcp
        include Msf::Auxiliary::Scanner
        def initialize
                super(
                        'Name'           => 'My custom TCP scan',
                        'Version'        => '$Revision: 1 $',
                        'Description'    => 'My quick scanner',
                        'Author'         => 'Your name here',
                        'License'        => MSF_LICENSE
                )
                register_options(
                        **[**
                                Opt::RPORT(12345)
                        **]**, self.class)
        end

        def run_host(ip)
                connect**()**
      greeting **=** "HELLO SERVER" 
      sock.puts(greeting)
                data **=** sock.recv(1024)
                print_status("Received: #{data} from #{ip}")
                disconnect**()**
        end
end
```

## Yazdığınız Tarayıcıyı Kaydetme

Yazdığınız tarayıcıyı doğru yere kaydetmelisiniz. `msfconsole` başlarken modüller `./modules/auxuliary/scanner` klasöründen yüklenirler. O zaman yeni yazdığımız modülü `./modules/auxiliary/scanner/http/` klsörünün için simple_tcp.rb dosya adıyla Ruby uzantılı kayıt etmeliyiz. Ayrıntılı bilgi için [Metasploit Temel Komutlar -loadpath-](/tr/metasploit-framework-temel-komutlar/#loadpath) başlığını okuyabilirsiniz.

Deneyeceğimiz tarayıcı modülün mesajını yakalamak için `netcat` dinleme oturumu açabilirsiniz.

```bash
root@kali:~# nc -lnvp 12345 < response.txt
listening on **[**any] 12345 ...
```

Ardından yeni modülü seçip RHOST değişkenini ayarlıyoruz ve modülü çalıştırıyoruz.

```bash
msf > use scanner/simple_tcp
msf auxiliary(simple_tcp) > set RHOSTS 192.168.1.100
RHOSTS => 192.168.1.100
msf auxiliary(simple_tcp) > run

> Received: hello metasploit from 192.168.1.100
> Auxiliary module execution completed
```

Detaylı kullanım örnekleri için Metasploit içerisinde bulunan modülleri incelemeniz tavsiye ediyorum.

## Sonuçları Kaydetme

Raporlama metodu `report_*()` kullanıcıya aşağıdaki imkanları sunar. Bunun için veri tabanı kullanıyor olmalısınız.

* Veri tabanı bağlantısı olup olmadığını kontrol eder.

* Çift kayıt olup olmadığını kontrol eder.

* Bulunan bir kaydı tabloya yazar.

report.*() metodunu kullanmak için aşağıdaki `include` satırını tarayıcı dosyanıza dahil etmelisiniz.

```bash
include Msf::Auxiliary::Report
```

Son olarak report_note() metodunu kullanabilirsiniz.

```bash
report_note()
:host => rhost,
:type => "myscanner_password",
:data => data
```
