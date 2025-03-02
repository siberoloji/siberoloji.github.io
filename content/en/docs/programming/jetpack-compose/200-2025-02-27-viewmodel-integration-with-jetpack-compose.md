---
draft: false
title: ViewModel Integration with Jetpack Compose
linkTitle: ViewModel Integration with Jetpack Compose
translationKey: viewmodel-integration-with-jetpack-compose
description: Learn how to effectively integrate ViewModels with Jetpack Compose, examine best practices, and look at practical examples to help you implement this pattern in your own projects.
url: viewmodel-integration-with-jetpack-compose
weight: 200
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - ViewModel
---
As Android development continues to evolve, the combination of Jetpack Compose for UI and ViewModel for state management has become a powerful pattern for building robust, maintainable applications. This integration provides a clean separation of concerns while leveraging the reactive nature of Compose to create responsive user interfaces. In this post, we'll explore how to effectively integrate ViewModels with Jetpack Compose, examine best practices, and look at practical examples to help you implement this pattern in your own projects.

## Understanding the Core Components

Before diving into integration specifics, let's briefly review the key components:

### Jetpack Compose

Jetpack Compose is Android's modern declarative UI toolkit. Instead of manipulating UI elements imperatively, Compose lets you describe what your UI should look like based on current state, and the framework handles the UI updates when state changes. This reactive approach simplifies UI development but requires thoughtful state management.

### ViewModel

Part of Android Architecture Components, ViewModel is designed to store and manage UI-related data in a lifecycle-conscious way. ViewModels survive configuration changes like screen rotations, making them ideal for preserving state. They also help separate business logic from UI logic, improving testability and maintainability.

## Why Integrate ViewModels with Compose?

The combination of these technologies offers several advantages:

1. **Clear separation of concerns**: UI rendering in Compose, business logic in ViewModels
2. **Lifecycle awareness**: ViewModels handle Android lifecycle complexities so Compose doesn't have to
3. **State restoration**: ViewModels preserve state during configuration changes
4. **Testability**: Both components can be tested independently
5. **Scalability**: This pattern scales well as application complexity grows

## Setting Up a ViewModel for Compose

Let's start with creating a basic ViewModel that we'll use with Compose:

```kotlin
class CounterViewModel : ViewModel() {
    // State as StateFlow for reactivity
    private val _count = MutableStateFlow(0)
    val count: StateFlow<Int> = _count.asStateFlow()
    
    // Event handlers
    fun increment() {
        _count.value += 1
    }
    
    fun decrement() {
        if (_count.value > 0) {
            _count.value -= 1
        }
    }
}
```

This simple ViewModel manages a counter with increment and decrement functions. Note that we're using `StateFlow` to hold our state, which works particularly well with Compose.

## Accessing ViewModels in Compose

Compose provides a dedicated API for accessing ViewModels within composable functions. The `androidx.lifecycle:lifecycle-viewmodel-compose` library contains the necessary utilities:

```kotlin
dependencies {
    implementation "androidx.lifecycle:lifecycle-viewmodel-compose:2.6.2"
}
```

With this dependency, you can use the `viewModel()` function to obtain a ViewModel instance:

```kotlin
@Composable
fun CounterScreen() {
    // Get ViewModel instance
    val viewModel: CounterViewModel = viewModel()
    
    // UI implementation
    // ...
}
```

## Collecting State from ViewModels

Compose needs to observe the ViewModel's state to react to changes. The `collectAsState()` extension function converts a `Flow` into a Compose `State` object:

```kotlin
@Composable
fun CounterScreen() {
    val viewModel: CounterViewModel = viewModel()
    
    // Collect the state from the StateFlow
    val count by viewModel.count.collectAsState()
    
    CounterContent(
        count = count,
        onIncrement = viewModel::increment,
        onDecrement = viewModel::decrement
    )
}

@Composable
fun CounterContent(
    count: Int,
    onIncrement: () -> Unit,
    onDecrement: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Count: $count",
            style = MaterialTheme.typography.headlineMedium
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Button(onClick = onDecrement) {
                Text("-")
            }
            
            Button(onClick = onIncrement) {
                Text("+")
            }
        }
    }
}
```

