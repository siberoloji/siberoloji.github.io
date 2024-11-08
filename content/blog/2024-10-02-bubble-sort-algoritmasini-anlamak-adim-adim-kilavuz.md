---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Programlama
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-02T00:25:42Z"
guid: https://www.siberoloji.com/?p=2105
id: 2105
image: /assets/images/2024/06/cyber7.jpg
title: 'Bubble Sort Algoritmasını Anlamak: Adım Adım Kılavuz'
url: /tr/bubble-sort-algoritmasini-anlamak-adim-adim-kilavuz/
---

  Sıralama algoritmaları, veritabanları, arama motorları ve veri analitiği gibi çeşitli uygulamalarda verileri düzenlemek için kullanıldıkları için bilgisayar biliminde önemlidir. En temel ve yaygın olarak öğretilen sıralama algoritmalarından biri&nbsp;<strong>Bubble Sort'tur</strong>&nbsp;. Bubble Sort büyük veri kümeleri için en verimli algoritma olmasa da, basitliği onu sıralama algoritmalarını öğrenmek için mükemmel bir başlangıç ​​noktası yapar. 
 

  Bu blog yazısında, Bubble Sort algoritmasının ne olduğunu, nasıl çalıştığını, avantajlarını ve dezavantajlarını ve diğer sıralama algoritmalarıyla nasıl karşılaştırıldığını inceleyeceğiz. Ayrıca, Bubble Sort'un verimsizliklerine rağmen hala yararlı olabileceği gerçek dünya uygulamalarını ve senaryolarını tartışacağız. 
 

 
 ## Bubble Sort Algoritması Nedir?</h2>
<!-- /wp:heading -->

  <strong>Bubble Sort,</strong>&nbsp;listede tekrar tekrar adım atan, bitişik öğeleri karşılaştıran ve yanlış sıradaysa onları değiştiren karşılaştırma tabanlı bir sıralama algoritmasıdır. Bu işlem, liste sıralanana kadar devam eder. Algoritma, daha küçük öğelerin listenin en üstüne (başlangıcına) "kabarcıklanması", daha büyük öğelerin ise listeden her geçişte en altına (sona) "batması" nedeniyle bu ismi almıştır. 
 

<!-- wp:heading {"level":3} -->
 ### Bubble Sort'un Temel Özellikleri:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Yerinde Sıralama</strong> : Kabarcık Sıralaması, giriş dizisinin ötesinde sıralama için ek bellek gerektirmez ve bu da onu yerinde bir sıralama algoritması yapar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kararlı Sıralama</strong> : Kabarcık Sıralaması, eşit öğelerin göreceli sırasını koruyan kararlı bir sıralama algoritmasıdır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Basitlik</strong> : Algoritmanın anlaşılması ve uygulanması kolaydır, bu da onu sıralama temellerini öğretmek için yaygın bir tercih haline getirir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Bubble Sort Nasıl Çalışır?</h2>
<!-- /wp:heading -->

  Bubble Sort, listede birden fazla kez yineleme yaparak, bitişik öğeleri karşılaştırarak ve yanlış sıradaysalar yerlerini değiştirerek çalışır. Bu işlem, liste tamamen sıralanana kadar devam eder. 
 

<!-- wp:heading {"level":3} -->
 ### Kabarcık Sıralamanın Adım Adım Açıklaması</h3>
<!-- /wp:heading -->

  Bubble Sort sürecini bir örnekle inceleyelim. Aşağıdaki sıralanmamış diziyi ele alalım: 
 

  [<br>[5, 3, 8, 4, 2]<br>] 
 

<!-- wp:heading {"level":3} -->
 ### İlk Geçiş:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>İlk iki öğeyi (5 ve 3) karşılaştırın. 5 &gt; 3 olduğundan, bunları değiştiriyoruz:<br>[ [3, 5, 8, 4, 2] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonraki iki öğeyi (5 ve 8) karşılaştırın. 5 &lt; 8 olduğundan takas gerekmez.<br>[ [3, 5, 8, 4, 2] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonraki iki öğeyi (8 ve 4) karşılaştırın. 8 &gt; 4 olduğundan, bunları değiştiriyoruz:<br>[ [3, 5, 4, 8, 2] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Son iki öğeyi (8 ve 2) karşılaştırın. 8 &gt; 2 olduğundan, bunları değiştiriyoruz:<br>[ [3, 5, 4, 2, 8] ]</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  İlk geçişin sonunda, en büyük eleman (8) listenin sonunda doğru pozisyonuna "kabarcıklanmıştır". 
 

