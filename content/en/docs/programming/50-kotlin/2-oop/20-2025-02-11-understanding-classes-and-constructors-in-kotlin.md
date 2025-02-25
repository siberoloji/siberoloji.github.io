---
draft: false
title: Primary and Secondary Constructors in Classes and Properties in Kotlin
linkTitle: Primary and Secondary Constructors
translationKey: primary-and-secondary-constructors-in-classes-and-properties-in-kotlin
weight: 20
description: One of the key aspects of Kotlin's object-oriented programming capabilities is its support for constructors in classes and properties.
date: 2025-02-11
url: primary-and-secondary-constructors-in-classes-and-properties-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - primary constructor
  - secondary constructor
featured_image: /images/kotlin-1.png
---
Kotlin is a modern programming language that offers many features to make development more efficient and expressive. One of the key aspects of Kotlin's object-oriented programming capabilities is its support for **constructors in classes** and **properties**. Understanding **primary and secondary constructors** is essential for designing classes effectively. This blog post will provide an in-depth look into these concepts, how they differ, and when to use them.

## Understanding Classes and Constructors in Kotlin

A **class** in Kotlin is a blueprint for creating objects. It encapsulates data and behavior related to that data. Kotlin classes can have **constructors**, which are special functions used to initialize new instances of a class.

Kotlin provides two types of constructors:

1. **Primary Constructor**: Defined in the class header and used for initializing properties.
2. **Secondary Constructor**: Defined inside the class body and provides additional ways to instantiate an object.

Let’s explore each in detail.

## Primary Constructor in Kotlin

The **primary constructor** is a concise way to declare and initialize properties. It is defined in the class header after the class name.

### Syntax

```kotlin
class Person(val name: String, var age: Int)
```

In the above example:

- `val name: String` and `var age: Int` are **properties** initialized by the primary constructor.
- `val` makes `name` a read-only property, whereas `var` makes `age` mutable.
- There is no explicit body required for the primary constructor unless additional logic is needed.

### Example with an Initialization Block

If additional initialization logic is required, we can use the **init block**.

```kotlin
class Person(val name: String, var age: Int) {
    init {
        println("Person named $name is $age years old")
    }
}
```

The `init` block executes immediately after the primary constructor is called.

### Default Values in Primary Constructor

Kotlin allows default values for constructor parameters, making object creation flexible.

```kotlin
class Employee(val name: String, var salary: Double = 50000.0)

fun main() {
    val emp1 = Employee("John") // salary defaults to 50000.0
    val emp2 = Employee("Alice", 70000.0)
}
```

Here, `emp1` is created with a default salary, whereas `emp2` overrides it.

## Secondary Constructor in Kotlin

The **secondary constructor** provides an alternative way to initialize a class. It is defined inside the class body using the `constructor` keyword.

### Syntax

```kotlin
class Student {
    var name: String
    var grade: Int
    
    constructor(name: String, grade: Int) {
        this.name = name
        this.grade = grade
    }
}
```

### Example with Multiple Constructors

A class can have multiple secondary constructors.

```kotlin
class Car {
    var brand: String
    var model: String
    var year: Int
    
    constructor(brand: String, model: String) {
        this.brand = brand
        this.model = model
        this.year = 2023 // default year
    }
    
    constructor(brand: String, model: String, year: Int) {
        this.brand = brand
        this.model = model
        this.year = year
    }
}
```

This allows flexibility in object creation:

```kotlin
val car1 = Car("Toyota", "Camry") // Defaults year to 2023
val car2 = Car("Ford", "Mustang", 2020)
```

### Calling Primary Constructor from Secondary Constructor

A **secondary constructor** can delegate to the **primary constructor** using `this`.

```kotlin
class Animal(val species: String, val age: Int) {
    constructor(species: String) : this(species, 0) // Defaults age to 0
}
```

This ensures consistency by always calling the primary constructor first.

## Differences Between Primary and Secondary Constructors

| Feature                 | Primary Constructor                              | Secondary Constructor                          |
|-------------------------|------------------------------------------------|------------------------------------------------|
| **Definition**          | Declared in the class header                    | Declared inside the class body                 |
| **Initialization**      | Preferred for property initialization           | Can perform additional operations              |
| **Code Simplicity**     | More concise and readable                       | More verbose                                   |
| **Multiple Constructors** | Only one primary constructor allowed          | Multiple secondary constructors possible       |
| **Delegation**          | Cannot delegate to another constructor          | Can delegate to the primary constructor        |

## Properties in Kotlin Classes

Kotlin provides a powerful way to define properties in classes. Properties in Kotlin include **var (mutable)** and **val (read-only)** types.

### Property Syntax

```kotlin
class Book(val title: String, var price: Double)
```

- `title` is **read-only** (cannot be changed after initialization).
- `price` is **mutable** (can be changed after object creation).

### Custom Getters and Setters

Kotlin allows custom getters and setters to control property behavior.

```kotlin
class Rectangle(val width: Int, val height: Int) {
    val area: Int
        get() = width * height // Custom getter
}

fun main() {
    val rect = Rectangle(5, 10)
    println("Area: ${rect.area}")
}
```

For mutable properties, a custom setter can be defined:

```kotlin
class Account(var balance: Double) {
    var interestRate: Double = 5.0
        set(value) {
            if (value > 0) field = value // Validates input
        }
}
```

## Conclusion

Kotlin provides **primary and secondary constructors** to make class initialization more flexible. The **primary constructor** is concise and best for property initialization, while the **secondary constructor** is useful when multiple ways to instantiate a class are needed. Additionally, Kotlin's property system, with **var, val, custom getters, and setters**, provides powerful tools for encapsulating data.

By understanding these concepts, you can write more efficient and readable Kotlin code. Happy coding!
