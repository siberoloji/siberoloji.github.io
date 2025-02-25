---
draft: false
title: Delegates.observable() in Kotlin
linkTitle: Delegates.observable()
translationKey: delegates-observable-in-kotlin
weight: 260
description: Learn about `Delegates.observable()` in Kotlin programming language.
date: 2025-02-14
url: delegates-observable-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Delegates
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern programming language developed by JetBrains, is known for its expressive syntax and powerful features that make development more efficient and concise. One such feature is **delegated properties**, which allow developers to delegate property behavior to built-in or custom delegates.

Among the built-in property delegates provided by Kotlin’s `kotlin.properties.Delegates` package, `Delegates.observable()` is particularly useful when you need to track property changes in a class. This feature enables reactive programming within an object-oriented paradigm, making it easier to maintain and debug your applications.

In this article, we will delve deep into `Delegates.observable()`, explore its syntax, use cases, and how it differs from `Delegates.vetoable()`. We will also discuss real-world applications and best practices for leveraging this feature in your Kotlin applications.

## What is `Delegates.observable()`?

`Delegates.observable()` is a delegated property that allows developers to observe changes in a property’s value. Whenever the value of an observable property changes, a callback function is triggered, providing both the old and new values. This can be useful for logging, UI updates, triggering business logic, and other reactive programming scenarios.

### Syntax

The basic syntax of `Delegates.observable()` is as follows:

```kotlin
import kotlin.properties.Delegates

class Example {
    var observedProperty: String by Delegates.observable("Initial Value") { property, oldValue, newValue ->
        println("Property '${property.name}' changed from '$oldValue' to '$newValue'")
    }
}

fun main() {
    val example = Example()
    example.observedProperty = "New Value"  // Triggers the observer
    example.observedProperty = "Another Value"  // Triggers the observer again
}
```

### Explanation

- The property `observedProperty` is delegated to `Delegates.observable()`.
- The initial value of `observedProperty` is set to "Initial Value".
- The lambda function (callback) inside `observable()` receives three parameters:
  1. `property`: Metadata about the property (name, type, etc.).
  2. `oldValue`: The value before the change.
  3. `newValue`: The value after the change.
- Every time the property value changes, the callback function is executed.

## Use Cases of `Delegates.observable()`

### 1. Logging and Debugging

Tracking changes to critical variables is useful in debugging applications. `Delegates.observable()` allows logging property modifications dynamically.

```kotlin
class User {
    var username: String by Delegates.observable("Guest") { _, old, new ->
        println("Username changed from $old to $new")
    }
}

fun main() {
    val user = User()
    user.username = "Alice"
    user.username = "Bob"
}
```

### 2. Updating UI Elements in Android

In Android applications, `Delegates.observable()` can be used to notify UI components of data changes.

```kotlin
class ViewModel {
    var buttonText: String by Delegates.observable("Click Me") { _, _, new ->
        updateButtonText(new)
    }
}

fun updateButtonText(newText: String) {
    println("Button text updated to: $newText")
}

fun main() {
    val viewModel = ViewModel()
    viewModel.buttonText = "Submit"
}
```

### 3. Reactive Configuration Changes

If an application has configuration settings that impact multiple components, `Delegates.observable()` can be used to track and react to setting updates dynamically.

```kotlin
class Config {
    var theme: String by Delegates.observable("Light") { _, old, new ->
        println("Theme changed from $old to $new")
    }
}

fun main() {
    val config = Config()
    config.theme = "Dark"
    config.theme = "Blue"
}
```

## Difference Between `observable()` and `vetoable()`

Kotlin also provides another delegated property function called `Delegates.vetoable()`, which allows validation before changing a property’s value. The key difference is that `observable()` always updates the property and then triggers the callback, while `vetoable()` gives the option to prevent the update based on a condition.

### Example of `vetoable()`

```kotlin
var age: Int by Delegates.vetoable(18) { _, old, new ->
    new >= 18  // Only allow changes if the new age is 18 or above
}

fun main() {
    println("Initial Age: $age")
    age = 20  // Allowed
    println("Updated Age: $age")
    age = 15  // Not allowed
    println("Attempted Update: $age")
}
```

### Key Differences

| Feature          | `Delegates.observable()` | `Delegates.vetoable()` |
|-----------------|-------------------------|------------------------|
| When Callback Triggers | After the value changes | Before the value changes |
| Can Prevent Change? | No | Yes (returns `false` to reject the change) |
| Use Case | Logging, UI updates, data tracking | Validation before updates |

## Best Practices

1. **Use for Readability**: Instead of manually overriding getter/setter methods, use `Delegates.observable()` for better readability and maintainability.
2. **Avoid Excessive Logging**: In performance-sensitive applications, be cautious with logging inside the observer callback.
3. **Use with Mutable Properties**: This delegate is useful only for mutable properties (`var`).
4. **Combine with Coroutines or LiveData**: In Android development, combine `observable()` with `LiveData` or Kotlin coroutines for more reactive programming.
5. **Avoid Heavy Computation in Callbacks**: Keep callback functions lightweight to ensure smooth execution.

## Conclusion

`Delegates.observable()` is a powerful Kotlin feature that enhances property change tracking. It is particularly useful for debugging, logging, UI updates, and reactive programming. By understanding its capabilities and best practices, you can leverage it effectively to build cleaner and more maintainable Kotlin applications.

Whether you are a beginner or an experienced Kotlin developer, integrating `Delegates.observable()` into your projects will help streamline data management and improve overall code efficiency. Happy coding!
