---
draft: false

title:  'Ubuntu Alias Kısaltma Tanımlama'
date: '2016-04-21T16:16:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, Linux komut satırında sürekli kullandığımız uzun komutları, alias kullanarak kısaltmayı gösterdik. Ubuntu İşletim sistemi kullanarak göstermemize rağmen, diğer Linux dağıtımlarında da kullanılabilir.' 
 
url:  /tr/ubuntu-alias-kisaltma-tanimlama/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - alias
    - 'linux alias'
---


Bu yazımızda, Linux komut satırında sürekli kullandığımız uzun komutları, alias kullanarak kısaltmayı gösterdik. Ubuntu İşletim sistemi kullanarak göstermemize rağmen, diğer Linux dağıtımlarında da kullanılabilir.



Alias kullanımı, komut satırında yaptığınız işlemleri çok hızlı olarak hayata geçirmenize yardımcı olur. Bir kaç harfle tanımladığınız kısaltma, çok uzun bir komutu ekrana getirir ve derhal işleme koyar.



**NOT**:Kalıcı kullanım esnasında ilk defa oluşturulan bash_aliases dosyasını, daha sonra tekrar oluşturmaya gerek yoktur. Home klasöründe ve gizli halde bulunan bu dosyayı herhangi bir editör ile açarak düzenleyebilirsiniz.



Bu videoda kullanılan komutları aşağıdan kopyalayıp kullanabilirsiniz.



Alias geçici kullanım


```bash
alias lsa='ls -al'```



Alias kalıcı kullanım


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



Nasıl yapıldığının anlatılmasını istediğiniz diğer konuları bize bildirebilirsiniz.
