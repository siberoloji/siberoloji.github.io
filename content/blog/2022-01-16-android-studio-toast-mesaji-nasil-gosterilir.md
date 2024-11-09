---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "14"
categories:
- Android Kod Örnekleri
date: "2022-01-16T09:25:43Z"
guid: https://blog.siberoloji.com/?p=136
id: 136
image: /assets/images/2022/02/Android_Robot_original.png
tags:
- android
- toast mesajı nasıl gösterilir?
title: Android Studio Toast Mesajı Nasıl Gösterilir?
url: /tr/android-studio-toast-mesaji-nasil-gosterilir/
---

  Android Studio'da Toast mesajı yapmak için kod örneğini bulabilirsiniz. 
 

 
 ## Örnek-1
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val text = "Hello toast!"
val duration = Toast.LENGTH_SHORT
val toast = Toast.makeText(applicationContext, text, duration)
toast.show()</code></pre>
<!-- /wp:code -->

  veya direk çağırabilirsiniz. 
 

 
 ## Örnek-2
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">Toast.makeText(context, text, duration).show()</code></pre>
<!-- /wp:code -->

 
 ## Örnek-3
<!-- /wp:heading -->

  Bu örnekte, bir butona basınca sayacı arttırıp ekrana Toast mesajı görüntüleyen kod bulunmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val clkButton = findViewById&lt;Button&gt;(R.id.button)
        val myTextView = findViewById&lt;TextView&gt;(R.id.textView)
        var timesClicked = 0

        clkButton.setOnClickListener{
            timesClicked += 1
            myTextView.text = timesClicked.toString()
            Toast.makeText(this@MainActivity, "Hi friend", Toast.LENGTH_LONG).show()
        }
    }
}</code></pre>
<!-- /wp:code -->

 
 ## Önemli
<!-- /wp:heading -->

  Gördüğünüz gibi, yukarıda örneğin çalışabilmesi için activity_main.xml dosyanızda bir button ve bir textView elemanının önceden tanımlanmış olması gerekiyor.  activity_main.xml  dosyanızın içini aşağıdaki kod ile değiştirebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">

&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity"&gt;

    &lt;TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/salutation"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        tools:text="this is for developer" /&gt;

    &lt;Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="149dp"
        android:layout_marginTop="248dp"
        android:layout_marginEnd="149dp"
        android:layout_marginBottom="23dp"
        android:text="@string/button"
        app:layout_constraintBottom_toTopOf="@+id/textView"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" /&gt;

&lt;/androidx.constraintlayout.widget.ConstraintLayout&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:buttons -->
<div class="wp-block-buttons"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button" href="https://github.com/siberolojibilisim/Button-Click-Counter-with-toast-message" target="_blank" rel="noreferrer noopener">Github Görüntüle</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->