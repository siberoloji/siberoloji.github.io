---
draft: false
title: Property Delegation in Kotlin
linkTitle: Property Delegation
translationKey: property-delegation-in-kotlin
weight: 230
description: This article explores property delegation in Kotlin, its use cases, built-in delegates, and how to create custom delegates.
date: 2025-02-14
url: property-delegation-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Property Delegation
featured_image: /images/kotlin-1.png
---
Kotlin, the modern programming language developed by JetBrains, offers a variety of powerful features that make development more efficient and expressive. One such feature is **property delegation**, which allows developers to delegate the responsibility of property management to another class or function. This feature enables better code reuse, cleaner implementation, and reduced boilerplate code.

In this blog post, we will explore property delegation in Kotlin, its use cases, built-in delegates, and how to create custom delegates.

---

## Understanding Property Delegation

### What is Property Delegation?

Property delegation in Kotlin refers to the practice of handing over the getter and setter logic of a property to a separate class or function. Instead of directly defining field variables and managing their access manually, Kotlin provides a **by** keyword, which allows us to delegate property management to another object.

### How Does it Work?

When a property is declared using delegation, Kotlin internally calls the appropriate methods of the delegate object. This means that property behavior is determined by the delegated instance rather than by the containing class itself.

Here's a simple example demonstrating property delegation:

```kotlin
import kotlin.reflect.KProperty

class Delegate {
    operator fun getValue(thisRef: Any?, property: KProperty<*>): String {
        return "Delegated Property: ${property.name}"
    }
}

class Example {
    val delegatedProperty: String by Delegate()
}

fun main() {
    val example = Example()
    println(example.delegatedProperty)
}
```

### Benefits of Property Delegation

1. **Reduces Boilerplate Code:** Delegation helps avoid repetitive code by abstracting common logic.
2. **Enhances Code Reusability:** The same delegate class can be used across multiple properties and classes.
3. **Provides Lazy Initialization:** Helps in delaying property initialization until it is needed.
4. **Improves Encapsulation:** The delegation mechanism can restrict direct access and enforce controlled behavior.

---

## Built-in Property Delegates in Kotlin

Kotlin provides several built-in property delegates that simplify property management. Some of the most commonly used ones include:

### 1. Lazy Delegation

The `lazy` function is used to initialize a property only when it is first accessed. This is useful when dealing with expensive operations that should be executed only when needed.

```kotlin
val lazyValue: String by lazy {
    println("Computed only once!")
    "Hello, Kotlin!"
}

fun main() {
    println(lazyValue)  // Prints: Computed only once!
    println(lazyValue)  // Directly returns the computed value without recomputing
}
```

### 2. Observable Delegation

The `Delegates.observable` function allows tracking changes to a property’s value.

```kotlin
import kotlin.properties.Delegates

class User {
    var name: String by Delegates.observable("Initial") { _, old, new ->
        println("Name changed from $old to $new")
    }
}

fun main() {
    val user = User()
    user.name = "Alice"
    user.name = "Bob"
}
```

### 3. Vetoable Delegation

The `Delegates.vetoable` function enables conditional updates to a property. The change will only happen if the provided condition evaluates to `true`.

```kotlin
var age: Int by Delegates.vetoable(18) { _, old, new ->
    new >= old  // Only allows the value to increase, preventing decrement
}

fun main() {
    println(age)  // Prints: 18
    age = 25      // Allowed
    println(age)  // Prints: 25
    age = 20      // Ignored, as 20 < 25
    println(age)  // Still prints: 25
}
```

---

## Creating Custom Property Delegates

While built-in delegates cover many common use cases, Kotlin also allows the creation of **custom property delegates** by implementing the `getValue` and `setValue` operator functions.

### Example: Creating a Custom Delegate for Logging Property Access

```kotlin
import kotlin.reflect.KProperty

class LoggingDelegate<T>(private var value: T) {
    operator fun getValue(thisRef: Any?, property: KProperty<*>): T {
        println("Getting property '${property.name}': $value")
        return value
    }
    
    operator fun setValue(thisRef: Any?, property: KProperty<*>, newValue: T) {
        println("Setting property '${property.name}' to $newValue")
        value = newValue
    }
}

class Person {
    var name: String by LoggingDelegate("Unknown")
}

fun main() {
    val person = Person()
    person.name = "John"
    println(person.name)
}
```

This custom delegate logs property access and updates, providing greater transparency when debugging.

---

## When to Use Property Delegation?

Property delegation is useful in various scenarios, including:

1. **Lazy Loading:** When you need to defer object creation until it is accessed.
2. **Configuration Handling:** Storing and retrieving configuration values dynamically.
3. **Property Change Tracking:** Observing and logging property changes in an application.
4. **Encapsulation & Security:** Restricting direct modification of a property.

---

## Conclusion

Property delegation in Kotlin is a powerful mechanism that simplifies property management and enhances code maintainability. Whether using built-in delegates like `lazy` and `observable` or creating custom ones, this feature helps in reducing boilerplate code, increasing code reusability, and improving application efficiency. By leveraging property delegation effectively, developers can write cleaner and more expressive Kotlin code.

Would you like to explore more Kotlin features? Let us know in the comments!
