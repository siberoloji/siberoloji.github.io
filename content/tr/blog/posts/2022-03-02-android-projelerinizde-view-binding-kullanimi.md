---
draft: false

title:  'Android Projelerinizde View Binding Kullanımı'
date: '2022-03-02T13:09:28+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/android-projelerinizde-view-binding-kullanimi/
burst_total_pageviews_count:
    - '9'
featured_image: /images/Android_Robot_original.png
categories:
    - 'Android Kod Örnekleri'
tags:
    - android
    - kod
    - Örnekleri
    - 'view Binding'
    - viewbinding
---

<!-- wp:quote -->
<blockquote class="wp-block-quote">
viewBinding, görünümlerle etkileşime giren kodu daha kolay yazmanıza olanak tanıyan bir özelliktir. Bir modülde görünüm bağlama etkinleştirildiğinde, o modülde bulunan her XML düzeni dosyası için bir bağlama sınıfı oluşturur. Bir bağlama sınıfının bir örneği, karşılık gelen düzende bir kimliği olan tüm görünümlere doğrudan başvurular içerir.

Çoğu durumda, viewBinding, findViewById'nin yerini alır
<cite>Credit: <a rel="noreferrer noopener" href="https://developer.android.com/topic/libraries/view-binding" target="_blank">developer.android.com</a></cite></blockquote>
<!-- /wp:quote -->
ViewBinding'i etkinleştirmek için, modül düzeyinde build.gradle dosyasına bir derleme seçeneği eklememiz gerekiyor. build.gradle (Modül) dosyanızı aşağıda gösterildiği gibi değiştirin.
<!-- wp:code -->
<pre title="Build.gradle code" class="wp-block-code"><code lang="kotlin" class="language-kotlin">android {
    compileSdk 32

    buildFeatures {
        viewBinding  true
    }
....
}
```

Örneğin, başlangıçta bir Activity_main.xml layout dosyamız var. View Binding'i etkinleştirdikten sonra ActivityMainBinding adlı yeni bir Sınıf oluşturulacaktır. Artık bu sınıfı aktivite dosyamızda kullanabiliriz.
<!-- wp:code -->
<pre title="After changing findViewById lines" class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE"

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main) önce
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // val sendButton = findViewById<Button>(R.id.sendButton) önce
        val sendButton = binding.sendButton
        // val myTextView = findViewById<EditText>(R.id.message) önce
        val myTextView = binding.message

        /** Called when the user taps the Send button */
        sendButton.setOnClickListener {
            val message = myTextView.text.toString()
            val intent = Intent(this, DisplayMessageActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, message)
            }
            startActivity(intent)
        }
     }

}
```
