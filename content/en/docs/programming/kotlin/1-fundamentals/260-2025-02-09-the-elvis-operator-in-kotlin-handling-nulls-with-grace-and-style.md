---
draft: false
title: The Elvis Operator in Kotlin
linkTitle: The Elvis Operator
translationKey: the-elvis-operator-in-kotlin
weight: 260
description: This blog post explores the Elvis operator in Kotlin, a concise way to handle nulls with grace and style
date: 2025-02-09
url: the-elvis-operator-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Null Safety
  - Elvis Operator
featured_image: /images/kotlin-1.png
---
## The Elvis Operator in Kotlin: Handling Nulls with Grace and Style

Kotlin's null safety system is a powerful feature that helps developers avoid the dreaded `NullPointerException`.  It encourages explicit handling of null values, leading to more robust and reliable code. While safe calls (`?.`) allow you to access properties and methods of nullable objects without crashing, the Elvis operator (`?:`) provides a concise and elegant way to provide default values or execute alternative logic when encountering nulls. This blog post explores the Elvis operator in detail, demonstrating its usage, benefits, and best practices.

### Understanding Nullability in Kotlin

Before diving into the Elvis operator, it's essential to grasp Kotlin's approach to nullability. Kotlin distinguishes between two types:

* **Nullable types:** These types are explicitly declared to allow null values.  They are denoted by appending a question mark (`?`) to the type. For example, `String?` can hold either a string or `null`.
* **Non-nullable types:** These types are guaranteed to never hold null values. They are the default in Kotlin. For example, `String` can only hold valid strings.

This distinction empowers the compiler to perform static analysis and catch potential null pointer exceptions at compile time, improving code safety.

### Introducing the Elvis Operator (?:)

The Elvis operator (`?:`) provides a concise way to handle null values. It's named after the characteristic hairstyle of Elvis Presley, resembling a question mark and a colon.  The operator takes two operands: the left-hand side (LHS) and the right-hand side (RHS).

The expression `lhs ?: rhs` works as follows:

1. If `lhs` is not null, the result of the expression is `lhs`.
2. If `lhs` is null, the result of the expression is `rhs`.

In essence, the Elvis operator returns the left-hand side if it's not null, and if it is null, it "returns" the right-hand side. This allows you to provide a default value or execute alternative logic when a value is null.

### Basic Usage and Examples

Here are some simple examples demonstrating the Elvis operator:

```kotlin
val name: String? = null
val displayName: String = name ?: "Guest"

println(displayName) // Output: Guest

val age: Int? = 25
val userAge: Int = age ?: 0

println(userAge) // Output: 25

val message: String? = "Hello!"
val greeting: String = message ?: "No message"

println(greeting) // Output: Hello!
```

In the first example, `name` is null, so the Elvis operator returns "Guest", which is then assigned to `displayName`. In the second example, `age` is 25 (not null), so the Elvis operator returns 25, assigning it to `userAge`. The third example demonstrates that if the LHS is not null, the RHS is not evaluated.

### Combining with Safe Calls

The Elvis operator often works in conjunction with safe calls (`?.`).  Safe calls allow you to access members of nullable objects without fear of exceptions.  The Elvis operator then provides a way to handle the case where the safe call results in null.

```kotlin
data class Address(val street: String?)
data class Person(val name: String?, val address: Address?)

val person: Person? = Person("Alice", null)

val streetName: String = person?.address?.street ?: "Unknown Street"

println(streetName) // Output: Unknown Street
```

Here, if `person` or `person.address` or `person.address.street` is null, the Elvis operator provides the default value "Unknown Street".

### Using the Elvis Operator for Side Effects

The Elvis operator is not limited to providing default values.  You can also use it to execute side effects, such as logging or throwing exceptions, when a value is null.

```kotlin
val data: String? = null

val result: String = data ?: run {
    println("Data is null. Logging and returning default value.")
    "Default Data"
}

println(result) // Output: Default Data
```

In this example, if `data` is null, the `run` block is executed. The `run` block logs a message and then returns "Default Data".

### Chaining Elvis Operators

You can chain Elvis operators to provide a sequence of fallback values.

```kotlin
val value1: String? = null
val value2: String? = null
val value3: String? = "Final Value"

val result: String = value1 ?: value2 ?: value3 ?: "No Value Found"

println(result) // Output: Final Value
```

This code tries `value1`, then `value2`, then `value3`. If all are null, it finally returns "No Value Found".

### Elvis Operator vs. `if` Statements

While you can achieve similar results with `if` statements, the Elvis operator provides a more concise and readable alternative, especially for simple null checks and default value assignments.

```kotlin
// Using if statement
val displayName: String = if (name != null) {
    name
} else {
    "Guest"
}

// Using Elvis operator
val displayName: String = name ?: "Guest"
```

The Elvis operator is much more expressive in this scenario.

### Best Practices for Using the Elvis Operator

* **Use it for simple null checks and default values:** The Elvis operator shines when providing default values or handling simple null scenarios.
* **Combine with safe calls for elegant null handling:** Use safe calls to access nullable members and the Elvis operator to handle potential null results.
* **Use `run` or `let` for more complex logic:** If you need to perform more than just providing a default value, use the `run` or `let` block within the Elvis operator.
* **Avoid excessive chaining:** While chaining is possible, too much chaining can make your code harder to read. Consider alternative approaches for complex logic.
* **Consider readability:**  Always prioritize code readability. If an `if` statement makes the code clearer, use it instead of the Elvis operator.

### Conclusion

The Elvis operator is a valuable tool in Kotlin's null safety arsenal. It provides a concise and expressive way to handle null values, making your code more robust and readable. By understanding its usage and following best practices, you can leverage the Elvis operator to write safer and more elegant Kotlin code.  It allows you to gracefully handle nulls, providing default values or executing alternative logic, leading to more predictable and less error-prone applications.  Mastering the Elvis operator is a key step towards writing idiomatic and safe Kotlin code.
