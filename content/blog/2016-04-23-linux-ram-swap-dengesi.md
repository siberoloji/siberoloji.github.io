---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-23T16:26:00Z"
excerpt: 'Bilgisayarınızın RAM (Random Access Memory) gücünü ne kadar etkin kullanıyorsunuz?
  Linux işletim sistemi kurulu bilgisayarların ne kadar hızlı olduğunu, çok daha kararlı
  olduğunu arkadaşınızdan dinlediniz ve kurulum yaptınız. Ancak beklediğiniz hızı
  hissedemediniz veya o kadar da değilmiş demek noktasına geldiniz. '
guid: https://www.siberoloji.com/?p=1068
id: 1068
image: /assets/images/2024/06/cyber9.jpg
tags:
- linux nasıl
title: Linux RAM SWAP Dengesi
url: /tr/linux-ram-swap-dengesi/
---

<!-- wp:heading {"level":1} -->
# RAM SWAP Dengesi 
<!-- /wp:heading -->

  Bilgisayarınızın RAM (Random Access Memory) gücünü ne kadar etkin kullanıyorsunuz? Linux işletim sistemi kurulu bilgisayarların ne kadar hızlı olduğunu, çok daha kararlı olduğunu arkadaşınızdan dinlediniz ve kurulum yaptınız. Ancak beklediğiniz hızı hissedemediniz veya o kadar da değilmiş demek noktasına geldiniz. İşte bu yazı, tam o noktada eksik kalmış olabilecek bir konuyu size hatırlatmak için hazırlandı. Bilgisayarınızın RAM sürati ile SWAP olarak ifade edilen ve Hard Disk içerisinde RAM gibi kullanılan bölümünün sürati aynı değildir.<br>Bu konuda ufak bir ayarlama yapmak, bilgisayar hızını ve etkinliğini çok daha yukarılara çıkarabilir. Şöyle ifade edelim. Bilgisayarınıza aynı anda 300 Mb. büyüklüğünde bir sıkıştırılmış dosyayı açmasını söyleyin (tıklayın). Web tarayıcınızdan da izlemek istediğiniz Videoyu Play tuşu ile başlatın ve Pause tuşu ile durdun ki siz diğer işlerinizi hallederken o inmeye devam etsin. Bu arada yeni bir masaüstü açıp orada da akşam yapacağınız seminerin sunumunu hazırlamaya başlayın.<br>Yukarıda yazılı işlemleri aynı anda yapmak istemeniz gayet normal. İşlemciniz bunları organize etmeli. Adı üzerinde Central Processing Unit. Bu durumda, işlemciniz RAM kapasitesine yüklenecek, RAM yetmediği anda hemen SWAP alanını yardıma çağıracak. RAM verilerin bir kısmını SWAP alanına yazarak üzerinde yer açacak. İhtiyaç olduğunda, SWAP alanından tekrar gerekli sayfalar RAM'a geri yüklenecek. Muhtemelen bu senaryoda bir takım donmalar ve tıklamalarınıza geç yanıtlar almaya başlayacaksınız. Bilgisayarınız KASACAK. HATTA KASIYORDUR. 
 

  Şimdi birlikte Linux işletim sisteminde bir kontrol yapalım. Aşağıdaki komut yardımıyla bilgisayarınızın Swappiness oranını kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /proc/sys/vm/swappiness</code></pre>
<!-- /wp:code -->

  Büyük ihtimalle sonuç 60 çıkacaktır. Bu rakam, bilgisayarınızın RAM miktarının azaldığı anlarda SWAP hafızasını kullanma eğilimini gösteririr. 0-100 arası değerlerle ifade edilir. Sunucu olarak kullanılan Linux bilgisayarlarda normal bir oran olmasına rağmen kişisel bilgisayarlarda bu oran fazladır. SWAP kullanılma eğilimi fazla olduğunda, sanki RAM'a yardımcı olduğu düşünülse de ortaya kaçınılmaz olarak Diske yazma ve diskten okuma işlemi çıkar. Ve bu bilgisayarı yavaşlatır. 
 

  Üstelik bilgisayarlar, önceliği yazılıma ve kodların çalışmasına verir. Sizin müzik, belge vb. verilerinizi okuyacak, işlem yapacak yazılım çalışmazsa zaten geri kalan işler yapılamayacağından, öncelik yazılımdadır. Böyle olunca büyük ihtimalle, sizin okunmasını istediğiniz verileriniz, RAM den SWAP alanına, sonra tekrar SWAP alanından RAM hafızasına gidip gelecektir. Böyle olunca bilgisayarınız kasacaktır, bu kaçınılmazdır. 
 

  Bunun için şöyle bir kural oluşturalım ve deneyelim. 
 

  RAM Miktarınız 1 GB ve daha fazla ise vm.swappiness=10 
 

  RAM Miktarınız 1 GB dan daha ise ise vm.swappiness=5 
 

  Bir metin editör ile ve sudo komutuyla /etc/sysctl.conf dosyanızı açıp en alt kısma aşağıdaki satırı yapıştırın ve kaydedin. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/sysctl.conf</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Swap kullanım oranını düşürerek bilgisayarı hızlandırma
vm.swappiness=10
</code></pre>
<!-- /wp:code -->

  Dosyayı kaydederek çıkın ve bilgisayarınızı tekrar başlatın. Aşağıdaki komutu bilgisayarınız açılınca tekrar verin. Değerin 10 olduğunu göreceksiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /proc/sys/vm/swappiness</code></pre>
<!-- /wp:code -->

  Bir kaç gün böyle deneyin bilgisayarınızı. Bakalım hızda bir fark olacak mı? Değişen bir şey olmaz ise sysctl.conf dosyasına eklediğimiz satırları sildiğiniz anda eski ayarlarınıza dönebilirsiniz. 
 