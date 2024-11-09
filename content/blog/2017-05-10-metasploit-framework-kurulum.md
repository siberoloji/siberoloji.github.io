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
date: "2017-05-10T02:09:00Z"
excerpt: Metasploit Framework Kali vb. dağıtımlarda kurulu olarak gelmektedir. Kali
  kullanmıyor olsanız bile kendi Linux dağıtımınıza kurulum yapabilisiniz. Bu yazıda
  Community sürümü olan ve komut satırından çalışan ücretsiz sürümü kurmayı inceleyeceğiz.
  Anlatımda kullanılan komutların Ubuntu temelli tüm dağıtımlarda çalışacağı tahmin
  edilmektedir. Biz testlerimizi ve denemeyi Linux Mint 18.1 Cinnamon Linux dağıtımında
  gerçekleştirdik.
guid: https://www.siberoloji.com/?p=1131
id: 1131
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
- siber güvenlik
title: Metasploit Framework Kurulum
url: /tr/metasploit-framework-kurulum/
---

  Metasploit Framework sızma testlerinde ve güvenlik testlerinde kullanılan bir yazılımdır. Rapid7 firması tarafından geliştirilen yazılımın Pro sürümü, ücretli olarak dağıtılmakta ve görsel arayüz desteği bulunmaktadır. 
 

  Metasploit Framework Kali vb. dağıtımlarda kurulu olarak gelmektedir. Kali kullanmıyor olsanız bile kendi Linux dağıtımınıza kurulum yapabilisiniz. Bu yazıda Community sürümü olan ve komut satırından çalışan ücretsiz sürümü kurmayı inceleyeceğiz. Anlatımda kullanılan komutların Ubuntu temelli tüm dağıtımlarda çalışacağı tahmin edilmektedir. Biz testlerimizi ve denemeyi Linux Mint 18.1 Cinnamon Linux dağıtımında gerçekleştirdik. 
 


<h3 class="wp-block-heading" id="linux-mint-güncelleyelim">Linux Mint Güncelleyelim:
<!-- /wp:heading -->

  Aşağıdaki komutlar ile Linux güncelenecek ve tekrar başlatılacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get update ***&amp;&amp;***  sudo apt-get dist-upgrade -y
reboot
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="msf-framework-kuralım">MSF Framework Kuralım:
<!-- /wp:heading -->

  Rapid7 tarafından sağlanan aşağıdaki kurulum script kodları gerekli tüm işlemleri yapacaktır. 
 

  ***!!!*** &nbsp;Bu tür script kodları güvenli olmayan kaynaklardan indirmeniz tavsiye edilmez. 
 

  Aşağıdaki komut root yetkileriyle çalıştırılmalıdır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd
sudo su
curl <a href="https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb">https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb</a> ***&gt;***  msfinstall ***&amp;&amp;***  \
  chmod 755 msfinstall ***&amp;&amp;***  \
  ./msfinstall
</code></pre>
<!-- /wp:code -->

  İşlem başladığında ekran aşağıdaki gibi devam edecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5394  100  5394    0     0   9248      0 --:--:-- --:--:-- --:--:--  9252
Updating package cache..OK
Checking ***for *** and installing update..
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  metasploit-framework
0 upgraded, 1 newly installed, 0 to remove and 1 not upgraded.
Need to get 176 MB of archives.
After this operation, 431 MB of additional disk space will be used.
Get:1 <a href="http://downloads.metasploit.com/data/...[176">http://downloads.metasploit.com/data/...[176</a> MB]

</code></pre>
<!-- /wp:code -->

  Yukarıdaki komut, Rapid7 APT Deposunu sisteme ekleyecek ve gerekli paketleri yükleyecektir. 
 

  Kurulumdan sonra&nbsp;<code>exit</code>&nbsp;komutuyla root yetkilerinden normal kullanıcı yetkilerine dönün. Komut satırındaki # işareti $ şekline dönmelidir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">umut-X550JX umut <em># exit</em>
umut@umut-X550JX ~ $
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="i̇lk-çalıştırma">İlk çalıştırma:
<!-- /wp:heading -->

  Komut satırında&nbsp;<code>msfconsole</code>&nbsp;komutunu çalıştırın ve veri tabanı oluşturun:&nbsp;***Would you like to use and setup a new database (recommended)?*** &nbsp;sorusunu&nbsp;<code>yes</code>&nbsp;olarak cevaplayın. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">user@mint ~ $ msfconsole

 

  ********  Welcome to Metasploit Framework Initial Setup ******** 

     Please answer a few questions to get started.

 Would you like to use and setup a new database ***(*** recommended***)*** ? yes

 Creating database at /home/user/.msf4/db

 Starting database at /home/user/.msf4/db

 Creating database users

 Creating initial database schema

 

  ********  Metasploit Framework Initial Setup Complete ******** 

