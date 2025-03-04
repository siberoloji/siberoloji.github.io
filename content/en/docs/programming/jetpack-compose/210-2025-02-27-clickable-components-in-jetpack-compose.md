---
draft: false
title: Clickable Components in Jetpack Compose
linkTitle: Clickable Components in Jetpack Compose
translationKey: clickable-components-in-jetpack-compose
description: Learn how to create clickable components in Jetpack Compose, handle user interactions, and provide visual feedback for a better user experience.
url: clickable-components-in-jetpack-compose
weight: 210
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
---

User interaction forms the cornerstone of modern Android applications, and Jetpack Compose revolutionizes how developers implement interactive UI elements. At the heart of this interaction paradigm are clickable components that respond to user touches, taps, and gestures. This blog post explores the various approaches to creating clickable elements in Jetpack Compose, best practices for implementing them, and techniques to enhance user experience through proper feedback mechanisms.

## Understanding Clickable Components in Compose

Jetpack Compose takes a fundamentally different approach to user interaction compared to the traditional View system. Instead of setting listeners on view objects, Compose provides modifiers and specialized components that handle click events declaratively. This shift aligns with Compose's overall philosophy of describing what the UI should look like rather than how to update it.

## The Clickable Modifier

The most basic way to make any composable respond to clicks is by using the `clickable` modifier. This approach gives you the flexibility to transform virtually any UI element into an interactive component.

```kotlin
@Composable
fun ClickableText() {
    var clicks by remember { mutableStateOf(0) }
    
    Text(
        text = "Clicks: $clicks",
        modifier = Modifier
            .padding(16.dp)
            .clickable { clicks++ }
    )
}
```

The `clickable` modifier accepts a lambda function that executes when the user taps the component. This simple yet powerful mechanism allows for handling various interactions beyond just incrementing a counter—you can trigger navigation events, show dialogs, or update your application state.

### Customizing Clickable Behavior

The `clickable` modifier offers several parameters to customize its behavior:

```kotlin
@Composable
fun CustomClickableComponent() {
    Box(
        modifier = Modifier
            .size(100.dp)
            .background(Color.Blue)
            .clickable(
                enabled = true,
                onClickLabel = "Click me", // For accessibility
                role = Role.Button,
                indication = rememberRipple(bounded = true, color = Color.White),
                interactionSource = remember { MutableInteractionSource() },
                onClick = { /* Handle click */ }
            )
    ) {
        Text(
            text = "Click",
            color = Color.White,
            modifier = Modifier.align(Alignment.Center)
        )
    }
}
```

Let's examine these parameters:

- `enabled`: Controls whether the component responds to click events
- `onClickLabel`: Provides an accessibility label for screen readers
- `role`: Communicates the semantic meaning (button, checkbox, etc.)
- `indication`: Visual feedback shown when the component is touched (usually a ripple effect)
- `interactionSource`: Tracks interaction states like pressed, focused, or hovered
- `onClick`: The handler function executed when clicked

## Specialized Clickable Components

While the `clickable` modifier works for any composable, Compose provides specialized components designed specifically for common interactive elements.

### Button

The `Button` composable is the primary way to represent actions in your UI:

```kotlin
@Composable
fun ButtonExample() {
    Button(
        onClick = { /* Handle button click */ },
        colors = ButtonDefaults.buttonColors(
            containerColor = MaterialTheme.colorScheme.primary,
            contentColor = MaterialTheme.colorScheme.onPrimary
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Icon(
            Icons.Default.Add,
            contentDescription = "Add",
            modifier = Modifier.size(ButtonDefaults.IconSize)
        )
        Spacer(Modifier.size(ButtonDefaults.IconSpacing))
        Text("Add Item")
    }
}
```

Compose offers several button variants:

- `Button`: Standard elevated button
- `ElevatedButton`: Button with elevation and surface color
- `FilledTonalButton`: Button with a secondary color fill
- `OutlinedButton`: Button with an outline and transparent background
- `TextButton`: Button without background or outline

Each button type has its own visual style but shares a similar API, making it easy to switch between them as your design evolves.

### IconButton

For icon-only actions, the `IconButton` composable is ideal:

```kotlin
@Composable
fun IconButtonExample() {
    IconButton(
        onClick = { /* Handle icon click */ }
    ) {
        Icon(
            imageVector = Icons.Filled.Favorite,
            contentDescription = "Favorite",
            tint = Color.Red
        )
    }
}
```

The `IconButton` applies appropriate sizing, padding, and hit target sizes to ensure good usability while maintaining a clean appearance.

### Floating Action Button (FAB)

For prominent actions, Compose provides the Floating Action Button:

```kotlin
@Composable
fun FabExample() {
    FloatingActionButton(
        onClick = { /* Handle FAB click */ },
        containerColor = MaterialTheme.colorScheme.secondary,
        contentColor = MaterialTheme.colorScheme.onSecondary
    ) {
        Icon(Icons.Filled.Add, contentDescription = "Add")
    }
}
```

