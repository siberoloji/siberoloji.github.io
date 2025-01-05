---
draft: false

title:  'Send Process to Background in Linux Terminal (Ctrl+Z and fg)'
date: '2016-04-23T01:17:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /send-process-to-background-in-linux-terminal-ctrlz-and-fg/
 
featured_image: /images/cyber10.jpg
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - 'linux how-to'
---


If there is Shell, there is definitely a solution, you just may not know it yet. If you have a problem or a process that you find difficult, rest assured that others have also experienced it. Some of them have found the job easy. Some of them did not care. Some of them wanted to learn and share it, as in this article.



While performing your operations with commands in the terminal, you wanted to make corrections in a file (resolv.conf etc.) with the nano editor. In this case,  `sudo nano belgeninadı` you type it on the command line and enter the editor. When you enter the editor, the command line is gone. What should you do if you want to perform an operation on the command line even though you are not finished with the file you are working on?



**Way 1:**  I open a new TAB-tab.



**Way 2:**  I save the document with Ctrl+O, exit with Ctrl+X. I write the command in the terminal, run it and then open the nano editor again.



**Way 3:**  Other



The first of these options is possible if you are working with a visual desktop, but this may not be possible on a remote server that you connect to via ssh. The second option seems to be a method from the early ages when computers were invented. There must be a short and fast way to solve this problem.



Developers who got tired of such save-exit-reenter processes developed the Ctrl+Z key combination and the fg command. This way, it is possible to send the running editor to the background without exiting and go back to the command line. It is even possible to open another document in the editor from the command line and send it to the background. After sending two open documents to the background, open another document and send it to the background as well……. the story goes like this.



**How Does?**



Step 1: First, let's create test1.txt, test2.txt and test3.txt files.


```bash
&gt;~$ cd /tmp/
/tmp$ echo 'Selam, ben 0 numaralı belgeyim' &gt;deneme1.txt
/tmp$ echo 'Selam, ben 2 numaralı belgeyim' &gt;deneme2.txt
/tmp$ echo 'Selam, ben 3 numaralı belgeyim' &gt;deneme3.txt
```



Step 2: We open the documents with the Nano editor and send them to the background with the Ctrl + Z keys. In this way, we reach the command line again without closing the document.


```bash
&gt;/tmp$ nano deneme1.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
1 txt

/tmp$ nano deneme2.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
2 txt

/tmp$ nano deneme3.txt    //Nano açıldığında Ctrl+Z ile geri plana gönderin.
3 txt
```



As seen below, a number is given next to the process that is sent to the background with each Ctrl + Z key combination. This number is used to recall that background task.


```bash
4 txt
```



Step 3: Now let's call back a task that we sent to the background. For this,  `fg` we use the command. In the screen output, the shell tells us to use fg to return to nano.



If you just type fg on the command line, you will return to the last closed process. However, if you want to go back to process number 1, it will be sufficient to give the fg 1 command.


```bash
&gt;$ fg 1
```



Edit: (10.05.2017)  If you want to see all the processes running in the background,  `jobs` you can use the command.



Although this article covers the topic using the nano editor, you can also reference the same background using vi or other editors.
