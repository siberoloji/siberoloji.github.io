---
draft: false
title: Metasploit Framework Basics
date: 2017-05-11T02:13:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: I wanted to take a look at the basic information and commands you may need to use the Metasploit Framework effectively and at full capacity.
url: /metasploit-framework-basics/
translationKey:: metasploit-framework-basics
featured_image: /images/metasploit.jpg
weight: 20
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
I wanted to take a look at the basic information and commands you may need to use the Metasploit Framework effectively and at full capacity. Instead of rushing and going fast, let's first see the basic information that will make our job easier.

## Architecture and Libraries

![MSF Hierarchy](/images/msfarch.png)

Metasploit consists of the elements briefly shown in the architecture diagram you see above. Let's briefly introduce these basic elements

### Rex

It is the most basic starting library for Metasploit. It is the center where socket, protocol, SSL, SMB, HTTP, XOR, Base64, Unicode operations are performed.

### Msf::Core

The Core layer, built on the Rex library, is the part where settings that allow external modules and plugins to be added are managed. It provides the basic API. This is the Framework we call the Framework.

### Msf::Base

This layer is the part where the basic APIs are simplified even more.

### Msf::GUI

This is the part that the user sees. The parts where the interface and commands are entered are located here.

## File system

###  MSF Files

The MSF file system is designed to make the user's job easier and the folders are meaningful. If you are going to use a program, knowing the file system and what is in which folder is very important for the beginning. If you have installed the Metasploit Framework software on your Linux operating system via your distribution's software center, you can find the necessary folders in `/usr/share`. If you downloaded and installed it as a Debian package, you can find it in the `/opt/metasploit-framework/` folder.

Let's see what information some of the main folders contain.

* data: Files used and modified by Metasploit are in this folder.

* documentation: Help and explanation documents about MSF are in this folder.

* external: Source codes and 3rd party libraries are in this folder.

* lib: Main libraries used by MSF are in this folder.

* modules: Modules in the index when MSF is loaded are in this folder.

* plugins: Plugins to be loaded when the program starts are here.

* scripts: Meterpreter and other script codes are in this folder.

* tools: There are various command line tools.

## Modules and Their Locations

### Modules

Metasploit Framework is made up of modules. What are these modules in short?

* Payload: Script codes designed to work on the opposite system are called Payload.

* Exploits: Modules that use Payload are called exploits.

* Auxiliary: Modules that do not use Payload are called Auxiliary modules.

* Encoders: Modules that ensure that Payload scripts are sent to the opposite party and are delivered.

* Nops: Modules that ensure that Payload scripts work continuously and healthily.

## Where Are the Modules?

Let's look at the folder where the modules, which we can divide into two as basic modules and user modules, are located.

### Basic Modules

The modules that are installed and ready every time MSF is loaded are located in the `/usr/share/metasploit-framework/modules/` folder we mentioned above or in `/opt/metasploit-framework/modules/`. Windows users can also look in the Program Files folder.

### User Modules

The greatest opportunity Metasploit provides to the user is the ability to include their own modules in the framework. You have written or downloaded a script that you want to use. These codes are called user modules and are kept in a hidden folder with a dot at the beginning in the user's home folder. Its exact address is `~/.msf4/modules/`. ~ means home folder. You can activate the "Show Hidden Files" option to see the folder in the file manager.

### Introducing user modules to the system

MSF offers the user the opportunity to load their own additional modules when starting or after starting. Let's see how this is done when starting and after starting.

In both methods explained below, the folder addresses you will give to the commands must contain folders that comply with the msf naming convention. For example, if you want to load an exploit from the `~/.msf4/modules/` folder, that exploit must be in the `~/.msf4/modules/exploit/` folder.

You can learn the exact names of the folders and the naming template from the folder your program is installed in. The sample output for my computer is in the folder structure below.

```bash
umut@umut-X550JX /opt/metasploit-framework/embedded/framework/modules $ ls -l
total 24
drwxr-xr-x 20 root root 4096 May 10 14:46 auxiliary
drwxr-xr-x 11 root root 4096 May 10 14:46 encoders
drwxr-xr-x 19 root root 4096 May 10 14:46 exploits
drwxr-xr-x 10 root root 4096 May 10 14:46 nops
drwxr-xr-x  5 root root 4096 May 10 14:46 payloads
drwxr-xr-x 12 root root 4096 May 10 14:46 post
```

#### Getting user Loading modules

As we mentioned above, user modules were in the `~/.msf4/modules/` folder. When we tell this folder to the msfconsole command, additional modules are loaded and the system starts like that. We can do this with the `-m` parameter as seen in the command below.

```bash
umut@umut-X550JX ~ $ msfconsole -m ~/.msf4/modules/
Found a database at /home/umut/.msf4/db, checking to see **if **it is started
Starting database at /home/umut/.msf4/db...success
%%%%%%%%%%%%%%%%%%%%%%%%%%% Hacked: All the things %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                        Press SPACE BAR to **continue**



       **=[** metasploit v4.14.17-dev-                        **]**
+ -- --**=[** 1648 exploits - 946 auxiliary - 291 post        **]**
+ -- --**=[** 486 payloads - 40 encoders - 9 nops             **]**
+ -- --**=[** Free Metasploit Pro trial: <a href="http://r-7.co/trymsp">http://r-7.co/trymsp</a> **]**

msf > 
```

#### After starting, introduce a module

You started the MSF program with the msfconsole command and some of your operations are ongoing. You do not need to close the program to introduce a new module to the system. With the loadpath command, the module Once you tell it the path it is in, the installation will take place.

```bash
msf > loadpath /home/umut/.msf4/modules
Loaded 0 modules:
msf > 
```

{{<youtube "5B8EftRWxGY">}}
