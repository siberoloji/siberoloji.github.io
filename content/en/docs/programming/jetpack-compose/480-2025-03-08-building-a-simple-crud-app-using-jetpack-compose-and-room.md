---
draft: false
title: Building a Simple CRUD App Using Jetpack Compose and Room
linkTitle: Building a Simple CRUD App Using Jetpack Compose and Room
translationKey: building-a-simple-crud-app-using-jetpack-compose-and-room
description: Learn how to build a simple CRUD app using Jetpack Compose and Room
url: building-a-simple-crud-app-using-jetpack-compose-and-room
weight: 480
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Room
  - CRUD
---
Jetpack Compose is Google's modern UI toolkit for building native Android applications with a declarative approach. When developing Android applications, managing data efficiently is crucial. Room, a persistence library from Google, provides an abstraction layer over SQLite, allowing developers to interact with the database easily.

In this guide, we'll walk through building a simple CRUD (Create, Read, Update, Delete) app using Jetpack Compose and Room. We'll cover setting up Room, creating a repository, implementing a ViewModel, and designing the UI with Jetpack Compose.

---

## Prerequisites

Before getting started, ensure you have the following:

- Android Studio (latest stable version)
- Kotlin knowledge
- Familiarity with Jetpack Compose

---

## Step 1: Add Dependencies

To use Jetpack Compose and Room, add the following dependencies to your `build.gradle.kts` file:

```kotlin
dependencies {
    implementation("androidx.compose.ui:ui:1.4.0")
    implementation("androidx.compose.material:material:1.4.0")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.5.1")
    implementation("androidx.room:room-runtime:2.4.3")
    kapt("androidx.room:room-compiler:2.4.3")
    implementation("androidx.room:room-ktx:2.4.3")
}
```

Don't forget to apply the Kotlin annotation processor plugin:

```kotlin
plugins {
    id("kotlin-kapt")
}
```

---

## Step 2: Define the Entity

Room uses entities to define database tables. Let's create a `User` entity:

```kotlin
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "user_table")
data class User(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val name: String,
    val email: String
)
```

This creates a `user_table` with columns for `id`, `name`, and `email`.

---

## Step 3: Create the DAO (Data Access Object)

A DAO provides methods to interact with the database:

```kotlin
import androidx.room.*
import kotlinx.coroutines.flow.Flow

@Dao
interface UserDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertUser(user: User)

    @Update
    suspend fun updateUser(user: User)

    @Delete
    suspend fun deleteUser(user: User)

    @Query("SELECT * FROM user_table ORDER BY id ASC")
    fun getAllUsers(): Flow<List<User>>
}
```

The `Flow<List<User>>` allows us to observe changes in the database reactively.

---

## Step 4: Set Up the Database

Create a Room database class:

```kotlin
import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = [User::class], version = 1, exportSchema = false)
abstract class UserDatabase : RoomDatabase() {
    abstract fun userDao(): UserDao

    companion object {
        @Volatile
        private var INSTANCE: UserDatabase? = null

        fun getDatabase(context: Context): UserDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    UserDatabase::class.java,
                    "user_database"
                ).build()
                INSTANCE = instance
                instance
            }
        }
    }
}
```

This ensures only one instance of the database is created.

---

## Step 5: Create a Repository

A repository abstracts access to the database:

```kotlin
import kotlinx.coroutines.flow.Flow

class UserRepository(private val userDao: UserDao) {
    val allUsers: Flow<List<User>> = userDao.getAllUsers()

    suspend fun insert(user: User) {
        userDao.insertUser(user)
    }

    suspend fun update(user: User) {
        userDao.updateUser(user)
    }

    suspend fun delete(user: User) {
        userDao.deleteUser(user)
    }
}
```

---

## Step 6: Implement the ViewModel

Use `ViewModel` to manage UI-related data:

```kotlin
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch

class UserViewModel(private val repository: UserRepository) : ViewModel() {
    val allUsers = repository.allUsers

    fun insert(user: User) {
        viewModelScope.launch { repository.insert(user) }
    }

    fun update(user: User) {
        viewModelScope.launch { repository.update(user) }
    }

    fun delete(user: User) {
        viewModelScope.launch { repository.delete(user) }
    }
}
```

---

## Step 7: Create the UI with Jetpack Compose

Now, let's build a simple UI:

```kotlin
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.lifecycle.viewmodel.compose.viewModel
import kotlinx.coroutines.launch

@Composable
fun UserScreen(viewModel: UserViewModel = viewModel()) {
    val users by viewModel.allUsers.collectAsState(initial = emptyList())
    val scope = rememberCoroutineScope()
    var name by remember { mutableStateOf("") }
    var email by remember { mutableStateOf("") }

    Column(modifier = Modifier.padding(16.dp)) {
        TextField(value = name, onValueChange = { name = it }, label = { Text("Name") })
        TextField(value = email, onValueChange = { email = it }, label = { Text("Email") })
        Button(onClick = {
            scope.launch { viewModel.insert(User(name = name, email = email)) }
        }) {
            Text("Add User")
        }
        users.forEach { user ->
            Row {
                Text(user.name)
                Button(onClick = { scope.launch { viewModel.delete(user) } }) {
                    Text("Delete")
                }
            }
        }
    }
}
```

---

## Step 8: Set Up the MainActivity

Finally, integrate everything in `MainActivity`:

```kotlin
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.lifecycle.ViewModelProvider

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val database = UserDatabase.getDatabase(applicationContext)
        val repository = UserRepository(database.userDao())
        val viewModel = ViewModelProvider(this, UserViewModelFactory(repository))[UserViewModel::class.java]

        setContent {
            UserScreen(viewModel = viewModel)
        }
    }
}
```

---

## Conclusion

By following this guide, you've built a simple CRUD app using Jetpack Compose and Room. This demonstrates how to efficiently handle data persistence in modern Android applications. You can enhance this by adding more features such as search functionality, UI improvements, or even integrating a remote API.
