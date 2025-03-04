---
draft: false
title: Passing Arguments Between Composables in Jetpack Compose
linkTitle: Passing Arguments
translationKey: passing-arguments-between-composables-in-jetpack-compose
description: Jetpack Compose provides various methods for passing arguments between composables for efficient data sharing and state management.
url: passing-arguments-between-composables-in-jetpack-compose
weight: 250
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Arguments
  - Composables
---
Jetpack Compose is Google’s modern toolkit for building native Android UIs declaratively. It offers a composable function-based approach, making UI development more intuitive and reducing boilerplate code. One common requirement when working with composables is passing data between them efficiently.

In this article, we will explore various methods for passing arguments between composables in Jetpack Compose, including direct parameter passing, using ViewModel, leveraging Remember and State, and utilizing Navigation arguments. We will also discuss best practices to maintain clean and modular code.

## **1. Direct Parameter Passing**

The simplest and most recommended way to pass arguments between composables is through function parameters. Since composables are essentially Kotlin functions, arguments can be passed just like any other function in Kotlin.

### Example

```kotlin
@Composable
fun UserProfile(name: String, age: Int) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text(text = "Name: $name", style = MaterialTheme.typography.h6)
        Text(text = "Age: $age", style = MaterialTheme.typography.body1)
    }
}

@Composable
fun ParentScreen() {
    UserProfile(name = "John Doe", age = 30)
}
```

### **When to Use This Approach?**

- When data is directly available in the calling composable.
- When passing primitive data types or simple objects.
- When there is no need to persist state beyond recomposition.

## **2. Using ViewModel to Share Data**

In cases where data needs to be shared between multiple composables or across different screens, using a `ViewModel` is a good practice. Jetpack Compose works well with ViewModel, and it helps maintain UI state across recompositions.

### Example

```kotlin
class UserViewModel : ViewModel() {
    private val _user = mutableStateOf(User("Alice", 25))
    val user: State<User> = _user
}

@Composable
fun UserProfile(viewModel: UserViewModel = viewModel()) {
    val user by viewModel.user
    Column(modifier = Modifier.padding(16.dp)) {
        Text(text = "Name: ${user.name}", style = MaterialTheme.typography.h6)
        Text(text = "Age: ${user.age}", style = MaterialTheme.typography.body1)
    }
}
```

### **When to Use This Approach?**

- When data needs to persist across recompositions.
- When sharing data between multiple composables or screens.
- When fetching or processing data asynchronously (e.g., from a repository).

## **3. Leveraging Remember and State**

The `remember` function allows composables to retain values across recompositions. This is useful when passing mutable values within a screen or when a component needs to track state internally.

### Example

```kotlin
@Composable
fun Counter() {
    var count by remember { mutableStateOf(0) }
    Column(modifier = Modifier.padding(16.dp)) {
        Text(text = "Count: $count")
        Button(onClick = { count++ }) {
            Text(text = "Increment")
        }
    }
}
```

### **When to Use This Approach?**

- When managing local UI state within a composable.
- When keeping simple state variables without persisting across screen navigation.

## **4. Using Navigation Arguments in Jetpack Compose**

Jetpack Compose’s Navigation component allows passing arguments between different screens.

### **Passing String Arguments**

1. Define a NavController and specify the route with arguments:

```kotlin
@Composable
fun NavGraph(navController: NavHostController) {
    NavHost(navController, startDestination = "profile/{name}/{age}") {
        composable("profile/{name}/{age}") { backStackEntry ->
            val name = backStackEntry.arguments?.getString("name") ?: "Unknown"
            val age = backStackEntry.arguments?.getString("age")?.toIntOrNull() ?: 0
            UserProfile(name = name, age = age)
        }
    }
}
```

2. Navigate and pass arguments:

```kotlin
navController.navigate("profile/John/30")
```

### **Passing Complex Objects via Serialization**

Jetpack Compose supports `Parcelable` and `Serializable` for passing objects.

1. Define a data class implementing `Parcelable`:

```kotlin
@Parcelize
data class User(val name: String, val age: Int) : Parcelable
```

2. Pass the object using `navController`:

```kotlin
val user = User("Alice", 25)
val jsonUser = Uri.encode(Gson().toJson(user))
navController.navigate("profile/$jsonUser")
```

3. Retrieve the object in the destination composable:

```kotlin
val jsonUser = backStackEntry.arguments?.getString("user")
val user = Gson().fromJson(jsonUser, User::class.java)
```

### **When to Use This Approach?**

- When navigating between screens and passing data.
- When the data needs to persist across different composable screens.
- When using deep linking or external navigation.

## **Best Practices for Passing Data Between Composables**

1. **Prefer Direct Parameter Passing:**

   - Use direct function parameters whenever possible to keep composables stateless and modular.

2. **Use ViewModel for Shared State:**

   - When multiple composables need to access the same state, ViewModel is a better approach.

3. **Leverage remember and mutableStateOf:**

   - For UI elements that need to track temporary state (like a toggle button or text field input), `remember` ensures state persistence across recompositions.

4. **Use Navigation Arguments Carefully:**

   - When passing data between screens, ensure type safety using Parcelable or JSON serialization.

5. **Keep Composables Modular:**

   - Avoid passing unnecessary data and keep composables responsible for their own UI logic.

## **Conclusion**

Passing arguments between composables in Jetpack Compose is straightforward and flexible. Depending on the use case, you can:

- Use direct function parameters for simple cases.
- Utilize ViewModel for shared and persistent state.
- Apply `remember` and `mutableStateOf` for managing UI state.
- Pass navigation arguments when working with multiple screens.

By understanding these techniques, you can build scalable, modular, and maintainable Jetpack Compose applications. Happy coding!
