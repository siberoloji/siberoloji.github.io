---
draft: false

title:  'Bubble Sort Algoritmasını Anlamak: Adım Adım Kılavuz'
date: '2024-10-02T00:25:42+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/bubble-sort-algoritmasini-anlamak-adim-adim-kilavuz/
 
featured_image: /images/cyber7.jpg
categories:
    - Programlama
---


Sıralama algoritmaları, veritabanları, arama motorları ve veri analitiği gibi çeşitli uygulamalarda verileri düzenlemek için kullanıldıkları için bilgisayar biliminde önemlidir. En temel ve yaygın olarak öğretilen sıralama algoritmalarından biri **Bubble Sort'tur** . Bubble Sort büyük veri kümeleri için en verimli algoritma olmasa da, basitliği onu sıralama algoritmalarını öğrenmek için mükemmel bir başlangıç ​​noktası yapar.



Bu blog yazısında, Bubble Sort algoritmasının ne olduğunu, nasıl çalıştığını, avantajlarını ve dezavantajlarını ve diğer sıralama algoritmalarıyla nasıl karşılaştırıldığını inceleyeceğiz. Ayrıca, Bubble Sort'un verimsizliklerine rağmen hala yararlı olabileceği gerçek dünya uygulamalarını ve senaryolarını tartışacağız.



## Bubble Sort Algoritması Nedir?



**Bubble Sort,** listede tekrar tekrar adım atan, bitişik öğeleri karşılaştıran ve yanlış sıradaysa onları değiştiren karşılaştırma tabanlı bir sıralama algoritmasıdır. Bu işlem, liste sıralanana kadar devam eder. Algoritma, daha küçük öğelerin listenin en üstüne (başlangıcına) "kabarcıklanması", daha büyük öğelerin ise listeden her geçişte en altına (sona) "batması" nedeniyle bu ismi almıştır.



Bubble Sort'un Temel Özellikleri:


* **Yerinde Sıralama** : Kabarcık Sıralaması, giriş dizisinin ötesinde sıralama için ek bellek gerektirmez ve bu da onu yerinde bir sıralama algoritması yapar.

* **Kararlı Sıralama** : Kabarcık Sıralaması, eşit öğelerin göreceli sırasını koruyan kararlı bir sıralama algoritmasıdır.

* **Basitlik** : Algoritmanın anlaşılması ve uygulanması kolaydır, bu da onu sıralama temellerini öğretmek için yaygın bir tercih haline getirir.




## Bubble Sort Nasıl Çalışır?



Bubble Sort, listede birden fazla kez yineleme yaparak, bitişik öğeleri karşılaştırarak ve yanlış sıradaysalar yerlerini değiştirerek çalışır. Bu işlem, liste tamamen sıralanana kadar devam eder.



Kabarcık Sıralamanın Adım Adım Açıklaması



Bubble Sort sürecini bir örnekle inceleyelim. Aşağıdaki sıralanmamış diziyi ele alalım:



[ [5, 3, 8, 4, 2] ]



İlk Geçiş:


* İlk iki öğeyi (5 ve 3) karşılaştırın. 5 &gt; 3 olduğundan, bunları değiştiriyoruz: [ [3, 5, 8, 4, 2] ]

* Sonraki iki öğeyi (5 ve 8) karşılaştırın. 5 &lt; 8 olduğundan takas gerekmez. [ [3, 5, 8, 4, 2] ]

* Sonraki iki öğeyi (8 ve 4) karşılaştırın. 8 &gt; 4 olduğundan, bunları değiştiriyoruz: [ [3, 5, 4, 8, 2] ]

* Son iki öğeyi (8 ve 2) karşılaştırın. 8 &gt; 2 olduğundan, bunları değiştiriyoruz: [ [3, 5, 4, 2, 8] ]




İlk geçişin sonunda, en büyük eleman (8) listenin sonunda doğru pozisyonuna "kabarcıklanmıştır".



