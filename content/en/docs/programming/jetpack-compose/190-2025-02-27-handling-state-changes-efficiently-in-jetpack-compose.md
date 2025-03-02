---
draft: false
title: Handling State Changes Efficiently in Jetpack Compose
linkTitle: State Management in Jetpack Compose
translationKey: handling-state-changes-efficiently-in-jetpack-compose
description: Learn how to optimize state handling in Jetpack Compose to improve app performance and user experience.
url: handling-state-changes-efficiently-in-jetpack-compose
weight: 190
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - State management in Jetpack Compose
---
As Android developers, we're constantly striving to create responsive, fluid, and maintainable applications. Since its introduction, Jetpack Compose has revolutionized the way we build UIs, offering a declarative approach that promises simpler code and faster development. However, with this new paradigm comes the challenge of efficiently managing state—a critical aspect that directly impacts app performance and user experience.

## Understanding State in Jetpack Compose

Before diving into optimization strategies, let's clarify what "state" means in Compose:

**State in Compose** refers to any value that can change over time. When state changes, Compose automatically recomposes the affected UI elements to reflect these changes. While powerful, this automatic recomposition mechanism can impact performance if not handled carefully.

Unlike traditional View-based systems where you manually update specific parts of the UI, Compose works by regenerating the entire UI tree based on the current state. This approach simplifies development but requires thoughtful state management to avoid unnecessary recompositions.

## The Cost of Recomposition

Each time a state value changes, Compose triggers a recomposition process. While Compose is smart about minimizing the scope of recomposition, excessive or unnecessary state changes can still lead to:

- Increased CPU usage
- UI jank and dropped frames
- Worse battery consumption
- Memory pressure

Let's explore strategies to minimize these issues and optimize state handling in your Compose applications.

## State Hoisting: The Foundation of Efficient State Management

State hoisting is a pattern where state is lifted up to the caller of a composable function. This technique offers several benefits:

1. **Single source of truth**: State is managed in one place, reducing inconsistencies
2. **Improved testability**: Stateless components are easier to test
3. **Better recomposition scoping**: Changes affect only the necessary components

Consider this example:

```kotlin
// Bad practice: State contained within the component
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }
    Button(onClick = { count++ }) {
        Text("Count: $count")
    }
}

// Good practice: State hoisted to caller
@Composable
fun Counter(count: Int, onIncrement: () -> Unit) {
    Button(onClick = onIncrement) {
        Text("Count: $count")
    }
}

// Usage
@Composable
fun CounterScreen() {
    var count by remember { mutableStateOf(0) }
    Counter(count = count, onIncrement = { count++ })
}
```

By hoisting the state, we've made `Counter` stateless and reusable, allowing the parent to control when recomposition occurs.

## rememberSaveable: Surviving Configuration Changes

While `remember` preserves state during recompositions, it doesn't survive configuration changes like screen rotations. For that, we use `rememberSaveable`:

```kotlin
var count by rememberSaveable { mutableStateOf(0) }
```

This ensures your state persists across configuration changes, preventing data loss and improving user experience.

## Using derivedStateOf for Computed State

A common performance pitfall is recalculating values on every recomposition. The `derivedStateOf` function allows you to create a state object that only updates when its dependencies change:

```kotlin
// Without derivedStateOf - filtering happens on every recomposition
@Composable
fun TaskList(tasks: List<Task>) {
    val filteredTasks = tasks.filter { it.isImportant }
    LazyColumn {
        items(filteredTasks) { task ->
            TaskItem(task)
        }
    }
}

// With derivedStateOf - filtering only happens when tasks change
@Composable
fun TaskList(tasks: List<Task>) {
    val filteredTasks by remember {
        derivedStateOf { tasks.filter { it.isImportant } }
    }
    LazyColumn {
        items(filteredTasks) { task ->
            TaskItem(task)
        }
    }
}
```

This optimization is particularly valuable for expensive computations or transformations.

## State Holders: Separating Logic from UI

As your Compose UI grows more complex, mixing business logic with UI code becomes unwieldy. State holders help separate concerns:

```kotlin
// State holder class
class CounterState(initialCount: Int = 0) {
    var count by mutableStateOf(initialCount)
        private set
        
    fun increment() {
        count++
    }
    
    fun decrement() {
        if (count > 0) count--
    }
}

// Using the state holder in a Composable
@Composable
fun CounterScreen() {
    val counterState = remember { CounterState() }
    
    Column {
        Text("Count: ${counterState.count}")
        Row {
            Button(onClick = { counterState.decrement() }) {
                Text("-")
            }
            Button(onClick = { counterState.increment() }) {
                Text("+")
            }
        }
    }
}
```

This pattern, similar to ViewModel but scope-specific to a composable, improves testability and code organization.

## Remembering Callbacks to Prevent Recompositions

When passing lambdas to child composables, wrapping them with `remember` prevents unnecessary recompositions:

