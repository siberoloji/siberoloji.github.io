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
date: "2024-10-02T00:40:10Z"
guid: https://www.siberoloji.com/?p=2115
id: 2115
image: /assets/images/2024/10/algorithms.jpeg
title: 'Ekleme Sıralama Algoritması: Adım Adım Kılavuz'
url: /tr/ekleme-siralama-algoritmasi-adim-adim-kilavuz/
---

  Ekleme sıralaması, bir öğeyi önceden sıralanmış bir dizideki doğru konumuna tekrar tekrar ekleyerek çalışan basit bir sıralama algoritmasıdır. Küçük veri kümeleri için verimlidir ve dizi neredeyse sıralandığında iyi bir seçim olabilir.
 

  ***Ekleme Sıralaması Nasıl Çalışır?*** 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***İkinci elemandan başlayalım:*** İlk eleman sıralanmış kabul edilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Karşılaştır ve ekle:*** Bir sonraki elemanı seç ve onu dizinin sıralanmış kısmındaki elemanlarla karşılaştır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Öğeleri kaydır:*** Mevcut öğe karşılaştırılan öğeden küçükse, karşılaştırılan öğeyi ve ondan sonraki tüm öğeleri bir konum sağa kaydır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Ekle:*** Geçerli öğeyi boş konuma ekle. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Tekrarla:*** Dizideki kalan tüm elemanlar için 2-4. adımları tekrarlayın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Görsel Örnek*** 
 

  <code>[5, 2, 4, 6, 1, 3]</code>&nbsp;Diziyi ekleme sıralaması kullanarak&nbsp;sıralayalım&nbsp; :
 

  ***Adım 1:*** &nbsp;&nbsp;İlk öğe (5) sıralanmış kabul edilir.
 

  ***Adım 2:*** &nbsp;&nbsp;2'yi 5 ile karşılaştırın. 2 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 2'yi yerleştirin.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Sıralamak:<code>[2, 5, 4, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Adım 3:*** &nbsp;&nbsp;4 ile 5'i karşılaştırın. 4 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 4'ü yerleştirin.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Sıralamak:<code>[2, 4, 5, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Adım 4:*** &nbsp;&nbsp;6 ile 5'i karşılaştırın. 6 daha büyüktür, bu nedenle yerinde kalır.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Sıralamak:<code>[2, 4, 5, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Adım 5:*** &nbsp;&nbsp;1 ile 5'i karşılaştırın. 1 daha küçüktür, dolayısıyla 5, 6 ve 3'ü sağa kaydırın ve onun yerine 1'i yerleştirin.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Sıralamak:<code>[1, 2, 4, 5, 6, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Adım 6:*** &nbsp;&nbsp;3 ile 5'i karşılaştırın. 3 daha küçüktür, bu yüzden 5 ve 6'yı sağa kaydırın ve onun yerine 3'ü yerleştirin.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Sıralamak:<code>[1, 2, 3, 4, 5, 6]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Dizi artık sıralandı.
 

  ***Kod Uygulaması (Python)*** 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">def insertion_sort(arr):
  n = len(arr)

  # Traverse through 1 to n
  for i in range(1, n):
    key = arr[i]

    # Move elements of arr[0..i-1], that are
    # greater than key,    to one position ahead
    # of their current position
    j = i-1
    while j &gt;= 0 and key &lt; arr[j]:
        arr[j+1] = arr[j]
        j -= 1
    arr[j+1] = key

# Driver code to test above
arr    = [5, 2, 4, 6, 1, 3]
insertion_sort(arr)
print("Sorted array is:")
for i in range(len(arr)):
    print(arr[i], end=" ")
</code></pre>
<!-- /wp:code -->

  ***Zaman Karmaşıklığı*** 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***En iyi durum:*** Dizi zaten sıralanmıştır. Zaman karmaşıklığı O(n)'dir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Ortalama durum:*** Zaman karmaşıklığı O(n^2)'dir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***En kötü durum:*** Dizi ters sırada sıralanır. Zaman karmaşıklığı O(n^2)'dir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Uzay Karmaşıklığı*** 
 

  Ekleme sıralamasının alan karmaşıklığı O(1)'dir çünkü yalnızca sabit miktarda ekstra alan gerektirir.
 

  ***Eklemeli Sıralamanın Avantajları*** 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Uygulanması kolay:*** Eklemeli sıralama anlaşılması ve kodlanması kolaydır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Küçük veri kümeleri için verimli:*** Küçük diziler için iyi bir seçimdir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Çevrimiçi algoritma:*** Öğeler geldikçe tek tek işlenebilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Stable:*** Eşit anahtarlara sahip öğelerin göreceli sırasını korur. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Eklemeli Sıralamanın Dezavantajları*** 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Büyük veri kümeleri için verimsizdir:*** İkinci dereceden zaman karmaşıklığı nedeniyle büyük diziler için uygun değildir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yaklaşık olarak sıralanmış diziler için yavaş:*** Sıralanmış diziler için verimli olsa da, yaklaşık olarak sıralanmış diziler için yavaş olabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Sonuç*** 
 

  Ekleme sıralaması, küçük veri kümeleri ve basit uygulamalar için uygun olan temel bir sıralama algoritmasıdır. Ancak, daha büyük veri kümeleri için hızlı sıralama veya birleştirme sıralaması gibi daha verimli algoritmalar tercih edilir. Ekleme sıralamasını anlamak, daha karmaşık sıralama algoritmalarını öğrenmek için iyi bir başlangıç ​​noktasıdır.
 