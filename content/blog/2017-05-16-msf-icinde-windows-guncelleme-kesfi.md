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
 

  Bunun için kullanılan&nbsp;<code>post/windows/gather/enum_patches</code>&nbsp;modülünün kullanımına ait bir örneği aşağıda bulabilirsiniz. Modül, isminden de anlaşılacağı gibi bir&nbsp;***post exploitation*** &nbsp;modülüdür ve öncelikle hedef bilgisayarda bir&nbsp;<code>meterpreter</code>&nbsp;açık olmalıdır. 
 

  Aşağıdaki çıktıda,&nbsp;<code>use</code>&nbsp;komutu ile modül yüklenmiş ve seçenekleri görüntülenmiştir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** handler***)***  ***&gt;***  use post/windows/gather/enum_patches
msf post***(*** enum_patches***)***  ***&gt;***  show options

Module options ***(*** post/windows/gather/enum_patches***)*** :

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search ***for
   *** MSFLOCALS  true                  yes       Search ***for *** missing patchs ***for *** which there is a MSF local module
   SESSION                          yes       The session to run this module on.
</code></pre>
<!-- /wp:code -->

  Modül hakkında detaylı bilgileri&nbsp;<code>show advanced</code>&nbsp;komutuyla inceleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf post***(*** enum_patches***)***  ***&gt;***  show advanced

Module advanced options ***(*** post/windows/gather/enum_patches***)*** :

   Name           : VERBOSE
   Current Setting: true
   Description    : Enable detailed status messages

   Name           : WORKSPACE
   Current Setting: 
   Description    : Specify the workspace ***for *** this module
</code></pre>
<!-- /wp:code -->

  Bir&nbsp;<code>exploit</code>&nbsp;kullanarak Windows işletim sistemin Meterpreter shell açtıktan sonra oturumu arka plana gönderin ve&nbsp;<code>use</code>&nbsp;komutuyla&nbsp;<code>enum_patches</code>&nbsp;modülünü yükleyin. Aşağıdaki&nbsp;<code>show options</code>&nbsp;komutundaki çıktıda bulunan&nbsp;<code>SESSION</code>&nbsp;değişkeni, arka plana gönderdiğimiz meterpreter shell in oturum numarası olmalıdır. Arka plandaki oturumları&nbsp;<code>sessions -l</code>&nbsp;komutu ile görebilirsiniz. Gerekli kontrolleri yaptıktan sonra&nbsp;<code>run</code>&nbsp;komutunu verdiğinizde Windows bilgisayarın hangi güncellemeleri yapıp yapmadığını görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf post***(*** enum_patches***)***  ***&gt;***  show options

Module options ***(*** post/windows/gather/enum_patches***)*** :

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search ***for
   *** MSFLOCALS  true                  yes       Search ***for *** missing patchs ***for *** which there is a MSF local module
   SESSION    1                     yes       The session to run this module on.

msf post***(*** enum_patches***)***  ***&gt;***  run

***[*** ******* ***]***  KB2871997 applied
***[*** +] KB2928120 is missing
***[*** +] KB977165 - Possibly vulnerable to MS10-015 kitrap0d ***if *** Windows 2K SP4 - Windows 7 ***(*** x86***)*** 
***[*** ******* ***]***  KB2305420 applied
***[*** +] KB2592799 - Possibly vulnerable to MS11-080 afdjoinleaf ***if *** XP SP2/SP3 Win 2k3 SP2
***[*** +] KB2778930 - Possibly vulnerable to MS13-005 hwnd_broadcast, elevates from Low to Medium integrity
***[*** +] KB2850851 - Possibly vulnerable to MS13-053 schlamperei ***if *** x86 Win7 SP0/SP1
***[*** +] KB2870008 - Possibly vulnerable to MS13-081 track_popup_menu ***if *** x86 Windows 7 SP0/SP1
***[*** ******* ***]***  Post module execution completed
</code></pre>
<!-- /wp:code -->

  Yukarıda görüldüğü gibi başında [+] işareti bulunan güncellemelerin sistemde yapılmadığı rapor edilmektedir. 
 