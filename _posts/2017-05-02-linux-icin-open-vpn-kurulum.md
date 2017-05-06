---
layout: post
title: Linux için OpenVPN Kurulum
date: 2017-05-02 18:43:56.000000000 +03:00
type: post
img: cyber6.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- openvpn
- vpn

---

Bu anlatımda, OpenVPN bağlantının nasıl kurulup aktif edileceğini ele alacağız. OpenVPN kullanımının 2 ayrı metodu bulunmakta. İlk metod, komut satırı ile aktivasyon. Diğeri ise Görsel arayüzden Network Manager kullanarak aktivasyon. Bu yazıda, daha kolay olduğu için komut satırı metodu açıklanacaktır. 

** OpenVPN Kurulum

Aşağıdaki komut yardımıyla OpenVPN kuralım.

```sh
sudo apt-get install openvpn
```

** OpenVPN Aktivasyon

1.Yol: Hızlı Yöntem
Aşağıdaki komutları kullanarak OpenVPN bağlantısını hızlı şekilde yapabilirsiniz.

```sh
cd
mkdir vpn
cd vpn
wget https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro1.zip
unzip VPNBook.com-OpenVPN-Euro1.zip
sudo openvpn --config vpnbook-euro1-tcp443.ovpn
Enter Auth Username: vpnbook
Enter Auth Password: 5VHZEps
```

=== 2.Yol: Açıklamalı Yaklaşım Yöntemi

Bağlantıda bulunan adresten http://www.vpnbook.com/[OpenVPN Bundle] OpenVPN için olan anahtar setlerinden uygun olanı indirin. Aşağıdaki resimde görünen Server #1 kullanabilirsiniz.

![OpenVPN](/images/openvpn.png)

Home klasörünüzde yeni bir klasör açıp, indirdiğiniz .zip uzantılı dosyayı buraya çıkartın.  Dosya yöneticisinden, yeni oluşturduğunuz klasöre sağ tıklayarak "terminal, uç birimde aç" seçeneği ile komut satırına gidin.

Az önce çıkarttığınız dosyalar profil dosyalarıdır. Bunlardan bir tanesini seçerek bağlantıyı yapabilirsiniz. 


```sh
sudo openvpn --config vpnbook-euro1-tcp443.ovpn
```

Güncel kullanıcı adı ve parola, [VPN Book](https://www.vpnbook.com) adresinde bulunan OpenVPN sekmesinden kontrol edilmelidir.
 
Enter Auth Username: vpnbook

Enter Auth Password: 5VHZEps