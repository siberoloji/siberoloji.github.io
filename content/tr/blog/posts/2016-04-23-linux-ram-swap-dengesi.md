---
draft: false

title:  'Linux RAM SWAP Dengesi'
date: '2016-04-23T16:26:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bilgisayarınızın RAM (Random Access Memory) gücünü ne kadar etkin kullanıyorsunuz? Linux işletim sistemi kurulu bilgisayarların ne kadar hızlı olduğunu, çok daha kararlı olduğunu arkadaşınızdan dinlediniz ve kurulum yaptınız. Ancak beklediğiniz hızı hissedemediniz veya o kadar da değilmiş demek noktasına geldiniz. ' 
 
url:  /tr/linux-ram-swap-dengesi/
 
featured_image: /images/cyber9.jpg
categories:
    - 'Temel Linux'
tags:
    - 'linux nasıl'
---


# RAM SWAP Dengesi



Bilgisayarınızın RAM (Random Access Memory) gücünü ne kadar etkin kullanıyorsunuz? Linux işletim sistemi kurulu bilgisayarların ne kadar hızlı olduğunu, çok daha kararlı olduğunu arkadaşınızdan dinlediniz ve kurulum yaptınız. Ancak beklediğiniz hızı hissedemediniz veya o kadar da değilmiş demek noktasına geldiniz. İşte bu yazı, tam o noktada eksik kalmış olabilecek bir konuyu size hatırlatmak için hazırlandı. Bilgisayarınızın RAM sürati ile SWAP olarak ifade edilen ve Hard Disk içerisinde RAM gibi kullanılan bölümünün sürati aynı değildir. Bu konuda ufak bir ayarlama yapmak, bilgisayar hızını ve etkinliğini çok daha yukarılara çıkarabilir. Şöyle ifade edelim. Bilgisayarınıza aynı anda 300 Mb. büyüklüğünde bir sıkıştırılmış dosyayı açmasını söyleyin (tıklayın). Web tarayıcınızdan da izlemek istediğiniz Videoyu Play tuşu ile başlatın ve Pause tuşu ile durdun ki siz diğer işlerinizi hallederken o inmeye devam etsin. Bu arada yeni bir masaüstü açıp orada da akşam yapacağınız seminerin sunumunu hazırlamaya başlayın. Yukarıda yazılı işlemleri aynı anda yapmak istemeniz gayet normal. İşlemciniz bunları organize etmeli. Adı üzerinde Central Processing Unit. Bu durumda, işlemciniz RAM kapasitesine yüklenecek, RAM yetmediği anda hemen SWAP alanını yardıma çağıracak. RAM verilerin bir kısmını SWAP alanına yazarak üzerinde yer açacak. İhtiyaç olduğunda, SWAP alanından tekrar gerekli sayfalar RAM'a geri yüklenecek. Muhtemelen bu senaryoda bir takım donmalar ve tıklamalarınıza geç yanıtlar almaya başlayacaksınız. Bilgisayarınız KASACAK. HATTA KASIYORDUR.



Şimdi birlikte Linux işletim sisteminde bir kontrol yapalım. Aşağıdaki komut yardımıyla bilgisayarınızın Swappiness oranını kontrol edelim.


```bash
cat /proc/sys/vm/swappiness
```



Büyük ihtimalle sonuç 60 çıkacaktır. Bu rakam, bilgisayarınızın RAM miktarının azaldığı anlarda SWAP hafızasını kullanma eğilimini gösteririr. 0-100 arası değerlerle ifade edilir. Sunucu olarak kullanılan Linux bilgisayarlarda normal bir oran olmasına rağmen kişisel bilgisayarlarda bu oran fazladır. SWAP kullanılma eğilimi fazla olduğunda, sanki RAM'a yardımcı olduğu düşünülse de ortaya kaçınılmaz olarak Diske yazma ve diskten okuma işlemi çıkar. Ve bu bilgisayarı yavaşlatır.



Üstelik bilgisayarlar, önceliği yazılıma ve kodların çalışmasına verir. Sizin müzik, belge vb. verilerinizi okuyacak, işlem yapacak yazılım çalışmazsa zaten geri kalan işler yapılamayacağından, öncelik yazılımdadır. Böyle olunca büyük ihtimalle, sizin okunmasını istediğiniz verileriniz, RAM den SWAP alanına, sonra tekrar SWAP alanından RAM hafızasına gidip gelecektir. Böyle olunca bilgisayarınız kasacaktır, bu kaçınılmazdır.



Bunun için şöyle bir kural oluşturalım ve deneyelim.



RAM Miktarınız 1 GB ve daha fazla ise vm.swappiness=10



RAM Miktarınız 1 GB dan daha ise ise vm.swappiness=5



Bir metin editör ile ve sudo komutuyla /etc/sysctl.conf dosyanızı açıp en alt kısma aşağıdaki satırı yapıştırın ve kaydedin.


```bash
sudo nano /etc/sysctl.conf```


```bash
# Swap kullanım oranını düşürerek bilgisayarı hızlandırma
vm.swappiness=10
```



Dosyayı kaydederek çıkın ve bilgisayarınızı tekrar başlatın. Aşağıdaki komutu bilgisayarınız açılınca tekrar verin. Değerin 10 olduğunu göreceksiniz.


```bash
cat /proc/sys/vm/swappiness
```



Bir kaç gün böyle deneyin bilgisayarınızı. Bakalım hızda bir fark olacak mı? Değişen bir şey olmaz ise sysctl.conf dosyasına eklediğimiz satırları sildiğiniz anda eski ayarlarınıza dönebilirsiniz.
