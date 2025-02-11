---
draft: false
title: Interfaces in Kotlin
linkTitle: Interfaces
translationKey: interfaces-in-kotlin
weight: 80
description: An in-depth guide to interfaces in Kotlin, including syntax, key features, practical use cases, and best practices for using them effectively in your Kotlin applications.
date: 2025-02-11
url: interfaces-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Interfaces
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern programming language that runs on the Java Virtual Machine (JVM), is well known for its concise syntax, safety features, and seamless interoperability with Java. One of the fundamental building blocks of object-oriented programming (OOP) in Kotlin is the **interface**. Interfaces allow developers to define contracts that classes can implement, promoting code reusability and scalability.

In this article, we will explore interfaces in Kotlin, their syntax, key features, practical use cases, and best practices for using them effectively in your Kotlin applications.

## What Is an Interface in Kotlin?

An **interface** in Kotlin is a collection of abstract methods and properties that a class can implement. Unlike abstract classes, interfaces do not store state (i.e., they cannot have instance variables). Instead, they define a contract that implementing classes must adhere to.

### Key Characteristics of Interfaces in Kotlin

- Interfaces can contain **abstract methods** (without implementation).
- They can also include **default method implementations**.
- Interfaces **cannot have constructor parameters**.
- A class can **implement multiple interfaces** (supporting multiple inheritance).
- Interfaces support **properties**, but they cannot maintain state.

## Defining an Interface in Kotlin

To declare an interface in Kotlin, use the `interface` keyword. Below is a basic example:

```kotlin
interface Animal {
    fun makeSound()
}
```

Any class that implements this interface must provide an implementation for the `makeSound` method.

## Implementing an Interface

A class implements an interface using the `:` symbol followed by the interface name. Here’s an example:

```kotlin
class Dog : Animal {
    override fun makeSound() {
        println("Woof! Woof!")
    }
}

fun main() {
    val dog = Dog()
    dog.makeSound() // Output: Woof! Woof!
}
```

The `override` keyword is mandatory when providing implementations for interface methods.

## Interfaces with Properties

Kotlin interfaces can contain property declarations. However, they **cannot** maintain state because they do not have backing fields.

```kotlin
interface Vehicle {
    val speed: Int // Abstract property
    fun move()
}

class Car(override val speed: Int) : Vehicle {
    override fun move() {
        println("The car is moving at $speed km/h")
    }
}

fun main() {
    val car = Car(100)
    car.move() // Output: The car is moving at 100 km/h
}
```

Here, `speed` is a property declared in the interface, and implementing classes must override it.

## Default Method Implementations

Kotlin interfaces allow default method implementations using the `default` feature. This makes interfaces more powerful compared to Java interfaces before Java 8.

```kotlin
interface Logger {
    fun log(message: String) {
        println("Log: $message")
    }
}

class ConsoleLogger : Logger

fun main() {
    val logger = ConsoleLogger()
    logger.log("Hello, Kotlin!") // Output: Log: Hello, Kotlin!
}
```

Since `ConsoleLogger` does not override `log`, it uses the default implementation from the `Logger` interface.

## Multiple Interface Inheritance

Kotlin allows a class to implement multiple interfaces, which helps in achieving multiple inheritance.

```kotlin
interface Engine {
    fun start() {
        println("Engine starting...")
    }
}

interface Wheels {
    fun roll() {
        println("Wheels are rolling...")
    }
}

class Car : Engine, Wheels

fun main() {
    val car = Car()
    car.start()  // Output: Engine starting...
    car.roll()   // Output: Wheels are rolling...
}
```

A class that implements multiple interfaces inherits all their methods.

## Handling Method Conflicts

When a class implements multiple interfaces that have methods with the same name, Kotlin requires you to explicitly override the method and specify which implementation to use.

```kotlin
interface A {
    fun show() {
        println("Interface A")
    }
}

interface B {
    fun show() {
        println("Interface B")
    }
}

class C : A, B {
    override fun show() {
        super<A>.show() // Specify which interface’s method to use
        super<B>.show()
    }
}

fun main() {
    val obj = C()
    obj.show()
    // Output:
    // Interface A
    // Interface B
}
```

This feature ensures clarity and avoids ambiguity in multiple interface inheritance.

## Functional Interfaces (SAM Interfaces)

Kotlin supports **Single Abstract Method (SAM) interfaces**, which are interfaces with a single abstract method. These can be replaced with lambda expressions.

```kotlin
fun interface Printer {
    fun print(message: String)
}

fun main() {
    val printer: Printer = Printer { message -> println(message) }
    printer.print("Hello, Kotlin SAM Interfaces!")
}
```

SAM interfaces improve code readability and reduce boilerplate code.

## Use Cases of Interfaces in Kotlin

Interfaces are useful in various scenarios:

1. **Defining Common Behaviors**: Interfaces help define common behavior that multiple classes can share.
2. **Decoupling Code**: They enhance code flexibility by allowing different implementations to be used interchangeably.
3. **Multiple Inheritance**: They allow a class to inherit behaviors from multiple sources.
4. **Dependency Injection**: Interfaces facilitate dependency injection by enabling dependency inversion.
5. **Event Handling**: Useful in building event-driven applications.

## Best Practices for Using Interfaces in Kotlin

To use interfaces effectively in Kotlin, consider the following best practices:

- **Use interfaces for behavior, not for data**: Avoid storing state inside interfaces.
- **Favor Composition over Inheritance**: Use interfaces to compose behaviors rather than deep inheritance hierarchies.
- **Use default implementations wisely**: They can be helpful but may lead to unexpected side effects if overused.
- **Keep interfaces focused**: Avoid bloated interfaces; use multiple smaller interfaces when needed.
- **Document interfaces clearly**: Provide clear documentation on what an interface is intended to do.

## Conclusion

Interfaces in Kotlin are a powerful tool that enable code reuse, abstraction, and multiple inheritance. They allow you to define contracts that classes must adhere to while providing flexibility through default implementations and multiple interface inheritance. Understanding how to use interfaces effectively will help you write clean, maintainable, and scalable Kotlin applications.

By leveraging interfaces properly, you can design robust architectures that promote modularity and flexibility in Kotlin programming.
