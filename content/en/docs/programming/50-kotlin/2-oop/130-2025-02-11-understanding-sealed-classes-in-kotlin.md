---
draft: false
title: Sealed Classes in Kotlin
linkTitle: Sealed Classes
translationKey: sealed-classes-in-kotlin
weight: 130
description: This article explains the concept of sealed classes in Kotlin, their purpose, benefits, and real-world applications.
date: 2025-02-11
url: sealed-classes-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Sealed Classes
featured_image: /images/kotlin-1.png
---
Kotlin, a modern programming language developed by JetBrains, has gained significant popularity due to its expressive syntax, type safety, and powerful functional programming features. Among its many advanced constructs, **sealed classes** stand out as an essential tool for managing restricted class hierarchies. Sealed classes provide a structured way to represent restricted types, making them particularly useful for handling state management and improving code maintainability.

In this article, we will explore sealed classes in detail, discussing their purpose, benefits, and real-world applications in Kotlin development.

---

## What Are Sealed Classes?

A **sealed class** in Kotlin is a special type of class that restricts inheritance to a predefined set of subclasses. Unlike regular classes, where any other class can inherit from them, sealed classes allow only specific subclasses defined within the same file. This restriction makes sealed classes an excellent choice for modeling closed hierarchies where only a known number of subclasses should exist.

In simpler terms, sealed classes are similar to enums but more flexible because each subclass can hold its own state and behavior.

### Syntax of Sealed Classes

A sealed class is declared using the `sealed` keyword:

```kotlin
sealed class Shape {
    class Circle(val radius: Double) : Shape()
    class Rectangle(val width: Double, val height: Double) : Shape()
    object Unknown : Shape()
}
```

In this example:
- `Shape` is a sealed class.
- `Circle` and `Rectangle` are subclasses with their own properties.
- `Unknown` is an object representing an undefined shape.
- All subclasses must be declared within the same file as `Shape`.

---

## Benefits of Using Sealed Classes

Sealed classes offer several advantages in Kotlin programming:

### 1. **Exhaustive When Expressions**
One of the biggest advantages of sealed classes is their integration with Kotlin’s `when` expressions. Since the compiler knows all possible subclasses, it enforces exhaustive checks, reducing the chances of missing cases.

```kotlin
fun describeShape(shape: Shape): String = when (shape) {
    is Shape.Circle -> "Circle with radius ${shape.radius}"
    is Shape.Rectangle -> "Rectangle with width ${shape.width} and height ${shape.height}"
    Shape.Unknown -> "Unknown shape"
}
```

If a new subclass is added to `Shape`, the compiler will prompt us to update the `when` expression, ensuring our code remains robust and maintainable.

### 2. **Better Type Safety and Readability**
Sealed classes enforce type safety by restricting the number of subclasses, making code easier to read and understand. Unlike open classes, which allow inheritance from any external source, sealed classes ensure that all subclasses are explicitly defined in the same file.

### 3. **More Flexibility Than Enums**
While enums provide a way to define a set of constants, they are limited in that each value cannot hold different properties. Sealed classes, on the other hand, allow each subclass to store its own unique data and behavior.

For example, an enum approach would be restrictive:

```kotlin
enum class ShapeType {
    Circle, Rectangle, Unknown
}
```

But with sealed classes, we can store additional properties within each subclass:

```kotlin
sealed class Shape {
    class Circle(val radius: Double) : Shape()
    class Rectangle(val width: Double, val height: Double) : Shape()
}
```

### 4. **Encapsulation and Code Organization**
Sealed classes encourage encapsulation by keeping all related types in a single file, which improves code organization and maintainability.

---

## Practical Use Cases for Sealed Classes

Sealed classes are widely used in real-world Kotlin applications, especially in the following scenarios:

### 1. **Modeling UI State in Android Development**
Sealed classes are frequently used to represent different UI states in Android applications using Jetpack Compose or the traditional ViewModel-based architecture.

```kotlin
sealed class UIState {
    object Loading : UIState()
    class Success(val data: String) : UIState()
    class Error(val message: String) : UIState()
}

fun renderUI(state: UIState) {
    when (state) {
        is UIState.Loading -> showLoading()
        is UIState.Success -> showData(state.data)
        is UIState.Error -> showError(state.message)
    }
}
```

### 2. **Handling Network Responses**
Sealed classes are an excellent choice for managing network responses efficiently.

```kotlin
sealed class NetworkResult<out T> {
    class Success<T>(val data: T) : NetworkResult<T>()
    class Error(val message: String) : NetworkResult<Nothing>()
    object Loading : NetworkResult<Nothing>()
}

fun <T> handleResponse(result: NetworkResult<T>) {
    when (result) {
        is NetworkResult.Success -> println("Data: ${result.data}")
        is NetworkResult.Error -> println("Error: ${result.message}")
        NetworkResult.Loading -> println("Loading...")
    }
}
```

### 3. **Representing Navigation Routes in Jetpack Compose**
Kotlin sealed classes can be used to define navigation destinations in Jetpack Compose.

```kotlin
sealed class Screen(val route: String) {
    object Home : Screen("home")
    object Profile : Screen("profile")
    class Details(val itemId: Int) : Screen("details/$itemId")
}
```

---

## Differences Between Sealed Classes, Enums, and Data Classes

| Feature        | Sealed Classes | Enums | Data Classes |
|---------------|---------------|-------|--------------|
| Inheritance   | Allows multiple subclasses | Fixed set of values | No inheritance |
| Properties    | Each subclass can have its own fields | Limited to constants | Used for holding data |
| Extensibility | New subclasses require modifying the file | Cannot be extended | Cannot be extended |
| `when` Exhaustiveness | Yes | Yes | No |

---

## Limitations of Sealed Classes

While sealed classes are powerful, they have some limitations:
1. **All subclasses must be in the same file** – This restricts large-scale modularization.
2. **Cannot be instantiated directly** – You cannot create an instance of a sealed class directly; only its subclasses can be instantiated.
3. **Limited to class hierarchies** – Unlike interfaces, which can be implemented by multiple classes across different files, sealed classes are restricted.

---

## Conclusion

Sealed classes in Kotlin provide a structured and type-safe way to manage restricted class hierarchies. Their integration with `when` expressions makes them a great choice for handling state representation, network responses, and UI state management. While they offer more flexibility than enums and better encapsulation than open classes, they do have limitations regarding modularization.

By understanding and leveraging sealed classes, Kotlin developers can write more maintainable, readable, and error-resistant code, making their applications more robust and efficient.

Would you like to explore a deeper dive into sealed interfaces or their real-world applications in larger projects? Let me know in the comments below!