Notice how we've separated the composable that receives the ViewModel (`CounterScreen`) from the actual UI implementation (`CounterContent`). This pattern enhances testability and reusability.

## Advanced State Management

As applications grow more complex, you'll likely need more sophisticated state management. Let's explore some advanced patterns:

### Handling UI State with Sealed Classes

Instead of exposing multiple state flows, you can encapsulate the entire UI state in a single object:

```kotlin
// Define UI state
data class TaskListUiState(
    val tasks: List<Task> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null
)

class TaskViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(TaskListUiState())
    val uiState: StateFlow<TaskListUiState> = _uiState.asStateFlow()
    
    init {
        loadTasks()
    }
    
    private fun loadTasks() {
        viewModelScope.launch {
            try {
                _uiState.update { it.copy(isLoading = true) }
                val tasks = taskRepository.getTasks()
                _uiState.update { it.copy(tasks = tasks, isLoading = false) }
            } catch (e: Exception) {
                _uiState.update { 
                    it.copy(error = e.message, isLoading = false)
                }
            }
        }
    }
    
    // Other task-related functions
}
```

Then in your Compose UI:

```kotlin
@Composable
fun TaskListScreen() {
    val viewModel: TaskViewModel = viewModel()
    val uiState by viewModel.uiState.collectAsState()
    
    when {
        uiState.isLoading -> LoadingIndicator()
        uiState.error != null -> ErrorMessage(uiState.error!!)
        else -> TaskList(tasks = uiState.tasks)
    }
}
```

This approach creates a single source of truth for UI state and makes state transitions more explicit.

### Managing Side Effects

ViewModels often need to communicate one-time events to the UI, such as navigation events or snackbar messages. `SharedFlow` works well for these cases:

```kotlin
class LoginViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(LoginUiState())
    val uiState: StateFlow<LoginUiState> = _uiState.asStateFlow()
    
    private val _events = MutableSharedFlow<LoginEvent>()
    val events: SharedFlow<LoginEvent> = _events.asSharedFlow()
    
    fun login(username: String, password: String) {
        viewModelScope.launch {
            try {
                _uiState.update { it.copy(isLoading = true) }
                val result = authRepository.login(username, password)
                _uiState.update { it.copy(isLoading = false) }
                _events.emit(LoginEvent.NavigateToHome)
            } catch (e: Exception) {
                _uiState.update { it.copy(isLoading = false) }
                _events.emit(LoginEvent.ShowError(e.message ?: "Unknown error"))
            }
        }
    }
}

sealed class LoginEvent {
    object NavigateToHome : LoginEvent()
    data class ShowError(val message: String) : LoginEvent()
}
```

In Compose, collect these events using `LaunchedEffect`:

```kotlin
@Composable
fun LoginScreen(
    onNavigateToHome: () -> Unit,
    viewModel: LoginViewModel = viewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    // Collect one-time events
    LaunchedEffect(key1 = true) {
        viewModel.events.collect { event ->
            when (event) {
                is LoginEvent.NavigateToHome -> onNavigateToHome()
                is LoginEvent.ShowError -> {
                    // Show error message
                }
            }
        }
    }
    
    // Login form UI
    // ...
}
```

## Sharing ViewModels Across Composables

Sometimes you need to share a ViewModel between multiple composables. The `viewModel()` function provides a `viewModelStoreOwner` parameter for this purpose:

```kotlin
@Composable
fun ParentScreen(navController: NavController) {
    // Create ViewModel at this level
    val sharedViewModel: SharedViewModel = viewModel()
    
    // Pass to child screens via navController or direct composition
    ChildScreen(sharedViewModel)
}

@Composable
fun ChildScreen(sharedViewModel: SharedViewModel) {
    // Use the shared ViewModel
    val state by sharedViewModel.state.collectAsState()
    // ...
}
```