<!-- wp:heading {"level":3} -->
 ### İkinci Geçiş:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>İlk iki öğeyi (3 ve 5) karşılaştırın. 3 &lt; 5 olduğundan takas gerekmez.<br>[ [3, 5, 4, 2, 8] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonraki iki öğeyi (5 ve 4) karşılaştırın. 5 &gt; 4 olduğundan, bunları değiştiriyoruz:<br>[ [3, 4, 5, 2, 8] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonraki iki öğeyi (5 ve 2) karşılaştırın. 5 &gt; 2 olduğundan, bunları değiştiriyoruz:<br>[ [3, 4, 2, 5, 8] ]</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  İkinci geçişin sonunda, ikinci en büyük eleman (5) doğru pozisyonuna hareket etmiştir. 
 

<!-- wp:heading {"level":3} -->
 ### Üçüncü Geçiş:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>İlk iki öğeyi (3 ve 4) karşılaştırın. 3 &lt; 4 olduğundan takas gerekmez.<br>[ [3, 4, 2, 5, 8] ]</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonraki iki öğeyi (4 ve 2) karşılaştırın. 4 &gt; 2 olduğundan, bunları değiştiriyoruz:<br>[ [3, 2, 4, 5, 8] ]</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Üçüncü geçişin sonunda üçüncü en büyük eleman (4) doğru pozisyonundadır. 
 

<!-- wp:heading {"level":3} -->
 ### Dördüncü Geçiş:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>İlk iki öğeyi (3 ve 2) karşılaştırın. 3 &gt; 2 olduğundan, bunları değiştiriyoruz:<br>[ [2, 3, 4, 5, 8] ]</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Artık liste tam olarak hazır ve artık geçiş iznine gerek yok. 
 

<!-- wp:heading {"level":3} -->
 ### Kabarcık Sıralaması için Sahte Kod</h3>
<!-- /wp:heading -->

  Algoritma hakkında daha net bir fikir vermek için Bubble Sort'un sözde kodu şöyledir: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">BubbleSort(arr[], n)
    for i = 0 to n-1 do
        for j = 0 to n-i-2 do
            if arr[j] &gt; arr[j+1] then
                Swap arr[j] and arr[j+1]</code></pre>
<!-- /wp:code -->

  Bu sözde kodda, dış döngü dizideki her bir eleman için çalışırken, iç döngü bitişik elemanları karşılaştırır ve değiştirir. 
 

 
 ## Bubble Sort'un Zaman ve Mekan Karmaşıklığı</h2>
<!-- /wp:heading -->

  Bubble Sort basitliğiyle bilinir, ancak özellikle büyük veri kümeleri için en verimli sıralama algoritması değildir. Zaman ve mekan karmaşıklığını inceleyelim: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Zaman Karmaşıklığı</strong> :</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>En İyi Durum</strong> : En iyi durum zaman karmaşıklığı, dizi zaten sıralandığında meydana gelir. Bu durumda, Bubble Sort dizide yine de bir kez yineleme yapar, ancak hiçbir takas yapılmaz. En iyi durum zaman karmaşıklığı <strong>O(n)'</strong> dir .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>En Kötü Durum</strong> : Dizinin ters sırada sıralandığı en kötü durumda, Bubble Sort her geçişte her bir elemanı karşılaştırmalı ve değiştirmelidir. En kötü durum zaman karmaşıklığı <strong>O(n^2)'</strong> dir .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ortalama Durum</strong> : Ortalama durumda, Kabarcık Sıralaması <strong>O(n^2)</strong> karşılaştırma ve takas gerçekleştirir ve bu da büyük veri kümeleri için verimsiz hale getirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Uzay Karmaşıklığı</strong> : Kabarcık Sıralaması yerinde bir sıralama algoritmasıdır, bu nedenle yalnızca <strong>O(1)</strong> ek bellek kullanır; bu da belleğin sınırlı olduğu durumlarda bir avantajdır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Bubble Sort'u Optimize Etme</h2>
<!-- /wp:heading -->

  Kabarcık Sıralaması genellikle en verimli algoritma olmasa da onu optimize etmenin yolları vardır: 
 

<!-- wp:heading {"level":3} -->
 ### Erken Fesih</h3>
