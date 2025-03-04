---
draft: false
title: Using Hilt for Dependency Injection in Jetpack Compose
linkTitle: Using Hilt for Dependency Injection
translationKey: using-hilt-for-dependency-injection-in-jetpack-compose
description: A blog post explaining how to use Hilt for dependency injection in Jetpack Compose.
url: using-hilt-for-dependency-injection-in-jetpack-compose
weight: 400
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Dependency Injection
  - Hilt
---
## Introduction

In modern Android development, managing dependencies efficiently is crucial for building scalable, maintainable, and testable applications. Dependency Injection (DI) is a design pattern that helps achieve these goals by decoupling the creation of objects from their usage. Jetpack Compose, Android's modern toolkit for building native UIs, has gained significant traction due to its declarative approach and ease of use. However, integrating dependency injection into Compose can be challenging, especially when dealing with complex dependency graphs.

Hilt, a dependency injection library built on top of Dagger, simplifies the process of DI in Android applications. It provides a standardized way to manage dependencies, reducing boilerplate code and making it easier to inject dependencies into Compose components. In this blog post, we'll explore how to use Hilt for dependency injection in Jetpack Compose, covering the setup, basic usage, and best practices.

## What is Dependency Injection?

Before diving into Hilt and Compose, let's briefly recap what dependency injection is. Dependency Injection is a design pattern where an object receives its dependencies from an external source rather than creating them itself. This pattern promotes loose coupling, making the code more modular, testable, and maintainable.

For example, consider a `ViewModel` that requires a `Repository` to fetch data. Instead of creating the `Repository` inside the `ViewModel`, we inject it from outside. This allows us to easily swap out the `Repository` implementation, such as using a mock repository for testing.

## Why Use Hilt for Dependency Injection?

Hilt is a dependency injection library specifically designed for Android. It builds on top of Dagger, one of the most popular DI frameworks for Java and Kotlin, but simplifies its usage by providing annotations and components tailored for Android development.

Here are some reasons why Hilt is a great choice for dependency injection in Android:

1. **Reduced Boilerplate**: Hilt reduces the amount of boilerplate code required for dependency injection compared to Dagger. It provides predefined components and scopes, making it easier to set up and manage dependencies.

2. **Android-Specific Annotations**: Hilt introduces annotations like `@AndroidEntryPoint` and `@HiltViewModel` that are specifically designed for Android components, such as Activities, Fragments, and ViewModels.

3. **Seamless Integration with Jetpack Libraries**: Hilt integrates well with other Jetpack libraries, such as ViewModel, WorkManager, and Navigation, making it easier to inject dependencies into these components.

4. **Improved Testability**: Hilt makes it easier to write tests by allowing you to replace dependencies with test doubles, such as mocks or fakes.

## Setting Up Hilt in Your Project

To use Hilt in your Android project, you need to add the necessary dependencies to your `build.gradle` file. Here's how you can set up Hilt in your project:

1. **Add the Hilt Gradle Plugin**: First, add the Hilt Gradle plugin to your project-level `build.gradle` file:

    ```groovy
    buildscript {
        ext.hilt_version = '2.44'
        dependencies {
            classpath "com.google.dagger:hilt-android-gradle-plugin:$hilt_version"
        }
    }
    ```

2. **Apply the Hilt Plugin**: Next, apply the Hilt plugin in your app-level `build.gradle` file:

    ```groovy
    plugins {
        id 'com.android.application'
        id 'kotlin-android'
        id 'kotlin-kapt'
        id 'dagger.hilt.android.plugin'
    }
    ```

3. **Add Hilt Dependencies**: Finally, add the Hilt dependencies to your app-level `build.gradle` file:

    ```groovy
    dependencies {
        implementation "com.google.dagger:hilt-android:$hilt_version"
        kapt "com.google.dagger:hilt-android-compiler:$hilt_version"
    }
    ```

4. **Enable Java 8 Support**: Hilt requires Java 8 features, so make sure to enable Java 8 support in your `build.gradle` file:

    ```groovy
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = '1.8'
    }
    ```

5. **Initialize Hilt in Your Application**: To initialize Hilt, you need to annotate your `Application` class with `@HiltAndroidApp`:

    ```kotlin
    @HiltAndroidApp
    class MyApplication : Application()
    ```

With these steps, Hilt is now set up in your project, and you're ready to start using it for dependency injection.

## Injecting Dependencies into Jetpack Compose

Jetpack Compose is a declarative UI framework that allows you to build UIs using Kotlin code. To inject dependencies into Compose components, you can use Hilt's `@HiltViewModel` and `@AndroidEntryPoint` annotations.

### Injecting ViewModels with Hilt

