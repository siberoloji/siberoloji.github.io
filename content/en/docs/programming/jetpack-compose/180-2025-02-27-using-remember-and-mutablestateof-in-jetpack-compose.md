---
draft: false
title: "Using `remember` and `mutableStateOf` in Jetpack Compose"
linkTitle: "Using `remember` and `mutableStateOf` in Jetpack Compose"
translationKey: using-remember-and-mutablestateof-in-jetpack-compose
description: "Learn how to use `remember` and `mutableStateOf` in Jetpack Compose for efficient state management in Android apps."
url: using-remember-and-mutablestateof-in-jetpack-compose
date: 2025-02-27
weight: 180
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - remember
  - mutableStateOf
---

Jetpack Compose is the modern UI toolkit for building native Android apps declaratively. One of the key concepts in Compose is managing state efficiently. Unlike traditional XML-based UI development in Android, Compose uses a reactive programming paradigm, where the UI automatically updates when the state changes.

Two essential state management tools in Jetpack Compose are `remember` and `mutableStateOf`. These help retain and update UI states effectively. In this post, we'll dive deep into their roles, how they work, and best practices for using them in your applications.

---

## Understanding State in Jetpack Compose

Before we explore `remember` and `mutableStateOf`, it's crucial to understand what state is in Jetpack Compose.

In simple terms, **state** refers to any data that can change over time and influences the UI. Since Jetpack Compose follows a declarative UI approach, whenever the state changes, the UI is automatically recomposed to reflect the latest state.

Without proper state management, UI components may not behave as expected, leading to inconsistencies and potential performance issues.

---

## What is `mutableStateOf`?

`mutableStateOf` is a special function in Jetpack Compose that creates an observable state holder. When a value inside `mutableStateOf` changes, any composable function that reads this value will automatically recompose.

### Basic Usage

```kotlin
var counter = mutableStateOf(0)
```

However, there's a problem with this approach. **The state is not retained across recompositions.** Every time the composable function is re-executed, the `counter` value is reset.

To persist state across recompositions, we use `remember`.

---

## What is `remember`?

`remember` is a composable function that stores a value in the composition. This ensures that the stored value survives recompositions.

### Correct Way to Use `mutableStateOf` with `remember`

```kotlin
@Composable
fun CounterScreen() {
    var counter by remember { mutableStateOf(0) }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = "Counter: $counter", fontSize = 24.sp)
        Button(onClick = { counter++ }) {
            Text("Increment")
        }
    }
}
```

### Explanation

- `remember { mutableStateOf(0) }` ensures that `counter` is retained across recompositions.
- When the `Button` is clicked, the state is updated, causing the UI to recompose and display the new value.

Without `remember`, every time `CounterScreen` recomposes, `counter` would reset to `0`, making the button seemingly ineffective.

---

## Using `remember` with Complex Data Types

`remember` and `mutableStateOf` are not limited to simple types like integers or strings. You can also use them with complex objects, such as lists or data classes.

### Example with Lists

```kotlin
@Composable
fun TaskListScreen() {
    var tasks by remember { mutableStateOf(listOf("Buy groceries", "Walk the dog")) }

    Column {
        tasks.forEach { task ->
            Text(text = task)
        }
        Button(onClick = { tasks = tasks + "New Task" }) {
            Text("Add Task")
        }
    }
}
```

### Explanation

- The `tasks` list is stored in a mutable state and remembered across recompositions.
- When a new task is added, the UI updates automatically to reflect the change.

**Important:** When modifying lists or objects in `mutableStateOf`, always assign a new instance (`tasks = tasks + "New Task"`) rather than mutating the existing list. This ensures Compose detects the change and recomposes appropriately.

---

## `rememberSaveable` for State Persistence

While `remember` helps retain state across recompositions, it does **not** survive process deaths (e.g., configuration changes like screen rotation). To preserve state in such scenarios, use `rememberSaveable`.

### Example with `rememberSaveable`

```kotlin
@Composable
fun CounterScreen() {
    var counter by rememberSaveable { mutableStateOf(0) }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = "Counter: $counter", fontSize = 24.sp)
        Button(onClick = { counter++ }) {
            Text("Increment")
        }
    }
}
```

### Difference Between `remember` and `rememberSaveable`

- `remember` keeps state only during recompositions but **loses it on activity recreation**.
- `rememberSaveable` **persists the state across configuration changes** like screen rotations.

---

## Best Practices for Using `remember` and `mutableStateOf`

1. **Use `remember` for UI state**: If you need a value to persist across recompositions, always wrap it with `remember`.
2. **Use `rememberSaveable` for surviving process deaths**: For critical UI state that should survive activity recreation (e.g., input fields, counters), prefer `rememberSaveable`.
3. **Avoid mutable collections**: Instead of modifying a list directly, create a new instance to trigger recomposition.
4. **Keep state where it belongs**: Avoid lifting state too high unless necessary. Keep it within the smallest composable that needs it.
5. **Use `remember` only inside composable functions**: `remember` is a composable function and should not be used outside them.

---

## Conclusion

Jetpack Compose introduces a new way of handling UI state reactively. Understanding how `remember` and `mutableStateOf` work together is essential for building interactive and efficient applications.

To summarize:

- **`mutableStateOf`** creates observable state that triggers recompositions.
- **`remember`** ensures state persists across recompositions.
- **`rememberSaveable`** helps retain state across process deaths like screen rotations.

Mastering these tools will help you manage state effectively in Jetpack Compose, leading to a smoother and more responsive user experience.

### What’s Next?

Now that you understand `remember` and `mutableStateOf`, try implementing them in a real-world project. Experiment with different UI states and observe how Compose handles recompositions dynamically.

Happy coding! 🚀
