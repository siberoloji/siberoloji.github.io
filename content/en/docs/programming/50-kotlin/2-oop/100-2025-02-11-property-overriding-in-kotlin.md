---
draft: false
title: Property Overriding in Kotlin Programming Language
linkTitle: Property Overriding
translationKey: property-overriding-in-kotlin
weight: 100
description: This article explores the concept of property overriding in Kotlin, including its syntax, rules, and practical use cases.
url: property-overriding-in-kotlin
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
  - Property Overriding
featured_image: /images/kotlin-1.png
---
Kotlin, as a modern programming language, offers a variety of powerful features to make software development more efficient and expressive. One such feature is **property overriding**, which allows developers to redefine properties in subclasses, providing greater flexibility and control over inheritance.

In this article, we will explore the concept of **property overriding** in Kotlin, including its syntax, rules, and practical use cases.

## Understanding Property Overriding in Kotlin

Property overriding in Kotlin refers to the ability of a subclass to provide a different implementation for a property that is already defined in its superclass. This mechanism is essential in object-oriented programming as it supports polymorphism, enabling more dynamic and reusable code.

In Kotlin, properties can be overridden under the following conditions:

- The property in the superclass must be declared with the `open` keyword.
- The property in the subclass must use the `override` keyword.
- The overriding property must be of the same type or a subtype of the original property.
- If the property has a custom getter or setter, the overridden property must also comply with this behavior.

## Syntax of Property Overriding

To override a property in Kotlin, follow these steps:

1. Declare an **open** property in the parent class.
2. Use the **override** keyword in the child class to redefine the property.

### Example 1: Overriding a Read-Only Property

```kotlin
open class Animal {
    open val sound: String = "Some sound"
}

class Dog : Animal() {
    override val sound: String = "Bark"
}

fun main() {
    val dog = Dog()
    println(dog.sound) // Output: Bark
}
```

### Example 2: Overriding a Mutable Property

```kotlin
open class Vehicle {
    open var speed: Int = 60
}

class Car : Vehicle() {
    override var speed: Int = 120
}

fun main() {
    val car = Car()
    println(car.speed) // Output: 120
}
}
```

In this example, the `speed` property is mutable (`var`), and we override it in the `Car` class with a different default value.

## Overriding Properties with Custom Getters and Setters

Kotlin allows you to override properties that use custom getters and setters, but with certain constraints. If the superclass defines a property with a getter, the subclass must override it with a compatible getter implementation.

### Example 3: Overriding a Property with a Custom Getter

```kotlin
open class Rectangle {
    open val area: Int
        get() = 10 * 5
}

class Square : Rectangle() {
    override val area: Int
        get() = 5 * 5
}

fun main() {
    val shape = Square()
    println(shape.area) // Output: 25
}
```

Here, the `Square` class overrides the `area` property to provide a new implementation for its getter.

## Overriding Properties with Backing Fields

A backing field in Kotlin is used when we need to maintain state inside a property. When overriding properties with backing fields, the subclass can define a different way to store values while still adhering to the property’s contract.

### Example 4: Overriding a Property with a Backing Field

```kotlin
open class Person {
    open var age: Int = 30
        get() = field
        set(value) {
            field = if (value > 0) value else throw IllegalArgumentException("Age must be positive")
        }
}

class Employee : Person() {
    override var age: Int = 25
        set(value) {
            field = if (value in 18..65) value else throw IllegalArgumentException("Invalid age for an employee")
        }
}

fun main() {
    val employee = Employee()
    employee.age = 35
    println(employee.age) // Output: 35
}
```

In this case, both the parent and child classes enforce constraints on the `age` property through customized setters.

## Rules and Constraints of Property Overriding

While property overriding provides great flexibility, there are a few important rules to remember:

1. **Final Properties Cannot Be Overridden:**
   - If a property is declared without `open`, it cannot be overridden.
   - Example:

     ```kotlin
     class Parent {
         val name: String = "John" // Cannot be overridden
     }
     ```

2. **Val Properties Can Override Other Val Properties:**
   - You can override a `val` property with another `val`, but not with a `var`.
   - Example:

     ```kotlin
     open class Parent {
         open val country: String = "USA"
     }

     class Child : Parent() {
         override val country: String = "Canada"
     }
     ```

3. **Var Properties Can Override Other Var Properties:**
   - You can override a `var` with another `var`, but not with a `val`.
   - Example:

     ```kotlin
     open class Parent {
         open var city: String = "New York"
     }

     class Child : Parent() {
         override var city: String = "Los Angeles"
     }
     ```

4. **Access Modifiers Must Be Compatible:**
   - The overridden property cannot have a more restrictive visibility than the original.
   - Example:

     ```kotlin
     open class Parent {
         protected open val data: String = "Secret"
     }

     class Child : Parent() {
         // This will cause an error because 'data' is protected and cannot be public
         // override val data: String = "Revealed"
     }
     ```

## Practical Use Cases of Property Overriding

### 1. Customizing Default Values in Subclasses

Overriding properties allow subclasses to provide different default values without changing the superclass logic.

### 2. Implementing Dynamic Behaviors

With custom getters, property values can be computed dynamically, useful for scenarios such as caching or real-time data updates.

### 3. Enforcing Constraints

By overriding setters, subclasses can apply additional validation rules.

## Conclusion

Property overriding in Kotlin is a fundamental feature that enhances code reusability and flexibility. Understanding the rules and best practices of overriding helps developers write more maintainable and extensible applications.

By leveraging property overriding, you can create classes that enforce constraints, customize behaviors, and implement dynamic calculations effectively. Whether working with simple properties or those with complex logic, mastering property overriding will help you develop robust Kotlin applications.
