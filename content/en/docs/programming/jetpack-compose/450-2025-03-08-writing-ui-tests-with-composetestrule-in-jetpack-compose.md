---
draft: false
title: Writing UI Tests with ComposeTestRule in Jetpack Compose
linkTitle: Writing UI Tests with ComposeTestRule
translationKey: writing-ui-tests-with-composetestrule-in-jetpack-compose
description: Learn how to write UI tests for Jetpack Compose applications using ComposeTestRule.
url: writing-ui-tests-with-composetestrule-in-jetpack-compose
weight: 450
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - ComposeTestRule
---
Jetpack Compose has revolutionized Android UI development by introducing a declarative approach to building interfaces. However, with this new paradigm comes the challenge of ensuring UI reliability and stability. This is where UI testing comes in. One of the most powerful tools for UI testing in Jetpack Compose is `ComposeTestRule`. In this blog post, we will dive into the importance of UI testing, how `ComposeTestRule` works, and how to effectively write UI tests for Jetpack Compose applications.

## Why UI Testing Matters in Jetpack Compose

UI testing plays a crucial role in application development, ensuring that user interactions work as expected and that UI components render correctly across different screen sizes and configurations. Specifically, UI testing helps to:

- Verify that UI elements appear as expected.
- Ensure interactions, such as button clicks and text inputs, function properly.
- Catch regressions when new features are added.
- Improve app stability by validating UI behaviors under various conditions.

With Jetpack Compose’s declarative nature, UI testing also benefits from better composability, making it easier to test individual components in isolation.

## Understanding ComposeTestRule

Jetpack Compose provides a testing framework to facilitate UI testing, and at the core of this framework is `ComposeTestRule`. The `ComposeTestRule` interface allows us to:

- Launch a composable for testing.
- Interact with and assert properties on UI elements.
- Synchronize test execution with Compose’s recomposition mechanism.

There are two main types of test rules available:

1. **`createComposeRule()`** – Used for testing UI elements without launching an activity.
2. **`createAndroidComposeRule<T>()`** – Used for testing composables within an activity, where `T` is the activity being tested.

Let's explore both in detail.

## Setting Up Compose UI Tests

Before writing UI tests, ensure your project has the necessary dependencies. Add the following dependencies to your `build.gradle` (Module) file:

```kotlin
androidTestImplementation "androidx.compose.ui:ui-test-junit4:<latest_version>"
debugImplementation "androidx.compose.ui:ui-test-manifest:<latest_version>"
```

The `ui-test-junit4` library provides testing APIs, while the `ui-test-manifest` helps with debugging UI tests.

### Writing a Basic UI Test with createComposeRule

Suppose we have a simple UI component:

```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hello, $name!")
}
```

To test this component, we use `createComposeRule()` to launch it in isolation:

```kotlin
@get:Rule
val composeTestRule = createComposeRule()

@Test
fun testGreetingDisplaysCorrectText() {
    composeTestRule.setContent {
        Greeting(name = "John")
    }

    composeTestRule.onNodeWithText("Hello, John!").assertExists()
}
```

### Writing an Activity-based UI Test with createAndroidComposeRule

When testing composables within an activity, use `createAndroidComposeRule`:

```kotlin
@get:Rule
val composeTestRule = createAndroidComposeRule<MainActivity>()

@Test
fun testButtonClickChangesText() {
    composeTestRule.onNodeWithText("Click Me").performClick()
    composeTestRule.onNodeWithText("Clicked!").assertExists()
}
```

## Common UI Testing Interactions

Jetpack Compose provides powerful matchers and actions for UI testing. Here are some common ones:

### Finding Nodes

- `onNodeWithText(text: String)`: Finds a node by its text.
- `onNodeWithTag(tag: String)`: Finds a node by its test tag.
- `onAllNodesWithText(text: String)`: Finds multiple nodes with the same text.

### Performing Actions

- `performClick()`: Simulates a click on the node.
- `performTextInput(text: String)`: Inputs text into a text field.
- `performScrollTo()`: Scrolls to a specific element.

### Assertions

- `assertExists()`: Checks if a node exists.
- `assertIsDisplayed()`: Ensures the element is visible.
- `assertTextEquals(value: String)`: Verifies the text of a node.

Example:

```kotlin
@Test
fun testTextFieldInput() {
    composeTestRule.setContent {
        var text by remember { mutableStateOf("") }
        Column {
            TextField(value = text, onValueChange = { text = it })
            Text(text = text)
        }
    }

    composeTestRule.onNodeWithTag("textField").performTextInput("ComposeTest")
    composeTestRule.onNodeWithText("ComposeTest").assertExists()
}
```

## Debugging UI Tests

UI tests in Jetpack Compose can sometimes fail due to timing issues or missing elements. Here are some debugging tips:

1. **Use `.printToLog(tag: String)`** – Prints the semantic tree for debugging.

   ```kotlin
   composeTestRule.onRoot().printToLog("TestLog")
   ```

2. **Enable manifest debugging** – Ensure `ui-test-manifest` is included to correctly identify issues with UI tests.

3. **Use `awaitIdle()` for synchronization** – Helps resolve timing issues where the UI hasn’t fully rendered.

4. **Run tests on an emulator with animations disabled** – Animations can interfere with UI test stability. Disable them in Developer Options.

## Conclusion

UI testing with `ComposeTestRule` in Jetpack Compose simplifies verifying UI behavior, ensuring robustness and stability. By leveraging tools like `onNodeWithText`, `performClick`, and assertions, you can create comprehensive UI tests that catch bugs early in the development cycle.

By adopting a solid UI testing strategy, you can build more reliable and user-friendly Compose applications.
