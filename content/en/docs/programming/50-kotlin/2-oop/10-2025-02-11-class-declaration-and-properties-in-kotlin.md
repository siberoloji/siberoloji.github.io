---
draft: false
title: Class Declaration and Properties in Kotlin Programming Language
linkTitle: Class Declaration and Properties
translationKey: class-declaration-and-properties-in-kotlin
url: class-declaration-and-properties-in-kotlin
weight: 10
description: In this blog post, we will explore class declarations in Kotlin, how properties are defined and managed, and key features that make Kotlin a preferred choice over Java.
date: 2025-02-11
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Class Declaration
featured_image: /images/kotlin-1.png
---
Kotlin is a modern and expressive programming language widely used for Android development, web applications, and server-side programming. One of its core features is its elegant handling of class declarations and properties, making code more readable, concise, and maintainable. In this blog, we will explore class declarations in Kotlin, how properties are defined and managed, and key features that make Kotlin a preferred choice over Java.

## **Understanding Class Declaration in Kotlin**

### **Basic Class Declaration**

In Kotlin, classes are declared using the `class` keyword. Unlike Java, Kotlin classes do not require explicit `getter` and `setter` methods unless customization is needed. A simple class can be declared as follows:

```kotlin
class Person {
    var name: String = ""
    var age: Int = 0
}
```

Here, `Person` is a class with two properties: `name` and `age`. Kotlin provides default getter and setter methods for these properties.

### **Primary Constructor**

Kotlin allows defining the primary constructor directly within the class declaration:

```kotlin
class Person(val name: String, var age: Int)
```

- `val name` defines a read-only property.
- `var age` defines a mutable property.

By using the primary constructor, we eliminate the need for explicitly initializing properties inside the class body.

### **Secondary Constructor**

Kotlin also allows secondary constructors, which provide additional ways to initialize a class:

```kotlin
class Employee {
    var name: String
    var age: Int

    constructor(name: String, age: Int) {
        this.name = name
        this.age = age
    }
}
```

However, in Kotlin, secondary constructors are less common because the primary constructor with default values and `init` blocks usually suffice.

### **Init Block**

If additional initialization logic is required, Kotlin provides an `init` block:

```kotlin
class Car(val brand: String, val model: String) {
    init {
        println("Car brand: $brand, Model: $model")
    }
}
```

The `init` block executes as soon as an instance of the class is created.

## **Properties in Kotlin**

Properties in Kotlin are variables associated with a class and have built-in getter and setter methods. There are different ways to declare and use properties.

### **Immutable (`val`) vs Mutable (`var`) Properties**

- `val` (immutable) properties cannot be reassigned after initialization.
- `var` (mutable) properties can be changed after initialization.

Example:

```kotlin
class Book(val title: String, var price: Double)
```

Here, `title` cannot be modified once assigned, while `price` can be updated.

### **Custom Getters and Setters**

Kotlin allows custom getter and setter methods for properties.

```kotlin
class Rectangle(val width: Int, val height: Int) {
    val area: Int
        get() = width * height
}
```

In this example, `area` does not store a value but is calculated dynamically using a custom getter.

For setters, we can define them as follows:

```kotlin
class Student {
    var grade: Int = 0
        set(value) {
            field = if (value in 0..100) value else throw IllegalArgumentException("Invalid grade")
        }
}
```

Here, the setter assigns only valid grade values (0–100).

### **Backing Fields (`field`)**

When customizing setters, Kotlin uses the special `field` keyword to avoid recursive calls.

Example:

```kotlin
class Temperature {
    var celsius: Double = 0.0
        set(value) {
            field = value
        }
}
```

The `field` keyword refers to the property’s backing field, ensuring safe assignment.

### **Late-Initialized Properties (`lateinit`)**

For properties that are initialized later (e.g., dependency injection), Kotlin provides the `lateinit` modifier:

```kotlin
class DatabaseConnection {
    lateinit var connection: String

    fun connect() {
        connection = "Connected to database"
    }
}
```

The `lateinit` keyword defers initialization and avoids unnecessary null checks.

### **Delegated Properties**

Kotlin supports property delegation using the `by` keyword. A common example is `lazy` initialization:

```kotlin
class User {
    val info: String by lazy {
        println("Initializing info...")
        "User information loaded"
    }
}
```

Here, `info` is initialized only when first accessed, improving performance.

## **Visibility Modifiers**

Kotlin provides visibility modifiers to control property access:

- `public` (default): Accessible everywhere.
- `private`: Accessible only within the class.
- `protected`: Accessible within the class and subclasses.
- `internal`: Accessible within the same module.

Example:

```kotlin
class Account {
    private var balance: Double = 0.0

    fun deposit(amount: Double) {
        balance += amount
    }
}
```

Here, `balance` is private and cannot be accessed directly outside the class.

## **Data Classes**

For simple data storage, Kotlin offers `data class`, which automatically generates `equals()`, `hashCode()`, and `toString()` methods:

```kotlin
data class Customer(val name: String, val age: Int)
```

`data class` simplifies object comparison and representation.

## **Abstract Classes and Interfaces**

Kotlin supports abstraction for better code organization.

### **Abstract Class**

An abstract class cannot be instantiated directly and must be subclassed:

```kotlin
abstract class Animal {
    abstract fun makeSound()
}

class Dog : Animal() {
    override fun makeSound() {
        println("Woof!")
    }
}
```

### **Interfaces**

Interfaces define behavior without storing state:

```kotlin
interface Vehicle {
    fun drive()
}

class Car : Vehicle {
    override fun drive() {
        println("Driving a car")
    }
}
```

## **Conclusion**

Kotlin simplifies class declaration and property management with modern, expressive syntax. Features like primary constructors, custom getters and setters, property delegation, and data classes make Kotlin a powerful choice for application development. Understanding these concepts will help you write cleaner and more efficient Kotlin code, ultimately improving productivity and maintainability.
