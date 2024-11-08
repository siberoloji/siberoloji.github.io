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
date: "2017-05-16T13:01:00Z"
excerpt: Metasploit Framework içerisinden bir Windows işletim sistemine Meterpreter
  shell açtığınızda, işletim sisteminin hangi güncellemeleri ve yamaları yaptığını,
  hangilerini yapmadığını keşfetmek isteyebilirsiniz.
guid: https://www.siberoloji.com/?p=1161
id: 1161
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Windows Güncelleme Keşfi
url: /tr/msf-icinde-windows-guncelleme-kesfi/
---

  Metasploit Framework içerisinden bir Windows işletim sistemine Meterpreter shell açtığınızda, işletim sisteminin hangi güncellemeleri ve yamaları yaptığını, hangilerini yapmadığını keşfetmek isteyebilirsiniz. 
 

  Bunun için kullanılan&nbsp;<code>post/windows/gather/enum_patches</code>&nbsp;modülünün kullanımına ait bir örneği aşağıda bulabilirsiniz. Modül, isminden de anlaşılacağı gibi bir&nbsp;<strong>post exploitation</strong>&nbsp;modülüdür ve öncelikle hedef bilgisayarda bir&nbsp;<code>meterpreter</code>&nbsp;açık olmalıdır. 
 

  Aşağıdaki çıktıda,&nbsp;<code>use</code>&nbsp;komutu ile modül yüklenmiş ve seçenekleri görüntülenmiştir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> use post/windows/gather/enum_patches
msf post<strong>(</strong>enum_patches<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>post/windows/gather/enum_patches<strong>)</strong>:

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search <strong>for
   </strong>MSFLOCALS  true                  yes       Search <strong>for </strong>missing patchs <strong>for </strong>which there is a MSF local module
   SESSION                          yes       The session to run this module on.
</code></pre>
<!-- /wp:code -->

  Modül hakkında detaylı bilgileri&nbsp;<code>show advanced</code>&nbsp;komutuyla inceleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf post<strong>(</strong>enum_patches<strong>)</strong> <strong>&gt;</strong> show advanced

Module advanced options <strong>(</strong>post/windows/gather/enum_patches<strong>)</strong>:

   Name           : VERBOSE
   Current Setting: true
   Description    : Enable detailed status messages

   Name           : WORKSPACE
   Current Setting: 
   Description    : Specify the workspace <strong>for </strong>this module
</code></pre>
<!-- /wp:code -->

  Bir&nbsp;<code>exploit</code>&nbsp;kullanarak Windows işletim sistemin Meterpreter shell açtıktan sonra oturumu arka plana gönderin ve&nbsp;<code>use</code>&nbsp;komutuyla&nbsp;<code>enum_patches</code>&nbsp;modülünü yükleyin. Aşağıdaki&nbsp;<code>show options</code>&nbsp;komutundaki çıktıda bulunan&nbsp;<code>SESSION</code>&nbsp;değişkeni, arka plana gönderdiğimiz meterpreter shell in oturum numarası olmalıdır. Arka plandaki oturumları&nbsp;<code>sessions -l</code>&nbsp;komutu ile görebilirsiniz. Gerekli kontrolleri yaptıktan sonra&nbsp;<code>run</code>&nbsp;komutunu verdiğinizde Windows bilgisayarın hangi güncellemeleri yapıp yapmadığını görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf post<strong>(</strong>enum_patches<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>post/windows/gather/enum_patches<strong>)</strong>:

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search <strong>for
   </strong>MSFLOCALS  true                  yes       Search <strong>for </strong>missing patchs <strong>for </strong>which there is a MSF local module
   SESSION    1                     yes       The session to run this module on.

msf post<strong>(</strong>enum_patches<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> KB2871997 applied
<strong>[</strong>+] KB2928120 is missing
<strong>[</strong>+] KB977165 - Possibly vulnerable to MS10-015 kitrap0d <strong>if </strong>Windows 2K SP4 - Windows 7 <strong>(</strong>x86<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> KB2305420 applied
<strong>[</strong>+] KB2592799 - Possibly vulnerable to MS11-080 afdjoinleaf <strong>if </strong>XP SP2/SP3 Win 2k3 SP2
<strong>[</strong>+] KB2778930 - Possibly vulnerable to MS13-005 hwnd_broadcast, elevates from Low to Medium integrity
<strong>[</strong>+] KB2850851 - Possibly vulnerable to MS13-053 schlamperei <strong>if </strong>x86 Win7 SP0/SP1
<strong>[</strong>+] KB2870008 - Possibly vulnerable to MS13-081 track_popup_menu <strong>if </strong>x86 Windows 7 SP0/SP1
<strong>[</strong><strong>*</strong><strong>]</strong> Post module execution completed
</code></pre>
<!-- /wp:code -->

  Yukarıda görüldüğü gibi başında [+] işareti bulunan güncellemelerin sistemde yapılmadığı rapor edilmektedir. 
 