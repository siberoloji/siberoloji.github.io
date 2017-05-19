---
layout: post
title: Linux RAM SWAP Dengesi
date: 2016-04-23 12:02:00.000000000 +03:00
type: post
author: siberoloji
img: cyber9.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- linux swap
- ram swap ayarı
- ram swap dengesi

---
<h1>RAM SWAP Dengesi</h1>
<p>Bilgisayarınızın RAM (Random Access Memory) gücünü ne kadar etkin kullanıyorsunuz? Linux işletim sistemi kurulu bilgisayarların ne kadar hızlı olduğunu, çok daha kararlı olduğunu arkadaşınızdan dinlediniz ve kurulum yaptınız. Ancak beklediğiniz hızı hissedemediniz veya o kadar da değilmiş demek noktasına geldiniz. İşte bu yazı, tam o noktada eksik kalmış olabilecek bir konuyu size hatırlatmak için hazırlandı. Bilgisayarınızın RAM sürati ile SWAP olarak ifade edilen ve Hard Disk içerisinde RAM gibi kullanılan bölümünün sürati aynı değildir.<br />
Bu konuda ufak bir ayarlama yapmak, bilgisayar hızını ve etkinliğini çok daha yukarılara çıkarabilir. Şöyle ifade edelim. Bilgisayarınıza aynı anda 300 Mb. büyüklüğünde bir sıkıştırılmış dosyayı açmasını söyleyin (tıklayın). Web tarayıcınızdan da izlemek istediğiniz Videoyu Play tuşu ile başlatın ve Pause tuşu ile durdun ki siz diğer işlerinizi hallederken o inmeye devam etsin. Bu arada yeni bir masaüstü açıp orada da akşam yapacağınız seminerin sunumunu hazırlamaya başlayın.<br />
Yukarıda yazılı işlemleri aynı anda yapmak istemeniz gayet normal. İşlemciniz bunları organize etmeli. Adı üzerinde Central Processing Unit. Bu durumda, işlemciniz RAM kapasitesine yüklenecek, RAM yetmediği anda hemen SWAP alanını yardıma çağıracak. RAM verilerin bir kısmını SWAP alanına yazarak üzerinde yer açacak. İhtiyaç olduğunda, SWAP alanından tekrar gerekli sayfalar RAM'a geri yüklenecek. Muhtemelen bu senaryoda bir takım donmalar ve tıklamalarınıza geç yanıtlar almaya başlayacaksınız. Bilgisayarınız KASACAK. HATTA KASIYORDUR.</p>
<p><a href="https://www.siberoloji.com/wp-content/uploads/2016/04/swapspace.jpg"><img class="alignnone wp-image-14884 size-full" src="{{ site.baseurl }}/assets/swapspace.jpg" alt="swapspace" width="400" height="315" /></a></p>
<p>Şimdi birlikte Linux işletim sisteminde bir kontrol yapalım. Aşağıdaki komut yardımıyla bilgisayarınızın Swappiness oranını kontrol edelim.</p>
<pre class="lang:default decode:true">cat /proc/sys/vm/swappiness</pre>
<p>Büyük ihtimalle sonuç 60 çıkacaktır. Bu rakam, bilgisayarınızın RAM miktarının azaldığı anlarda SWAP hafızasını kullanma eğilimini gösteririr. 0-100 arası değerlerle ifade edilir. Sunucu olarak kullanılan Linux bilgisayarlarda normal bir oran olmasına rağmen kişisel bilgisayarlarda bu oran fazladır. SWAP kullanılma eğilimi fazla olduğunda, sanki RAM'a yardımcı olduğu düşünülse de ortaya kaçınılmaz olarak Diske yazma ve diskten okuma işlemi çıkar. Ve bu bilgisayarı yavaşlatır.</p>
<p>Üstelik bilgisayarlar, önceliği yazılıma ve kodların çalışmasına verir. Sizin müzik, belge vb. verilerinizi okuyacak, işlem yapacak yazılım çalışmazsa zaten geri kalan işler yapılamayacağından, öncelik yazılımdadır. Böyle olunca büyük ihtimalle, sizin okunmasını istediğiniz verileriniz, RAM den SWAP alanına, sonra tekrar SWAP alanından RAM hafızasına gidip gelecektir. Böyle olunca bilgisayarınız kasacaktır, bu kaçınılmazdır.</p>
<p>Bunun için şöyle bir kural oluşturalım ve deneyelim.</p>
<p>RAM Miktarınız 1 GB ve daha fazla ise vm.swappiness=10</p>
<p>RAM Miktarınız 1 GB dan daha ise ise vm.swappiness=5</p>
<p>Bir metin editör ile ve sudo komutuyla /etc/sysctl.conf dosyanızı açıp en alt kısma aşağıdaki satırı yapıştırın ve kaydedin.</p>
<pre class="lang:default decode:true">sudo nano /etc/sysctl.conf</pre>
<pre class="lang:default decode:true" title="sysctl.conf dosyasının en altına"># Swap kullanım oranını düşürerek bilgisayarı hızlandırma
vm.swappiness=10
</pre>
<p>Dosyayı kaydederek çıkın ve bilgisayarınızı tekrar başlatın. Aşağıdaki komutu bilgisayarınız açılınca tekrar verin. Değerin 10 olduğunu göreceksiniz.</p>
<pre class="lang:default decode:true">cat /proc/sys/vm/swappiness</pre>
<p>Bir kaç gün böyle deneyin bilgisayarınızı. Bakalım hızda bir fark olacak mı? Değişen bir şey olmaz ise sysctl.conf dosyasına eklediğimiz satırları sildiğiniz anda eski ayarlarınıza dönebilirsiniz.</p>