İkinci Geçiş:


* İlk iki öğeyi (3 ve 5) karşılaştırın. 3 &lt; 5 olduğundan takas gerekmez. [ [3, 5, 4, 2, 8] ]

* Sonraki iki öğeyi (5 ve 4) karşılaştırın. 5 &gt; 4 olduğundan, bunları değiştiriyoruz: [ [3, 4, 5, 2, 8] ]

* Sonraki iki öğeyi (5 ve 2) karşılaştırın. 5 &gt; 2 olduğundan, bunları değiştiriyoruz: [ [3, 4, 2, 5, 8] ]




İkinci geçişin sonunda, ikinci en büyük eleman (5) doğru pozisyonuna hareket etmiştir.



Üçüncü Geçiş:


* İlk iki öğeyi (3 ve 4) karşılaştırın. 3 &lt; 4 olduğundan takas gerekmez. [ [3, 4, 2, 5, 8] ]

* Sonraki iki öğeyi (4 ve 2) karşılaştırın. 4 &gt; 2 olduğundan, bunları değiştiriyoruz: [ [3, 2, 4, 5, 8] ]




Üçüncü geçişin sonunda üçüncü en büyük eleman (4) doğru pozisyonundadır.



Dördüncü Geçiş:


* İlk iki öğeyi (3 ve 2) karşılaştırın. 3 &gt; 2 olduğundan, bunları değiştiriyoruz: [ [2, 3, 4, 5, 8] ]




Artık liste tam olarak hazır ve artık geçiş iznine gerek yok.



Kabarcık Sıralaması için Sahte Kod



Algoritma hakkında daha net bir fikir vermek için Bubble Sort'un sözde kodu şöyledir:


```bash
BubbleSort(arr[], n)
    for i = 0 to n-1 do
        for j = 0 to n-i-2 do
            if arr[j] &gt; arr[j+1] then
                Swap arr[j] and arr[j+1]```



Bu sözde kodda, dış döngü dizideki her bir eleman için çalışırken, iç döngü bitişik elemanları karşılaştırır ve değiştirir.



## Bubble Sort'un Zaman ve Mekan Karmaşıklığı



Bubble Sort basitliğiyle bilinir, ancak özellikle büyük veri kümeleri için en verimli sıralama algoritması değildir. Zaman ve mekan karmaşıklığını inceleyelim:


* **Zaman Karmaşıklığı** :

* **En İyi Durum** : En iyi durum zaman karmaşıklığı, dizi zaten sıralandığında meydana gelir. Bu durumda, Bubble Sort dizide yine de bir kez yineleme yapar, ancak hiçbir takas yapılmaz. En iyi durum zaman karmaşıklığı **O(n)'** dir .

* **En Kötü Durum** : Dizinin ters sırada sıralandığı en kötü durumda, Bubble Sort her geçişte her bir elemanı karşılaştırmalı ve değiştirmelidir. En kötü durum zaman karmaşıklığı **O(n^2)'** dir .

* **Ortalama Durum** : Ortalama durumda, Kabarcık Sıralaması **O(n^2)** karşılaştırma ve takas gerçekleştirir ve bu da büyük veri kümeleri için verimsiz hale getirir.

* **Uzay Karmaşıklığı** : Kabarcık Sıralaması yerinde bir sıralama algoritmasıdır, bu nedenle yalnızca **O(1)** ek bellek kullanır; bu da belleğin sınırlı olduğu durumlarda bir avantajdır.




## Bubble Sort'u Optimize Etme



Kabarcık Sıralaması genellikle en verimli algoritma olmasa da onu optimize etmenin yolları vardır:



Erken Fesih



En kötü durumda, Bubble Sort dizi sıralandıktan sonra bile gereksiz geçişler yapmaya devam eder. Bunu önlemek için, bir geçiş sırasında herhangi bir takas yapılıp yapılmadığını tespit etmek için bir bayrak ekleyebiliriz. Hiçbir takas yapılmadıysa, dizi zaten sıralanmıştır ve algoritmayı erken sonlandırabiliriz.



