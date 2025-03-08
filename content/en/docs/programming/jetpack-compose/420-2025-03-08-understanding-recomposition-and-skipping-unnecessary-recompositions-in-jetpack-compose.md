---
draft: false
title: Understanding Recomposition and Skipping Unnecessary Recompositions in Jetpack Compose
linkTitle: Understanding Recomposition
translationKey: understanding-recomposition-and-skipping-unnecessary-recompositions-in-jetpack-compose
description: This article explains what recomposition is, why it happens, and strategies to minimize unnecessary recompositions in Jetpack Compose.
url: understanding-recomposition-and-skipping-unnecessary-recompositions-in-jetpack-compose
weight: 420
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Recomposition
---
Jetpack Compose is Google’s modern toolkit for building UI in Android applications using a declarative approach. One of its core concepts is **recomposition**, which allows the UI to update dynamically when the underlying state changes. While recomposition is powerful, unnecessary recompositions can lead to performance issues, making it crucial to optimize them effectively. In this blog post, we will explore what recomposition is, why it happens, and strategies to minimize unnecessary recompositions in Jetpack Compose.

## What is Recomposition in Jetpack Compose?

Recomposition is the process where Jetpack Compose re-executes composable functions to reflect changes in the UI state. Whenever a state changes, Compose determines which parts of the UI need to be redrawn and schedules them for recomposition. However, not all recompositions are necessary—some can be redundant and negatively impact performance.

### How Recomposition Works

1. **Initial Composition:** When a composable function is first executed, Compose builds the UI tree.
2. **State Change:** If a state variable (e.g., a `MutableState` object) changes, Compose marks the affected composable functions as invalid.
3. **Recomposition:** Compose re-executes the invalidated functions and updates the UI accordingly.
4. **Skipping Unchanged Parts:** Compose skips recomposing parts of the UI tree that do not depend on the changed state.

While Jetpack Compose is designed to be efficient, inefficient state management and UI structure can lead to unnecessary recompositions.

## Common Causes of Unnecessary Recompositions

Several factors can trigger unnecessary recompositions, including:

### 1. **Passing Non-Stable Parameters**

Compose relies on **stability inference** to determine whether an object has changed. If a parameter is unstable (i.e., Compose cannot guarantee that it remains unchanged), it will trigger recomposition.

- Example of unstable parameter:

  ```kotlin
  @Composable
  fun Greeting(name: String) {
      Text("Hello, $name!")
  }
  ```

  Every time `name` changes, `Greeting` will recompose, which is expected. However, if you pass a non-stable object, it may trigger recompositions unnecessarily.

### 2. **Using MutableState Improperly**

State should be as granular as possible to avoid broad recompositions.

- Inefficient state management:

  ```kotlin
  @Composable
  fun ProfileScreen() {
      var user by remember { mutableStateOf(User("Alice", 25)) }
      Column {
          Text("Name: ${user.name}")
          Text("Age: ${user.age}")
      }
  }
  ```

  Here, changing either `name` or `age` will cause the entire `Column` to recompose. A better approach is to use separate state variables.

- Optimized approach:

  ```kotlin
  @Composable
  fun ProfileScreen() {
      var name by remember { mutableStateOf("Alice") }
      var age by remember { mutableStateOf(25) }
      Column {
          Text("Name: $name")
          Text("Age: $age")
      }
  }
  ```

  Now, changing `name` will not trigger recomposition of `age`, reducing unnecessary UI updates.

### 3. **Lack of remember{} Usage**

The `remember` function ensures that values persist across recompositions. If you don’t use `remember`, the value will reset every time the function recomposes.

- Without `remember`:

  ```kotlin
  @Composable
  fun Counter() {
      var count = 0 // Resets on every recomposition
      Button(onClick = { count++ }) {
          Text("Count: $count")
      }
  }
  ```

  Every time the button is clicked, `count` resets, making it ineffective.

- With `remember`:

  ```kotlin
  @Composable
  fun Counter() {
      var count by remember { mutableStateOf(0) }
      Button(onClick = { count++ }) {
          Text("Count: $count")
      }
  }
  ```

  Now, `count` persists across recompositions.

### 4. **Using Too Many Composable Lambdas**

Passing inline lambdas to composables can cause them to be re-executed frequently.

- Problematic approach:

  ```kotlin
  @Composable
  fun CounterScreen() {
      var count by remember { mutableStateOf(0) }
      Button(onClick = { count++ }) {
          Text("Increment")
      }
      CounterDisplay(count)
  }
  
  @Composable
  fun CounterDisplay(count: Int) {
      Text("Count: $count")
  }
  ```

  This recomposes `CounterDisplay` even when its content hasn't changed. Using `rememberUpdatedState` can prevent unnecessary recompositions.

## Strategies to Skip Unnecessary Recompositions

### 1. **Use remember{} for Persistent State**

Whenever possible, wrap values that should persist across recompositions in `remember`.

### 2. **Make Objects Stable**

Marking objects with `@Stable` ensures Compose recognizes them as unchanged.

```kotlin
@Stable
data class User(val name: String, val age: Int)
```

### 3. **Use keys in Lists**

If you're using lists, make sure to use `key` in `LazyColumn` to avoid unnecessary recompositions.

```kotlin
LazyColumn {
    items(users, key = { it.id }) { user ->
        UserItem(user)
    }
}
```

### 4. **Hoist State**

Avoid keeping state deep inside composables. Instead, lift it to a parent composable to prevent unnecessary recompositions.

```kotlin
@Composable
fun ParentComposable() {
    var text by remember { mutableStateOf("Hello") }
    ChildComposable(text)
}
```

### 5. **Use DerivedStateOf for Computed Values**

`derivedStateOf` ensures that a computed value is only recalculated when its dependencies change.

```kotlin
val formattedText by remember {
    derivedStateOf { text.uppercase() }
}
```

### 6. **Use rememberUpdatedState for Lambda Parameters**

If a lambda is used inside an effect, it can cause unnecessary recompositions. Use `rememberUpdatedState` to wrap it.

```kotlin
val updatedOnClick by rememberUpdatedState(newValue = onClick)
```

## Conclusion

Understanding recomposition is essential for optimizing Jetpack Compose applications. While recomposition allows dynamic UI updates, unnecessary recompositions can degrade performance. By using strategies like `remember`, stable objects, state hoisting, and proper list keys, you can significantly reduce redundant recompositions and make your Jetpack Compose app more efficient.

By applying these best practices, you can ensure a smoother, more responsive UI while maintaining the declarative simplicity of Jetpack Compose.
