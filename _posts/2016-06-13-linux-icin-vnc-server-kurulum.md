---
layout: post
title:  "Linux için VNC Server Kurulum"
date:   2016-06-13 10:51:47 +0530
categories: 
- Linux
img: linux-howto.jpg
published: true
author: siberoloji
---

Bir Linux bilgisayarınız var ve onun ekranını başka bilgisayarlarla paylaşmak mı istiyorsunuz. Bunun için bilgisayarınıza masaüstü paylaşım sunucusu kurmanız gerekir. Bu yazıda, Linux Mint ve benzeri Ubuntu tabanlı dağıtımlarda VNC Server nasıl kurulur sorusuna bakacağız.

* Varsayılan VNC server olan Vino'yu kaldıralım:

```sh
sudo apt-get -y remove vino
```

* X11vnc Kuralım:

```sh
sudo apt-get -y install x11vnc
```

* Parolamızı kaydedeceğimiz dosyayı oluşturalım:

```sh
sudo mkdir /etc/x11vnc
```

* Şifrelenmiş şekilde tutulacak parolamızı oluşturup kaydedelim:

```sh
sudo x11vnc --storepasswd /etc/x11vnc/vncpwd
```

Bu adımda size yeni parolanızı sorulacaktır. Ekranda gösterien adımları uygulayın ve kaydedin.

* x11vnc Sunucu için systemd unit dosyasını oluşturalım. Bunun için aşağıdaki komutu kullanarak metin editörümüzle, service dosyasını açın. 

```sh
sudo xed /lib/systemd/system/x11vnc.service
```

* Aşağıdaki kodları dosyanın(x11vnc.service) içerisine buradan kopyalayıp yapıştırın ve kaydedin. 

```sh
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared
[Install]
WantedBy=multi-user.target
```

* Systemd servislerini tekrar başlatın.

```sh
sudo systemctl daemon-reload
```

* Bilgisayarın başlangıcında, VNC sunucunun otomatik başlamasını istiyorsak, aşağıdaki komut ile aktif hale getiriyoruz:

```sh
sudo systemctl enable x11vnc.service
```

* Son adımda sunucuyu başlatalım:

```sh
sudo systemctl start x11vnc.service
```