---
draft: false
title: Writing Your First Android Studio Jetpack Composable Function
linkTitle: Writing Your First Android Studio Jetpack Composable Function
translationKey: writing-your-first-android-studio-jetpack-composable-function
description: Learn how to write your first Jetpack Composable function in Android Studio, the building block of modern UI development on Android.
url: writing-your-first-android-studio-jetpack-composable-function
weight: 80
date: 2025-02-26
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
---
In the evolving landscape of Android development, Jetpack Compose has emerged as a game-changer. This modern UI toolkit from Google simplifies and accelerates UI development on Android with less code, powerful tools, and intuitive Kotlin APIs. At the heart of Jetpack Compose lies the concept of composable functions—the building blocks that transform how we approach UI development. In this comprehensive guide, we'll walk through everything you need to know to write your first Jetpack Composable function.

## Understanding Jetpack Compose: A Paradigm Shift

Before diving into code, it's important to understand what makes Jetpack Compose different from the traditional View-based UI system. Jetpack Compose introduces a declarative approach to UI building, where your UI components are described as functions that transform data into UI elements. This paradigm eliminates much of the complexity associated with view hierarchies, fragments, and XML layouts.

In Compose, UI elements are immutable and stateless by default. Instead of mutating views, you express the UI based on the current state, and Compose handles updating the UI when the state changes. This leads to more predictable, easier-to-test code with fewer bugs.

## Setting Up Your Environment

To get started with Jetpack Compose, you'll need:

1. **Android Studio Arctic Fox (2020.3.1) or newer**
2. **Kotlin 1.5.31 or newer**
3. **A project configured for Jetpack Compose**

Let's begin by configuring your project. Create a new Android project in Android Studio and select the "Empty Compose Activity" template, or add Compose to an existing project by modifying your `build.gradle` files:

```kotlin
// Project-level build.gradle
buildscript {
    ext {
        compose_version = '1.4.0'
    }
}

// App-level build.gradle
android {
    defaultConfig {
        // ...
    }
    
    buildFeatures {
        compose true
    }
    
    composeOptions {
        kotlinCompilerExtensionVersion compose_version
    }
}

dependencies {
    implementation "androidx.compose.ui:ui:$compose_version"
    implementation "androidx.compose.material:material:$compose_version"
    implementation "androidx.compose.ui:ui-tooling-preview:$compose_version"
    debugImplementation "androidx.compose.ui:ui-tooling:$compose_version"
}
```

## Anatomy of a Composable Function

A composable function is simply a Kotlin function annotated with the `@Composable` annotation. Here's the structure:

```kotlin
@Composable
fun MyFirstComposable() {
    // UI code goes here
}
```

The `@Composable` annotation tells the Compose compiler that this function is designed to convert data into UI. Composable functions can only be called from other composable functions or from specific entry points in the Android framework.

Let's create our first simple composable function—a greeting text:

```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hello, $name!")
}
```

In this example, `Text` is itself a composable function provided by the Compose library. You can call your `Greeting` function from the `setContent` block in your activity:

```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyAppTheme {
                Surface(color = MaterialTheme.colors.background) {
                    Greeting("Android Developer")
                }
            }
        }
    }
}
```

## Building More Complex UI with Composition

The real power of Compose comes from composition—combining smaller composable functions to build complex UIs. Let's create a more useful component: a profile card.

```kotlin
@Composable
fun ProfileCard(name: String, title: String, imageUrl: String) {
    Card(
        modifier = Modifier
            .padding(16.dp)
            .fillMaxWidth(),
        elevation = 4.dp
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Profile image
            Image(
                painter = rememberAsyncImagePainter(imageUrl),
                contentDescription = "Profile picture of $name",
                modifier = Modifier
                    .size(72.dp)
                    .clip(CircleShape)
            )
            
            // Profile details
            Column(
                modifier = Modifier.padding(start = 16.dp)
            ) {
                Text(
                    text = name,
                    style = MaterialTheme.typography.h6
                )
                Text(
                    text = title,
                    style = MaterialTheme.typography.body1,
                    color = MaterialTheme.colors.onSurface.copy(alpha = 0.7f)
                )
            }
        }
    }
}
```

This composable combines several other composables (`Card`, `Row`, `Column`, `Image`, `Text`) to create a complete UI component. Notice how we're using the `Modifier` to specify how elements should be sized, padded, and arranged.

## Understanding State and Recomposition

One of the most important concepts in Compose is state. State in Compose represents any value that can change over time, potentially triggering UI updates. When state changes, Compose automatically "recomposes" the affected parts of the UI.

Let's modify our profile card to include a like button with state:

