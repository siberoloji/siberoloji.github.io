---
draft: false
title: Observable Properties in Kotlin
linkTitle: Observable Properties in Kotlin
translationKey: observable-properties-in-kotlin
weight: 240
description: Learn about observable properties in Kotlin programming language.
date: 2025-02-14
url: observable-properties-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Observable Properties
featured_image: /images/kotlin-1.png
---
Kotlin, known for its concise and expressive syntax, offers numerous powerful features that make Android and backend development more efficient. One such feature is **Observable Properties**, which provide a way to monitor changes in property values and react accordingly. This feature is particularly useful in UI development, state management, and data binding.  

In this post, we’ll explore what observable properties are, how they work in Kotlin, and how you can leverage them in your applications.  

## What Are Observable Properties in Kotlin?  

In Kotlin, properties are essentially variables associated with a class. While standard properties allow you to store and retrieve values, **observable properties** take it a step further by notifying listeners whenever their values change.  

Observable properties are part of the **Delegated Properties** mechanism in Kotlin and are primarily implemented using the `Delegates.observable` and `Delegates.vetoable` functions from the `kotlin.properties` package.  

These functions enable:  

- **Observing changes**: Detect when a property’s value is updated and execute custom logic accordingly.  
- **Controlling changes**: Decide whether to allow or reject a value change based on conditions.  

## How Observable Properties Work  

### 1. `Delegates.observable`  

The `Delegates.observable` function allows you to observe changes to a property and execute a callback function whenever the value is modified.  

#### Syntax  

```kotlin
import kotlin.properties.Delegates

var propertyName: Type by Delegates.observable(initialValue) { property, oldValue, newValue ->  
    // Custom logic executed when the value changes  
}
```  

- `initialValue`: The initial value assigned to the property.  
- The callback function has three parameters:  
  - `property`: The property being observed.  
  - `oldValue`: The previous value before the change.  
  - `newValue`: The new value being assigned.  

### Example: Basic Usage of `Delegates.observable`  

```kotlin
import kotlin.properties.Delegates

class User {
    var name: String by Delegates.observable("Unknown") { property, oldValue, newValue ->
        println("Property '${property.name}' changed from '$oldValue' to '$newValue'")
    }
}

fun main() {
    val user = User()
    user.name = "Alice"
    user.name = "Bob"
}
```

#### Output  

```
Property 'name' changed from 'Unknown' to 'Alice'  
Property 'name' changed from 'Alice' to 'Bob'  
```  

Here, every time the `name` property changes, the callback function is executed, logging the old and new values.  

---

### 2. `Delegates.vetoable`  

While `observable` notifies changes after they occur, `vetoable` allows you to **reject** a change based on a condition before the value is assigned.  

#### Syntax  

```kotlin
import kotlin.properties.Delegates

var propertyName: Type by Delegates.vetoable(initialValue) { property, oldValue, newValue ->  
    // Return true to allow the change, false to reject it  
}
```  

- The callback function executes before the value is updated.  
- If it returns `true`, the change is accepted; otherwise, it's rejected.  

### Example: Using `Delegates.vetoable`  

```kotlin
import kotlin.properties.Delegates

class Account {
    var balance: Int by Delegates.vetoable(1000) { _, oldValue, newValue ->
        newValue >= 0 // Reject negative balance
    }
}

fun main() {
    val account = Account()
    println("Initial Balance: ${account.balance}")

    account.balance = 500 // Allowed
    println("Updated Balance: ${account.balance}")

    account.balance = -100 // Rejected
    println("Final Balance: ${account.balance}")
}
```

#### Output  

```
Initial Balance: 1000  
Updated Balance: 500  
Final Balance: 500  
```  

In this example, if an attempt is made to set a negative balance, the update is rejected.  

---

## Real-World Use Cases  

### 1. UI State Management  

Observable properties are extensively used in Android development with Jetpack Compose and ViewModel architectures. They help in updating UI elements dynamically when data changes.  

```kotlin
import androidx.lifecycle.ViewModel
import kotlin.properties.Delegates

class MainViewModel : ViewModel() {
    var username: String by Delegates.observable("Guest") { _, old, new ->
        println("Username updated from '$old' to '$new'")
    }
}
```  

Whenever `username` changes, the UI can be notified to update accordingly.  

---

### 2. Logging and Debugging  

Observable properties provide an easy way to track changes and log property modifications in an application.  

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

---

### 3. Enforcing Business Rules  

Using `vetoable`, you can enforce constraints, such as preventing negative values in financial applications.  

```kotlin
class Product {
    var stock: Int by Delegates.vetoable(10) { _, _, newValue ->
        newValue >= 0 // Prevent negative stock
    }
}
```

---

## Key Differences Between `observable` and `vetoable`  

| Feature | `observable` | `vetoable` |
|---------|-------------|------------|
| When Callback Executes | After the value is updated | Before the value is updated |
| Can Reject Value Changes? | No | Yes |
| Use Case | Logging, UI updates, state tracking | Validations, business rules enforcement |

---

## Performance Considerations  

- **Overuse of Observable Properties**: If multiple properties trigger frequent updates, performance may degrade.  
- **Thread Safety**: Observable properties are **not** thread-safe by default. Consider using `synchronized` blocks or `MutableStateFlow` in multi-threaded environments.  
- **Memory Overhead**: Delegation adds slight overhead compared to standard properties. Use observable properties **only when necessary**.  

---

## Conclusion  

Kotlin’s **Observable Properties** (`Delegates.observable` and `Delegates.vetoable`) provide an elegant way to monitor and control property changes. They are particularly useful for logging, UI state management, enforcing business rules, and debugging.  

By understanding their behavior and practical applications, you can write more responsive and maintainable Kotlin applications.  

---

### What’s Next?  

- Experiment with observable properties in your projects.  
- Explore **LiveData** and **StateFlow** for more advanced state management.  
- Learn about **Custom Delegates** for even more flexible property behaviors.  

Have you used observable properties in Kotlin? Share your experience in the comments!
