---
draft: false
title: How Jetpack Compose Integrates with Existing Android Applications
linkTitle: Integrating Jetpack Compose with Existing Android Apps
translationKey: integrating-jetpack-compose-with-existing-android-apps
description: Learn how Jetpack Compose integrates with existing Android applications, allowing for a gradual migration to the modern UI toolkit.
url: integrating-jetpack-compose-with-existing-android-apps
weight: 40
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
Jetpack Compose is Google's modern UI toolkit for building native Android applications. Its declarative approach, built entirely in Kotlin, simplifies UI development compared to the traditional View-based system. However, many developers face the challenge of integrating Compose into their existing Android applications, which are often built using XML layouts and the View system. The good news is that Jetpack Compose is designed to coexist with legacy components, allowing for gradual migration without the need to rewrite entire applications.

In this blog post, we'll explore the various ways Jetpack Compose integrates with existing Android applications, covering key aspects such as embedding Compose in Views, using Views inside Compose, state management, navigation, and performance considerations.

---

## **Understanding Compose’s Compatibility with View-based UI**

Jetpack Compose does not require a full-scale migration from Views to be useful. Instead, it provides interop (interoperability) APIs that allow seamless integration with existing View-based UIs. This enables developers to adopt Compose incrementally, testing the waters without a full overhaul of their UI structure.

## **1. Embedding Jetpack Compose in an Existing View-based App**

One of the most common ways to introduce Jetpack Compose into an existing application is by embedding Compose UI elements inside an existing View hierarchy. This is achieved using the `ComposeView`, which serves as a bridge between the traditional View system and the Compose runtime.

### **How to Use ComposeView**

The `ComposeView` is a standard Android `View` that can be added to XML layouts or dynamically in an activity or fragment. Here's an example of how to include a Compose UI element inside an XML layout:

```xml
<androidx.compose.ui.platform.ComposeView
    android:id="@+id/compose_view"
    android:layout_width="match_parent"
    android:layout_height="wrap_content" />
```

In the corresponding Activity or Fragment, you can initialize the `ComposeView` programmatically:

```kotlin
findViewById<ComposeView>(R.id.compose_view).setContent {
    MyComposableUI()
}
```

This method allows you to start using Compose without having to restructure your entire View-based UI.

## **2. Embedding Views Inside a Compose Layout**

Conversely, developers can integrate traditional Views into a Compose-based UI using the `AndroidView` composable. This is particularly useful when working with custom Views or third-party libraries that are not yet Compose-compatible.

### **Using AndroidView**

Here’s an example of embedding a native Android `Button` inside a Compose layout:

```kotlin
@Composable
fun AndroidButtonInCompose() {
    AndroidView(
        factory = { context ->
            Button(context).apply {
                text = "Click Me"
                setOnClickListener {
                    Toast.makeText(context, "Button clicked!", Toast.LENGTH_SHORT).show()
                }
            }
        }
    )
}
```

This approach ensures that existing View-based widgets can still be used within a Compose-based UI without rewriting them.

## **3. State Management Between Compose and Views**

When integrating Compose into a View-based application, managing state between the two UI paradigms becomes an important consideration. The key is to use shared ViewModels, LiveData, or other observable patterns to maintain consistency.

### **Using ViewModel to Share State**

A shared ViewModel can be used to ensure that both View-based UI and Compose UI elements respond to the same data changes:

```kotlin
class SharedViewModel : ViewModel() {
    private val _text = MutableLiveData("Hello from ViewModel")
    val text: LiveData<String> = _text
}
```

Inside the Compose UI:

```kotlin
@Composable
fun MyComposableUI(viewModel: SharedViewModel) {
    val text by viewModel.text.observeAsState("")
    Text(text = text)
}
```

By observing the ViewModel state inside Compose, you ensure consistency across different UI paradigms.

## **4. Navigation Between Compose and Views**

Jetpack Compose provides its own navigation library (`androidx.navigation.compose`) that integrates with the traditional Android Navigation Component, making it easy to transition between Compose and View-based destinations.

### **Navigating from a View to Compose**

If you are using the Navigation Component, you can define a Compose destination within a NavGraph:

```kotlin
composable("composeScreen") {
    MyComposableUI()
}
```

Then navigate to it from a View-based UI using:

```kotlin
findNavController().navigate(R.id.composeScreen)
```

### **Navigating from Compose to a View-based Screen**

Within a Compose UI, you can trigger navigation back to a View-based fragment or activity:

```kotlin
val navController = rememberNavController()
Button(onClick = {
    navController.navigate("viewFragment")
}) {
    Text("Go to View Fragment")
}
```

This allows seamless transitions between View and Compose components.

## **5. Performance Considerations**

When integrating Compose into an existing Android application, performance is a key factor. Here are some best practices to ensure a smooth experience:

- **Use ComposeView efficiently**: Avoid excessive re-compositions by ensuring that only necessary UI elements are updated.
- **Optimize recomposition**: Use `remember`, `rememberSaveable`, and `derivedStateOf` to minimize unnecessary recompositions.
- **Profile UI performance**: Utilize Android Studio’s profiler to measure UI rendering times and identify performance bottlenecks.

## **Conclusion**

Jetpack Compose provides a flexible and gradual migration path for developers looking to integrate modern UI paradigms into their existing Android applications. By embedding Compose within Views, incorporating Views inside Compose, sharing state effectively, and managing navigation smoothly, developers can take advantage of Compose’s benefits without the need for a complete rewrite.

Whether you are building new features with Compose or transitioning an entire UI incrementally, Jetpack Compose’s interoperability with the traditional View system ensures a smooth and manageable adoption process. As Compose continues to evolve, its integration capabilities will only improve, making it a powerful tool for Android development in the years to come.
