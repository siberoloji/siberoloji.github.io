---
draft: false
title: Implementing Dark Mode and Dynamic Theming in Jetpack Compose
linkTitle: Implementing Dark Mode and Dynamic Theming
translationKey: implementing-dark-mode-and-dynamic-theming-in-jetpack-compose
description: Learn how to integrate dark mode into a Jetpack Compose app, implement dynamic theming, and allow users to toggle between light and dark modes seamlessly.
url: implementing-dark-mode-and-dynamic-theming-in-jetpack-compose
weight: 310
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Dark Mode
  - Dynamic Theming
---
# Implementing Dark Mode and Dynamic Theming in Jetpack Compose

With the rise of modern UI/UX principles, dark mode has become an essential feature in mobile applications. It not only enhances user experience by reducing eye strain but also improves battery efficiency on OLED screens. Jetpack Compose, Google’s declarative UI framework, makes implementing dark mode and dynamic theming straightforward and efficient.

In this article, we will explore how to integrate dark mode into a Jetpack Compose app, implement dynamic theming, and allow users to toggle between light and dark modes seamlessly.

## Understanding Theming in Jetpack Compose

Jetpack Compose provides a flexible theming system that revolves around the **MaterialTheme**. A typical Compose theme setup includes:

- **Color Scheme**: Defines primary, secondary, background, surface, and other colors.
- **Typography**: Defines text styles for different UI elements.
- **Shapes**: Defines corner shapes for buttons, cards, and other components.

When implementing dark mode, the main focus is on defining different color schemes for light and dark themes.

## Step 1: Defining Light and Dark Color Schemes

Before we implement dark mode, we need to define color schemes for both light and dark themes. These are typically stored in a separate file for better code organization.

### Define Color Palettes

```kotlin
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color

val LightColors = lightColorScheme(
    primary = Color(0xFF6200EE),
    onPrimary = Color.White,
    secondary = Color(0xFF03DAC6),
    background = Color.White,
    surface = Color.White,
    onSurface = Color.Black
)

val DarkColors = darkColorScheme(
    primary = Color(0xFFBB86FC),
    onPrimary = Color.Black,
    secondary = Color(0xFF03DAC6),
    background = Color.Black,
    surface = Color.DarkGray,
    onSurface = Color.White
)
```

## Step 2: Creating a Theme Wrapper

Now, let’s create a **Theme.kt** file that applies these color schemes dynamically based on the system theme settings.

```kotlin
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable

@Composable
fun MyAppTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colors = if (darkTheme) DarkColors else LightColors

    MaterialTheme(
        colorScheme = colors,
        typography = Typography,
        shapes = Shapes,
        content = content
    )
}
```

### Explanation

- **isSystemInDarkTheme()**: Determines if the device is set to dark mode.
- **MaterialTheme**: Wraps the app’s UI and applies the chosen color scheme dynamically.
- **darkTheme Parameter**: Allows us to manually switch themes when needed.

## Step 3: Applying the Theme to the App

Once the theme is set up, we apply it in the **MainActivity.kt** file.

```kotlin
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyAppTheme {
                MainScreen()
            }
        }
    }
}

@Composable
fun MainScreen() {
    // Your UI components here
}
```

## Step 4: Adding a Theme Toggle Option

Now, let’s allow users to toggle between light and dark modes manually. We achieve this using **MutableState** and **rememberSaveable**.

```kotlin
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun ThemeToggleScreen() {
    var isDarkTheme by rememberSaveable { mutableStateOf(false) }
    
    MyAppTheme(darkTheme = isDarkTheme) {
        Column(
            modifier = Modifier.fillMaxSize().padding(16.dp),
        ) {
            Button(onClick = { isDarkTheme = !isDarkTheme }) {
                Text(text = if (isDarkTheme) "Switch to Light Mode" else "Switch to Dark Mode")
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewThemeToggleScreen() {
    ThemeToggleScreen()
}
```

### Explanation

- **mutableStateOf(false)**: Stores the user’s theme preference.
- **Button Click Event**: Toggles between light and dark modes.
- **rememberSaveable**: Ensures the state persists across recompositions.

## Step 5: Persisting Theme Preference

To maintain the selected theme across app restarts, we use **DataStore Preferences**.

### Add Dependencies

Add the following to `build.gradle`:

```gradle
dependencies {
    implementation "androidx.datastore:datastore-preferences:1.0.0"
}
```

### Implement DataStore

Create a `ThemePreferenceManager.kt` file:

```kotlin
import android.content.Context
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.preferencesDataStore
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

val Context.dataStore by preferencesDataStore(name = "settings")

class ThemePreferenceManager(private val context: Context) {
    private val THEME_KEY = booleanPreferencesKey("dark_theme")

    val isDarkTheme: Flow<Boolean> = context.dataStore.data.map { prefs ->
        prefs[THEME_KEY] ?: false
    }

    suspend fun saveTheme(isDark: Boolean) {
        context.dataStore.edit { prefs ->
            prefs[THEME_KEY] = isDark
        }
    }
}
```

### Integrate with Compose

Modify `ThemeToggleScreen` to use `ThemePreferenceManager`:

```kotlin
@Composable
fun ThemeToggleScreen(context: Context) {
    val scope = rememberCoroutineScope()
    val themeManager = ThemePreferenceManager(context)
    val isDarkTheme by themeManager.isDarkTheme.collectAsState(initial = false)

    MyAppTheme(darkTheme = isDarkTheme) {
        Column(
            modifier = Modifier.fillMaxSize().padding(16.dp),
        ) {
            Button(onClick = {
                scope.launch { themeManager.saveTheme(!isDarkTheme) }
            }) {
                Text(text = if (isDarkTheme) "Switch to Light Mode" else "Switch to Dark Mode")
            }
        }
    }
}
```

## Conclusion

Jetpack Compose simplifies dark mode and dynamic theming implementation. By defining separate color schemes, wrapping UI components in a theme provider, and using DataStore to persist user preferences, we can create a seamless and flexible theming experience.

With these steps, you can provide a fully customizable UI, ensuring a more personalized experience for your users.
