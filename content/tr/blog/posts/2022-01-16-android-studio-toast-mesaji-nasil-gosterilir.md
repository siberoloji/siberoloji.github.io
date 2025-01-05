---
draft: false

title:  'Android Studio Toast Mesajı Nasıl Gösterilir?'
date: '2022-01-16T09:25:43+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/android-studio-toast-mesaji-nasil-gosterilir/
burst_total_pageviews_count:
    - '14'
featured_image: /images/Android_Robot_original.png
categories:
    - 'Android Kod Örnekleri'
tags:
    - android
    - 'toast mesajı nasıl gösterilir?'
---


Android Studio'da Toast mesajı yapmak için kod örneğini bulabilirsiniz.



## Örnek-1


```kotlin
val text = "Hello toast!"
val duration = Toast.LENGTH_SHORT
val toast = Toast.makeText(applicationContext, text, duration)
toast.show()```



veya direk çağırabilirsiniz.



## Örnek-2


```kotlin
Toast.makeText(context, text, duration).show()```



## Örnek-3



Bu örnekte, bir butona basınca sayacı arttırıp ekrana Toast mesajı görüntüleyen kod bulunmaktadır.


```kotlin
class MainActivity : AppCompatActivity() {
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
}
```



## Önemli



Gördüğünüz gibi, yukarıda örneğin çalışabilmesi için activity_main.xml dosyanızda bir button ve bir textView elemanının önceden tanımlanmış olması gerekiyor.  activity_main.xml  dosyanızın içini aşağıdaki kod ile değiştirebilirsiniz.


```


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

&lt;/androidx.constraintlayout.widget.ConstraintLayout&gt;
```


<!-- wp:buttons -->
<div class="wp-block-buttons"><!-- wp:button -->
<div class="wp-block-button"><a class="wp-block-button__link wp-element-button" href="https://github.com/siberolojibilisim/Button-Click-Counter-with-toast-message" target="_blank" rel="noreferrer noopener">Github Görüntüle</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->