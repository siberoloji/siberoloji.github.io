---
draft: false
title: Setting Up Navigation Compose in Jetpack Compose
linkTitle: Setting Up Navigation Compose
translationKey: setting-up-navigation-compose-in-jetpack-compose
description: A step-by-step guide to setting up Navigation Compose in Jetpack Compose.
url: setting-up-navigation-compose-in-jetpack-compose
weight: 240
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Navigation Compose
---
Jetpack Compose has revolutionized UI development in Android by providing a declarative and reactive approach to building interfaces. One of the key components of any modern Android app is navigation, and Jetpack Compose provides an intuitive way to handle this with **Navigation Compose**. This article will guide you through setting up **Navigation Compose**, handling arguments, and using advanced navigation patterns in Jetpack Compose.

---

## What is Navigation Compose?

Navigation Compose is part of **Android Jetpack’s Navigation Component**, designed specifically for Jetpack Compose applications. It allows developers to define and manage app navigation in a simple and structured manner using the **NavHost** and **NavController**.

**Key benefits of Navigation Compose:**

- **Declarative navigation**: Define routes in a centralized location.
- **Type-safe argument passing**: Easily pass and retrieve arguments.
- **Integration with ViewModel**: Navigation can work seamlessly with ViewModel scopes.
- **Deep linking support**: Enables handling of deep links with minimal setup.
- **Back stack management**: Handles the navigation stack automatically.

---

## Setting Up Navigation Compose

To use Navigation Compose in your project, you need to add the necessary dependencies and set up a basic navigation system.

### Step 1: Add Dependencies

First, ensure that you have the required dependencies in your `build.gradle (Module: app)` file:

```kotlin
implementation("androidx.navigation:navigation-compose:2.7.5")
```

### Step 2: Create a NavHost

A **NavHost** is a container that holds different composable screens and manages their transitions based on navigation events.

```kotlin
@Composable
fun MainNavigation() {
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = "home") {
        composable("home") { HomeScreen(navController) }
        composable("details") { DetailsScreen(navController) }
    }
}
```

### Step 3: Implement Composable Screens

Create simple composable screens that accept a `NavController` to navigate between them.

#### Home Screen

```kotlin
@Composable
fun HomeScreen(navController: NavController) {
    Column(modifier = Modifier.fillMaxSize(), horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = "Home Screen", fontSize = 24.sp)
        Button(onClick = { navController.navigate("details") }) {
            Text("Go to Details")
        }
    }
}
```

#### Details Screen

```kotlin
@Composable
fun DetailsScreen(navController: NavController) {
    Column(modifier = Modifier.fillMaxSize(), horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = "Details Screen", fontSize = 24.sp)
        Button(onClick = { navController.popBackStack() }) {
            Text("Back to Home")
        }
    }
}
```

---

## Passing Arguments in Navigation Compose

Navigation often requires passing data between screens. Navigation Compose supports both **optional** and **mandatory** arguments.

### Step 1: Define a Route with an Argument

Modify the `NavHost` to pass an argument to the `DetailsScreen`.

```kotlin
NavHost(navController = navController, startDestination = "home") {
    composable("home") { HomeScreen(navController) }
    composable("details/{message}") { backStackEntry ->
        val message = backStackEntry.arguments?.getString("message")
        DetailsScreen(navController, message)
    }
}
```

### Step 2: Update the Navigation Call

Modify the `HomeScreen` button click event to include an argument:

```kotlin
Button(onClick = { navController.navigate("details/HelloCompose") }) {
    Text("Go to Details with Argument")
}
```

### Step 3: Modify `DetailsScreen` to Accept an Argument

```kotlin
@Composable
fun DetailsScreen(navController: NavController, message: String?) {
    Column(modifier = Modifier.fillMaxSize(), horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = "Details Screen", fontSize = 24.sp)
        Text(text = "Message: $message", fontSize = 18.sp)
        Button(onClick = { navController.popBackStack() }) {
            Text("Back to Home")
        }
    }
}
```

---

## Advanced Navigation Techniques

### 1. Navigation with Sealed Classes for Type Safety

To make navigation safer and avoid hardcoded strings, use sealed classes:

```kotlin
sealed class Screen(val route: String) {
    object Home : Screen("home")
    object Details : Screen("details/{message}") {
        fun createRoute(message: String) = "details/$message"
    }
}
```

Modify navigation calls accordingly:

```kotlin
navController.navigate(Screen.Details.createRoute("Hello Compose"))
```

### 2. Handling Back Navigation

You can handle back navigation using `popBackStack()`:

```kotlin
Button(onClick = { navController.popBackStack() }) {
    Text("Back")
}
```

To handle **back navigation manually**, override the back press behavior:

```kotlin
BackHandler(enabled = true) {
    navController.popBackStack()
}
```

### 3. Navigation with Bottom Navigation

For apps with bottom navigation, use **BottomNavigationBar**:

```kotlin
@Composable
fun BottomNavBar(navController: NavController) {
    BottomNavigation {
        BottomNavigationItem(
            icon = { Icon(Icons.Default.Home, contentDescription = "Home") },
            label = { Text("Home") },
            selected = false,
            onClick = { navController.navigate("home") }
        )
        BottomNavigationItem(
            icon = { Icon(Icons.Default.Info, contentDescription = "Details") },
            label = { Text("Details") },
            selected = false,
            onClick = { navController.navigate("details/Welcome") }
        )
    }
}
```

---

## Conclusion

Jetpack Compose’s **Navigation Compose** simplifies navigation in modern Android apps. By using a **NavHost** and **NavController**, you can define screens, pass arguments, and handle navigation efficiently. Whether you are working with simple navigation, deep linking, or bottom navigation, Navigation Compose provides a seamless experience.

With a **declarative** and **type-safe** approach, Navigation Compose ensures that developers can build robust and scalable navigation architectures. Start integrating Navigation Compose into your Jetpack Compose projects today!