</code></pre>
<!-- /wp:code -->

  İşler yolunda gitmişse (ki eminim gidecektir) aşağıdaki örneğe benzer bir ekran sizi karşılayacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">                                                  
     ,           ,
    /             \
   ***((*** __---,,,---__***))*** 
      ***(*** _***)***  O O ***(*** _***)*** _________
         \ _ /            |\
          o_o \   M S F   | \
               \   _____  |  ******* 
                ***||*** |   WW|||
                ***||*** |     ***||*** |


       ***=[***  metasploit v4.14.17-dev-                        ***]*** 
+ -- --***=[***  1647 exploits - 945 auxiliary - 291 post        ***]*** 
+ -- --***=[***  486 payloads - 40 encoders - 9 nops             ***]*** 
+ -- --***=[***  Free Metasploit Pro trial: <a href="http://r-7.co/trymsp">http://r-7.co/trymsp</a> ***]*** 

msf ***&gt;***  
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="veri-tabanına-bağlantıyı-kontrol-edelim">Veri tabanına bağlantıyı kontrol edelim.
<!-- /wp:heading -->

  <code>msfdb status</code>&nbsp;komutu ile veri tabanı bağlantısını kontrol edebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  msfdb status
***[*** ******* ***]***  exec: msfdb status

Database started at /home/umut/.msf4/db
msf ***&gt;***  
</code></pre>
<!-- /wp:code -->

  Birkaç dakika içerisinde veri tabanı exploit indeksini oluşturacaktır. Ardından&nbsp;<code>search</code>&nbsp;komutuyla exploit aramasını daha hızlı yapabileceksiniz. 
 

  Örneğin, samba ile ilgili bir exploit arayacaksanız aşağıdaki&nbsp;<code>search samba</code>komutu işinize yarayabilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  search samba

Matching Modules
***================*** 

   Name                                            Disclosure Date  Rank       Description
   ----                                            ---------------  ----       -----------
   auxiliary/admin/smb/samba_symlink_traversal                      normal     Samba Symlink Directory Traversal
   auxiliary/dos/samba/lsa_addprivs_heap                            normal     Samba lsa_io_privilege_set Heap Overflow
   auxiliary/dos/samba/lsa_transnames_heap                          normal     Samba lsa_io_trans_names Heap Overflow
   auxiliary/dos/samba/read_nttrans_ea_list                         normal     Samba read_nttrans_ea_list Integer Overflow
   auxiliary/scanner/rsync/modules_list                             normal     List Rsync Modules
   auxiliary/scanner/smb/smb_uninit_cred                            normal     Samba _netr_ServerPasswordSet Uninitialized Credential State
   exploit/freebsd/samba/trans2open                2003-04-07       great      Samba trans2open Overflow ***(*** ******* BSD x86***)*** 
   exploit/linux/samba/chain_reply                 2010-06-16       good       Samba chain_reply Memory Corruption ***(*** Linux x86***)*** 
   exploit/linux/samba/lsa_transnames_heap         2007-05-14       good       Samba lsa_io_trans_names Heap Overflow
   exploit/linux/samba/setinfopolicy_heap          2012-04-10       normal     Samba SetInformationPolicy AuditEventsInfo Heap Overflow
   exploit/linux/samba/trans2open                  2003-04-07       great      Samba trans2open Overflow ***(*** Linux x86***)*** 
   exploit/multi/samba/nttrans                     2003-04-07       average    Samba 2.2.2 - 2.2.6 nttrans Buffer Overflow
   exploit/multi/samba/usermap_script              2007-05-14       excellent  Samba "username map script" Command Execution
   exploit/osx/samba/lsa_transnames_heap           2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/osx/samba/trans2open                    2003-04-07       great      Samba trans2open Overflow ***(*** Mac OS X PPC***)*** 
   exploit/solaris/samba/lsa_transnames_heap       2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/solaris/samba/trans2open                2003-04-07       great      Samba trans2open Overflow ***(*** Solaris SPARC***)*** 
   exploit/unix/misc/distcc_exec                   2002-02-01       excellent  DistCC Daemon Command Execution
   exploit/unix/webapp/citrix_access_gateway_exec  2010-12-21       excellent  Citrix Access Gateway Command Execution
   exploit/windows/fileformat/ms14_060_sandworm    2014-10-14       excellent  MS14-060 Microsoft Windows OLE Package Manager Code Execution
   exploit/windows/http/sambar6_search_results     2003-06-21       normal     Sambar 6 Search Results Buffer Overflow
   exploit/windows/license/calicclnt_getconfig     2005-03-02       average    Computer Associates License Client GETCONFIG Overflow
   exploit/windows/smb/group_policy_startup        2015-01-26       manual     Group Policy Script Execution From Shared Resource
   post/linux/gather/enum_configs                                   normal     Linux Gather Configurations

</code></pre>
<!-- /wp:code -->

  Metasploit Framework çok sık güncelleme almaktadır. Paket deposu sisteminize eklendiğinden<code>apt update</code>ile veya msfconsole içerisinden<code>msfupdate</code>komutu ile güncelleyebilirsiniz. 
 

<!-- wp:embed {"url":"https://youtu.be/FZvrukt9B-c?si=SWDikQ-DR0E34dDk","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://youtu.be/FZvrukt9B-c?si=SWDikQ-DR0E34dDk
</div></figure>
<!-- /wp:embed -->