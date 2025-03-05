---
draft: false
title: Handling Network Requests with Retrofit and Compose in Jetpack Compose
linkTitle: Handling Network Requests with Retrofit and Compose
translationKey: handling-network-requests-with-retrofit-and-compose-in-jetpack-compose
description: Handling network requests with Retrofit and Compose in Jetpack Compose
url: handling-network-requests-with-retrofit-and-compose-in-jetpack-compose
weight: 410
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Retrofit
---
In the ever-evolving world of Android development, Jetpack Compose has emerged as a modern toolkit for building native UIs. It simplifies and accelerates UI development on Android with a declarative approach, allowing developers to create dynamic and responsive interfaces with less code. However, building a modern app often involves more than just creating a beautiful UI. Most apps need to interact with backend services, fetch data, and display it to the user. This is where Retrofit, a popular HTTP client for Android, comes into play.

In this article, we’ll explore how to handle network requests using Retrofit in a Jetpack Compose application. We’ll cover the basics of Retrofit, how to integrate it with Compose, and best practices for managing network states and displaying data in a Compose UI.

---

## Table of Contents

1. **Introduction to Retrofit and Jetpack Compose**
2. **Setting Up Retrofit in Your Project**
3. **Creating a Retrofit Service**
4. **Handling Network Requests in Compose**
5. **Managing UI State in Compose**
6. **Displaying Data in a Compose UI**
7. **Error Handling and Loading States**
8. **Best Practices for Network Requests in Compose**
9. **Conclusion**

---

## 1. Introduction to Retrofit and Jetpack Compose

### What is Retrofit?

Retrofit is a type-safe HTTP client for Android and Java, developed by Square. It simplifies the process of making network requests by abstracting the boilerplate code required for HTTP communication. Retrofit allows you to define REST API endpoints as Java or Kotlin interfaces, making it easy to integrate with backend services.

### What is Jetpack Compose?

Jetpack Compose is Android’s modern toolkit for building native UIs. It uses a declarative approach, meaning you describe what the UI should look like, and Compose takes care of rendering it. Compose is designed to work seamlessly with other Jetpack libraries, making it a powerful tool for building modern Android apps.

Combining Retrofit with Jetpack Compose allows you to build apps that fetch data from the internet and display it in a dynamic, responsive UI.

---

## 2. Setting Up Retrofit in Your Project

Before we dive into writing code, let’s set up Retrofit in your Android project.

### Add Dependencies

First, add the necessary dependencies to your `build.gradle` file:

```gradle
dependencies {
    // Retrofit
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'

    // Coroutines for asynchronous programming
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.0'

    // Compose
    implementation 'androidx.activity:activity-compose:1.5.1'
    implementation 'androidx.compose.runtime:runtime-livedata:1.3.0'
}
```

### Create a Retrofit Instance

Next, create a Retrofit instance in your application. This instance will be used to make network requests.

```kotlin
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {
    private const val BASE_URL = "https://jsonplaceholder.typicode.com/"

    val instance: Retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }
}
```

---

## 3. Creating a Retrofit Service

To interact with an API, you need to define a Retrofit service. This service is an interface that describes the API endpoints.

### Define the API Interface

For example, let’s say we’re working with a simple API that returns a list of posts. Here’s how you can define the service:

```kotlin
import retrofit2.http.GET
import retrofit2.Call

interface ApiService {
    @GET("posts")
    suspend fun getPosts(): List<Post>
}
```

### Define the Data Model

The `Post` data class represents the structure of the data returned by the API.

```kotlin
data class Post(
    val userId: Int,
    val id: Int,
    val title: String,
    val body: String
)
```

---

## 4. Handling Network Requests in Compose

In Jetpack Compose, you can use Kotlin coroutines to handle asynchronous tasks like network requests. Here’s how you can fetch data from the API and display it in a Compose UI.

### Create a ViewModel

The ViewModel will handle the network request and expose the data to the UI.

```kotlin
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch

class PostViewModel : ViewModel() {
    private val _posts = MutableStateFlow<List<Post>>(emptyList())
    val posts: StateFlow<List<Post>> get() = _posts

    private val apiService = RetrofitClient.instance.create(ApiService::class.java)

    init {
        fetchPosts()
    }

    private fun fetchPosts() {
        viewModelScope.launch {
            try {
                val response = apiService.getPosts()
                _posts.value = response
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
}
```

---

## 5. Managing UI State in Compose

In Compose, you can use `State` to manage the UI state. The `PostViewModel` exposes a `StateFlow` that the UI can observe.

### Observe the State in Compose

Use the `collectAsState` function to observe the state in your Composable.

```kotlin
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel

@Composable
fun PostScreen(viewModel: PostViewModel = viewModel()) {
    val posts by viewModel.posts.collectAsState()

    if (posts.isEmpty()) {
        LoadingScreen()
    } else {
        PostList(posts = posts)
    }
}
```

---

## 6. Displaying Data in a Compose UI

Now that we have the data, let’s display it in a Compose UI.

### Create a Composable for the List

Here’s how you can create a simple list to display the posts:

```kotlin
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

@Composable
fun PostList(posts: List<Post>) {
    LazyColumn {
        items(posts) { post ->
            PostItem(post = post)
        }
    }
}

@Composable
fun PostItem(post: Post) {
    Text(text = post.title)
    Text(text = post.body)
}
```

---

## 7. Error Handling and Loading States

A good user experience includes handling loading states and errors gracefully.

### Loading State

Display a loading indicator while the data is being fetched.

```kotlin
@Composable
fun LoadingScreen() {
    Text("Loading...")
}
```

### Error Handling

Show an error message if the network request fails.

```kotlin
@Composable
fun ErrorScreen(message: String) {
    Text("Error: $message")
}
```

---

## 8. Best Practices for Network Requests in Compose

- **Use ViewModel**: Keep your network logic in the ViewModel to separate concerns.
- **Use StateFlow**: Expose data as `StateFlow` for Compose to observe.
- **Handle Errors**: Always handle network errors and display appropriate messages to the user.
- **Optimize Performance**: Use `remember` and `mutableStateOf` to avoid unnecessary recompositions.

---

## 9. Conclusion

Handling network requests with Retrofit and Jetpack Compose is a powerful combination for building modern Android apps. By following the steps outlined in this post, you can create a robust and responsive UI that fetches and displays data from the internet. Remember to handle loading and error states gracefully, and always follow best practices to ensure a smooth user experience.

With Retrofit and Compose, the possibilities are endless.
