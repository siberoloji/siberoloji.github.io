---
draft: false
title: Understanding Recomposition and How It Affects Performance in Jetpack Compose
linkTitle: Understanding Recomposition
translationKey: understanding-recomposition-and-how-it-affects-performance-in-jetpack-compose
description: Understanding Recomposition and How It Affects Performance in Jetpack Compose
url: understanding-recomposition-and-how-it-affects-performance-in-jetpack-compose
weight: 130
date: 2025-02-27
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
Jetpack Compose is Google's modern UI toolkit for Android development, designed to simplify UI creation with declarative programming. One of the core concepts in Jetpack Compose is **recomposition**, which refers to the process of re-executing composable functions when state changes. While recomposition allows UI to stay reactive and dynamic, it can also impact performance if not managed properly. Understanding recomposition and how to optimize it is crucial for creating efficient Jetpack Compose applications.

In this article, we will explore the concept of recomposition, how it affects performance, common pitfalls that lead to unnecessary recompositions, and best practices for optimizing UI performance in Jetpack Compose.

## What Is Recomposition in Jetpack Compose?

Recomposition is the process by which Jetpack Compose updates the UI when state changes. Unlike traditional Android Views, where UI elements are manipulated directly, Compose follows a declarative approach where UI is described in terms of composable functions that react to state changes.

For example:

```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hello, $name!")
}
```

In this example, if the `name` parameter changes, the `Greeting` function will be recomposed, updating the displayed text.

### When Does Recomposition Occur?

Recomposition is triggered when:

1. **State changes**: If a composable function depends on a state variable and that state changes, the function is recomposed.
2. **Parameter changes**: If a composable function takes parameters and they change, recomposition occurs.
3. **Lambda functions re-created**: If a lambda function inside a composable is recreated during recomposition, it can cause unnecessary recompositions.

### What Recomposition Does Not Do

- **It does not restart the entire composition tree**: Only the affected parts of the UI are recomposed.
- **It does not always recompose every time state changes**: Compose uses optimizations to skip recomposition when it determines that UI elements have not changed.

## How Recomposition Affects Performance

While recomposition is essential for updating UI efficiently, excessive recompositions can lead to performance issues such as UI lag, high CPU usage, and unnecessary re-renders.

### Common Performance Issues Due to Unnecessary Recomposition

1. **Recomposing entire UI trees**: If a parent composable is recomposed, all its children may also be recomposed, leading to unnecessary work.
2. **Frequent recompositions due to state changes**: If state variables are not properly scoped, even minor updates can trigger unnecessary recompositions.
3. **Unstable lambda functions and object references**: If composable functions recreate objects or lambda expressions every time they run, it can cause unintended recompositions.
4. **Improper use of `remember` and `rememberUpdatedState`**: Failing to use `remember` correctly can result in recompositions when data remains unchanged.

## Best Practices to Optimize Recomposition Performance

To avoid unnecessary recompositions and enhance performance, follow these best practices:

### 1. Use `remember` to Preserve State Across Recompositions

`remember` helps to store values across recompositions, preventing unnecessary recalculations.

```kotlin
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }
    Button(onClick = { count++ }) {
        Text("Count: $count")
    }
}
```

### 2. Use `Stable` and `Immutable` Objects

Unstable objects can trigger recompositions. Marking data classes as `@Immutable` ensures Compose recognizes them as stable.

```kotlin
@Immutable
data class User(val name: String, val age: Int)
```

### 3. Hoist State to Avoid Unnecessary Recompositions

Moving state to a higher level can prevent recomposing child composables.

```kotlin
@Composable
fun ParentScreen() {
    var name by remember { mutableStateOf("John") }
    ChildScreen(name = name, onNameChange = { name = it })
}

@Composable
fun ChildScreen(name: String, onNameChange: (String) -> Unit) {
    TextField(value = name, onValueChange = onNameChange)
}
```

### 4. Use `key` in Lazy Lists

When using `LazyColumn` or `LazyRow`, provide stable keys to avoid unnecessary recompositions.

```kotlin
LazyColumn {
    items(users, key = { it.id }) { user ->
        Text(user.name)
    }
}
```

### 5. Avoid Creating Objects in Composable Functions

Creating objects inside composable functions can make them unstable. Instead, create them outside or use `remember`.

```kotlin
@Composable
fun UserCard(user: User) {
    val formattedName = remember(user) { "${user.name} (${user.age})" }
    Text(text = formattedName)
}
```

### 6. Use `LaunchedEffect` for Side Effects

`LaunchedEffect` helps to run code only when specific parameters change, preventing unnecessary recompositions.

```kotlin
@Composable
fun LoadData(userId: String) {
    LaunchedEffect(userId) {
        // Fetch data from API
    }
}
```

### 7. Use `derivedStateOf` for Expensive Computations

If you have computations that depend on state changes, wrap them with `derivedStateOf` to avoid unnecessary recomputation.

```kotlin
val derivedValue = remember { derivedStateOf { expensiveComputation() } }
```

## Conclusion

Recomposition is a fundamental concept in Jetpack Compose that allows the UI to update efficiently based on state changes. However, excessive and unnecessary recompositions can negatively impact performance. By understanding how recomposition works and implementing best practices like using `remember`, `derivedStateOf`, and stable data structures, developers can optimize their Jetpack Compose applications for smooth and efficient performance.

With careful state management and thoughtful UI structuring, developers can harness the full potential of Jetpack Compose while keeping recompositions minimal and performance high. Adopting these strategies will result in a more responsive, scalable, and efficient Android application.
