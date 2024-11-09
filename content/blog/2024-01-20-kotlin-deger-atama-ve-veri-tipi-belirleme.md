---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "3"
categories:
- Temel Kotlin
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-20T15:04:03Z"
excerpt: 'Kotlin programlama dilinde değişken tanımlama konusunda bilinmesi gereken
  bazı ince noktaları bu yazımızda açıklayacağız. '
guid: https://www.siberoloji.com/?p=711
id: 711
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- yazılım
title: Kotlin değer atama ve veri tipi belirleme
url: /tr/kotlin-deger-atama-ve-veri-tipi-belirleme/
---

  Kotlin programlama dilinde değişken tanımlama konusunda bilinmesi gereken bazı ince noktaları bu yazımızda açıklayacağız. Önceki iki yazımızda ("<a href="https://www.siberoloji.com/kotlin-degisken-ve-deger-tanimlama/" data-type="post" data-id="694" target="_blank" rel="noreferrer noopener">Kotlin Değişken ve Değer tanımlama</a>", "<a href="https://www.siberoloji.com/kotlinde-sabitler-ve-degiskenler/" data-type="post" data-id="700" target="_blank" rel="noreferrer noopener">Kotlin’de Sabitler ve değişkenler</a>") açıkladığımız kurallara ilave olarak bu yazıyı hazırladık. 
 

  Hepimiz sayıların ve yazıların farklı türler olduğunu biliyoruz. Sayılar ile matematiksel işlemler yapılır iken yazılar ile matematik işlemleri yapılmaz. Bu ayrımın programla dillerinde de olduğunu belirtmeliyiz. Bu yüzden her değişkenin bir tipi bulunmalıdır.
 

 
 ## Değişken Tanımlama Şablonu
<!-- /wp:heading -->

  Kotlin programlama dilinde değişken tanımlama şablonu aşağıdaki gibidir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val/var identifier: Type = initialization</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- En başta val veya var ifadesi yer alır. Değişkenin değerinin davranışına göre val veya var seçimi yapılır. Bunun farklarını "<a href="https://www.siberoloji.com/kotlin-degisken-ve-deger-tanimlama/" data-type="post" data-id="694" target="_blank" rel="noreferrer noopener">Kotlin Değişken ve Değer tanımlama</a>" başlıklı yazımızda açıklamıştık. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- identifier: Yani değişkenin ismi olmalıdır. Diğer değişkenler ile karışmaması için anlamlı ve ne işe yaradığını anlatan bir isim seçimi her zaman faydalı bir kullanım olacaktır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Type : Değişkenin tipini burada yazıyoruz. Değerin tipini ifade eden String, Int, Boolean gibi ifadeler büyük harfle başlar. Değişkenin isminden sonra iki nokta üst üste yazıldıktan sonra tip yazılır 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Initialization : Değişkenimize ilk değer atamasını yapıyoruz. Başlangıç değeri anlamına gelir. Değişkenin tip belirlendiğinde ilk değer hemen atanmak zorunda değildir. Birazdan doğru ve yanlış kullanım örneklerini aşağıda vereceğiz. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Şimdi bu şablona göre bir örnek yazalım. Aşağıdaki örnek, tüm kuralları eksiksiz yerine getiren bir yapıdadır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String = "John"
    //identifier =name , Type = String, initialization = John
    var age: Int = 16
    //identifier =age , Type = Int, initialization = 16
    println(name)
    println(age)
}
John
16

Process finished with exit code 0</code></pre>
<!-- /wp:code -->

 
 ## Veri Tipinin Belirlenmesi (type inference)
<!-- /wp:heading -->

  Bir değişkeni tanımladığımız anda ilk değerini de (initializer) belirliyorsak, veri tipini yazmayabiliriz. Kotlin, girilen ilk değere bakarak tipini kendisi tespit edecektir. Bu şekilde kodlarımız daha sade hale gelir. Örnek aşağıdadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name= "John"
    //identifier =name , initialization = John
    var age= 16
    //identifier =age , initialization = 16
  
    println(name::class.simpleName)
    println(age::class.simpleName)
}

/* Expected Output
String
Int

Process finished with exit code 0
*/</code></pre>
<!-- /wp:code -->

  Yukarıda bulunan örnekte görüldüğü gibi, veri tipleri girilmediği halde ilk değerlerin tipine bakarak Kotlin veri tipini otomatik belirlemiştir. Yabancı kaynaklardan konuyu incelediğinizde bu işlemin "type inference" olarak ifade edildiğini görebilirsiniz.
 

 
 ## İlk Değer Olmadan Değişken Tanımlama
<!-- /wp:heading -->

  Bir değişkeni tanımlamak ancak ilk değerini sonra belirlemek isterseniz, değişkenin tipini mutlaka yazmanız gerekmektedir. Kotlin ilk değer olmadan değişkenin tipini belirleyemez. Kotlin için değişken tanımlandığında tipi de belirlenmelidir. Sonradan tip değiştirilemez. Aşağıda bunun örneğini görebilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String
    //identifier =name , Type = String
    var age: Int
    //identifier =age , Type
    name = "John"
    age = 16
}</code></pre>
<!-- /wp:code -->

  Örnekte görüldüğü gibi değişken adı ve tipi belirlenmiş ancak ilk değer başka bir yerde belirlenmiştir. Bu kullanım doğrudur. İlk değer başka zaman belirleniyorsa değişken tipini yazmak gerekir.
 

 
 ## Hatalı değişken tanımlama
<!-- /wp:heading -->

  Hem Veri tipi, hem de ilk değeri olmadan değişken tanımlama hata ile karşılaşmanıza sebep olur. Aşağıdaki kullanım yanlıştır. Programınız derlenmeyecektir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name //error
    name = "John"
   
    var age //error
    age = 16
}</code></pre>
<!-- /wp:code -->