```kotlin
// Without remembering the callback - creates a new lambda on each recomposition
@Composable
fun ParentScreen() {
    var count by remember { mutableStateOf(0) }
    
    ChildComponent(
        onButtonClick = { count++ }
    )
}

// With remembered callback - stabilizes the lambda reference
@Composable
fun ParentScreen() {
    var count by remember { mutableStateOf(0) }
    
    val onButtonClick = remember {
        { count++ }
    }
    
    ChildComponent(onButtonClick = onButtonClick)
}
```

However, be careful with capturing changing values in remembered lambdas. For those cases, use `rememberUpdatedState`:

```kotlin
@Composable
fun ParentScreen(onEvent: (Event) -> Unit) {
    // This ensures we always have the latest onEvent callback
    val latestOnEvent = rememberUpdatedState(onEvent)
    
    val handleClick = remember {
        { event: Event -> latestOnEvent.value(event) }
    }
    
    ChildComponent(onButtonClick = handleClick)
}
```

## Immutable Collections for State

When working with collections in state, prefer immutable collections to ensure proper recomposition:

```kotlin
// Bad: Mutable list doesn't trigger recomposition when items change internally
var items by remember { mutableStateOf(mutableListOf<Item>()) }
// Adding an item doesn't trigger recomposition
items.add(newItem) 

// Good: Immutable list is replaced, triggering proper recomposition
var items by remember { mutableStateOf(listOf<Item>()) }
// Creates a new list, triggering recomposition
items = items + newItem
```

## Recomposition Scoping with Key

The `key` composable function helps control recomposition scope by forcing a fresh state when the key changes:

```kotlin
@Composable
fun UserProfile(userId: String) {
    key(userId) {
        // All state in this scope is reset when userId changes
        var expandedState by remember { mutableStateOf(false) }
        // ... rest of the profile UI
    }
}
```

This pattern is particularly useful when reusing the same composable for different data items.

## State Delegation with Composition Local

For states that need to be accessed by many composables in a subtree, consider using CompositionLocal:

```kotlin
// Define a CompositionLocal
val LocalAppTheme = compositionLocalOf { LightTheme }

@Composable
fun App() {
    var theme by remember { mutableStateOf(LightTheme) }
    
    CompositionLocalProvider(LocalAppTheme provides theme) {
        // All child composables can access the theme without explicit passing
        AppContent()
    }
}

@Composable
fun DeepChildComponent() {
    // Access the theme from the CompositionLocal
    val theme = LocalAppTheme.current
    Surface(color = theme.backgroundColor) {
        // ...
    }
}
```

While powerful, use this pattern sparingly as it makes data flow less explicit.

## Performance Monitoring Tools

Compose provides several tools to help identify and resolve state-related performance issues:

1. **Layout Inspector**: Visualizes the composition hierarchy
2. **Compose Metrics**: Available in Android Studio to measure recomposition counts
3. **StabilityInference**: Built-in mechanism that analyzes your types for stability

Regularly profiling your app with these tools helps catch inefficient state management early.

## Real-World Example: Efficient List Handling

Let's tie these concepts together with a practical example of efficient list handling:

```kotlin
data class Task(val id: String, val title: String, val isCompleted: Boolean)

@Composable
fun TaskScreen(viewModel: TaskViewModel) {
    val tasks by viewModel.tasks.collectAsState()
    val searchQuery by viewModel.searchQuery.collectAsState()
    
    // Derived state: Only recalculated when tasks or searchQuery changes
    val filteredTasks by remember(tasks, searchQuery) {
        derivedStateOf {
            tasks.filter { 
                it.title.contains(searchQuery, ignoreCase = true)
            }
        }
    }
    
    Column {
        SearchBar(
            value = searchQuery,
            onValueChange = viewModel::updateSearchQuery
        )
        
        LazyColumn {
            items(
                items = filteredTasks,
                key = { task -> task.id } // Stable keys for better recomposition
            ) { task ->
                // Key helps isolate recompositions to just this item
                key(task.id) {
                    TaskItem(
                        task = task,
                        onTaskClick = { viewModel.toggleTaskCompletion(task.id) }
                    )
                }
            }
        }
    }
}
```

This example incorporates several best practices:

- State hoisting (via ViewModel)
- Derived state for filtering
- Stable keys for list items
- Scoped recomposition with key function

## Conclusion

Efficient state management in Jetpack Compose requires a mix of understanding how Compose works internally and applying established patterns. By applying the techniques covered in this article—state hoisting, remembering callbacks, using derived state, and more—you can build responsive, performant Compose UIs that provide a smooth user experience.

Remember that optimization is a continuous process. Start with a clean, readable implementation and apply these optimization techniques progressively as needed, using the built-in performance monitoring tools to guide your efforts.

With thoughtful state handling, your Compose applications will not only be easier to maintain but will also deliver the smooth, responsive experience users expect from modern Android applications.
