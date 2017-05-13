---
layout: post
title: MSF Başlangıçta Database Hatası
date: 2017-05-13 08:50:06.000000000 +02:00
type: post
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework database
- msf database localhost hatası
- msf port 5432 hatası
excerpt: Metasploit framework yazılımını Kali İşletim sisteminde kullanıyorsanız, en son güncellemeden sonra ```msfconsole``` başlangıcında aşağıdaki hatayı almaya başlamış olabilirsiniz. msfconsole içerisinde veritabanı kulanımı, yaptığınız taramaların kayıt edilmesi ve tekrar kullanılmasında oldukça fayda sağlar.
---

Metasploit framework yazılımını Kali İşletim sisteminde kullanıyorsanız, en son güncellemeden sonra ```msfconsole``` başlangıcında aşağıdaki hatayı almaya başlamış olabilirsiniz. msfconsole içerisinde veritabanı kulanımı, yaptığınız taramaların kayıt edilmesi ve tekrar kullanılmasında oldukça fayda sağlar. Bu hatanın sebebi de en son güncelleme ile Kali içerisine kurulan Postgresql 9.6 sürümüdür.

**HATA**

```sh

"Failed to connect to the database: could not connect to server: Connection refused Is the server running on host "localhost" (::1) and accepting TCP/IP connections on port 5432? could not connect to server: Connection refused Is the server running on host "localhost" (127.0.0.1) and accepting TCP/IP connections on port 5432?"
```
Kali OS güncellemeden önce kullanılan Postgresql 9.5 sürümü, gelen istekleri 5432 portundan dinlemekteydi. Postgresql 9.6 ise conf dosyasında yapılan ayarlama ile dinlemeyi varsayılan olarak 5433 portundan yapmaya başladı. Metasploit Framework ise Postgresql ile haberleşmeyi hala 5432 portundan yapmaya çalışıyor. Bu durumu, aşağıdaki adımlarla kontrol edip düzeltelim ve Veri tabanımızı kullanmaya kaldığımız yerden devam edelim.

* Postgresql Servisi Başlatın:

```sh
service postgresql start
```

* Postgresql Dinleme Portu Şu an Ne?

Aşağıdaki komut yardımı ile şu an Postgresql'in şu an dinlediği Port numarasını görebilirsiniz.

```sh
ss -lntp | grep post
```
Muhtemelen aşağıdaki çıktıya benzer bir sonuç elde edeceksiniz. Dinleme portu olarak 5433 görüyorsanız bir sonraki adıma geçebiliriz.
 
```sh
LISTEN     0      128    127.0.0.1:5433                     *:*                   users:(("postgres",pid=2732,fd=6))
LISTEN     0      128        ::1:5433                    :::*                   users:(("postgres",pid=2732,fd=3))
```

* Ayarlara Bakalım:

Aşağıdaki komutu kullanarak, ```/etc/postgresql/9.6/main/postgresql.conf``` ayar dosyasında hangi port ayarlanmış bakalım.

```sh
grep "port =" /etc/postgresql/9.6/main/postgresql.conf

port = 5433                # (change requires restart)
```

Çıktıda 5432 yerine 5433 görüyorsanız problem burada demektir. 

* Portu Değiştirelim:

```sh
sed -i 's/\(port = \)5433/\15432/' /etc/postgresql/9.6/main/postgresql.conf
```

Servisi tekrar başlatalım ve ardından ```msfdb``` başlangınıcını ayarlayalım. Artık, ```msfconsole``` ile Metasploit Framework başladığında Veri tabanına bağlanabilirsiniz.

```sh
service postgresql restart
msfdb reinit
```
Çözümümün anlatılmasını istediğiniz konuları bize bildirebilirsiniz.