For navigation components, you can use `hiltViewModel()` or the navigation-compose artifacts to share ViewModels across destinations.

## Testing ViewModels with Compose

Testing is simplified by the separation of concerns this pattern provides:

### Testing ViewModels

Test ViewModels independently of Compose using standard ViewModel testing approaches:

```kotlin
@Test
fun `increment should increase count by one`() = runTest {
    // Arrange
    val viewModel = CounterViewModel()
    
    // Act
    viewModel.increment()
    
    // Assert
    assertThat(viewModel.count.value).isEqualTo(1)
}
```

### Testing Composables

Test Compose UI components independently using Compose testing libraries:

```kotlin
@Test
fun counterContent_displaysCountAndButtons() {
    // Arrange
    val count = 5
    
    // Act
    composeTestRule.setContent {
        CounterContent(
            count = count,
            onIncrement = {},
            onDecrement = {}
        )
    }
    
    // Assert
    composeTestRule.onNodeWithText("Count: 5").assertExists()
    composeTestRule.onNodeWithText("+").assertExists()
    composeTestRule.onNodeWithText("-").assertExists()
}
```

## Best Practices

Based on industry experience, here are some best practices for integrating ViewModels with Compose:

1. **Keep ViewModels focused**: Each ViewModel should handle a specific screen or feature
2. **Use StateFlow for UI state**: StateFlow works well with Compose's reactive model
3. **Separate state collection from UI rendering**: Create stateless composables that receive data and callbacks
4. **Handle side effects with SharedFlow or Channel**: One-time events should use flow-based solutions
5. **Consider state hoisting for simpler cases**: Not every UI element needs a ViewModel
6. **Use preview parameters**: Create preview functions with sample data for your composables
7. **Consider Dependency Injection**: Use Hilt or other DI frameworks to provide ViewModels with dependencies

## Real-World Example: A Task Management App

Let's tie everything together with a more complete example of a task management feature:

