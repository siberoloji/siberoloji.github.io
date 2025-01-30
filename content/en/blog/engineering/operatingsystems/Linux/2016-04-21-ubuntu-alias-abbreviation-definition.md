---
draft: false

title:  'Ubuntu Alias ​​Abbreviation Definition'
date: '2016-04-21T23:30:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /ubuntu-alias-abbreviation-definition/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - 'linux how-to'
---
In this article, we showed how to shorten long commands that we constantly use on the Linux command line, using aliases. Although we demonstrated it using Ubuntu Operating system, it can also be used in other Linux distributions.

Using Alias ​​helps you implement the operations you do on the command line very quickly. The abbreviation you define with a few letters displays a very long command and executes it immediately.

**NOTE** : There is no need to re-create the bash_aliases file created for the first time during permanent use. You can edit this file, which is hidden in the Home folder, by opening it with any editor.

You can copy and use the commands used in this video from below.

Alias ​​temporary use
```bash
alias lsa='ls -al'```

Alias ​​permanent use
```bash
cd 
touch .bash_aliases 
nano .bash_aliases 
alias upd='sudo apt-get update; sudo apt-get -y upgrade' 
Ctrl-x ile çıkış 
Evet cevabı ile kayıt 
source .bashrc 
upd
```

You can let us know about other topics you would like explained how it is done.
