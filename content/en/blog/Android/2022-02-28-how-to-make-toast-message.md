---
draft: false
title: How to make Toast message?
date: 2022-02-28T20:43:12+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /how-to-make-toast-message/
featured_image: /images/Android_Robot_original.png
categories:
    - Android Code Samples
tags:
    - android
    - toast message
linkTitle: Toast Message
description: You can find a code sample to make a Toast message in Android Studio
translationKey: how-to-make-toast-message
---
You can find a code sample to make a Toast message in Android Studio

## Example-1

```kotlin
val text = "Hello toast!"
val duration = Toast.LENGTH_SHORT

val toast = Toast.makeText(applicationContext, text, duration)
toast.show()
````

or you can call directly

## Example-2

```kotlin
Toast.makeText(context, text, duration).show()
````

## Example-3

With this example, you can display a "click counter" and a "toast message" together.

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val clkButton = findViewById<Button>(R.id.button)
        val myTextView = findViewById<TextView>(R.id.textView)
        var timesClicked = 0

        clkButton.setOnClickListener{
            timesClicked += 1
            myTextView.text = timesClicked.toString()
            Toast.makeText(this@MainActivity, "Hi friend", Toast.LENGTH_LONG).show()
        }
    }
}
```

## Important

As you can see, there must be a button and textView element in your activity_main.xml file. You can find an example below.

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/salutation"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        tools:text="this is for developer" />

    <Button
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
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

[see on github](https://github.com/siberolojibilisim/Button-Click-Counter-with-toast-message)