```kotlin
// Task data class
data class Task(
    val id: String,
    val title: String,
    val isCompleted: Boolean
)

// UI state representation
data class TaskListUiState(
    val tasks: List<Task> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null,
    val filterType: FilterType = FilterType.ALL
)

enum class FilterType { ALL, ACTIVE, COMPLETED }

// Events for one-time actions
sealed class TaskEvent {
    data class ShowSnackbar(val message: String) : TaskEvent()
    data class NavigateToDetail(val taskId: String) : TaskEvent()
}

// ViewModel implementation
class TaskViewModel(
    private val taskRepository: TaskRepository
) : ViewModel() {
    private val _uiState = MutableStateFlow(TaskListUiState())
    val uiState: StateFlow<TaskListUiState> = _uiState.asStateFlow()
    
    private val _events = MutableSharedFlow<TaskEvent>()
    val events: SharedFlow<TaskEvent> = _events.asSharedFlow()
    
    init {
        loadTasks()
    }
    
    fun loadTasks() {
        viewModelScope.launch {
            try {
                _uiState.update { it.copy(isLoading = true) }
                val tasks = taskRepository.getTasks()
                _uiState.update { it.copy(tasks = tasks, isLoading = false) }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isLoading = false) }
            }
        }
    }
    
    fun toggleTaskCompletion(taskId: String) {
        viewModelScope.launch {
            try {
                val currentState = _uiState.value
                val task = currentState.tasks.find { it.id == taskId } ?: return@launch
                val updatedTask = task.copy(isCompleted = !task.isCompleted)
                
                taskRepository.updateTask(updatedTask)
                
                // Update the local state immediately for responsiveness
                val updatedTasks = currentState.tasks.map { 
                    if (it.id == taskId) updatedTask else it 
                }
                _uiState.update { it.copy(tasks = updatedTasks) }
                
                _events.emit(TaskEvent.ShowSnackbar("Task updated"))
            } catch (e: Exception) {
                _events.emit(TaskEvent.ShowSnackbar("Failed to update task"))
            }
        }
    }
    
    fun setFilterType(filterType: FilterType) {
        _uiState.update { it.copy(filterType = filterType) }
    }
    
    fun getFilteredTasks(): List<Task> {
        val currentState = _uiState.value
        return when (currentState.filterType) {
            FilterType.ALL -> currentState.tasks
            FilterType.ACTIVE -> currentState.tasks.filter { !it.isCompleted }
            FilterType.COMPLETED -> currentState.tasks.filter { it.isCompleted }
        }
    }
    
    fun navigateToTaskDetail(taskId: String) {
        viewModelScope.launch {
            _events.emit(TaskEvent.NavigateToDetail(taskId))
        }
    }
}

// Main task list screen composable
@Composable
fun TaskListScreen(
    onNavigateToDetail: (String) -> Unit,
    viewModel: TaskViewModel = viewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    // Handle one-time events
    LaunchedEffect(true) {
        viewModel.events.collect { event ->
            when (event) {
                is TaskEvent.ShowSnackbar -> {
                    // Show snackbar
                }
                is TaskEvent.NavigateToDetail -> {
                    onNavigateToDetail(event.taskId)
                }
            }
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Tasks") },
                actions = {
                    // Filter menu
                    // ...
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = { /* Add new task */ }) {
                Icon(Icons.Default.Add, contentDescription = "Add Task")
            }
        }
    ) { padding ->
        Box(modifier = Modifier.padding(padding)) {
            when {
                uiState.isLoading -> {
                    CircularProgressIndicator(
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
                uiState.error != null -> {
                    ErrorMessage(
                        message = uiState.error!!,
                        onRetry = viewModel::loadTasks,
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
                uiState.tasks.isEmpty() -> {
                    EmptyStateMessage(
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
                else -> {
                    TaskList(
                        tasks = viewModel.getFilteredTasks(),
                        onTaskClick = viewModel::navigateToTaskDetail,
                        onTaskCheckChange = viewModel::toggleTaskCompletion
                    )
                }
            }
        }
    }
}

// Stateless task list UI
@Composable
fun TaskList(
    tasks: List<Task>,
    onTaskClick: (String) -> Unit,
    onTaskCheckChange: (String) -> Unit
) {
    LazyColumn {
        items(tasks, key = { it.id }) { task ->
            TaskItem(
                task = task,
                onClick = { onTaskClick(task.id) },
                onCheckChange = { onTaskCheckChange(task.id) }
            )
            Divider()
        }
    }
}

// Individual task item
@Composable
fun TaskItem(
    task: Task,
    onClick: () -> Unit,
    onCheckChange: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(16.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Checkbox(
            checked = task.isCompleted,
            onCheckedChange = { onCheckChange() }
        )
        
        Text(
            text = task.title,
            style = MaterialTheme.typography.bodyLarge,
            textDecoration = if (task.isCompleted) 
                TextDecoration.LineThrough else TextDecoration.None,
            modifier = Modifier
                .padding(start = 16.dp)
                .weight(1f)
        )
    }
}
```

## Conclusion

Integrating ViewModels with Jetpack Compose creates a powerful pattern for building modern Android applications. The ViewModel handles business logic and state management, while Compose efficiently renders the UI based on that state. This separation of concerns leads to code that is more maintainable, testable, and scalable.

As you implement this pattern in your own applications, remember that the goal is to create a unidirectional data flow: state flows down from the ViewModel to the UI, and events flow up from the UI to the ViewModel. This clarity makes your code easier to reason about and debug.

Whether you're building a simple counter app or a complex task management system, the principles remain the same. Start with a clear understanding of your UI state, model it appropriately in your ViewModel, and let Compose handle the rendering. With this approach, you'll be well on your way to creating robust Android applications that can evolve with your users' needs.
