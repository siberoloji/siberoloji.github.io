---
draft: false
title: View Binding with Activities in an Android Project
date: 2022-03-02T12:59:34+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /view-binding-with-activities-in-an-android-project/
featured_image: /images/Android_Robot_original.png
categories:
    - Android Code Samples
tags:
    - android
    - viewbinding
---

View binding is a feature that allows you to more easily write code that interacts with views. Once view binding is enabled in a module, it generates a binding class for each XML layout file present in that module. An instance of a binding class contains direct references to all views that have an ID in the corresponding layout.

In most cases, view binding replaces `findViewById`
Credit: [developer.android.com](https://developer.android.com/topic/libraries/view-binding)

To activate View Binding, we need to add a build option in the module-level build.gradle file. Modify your build.gradle (Module) file as shown below.

```kotlin
android {
    compileSdk 32

    buildFeatures {
        viewBinding  true
    }
....
}
```

For example, in the beginning, we have an activity_main.xml layout file. After activating View Binding, a new Class will be created named ActivityMainBinding. Now we can use this class in our activity file.

```kotlin
const val EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE"

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main) before
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // val sendButton = findViewById<Button>(R.id.sendButton) before
        val sendButton = binding.sendButton
        // val myTextView = findViewById<EditText>(R.id.message) before
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
