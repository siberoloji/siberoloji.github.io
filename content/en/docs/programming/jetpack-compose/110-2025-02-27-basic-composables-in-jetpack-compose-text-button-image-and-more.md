---
draft: false
title: Basic Composables Text, Button, Image, and More
linkTitle: Text, Button, Image, and More
translationKey: basic-composables-in-jetpack-compose
description: "Learn about Jetpack Compose's basic composables: Text, Button, Image, and more."
url: basic-composables-in-jetpack-compose-text-button-image-and-more
weight: 110
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - basic composables
---

Jetpack Compose is a modern Android UI toolkit that simplifies UI development using a declarative approach. It replaces traditional XML-based layouts with composables—functions that describe the UI in a more intuitive and flexible way. Understanding the basic composables such as `Text`, `Button`, `Image`, and others is essential to building user-friendly applications efficiently.

In this article, we will explore these fundamental composables, discuss their usage, and provide examples to help you get started.

---

## 1. Text Composable

The `Text` composable is used to display text on the screen. It is one of the most basic yet essential UI components in Jetpack Compose.

### Syntax and Example

```kotlin
@Composable
fun Greeting() {
    Text(text = "Hello, Jetpack Compose!")
}
```

### Customizing Text

You can customize the appearance of text using parameters such as `color`, `fontSize`, `fontWeight`, and more:

```kotlin
@Composable
fun StyledText() {
    Text(
        text = "Welcome to Compose!",
        color = Color.Blue,
        fontSize = 20.sp,
        fontWeight = FontWeight.Bold
    )
}
```

### Using TextStyle

To further enhance styling, you can use the `TextStyle` parameter:

```kotlin
@Composable
fun StyledTextWithTextStyle() {
    Text(
        text = "Styled with TextStyle",
        style = TextStyle(
            fontSize = 18.sp,
            color = Color.Magenta,
            fontWeight = FontWeight.SemiBold
        )
    )
}
```

---

## 2. Button Composable

The `Button` composable is used to create clickable buttons that trigger actions.

### Syntax and Example

```kotlin
@Composable
fun SimpleButton() {
    Button(onClick = { println("Button clicked!") }) {
        Text("Click Me")
    }
}
```

### Customizing Buttons

You can customize buttons with different colors, shapes, and elevation.

```kotlin
@Composable
fun StyledButton() {
    Button(
        onClick = { println("Styled Button clicked!") },
        colors = ButtonDefaults.buttonColors(backgroundColor = Color.Red)
    ) {
        Text("Styled Button", color = Color.White)
    }
}
```

### Using ElevatedButton and OutlinedButton

Jetpack Compose also provides `ElevatedButton` and `OutlinedButton` for different styles.

```kotlin
@Composable
fun OtherButtons() {
    ElevatedButton(onClick = { println("Elevated Button clicked!") }) {
        Text("Elevated Button")
    }
    OutlinedButton(onClick = { println("Outlined Button clicked!") }) {
        Text("Outlined Button")
    }
}
```

---

## 3. Image Composable

The `Image` composable is used to display images from various sources such as resources, URLs, or bitmaps.

### Syntax and Example

```kotlin
@Composable
fun SimpleImage() {
    Image(
        painter = painterResource(id = R.drawable.sample_image),
        contentDescription = "Sample Image"
    )
}
```

### Modifying Image Appearance

You can customize an image’s size, shape, and content scaling using the `modifier` parameter.

```kotlin
@Composable
fun StyledImage() {
    Image(
        painter = painterResource(id = R.drawable.sample_image),
        contentDescription = "Styled Image",
        modifier = Modifier.size(150.dp).clip(RoundedCornerShape(10.dp))
    )
}
```

### Loading Images from URLs

To load images from a URL, you can use `Coil`, a popular image loading library for Compose.

```kotlin
@Composable
fun NetworkImage(url: String) {
    AsyncImage(
        model = url,
        contentDescription = "Network Image",
        modifier = Modifier.size(100.dp)
    )
}
```

---

## 4. Row and Column Composables

`Row` and `Column` are layout composables used for arranging UI components horizontally and vertically, respectively.

### Using Row

```kotlin
@Composable
fun HorizontalLayout() {
    Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceEvenly) {
        Text("Item 1")
        Text("Item 2")
        Text("Item 3")
    }
}
```

### Using Column

```kotlin
@Composable
fun VerticalLayout() {
    Column(modifier = Modifier.fillMaxHeight(), verticalArrangement = Arrangement.Center) {
        Text("Item A")
        Text("Item B")
        Text("Item C")
    }
}
```

---

## 5. Modifier: Enhancing Composables

Modifiers are used to apply layout changes, styling, padding, and other UI customizations to composables.

### Example of Modifier Usage

```kotlin
@Composable
fun ModifiedText() {
    Text(
        text = "Hello, Modifier!",
        modifier = Modifier.padding(16.dp).background(Color.LightGray)
    )
}
```

### Common Modifier Functions

- `padding()`: Adds space around a composable.
- `background()`: Sets a background color.
- `clip()`: Clips the composable into a shape.
- `size()`: Defines width and height.
- `border()`: Adds a border around the composable.

---

## Conclusion

Jetpack Compose’s basic composables—`Text`, `Button`, `Image`, `Row`, and `Column`—form the foundation of UI development in modern Android applications. Understanding how to use and customize these elements effectively will help you build intuitive, flexible, and visually appealing user interfaces.

If you are just starting with Jetpack Compose, experimenting with these basic components in a sample project is a great way to become comfortable with its declarative approach. As you progress, you can explore more advanced composables and state management techniques to build powerful Android apps.

Happy coding!
