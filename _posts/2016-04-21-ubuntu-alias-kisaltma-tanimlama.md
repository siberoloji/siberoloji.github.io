---
layout: post
title: Ubuntu Alias Kısaltma Tanımlama
date: 2016-04-21 18:46:24.000000000 +03:00
type: post
img: linux-howto.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- alias
- alias kısaltma tanımlama
- linux alias
- ubuntu alias kullanımı

---
<p class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">Yukarıda bulunan Videomuzda, Linux komut satırında sürekli kullandığımız uzun komutları, alias kullanarak kısaltmayı gösterdik. Ubuntu İşletim sistemi kullanarak göstermemize rağmen, diğer Linux dağıtımlarında da kullanılabilir.</p>
<p class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">Alias kullanımı, komut satırında yaptığınız işlemleri çok hızlı olarak hayata geçirmenize yardımcı olur. Bir kaç harfle tanımladığınız kısaltma, çok uzun bir komutu ekrana getirir ve derhal işleme koyar.</p>
<p class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">[highlight bgcolor="#DDFF99" txtcolor="#000"]NOT:[/highlight] Kalıcı kullanım esnasında ilk defa oluşturulan bash_aliases dosyasını, daha sonra tekrar oluşturmaya gerek yoktur. Home klasöründe ve gizli halde bulunan bu dosyayı herhangi bir editör ile açarak düzenleyebilirsiniz.</p>
<p class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">Bu videoda kullanılan komutları aşağıdan kopyalayıp kullanabilirsiniz.</p>
<h3 class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">Alias geçici kullanım</h3>
<pre class="lang:default decode:true" title="1.Yöntem: Geçici kullanım">alias lsa='ls -al'</pre>
<h3 class="lang:default decode:true " title="1.Yöntem: Geçici kullanım">Alias kalıcı kullanım</h3>
<pre class="lang:default decode:true ">cd 
touch .bash_aliases 
nano .bash_aliases 
alias upd='sudo apt-get update; sudo apt-get -y upgrade' 
Ctrl-x ile çıkış 
Evet cevabı ile kayıt 
source .bashrc 
upd</pre>
<p class="lang:default decode:true " title="2.Yöntem: Kalıcı kullanım">Nasıl yapıldığının anlatılmasını istediğiniz diğer konuları bize bildirebilirsiniz.</p>
