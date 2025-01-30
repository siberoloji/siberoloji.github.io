---
draft: false
title: Adding Upward Navigation Arrow
date: 2022-03-01T13:29:12+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /adding-upward-navigation-arrow/
featured_image: /images/upbuttonhalfscreen.png
categories:
    - Android Code Samples
tags:
    - android
    - android navigation arrow
linkTitle: Upward Navigation Arrow
description: In software for Android, except for the main activity, you will need to add the UP button for the user navigation.
translationKey: adding-upward-navigation-arrow
---
In software for Android, except for the main activity, you will need to add the UP button for the user navigation. You can display the UP button in the action bar by adding the necessary codes to the AndroidManifest.xml file of your Project.

In our project, we have two activities. One is Main Activity, the other one is DisplayMessageActivity. When the user taps the button in the MainActivity screen, the program enters the DisplayMessageActiviy. How can the user go BACK?

We can declare the PARENT activity name to the CHILD activity so Android will be able to show UP(Back) button in the DisplayMessageActiviy screen.

```kotlin
<activity>
            android:name=".DisplayMessageActivity"
            android:exported="false" />
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
```

After making necessary changes in your AndroidManifest.xml file, your code should be like this.

```kotlin
<activity
            android:name=".DisplayMessageActivity"
            android:parentActivityName=".MainActivity"
            android:exported="false" >
        <meta-data
            android:name="android.support.PARENT_ACTIVITY"
            android:value=".MainActivity" />
        </activity>

        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
```

The `android:parentActivityName` attribute was introduced in Android 4.1 (API level 16). To support devices with older versions of Android, define a 
[`<meta-data>`](https://developer.android.com/guide/topics/manifest/meta-data-element) name-value pair, where the name is `"android.support.PARENT_ACTIVITY"` and the value is the name of the parent activity.