İşte optimize edilmiş sözde kod:


```bash
OptimizedBubbleSort(arr[], n)
    for i = 0 to n-1 do
        swapped = false
        for j = 0 to n-i-2 do
            if arr[j] &gt; arr[j+1] then
                Swap arr[j] and arr[j+1]
                swapped = true
        if swapped == false
            break```



Bayrağı ekleyerek `swapped`, algoritmanın dizi sıralanır sıralanmaz durmasını sağlıyoruz ve bu da en iyi senaryoda geçiş sayısını potansiyel olarak azaltıyor.



## Diğer Sıralama Algoritmalarıyla Karşılaştırma



Kabarcık Sıralaması ve Seçme Sıralaması



**Seçim Sıralaması** , dizinin sıralanmamış kısmından en küçük (veya en büyük) elemanı tekrar tekrar seçip sıralanmış kısma taşıyan başka bir basit sıralama algoritmasıdır.


* **Zaman Karmaşıklığı** : Hem Kabarcık Sıralaması hem de Seçim Sıralaması en kötü durum zaman karmaşıklığına **O(n^2)** sahiptir , ancak Seçim Sıralaması genellikle daha az takas gerçekleştirir.

* **Kararlılık** : Kabarcık Sıralaması kararlıdır, ancak Seçim Sıralaması değildir. Bu, Kabarcık Sıralamasının eşit öğelerin göreli sırasını koruduğu, ancak Seçim Sıralamasının korumadığı anlamına gelir.

* **Pratik Kullanım** : Daha az takas nedeniyle, Seçim Sıralaması pratikte Kabarcık Sıralamasından daha iyi performans gösterebilir, ancak her iki algoritma da büyük veri kümeleri için verimsizdir.




Kabarcık Sıralaması ve Eklemeli Sıralama



**Eklemeli Sıralama** , her bir elemanı doğru pozisyonuna ekleyerek sıralı diziyi her seferinde bir eleman olacak şekilde oluşturan basit bir algoritmadır.


* **Zaman Karmaşıklığı** : En iyi durumda, dizi neredeyse sıralandığında, Eklemeli Sıralamanın zaman karmaşıklığı **O(n)** olur ve bu da onu en kötü durumda her zaman **O(n^2)** olarak çalışan Kabarcık Sıralamadan daha verimli hale getirir .

* **Kararlılık** : Hem Kabarcık Sıralama hem de Eklemeli Sıralama kararlıdır.

* **Pratik Kullanım** : Eklemeli Sıralama, özellikle küçük veya neredeyse sıralanmış diziler için, ortalama ve en iyi durumlarda daha iyi performans göstermesi nedeniyle, genellikle Kabarcık Sıralamasına göre tercih edilir.




Kabarcık Sıralama ve Hızlı Sıralama



**Hızlı Sıralama,** dizileri sıralamak için böl ve yönet yaklaşımını kullanan oldukça verimli bir sıralama algoritmasıdır.


* **Zaman Karmaşıklığı : Hızlı Sıralama, ****O(n log n)** ortalama zaman karmaşıklığına sahiptir ve bu da onu büyük veri kümeleri için Kabarcık Sıralama'dan çok daha hızlı hale getirir.

* **Uzay Karmaşıklığı** : Hızlı Sıralama da yerinde bir sıralama algoritmasıdır, ancak en kötü durum zaman karmaşıklığı **O(n^2)'** dir . Ancak, uygun pivot seçimiyle, bu en kötü durum senaryosundan kaçınılabilir.

* **Pratik Kullanım** : Hızlı Sıralama, verimliliği nedeniyle gerçek dünya uygulamalarında yaygın olarak kullanılırken, Kabarcık Sıralama öncelikle eğitim amaçlı kullanılır.




## Bubble Sort'un Avantajları



