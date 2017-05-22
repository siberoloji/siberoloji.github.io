---
layout: post
title: Ücretsiz Ubuntu Livepatch
date: 2016-10-18 21:08:35.000000000 +03:00
type: post
published: true
status: publish
categories:
- Haberler
- Linux
tags:
- canonical livepatch
- livepatch
- ubuntu livepatch
author: siberoloji
---
<p>Linux Kernel 4.0 sürümünün yayınlanmasının üzerinden neredeyse 1,5 yıl geçti. Kernel 4.0 sürümü ile gelen en büyük özellik kuşkusuz Livepatch yani sistemi durdurmaya gerek olmadan Kernel güncellemesi yapabilme kabiliyetidir.</p>
<p>Bugüne kadar, OpenSUSE, RedHAT ve Ubuntu dağıtımları bu esnekliği ve servisi ücretli olarak veriyorlardı. Canonical tarafından desteklenen Ubuntu, bugün itibariyle Ubuntu Livepatch özelliğini Kişisel bilgisayar kullanıcıları ve Ticari müşterilerine 3 bilgisayara kadar ücretsiz vermeye başladığını duyurdu.</p>
<p>Livepatch, bir işletim sistemini çalışırken kernel seviyesinde güvenlik güncelleme ve düzeltmelerini hayata geçirmek için sistemin durdurulmasına gerek kalmadan kesintisiz hizmet imkanı veriyor. Güvenlik güncellemelerinin önemli olduğu ve aynı zamanda hizmetin kesintisiz sağlanması gereken sunucular için gerçekten önemli bir esneklik.</p>
<p>Bazı simülasyon programları veya sanallaştırma yardımıyla bir çok sunucuyu üzerinde bulunduran sunucu kümelerinin (server farm) güvenlik güncellemesi için durdurulmasının, bu hizmetleri kullananları nasıl etkilediğini tahmin etmek oldukça zor olsa gerek. Livepatch sayesinde hizmetlerin kesintisiz devam etmesi ise büyük bir kolaylık ve esneklik.</p>
<p>Red Hat Enterprise Linux bu işlemler için kpatch isimli uygulamasını geliştirmiş durumda. Open SUSE kGraft, Ubuntu ise canonical-livepatch uygulamasını kullanıyor.</p>
<p>Sistem,  Sunucu / Masaüstü Ubuntu 16.o4 LTS ve daha yeni sürümlerde çalışıyor. Kernel 4.4 ve üzerinde oynanmamış kernel olmalı. Şu an için 64 mimari destekleniyor.</p>
<p>Ubuntu kullanıcısıysanız ve Livepatch özelliğini (3 PC üst sınır) kullanmak istiyorsanız bu <strong><a href="https://ubuntu.com/livepatch" target="_blank">bağlantıdan</a></strong> kayıt yaptırarak kendinize yetkilendirme anahtarı (token) almanız gerekiyor. Bu anahtar yardımıyla aşağıdaki komutları kullanarak Ubuntu işletim sisteminize kurulum yapabiliyorsunuz.</p>
<p>Aşağıda bulunan 2.satırdaki komutta, <span class="lang:sh highlight:0 decode:true crayon-inline ">enable</span>  ifadesinden sonra kendi token kodunuzu yazmanız gerekiyor.</p>
<pre class="lang:sh decode:true ">sudo snap install canonical-livepatch
sudo canonical-livepatch enable d3b07384d113edec49eaa6238ad5ff00</pre>
<p>Sistemin aktif olup olmadığını da bu komutla kontrol edebilirsiniz.</p>
<pre class="lang:sh decode:true">canonical-livepatch status

kernel: 4.4.0-38.57-generic
  fully-patched: true
  version: "12.2"
</pre>
<p>Artık Kernel seviyesinde güvenlik güncellemeleri aldığınızda ve kurulumdan sonra sisteminizi veya kritik servislerinizi durdurmak, tekrar başlatmak zorunda kalmayacaksınız.</p>
<p>Denemek ister misiniz? Sonuçlarını bizimle paylaşmanızı ümid ediyoruz...</p>
