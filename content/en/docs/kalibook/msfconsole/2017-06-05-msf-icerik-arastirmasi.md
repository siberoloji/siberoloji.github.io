---
draft: false
title: MSF Content Research
linkTitle: Content Research
translationKey: msf-content-research
weight: 260
date: 2017-06-05T13:40:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: One of the things to do after opening a meterpreter shell on the target computer is to research the files on the computer.
url: /msf-content-research/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Content Search

After opening the meterpreter shell on the target computer, one of the operations to be performed is to search the files on the computer. Companies train their users to ensure the security of their information. One of the subjects of this training is to keep sensitive information on local computers rather than on shared servers. Content search is generally performed to discover files and folders containing such sensitive information.

Let's examine a few examples of the `search` command provided by the meterpreter session.

You can view help information about search with the `search -h` command.

```bash
meterpreter > search -h
Usage: search [-d dir] [-r recurse] -f pattern
Search for **files.

OPTIONS:

-d The directory/drive to begin searching from. Leave empty to search all drives. (Default: )
-f The file pattern glob to search for**. (e.g. *****secret*****.doc?)
-h Help Banner.
-r Recursivly search sub directories. (Default: true)
```

## Comments

`-d`: Specifies the folder to search. If left blank, all folders will be searched.

`-f`: Used to specify a specific file pattern.

`-h`: Displays help.

`-r`: The search is performed in the specified folder and all its subfolders. It is already active by default.

The following example command will search for files with the extension `.jpg` in all partitions, folders and subfolders.

```bash
meterpreter > search -f *****.jpg
Found 418 results...
...snip...
c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Blue hills.jpg (28521 bytes)
c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg (71189 bytes)
c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Water lilies.jpg (83794 bytes)
c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Winter.jpg (105542 bytes)
...snip...
```

The `search` command searches all folders by default, but this can take a long time. The target computer user may also notice that their computer is slowing down. Therefore, specifying the folder to search using the `-d` option saves time and reduces the system's processing load. You can see an example of this usage below. Note that we entered the folder separator as `\\` when entering the command.

```bash
meterpreter > search -d c:\\documents\ and\ settings\\administrator\\desktop\\ -f *****.pdf
Found 2 results...
c:\documents and settings\administrator\desktop\operations_plan.pdf (244066 bytes)
c:\documents and settings\administrator\desktop\budget.pdf (244066 bytes)
meterpreter >
```
