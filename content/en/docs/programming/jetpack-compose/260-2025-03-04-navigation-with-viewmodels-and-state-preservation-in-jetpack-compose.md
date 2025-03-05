---
draft: false
title: Navigation with ViewModels and State Preservation in Jetpack Compose
linkTitle: Navigation with ViewModels and State Preservation
translationKey: navigation-with-viewmodels-and-state-preservation-in-jetpack-compose
description: Navigating through Jetpack Compose apps with ViewModels and state preservation
url: navigation-with-viewmodels-and-state-preservation-in-jetpack-compose
weight: 260
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Navigation with ViewModels
  - State Preservation
---
Jetpack Compose has revolutionized Android UI development by providing a declarative UI framework that simplifies state management and UI updates. However, managing navigation and preserving state across composable screens remains a challenge, especially in dynamic applications where users interact with multiple screens and data persists across configuration changes. In this article, we’ll explore how to navigate using ViewModels and effectively preserve state in Jetpack Compose applications.

---

## **Understanding Navigation in Jetpack Compose**

Jetpack Compose provides an official navigation library, `androidx.navigation.compose`, to manage navigation between composables. Unlike the traditional `Fragment`-based navigation system, Jetpack Compose’s navigation is fully declarative and works seamlessly with the Compose UI paradigm.

To add navigation to a Jetpack Compose application, we use the `NavHost` and `NavController`:

```kotlin
@Composable
fun MyAppNavHost(navController: NavHostController) {
    NavHost(navController = navController, startDestination = "home") {
        composable("home") { HomeScreen(navController) }
        composable("details/{itemId}", arguments = listOf(navArgument("itemId") { type = NavType.StringType })) {
            backStackEntry ->
            val itemId = backStackEntry.arguments?.getString("itemId")
            DetailScreen(navController, itemId)
        }
    }
}
```

Here, `NavHost` defines the app’s navigation graph. Each composable screen is associated with a route, and the `NavController` handles navigation actions.

### **Navigating Between Screens**

To navigate between screens, we call `navController.navigate()`:

```kotlin
fun navigateToDetails(navController: NavController, itemId: String) {
    navController.navigate("details/$itemId")
}
```

While this works, handling state correctly is crucial for a seamless user experience, especially when dealing with configuration changes.

---

## **Using ViewModels for State Management**

ViewModels are an essential part of Android’s architecture components, helping to manage and retain UI-related data across configuration changes such as screen rotations.

### **Integrating ViewModels with Navigation**

In Jetpack Compose, we associate a `ViewModel` with a navigation graph or specific composable screen using `hiltViewModel()` (for Hilt DI) or `viewModel()`.

#### **Example: HomeViewModel**

```kotlin
class HomeViewModel : ViewModel() {
    private val _items = MutableLiveData<List<String>>(listOf("Item1", "Item2", "Item3"))
    val items: LiveData<List<String>> = _items
}
```

#### **Example: DetailsViewModel**

```kotlin
class DetailsViewModel(savedStateHandle: SavedStateHandle) : ViewModel() {
    val itemId: String? = savedStateHandle["itemId"]
}
```

To retrieve a ViewModel inside a composable:

```kotlin
@Composable
fun HomeScreen(navController: NavController, viewModel: HomeViewModel = viewModel()) {
    val items by viewModel.items.observeAsState(emptyList())
    LazyColumn {
        items(items) { item ->
            Text(
                text = item,
                modifier = Modifier.clickable {
                    navController.navigate("details/$item")
                }
            )
        }
    }
}
```

In `DetailScreen`, we retrieve the `DetailsViewModel` with `hiltViewModel()` or `viewModel()`:

```kotlin
@Composable
fun DetailScreen(navController: NavController, itemId: String?, viewModel: DetailsViewModel = viewModel()) {
    Text(text = "Details for item: ${viewModel.itemId}")
}
```

Here, `savedStateHandle` ensures that the `itemId` remains available even if the screen is recreated.

---

## **Preserving UI State in Jetpack Compose**

While ViewModels help with persisting data across configuration changes, Jetpack Compose also offers built-in state management mechanisms like `rememberSaveable` to persist UI state across recompositions.

### **Using**``

`rememberSaveable` stores UI state across configuration changes:

```kotlin
@Composable
fun CounterScreen() {
    var count by rememberSaveable { mutableStateOf(0) }
    Column {
        Text("Counter: $count")
        Button(onClick = { count++ }) {
            Text("Increase")
        }
    }
}
```

Even if the screen is rotated, the `count` value persists.

### **Using ViewModel for Complex State**

For complex UI logic, prefer ViewModels over `rememberSaveable`.

```kotlin
class CounterViewModel : ViewModel() {
    private val _count = MutableLiveData(0)
    val count: LiveData<Int> get() = _count
    
    fun increaseCount() {
        _count.value = (_count.value ?: 0) + 1
    }
}
```

In the composable:

```kotlin
@Composable
fun CounterScreen(viewModel: CounterViewModel = viewModel()) {
    val count by viewModel.count.observeAsState(0)
    Column {
        Text("Counter: $count")
        Button(onClick = { viewModel.increaseCount() }) {
            Text("Increase")
        }
    }
}
```

---

## **Best Practices for Navigation and State Management**

1. **Use ViewModels for Business Logic**

   - Store and manage UI-related data inside ViewModels rather than composables.
   - Use `savedStateHandle` to retrieve arguments from the navigation system.

2. **Use **``** for UI State**

   - Prefer `rememberSaveable` for UI elements like text field inputs, switch states, or scroll positions.

3. **Scope ViewModels to Navigation Graphs**

   - Attach ViewModels to navigation graphs rather than single composables when state should persist across multiple screens.
   - Example: `hiltViewModel(navController.getBackStackEntry("routeName"))` ensures shared state across screens within the same navigation graph.

4. **Avoid Passing Large Data via Navigation Arguments**

   - Instead of passing full objects, pass only the necessary IDs and fetch additional details from a repository inside a ViewModel.

5. **Leverage Dependency Injection (DI)**

   - Use Hilt to inject dependencies into ViewModels for cleaner code and better testability.

---

## **Conclusion**

Handling navigation with ViewModels and state preservation in Jetpack Compose is crucial for building robust Android applications. The `NavController`, `ViewModel`, and `rememberSaveable` work together to ensure that state is properly maintained across recompositions and configuration changes. By following best practices, you can create seamless and efficient navigation experiences in your Compose-based apps.

Jetpack Compose’s declarative paradigm brings new ways to manage UI and state, and mastering these techniques will help you build modern, responsive, and user-friendly applications.
