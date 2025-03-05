---
draft: false
title: Understanding @Composable Annotation in Jetpack Compose
linkTitle: Composable Annotation in Jetpack Compose
translationKey: understanding-composable-annotation-in-jetpack-compose
description: A blog post explaining what `@Composable` functions are, how they work, best practices for using them, and common pitfalls to avoid.
url: understanding-composable-annotation-in-jetpack-compose
weight: 90
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Composable annotation
---
Jetpack Compose has revolutionized Android UI development by providing a modern, declarative approach to building user interfaces. At the core of this framework lies the `@Composable` annotation, which enables developers to create reusable UI components with ease. Understanding the `@Composable` annotation is crucial for anyone looking to build efficient, scalable, and maintainable Android applications.

In this article, we will delve deep into what `@Composable` functions are, how they work, best practices for using them, and common pitfalls to avoid. By the end of this article, you should have a solid grasp of how to leverage Jetpack Compose for your Android UI needs.

## What is @Composable?

The `@Composable` annotation is a core concept in Jetpack Compose. It is used to mark functions that define UI elements. Unlike traditional Android XML-based layouts, `@Composable` functions enable UI components to be described in a more intuitive and declarative manner.

### Example of a Simple @Composable Function

```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hello, $name!")
}
```

In this example, the `Greeting` function is annotated with `@Composable`, making it a UI component that can be called within other composables.

## How @Composable Works

Jetpack Compose is designed to be:

1. **Declarative**: UI components are defined by functions rather than XML layouts.
2. **Recomposable**: When data changes, the affected UI components are re-rendered automatically.
3. **Efficient**: Compose optimizes UI updates by recomposing only the necessary parts of the UI tree.

### Composability in Action

Composable functions can be combined to create complex UI structures.

```kotlin
@Composable
fun UserProfile(name: String, age: Int) {
    Column {
        Text(text = "Name: $name")
        Text(text = "Age: $age")
    }
}
```

In this example, the `UserProfile` composable combines multiple `Text` composables to display user information.

## Rules of @Composable Functions

To use `@Composable` functions effectively, it is important to understand the following rules:

1. **Must be called from another @Composable function**:
   - `@Composable` functions cannot be called from a normal function.
   - They should only be invoked inside another composable or from a `setContent` block in an `Activity` or `Fragment`.

   ```kotlin
   class MainActivity : ComponentActivity() {
       override fun onCreate(savedInstanceState: Bundle?) {
           super.onCreate(savedInstanceState)
           setContent {
               Greeting("John Doe")
           }
       }
   }
   ```

2. **Should be stateless when possible**:
   - Keeping composables stateless makes them more reusable and predictable.
   - Use state hoisting to manage UI state outside the composable.

   ```kotlin
   @Composable
   fun Counter(count: Int, onIncrement: () -> Unit) {
       Column {
           Text(text = "Count: $count")
           Button(onClick = onIncrement) {
               Text("Increment")
           }
       }
   }
   ```

3. **No return values**:
   - `@Composable` functions do not return values like traditional functions; they describe UI elements instead.

## Managing State in @Composable Functions

State management is crucial in Jetpack Compose applications. State determines what is displayed on the screen and should be managed correctly to avoid unnecessary recompositions.

### Using remember to Manage State

`remember` helps retain state during recomposition.

```kotlin
@Composable
fun CounterApp() {
    var count by remember { mutableStateOf(0) }
    Counter(count) { count++ }
}
```

Here, `remember` ensures that `count` retains its value during recompositions.

### Using rememberSaveable to Preserve State Across Configuration Changes

Unlike `remember`, `rememberSaveable` keeps state even when the configuration changes (e.g., screen rotation).

```kotlin
@Composable
fun SaveableCounterApp() {
    var count by rememberSaveable { mutableStateOf(0) }
    Counter(count) { count++ }
}
```

## Recomposition and Performance Optimization

Since Jetpack Compose is designed to recompose UI when state changes, optimizing recompositions is essential.

### Minimizing Unnecessary Recompositions

- **Use keys in lists**: When dealing with lists, `key` ensures items are tracked correctly.
- **Use derived state**: Prevent unnecessary recompositions by using derived states when needed.
- **Use remember**: Avoid recalculating values unnecessarily.

### Example of Using keys in LazyColumn

```kotlin
@Composable
fun UserList(users: List<User>) {
    LazyColumn {
        items(users, key = { it.id }) { user ->
            Text(text = "${user.name}")
        }
    }
}
```

## Common Mistakes When Using @Composable

1. **Modifying State Inside Composable Functions**
   - Wrong:

     ```kotlin
     @Composable
     fun BadCounter() {
         var count = 0 // Incorrect: Resets on recomposition
         Button(onClick = { count++ }) {
             Text("Count: $count")
         }
     }
     ```

   - Correct:

     ```kotlin
     @Composable
     fun GoodCounter() {
         var count by remember { mutableStateOf(0) }
         Button(onClick = { count++ }) {
             Text("Count: $count")
         }
     }
     ```

2. **Blocking UI with Long-Running Tasks**
   - Avoid running expensive operations inside `@Composable` functions.
   - Use `LaunchedEffect` for such tasks.

     ```kotlin
     @Composable
     fun DataFetcher() {
         var data by remember { mutableStateOf("Loading...") }
         LaunchedEffect(Unit) {
             data = fetchData()
         }
         Text(text = data)
     }
     ```

## Conclusion

The `@Composable` annotation is at the heart of Jetpack Compose, enabling developers to create flexible and efficient UI components. By understanding its rules, managing state properly, and optimizing recompositions, you can harness the full power of Jetpack Compose to build modern Android applications.

As you continue to explore Jetpack Compose, keep experimenting with `@Composable` functions to better understand their behavior and how they fit into your UI development workflow. Happy coding!
