---
draft: false

title:  'Ekleme Sıralama Algoritması: Adım Adım Kılavuz'
date: '2024-10-02T00:40:10+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/ekleme-siralama-algoritmasi-adim-adim-kilavuz/
 
featured_image: /images/algorithms.jpeg
categories:
    - Programlama
---
Ekleme sıralaması, bir öğeyi önceden sıralanmış bir dizideki doğru konumuna tekrar tekrar ekleyerek çalışan basit bir sıralama algoritmasıdır. Küçük veri kümeleri için verimlidir ve dizi neredeyse sıralandığında iyi bir seçim olabilir.

**Ekleme Sıralaması Nasıl Çalışır?**
* **İkinci elemandan başlayalım:**  İlk eleman sıralanmış kabul edilir.

* **Karşılaştır ve ekle:**  Bir sonraki elemanı seç ve onu dizinin sıralanmış kısmındaki elemanlarla karşılaştır.

* **Öğeleri kaydır:**  Mevcut öğe karşılaştırılan öğeden küçükse, karşılaştırılan öğeyi ve ondan sonraki tüm öğeleri bir konum sağa kaydır.

* **Ekle:**  Geçerli öğeyi boş konuma ekle.

* **Tekrarla:**  Dizideki kalan tüm elemanlar için 2-4. adımları tekrarlayın.
**Görsel Örnek**

`[5, 2, 4, 6, 1, 3]` Diziyi ekleme sıralaması kullanarak sıralayalım  :

**Adım 1:**  İlk öğe (5) sıralanmış kabul edilir.

**Adım 2:**  2'yi 5 ile karşılaştırın. 2 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 2'yi yerleştirin.
* Sıralamak: `[2, 5, 4, 6, 1, 3]`
**Adım 3:**  4 ile 5'i karşılaştırın. 4 daha küçüktür, bu yüzden 5'i sağa kaydırın ve onun yerine 4'ü yerleştirin.
* Sıralamak: `[2, 4, 5, 6, 1, 3]`
**Adım 4:**  6 ile 5'i karşılaştırın. 6 daha büyüktür, bu nedenle yerinde kalır.
* Sıralamak: `[2, 4, 5, 6, 1, 3]`
**Adım 5:**  1 ile 5'i karşılaştırın. 1 daha küçüktür, dolayısıyla 5, 6 ve 3'ü sağa kaydırın ve onun yerine 1'i yerleştirin.
* Sıralamak: `[1, 2, 4, 5, 6, 3]`
**Adım 6:**  3 ile 5'i karşılaştırın. 3 daha küçüktür, bu yüzden 5 ve 6'yı sağa kaydırın ve onun yerine 3'ü yerleştirin.
* Sıralamak: `[1, 2, 3, 4, 5, 6]`
Dizi artık sıralandı.

**Kod Uygulaması (Python)**
```bash
def insertion_sort(arr):
  n = len(arr)

  # Traverse through 1 to n
  for i in range(1, n):
    key = arr[i]

    # Move elements of arr[0..i-1], that are
    # greater than key,    to one position ahead
    # of their current position
    j = i-1
    while j >= 0 and key < arr[j]:
        arr[j+1] = arr[j]
        j -= 1
    arr[j+1] = key

# Driver code to test above
arr    = [5, 2, 4, 6, 1, 3]
insertion_sort(arr)
print("Sorted array is:")
for i in range(len(arr)):
    print(arr[i], end=" ")
```

**Zaman Karmaşıklığı**
* **En iyi durum:**  Dizi zaten sıralanmıştır. Zaman karmaşıklığı O(n)'dir.

* **Ortalama durum:**  Zaman karmaşıklığı O(n^2)'dir.

* **En kötü durum:**  Dizi ters sırada sıralanır. Zaman karmaşıklığı O(n^2)'dir.
**Uzay Karmaşıklığı**

Ekleme sıralamasının alan karmaşıklığı O(1)'dir çünkü yalnızca sabit miktarda ekstra alan gerektirir.

**Eklemeli Sıralamanın Avantajları**
* **Uygulanması kolay:**  Eklemeli sıralama anlaşılması ve kodlanması kolaydır.

* **Küçük veri kümeleri için verimli:**  Küçük diziler için iyi bir seçimdir.

* **Çevrimiçi algoritma:**  Öğeler geldikçe tek tek işlenebilir.

* **Stable:**  Eşit anahtarlara sahip öğelerin göreceli sırasını korur.
**Eklemeli Sıralamanın Dezavantajları**
* **Büyük veri kümeleri için verimsizdir:**  İkinci dereceden zaman karmaşıklığı nedeniyle büyük diziler için uygun değildir.

* **Yaklaşık olarak sıralanmış diziler için yavaş:**  Sıralanmış diziler için verimli olsa da, yaklaşık olarak sıralanmış diziler için yavaş olabilir.
**Sonuç**

Ekleme sıralaması, küçük veri kümeleri ve basit uygulamalar için uygun olan temel bir sıralama algoritmasıdır. Ancak, daha büyük veri kümeleri için hızlı sıralama veya birleştirme sıralaması gibi daha verimli algoritmalar tercih edilir. Ekleme sıralamasını anlamak, daha karmaşık sıralama algoritmalarını öğrenmek için iyi bir başlangıç ​​noktasıdır.
