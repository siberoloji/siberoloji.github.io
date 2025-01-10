---
draft: false
title: MSF Database Error on Startup
date: 2017-05-13T12:39:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Fixing the database error that occurs when starting msfconsole in Kali Linux.
url: /msf-baslangicta-database-hatasi/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
linkTitle: Database Error on Startup
weight: 40
translationKey:: msf-database-error
---


If you are using Metasploit framework software on Kali Operating System, you may have started to receive the following error at the start of `msfconsole` after the latest update. Using database in msfconsole is very useful for saving and reusing the scans you have made. The reason for this error is Postgresql 9.6 version installed in Kali with the latest update.

## ERROR MESSAGE

```bash
Failed to connect to the database: could not connect to server: Connection refused Is the server running on host "localhost" (::1) and accepting TCP/IP connections on port 5432? could not connect to server: Connection refused Is the server running on host "localhost" (127.0.0.1) and accepting TCP/IP connections on port 5432?
```

Postgresql 9.5 version used before Kali OS update listened to incoming requests on port 5432. Postgresql 9.6 started listening on port 5433 by default with the settings made in the conf file. Metasploit Framework is still trying to communicate with Postgresql on port 5432. Let's check and fix this situation with the steps below and continue using our database where we left off.

## SOLUTION

* Start Postgresql Service:

```bash
service postgresql start
```

* What is Postgresql Listening Port Right Now?

You can see the port number that Postgresql is currently listening to with the command below.

```bash
ss -lntp | grep post
```

You will probably get a result similar to the output below. If you see 5433 as the listening port, we can move on to the next step.

```bash
LISTEN 0 128 127.0.0.1:5433 *****:***** users:**((**"postgres",pid**=**2732,fd**=**6**))**
LISTEN 0 128 ::1:5433 :::***** users:**((**"postgres",pid**=**2732,fd**=**3**))**
```

* Let's Look at the Settings:

Using the command below, let's see which port is set in the `/etc/postgresql/9.6/main/postgresql.conf` settings file.

```bash
grep "port =" /etc/postgresql/9.6/main/postgresql.conf

port = 5433 # (change requires restart)
```

If you see 5433 instead of 5432 in the output, that means the problem is here.

* Let's Change the Port:

Let's make the port number 5432 with the following command.

```bash
sed -i 's/\(port = \)5433/\15432/' /etc/postgresql/9.6/main/postgresql.conf
```

Let's restart the service and then set the `msfdb` startup. Now, you can connect to the database when Metasploit Framework starts with `msfconsole`.

```bash
service postgresql restart
msfdb reinit
```
