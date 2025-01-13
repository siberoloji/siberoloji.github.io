---
draft: false

title:  'Terminalden IP Adresimizi öğrenme'
date: '2016-04-25T17:23:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'terminalde çalışırken (bash, SSH vb.) ISP tarafından Modeminize atanan herkese açık (public) IP adresini öğrenmeniz gerekebilir. Bu IP adresine, bir programda kullanmak veya ayarlama yapmak için ihtiyaç duyabilirsiniz. Yazımızda, komut satırından IP adresimizi nasıl öğrenebileceğimizi göreceğiz. ' 
 
url:  /tr/terminalden-ip-adresimizi-ogrenme/
 
featured_image: /images/linux2.png
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---
Bazen, terminalde çalışırken (bash, SSH vb.) ISP tarafından Modeminize atanan herkese açık (public) IP adresini öğrenmeniz gerekebilir. Bu IP adresine, bir programda kullanmak veya ayarlama yapmak için ihtiyaç duyabilirsiniz. Yazımızda, komut satırından IP adresimizi nasıl öğrenebileceğimizi göreceğiz. Dikkat: Modem ile bilgisayarınız arasındaki dahili ağınızdaki IP adresinizden bahsetmiyoruz. Onu ifconfig komutu ile öğrenebilirsiniz.

Komut satırından IP adresini öğrenmek için bir çok yöntem bulunuyor sırayla görelim.
<!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group">```bash
dig +short <a href="http://myip.opendns.com/">myip.opendns.com</a> @<a href="http://resolver1.opendns.com/">resolver1.opendns.com</a>```
```bash
dig TXT +short <a href="http://o-o.myaddr.l.google.com/">o-o.myaddr.l.google.com</a> @<a href="http://ns1.google.com/">ns1.google.com</a>```
```bash
host <a href="http://myip.opendns.com/">myip.opendns.com</a> <a href="http://resolver1.opendns.com/">resolver1.opendns.com</a>```
```bash
dig TXT +short <a href="http://o-o.myaddr.l.google.com/">o-o.myaddr.l.google.com</a> @<a href="http://ns1.google.com/">ns1.google.com</a> | awk -F'"' '{ print $2}'```
</div>
<!-- /wp:group --></div>
<!-- /wp:group -->
Bu yöntemde IP adresiniz bir shell değişkeni içerisine kayıt edilir. Daha sonra ihtiyaç duyduğunuzda kullanabilirsiniz.
```bash
myip="$(dig +short <a href="http://myip.opendns.com/">myip.opendns.com</a> @<a href="http://resolver1.opendns.com/">resolver1.opendns.com</a>)"
echo "Açık IP adresim: ${myip}"```

3.Taraf sitelerin yardımıyla da öğrenmeniz mümkün. Aşağıdaki komutlardan herhangi biri işinize yarayacaktır.
```bash
curl <a href="http://icanhazip.com/">icanhazip.com</a>
curl <a href="http://ipecho.net/plain">ipecho.net/plain</a>
curl ifconfig.co```
