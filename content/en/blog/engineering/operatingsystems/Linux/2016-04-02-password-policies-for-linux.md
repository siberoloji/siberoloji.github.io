---
draft: false

title:  'Password policies for Linux'
date: '2016-04-02T14:04:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /password-policies-for-linux/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Fundamentals'
tags:
    - linux
    - 'linux fundamentals'
    - os
---
The majority of Linux users regularly install security updates and use the latest version. As far as we know, they are sensitive and careful. But this sensitivity and attention alone may not be enough. If you do not have a secure password policy that applies equally to every user, installing security updates alone may not be enough.

Most Linux distributions select policies that do not disturb the user during installation by default. It is necessary to determine rules later, such as the requirement to change the password, the number of days between changes, or the number of days after which the account will be locked.  

If you want to make such settings,   you should use a command called **chage** . This easy-to-use and simple command will help you a lot in creating the password policies you choose. You can see the options and what you can do on the help and man pages.
```bash
chage --help
man chage```

If you run the command below from the command line, you can see the password rules of the user you want.
```bash
# change siberoloji with your username.

$ chage -l siberoloji

Last password change : May 04, 2015
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
$ _```

As can be seen in the report above, the user's password will never expire, become inactive, the account will not become inactive, and there will be no need to create a new password before 99999 days have passed since the password was changed.
```bash
sudo chage -M 90 siberoloji```

This command allows you to set a rule that the user you specify must change their password after 90 days from the last password change.
```bash
sudo chage -m 5 -M 90 -I 30 -W 14 siberoloji```

Let's explain the options used in the command one by one.

With the ( -m 5 ) option, it is determined that after a password is changed, at least 5 days must pass before it can be changed again.

Thanks to the ( -M 90 ) option, the user is forced to change his password after 90 days have passed since the password was changed.

( -I 30 ) If the user has not logged in for 30 days since the last login, it is determined that the account will be deactivated. If you are going on vacation or will be away from your computer for a long time, we recommend that you use it with caution. 

The ( -W 14 ) option will warn the user with a warning when there are 14 days left for his password to expire.

To continue using your computer more securely, start with yourself and try tightening your own user password policies. Although it may seem strange for a while, believe me, people feel more secure the system they use.