<!-- /wp:heading -->

  En kötü durumda, Bubble Sort dizi sıralandıktan sonra bile gereksiz geçişler yapmaya devam eder. Bunu önlemek için, bir geçiş sırasında herhangi bir takas yapılıp yapılmadığını tespit etmek için bir bayrak ekleyebiliriz. Hiçbir takas yapılmadıysa, dizi zaten sıralanmıştır ve algoritmayı erken sonlandırabiliriz. 
 

  İşte optimize edilmiş sözde kod: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">OptimizedBubbleSort(arr[], n)
    for i = 0 to n-1 do
        swapped = false
        for j = 0 to n-i-2 do
            if arr[j] &gt; arr[j+1] then
                Swap arr[j] and arr[j+1]
                swapped = true
        if swapped == false
            break</code></pre>
<!-- /wp:code -->

  Bayrağı ekleyerek&nbsp;<code>swapped</code>, algoritmanın dizi sıralanır sıralanmaz durmasını sağlıyoruz ve bu da en iyi senaryoda geçiş sayısını potansiyel olarak azaltıyor. 
 

 
 ## Diğer Sıralama Algoritmalarıyla Karşılaştırma</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Kabarcık Sıralaması ve Seçme Sıralaması</h3>
<!-- /wp:heading -->

  <strong>Seçim Sıralaması</strong>&nbsp;, dizinin sıralanmamış kısmından en küçük (veya en büyük) elemanı tekrar tekrar seçip sıralanmış kısma taşıyan başka bir basit sıralama algoritmasıdır. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Zaman Karmaşıklığı</strong> : Hem Kabarcık Sıralaması hem de Seçim Sıralaması en kötü durum zaman karmaşıklığına <strong>O(n^2)</strong> sahiptir , ancak Seçim Sıralaması genellikle daha az takas gerçekleştirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kararlılık</strong> : Kabarcık Sıralaması kararlıdır, ancak Seçim Sıralaması değildir. Bu, Kabarcık Sıralamasının eşit öğelerin göreli sırasını koruduğu, ancak Seçim Sıralamasının korumadığı anlamına gelir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Pratik Kullanım</strong> : Daha az takas nedeniyle, Seçim Sıralaması pratikte Kabarcık Sıralamasından daha iyi performans gösterebilir, ancak her iki algoritma da büyük veri kümeleri için verimsizdir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Kabarcık Sıralaması ve Eklemeli Sıralama</h3>
<!-- /wp:heading -->

  <strong>Eklemeli Sıralama</strong>&nbsp;, her bir elemanı doğru pozisyonuna ekleyerek sıralı diziyi her seferinde bir eleman olacak şekilde oluşturan basit bir algoritmadır. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Zaman Karmaşıklığı</strong> : En iyi durumda, dizi neredeyse sıralandığında, Eklemeli Sıralamanın zaman karmaşıklığı <strong>O(n)</strong> olur ve bu da onu en kötü durumda her zaman <strong>O(n^2)</strong> olarak çalışan Kabarcık Sıralamadan daha verimli hale getirir .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kararlılık</strong> : Hem Kabarcık Sıralama hem de Eklemeli Sıralama kararlıdır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Pratik Kullanım</strong> : Eklemeli Sıralama, özellikle küçük veya neredeyse sıralanmış diziler için, ortalama ve en iyi durumlarda daha iyi performans göstermesi nedeniyle, genellikle Kabarcık Sıralamasına göre tercih edilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Kabarcık Sıralama ve Hızlı Sıralama</h3>
<!-- /wp:heading -->

  <strong>Hızlı Sıralama,</strong>&nbsp;dizileri sıralamak için böl ve yönet yaklaşımını kullanan oldukça verimli bir sıralama algoritmasıdır. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Zaman Karmaşıklığı : Hızlı Sıralama, </strong><strong>O(n log n)</strong> ortalama zaman karmaşıklığına sahiptir ve bu da onu büyük veri kümeleri için Kabarcık Sıralama'dan çok daha hızlı hale getirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Uzay Karmaşıklığı</strong> : Hızlı Sıralama da yerinde bir sıralama algoritmasıdır, ancak en kötü durum zaman karmaşıklığı <strong>O(n^2)'</strong> dir . Ancak, uygun pivot seçimiyle, bu en kötü durum senaryosundan kaçınılabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Pratik Kullanım</strong> : Hızlı Sıralama, verimliliği nedeniyle gerçek dünya uygulamalarında yaygın olarak kullanılırken, Kabarcık Sıralama öncelikle eğitim amaçlı kullanılır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Bubble Sort'un Avantajları</h2>