One of the most common use cases for dependency injection in Compose is injecting ViewModels. ViewModels are responsible for managing UI-related data and logic, and they often require dependencies such as repositories or use cases.

To inject a ViewModel into a Compose function, follow these steps:

1. **Define the ViewModel**: Create a ViewModel class and annotate it with `@HiltViewModel`. Use the `@Inject` annotation to specify the dependencies required by the ViewModel:

    ```kotlin
    @HiltViewModel
    class MyViewModel @Inject constructor(
        private val repository: MyRepository
    ) : ViewModel() {
        // ViewModel logic goes here
    }
    ```

2. **Inject the ViewModel into Compose**: In your Compose function, use the `viewModel()` function provided by the `androidx.hilt:hilt-navigation-compose` library to obtain an instance of the ViewModel:

    ```kotlin
    @Composable
    fun MyScreen(
        viewModel: MyViewModel = hiltViewModel()
    ) {
        val data by viewModel.data.collectAsState()

        // UI code goes here
    }
    ```

    The `hiltViewModel()` function automatically retrieves the ViewModel instance from the Hilt dependency graph, ensuring that the correct dependencies are injected.

### Injecting Other Dependencies into Compose

In addition to ViewModels, you may need to inject other dependencies directly into Compose functions. For example, you might want to inject a service or a use case that doesn't belong in a ViewModel.

To inject dependencies directly into Compose, you can use the `@HiltAndroidApp` and `@AndroidEntryPoint` annotations. However, since Compose functions are not traditional Android components, you'll need to use a different approach.

1. **Define the Dependency**: Create a class for the dependency and annotate its constructor with `@Inject`:

    ```kotlin
    class MyService @Inject constructor() {
        // Service logic goes here
    }
    ```

2. **Provide the Dependency in a Hilt Module**: If the dependency requires external configuration or cannot be directly instantiated, you can provide it in a Hilt module:

    ```kotlin
    @Module
    @InstallIn(SingletonComponent::class)
    object MyModule {
        @Provides
        fun provideMyService(): MyService {
            return MyService()
        }
    }
    ```

3. **Inject the Dependency into Compose**: To inject the dependency into a Compose function, you can use the `LocalContext` composable to access the Android context and retrieve the dependency from the Hilt component:

    ```kotlin
    @Composable
    fun MyComposable() {
        val myService = remember {
            EntryPointAccessors.fromApplication(
                LocalContext.current.applicationContext,
                MyServiceEntryPoint::class.java
            ).myService()
        }

        // Use the injected service
    }

    @EntryPoint
    @InstallIn(SingletonComponent::class)
    interface MyServiceEntryPoint {
        fun myService(): MyService
    }
    ```

    This approach allows you to inject dependencies directly into Compose functions without relying on ViewModels.

## Best Practices for Using Hilt with Compose

While Hilt simplifies dependency injection in Compose, there are some best practices you should follow to ensure a clean and maintainable codebase:

1. **Prefer ViewModel Injection**: Whenever possible, inject dependencies into ViewModels rather than directly into Compose functions. ViewModels are better suited for managing UI-related data and logic, and they help keep your Compose functions focused on rendering the UI.

2. **Use `hiltViewModel()` for ViewModel Injection**: The `hiltViewModel()` function is the recommended way to inject ViewModels into Compose functions. It automatically handles the creation and retrieval of ViewModel instances, ensuring that the correct dependencies are injected.

3. **Avoid Overusing Direct Dependency Injection**: While it's possible to inject dependencies directly into Compose functions, this should be done sparingly. Overusing direct dependency injection can lead to tightly coupled code and make it harder to test and maintain your Compose components.

4. **Leverage Hilt Modules for Complex Dependencies**: For dependencies that require external configuration or cannot be directly instantiated, use Hilt modules to provide them. This keeps your dependency injection logic centralized and makes it easier to manage complex dependency graphs.

5. **Test Your Compose Components**: Hilt makes it easier to write tests by allowing you to replace dependencies with test doubles. Use Hilt's testing support to write unit and UI tests for your Compose components, ensuring that they behave as expected.

## Conclusion

Using Hilt for dependency injection in Jetpack Compose can significantly improve the maintainability, testability, and scalability of your Android applications. By following the steps and best practices outlined in this blog post, you can seamlessly integrate Hilt into your Compose projects and take full advantage of its benefits.

Whether you're injecting ViewModels or other dependencies, Hilt provides a standardized and efficient way to manage your app's dependencies, allowing you to focus on building great user experiences with Jetpack Compose. As you continue to explore Hilt and Compose, you'll discover even more ways to streamline your development process and create robust, high-quality Android applications.
