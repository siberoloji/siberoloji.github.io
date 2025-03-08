---
draft: false
title: Using `remember` and `derivedStateOf` for Efficiency in Jetpack Compose
linkTitle: Using `remember` and `derivedStateOf`
translationKey: using-remember-and-derivedstateof-for-efficiency-in-jetpack-compose
description: This article explores how to use `remember` and `derivedStateOf` effectively in Jetpack Compose to optimize performance and avoid unnecessary recompositions.
url: using-remember-and-derivedstateof-for-efficiency-in-jetpack-compose
weight: 430
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Optimization
---
Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative approach. It simplifies UI development, making it more intuitive and efficient. However, as applications grow in complexity, performance optimization becomes critical to ensure a smooth user experience.

Two essential tools for optimizing recomposition in Jetpack Compose are `remember` and `derivedStateOf`. These functions help manage state efficiently, reduce unnecessary recompositions, and enhance app performance. In this post, we will explore how to use `remember` and `derivedStateOf` effectively and when to choose one over the other.

---

## Understanding Recomposition in Jetpack Compose

Before diving into `remember` and `derivedStateOf`, it's crucial to understand recomposition. In Jetpack Compose, the UI updates dynamically when state changes. Recomposition is the process where the framework re-executes composable functions to reflect these updates. However, excessive recomposition can lead to performance issues, making optimizations necessary.

For instance, if a composable function is triggered to recompose too frequently, it can cause UI lag, increased CPU usage, and inefficient memory utilization. This is where `remember` and `derivedStateOf` come into play.

---

## The Role of `remember` in Jetpack Compose

### What is `remember`?

The `remember` function in Jetpack Compose helps retain values across recompositions. It ensures that an object is not re-created every time a composable function recomposes unless its dependencies change.

### Basic Usage of `remember`

```kotlin
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }

    Column {
        Text("Count: $count")
        Button(onClick = { count++ }) {
            Text("Increment")
        }
    }
}
```

**Explanation:**

- The `remember` function ensures that `count` is retained during recomposition.
- Without `remember`, `count` would reset to 0 every time the function recomposes.

### When to Use `remember`

Use `remember` when you need to:

- Retain UI state across recompositions.
- Optimize performance by avoiding redundant object re-creation.
- Store local states within a composable function.

---

## Understanding `derivedStateOf`

### What is `derivedStateOf`?

The `derivedStateOf` function is an optimization mechanism that helps create derived state values efficiently. It ensures that derived states are only recomputed when their dependencies change, reducing unnecessary calculations and recompositions.

### Why Use `derivedStateOf`?

In some cases, a state might depend on another state but should not trigger recomposition on every change. `derivedStateOf` helps ensure that recomposition only occurs when the computed value actually changes.

### Example Usage of `derivedStateOf`

```kotlin
@Composable
fun ListWithExpensiveComputation(items: List<String>) {
    var query by remember { mutableStateOf("") }
    
    val filteredItems by remember(query) {
        derivedStateOf {
            items.filter { it.contains(query, ignoreCase = true) }
        }
    }

    Column {
        TextField(value = query, onValueChange = { query = it })
        LazyColumn {
            items(filteredItems) { item ->
                Text(item)
            }
        }
    }
}
```

**Explanation:**

- The `filteredItems` state is derived from `query` and `items`.
- Without `derivedStateOf`, `filteredItems` would be recomputed on every recomposition, even if `query` has not changed.
- Using `derivedStateOf`, `filteredItems` is only recalculated when `query` actually changes, improving efficiency.

### When to Use `derivedStateOf`

Use `derivedStateOf` when:

- You have expensive computations that should only run when necessary.
- You want to avoid redundant state updates triggering recompositions.
- You need to optimize performance when filtering, sorting, or transforming data.

---

## Comparing `remember` and `derivedStateOf`

| Feature          | `remember`  | `derivedStateOf` |
|-----------------|-------------|------------------|
| Purpose        | Retains state across recompositions. | Creates derived state that updates only when dependencies change. |
| When to Use   | To store local UI state in composables. | To optimize expensive calculations dependent on other states. |
| Recomposition | Reduces recompositions by remembering state. | Reduces recompositions by computing derived values only when necessary. |
| Example Use Case | Retaining user input, storing counters. | Filtering a list based on user input. |

Both functions play a crucial role in optimizing recompositions, but they serve different purposes.

---

## Best Practices for Using `remember` and `derivedStateOf`

1. **Use `remember` to Persist State**: Use `remember` for values that should persist across recompositions but do not depend on external calculations.

2. **Use `derivedStateOf` for Expensive Computations**: If a state is derived from another and involves costly operations, wrap it inside `derivedStateOf` to avoid unnecessary recalculations.

3. **Minimize Dependencies**: Ensure that `remember` and `derivedStateOf` are only dependent on necessary values. Extra dependencies can lead to unnecessary recompositions.

4. **Leverage `remember` with `mutableStateOf`**: When using `mutableStateOf`, always wrap it with `remember` to prevent unintended resets.

5. **Profile and Optimize**: Use tools like `Compose Compiler Metrics` and `Layout Inspector` to identify unnecessary recompositions and optimize state management accordingly.

---

## Conclusion

Optimizing recompositions is crucial for building efficient and responsive Jetpack Compose applications. The `remember` function helps persist state across recompositions, while `derivedStateOf` ensures derived values are only recomputed when needed. By using these tools effectively, you can significantly improve app performance and user experience.

By understanding when and how to use `remember` and `derivedStateOf`, you can avoid common pitfalls and ensure your Jetpack Compose applications run efficiently. Happy coding!

---

### Further Reading

- [Jetpack Compose State Management](https://developer.android.com/jetpack/compose/state)
- [Optimizing Compose Performance](https://developer.android.com/jetpack/compose/performance)
- [Understanding Recomposition in Jetpack Compose](https://developer.android.com/jetpack/compose/recomposition)

Do you have any questions or additional insights about using `remember` and `derivedStateOf`? Feel free to share your thoughts in the comments!
