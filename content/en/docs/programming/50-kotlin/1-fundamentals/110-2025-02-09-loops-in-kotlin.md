---
draft: false
title: Loops in Kotlin
linkTitle: Loops
translationKey: loops-in-kotlin
weight: 110
description: We learn how to use loops in Kotlin in this comprehensive guide. We will discuss their syntax, various use cases, and best practices, along with examples to help you master this essential concept.
date: 2025-02-09
url: loops-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Loops
  - Control Flow
  - Iteration
  - While Loop
  - Do-While Loop
  - For Loop
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern and expressive programming language developed by JetBrains, provides powerful and flexible looping constructs that make iteration more intuitive and efficient. Loops allow developers to execute a block of code multiple times based on a specified condition. Kotlin supports three primary looping constructs:

- `for` loop
- `while` loop
- `do-while` loop

Each of these loops has its own unique use cases and advantages. In this article, we will explore these looping structures in detail, discuss their syntax, use cases, and best practices, and provide examples to help you master loops in Kotlin.

---

## 1. The `for` Loop in Kotlin

The `for` loop is used to iterate over a range, collection, or array. It simplifies iteration by eliminating the need for explicit indexing.

### **Basic Syntax:**

```kotlin
for (item in collection) {
    // Code to be executed for each item
}
```

### **Iterating Over a Range**

Kotlin allows iterating over a range of numbers using the `..` operator.

```kotlin
fun main() {
    for (i in 1..5) {
        println("Iteration: $i")
    }
}
```

**Output:**

```
Iteration: 1
Iteration: 2
Iteration: 3
Iteration: 4
Iteration: 5
```

### **Using `step` and `downTo` in Ranges**

You can control the increment step using the `step` keyword or iterate in reverse using `downTo`.

```kotlin
fun main() {
    for (i in 1..10 step 2) {
        println("Step iteration: $i")
    }

    for (i in 10 downTo 1 step 3) {
        println("Reverse iteration: $i")
    }
}
```

**Output:**

```
Step iteration: 1
Step iteration: 3
Step iteration: 5
Step iteration: 7
Step iteration: 9
Reverse iteration: 10
Reverse iteration: 7
Reverse iteration: 4
Reverse iteration: 1
```

### **Iterating Over Arrays and Lists**

You can use the `for` loop to iterate over collections like lists or arrays.

```kotlin
fun main() {
    val fruits = listOf("Apple", "Banana", "Cherry")
    for (fruit in fruits) {
        println(fruit)
    }
}
```

### **Using `indices` and `withIndex()` for Indexed Iteration**

If you need the index along with the value, Kotlin provides two ways:

```kotlin
fun main() {
    val names = arrayOf("Alice", "Bob", "Charlie")

    // Using indices
    for (index in names.indices) {
        println("Index $index: ${names[index]}")
    }

    // Using withIndex()
    for ((index, name) in names.withIndex()) {
        println("Index $index: $name")
    }
}
```

---

## 2. The `while` Loop in Kotlin

The `while` loop executes a block of code repeatedly as long as a specified condition is `true`.

### **Basic Syntax:**

```kotlin
while (condition) {
    // Code to be executed
}
```

### **Example: Counting Numbers**

```kotlin
fun main() {
    var count = 1
    while (count <= 5) {
        println("Count: $count")
        count++
    }
}
```

**Output:**

```
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

### **Using `while` for Input Validation**

A `while` loop is useful for handling user input validation.

```kotlin
fun main() {
    var input: Int
    do {
        println("Enter a positive number:")
        input = readLine()?.toIntOrNull() ?: 0
    } while (input <= 0)

    println("You entered: $input")
}
```

---

## 3. The `do-while` Loop in Kotlin

The `do-while` loop is similar to the `while` loop, but it guarantees at least one execution before checking the condition.

### **Basic Syntax:**

```kotlin
do {
    // Code to be executed
} while (condition)
```

### **Example: Repeating an Action Until a Condition is Met**

```kotlin
fun main() {
    var num = 1
    do {
        println("Number: $num")
        num++
    } while (num <= 5)
}
```

### **Use Case: User Input Until Correct Value is Entered**

A `do-while` loop is often used to prompt the user until a valid input is provided.

```kotlin
fun main() {
    var password: String
    do {
        println("Enter the password:")
        password = readLine() ?: ""
    } while (password != "KotlinRocks")

    println("Access granted!")
}
```

---

## 4. Loop Control Statements

Kotlin provides loop control statements such as `break` and `continue` to control the flow of loops.

### **Breaking a Loop with `break`**

The `break` statement is used to exit a loop prematurely.

```kotlin
fun main() {
    for (i in 1..10) {
        if (i == 5) {
            println("Breaking at $i")
            break
        }
        println("Iteration: $i")
    }
}
```

### **Skipping an Iteration with `continue`**

The `continue` statement skips the current iteration and proceeds with the next one.

```kotlin
fun main() {
    for (i in 1..5) {
        if (i == 3) continue
        println("Iteration: $i")
    }
}
```

---

## Best Practices for Using Loops in Kotlin

1. **Use `for` loops for iterating over ranges and collections** – They are concise and readable.
2. **Use `while` and `do-while` for conditions that are dynamically checked** – When looping based on a condition, `while` loops are preferable.
3. **Prefer functional constructs like `forEach` and `map` when working with collections** – Kotlin provides higher-order functions that are often more expressive than loops.
4. **Avoid infinite loops** – Ensure loop conditions eventually become false.
5. **Use `break` and `continue` wisely** – Avoid excessive use as they can make code harder to follow.

---

## Conclusion

Loops are an essential part of Kotlin programming, providing the ability to iterate over elements efficiently. Whether using `for`, `while`, or `do-while`, understanding how and when to use each loop is key to writing clean and effective Kotlin code. By following best practices and leveraging Kotlin’s expressive syntax, you can make your loops more readable and maintainable. Happy coding!
