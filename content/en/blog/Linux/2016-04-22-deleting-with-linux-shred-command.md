---
draft: false

title:  'Deleting with Linux Shred Command'
date: '2016-04-22T23:36:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /deleting-with-linux-shred-command/
 
featured_image: /images/linux2.png
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - 'linux how-to'
---


Did you know that the deletion process used in Linux and other operating systems does not actually delete your files? This article, in which we try to explain the subject a little, may be of interest to you.



1. If you use visual interface, you surely know the expressions Recycle Bin, Trash or Trash. You right-click on the file in the desktop environment and select one of the DELETE-Send to Trash options.



2. Depending on your Operating System, there may also be a method to delete the file without sending it to the Trash (Shift+Delete).



3. You can also delete from the command line with the rm command (Note: Deleting from the command line is irreversible)



No matter which of the methods mentioned above you apply, your files will not be physically deleted from where they are written on the disk space. Only the information that those addresses are empty is coded into your operating system's location catalog. Therefore, it becomes writable. In fact, the data you thought you deleted is still on your disk. Whenever new information is found on the disk, it is overwritten. So, how can truly permanent deletion be done?



There is a shred command that comes pre-installed with Linux to perform this operation. The shred command performs the deletion process by going to the addresses on the disk itself. It writes random data bits to the addresses where the file is located, according to the rules you will write to the command parameters. It shreds the file, scrambles it, and makes it irreversible by writing 10-20-30 or more new random data on it. The reason why this operation is not normally used is that the lifespan of the disk will be shortened when you write more data than necessary to the disk.



Now let's see with an example how the shred command deletes a file.


```bash
shred -vuf --iterations=32 systemctl.xls
```



In our example, there is a file named systemctl.xls, 10752 bytes long. For this file, the parameters -v (verbose), -u (remove), -f (force) were given and the process (iterations) was requested to be repeated 32 times. Here;



-v (verbose): The operation is required to be shown on the screen.



-u (remove): After deletion, the file is requested to be split and then deleted with the rm command. If the -u parameter is not used, the file name continues to appear in the system even though the file is overwritten. Only its content cannot be read.



-f (force): This parameter allows changing permissions even if the file is protected against deletion.


```bash
linux@user:~/Desktop/knife$ ls -al
total 20
drwxrwxr-x 2 siber adam 4096 Haz 28 02:21 .
drwxr-xr-x 11 siber adam 4096 Haz 28 02:04 ..
-rw-rw-r-- 1 siber adam 10752 May 9 02:10 systemctl.xls
linux@user:~/Desktop/knife$ shred -vuf --iterations=32 systemctl.xls
shred: systemctl.xls: pass 1/32 (random)...
shred: systemctl.xls: pass 2/32 (924924)...
shred: systemctl.xls: pass 3/32 (db6db6)...
shred: systemctl.xls: pass 4/32 (ffffff)...
shred: systemctl.xls: pass 5/32 (444444)...
shred: systemctl.xls: pass 6/32 (555555)...
shred: systemctl.xls: pass 7/32 (888888)...
shred: systemctl.xls: pass 8/32 (7fffff)...
shred: systemctl.xls: pass 9/32 (222222)...
shred: systemctl.xls: pass 10/32 (00e00e)...
shred: systemctl.xls: pass 11/32 (bbbbbb)...
shred: systemctl.xls: pass 12/32 (random)...
shred: systemctl.xls: pass 13/32 (a49249)...
shred: systemctl.xls: pass 14/32 (777777)...
shred: systemctl.xls: pass 15/32 (999999)...
shred: systemctl.xls: pass 16/32 (111111)...
shred: systemctl.xls: pass 17/32 (6db6db)...
shred: systemctl.xls: pass 18/32 (cccccc)...
shred: systemctl.xls: pass 19/32 (124924)...
shred: systemctl.xls: pass 20/32 (249249)...
shred: systemctl.xls: pass 21/32 (333333)...
shred: systemctl.xls: pass 22/32 (random)...
shred: systemctl.xls: pass 23/32 (dddddd)...
shred: systemctl.xls: pass 24/32 (666666)...
shred: systemctl.xls: pass 25/32 (800000)...
shred: systemctl.xls: pass 26/32 (aaaaaa)...
shred: systemctl.xls: pass 27/32 (000000)...
shred: systemctl.xls: pass 28/32 (492492)...
shred: systemctl.xls: pass 29/32 (b6db6d)...
shred: systemctl.xls: pass 30/32 (eeeeee)...
shred: systemctl.xls: pass 31/32 (c44444)...
shred: systemctl.xls: pass 32/32 (random)...
shred: systemctl.xls: removing
shred: systemctl.xls: renamed to 0000000000000
shred: 0000000000000: renamed to 000000000000
shred: 000000000000: renamed to 00000000000
shred: 00000000000: renamed to 0000000000
shred: 0000000000: renamed to 000000000
shred: 000000000: renamed to 00000000
shred: 00000000: renamed to 0000000
shred: 0000000: renamed to 000000
shred: 000000: renamed to 00000
shred: 00000: renamed to 0000
shred: 0000: renamed to 000
shred: 000: renamed to 00
shred: 00: renamed to 0
shred: systemctl.xls: removed
```



With this command and parameters, the file is deleted from your disk quite permanently.
