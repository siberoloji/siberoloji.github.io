---
layout: post
title: Ubuntu Önemli Güvenlik Güncellemesi
date: 2016-10-11 12:52:30.000000000 +03:00
type: post
published: true
status: publish
categories:
- Haberler
- Linux
tags:
- ubuntu güvenlik
- ubuntu güvenlik duyurusu
- ubuntu usn
author: siberoloji
---
<p class="intro">Canonical tarafından, Ubuntu kullanıcılarının yüklemesi için yeni güvenlik güncellemeleri yayımlandığı duyuruldu. Güncellemeler, desteklenen sürümler için kullanılan Linux Kernel sürümlerinin güvenlik özelliklerini kapsıyor.</p>
<p class="mgbot_20">Tespit edilen 4 yeni kernel güvenlik zafiyetinin Ubuntu 16.04 LTS (Xenial Xerus), Ubuntu 14.04 LTS (Trusty Tahr) ve daha ileri sürümlerinde bulunduğu belirtiliyor. Bu yeni 4 zafiyetten 3 tanesinin ise Ubuntu 12.04 LTS (Precise Pangolin) sürümünde var olduğu bildiriliyor. Ayrıca zafiyetlerin Ubuntu 16.04 LTS  Raspberry Pi 2 kernel içerisinde de bulunduğu <a href="https://www.ubuntu.com/usn/" target="_blank">Ubuntu Security Notices</a> (USN) sayfasından duyuruluyor.</p>
<p class="mgbot_20">Kullanıcıları, vakit kaybetmeden sistemlerini güncellemeleri konusunda uyaran duyuruya göre zafiyetler <a href="http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-6136" target="_blank">CVE-2016-6136</a> <a href="http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-6480" target="_blank">CVE-2016-6480</a> <a href="http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-6828" target="_blank">CVE-2016-6828</a> <a href="http://people.ubuntu.com/~ubuntu-security/cve/CVE-2016-7039" target="_blank">CVE-2016-7039</a> kayıt numaralarıyla biliniyor.</p>
<p class="mgbot_20">Yeni kernel sürümleriniz aşağıdaki gibi olmalı.</p>
<p class="mgbot_20">Ubuntu 16.04 LTS için linux-image-4.4.0-42 (4.4.0-42.62)</p>
<p class="mgbot_20">Ubuntu 14.04 LTS için linux-image-3.13.0-98 (3.13.0-98.145)</p>
<p class="mgbot_20"><em>Ubuntu 12.04 LTS için linux-image-3.2.0-111 (3.2.0-111.153)</em></p>
<p>&nbsp;</p>
<p>Şu an kullandığınız kernel sürümünü öğrenmek için <span class="lang:sh highlight:0 decode:true crayon-inline ">uname -r</span>  komutunu kullanabilirsiniz. Ubuntu ve Ubuntu tabanlı diğer sistemlerin de güncelleme kontrolü yapmalarını öneriyoruz. Güncellemeyi yazılım yöneticisi, paket yöneticisi kullanarak veya aşağıdaki komutlarla yapabilirsiniz.</p>
<pre class="lang:sh decode:true ">sudo apt update
sudo apt upgrade</pre>
<p>UYARI:</p>
<p>Linux Mint içerisinde bulunan Güncelleme yöneticisi, bu yeni kernel sürümlerini 5. derece önemde yani "kullanıcının isteğine bağlı" statüsünde gösteriyor. Bu durum sisteminizde kararsızlıklar olabileceği anlamına geliyor. Her ihtimale karşı, yeni kernel yükledikten sonra, geçmiş kernel sürümlerinden bir ya da bir kaç tanesini silmeden korumanızda fayda olabilir.</p>
<p>&nbsp;</p>