<!-- /wp:heading -->

  Verimsizliklerine rağmen Bubble Sort'un birkaç avantajı vardır: 
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Basitlik</strong></h3>
<!-- /wp:heading -->

  Bubble Sort, anlaşılması ve uygulanması en basit sıralama algoritmalarından biridir. Basit mantığı, onu yeni başlayanlara sıralama kavramlarını tanıtmak için mükemmel bir seçim haline getirir. 
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Yerinde Sıralama</strong></h3>
<!-- /wp:heading -->

  Bubble Sort doğrudan giriş dizisi üzerinde çalışır ve ek bellek gerektirmez, bu da onu yerinde bir sıralama algoritması yapar. Bu özellik, bellek kısıtlı ortamlarda faydalıdır. 
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>İstikrar</strong></h3>
<!-- /wp:heading -->

  Kararlı bir sıralama algoritması olan Bubble Sort, eşit öğelerin göreceli sırasını korur; bu, kayıtları birden fazla ölçüte göre sıralamak gibi belirli uygulamalarda önemli olabilir. 
 

<!-- wp:heading {"level":1} -->
# # 
<!-- /wp:heading -->

  Bubble Sort'un Dezavantajları 
 

  Bubble Sort'un basitliğine rağmen pratik kullanımını sınırlayan bazı dezavantajları vardır: 
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Verimsizlik</strong></h3>
<!-- /wp:heading -->

  <strong>Bubble Sort'un O(n^2)</strong>&nbsp;zaman karmaşıklığı vardır&nbsp;ve bu da onu büyük veri kümeleri için oldukça verimsiz hale getirir. Algoritma, özellikle büyük dizileri işlerken Hızlı Sıralama, Birleştirme Sıralaması ve Yığın Sıralaması gibi daha gelişmiş sıralama tekniklerine kıyasla zayıf performans gösterir. 
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Aşırı Karşılaştırmalar ve Takaslar</strong></h3>
<!-- /wp:heading -->

  Bubble Sort, dizi zaten sıralanmış veya neredeyse sıralanmış olsa bile öğeleri karşılaştırır ve takas eder, bu da gereksiz işlemlere yol açar. Erken sonlandırma algoritmayı optimize edebilse de, çoğu durumda diğer sıralama yöntemlerinden daha yavaştır. 
 

 
 ## Kabarcık Sıralamanın Gerçek Dünya Uygulamaları</h2>
<!-- /wp:heading -->

  Verimsizliği göz önüne alındığında, Bubble Sort performansın bir endişe olduğu gerçek dünya uygulamalarında nadiren kullanılır. Ancak, hala geçerli olabileceği birkaç senaryo vardır: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Eğitim Amaçları</strong> : Kabarcık Sıralama, basitliği nedeniyle bilgisayar bilimi derslerinde giriş algoritması olarak yaygın olarak öğretilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Küçük Veri Kümeleri</strong> : Veri kümesinin boyutunun minimum olduğu küçük diziler veya listeler için, Kabarcık Sıralaması makul bir seçim olabilir çünkü küçük girdiler için verimsizliği daha az fark edilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Neredeyse Sıralanmış Veriler</strong> : Veriler neredeyse sıralandığında, Kabarcık Sıralaması (erken sonlandırma optimizasyonuyla) diziyi verimli bir şekilde sıralayabilir ve <strong>O(n)</strong> zaman karmaşıklığına ulaşabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Bubble Sort, en temel sıralama algoritmalarından biridir ve genellikle bilgisayar biliminde tanıtılan ilk sıralama tekniğidir. Anlaması ve uygulaması basit olsa da, Bubble Sort,&nbsp;<strong>O(n^2)</strong>&nbsp;zaman karmaşıklığı nedeniyle büyük veri kümeleri için uygun değildir. Quick Sort veya Merge Sort gibi daha gelişmiş algoritmalar genellikle daha büyük veri kümeleri için veya performans kritik olduğunda tercih edilir. 
 

  Ancak Bubble Sort'un kararlılığı ve yerinde sıralama özellikleri onu kullanışlı bir öğretim aracı ve küçük veya neredeyse sıralanmış veri kümeleri için kabul edilebilir bir seçenek haline getirir. Bubble Sort'u anlayarak, öğrenmeye devam ederken daha karmaşık ve etkili sıralama teknikleriyle başa çıkmanıza yardımcı olacak sıralama algoritmalarında bir temel kazanırsınız. 
 