---
draft: false

title:  'Linux için VNC Server Kurulum'
date: '2016-06-13T17:53:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bir Linux bilgisayarınız var ve onun ekranını başka bilgisayarlarla paylaşmak mı istiyorsunuz. Bunun için bilgisayarınıza masaüstü paylaşım sunucusu kurmanız gerekir. Bu yazıda, Linux Mint ve benzeri Ubuntu tabanlı dağıtımlarda VNC Server nasıl kurulur sorusuna bakacağız.' 
 
url:  /tr/linux-icin-vnc-server-kurulum/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
    - 'vnc server'
---


Bir Linux bilgisayarınız var ve onun ekranını başka bilgisayarlarla paylaşmak mı istiyorsunuz. Bunun için bilgisayarınıza masaüstü paylaşım sunucusu kurmanız gerekir. Bu yazıda, Linux Mint ve benzeri Ubuntu tabanlı dağıtımlarda VNC Server nasıl kurulur sorusuna bakacağız.


* 
* Varsayılan VNC server olan Vino’yu kaldıralım:



```bash
sudo apt-get -y remove vino
```


* 
* X11vnc Kuralım:



```bash
sudo apt-get -y install x11vnc
```


* 
* Parolamızı kaydedeceğimiz dosyayı oluşturalım:



```bash
sudo mkdir /etc/x11vnc
```


* 
* Şifrelenmiş şekilde tutulacak parolamızı oluşturup kaydedelim:



```bash
sudo x11vnc --storepasswd /etc/x11vnc/vncpwd
```



Bu adımda size yeni parolanızı sorulacaktır. Ekranda gösterien adımları uygulayın ve kaydedin.


* 
* x11vnc Sunucu için systemd unit dosyasını oluşturalım. Bunun için aşağıdaki komutu kullanarak metin editörümüzle, service dosyasını açın.



```bash
sudo xed /lib/systemd/system/x11vnc.service
```


* 
* Aşağıdaki kodları dosyanın(x11vnc.service) içerisine buradan kopyalayıp yapıştırın ve kaydedin.



```bash
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared
[Install]
WantedBy=multi-user.target
```


* 
* Systemd servislerini tekrar başlatın.



```bash
sudo systemctl daemon-reload
```


* 
* Bilgisayarın başlangıcında, VNC sunucunun otomatik başlamasını istiyorsak, aşağıdaki komut ile aktif hale getiriyoruz:



```bash
sudo systemctl enable x11vnc.service
```


* 
* Son adımda sunucuyu başlatalım:



```bash
sudo systemctl start x11vnc.service```
