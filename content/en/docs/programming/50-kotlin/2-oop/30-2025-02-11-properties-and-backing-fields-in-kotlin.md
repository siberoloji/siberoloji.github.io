---
draft: false
title: Properties and Backing Fields in Kotlin
linkTitle: Properties and Backing Fields
translationKey: properties-and-backing-fields-in-kotlin
weight: 30
description: We will explore properties and backing fields in Kotlin, covering their usage, benefits, and best practices.
date: 2025-02-11T00:00:00+03:00
url: properties-and-backing-fields-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - backing field
featured_image: /images/kotlin-1.png
---
Kotlin, a modern and expressive programming language, provides an intuitive and powerful way to work with classes and properties. Unlike Java, where you need to create explicit getter and setter methods, Kotlin simplifies property handling by introducing built-in property declarations, accessors, and backing fields. Understanding these concepts is crucial for writing clean, maintainable, and efficient Kotlin code.

In this article, we will explore properties and backing fields in Kotlin, covering their usage, benefits, and best practices.

## Understanding Properties in Kotlin

In Kotlin, a **property** is a combination of a **field** (which holds the value) and **accessors** (getter and setter methods). Properties are declared using the `val` or `var` keywords.

### 1. Declaring Properties

Kotlin allows the declaration of properties directly in a class without explicitly defining getter and setter methods. Here’s an example:

```kotlin
class Person {
    var name: String = ""
    var age: Int = 0
}
```

Here:

- `name` and `age` are properties of the `Person` class.
- Since they are declared with `var`, they are mutable and can be updated.

### 2. Read-Only vs. Mutable Properties

- `val`: Represents an **immutable** (read-only) property, similar to `final` in Java.
- `var`: Represents a **mutable** property, allowing value modification.

Example:

```kotlin
class Car {
    val model: String = "Tesla Model 3" // Read-only property
    var speed: Int = 60 // Mutable property
}
```

### 3. Custom Getters and Setters

Kotlin allows you to customize property accessors using **getters** and **setters**.

#### Custom Getter

```kotlin
class Circle(val radius: Double) {
    val area: Double
        get() = Math.PI * radius * radius
}
```

Here, `area` is a computed property and doesn’t store a value. Instead, it calculates the area dynamically when accessed.

#### Custom Setter

```kotlin
class Student {
    var grade: Int = 0
        set(value) {
            field = if (value in 0..100) value else throw IllegalArgumentException("Grade must be between 0 and 100")
        }
}
```

In this case, `grade` has a custom setter that ensures the assigned value is within the valid range.

## Understanding Backing Fields

A **backing field** is an internal mechanism used by Kotlin to store property values when a custom getter or setter is defined. It prevents infinite recursion when accessing a property inside its accessor.

### 1. Why Do We Need Backing Fields?

Consider the following example:

```kotlin
class Example {
    var text: String = "Hello"
        get() = text.toUpperCase() // This will cause an infinite loop
}
```

Here, calling `get()` on `text` results in infinite recursion, causing a stack overflow error.

### 2. Using Backing Field (`field` Keyword)

To avoid recursion, Kotlin provides an implicit backing field called `field`:

```kotlin
class Example {
    var text: String = "Hello"
        get() = field.toUpperCase()
}
```

- The `field` keyword refers to the actual stored value of the property.
- The getter now safely returns the transformed value without recursion.

### 3. Custom Setter with Backing Field

```kotlin
class User {
    var password: String = "default"
        set(value) {
            field = value.hashCode().toString() // Store hashed password instead of plain text
        }
}
```

Here, `field` ensures that we modify the actual property instead of calling the setter recursively.

## Late-Initialized Properties (`lateinit`)

Kotlin provides the `lateinit` modifier for properties that will be initialized later but must be mutable (`var`).

```kotlin
class Database {
    lateinit var connection: String
}
```

- `lateinit` is useful when initialization is deferred (e.g., dependency injection, lifecycle-aware components).
- It cannot be used with `val` properties.

## Lazy-Initialized Properties (`lazy`)

For `val` properties that should be initialized only when accessed for the first time, Kotlin provides **lazy initialization** using the `lazy` delegate.

```kotlin
class Config {
    val databaseUrl: String by lazy { "jdbc:mysql://localhost:3306/mydb" }
}
```

- The `lazy` block runs only once, caching the computed value for future use.

## Best Practices for Using Properties and Backing Fields

1. **Use `val` wherever possible**: Prefer immutable properties to make your code safer and more predictable.
2. **Use backing fields judiciously**: Use `field` only when necessary to avoid infinite recursion.
3. **Use `lateinit` and `lazy` appropriately**: Use `lateinit` for mutable properties that will be initialized later and `lazy` for expensive computations.
4. **Encapsulate mutable properties**: Provide controlled access through custom getters and setters to ensure data integrity.

## Conclusion

Kotlin’s properties and backing fields simplify class design by reducing boilerplate code while offering flexibility and control. By leveraging features like custom accessors, backing fields, `lateinit`, and `lazy`, developers can write concise and efficient code that is both safe and maintainable.

By mastering these concepts, you can harness Kotlin’s full potential to create robust and well-structured applications. Happy coding!