Variants include `SmallFloatingActionButton` and `LargeFloatingActionButton` for different size options, and `ExtendedFloatingActionButton` for including text alongside an icon.

### Toggleable Components

For components that represent binary states, Compose offers several toggleable elements:

#### Checkbox

```kotlin
@Composable
fun CheckboxExample() {
    var checked by remember { mutableStateOf(false) }
    
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier.clickable { checked = !checked }
    ) {
        Checkbox(
            checked = checked,
            onCheckedChange = { checked = it }
        )
        Spacer(Modifier.width(8.dp))
        Text("Enable feature")
    }
}
```

#### Switch

```kotlin
@Composable
fun SwitchExample() {
    var checked by remember { mutableStateOf(false) }
    
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier.clickable { checked = !checked }
    ) {
        Switch(
            checked = checked,
            onCheckedChange = { checked = it }
        )
        Spacer(Modifier.width(8.dp))
        Text("Dark mode")
    }
}
```

#### Radio Button

```kotlin
@Composable
fun RadioButtonExample() {
    val options = listOf("Option 1", "Option 2", "Option 3")
    var selectedOption by remember { mutableStateOf(options[0]) }
    
    Column {
        options.forEach { option ->
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { selectedOption = option }
                    .padding(vertical = 8.dp)
            ) {
                RadioButton(
                    selected = (option == selectedOption),
                    onClick = { selectedOption = option }
                )
                Spacer(Modifier.width(8.dp))
                Text(text = option)
            }
        }
    }
}
```

## Card and Surface for Clickable Containers

When you need a larger clickable area that contains other elements, `Card` and `Surface` composables work well:

```kotlin
@Composable
fun ClickableCardExample() {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
            .clickable { /* Handle card click */ },
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text("Card Title", style = MaterialTheme.typography.headlineSmall)
            Spacer(modifier = Modifier.height(8.dp))
            Text("This entire card is clickable and will respond to taps.")
        }
    }
}
```

When using these container elements, be mindful of nesting clickable components inside them, as this can lead to conflicting gesture handling.

## Advanced Interaction Patterns

Beyond basic clicks, Compose offers sophisticated ways to handle more complex interactions.

### Combined with Gestures

For more complex interactions, you can combine click handling with other gestures:

```kotlin
@Composable
fun AdvancedGesturesExample() {
    val scale = remember { mutableStateOf(1f) }
    val rotationState = remember { mutableStateOf(0f) }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .combinedClickable(
                onClick = { /* Handle single click */ },
                onDoubleClick = { /* Handle double click */ },
                onLongClick = { /* Handle long press */ }
            )
            .pointerInput(Unit) {
                detectTransformGestures { _, _, zoom, rotation ->
                    scale.value *= zoom
                    rotationState.value += rotation
                }
            }
    ) {
        // Content that responds to various gestures
    }
}
```

### Interacting with Scrollable Containers

When working with clickable items inside scrollable containers like `LazyColumn`, consider how scrolling and clicking should interact:

```kotlin
@Composable
fun ClickableListExample() {
    LazyColumn {
        items(20) { index ->
            ListItem(
                headlineContent = { Text("Item $index") },
                supportingContent = { Text("Description for item $index") },
                leadingContent = { 
                    Icon(Icons.Default.Info, contentDescription = null)
                },
                modifier = Modifier.clickable { /* Handle item click */ }
            )
            Divider()
        }
    }
}
```

For list items, you might want to handle different click areas—for example, having the entire item navigate to details while a specific button within it performs a different action.

## Handling Click States and Visual Feedback

Providing appropriate visual feedback is crucial for a good user experience. Compose offers several ways to indicate interactive states.

### Tracking Interaction States

The `MutableInteractionSource` allows tracking various interaction states:

```kotlin
@Composable
fun InteractionStateExample() {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val backgroundColor = if (isPressed) Color.DarkGray else Color.LightGray
    
    Box(
        modifier = Modifier
            .size(100.dp)
            .background(backgroundColor, shape = CircleShape)
            .clickable(
                interactionSource = interactionSource,
                indication = rememberRipple(bounded = true),
                onClick = { /* Handle click */ }
            ),
        contentAlignment = Alignment.Center
    ) {
        Text("Press me", color = Color.White)
    }
}
```

You can collect various states like:

- `collectIsPressedAsState()`
- `collectIsFocusedAsState()`
- `collectIsHoveredAsState()`
- `collectIsDraggedAsState()`

### Custom Animations and Transitions

For more elaborate feedback, combine interaction states with animations:

```kotlin
@Composable
fun AnimatedClickableExample() {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.9f else 1f,
        label = "scale"
    )
    
    Box(
        modifier = Modifier
            .size(150.dp)
            .scale(scale)
            .background(MaterialTheme.colorScheme.primary, RoundedCornerShape(16.dp))
            .clickable(
                interactionSource = interactionSource,
                indication = null, // Disable default indication since we're using custom animation
                onClick = { /* Handle click */ }
            ),
        contentAlignment = Alignment.Center
    ) {
        Text(
            "Tap Me",
            color = MaterialTheme.colorScheme.onPrimary,
            style = MaterialTheme.typography.titleLarge
        )
    }
}
```

