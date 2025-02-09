---
draft: false
title: Default Arguments in Kotlin Functions
linkTitle: Default Arguments
translationKey: default-arguments-in-kotlin-functions
weight: 170
description: A complete guide to default arguments in Kotlin functions, including their benefits, usage patterns, and best practices.
date: 2025-02-09
url: default-arguments-in-kotlin-functions
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Default Arguments
  - Function Parameters
featured_image: /images/kotlin-1.png
---
Default arguments are a powerful feature in Kotlin that helps reduce boilerplate code and provides more flexible function calls. In this comprehensive guide, we'll explore how default arguments work, their benefits, and best practices for using them effectively in your Kotlin code.

## Understanding Default Arguments

Default arguments allow you to specify default values for function parameters, making these parameters optional when calling the function. This feature eliminates the need for multiple overloaded functions and provides more flexibility in function calls.

### Basic Syntax

Here's how to declare functions with default arguments:

```kotlin
fun greet(name: String = "Guest", greeting: String = "Hello") {
    println("$greeting, $name!")
}
```

This function can be called in multiple ways:

```kotlin
greet()                     // Prints: "Hello, Guest!"
greet("Alice")             // Prints: "Hello, Alice!"
greet("Bob", "Hi")         // Prints: "Hi, Bob!"
greet(greeting = "Hey")    // Prints: "Hey, Guest!"
```

## Benefits of Default Arguments

### Reduced Function Overloading

Without default arguments, you would need multiple function overloads to achieve the same functionality:

```kotlin
// Without default arguments - needs multiple overloads
fun createUser(username: String, email: String, isActive: Boolean) {
    // Implementation
}
fun createUser(username: String, email: String) {
    createUser(username, email, true)
}
fun createUser(username: String) {
    createUser(username, "$username@default.com")
}

// With default arguments - single function
fun createUser(
    username: String,
    email: String = "$username@default.com",
    isActive: Boolean = true
) {
    // Implementation
}
```

### Improved Code Readability

Default arguments make the code more expressive and self-documenting:

```kotlin
fun configureServer(
    port: Int = 8080,
    host: String = "localhost",
    enableSsl: Boolean = false,
    maxConnections: Int = 100
) {
    // Server configuration implementation
}
```

## Advanced Usage Patterns

### Combining with Named Arguments

Default arguments work seamlessly with named arguments, providing even more flexibility:

```kotlin
fun sendEmail(
    to: String,
    subject: String = "No Subject",
    body: String = "",
    isHtml: Boolean = false,
    priority: Int = 3
) {
    // Email sending implementation
}

// Usage with named arguments
sendEmail(
    to = "user@example.com",
    priority = 1,
    body = "Important message"
    // subject and isHtml use default values
)
```

### Using Expressions as Default Values

Default arguments can be expressions or function calls:

```kotlin
fun getCurrentTimestamp() = System.currentTimeMillis()

fun createAuditLog(
    action: String,
    userId: String,
    timestamp: Long = getCurrentTimestamp(),
    details: Map<String, Any> = emptyMap()
) {
    // Audit log implementation
}
```

### Default Arguments in Class Constructors

Default arguments are commonly used in class constructors:

```kotlin
class Configuration(
    val host: String = "localhost",
    val port: Int = 8080,
    val timeout: Long = 5000,
    val retryCount: Int = 3
) {
    // Class implementation
}

// Usage
val defaultConfig = Configuration()
val customConfig = Configuration(host = "example.com", timeout = 10000)
```

## Best Practices and Guidelines

### Parameter Ordering

Place parameters without default values first, followed by parameters with default values:

```kotlin
// Good
fun processOrder(orderId: String, items: List<String>, discount: Double = 0.0)

// Not ideal
fun processOrder(discount: Double = 0.0, orderId: String, items: List<String>)
```

### Default Value Selection

Choose meaningful default values that are appropriate for most use cases:

```kotlin
fun connectToDatabase(
    url: String,
    username: String,
    password: String,
    maxPoolSize: Int = 10,        // Reasonable default
    connectionTimeout: Long = 5000 // Standard timeout in milliseconds
) {
    // Implementation
}
```

### Documentation

Document default values when they're not immediately obvious:

```kotlin
/**
 * Configures the cache system.
 * @param maxSize Maximum number of items in cache (default: 1000)
 * @param expiration Time in seconds before items expire (default: 3600 - 1 hour)
 * @param cleanupInterval Interval in seconds between cleanup runs (default: 300 - 5 minutes)
 */
fun configureCache(
    maxSize: Int = 1000,
    expiration: Long = 3600,
    cleanupInterval: Long = 300
) {
    // Implementation
}
```

## Common Patterns and Use Cases

### Builder Pattern Alternative

Default arguments can sometimes replace the builder pattern:

```kotlin
// Instead of a builder
class UserBuilder {
    private var name: String = ""
    private var age: Int = 0
    private var email: String? = null
    
    fun setName(name: String) = apply { this.name = name }
    fun setAge(age: Int) = apply { this.age = age }
    fun setEmail(email: String?) = apply { this.email = email }
    
    fun build() = User(name, age, email)
}

// Using default arguments
data class User(
    val name: String,
    val age: Int = 0,
    val email: String? = null
)
```

### Factory Methods

Default arguments are useful in factory methods:

```kotlin
class DatabaseConnection private constructor(
    private val config: ConnectionConfig
) {
    companion object {
        fun create(
            host: String = "localhost",
            port: Int = 5432,
            database: String,
            username: String = "root",
            password: String = ""
        ) = DatabaseConnection(
            ConnectionConfig(
                host = host,
                port = port,
                database = database,
                username = username,
                password = password
            )
        )
    }
}
```

### Testing Support

Default arguments can help create test-friendly APIs:

```kotlin
class UserService(
    private val userRepository: UserRepository = DefaultUserRepository(),
    private val emailService: EmailService = DefaultEmailService(),
    private val logger: Logger = DefaultLogger()
) {
    // Implementation
}

// In tests
val testUserRepo = MockUserRepository()
val serviceUnderTest = UserService(userRepository = testUserRepo)
```

## Conclusion

Default arguments in Kotlin are a powerful feature that can significantly improve code quality and developer experience. They help reduce boilerplate code, make APIs more flexible, and improve code readability when used properly.

Key takeaways for working with default arguments:

- Use them to eliminate the need for multiple function overloads
- Combine them with named arguments for maximum flexibility
- Place required parameters before optional ones
- Choose meaningful default values
- Document non-obvious default values
- Consider them as alternatives to the builder pattern
- Use them to create test-friendly APIs

By following these guidelines and understanding the various patterns and use cases, you can effectively use default arguments to write more maintainable and flexible Kotlin code. Remember that while default arguments are powerful, they should be used judiciously to maintain code clarity and prevent confusion.
