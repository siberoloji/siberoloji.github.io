---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Android Code Samples
date: "2022-03-01T17:34:17Z"
guid: https://blog.siberoloji.com/?p=203
id: 203
image: /assets/images/2022/03/androidkeyboardadjustment.png
tags:
- android
- move layout up
- soft keyboard
title: How to move the layout up when the soft keyboard is shownAndroid?
url: /how-to-move-the-layout-up-when-the-soft-keyboard-is-shown-android/
---

  Sometimes, you need to change the layout when the soft keyboard appeared on the screen. You can fix this by adding a line of code into the AndroidManifest.xml file within the relevant activity section. 
 

<!-- wp:code -->
<pre title="Code to xml file" class="wp-block-code"><code lang="kotlin" class="language-kotlin">android:windowSoftInputMode="adjustResize"</code></pre>
<!-- /wp:code -->

  Add this code to the activity. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">&lt;activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="fullSensor"
            android:theme="@style/NoActionBarTheme"
            android:windowSoftInputMode="adjustResize"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN" /&gt;

                &lt;category android:name="android.intent.category.LAUNCHER" /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;</code></pre>
<!-- /wp:code -->