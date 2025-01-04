---
title: Metasploit Framework Setup for Apple Silicon Macs
description: This method installs Metasploit Framework from the official OSX installer to Apple Silicon Processors
linkTitle: Metasploit Framework Setup for Apple Silicon Macs
date: 2024-12-21
type: blog
draft: false
toc: true
tags:
  - msfconsole
categories:
  - Cyber Security
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
featured_image: /images/kali-linux.webp
sidebar:
  open: true
url: metasploit-framework-setup-apple-silicon-macs
---

Special thanks to : [tyrell](https://gist.github.com/tyrell) 

## Introduction

This method installs Metasploit Framework from the official OSX installer found at <https://osx.metasploit.com/metasploitframework-latest.pkg> to Apple Silicon Processors

## Run the installer

1. Download the installer from <https://osx.metasploit.com/metasploitframework-latest.pkg>
2. Run the installer.
3. You should get it blocked from running.
4. Go to OSX System Preferences -> Security & Privacy and tell OSX to "Open it anyway".
5. The installer will start.
6. At some point you will have to type your password to give the installer elevated privileges to continue.
7. Done.

## Add the installed Metasploit binaries to PATH

### Option 1

Use vim or your preferred text editor to open ~/.zshrc (or ~/.bashrc if you use Bash) and add the line below to the end.

`export PATH="/opt/metasploit-framework/bin:$PATH"`

### Option 2

Execute the following command in your terminal. This does the same thing as Option 1 without needing an editor.

`echo -e export PATH="/opt/metasploit-framework/bin:$PATH" >> ~/.zshrc`

## Run Metasploit for the first time (initialise)

Below is the copy/paste of my commandline. Note the first few lines, where I was prompted for input.

    ❯ msfconsole

     ** Welcome to Metasploit Framework Initial Setup **
        Please answer a few questions to get started.


    Would you like to use and setup a new database (recommended)? Y
    [?] Would you like to init the webservice? (Not Required) [no]: no
    Clearing http web data service credentials in msfconsole
    Running the 'init' command for the database:
    Creating database at /Users/tyrell/.msf4/db
    Creating db socket file at /var/folders/j_/9dwy14jj58jcb3m4gxk4b0000000gn/T
    Starting database at /Users/tyrell/.msf4/db...success
    Creating database users
    Writing client authentication configuration file /Users/tyrell/.msf4/db/pg_hba.conf
    Stopping database at /Users/tyrell/.msf4/db
    Starting database at /Users/tyrell/.msf4/db...success
    Creating initial database schema
    Database initialization successful

     ** Metasploit Framework Initial Setup Complete **


    Call trans opt: received. 2-19-98 13:24:18 REC:Loc

         Trace program: running

               wake up, Neo...
            the matrix has you
          follow the white rabbit.

              knock, knock, Neo.

                            (`.         ,-,
                            ` `.    ,;' /
                             `.  ,'/ .'
                              `. X /.'
                    .-;--''--.._` ` (
                  .'            /   `
                 ,           ` '   Q '
                 ,         ,   `._    \
              ,.|         '     `-.;_'
              :  . `  ;    `  ` --,.._;
               ' `    ,   )   .'
                  `._ ,  '   /_
                     ; ,''-,;' ``-
                      ``-..__``--`

                                 https://metasploit.com


           =[ metasploit v6.2.14-dev-961db67c4a301c0b5ef3ed981ad0edf9677ebcb0]
    + -- --=[ 2239 exploits - 1181 auxiliary - 398 post       ]
    + -- --=[ 864 payloads - 45 encoders - 11 nops            ]
    + -- --=[ 9 evasion                                       ]

    Metasploit tip: Use the edit command to open the
    currently active module in your editor

    msf6 >
    

 At this stage, you have a working Metasploit Framework installation in your Macbook.  
