---
layout: post
title: Handbrake Video Dönüştürücü
date: 2016-12-29 20:25:56.000000000 +03:00
type: post
published: true
status: publish
categories:
- Haberler
- Linux
tags:
- featured
- handbrake
- handbrake for linux
- handbrake video dönüştürücü
author: siberoloji
---
<p>Açık Kaynak kodlu olarak geliştirilen Handbrake Video dönüştürücü programı, Handbrake 1.0 sürüm numarasıyla yayımlandı. Akıllı telefonunuz veya tablet bilgisayarınız ile kaydettiğiniz videoları, internete yüklemek istediğinizde, uygun formata dönüştürmek gerekebilir. Belki de farklı format ve boyutta kaydettiğiniz videoları, YouTube, Facebook gibi platformlara uygun hale getirip paylaşmak isteyebilirsiniz.</p>
<p>Handbrake, video dönüştürmenin yanında Ses codec desteği ve alt yazı alternatiflerini de düzenlemenizi sağlıyor. Yazılımın Linux, Windows ve MAC İşletim Sistemleri için indirme sayfasını bu <a href="https://handbrake.fr/downloads.php" target="_blank">bağlantıdan</a> inceleyebilirsiniz. Linux İşletim Sisteminize kurarak denemek isterseniz, Launcpad üzerinden bir PPA eklemeniz gerekiyor. Aşağıdaki kodlar işinize yarayacaktır.</p>
<pre class="lang:sh decode:true">sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt update
sudo apt install handbrake-gtk</pre>
<p>Handbrake yazılımının Ubuntu için tek resmi dağıtım noktası, Launchpad adresidir. Başka adreslerden dağıtımı yapılan PPA paket depolarını yüklememenizi tavsiye ediyoruz.</p>
<p><img class="alignnone wp-image-16444 size-large" src="{{ site.baseurl }}/assets/handbrake1-1024x547.png" alt="handbrake" width="1000" height="534" /></p>
<p><img class="alignnone wp-image-16443 size-full" src="{{ site.baseurl }}/assets/handbrake2.png" alt="handbrake" width="951" height="651" /></p>
<p id="yui_3_10_3_1_1483034846695_70" class="command subordinate">
