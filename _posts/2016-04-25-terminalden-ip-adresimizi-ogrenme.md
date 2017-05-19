---
layout: post
title: Terminalden IP Adresimizi öğrenme
date: 2016-04-25 21:48:14.000000000 +03:00
type: post
author: siberoloji
img: linux2.png
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- açık ip
- ip öğrenme
- myip
---

Bazen, terminalde çalışırken (bash, SSH vb.) ISP tarafından Modeminize atanan herkese açık (public) IP adresini öğrenmeniz gerekebilir. Bu IP adresine, bir programda kullanmak veya ayarlama yapmak için ihtiyaç duyabilirsiniz. Yazımızda, komut satırından IP adresimizi nasıl öğrenebileceğimizi göreceğiz. Dikkat: Modem ile bilgisayarınız arasındaki dahili ağınızdaki IP adresinizden bahsetmiyoruz. Onu ifconfig komutu ile öğrenebilirsiniz.

<p>Komut satırından IP adresini öğrenmek için bir çok yöntem bulunuyor sırayla görelim.</p>
<pre class="lang:default decode:true" title="1.Yöntem">dig +short myip.opendns.com @resolver1.opendns.com</pre>
<pre class="lang:default decode:true" title="2.Yöntem">dig TXT +short o-o.myaddr.l.google.com @ns1.google.com</pre>
<pre class="lang:default decode:true" title="3.Yöntem">host myip.opendns.com resolver1.opendns.com</pre>
<pre class="lang:default decode:true" title="4.Yöntem">dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'</pre>
<p>Bu yöntemde IP adresiniz bir shell değişkeni içerisine kayıt edilir. Daha sonra ihtiyaç duyduğunuzda kullanabilirsiniz.</p>
<pre class="lang:default decode:true" title="5.Yöntem">myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "Açık IP adresim: ${myip}"</pre>
<p>3.Taraf sitelerin yardımıyla da öğrenmeniz mümkün. Aşağıdaki komutlardan herhangi biri işinize yarayacaktır.</p>
<pre class="lang:default decode:true" title="6.Yöntem">curl icanhazip.com
curl ipecho.net/plain
curl ifconfig.co
</pre>
<span class="label label-info">!!!</span> 
Linux kullanıcılarının işini kolaylaştıracak bildiğiniz komut örneklerini bizimle paylaşır mısınız? Yorum bölümünü kullanabilir veya twitter adresimizden bize iletebilirsiniz. Burada yayınlamaktan mutluluk duyarız.