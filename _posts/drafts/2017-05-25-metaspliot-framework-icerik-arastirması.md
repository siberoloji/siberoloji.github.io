---
title: MSF İçerik Araştırması
layout: post
date:  2017-05-25 09:11:06.000000000 +02:00
type: post
author: siberoloji
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework client exploit
- msf client side exploit
excerpt: Bu yazımızda, Metasplot Framework kullanarak İstemci tarafı exploit olarak
  bir PDF dosyası oluşturmayı göreceğiz. Oluşturulan PDF, görünürde zararsız olsa
  da içerisine zararlı kodlar gömülebilir.
---

Searching for Content
Information leakage is one of the largest threats that corporations face and much of it can be prevented by educating users to properly secure their data. Users being users though, will frequently save data to their local workstations instead of on the corporate servers where there is greater control.

Meterpreter has a search function that will, by default, scour all drives of the compromised computer looking for files of your choosing.

meterpreter > search -h
Usage: search [-d dir] [-r recurse] -f pattern
Search for files.

OPTIONS:

    -d   The directory/drive to begin searching from. Leave empty to search all drives. (Default: )
    -f   The file pattern glob to search for. (e.g. *secret*.doc?)
    -h        Help Banner.
    -r   Recursivly search sub directories. (Default: true)
To run a search for all jpeg files on the computer, simply run the search command with the ‘-f’ switch and tell it what filetype to look for.

meterpreter > search -f *.jpg
Found 418 results...
...snip...
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Blue hills.jpg (28521 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg (71189 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Water lilies.jpg (83794 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Winter.jpg (105542 bytes)
...snip...
Searching an entire computer can take a great deal of time and there is a chance that an observant user might notice their hard drive thrashing constantly. We can reduce the search time by pointing it at a starting directory and letting it run.

meterpreter > search -d c:\\documents\ and\ settings\\administrator\\desktop\\ -f *.pdf
Found 2 results...
    c:\documents and settings\administrator\desktop\operations_plan.pdf (244066 bytes)
    c:\documents and settings\administrator\desktop\budget.pdf (244066 bytes)
meterpreter >
By running the search this way, you will notice a huge speed increase in the time it takes to complete.