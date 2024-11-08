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

  Ekleme sıralaması, bir öğeyi önceden sıralanmış bir dizideki doğru konumuna tekrar tekrar ekleyerek çalışan basit bir sıralama algoritmasıdır. Küçük veri kümeleri için verimlidir ve dizi neredeyse sıralandığında iyi bir seçim olabilir.</p>
 

  <strong>Ekleme Sıralaması Nasıl Çalışır?</strong></p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>İkinci elemandan başlayalım:</strong>  İlk eleman sıralanmış kabul edilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Karşılaştır ve ekle:</strong>  Bir sonraki elemanı seç ve onu dizinin sıralanmış kısmındaki elemanlarla karşılaştır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Öğeleri kaydır:</strong>  Mevcut öğe karşılaştırılan öğeden küçükse, karşılaştırılan öğeyi ve ondan sonraki tüm öğeleri bir konum sağa kaydır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ekle:</strong>  Geçerli öğeyi boş konuma ekle.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Tekrarla:</strong>  Dizideki kalan tüm elemanlar için 2-4. adımları tekrarlayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  <strong>Görsel Örnek</strong></p>
 

  <code>[5, 2, 4, 6, 1, 3]</code>&nbsp;Diziyi ekleme sıralaması kullanarak&nbsp;sıralayalım&nbsp; :</p>
 

  <strong>Adım 1:</strong>&nbsp;&nbsp;İlk öğe (5) sıralanmış kabul edilir.</p>
 

  <strong>Adım 2:</strong>&nbsp;&nbsp;2'yi 5 ile karşılaştırın. 2 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 2'yi yerleştirin.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Sıralamak: <code>[2, 5, 4, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Adım 3:</strong>&nbsp;&nbsp;4 ile 5'i karşılaştırın. 4 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 4'ü yerleştirin.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Sıralamak: <code>[2, 4, 5, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Adım 4:</strong>&nbsp;&nbsp;6 ile 5'i karşılaştırın. 6 daha büyüktür, bu nedenle yerinde kalır.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Sıralamak: <code>[2, 4, 5, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Adım 5:</strong>&nbsp;&nbsp;1 ile 5'i karşılaştırın. 1 daha küçüktür, dolayısıyla 5, 6 ve 3'ü sağa kaydırın ve onun yerine 1'i yerleştirin.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Sıralamak: <code>[1, 2, 4, 5, 6, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Adım 6:</strong>&nbsp;&nbsp;3 ile 5'i karşılaştırın. 3 daha küçüktür, bu yüzden 5 ve 6'yı sağa kaydırın ve onun yerine 3'ü yerleştirin.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Sıralamak: <code>[1, 2, 3, 4, 5, 6]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Dizi artık sıralandı.</p>
 

  <strong>Kod Uygulaması (Python)</strong></p>
 

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

  <strong>Zaman Karmaşıklığı</strong></p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>En iyi durum:</strong>  Dizi zaten sıralanmıştır. Zaman karmaşıklığı O(n)'dir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ortalama durum:</strong>  Zaman karmaşıklığı O(n^2)'dir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>En kötü durum:</strong>  Dizi ters sırada sıralanır. Zaman karmaşıklığı O(n^2)'dir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Uzay Karmaşıklığı</strong></p>
 

  Ekleme sıralamasının alan karmaşıklığı O(1)'dir çünkü yalnızca sabit miktarda ekstra alan gerektirir.</p>
 

  <strong>Eklemeli Sıralamanın Avantajları</strong></p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Uygulanması kolay:</strong>  Eklemeli sıralama anlaşılması ve kodlanması kolaydır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Küçük veri kümeleri için verimli:</strong>  Küçük diziler için iyi bir seçimdir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Çevrimiçi algoritma:</strong>  Öğeler geldikçe tek tek işlenebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Stable:</strong>  Eşit anahtarlara sahip öğelerin göreceli sırasını korur.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Eklemeli Sıralamanın Dezavantajları</strong></p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Büyük veri kümeleri için verimsizdir:</strong>  İkinci dereceden zaman karmaşıklığı nedeniyle büyük diziler için uygun değildir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yaklaşık olarak sıralanmış diziler için yavaş:</strong>  Sıralanmış diziler için verimli olsa da, yaklaşık olarak sıralanmış diziler için yavaş olabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Sonuç</strong></p>
 

  Ekleme sıralaması, küçük veri kümeleri ve basit uygulamalar için uygun olan temel bir sıralama algoritmasıdır. Ancak, daha büyük veri kümeleri için hızlı sıralama veya birleştirme sıralaması gibi daha verimli algoritmalar tercih edilir. Ekleme sıralamasını anlamak, daha karmaşık sıralama algoritmalarını öğrenmek için iyi bir başlangıç ​​noktasıdır.</p>
 