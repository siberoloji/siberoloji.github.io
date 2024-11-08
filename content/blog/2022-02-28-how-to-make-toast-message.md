---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Android Code Samples
date: "2022-02-28T20:43:12Z"
guid: https://blog.siberoloji.com/?p=168
id: 168
image: /assets/images/2022/02/Android_Robot_original.png
tags:
- android
- toast message
title: How to make Toast message?
url: /how-to-make-toast-message/
---

<!-- wp:paragraph -->
<p>You can find a code sample to make a Toast message in Android Studio</p>
  

<!-- wp:more -->
<!--more-->
<!-- /wp:more -->

 
 ## Example-1</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin"><code>val text = "Hello toast!"
val duration = Toast.LENGTH_SHORT

val toast = Toast.makeText(applicationContext, text, duration)
toast.show()</code></code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>or you can call directly</p>
  

 
 ## Example-2</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin"><code>Toast.makeText(context, text, duration).show()</code></code></pre>
<!-- /wp:code -->

 
 ## Example-3</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>With this example, you can display a "click counter" and a "toast message" together.</p>
  

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

 
 ## Important...</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>As you can see, there must be a button and textView element in your activity_main.xml file. You can find an example below.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;?xml version="1.0" encoding="utf-8"?&gt;
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
<div class="wp-block-buttons"><!-- wp:button {"backgroundColor":"subtle-background","textColor":"primary","className":"is-style-fill"} -->
<div class="wp-block-button is-style-fill"><a class="wp-block-button__link has-primary-color has-subtle-background-background-color has-text-color has-background wp-element-button" href="https://github.com/siberolojibilisim/Button-Click-Counter-with-toast-message" target="_blank" rel="noreferrer noopener">see on gıthub</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons -->