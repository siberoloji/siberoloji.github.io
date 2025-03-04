---
draft: false
title: Integration with Room Database in Jetpack Compose
linkTitle: Integration with Room Database
translationKey: integration-with-room-database-in-jetpack-compose
description: This article explores how to integrate Room database with Jetpack Compose to create a seamless data-driven UI for Android apps.
url: integration-with-room-database-in-jetpack-compose
weight: 390
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Room Database
---
In modern Android development, Jetpack Compose has emerged as a powerful toolkit for building native UIs. Its declarative approach simplifies UI development, making it easier to create dynamic and responsive applications. However, building a robust app often requires more than just a beautiful UI—it also needs efficient data management. This is where **Room**, a part of Android Jetpack, comes into play. Room is a persistence library that provides an abstraction layer over SQLite, making database operations more intuitive and less error-prone.

In this blog post, we’ll explore how to integrate **Room database** with **Jetpack Compose** to create a seamless data-driven UI. We’ll cover the basics of Room, how to set it up, and how to use it effectively in a Compose-based application. By the end, you’ll have a solid understanding of how to combine these two powerful tools to build modern Android apps.

---

## Table of Contents

1. **Introduction to Room and Jetpack Compose**
2. **Setting Up Room in Your Project**
3. **Defining Entities, DAOs, and Database**
4. **Integrating Room with Jetpack Compose**
   - Observing Data with `Flow` and `LiveData`
   - Managing State in Compose
5. **Example: Building a Simple Notes App**
6. **Best Practices for Room and Compose Integration**
7. **Conclusion**

---

## 1. Introduction to Room and Jetpack Compose

### What is Room?

Room is an ORM (Object-Relational Mapping) library that simplifies database interactions in Android. It allows you to map Java or Kotlin objects to database tables, execute queries, and manage database schemas with minimal boilerplate code. Room provides compile-time checks for SQL queries, reducing the risk of runtime errors.

Key components of Room:

- **Entity**: Represents a table in the database.
- **DAO (Data Access Object)**: Contains methods to access the database.
- **Database**: Serves as the main access point to the underlying SQLite database.

### What is Jetpack Compose?

Jetpack Compose is a modern UI toolkit for Android that uses a declarative approach to building user interfaces. Instead of manipulating views imperatively, you describe what the UI should look like for a given state, and Compose handles the rest. This makes UI development faster, more intuitive, and less error-prone.

---

## 2. Setting Up Room in Your Project

To get started, you’ll need to add the necessary dependencies to your project. Open your `build.gradle` file and include the following:

```kotlin
dependencies {
    // Room dependencies
    implementation "androidx.room:room-runtime:2.5.2"
    kapt "androidx.room:room-compiler:2.5.2"
    implementation "androidx.room:room-ktx:2.5.2" // For Kotlin extensions and Coroutine support

    // Jetpack Compose dependencies
    implementation "androidx.compose.ui:ui:1.4.3"
    implementation "androidx.compose.material:material:1.4.3"
    implementation "androidx.compose.runtime:runtime-livedata:1.4.3" // For LiveData support in Compose
    implementation "androidx.lifecycle:lifecycle-viewmodel-compose:2.6.1" // For ViewModel integration
}
```

Sync your project to download the dependencies.

---

## 3. Defining Entities, DAOs, and Database

### Step 1: Define an Entity

An entity represents a table in the database. Let’s create a simple `Note` entity:

```kotlin
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "notes")
data class Note(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val title: String,
    val content: String,
    val timestamp: Long
)
```

### Step 2: Create a DAO

The DAO provides methods to interact with the database. Here’s an example:

```kotlin
import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import kotlinx.coroutines.flow.Flow

@Dao
interface NoteDao {
    @Insert
    suspend fun insert(note: Note)

    @Query("SELECT * FROM notes ORDER BY timestamp DESC")
    fun getAllNotes(): Flow<List<Note>> // Using Flow for reactive updates
}
```

### Step 3: Define the Database

Create a Room database class:

```kotlin
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import android.content.Context

@Database(entities = [Note::class], version = 1, exportSchema = false)
abstract class NoteDatabase : RoomDatabase() {

    abstract fun noteDao(): NoteDao

    companion object {
        @Volatile
        private var INSTANCE: NoteDatabase? = null

        fun getDatabase(context: Context): NoteDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    NoteDatabase::class.java,
                    "note_database"
                ).build()
                INSTANCE = instance
                instance
            }
        }
    }
}
```

---

## 4. Integrating Room with Jetpack Compose

### Observing Data with `Flow` and `LiveData`

Room supports reactive data types like `Flow` and `LiveData`, which are perfect for Compose’s state-driven UI model. In our DAO, we used `Flow` to observe changes in the `notes` table.

To use `Flow` in Compose, you can convert it to a Compose state using the `collectAsState` function:

```kotlin
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import kotlinx.coroutines.flow.collectAsState

@Composable
fun NoteListScreen(noteDao: NoteDao) {
    val notes by noteDao.getAllNotes().collectAsState(initial = emptyList())

    LazyColumn {
        items(notes) { note ->
            NoteItem(note = note)
        }
    }
}
```

### Managing State in Compose

Compose’s state management is crucial for ensuring your UI updates reactively. You can use a `ViewModel` to manage the state and interact with the Room database:

```kotlin
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch

class NoteViewModel(private val noteDao: NoteDao) : ViewModel() {

    val allNotes = noteDao.getAllNotes()

    fun insertNote(title: String, content: String) {
        viewModelScope.launch {
            val note = Note(title = title, content = content, timestamp = System.currentTimeMillis())
            noteDao.insert(note)
        }
    }
}
```

In your Compose UI, you can use the `ViewModel` like this:

```kotlin
@Composable
fun NoteApp(noteViewModel: NoteViewModel = viewModel()) {
    val notes by noteViewModel.allNotes.collectAsState(initial = emptyList())

    NoteListScreen(notes = notes, onAddNote = { title, content ->
        noteViewModel.insertNote(title, content)
    })
}
```

---

## 5. Example: Building a Simple Notes App

Let’s put everything together and build a simple notes app. Here’s the complete code:

### UI Components

```kotlin
@Composable
fun NoteItem(note: Note) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(text = note.title, style = MaterialTheme.typography.h6)
            Text(text = note.content, style = MaterialTheme.typography.body1)
        }
    }
}

@Composable
fun NoteListScreen(notes: List<Note>, onAddNote: (String, String) -> Unit) {
    var title by remember { mutableStateOf("") }
    var content by remember { mutableStateOf("") }

    Column(modifier = Modifier.padding(16.dp)) {
        TextField(
            value = title,
            onValueChange = { title = it },
            label = { Text("Title") }
        )
        TextField(
            value = content,
            onValueChange = { content = it },
            label = { Text("Content") }
        )
        Button(onClick = { onAddNote(title, content) }) {
            Text("Add Note")
        }
        LazyColumn {
            items(notes) { note ->
                NoteItem(note = note)
            }
        }
    }
}
```

### Main Activity

```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val noteDatabase = NoteDatabase.getDatabase(this)
        val noteViewModel = NoteViewModel(noteDatabase.noteDao())

        setContent {
            NoteApp(noteViewModel = noteViewModel)
        }
    }
}
```

---

## 6. Best Practices for Room and Compose Integration

1. **Use `ViewModel` for State Management**: Keep your UI logic separate from your database logic by using `ViewModel`.
2. **Leverage Reactive Streams**: Use `Flow` or `LiveData` to observe database changes and update the UI reactively.
3. **Optimize Database Queries**: Ensure your queries are efficient to avoid performance bottlenecks.
4. **Test Thoroughly**: Write unit tests for your DAOs and integration tests for your Compose UI.

---

## 7. Conclusion

Integrating Room with Jetpack Compose allows you to build modern, data-driven Android applications with ease. By leveraging Room’s powerful database capabilities and Compose’s declarative UI model, you can create apps that are both functional and visually appealing. Whether you’re building a simple notes app or a complex data-intensive application, this combination provides a solid foundation for your development needs.

Start experimenting with Room and Compose today, and unlock the full potential of modern Android development!
