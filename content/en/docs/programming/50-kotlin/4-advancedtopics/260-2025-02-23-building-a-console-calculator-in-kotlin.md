---
draft: false
title: Building a Console Calculator in Kotlin
linkTitle: Building a Console Calculator
translationKey: building-a-console-calculator-in-kotlin
weight: 260
description: Learn how to build a console calculator in Kotlin that performs basic arithmetic operations. This tutorial covers setting up the Kotlin environment, implementing the calculator logic, handling user input, and enhancing the calculator with additional features.
date: 2025-02-23
url: building-a-console-calculator-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
featured_image: /images/kotlin-1.png
---
Kotlin is a powerful and concise programming language that has gained popularity for its simplicity, interoperability with Java, and modern syntax. One of the best ways to get started with Kotlin is by creating a simple project, such as a console-based calculator. In this article, we will walk through building a console calculator in Kotlin that performs basic arithmetic operations.

---

## Why Kotlin for Console Applications?

Kotlin is not only used for Android development but also for backend and console-based applications. Here’s why Kotlin is a great choice for console applications:

- **Concise and readable syntax**
- **Interoperability with Java**
- **Strong type inference and null safety**
- **Standard library functions that simplify development**
- **Supports functional and object-oriented programming paradigms**

Now, let's dive into building a simple console calculator in Kotlin.

---

## Setting Up the Kotlin Environment

To run Kotlin programs on your local machine, follow these steps:

1. Install the latest version of [Kotlin](https://kotlinlang.org/) or use an online compiler like [Kotlin Playground](https://play.kotlinlang.org/).
2. If you prefer a local development setup, you can use an IDE like IntelliJ IDEA or VS Code with Kotlin extensions.
3. Create a new Kotlin file (e.g., `Calculator.kt`).

---

## Implementing the Console Calculator

### 1. Basic Structure

Let’s begin by defining the main function and setting up user input handling.

```kotlin
fun main() {
    while (true) {
        println("\nConsole Calculator in Kotlin")
        println("Enter first number: ")
        val num1 = readLine()?.toDoubleOrNull()

        println("Enter an operator (+, -, *, /): ")
        val operator = readLine()

        println("Enter second number: ")
        val num2 = readLine()?.toDoubleOrNull()

        if (num1 != null && num2 != null && operator != null) {
            val result = calculate(num1, num2, operator)
            println("Result: $result")
        } else {
            println("Invalid input. Please enter numbers correctly.")
        }

        println("Do you want to perform another calculation? (yes/no)")
        val response = readLine()?.lowercase()
        if (response != "yes") break
    }
}
```

### 2. Calculation Logic

Now, let’s implement the `calculate` function to handle arithmetic operations.

```kotlin
fun calculate(num1: Double, num2: Double, operator: String): String {
    return when (operator) {
        "+" -> (num1 + num2).toString()
        "-" -> (num1 - num2).toString()
        "*" -> (num1 * num2).toString()
        "/" -> if (num2 != 0.0) (num1 / num2).toString() else "Error: Division by zero"
        else -> "Invalid operator"
    }
}
```

### 3. Handling Invalid Inputs

In the main function, we use `readLine()?.toDoubleOrNull()` to safely convert user input into numbers, preventing crashes if the user enters invalid data. If the input is invalid, the user is prompted to enter it again.

### 4. Running the Program

Compile and run the Kotlin script using:

```
kotlin Calculator.kt
```

The program will prompt users to input numbers and an operator, perform the calculation, and display the result.

---

## Enhancing the Console Calculator

Here are a few enhancements you can make to improve the calculator:

1. **Support for More Operations:** Add modulus (`%`), exponentiation (`^`), or square root (`sqrt`).
2. **Input Validation:** Ensure that users enter valid numbers and operators before proceeding.
3. **Error Handling:** Provide meaningful error messages for invalid inputs.
4. **Looping for Continuous Use:** Instead of restarting the program, allow users to continue calculations until they choose to exit.

Here’s an improved version of the operator selection:

```kotlin
val validOperators = setOf("+", "-", "*", "/", "%", "^")
while (!validOperators.contains(operator)) {
    println("Invalid operator. Please enter one of: +, -, *, /, %, ^")
    operator = readLine()
}
```

---

## Conclusion

Building a console calculator in Kotlin is an excellent way to learn the basics of the language, including input handling, functions, conditional expressions, and loops. With further improvements, you can turn this simple program into a more advanced calculator with additional features like history tracking, error handling, and complex mathematical functions.

Try experimenting with this calculator and expanding its capabilities! Happy coding!