```kotlin
@Composable
fun LikeableProfileCard(name: String, title: String, imageUrl: String) {
    // Define state for liked status
    var isLiked by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier
            .padding(16.dp)
            .fillMaxWidth(),
        elevation = 4.dp
    ) {
        Column {
            // Reuse our ProfileCard composable
            Row(
                modifier = Modifier.padding(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Profile image
                Image(
                    painter = rememberAsyncImagePainter(imageUrl),
                    contentDescription = "Profile picture of $name",
                    modifier = Modifier
                        .size(72.dp)
                        .clip(CircleShape)
                )
                
                // Profile details
                Column(
                    modifier = Modifier.padding(start = 16.dp)
                ) {
                    Text(
                        text = name,
                        style = MaterialTheme.typography.h6
                    )
                    Text(
                        text = title,
                        style = MaterialTheme.typography.body1,
                        color = MaterialTheme.colors.onSurface.copy(alpha = 0.7f)
                    )
                }
            }
            
            // Like button
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.End
            ) {
                IconButton(
                    onClick = { isLiked = !isLiked }
                ) {
                    Icon(
                        imageVector = if (isLiked) Icons.Filled.Favorite else Icons.Outlined.FavoriteBorder,
                        contentDescription = if (isLiked) "Unlike" else "Like",
                        tint = if (isLiked) Color.Red else MaterialTheme.colors.onSurface
                    )
                }
            }
        }
    }
}
```

In this example, we're using `mutableStateOf` to create a state variable that holds a boolean value. The `remember` function ensures the state survives recomposition. When the user clicks the like button, the state changes, which triggers a recomposition of the parts of the UI that depend on that state—in this case, the icon changes from an outlined heart to a filled red heart.

## Previewing Composables in Android Studio

One of the best features of Jetpack Compose is the ability to preview your composables directly in Android Studio without running your app. To do this, you can use the `@Preview` annotation:

```kotlin
@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    MyAppTheme {
        LikeableProfileCard(
            name = "Jane Doe",
            title = "Android Developer",
            imageUrl = "https://example.com/profile.jpg"
        )
    }
}
```

With this preview function, you can see your composable in the Android Studio preview pane. You can also create multiple previews with different configurations to see how your UI adapts to different scenarios.

## Handling User Input and Events

Composables can respond to user input through modifier events and callbacks. Let's add a simple form that collects user input:

```kotlin
@Composable
fun SimpleForm() {
    var name by remember { mutableStateOf("") }
    var email by remember { mutableStateOf("") }
    var submitEnabled by remember { mutableStateOf(false) }
    
    // Update the submit button state based on form validity
    LaunchedEffect(name, email) {
        submitEnabled = name.isNotBlank() && email.isNotBlank() && email.contains("@")
    }
    
    Column(
        modifier = Modifier
            .padding(16.dp)
            .fillMaxWidth()
    ) {
        // Name input
        OutlinedTextField(
            value = name,
            onValueChange = { name = it },
            label = { Text("Name") },
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        // Email input
        OutlinedTextField(
            value = email,
            onValueChange = { email = it },
            label = { Text("Email") },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Submit button
        Button(
            onClick = {
                // Handle form submission
                Toast.makeText(LocalContext.current, "Form submitted!", Toast.LENGTH_SHORT).show()
            },
            enabled = submitEnabled,
            modifier = Modifier.align(Alignment.End)
        ) {
            Text("Submit")
        }
    }
}
```

This form updates state as the user types, validates the input, and enables the submit button only when the form is valid. When the user clicks the button, it shows a toast message.

## Best Practices for Composable Functions

As you begin writing your own composable functions, keep these best practices in mind:

1. **Keep composables small and focused**: Each composable should do one thing well. If a composable becomes too complex, break it down into smaller, reusable components.

2. **Hoist state appropriately**: Move state up to the appropriate level in your composable hierarchy. State should be owned by the lowest common ancestor of all composables that need to access it.

3. **Use parameters for customization**: Make your composables flexible by accepting parameters that allow callers to customize their appearance and behavior.

4. **Follow the Compose naming conventions**: Name your composables with nouns (e.g., `ProfileCard`) and their parameters with descriptive names.

5. **Use modifiers effectively**: Pass modifiers as parameters and extend them rather than overriding them.

```kotlin
@Composable
fun MyComposable(
    // Accept modifier as a parameter
    modifier: Modifier = Modifier,
    // Other parameters
) {
    // Use the modifier and extend it
    Column(modifier = modifier.padding(16.dp)) {
        // Content
    }
}
```

6. **Use `remember` and `derivedStateOf` for performance**: Use `remember` to avoid recreating objects during recomposition, and `derivedStateOf` to compute values based on other state without triggering unnecessary recompositions.

## Debugging Composables

When your composable doesn't behave as expected, you can use several techniques to debug it:

1. **Layout Inspector**: Use Android Studio's Layout Inspector to examine your Compose hierarchy at runtime.

2. **Compose Preview**: Use the `@Preview` annotation to see your composable in isolation.

3. **Logcat**: Add log statements to your composable functions to track state changes and composition.

4. **Composition Local**: Use `CompositionLocal` values to check environment properties.

## Conclusion

Writing your first Jetpack Composable function is the first step into a new and exciting way of building Android UIs. The declarative nature of Compose allows you to express your UI intuitively, with less code and fewer bugs. As you become more comfortable with composable functions, you'll discover the power of composition, state management, and the rich ecosystem of Compose libraries.

Remember that effective Compose code is built on small, reusable composables that can be combined in various ways. Start simple, focus on proper state management, and gradually build more complex UIs as your confidence grows.

The transition to Jetpack Compose might seem challenging at first, especially if you're used to the traditional View system, but the benefits in terms of productivity and code quality are substantial. With practice, you'll find yourself building beautiful, responsive UIs with less effort than ever before.
