---
layout: post
title: Ubuntu 17.04 Swap Bölümü Yerine Swap Dosyası Kullanacak
date: 2016-12-18 18:49:19.000000000 +03:00
type: post
published: true
status: publish
categories:
- Haberler
- Linux
tags:
- ubuntu 17.04
- ubuntu swap alanı
- ubuntu swapfile
author: siberoloji
---
<p>Canonical'dan Dimitri John Ledkov, Ubuntu 17.04 sürümünden itibaren, kurulum sırasında varsayılan ayarlar ile kurulum seçildiğinde, swap bölümü yerine swapfile dosyası kullanılmaya başlanacağını kişisel <a href="http://blog.surgut.co.uk/2016/12/swapfiles-by-default-in-ubuntu.html?utm_source=omgubuntu" target="_blank">blog</a> yazısı aracılığı ile duyurdu. Bu duyurunun resmi bir karar olup olmadığı henüz bilinmiyor.</p>
<p>Günümüzde gelişen RAM kapasiteleri ve yaygınlaşan SSD disk kullanımı sonucunda RAM miktarının iki katı kuralıyla kullanılan swap bölümlerine, eskisi kadar ihtiyaç kalmadığını belirtilen açıklamadan, yeni sürümden itibaren Swap kavramının bir miktar değişeceğini anlamak mümkün. Örneğin, RAM miktarının 4 Mb. gibi küçük olduğu zamanlarda tanımlanan 8 Mb. boyutunda swap alanının faydasını kullananlar bilir. Ancak günümüzde 4 – 8 Gb. gibi RAM miktarı olan bilgisayarlarda 16 Gb boyutunda Swap alanı tanımlamak neredeyse israf duruma gelmiştir. Tanımlanan bu kadar büyük swap alanı ya hiç kullanılmayacak veya çok az bir miktarı kullanılacaktır. Bununla birlikte, bölümlenen disk boyutlarından sonra swap alanını küçültme işlemi de bir miktar karışık olabilmektedir. Tüm bu teknolojik gelişmeler de dikkate alındığında, Swap disk bölümleri yerine Swap dosyalarının kullanımının daha verimli olacağı düşünülmüş. Bunun yerine, HDD den alan ayırmak yerine bir dosyayı SwapFile olarak kullanma yaklaşımı Ubuntu 17.04 sürümünden itibaren hayata geçirilmeye başlanacaktır. Windows için kullanılan pagefile.sys yapısına benzer bir yapı olacağını söylemek mümkün.</p>
<p>Bu yeni yapının kullanımının şöyle olması bekleniyor. Kurulum esnasında Ubuntu kurulacak disk bölümünü seçer ve swap disk bölümü tanımlamaz iseniz, kurulum swap alanı tanımlanmadan devam edecek ve tamamlanacak. Ubuntu kurulumdan sonra, sisteminizde swap alanı olmayacak. Kullanım esnasında ihtiyaç hissederseniz iki farklı kriter kullanarak swapfile dosya boyutunu tanımlayabileceksiniz. Birincisi, toplam disk alanının maksimum %5'ine kadar bir boyut. İkincisi maksimum 2Gb. dosya Boyutu. Bu işlemleri aşağıdaki komutlar ile yapmanız mümkün.</p>
<pre class="lang:sh decode:true ">d-i partman-swapfile/percentage string 5
d-i partman-swapfile/size string 2048</pre>
<p>Bu kriterlerin, modern mimariler için yeterli olacağı ifade ediliyor. İsteyen kullanıcılar önceden olduğu gibi kurulum esnasında swap disk bölümü oluşturup, kullanmaya da devam edebilirler. Son olarak swap dosya seçeneğinin, mimari yapısından dolayı LVM disklerde kullanılamayacağı da açıklamada belirtiliyor.</p>
<p>Bu duyurudan sonra Canonical ve Ubuntu duyuru merkezlerini kontrol ettik. Duyuru, kişisel blog üzerinden yapılmış görünüyor. Kontrol ettiğimiz resmi sayfalarda bu konuyla ilgili bir bilgilendirme bulunmuyor. Gelişmeleri sizlerle birlikte takip edeceğiz.</p>