## Accessibility Considerations

When implementing clickable components, accessibility should be a primary concern, not an afterthought.

### Content Descriptions

Always provide content descriptions for clickable elements without text:

```kotlin
IconButton(onClick = { /* Handle click */ }) {
    Icon(
        imageVector = Icons.Filled.Settings,
        contentDescription = "Settings"
    )
}
```

### Click Labels

Use the `onClickLabel` parameter to provide additional context for screen readers:

```kotlin
Box(
    modifier = Modifier
        .clickable(
            onClickLabel = "Open user profile",
            onClick = { /* Navigate to profile */ }
        )
) {
    // Profile content
}
```

### Adequate Touch Targets

Ensure clickable elements are large enough to tap comfortably. Material Design recommends a minimum touch target size of 48dp:

```kotlin
@Composable
fun AccessibleButton() {
    Box(
        modifier = Modifier
            .size(48.dp) // Minimum touch target size
            .clickable { /* Handle click */ },
        contentAlignment = Alignment.Center
    ) {
        Icon(
            imageVector = Icons.Default.Add,
            contentDescription = "Add item",
            modifier = Modifier.size(24.dp) // Visual size can be smaller
        )
    }
}
```

## Best Practices for Clickable Components

To create a polished, user-friendly experience, follow these best practices:

1. **Provide immediate visual feedback**: Always use indications or animations to confirm user interactions.

2. **Use semantic components**: Choose the right component for each interaction type (Button for actions, Checkbox for toggles, etc.).

3. **Ensure consistent behavior**: Similar components should respond similarly across your app.

4. **Prevent accidental clicks**: Add confirmation for destructive or irreversible actions.

5. **Handle disabled states appropriately**: Visually distinguish disabled components and explain why they're disabled.

6. **Consider edge cases**: Test how your clickable components behave when the app is in background or during system interruptions.

7. **Implement debouncing for critical actions**: Prevent multiple rapid clicks from triggering multiple actions:

```kotlin
@Composable
fun DebouncedClickButton() {
    var lastClickTime by remember { mutableStateOf(0L) }
    
    Button(
        onClick = {
            val currentTime = System.currentTimeMillis()
            if (currentTime - lastClickTime > 300) { // 300ms debounce period
                lastClickTime = currentTime
                // Handle the click action
            }
        }
    ) {
        Text("Click Me")
    }
}
```

## A Complete Example: Custom Interactive Card

Let's bring everything together with a custom interactive card component that provides rich feedback and handles multiple interaction types:

```kotlin
@Composable
fun InteractiveCard(
    title: String,
    description: String,
    onCardClick: () -> Unit,
    onActionClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    // Animated properties
    val elevation by animateDpAsState(
        targetValue = when {
            isPressed -> 1.dp
            isHovered -> 8.dp
            else -> 4.dp
        },
        label = "elevation"
    )
    
    val backgroundColor by animateColorAsState(
        targetValue = when {
            isPressed -> MaterialTheme.colorScheme.surfaceVariant
            isHovered -> MaterialTheme.colorScheme.surface.copy(alpha = 0.9f)
            else -> MaterialTheme.colorScheme.surface
        },
        label = "backgroundColor"
    )
    
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(
                interactionSource = interactionSource,
                indication = rememberRipple(bounded = true),
                onClick = onCardClick
            ),
        colors = CardDefaults.cardColors(containerColor = backgroundColor),
        elevation = CardDefaults.cardElevation(defaultElevation = elevation)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleLarge
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onActionClick) {
                    Text("ACTION")
                }
            }
        }
    }
}

@Composable
fun InteractiveCardDemo() {
    InteractiveCard(
        title = "Interactive Card",
        description = "This card demonstrates various interaction states with custom animations and feedback. Hover and click to see the different states.",
        onCardClick = { /* Handle card click */ },
        onActionClick = { /* Handle action click */ },
        modifier = Modifier.padding(16.dp)
    )
}
```

This component demonstrates several important patterns:

- Tracking multiple interaction states
- Providing custom animations for feedback
- Combining both card-level and button-level interactions
- Using Material 3 design tokens for consistency

## Conclusion

Clickable components form the foundation of user interaction in Jetpack Compose applications. By leveraging Compose's powerful modifiers, specialized components, and state tracking capabilities, you can create intuitive, responsive interfaces that delight users.

Remember that effective clickable components go beyond just handling the tap event—they provide appropriate feedback, account for accessibility needs, and fit into a consistent interaction system across your application.

As you implement clickable elements in your Compose-based applications, focus on creating a cohesive experience where every tap, press, or gesture feels natural and expected. With the techniques outlined in this article, you're well-equipped to build interfaces that are not just functional, but truly interactive and engaging.
