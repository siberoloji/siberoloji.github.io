---
draft: false
title: "Basic Animations with animate*AsState in Jetpack Compose"
linkTitle: Basic Animations with `animate*AsState`
translationKey: basic-animations-with-animateasstate-in-jetpack-compose
description: A guide on using animate*AsState functions for basic animations in Jetpack Compose.
url: basic-animations-with-animateasstate-in-jetpack-compose
weight: 270
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Animations
---

Jetpack Compose, the modern UI toolkit for Android, simplifies UI development with declarative programming. One of its powerful features is built-in animation support, allowing developers to create smooth, intuitive animations with minimal effort. In this post, we'll explore how to use `animate*AsState` functions to animate properties in Jetpack Compose.

## Understanding `animate*AsState`

The `animate*AsState` functions provide an easy way to animate simple state changes in Compose. These functions are designed to animate primitive types like `Float`, `Dp`, `Color`, and `Int` when their values change.

Some commonly used functions include:

- `animateFloatAsState()` - Animates a `Float` value.
- `animateDpAsState()` - Animates a `Dp` value (useful for sizes and padding).
- `animateColorAsState()` - Animates color transitions.
- `animateIntAsState()` - Animates an integer value.

These functions are state-driven and automatically interpolate between values when a state change occurs.

## Setting Up a Simple Animation

Let's start with a simple example to animate a button’s size when it is clicked.

```kotlin
@Composable
fun AnimatedButton() {
    var isExpanded by remember { mutableStateOf(false) }
    val width by animateDpAsState(targetValue = if (isExpanded) 200.dp else 100.dp, label = "buttonWidth")
    val height by animateDpAsState(targetValue = if (isExpanded) 80.dp else 40.dp, label = "buttonHeight")

    Button(
        onClick = { isExpanded = !isExpanded },
        modifier = Modifier.size(width, height)
    ) {
        Text("Click Me")
    }
}
```

### Explanation

- `mutableStateOf(false)`: Holds the state of whether the button is expanded or not.
- `animateDpAsState`: Interpolates between two `Dp` values when `isExpanded` changes.
- The button resizes smoothly when clicked, thanks to animation.

## Animating Colors

Another common use case is color transitions. The `animateColorAsState` function makes it simple to create smooth color changes.

```kotlin
@Composable
fun AnimatedColorBox() {
    var isToggled by remember { mutableStateOf(false) }
    val backgroundColor by animateColorAsState(targetValue = if (isToggled) Color.Red else Color.Blue, label = "boxColor")

    Box(
        modifier = Modifier
            .size(100.dp)
            .background(backgroundColor)
            .clickable { isToggled = !isToggled }
    )
}
```

### Explanation

- The `Box` changes color when clicked.
- `animateColorAsState` interpolates the color change, ensuring a smooth transition.

## Animating Visibility

Sometimes, instead of instantly showing or hiding a UI element, we want a smooth transition. We can achieve this by animating opacity.

```kotlin
@Composable
fun FadeInOutText() {
    var isVisible by remember { mutableStateOf(true) }
    val alpha by animateFloatAsState(targetValue = if (isVisible) 1f else 0f, label = "textOpacity")

    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Button(onClick = { isVisible = !isVisible }) {
            Text("Toggle Text")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Hello, Jetpack Compose!",
            modifier = Modifier.alpha(alpha)
        )
    }
}
```

### Explanation

- `animateFloatAsState` smoothly changes the alpha (opacity) of the text.
- The text fades in and out when the button is clicked.

## Using AnimationSpec for Customization

By default, `animate*AsState` applies a smooth animation, but we can customize it using `AnimationSpec`. Some common types include:

- `tween(durationMillis = 1000)`: Defines a duration-based animation.
- `spring(dampingRatio = Spring.DampingRatioMediumBouncy)`: Creates a spring-like effect.
- `keyframes {}`: Defines animations with specific keyframe values.

### Example: Customizing the Animation Speed

```kotlin
@Composable
fun AnimatedSizeWithCustomSpec() {
    var isLarge by remember { mutableStateOf(false) }
    val size by animateDpAsState(
        targetValue = if (isLarge) 150.dp else 50.dp,
        animationSpec = tween(durationMillis = 500, easing = LinearOutSlowInEasing),
        label = "boxSize"
    )

    Box(
        modifier = Modifier
            .size(size)
            .background(Color.Green)
            .clickable { isLarge = !isLarge }
    )
}
```

### Explanation

- `tween(durationMillis = 500)`: The animation lasts 500 milliseconds.
- `LinearOutSlowInEasing`: Creates a smooth start and slow end effect.
- The `Box` resizes smoothly when clicked.

## Best Practices

1. **Use for Simple Animations**: `animate*AsState` is ideal for basic animations. For complex sequences, use `Animatable` or `Transition`.
2. **Optimize Recomposition**: Avoid unnecessary recomposition by structuring your Composables efficiently.
3. **Use Labels**: Always provide a `label` parameter in `animate*AsState` functions for better debugging.
4. **Combine Animations**: You can use multiple `animate*AsState` functions together for richer effects.

## Conclusion

The `animate*AsState` functions in Jetpack Compose provide a simple yet powerful way to add animations to your UI. Whether animating size, color, or visibility, these functions help create a smooth and interactive user experience with minimal effort. By understanding how to use `animate*AsState` along with animation specifications, you can build engaging and visually appealing UIs.

Start experimenting with these animations in your Compose projects today!
