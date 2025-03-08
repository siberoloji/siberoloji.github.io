---
draft: false
title: Implementing Authentication with Firebase in Jetpack Compose
linkTitle: Implementing Authentication with Firebase in Jetpack Compose
translationKey: implementing-authentication-with-firebase-in-jetpack-compose
description: A blog post on implementing authentication with Firebase in a Jetpack Compose application.
url: implementing-authentication-with-firebase-in-jetpack-compose
weight: 490
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Firebase
---
## Introduction

User authentication is a crucial feature in modern mobile applications. Firebase Authentication provides an easy-to-integrate, secure, and scalable solution for handling user authentication. With Jetpack Compose, Android's modern UI toolkit, developers can implement authentication seamlessly using declarative UI components.

In this blog post, we will walk through the process of integrating Firebase Authentication in a Jetpack Compose application. We will cover Firebase setup, authentication methods, UI implementation, and best practices for handling authentication states.

## Prerequisites

Before we begin, ensure you have the following:

- Android Studio (latest version)
- A Firebase project set up in the [Firebase Console](https://console.firebase.google.com/)
- Jetpack Compose dependencies in your Android project
- Basic knowledge of Kotlin and Jetpack Compose

## Step 1: Setting Up Firebase in Your Project

### 1.1 Create a Firebase Project

1. Go to the [Firebase Console](https://console.firebase.google.com/)
2. Click **Add Project** and follow the setup instructions
3. Register your Android app by providing the package name
4. Download the `google-services.json` file and place it in the `app/` directory

### 1.2 Add Firebase Dependencies

Open your `build.gradle` (Project-level) and ensure the following classpath is present:

```gradle
classpath 'com.google.gms:google-services:4.3.10'
```

In your `build.gradle` (App-level), add Firebase dependencies:

```gradle
plugins {
    id 'com.android.application'
    id 'com.google.gms.google-services'
}

dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.1.0')
    implementation 'com.google.firebase:firebase-auth-ktx'
}
```

Sync the project to apply the changes.

## Step 2: Configuring Firebase Authentication

### 2.1 Enable Authentication Methods

1. In Firebase Console, navigate to **Authentication**
2. Click **Sign-in method**
3. Enable Email/Password, Google Sign-In, or any preferred authentication method

### 2.2 Initialize Firebase Authentication

Create an authentication repository:

```kotlin
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.tasks.await

class AuthRepository {
    private val auth: FirebaseAuth = FirebaseAuth.getInstance()

    suspend fun signInWithEmail(email: String, password: String): Boolean {
        return try {
            auth.signInWithEmailAndPassword(email, password).await()
            true
        } catch (e: Exception) {
            false
        }
    }

    suspend fun signUpWithEmail(email: String, password: String): Boolean {
        return try {
            auth.createUserWithEmailAndPassword(email, password).await()
            true
        } catch (e: Exception) {
            false
        }
    }

    fun signOut() {
        auth.signOut()
    }

    fun getCurrentUser() = auth.currentUser
}
```

## Step 3: Creating Authentication UI with Jetpack Compose

### 3.1 Login Screen

```kotlin
@Composable
fun LoginScreen(authRepository: AuthRepository, onLoginSuccess: () -> Unit) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var isLoading by remember { mutableStateOf(false) }
    var loginError by remember { mutableStateOf<String?>(null) }

    Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.Center) {
        TextField(value = email, onValueChange = { email = it }, label = { Text("Email") })
        TextField(value = password, onValueChange = { password = it }, label = { Text("Password") }, visualTransformation = PasswordVisualTransformation())
        
        if (loginError != null) {
            Text(text = loginError!!, color = Color.Red)
        }
        
        Button(onClick = {
            isLoading = true
            CoroutineScope(Dispatchers.IO).launch {
                val success = authRepository.signInWithEmail(email, password)
                withContext(Dispatchers.Main) {
                    isLoading = false
                    if (success) onLoginSuccess() else loginError = "Login failed"
                }
            }
        }) {
            Text("Login")
        }
    }
}
```

### 3.2 Sign-Up Screen

```kotlin
@Composable
fun SignUpScreen(authRepository: AuthRepository, onSignUpSuccess: () -> Unit) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var signUpError by remember { mutableStateOf<String?>(null) }
    
    Column(modifier = Modifier.padding(16.dp)) {
        TextField(value = email, onValueChange = { email = it }, label = { Text("Email") })
        TextField(value = password, onValueChange = { password = it }, label = { Text("Password") }, visualTransformation = PasswordVisualTransformation())
        
        if (signUpError != null) {
            Text(text = signUpError!!, color = Color.Red)
        }
        
        Button(onClick = {
            CoroutineScope(Dispatchers.IO).launch {
                val success = authRepository.signUpWithEmail(email, password)
                withContext(Dispatchers.Main) {
                    if (success) onSignUpSuccess() else signUpError = "Sign-up failed"
                }
            }
        }) {
            Text("Sign Up")
        }
    }
}
```

## Step 4: Handling Authentication State

```kotlin
@Composable
fun MainScreen(authRepository: AuthRepository) {
    val user = remember { mutableStateOf(authRepository.getCurrentUser()) }

    if (user.value != null) {
        HomeScreen(authRepository)
    } else {
        LoginScreen(authRepository) { user.value = authRepository.getCurrentUser() }
    }
}
```

### Home Screen

```kotlin
@Composable
fun HomeScreen(authRepository: AuthRepository) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text("Welcome, ${authRepository.getCurrentUser()?.email}")
        Button(onClick = {
            authRepository.signOut()
        }) {
            Text("Sign Out")
        }
    }
}
```

## Conclusion

Implementing Firebase Authentication in Jetpack Compose is straightforward with Firebase Auth's powerful APIs and Jetpack Compose’s declarative UI paradigm. By setting up Firebase, configuring authentication methods, and creating UI screens, you can provide seamless user authentication in your app.

With this guide, you now have a foundational understanding of authentication in Jetpack Compose. You can extend this by adding more authentication providers like Google Sign-In, Facebook, or Phone Authentication for a richer user experience.
