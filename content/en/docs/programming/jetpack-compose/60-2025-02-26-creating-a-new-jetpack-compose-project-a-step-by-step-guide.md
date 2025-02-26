---
draft: false
title: Creating a New Jetpack Compose Project
linkTitle: Creating a New Jetpack Compose Project
translationKey: creating-a-new-jetpack-compose-project
description: A step-by-step guide to creating a new Jetpack Compose project in Android Studio, from setting up the development environment to writing your first Composable function.
url: creating-a-new-jetpack-compose-project
weight: 60
date: 2025-02-26
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
---
# Creating a New Jetpack Compose Project: A Step-by-Step Guide

Jetpack Compose is Google's modern UI toolkit designed to simplify and accelerate Android UI development. Unlike the traditional XML-based layouts, Jetpack Compose uses a declarative programming model that makes UI creation more intuitive and flexible. Whether you're a beginner or an experienced Android developer, getting started with Jetpack Compose can significantly enhance your app development workflow.

In this blog post, we'll walk through the process of creating a new Jetpack Compose project, from setting up the development environment to writing your first Composable function. By the end, you'll have a basic understanding of how to start building UIs with Jetpack Compose.

## Prerequisites

Before we dive into creating a Jetpack Compose project, ensure that you have the following tools installed:

- **Android Studio (latest stable or preview version)** – Jetpack Compose is best supported in the latest versions of Android Studio.
- **Java Development Kit (JDK) 11 or later** – Required for Android development.
- **Gradle (bundled with Android Studio)** – To manage dependencies and build scripts.

If you haven’t installed Android Studio yet, download it from [developer.android.com](https://developer.android.com/studio) and follow the installation guide.

## Step 1: Creating a New Project in Android Studio

1. Open **Android Studio** and click on **New Project**.
2. In the "Select a Project Template" window, choose **Empty Compose Activity**. This template includes the essential setup for Jetpack Compose.
3. Click **Next**.
4. Enter the project details:
   - **Name**: Choose a name for your app.
   - **Package Name**: This should follow the standard reverse domain name convention (e.g., `com.example.myapp`).
   - **Save Location**: Select a directory for your project files.
   - **Language**: Choose **Kotlin** (Jetpack Compose only supports Kotlin).
   - **Minimum SDK**: Select **API 21 (Lollipop)** or higher (Jetpack Compose requires API 21+).
5. Click **Finish**, and Android Studio will generate the initial project files for you.

## Step 2: Understanding the Project Structure

Once the project is created, you'll notice a different structure compared to traditional Android projects:

- **MainActivity.kt**: The entry point of your app, containing a `setContent` block where Compose functions are invoked.
- **theme/Theme.kt**: Defines your app’s theme, including colors, typography, and shapes.
- **build.gradle (Module: app)**: Manages dependencies, including Jetpack Compose libraries.

### Key Dependencies in `build.gradle`

Your project should include Jetpack Compose dependencies. If they are missing, add the following lines in your `build.gradle (Module: app)` file under `dependencies`:

```kotlin
implementation("androidx.compose.ui:ui:1.5.0")
implementation("androidx.compose.material3:material3:1.2.0")
implementation("androidx.activity:activity-compose:1.7.0")
implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.6.1")
implementation("androidx.navigation:navigation-compose:2.7.0")
```

Sync the project by clicking **Sync Now** when prompted.

## Step 3: Writing Your First Composable Function

Jetpack Compose introduces **Composable functions**, which are the building blocks of UI components. Composable functions are marked with the `@Composable` annotation.

Here’s how you can create a simple Composable function:

```kotlin
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.myapp.ui.theme.MyAppTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyAppTheme {
                Greeting(name = "Jetpack Compose")
            }
        }
    }
}

@Composable
fun Greeting(name: String) {
    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        Text(text = "Hello, $name!", style = MaterialTheme.typography.headlineMedium)
        Button(onClick = { /* TODO */ }) {
            Text("Click Me")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MyAppTheme {
        Greeting(name = "Jetpack Compose")
    }
}
```

### Understanding the Code

- **`setContent {}`**: Replaces the traditional `setContentView()` and hosts Composable functions.
- **`@Composable`**: Marks a function as a UI component.
- **`Greeting(name: String)`**: A simple composable that displays a text message and a button.
- **`@Preview`**: Allows you to preview Composable functions without running the app on a device.

## Step 4: Running the App

To see Jetpack Compose in action, run your app by:

1. Clicking **Run** ▶ in Android Studio.
2. Selecting a connected device or an emulator.
3. The app should launch, displaying "Hello, Jetpack Compose!" with a button.

## Step 5: Exploring More Jetpack Compose Features

Now that you have a working project, here are some additional concepts to explore:

### 1. **State Management**

Jetpack Compose follows a unidirectional data flow model. You can use `remember` and `mutableStateOf` to manage UI state.

```kotlin
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }
    Column {
        Text("Count: $count")
        Button(onClick = { count++ }) {
            Text("Increase")
        }
    }
}
```

### 2. **Lazy Lists**

For displaying lists efficiently, use `LazyColumn`:

```kotlin
@Composable
fun ItemList() {
    LazyColumn {
        items(100) { index ->
            Text("Item #$index", modifier = Modifier.padding(8.dp))
        }
    }
}
```

### 3. **Navigation**

Jetpack Compose has a dedicated navigation library. You can define a navigation controller and navigate between screens.

```kotlin
val navController = rememberNavController()
NavHost(navController, startDestination = "home") {
    composable("home") { HomeScreen(navController) }
    composable("details") { DetailsScreen() }
}
```

## Conclusion

Creating a Jetpack Compose project is straightforward, and it offers a modern, declarative approach to UI development. By following this guide, you’ve set up a project, written your first Composable function, and learned some essential features of Jetpack Compose.

To further enhance your skills, consider exploring animations, themes, and advanced state management techniques. Happy coding!