Verimsizliklerine rağmen Bubble Sort'un birkaç avantajı vardır:



1. **Basitlik**



Bubble Sort, anlaşılması ve uygulanması en basit sıralama algoritmalarından biridir. Basit mantığı, onu yeni başlayanlara sıralama kavramlarını tanıtmak için mükemmel bir seçim haline getirir.



2. **Yerinde Sıralama**



Bubble Sort doğrudan giriş dizisi üzerinde çalışır ve ek bellek gerektirmez, bu da onu yerinde bir sıralama algoritması yapar. Bu özellik, bellek kısıtlı ortamlarda faydalıdır.



3. **İstikrar**



Kararlı bir sıralama algoritması olan Bubble Sort, eşit öğelerin göreceli sırasını korur; bu, kayıtları birden fazla ölçüte göre sıralamak gibi belirli uygulamalarda önemli olabilir.



# #



Bubble Sort'un Dezavantajları



Bubble Sort'un basitliğine rağmen pratik kullanımını sınırlayan bazı dezavantajları vardır:



1. **Verimsizlik**



**Bubble Sort'un O(n^2)** zaman karmaşıklığı vardır ve bu da onu büyük veri kümeleri için oldukça verimsiz hale getirir. Algoritma, özellikle büyük dizileri işlerken Hızlı Sıralama, Birleştirme Sıralaması ve Yığın Sıralaması gibi daha gelişmiş sıralama tekniklerine kıyasla zayıf performans gösterir.



2. **Aşırı Karşılaştırmalar ve Takaslar**



Bubble Sort, dizi zaten sıralanmış veya neredeyse sıralanmış olsa bile öğeleri karşılaştırır ve takas eder, bu da gereksiz işlemlere yol açar. Erken sonlandırma algoritmayı optimize edebilse de, çoğu durumda diğer sıralama yöntemlerinden daha yavaştır.



## Kabarcık Sıralamanın Gerçek Dünya Uygulamaları



Verimsizliği göz önüne alındığında, Bubble Sort performansın bir endişe olduğu gerçek dünya uygulamalarında nadiren kullanılır. Ancak, hala geçerli olabileceği birkaç senaryo vardır:


* **Eğitim Amaçları** : Kabarcık Sıralama, basitliği nedeniyle bilgisayar bilimi derslerinde giriş algoritması olarak yaygın olarak öğretilir.

* **Küçük Veri Kümeleri** : Veri kümesinin boyutunun minimum olduğu küçük diziler veya listeler için, Kabarcık Sıralaması makul bir seçim olabilir çünkü küçük girdiler için verimsizliği daha az fark edilir.

* **Neredeyse Sıralanmış Veriler** : Veriler neredeyse sıralandığında, Kabarcık Sıralaması (erken sonlandırma optimizasyonuyla) diziyi verimli bir şekilde sıralayabilir ve **O(n)** zaman karmaşıklığına ulaşabilir.




## Sonuç



Bubble Sort, en temel sıralama algoritmalarından biridir ve genellikle bilgisayar biliminde tanıtılan ilk sıralama tekniğidir. Anlaması ve uygulaması basit olsa da, Bubble Sort, **O(n^2)** zaman karmaşıklığı nedeniyle büyük veri kümeleri için uygun değildir. Quick Sort veya Merge Sort gibi daha gelişmiş algoritmalar genellikle daha büyük veri kümeleri için veya performans kritik olduğunda tercih edilir.



Ancak Bubble Sort'un kararlılığı ve yerinde sıralama özellikleri onu kullanışlı bir öğretim aracı ve küçük veya neredeyse sıralanmış veri kümeleri için kabul edilebilir bir seçenek haline getirir. Bubble Sort'u anlayarak, öğrenmeye devam ederken daha karmaşık ve etkili sıralama teknikleriyle başa çıkmanıza yardımcı olacak sıralama algoritmalarında bir temel kazanırsınız.
