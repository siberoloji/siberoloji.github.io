---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Android Code Samples
date: "2022-03-02T12:59:34Z"
guid: https://blog.siberoloji.com/?p=210
id: 210
image: /assets/images/2022/02/Android_Robot_original.png
tags:
- android
- view Binding
- viewbinding
title: View Binding with Activities in an Android Project
url: /view-binding-with-activities-in-an-android-project/
---

<!-- wp:quote -->
<blockquote class="wp-block-quote">  <em>View binding</em>&nbsp;is a feature that allows you to more easily write code that interacts with views. Once view binding is enabled in a module, it generates a&nbsp;<em>binding class</em>&nbsp;for each XML layout file present in that module. An instance of a binding class contains direct references to all views that have an ID in the corresponding layout. 
 

  In most cases, view binding replaces&nbsp;<code>findViewById</code>
 <cite>Credit: <a rel="noreferrer noopener" href="https://developer.android.com/topic/libraries/view-binding" target="_blank">developer.android.com</a></cite></blockquote>
<!-- /wp:quote -->

  To activate View Binding, we need to add a build option in the module-level build.gradle file. Modify your build.gradle (Module) file as shown below.
 

<!-- wp:code -->
<pre title="Build.gradle code" class="wp-block-code"><code lang="kotlin" class="language-kotlin">android {
    compileSdk 32

    buildFeatures {
        viewBinding  true
    }
....
}</code></pre>
<!-- /wp:code -->

  For example, in the beginning, we have an activity_main.xml layout file. After activating View Binding, a new Class will be created named ActivityMainBinding. Now we can use this class in our activity file.
 

<!-- wp:code -->
<pre title="After changing findViewById lines" class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE"

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main) before
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // val sendButton = findViewById&lt;Button&gt;(R.id.sendButton) before
        val sendButton = binding.sendButton
        // val myTextView = findViewById&lt;EditText&gt;(R.id.message) before
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

}</code></pre>
<!-- /wp:code -->