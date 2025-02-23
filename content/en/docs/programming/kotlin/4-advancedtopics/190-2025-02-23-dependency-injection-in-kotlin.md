---
draft: false
title: Dependency Injection in Kotlin
linkTitle: Dependency Injection in Kotlin
translationKey: dependency-injection-in-kotlin
weight: 190
description: A comprehensive guide to Dependency Injection in Kotlin, covering concepts, benefits, and different DI frameworks like Dagger, Koin, and Hilt.
date: 2025-02-23
url: dependency-injection-in-kotlin
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
## Introduction

Dependency Injection (DI) is a crucial design pattern in modern software development, promoting modularity, testability, and maintainability. In the context of Kotlin, DI enables developers to write clean and scalable code by decoupling dependencies. This article explores Dependency Injection in Kotlin, explaining its concepts, benefits, and different approaches, including manual DI, Dagger, Koin, and Hilt.

## Understanding Dependency Injection

Dependency Injection is a technique where one object (or class) supplies the dependencies of another object. Instead of creating dependencies inside a class, they are passed from an external source, leading to loosely coupled code that is easier to maintain and test.

### Benefits of Dependency Injection

1. **Decoupling** – Reduces direct dependency between classes, making the code more modular.
2. **Easier Testing** – Enables mocking dependencies in unit tests, improving testability.
3. **Improved Maintainability** – Encourages the use of interfaces and separation of concerns.
4. **Scalability** – Facilitates growth by making it easier to add new features without modifying existing code.

## Approaches to Dependency Injection in Kotlin

Kotlin provides multiple ways to implement Dependency Injection:

### 1. Manual Dependency Injection

This is the simplest approach, where dependencies are passed manually through constructors or setters.

#### Example

```kotlin
class Engine {
    fun start() = "Engine started"
}

class Car(private val engine: Engine) {
    fun drive() = engine.start()
}

fun main() {
    val engine = Engine()
    val car = Car(engine)
    println(car.drive())
}
```

Here, the `Car` class depends on `Engine`, and the dependency is provided manually.

### 2. Using Dagger for Dependency Injection

[Dagger](https://dagger.dev/) is a widely used DI framework for Kotlin and Java, generating boilerplate code at compile-time.

#### Setting Up Dagger

Add dependencies in `build.gradle.kts`:

```kotlin
dependencies {
    implementation("com.google.dagger:dagger:2.x")
    kapt("com.google.dagger:dagger-compiler:2.x")
}
```

#### Example

```kotlin
import dagger.Component
import javax.inject.Inject

class Engine @Inject constructor() {
    fun start() = "Engine started"
}

class Car @Inject constructor(private val engine: Engine) {
    fun drive() = engine.start()
}

@Component
interface CarComponent {
    fun getCar(): Car
}

fun main() {
    val car = DaggerCarComponent.create().getCar()
    println(car.drive())
}
```

Dagger automatically generates the dependency graph, making it easier to manage dependencies.

### 3. Using Koin for Dependency Injection

[Koin](https://insert-koin.io/) is a lightweight Kotlin-first DI framework that is easy to set up and use.

#### Setting Up Koin

Add dependencies in `build.gradle.kts`:

```kotlin
dependencies {
    implementation("io.insert-koin:koin-core:3.x")
    implementation("io.insert-koin:koin-android:3.x")
}
```

#### Example

```kotlin
import org.koin.core.context.startKoin
import org.koin.dsl.module
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class Engine {
    fun start() = "Engine started"
}

class Car(private val engine: Engine) {
    fun drive() = engine.start()
}

val carModule = module {
    single { Engine() }
    single { Car(get()) }
}

class MyApp : KoinComponent {
    private val car: Car by inject()
    fun start() = println(car.drive())
}

fun main() {
    startKoin { modules(carModule) }
    MyApp().start()
}
```

Koin provides a simple and intuitive DSL for defining modules and injecting dependencies.

### 4. Using Hilt for Dependency Injection

[Hilt](https://developer.android.com/training/dependency-injection/hilt-android) is a DI framework built on top of Dagger, optimized for Android.

#### Setting Up Hilt

Add dependencies in `build.gradle.kts`:

```kotlin
dependencies {
    implementation("com.google.dagger:hilt-android:2.x")
    kapt("com.google.dagger:hilt-compiler:2.x")
}
```

#### Example

```kotlin
import android.app.Application
import dagger.hilt.android.HiltAndroidApp
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

@HiltAndroidApp
class MyApplication : Application()

class Engine @Inject constructor() {
    fun start() = "Engine started"
}

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {
    @Inject lateinit var car: Car

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        println(car.drive())
    }
}
```

Hilt simplifies DI in Android projects by providing built-in lifecycle awareness and automatic dependency management.

## Choosing the Right DI Framework

- **Manual DI**: Best for small projects with minimal dependencies.
- **Dagger**: Ideal for large-scale projects requiring high performance and compile-time safety.
- **Koin**: Suitable for Kotlin-based projects requiring simplicity and runtime configuration.
- **Hilt**: Recommended for Android applications due to its seamless integration with the Android ecosystem.

## Conclusion

Dependency Injection is an essential pattern for writing scalable and maintainable applications in Kotlin. Whether using manual DI, Dagger, Koin, or Hilt, choosing the right approach depends on project size, complexity, and specific requirements. By leveraging Dependency Injection, developers can enhance code quality, simplify testing, and improve application architecture.

---

Would you like additional examples or a comparison table summarizing the differences between these DI frameworks?
