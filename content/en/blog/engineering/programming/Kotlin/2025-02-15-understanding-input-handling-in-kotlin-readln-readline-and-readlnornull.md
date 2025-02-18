---
draft: false
title: "Understanding Input Handling in Kotlin: readln(), readLine(), and readlnOrNull()"
linkTitle: Input Handling
translationKey: understanding-input-handling-in-kotlin
description: Learn how to read user input in Kotlin using readln(), readLine(), and readlnOrNull().
slug: understanding-input-handling-in-kotlin-readln-readline-and-readlnornull
date: 2025-02-15
tags:
   - kotlin
   - input handling
categories:
   - programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
featured_image: /images/Kotlin-Full-Color-Logo-on-White-RGB.png
keywords:
   - input handling
---

Input handling is a fundamental aspect of programming, enabling interaction between users and applications. In Kotlin, the standard library provides several functions to read input from the console, including `readLine()`, `readln()`, and `readlnOrNull()`. While these functions serve similar purposes, they differ in behavior, return types, and error-handling strategies. This blog post explores their distinctions, use cases, and best practices for leveraging them effectively.

---

### **1. Introduction to Input Functions in Kotlin**

Kotlin’s approach to input reading emphasizes safety and clarity. Over time, the language has evolved its APIs to align with modern conventions, leading to the introduction of `readln()` and `readlnOrNull()` in Kotlin 1.6.0. These newer functions aim to replace `readLine()`, which has been part of Kotlin since its early days. Understanding their differences is critical for writing robust and user-friendly code.

---

### **2. The Legacy Function: readLine()**

#### **Syntax and Return Type**

```kotlin
fun readLine(): String?
```

`readLine()` is a traditional function that reads a line of input from the standard input (stdin). It returns a nullable `String?`—either the input value or `null` if the end of the input stream is reached.

#### **Behavior**

- **Interactive Input**: In most interactive scenarios (e.g., command-line applications), `readLine()` waits for the user to enter text and press Enter. The returned value is the input string without the trailing newline character.
- **End-of-Input Handling**: If the input source is a file or a redirected stream, `readLine()` returns `null` when the end of the file is reached.
- **Null Safety**: Since the return type is nullable, developers must handle potential `null` values explicitly.

#### **Example Usage**

```kotlin
val input: String? = readLine()
if (input != null) {
    println("You entered: $input")
} else {
    println("No input detected.")
}
```

#### **Drawbacks**

- The name `readLine` uses camelCase inconsistently (e.g., `println` uses lowercase `ln`).
- Nullable returns force developers to use safe calls (`?.`) or null checks, which can be verbose for non-null scenarios.

---

### **3. The Modern Non-Null Alternative: readln()**

#### **Syntax and Return Type**

```kotlin
fun readln(): String
```

Introduced in Kotlin 1.6.0, `readln()` reads a line from stdin and returns a **non-null** `String`. It throws an `IllegalStateException` if the input is `null` (i.e., the end of the stream is reached).

#### **Behavior**

- **Non-Null Guarantee**: Ideal for scenarios where input is expected (e.g., user prompts). It simplifies code by eliminating null checks.
- **Exception Handling**: If no input is available (e.g., in a script with redirected input), it crashes with an exception. This makes it riskier for non-interactive environments.

#### **Example Usage**

```kotlin
val input: String = readln() // Throws an exception if input is null
println("You entered: $input")
```

#### **Use Cases**

- Interactive applications where user input is mandatory.
- Situations where terminating on invalid input is acceptable.

---

### **4. The Safe Nullable Alternative: readlnOrNull()**

#### **Syntax and Return Type**

```kotlin
fun readlnOrNull(): String?
```

Also introduced in Kotlin 1.6.0, `readlnOrNull()` combines the null safety of `readLine()` with a clearer name. It returns `String?` and is designed to replace `readLine()` in new code.

#### **Behavior**

- **Null on End-of-Input**: Returns `null` if the input stream ends, similar to `readLine()`.
- **Alignment with Conventions**: The `OrNull` suffix explicitly signals the possibility of a nullable return.

#### **Example Usage**

```kotlin
val input: String? = readlnOrNull()
println("You entered: ${input ?: "nothing"}")
```

#### **Advantages Over readLine()**

- The name `readlnOrNull()` follows Kotlin’s naming conventions (e.g., `getOrNull()`).
- Encourages intentional handling of nullable cases.

---

### **5. Key Differences at a Glance**

| Function          | Return Type | Null Handling                         | Introduced In | Exception Risk |
|-------------------|-------------|----------------------------------------|---------------|----------------|
| `readLine()`      | `String?`   | Returns `null` on end-of-input         | Kotlin 1.0    | Low            |
| `readln()`        | `String`    | Throws `IllegalStateException`         | Kotlin 1.6    | High           |
| `readlnOrNull()`  | `String?`   | Returns `null` on end-of-input         | Kotlin 1.6    | Low            |

---

### **6. When to Use Each Function**

#### **Use `readln()` When:**

- You’re writing an interactive application (e.g., CLI tools).
- Input is guaranteed (e.g., a required user response).
- You want concise code without null checks.

#### **Use `readlnOrNull()` When:**

- Reading from a file or redirected input (where `null` signals the end).
- Graceful handling of missing input is required.
- Migrating from `readLine()` to modern APIs.

#### **Avoid `readLine()` in New Code:**

- While functional, `readlnOrNull()` is preferred for clarity and consistency.

---

### **7. Best Practices and Pitfalls**

1. **Prefer `readln()` for Interactive Prompts**  
   If your program requires input, use `readln()` to enforce validity. Wrap it in a `try/catch` block if you anticipate external input sources (e.g., scripts).

2. **Handle Nulls Gracefully with `readlnOrNull()`**  
   Use the Elvis operator (`?:`) to provide defaults:

   ```kotlin
   val input = readlnOrNull() ?: "default_value"
   ```

3. **Avoid `readLine()` in New Projects**  
   While not deprecated, `readLine()` may become obsolete. Future-proof your code with `readln()` or `readlnOrNull()`.

4. **Test Edge Cases**  
   Always test scenarios where input is terminated (e.g., empty files) to avoid crashes.

---

### **8. Migration Example**

**Legacy Code with `readLine()`:**

```kotlin
val input = readLine()
if (input != null) {
    process(input)
}
```

**Modernized with `readlnOrNull()`:**

```kotlin
val input = readlnOrNull() ?: return
process(input)
```

---

### **9. Conclusion**

Kotlin’s input functions reflect its commitment to null safety and API clarity. While `readLine()` remains functional, `readln()` and `readlnOrNull()` offer modern alternatives that align with Kotlin’s conventions. By understanding their differences—return types, error handling, and use cases—developers can write safer, more intuitive code. Whether you prioritize convenience (`readln()`) or safety (`readlnOrNull()`), Kotlin provides the tools to handle input effectively.
