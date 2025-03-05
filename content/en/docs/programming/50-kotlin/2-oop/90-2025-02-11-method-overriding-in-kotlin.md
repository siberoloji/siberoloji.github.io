---
draft: false
title: Method Overriding in Kotlin
url: method-overriding-in-kotlin
linkTitle: Method Overriding
translationKey: method-overriding-in-kotlin
weight: 90
description: Learn how to override methods in Kotlin, a popular programming language for Android development.
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
  - Method Overriding
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern and concise programming language developed by JetBrains, has gained significant popularity for its expressive syntax and interoperability with Java. One of the fundamental concepts in object-oriented programming (OOP) is **method overriding**, which allows a subclass to provide a specific implementation of a method that is already defined in its superclass.

This article explores method overriding in Kotlin, covering its syntax, rules, use cases, and key differences from Java. By the end of this post, you will have a solid understanding of method overriding in Kotlin and how to leverage it effectively in your projects.

## Understanding Method Overriding

### What is Method Overriding?

Method overriding occurs when a subclass provides a different implementation for a method that is already defined in its parent class. This enables polymorphism, allowing objects to be treated as instances of their superclass while still executing subclass-specific behavior.

For method overriding to work in Kotlin, the method in the superclass must be explicitly marked as `open`, and the overriding method in the subclass must use the `override` keyword.

### Syntax of Method Overriding in Kotlin

```kotlin
open class Animal {
    open fun makeSound() {
        println("Animal makes a sound")
    }
}

class Dog : Animal() {
    override fun makeSound() {
        println("Dog barks")
    }
}

fun main() {
    val myDog = Dog()
    myDog.makeSound() // Output: Dog barks
}
```

### Key Points in the Above Example

- The `Animal` class has an `open` method `makeSound()`.
- The `Dog` class extends `Animal` and overrides `makeSound()` using the `override` keyword.
- When `makeSound()` is called on a `Dog` object, it executes the overridden implementation.

## Rules for Method Overriding in Kotlin

Kotlin imposes several rules when overriding methods:

1. **Methods must be marked as `open`**: By default, all methods in Kotlin are `final` (i.e., cannot be overridden). To allow overriding, the method in the parent class must have the `open` modifier.
2. **Use of `override` keyword is mandatory**: The subclass must explicitly mark the overriding method with `override`.
3. **Method signatures must match**: The overridden method in the subclass must have the same name, return type, and parameters as the method in the superclass.
4. **Visibility rules apply**: A subclass cannot override a `private` method, but it can override a `protected` or `public` method.
5. **Overriding a method with a `final` modifier is not allowed**: Once a method is marked as `final`, it cannot be overridden further.

## Calling the Superclass Method

When overriding a method, you might still want to call the superclass’s version of the method. This is possible using the `super` keyword.

```kotlin
open class Animal {
    open fun makeSound() {
        println("Animal makes a sound")
    }
}

class Dog : Animal() {
    override fun makeSound() {
        super.makeSound()
        println("Dog barks")
    }
}

fun main() {
    val myDog = Dog()
    myDog.makeSound()
    // Output:
    // Animal makes a sound
    // Dog barks
}
```

Here, `super.makeSound()` ensures that the superclass implementation runs before executing the overridden method.

## Overriding Properties in Kotlin

Method overriding isn’t limited to functions; properties can also be overridden in Kotlin.

```kotlin
open class Animal {
    open val sound: String = "Some sound"
}

class Dog : Animal() {
    override val sound: String = "Bark"
}

fun main() {
    val myDog = Dog()
    println(myDog.sound) // Output: Bark
}
```

### Key Differences Between Function and Property Overriding

- Functions must be marked as `open` for overriding, whereas properties can be overridden as long as they are declared `open`.
- Overriding properties must maintain the same type or be a subtype of the original property.

## Differences Between Method Overriding in Kotlin and Java

Kotlin simplifies method overriding compared to Java. Here are some key differences:

| Feature | Kotlin | Java |
|---------|--------|------|
| Method Declaration | Uses `open` for allowing overriding | Methods are `open` by default unless marked `final` |
| Overriding | Uses `override` keyword explicitly | Uses `@Override` annotation (optional) |
| Properties | Supports property overriding | No direct support for property overriding |
| Default Modifiers | Methods are `final` by default | Methods are not `final` by default |

Kotlin’s explicit use of `open` and `override` provides more control and avoids accidental overrides, leading to safer and more readable code.

## Real-World Use Cases of Method Overriding

1. **Customizing UI Components**
   - In Android development, method overriding is widely used to customize UI behavior. For example, overriding `onDraw()` in a `View` class to customize rendering.

2. **Implementing Polymorphism**
   - A base class can define a general contract while subclasses provide specific implementations.

3. **Enhancing Library Functions**
   - Developers can extend open classes from libraries and override methods to add custom functionality.

## Best Practices for Method Overriding in Kotlin

1. **Use `final` when necessary**: If a method should not be overridden, mark it as `final`.
2. **Keep overridden methods concise**: Avoid unnecessary complexity in overridden methods.
3. **Call `super` when required**: Ensure the superclass logic is not lost if needed.
4. **Follow SOLID principles**: Override methods only when it makes logical sense within the design.
5. **Leverage property overriding**: Instead of creating unnecessary functions, consider overriding properties when appropriate.

## Conclusion

Method overriding is a crucial feature in Kotlin that enables polymorphism, code reuse, and flexibility in object-oriented programming. By explicitly marking methods as `open` and using the `override` keyword, Kotlin ensures clear and controlled method overriding, reducing accidental errors common in Java. Understanding when and how to override methods effectively will help you write clean, maintainable, and robust Kotlin applications.

If you're developing Kotlin applications, keep these best practices in mind to make the most out of method overriding and object-oriented design!
