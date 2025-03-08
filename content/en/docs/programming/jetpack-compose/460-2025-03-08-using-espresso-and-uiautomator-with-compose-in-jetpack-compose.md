---
draft: false
title: Using Espresso and UIAutomator with Compose in Jetpack Compose
linkTitle: Using Espresso and UIAutomator
translationKey: using-espresso-and-uiautomator-with-compose-in-jetpack-compose
description: This article explains how to use Espresso and UIAutomator to test Jetpack Compose applications.
url: using-espresso-and-uiautomator-with-compose-in-jetpack-compose
weight: 460
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Espresso
  - UIAutomator
---

## Introduction

Jetpack Compose has revolutionized Android UI development by offering a declarative and reactive approach to building user interfaces. However, testing in Compose requires specialized tools and techniques to ensure reliability, particularly when it comes to UI testing. Google provides two primary frameworks for UI testing in Android: **Espresso** and **UIAutomator**. These tools enable developers to test UI elements and interactions efficiently, ensuring application stability and usability.

In this blog post, we will explore how to integrate **Espresso and UIAutomator** to test **Jetpack Compose** applications, covering setup, implementation, best practices, and common pitfalls.

---

## Understanding Espresso and UIAutomator

### What is Espresso?

Espresso is a widely used UI testing framework for Android that allows developers to write concise, readable, and reliable UI tests. It is part of the **AndroidX Test** library and works efficiently by running on the main thread while synchronizing with UI actions and animations. Espresso is best suited for **functional testing** of individual components and user interactions.

#### Key Features of Espresso

- Simple and fluent API for UI interaction.
- Automatically waits for UI elements to be ready.
- Supports assertions to verify UI states.
- Can be used with Compose via **ComposeTestRule**.

### What is UIAutomator?

UIAutomator is a framework that allows UI testing **outside the app's context**, making it ideal for **system-level interactions** such as testing notifications, opening settings, or handling multiple apps. It does not require access to the app's internal structure, making it useful for testing across different processes.

#### Key Features of UIAutomator

- Can interact with elements outside the application.
- Supports cross-app UI testing.
- Works with system UI elements (e.g., notifications, home screen, and settings).
- Complements Espresso for broader UI coverage.

---

## Setting Up Espresso and UIAutomator with Jetpack Compose

To begin UI testing with Espresso and UIAutomator in a Jetpack Compose project, follow these steps:

### 1. Add Dependencies

In your **build.gradle (Module: app)** file, add the required dependencies for testing:

```kotlin
androidTestImplementation("androidx.compose.ui:ui-test-junit4:<latest-version>")
androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
androidTestImplementation("androidx.test.uiautomator:uiautomator:2.2.0")
androidTestImplementation("androidx.test.ext:junit:1.1.5")
```

### 2. Create a Test Rule

In Jetpack Compose, you need to use **ComposeTestRule** to test Composable UI elements. Add the test rule to your test class:

```kotlin
@get:Rule
val composeTestRule = createComposeRule()
```

This rule sets up the environment for testing Compose UI components.

---

## Writing Tests with Espresso and UIAutomator

### 1. Using Espresso for Jetpack Compose

Espresso allows interaction with UI elements inside the application. Here’s how to test a simple Compose UI:

#### Example UI Component

```kotlin
@Composable
fun GreetingScreen() {
    var text by remember { mutableStateOf("") }
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        TextField(
            value = text,
            onValueChange = { text = it },
            label = { Text("Enter your name") }
        )
        Button(onClick = { text = "Hello, $text!" }) {
            Text("Greet")
        }
        Text(text, modifier = Modifier.padding(top = 16.dp))
    }
}
```

#### Espresso Test for Compose UI

```kotlin
@Test
fun testGreetingScreen() {
    composeTestRule.setContent {
        GreetingScreen()
    }

    composeTestRule.onNodeWithText("Enter your name").performTextInput("Alice")
    composeTestRule.onNodeWithText("Greet").performClick()
    composeTestRule.onNodeWithText("Hello, Alice!").assertIsDisplayed()
}
```

### 2. Using UIAutomator for System-Level Testing

If you need to test interactions outside the app, such as opening a notification, UIAutomator is the right choice.

#### Example: Open the Home Screen

```kotlin
@Test
fun testOpenHomeScreen() {
    val uiDevice = UiDevice.getInstance(InstrumentationRegistry.getInstrumentation())
    uiDevice.pressHome()
    
    val launcherPackage = uiDevice.launcherPackageName
    assertThat(uiDevice.currentPackageName, `is`(launcherPackage))
}
```

### 3. Combining Espresso and UIAutomator

You can use Espresso for in-app interactions and UIAutomator for actions outside the app.

#### Example: Interact with a Notification

```kotlin
@Test
fun testNotificationInteraction() {
    val uiDevice = UiDevice.getInstance(InstrumentationRegistry.getInstrumentation())
    
    // Pull down the notification shade
    uiDevice.openNotification()
    
    // Find and click on the notification text
    val notification = uiDevice.findObject(UiSelector().text("New Message"))
    notification.click()
    
    // Verify that the app is opened
    composeTestRule.onNodeWithText("Message Screen").assertIsDisplayed()
}
```

---

## Best Practices for UI Testing in Jetpack Compose

1. **Use `composeTestRule.waitForIdle()`**: This ensures UI updates before performing actions.
2. **Mock external dependencies**: Avoid network calls by using fake repositories.
3. **Use `onNodeWithTag` for better identification**: Tags help uniquely identify UI elements.
4. **Combine Espresso and UIAutomator wisely**: Espresso for in-app UI, UIAutomator for system-level interactions.
5. **Run tests on emulators with animations disabled**: This improves test stability.

---

## Common Issues and Troubleshooting

### 1. **Test Fails Due to UI Synchronization Issues**

- Use `composeTestRule.waitForIdle()` to wait for UI updates.
- Ensure the UI state is fully updated before performing actions.

### 2. **Elements Not Found in UIAutomator**

- Use `UiSelector().textContains()` instead of `text()` for partial matches.
- Ensure the app is in the correct state before testing system interactions.

### 3. **Espresso Actions Not Performed**

- Check if the UI element is visible and not obstructed.
- Ensure `composeTestRule.setContent {}` is called before interacting with UI.

---

## Conclusion

Espresso and UIAutomator are powerful tools for testing Jetpack Compose applications. While **Espresso** is best for in-app interactions, **UIAutomator** extends testing capabilities to system-level interactions. By combining both, developers can achieve **comprehensive UI testing**, ensuring robust and reliable Android applications.

By following best practices and troubleshooting common issues, you can build a **highly testable and maintainable** Compose-based application. Happy coding and testing!
