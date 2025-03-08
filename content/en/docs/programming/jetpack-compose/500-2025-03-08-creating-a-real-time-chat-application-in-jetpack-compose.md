---
draft: false
title: Creating a Real-Time Chat Application in Jetpack Compose
linkTitle: Creating a Real-Time Chat Application
translationKey: jetpack-compose-creating-a-real-time-chat-application
description: Learn how to create a real-time chat application using Jetpack Compose, Firebase, and WebSockets.
url: jetpack-compose-creating-a-real-time-chat-application
weight: 500
date: 2025-03-08
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Firebase
  - WebSockets
---
Real-time chat applications have become an integral part of modern communication, enabling instant messaging, collaboration, and engagement. With Jetpack Compose, Android developers can build sleek, efficient, and dynamic UIs with less boilerplate code. This article will guide you through the process of creating a real-time chat application using Jetpack Compose, Firebase, and WebSockets.

## Why Choose Jetpack Compose for a Chat App?

Jetpack Compose, Google's modern UI toolkit for Android, offers several advantages:

- **Declarative UI:** Build UI components with less code.
- **Improved State Management:** Works seamlessly with Kotlin's Flow and LiveData.
- **Better Performance:** Eliminates excessive UI redraws.
- **Ease of Integration:** Works well with Firebase, WebSockets, and REST APIs.

## Prerequisites

Before starting, ensure you have the following:

- **Android Studio** (latest version recommended)
- **Kotlin** language knowledge
- **Jetpack Compose basics**
- **Firebase account** (if using Firebase for real-time communication)
- **WebSockets or Firebase Firestore** for message synchronization

## Setting Up the Project

### Step 1: Create a New Jetpack Compose Project

1. Open Android Studio and create a new project.
2. Choose **Empty Compose Activity**.
3. Name your project, select **Kotlin**, and finish setup.

### Step 2: Add Dependencies

Add the following dependencies in your `build.gradle (Module: app)` file:

```kotlin
dependencies {
    implementation "androidx.compose.ui:ui:1.2.1"
    implementation "androidx.compose.material:material:1.2.1"
    implementation "androidx.compose.ui:ui-tooling-preview:1.2.1"
    implementation "androidx.lifecycle:lifecycle-runtime-ktx:2.4.1"
    implementation "androidx.activity:activity-compose:1.5.1"
    implementation "com.google.firebase:firebase-firestore-ktx:24.1.2"
    implementation "com.google.firebase:firebase-auth-ktx:21.0.1"
    implementation "org.java-websocket:Java-WebSocket:1.5.2" // For WebSockets
}
```

Sync the project to apply dependencies.

## Designing the Chat UI

### Step 3: Creating the Chat Screen

We will define a basic chat screen layout using Jetpack Compose.

```kotlin
@Composable
fun ChatScreen(viewModel: ChatViewModel) {
    val messages by viewModel.messages.collectAsState()
    var messageText by remember { mutableStateOf("") }
    
    Column(modifier = Modifier.fillMaxSize()) {
        LazyColumn(modifier = Modifier.weight(1f)) {
            items(messages) { message ->
                ChatBubble(message)
            }
        }
        
        Row(modifier = Modifier.padding(8.dp)) {
            TextField(
                value = messageText,
                onValueChange = { messageText = it },
                modifier = Modifier.weight(1f),
                placeholder = { Text("Type a message...") }
            )
            Button(onClick = {
                viewModel.sendMessage(messageText)
                messageText = ""
            }) {
                Text("Send")
            }
        }
    }
}
```

### Step 4: Creating a Chat Bubble Component

Define a `ChatBubble` composable function for styling chat messages:

```kotlin
@Composable
fun ChatBubble(message: ChatMessage) {
    Box(
        modifier = Modifier
            .padding(8.dp)
            .background(if (message.isMine) Color.Blue else Color.Gray, shape = RoundedCornerShape(8.dp))
            .padding(12.dp)
    ) {
        Text(text = message.text, color = Color.White)
    }
}
```

## Implementing Real-Time Communication

### Step 5: Setting Up Firebase Firestore for Real-Time Messages

To use Firebase Firestore for message synchronization:

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Add an **Android app** and connect Firebase to your project.
3. Enable Firestore in the Firebase console.
4. Add Firestore rules:

```json
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /messages/{message} {
      allow read, write: if true;
    }
  }
}
```

5. Implement Firestore integration in `ChatViewModel`:

```kotlin
class ChatViewModel : ViewModel() {
    private val db = Firebase.firestore
    private val _messages = MutableStateFlow<List<ChatMessage>>(emptyList())
    val messages: StateFlow<List<ChatMessage>> get() = _messages

    init {
        db.collection("messages").orderBy("timestamp").addSnapshotListener { snapshot, _ ->
            snapshot?.let {
                _messages.value = it.documents.map { doc ->
                    ChatMessage(doc.getString("text") ?: "", doc.getBoolean("isMine") ?: false)
                }
            }
        }
    }

    fun sendMessage(text: String) {
        val message = hashMapOf(
            "text" to text,
            "isMine" to true,
            "timestamp" to System.currentTimeMillis()
        )
        db.collection("messages").add(message)
    }
}
```

### Step 6: Using WebSockets for Instant Messaging (Optional)

If you prefer WebSockets for real-time messaging:

```kotlin
class WebSocketManager {
    private val client = WebSocketClient(URI("wss://yourserver.com/chat"))
    
    fun connect() {
        client.connect()
    }

    fun sendMessage(text: String) {
        client.send(text)
    }
}
```

## Running the Application

Now, build and run your application. Your real-time chat should display messages instantly when sent and received.

## Conclusion

In this guide, we explored how to create a real-time chat application using Jetpack Compose, Firebase Firestore, and WebSockets. By leveraging Jetpack Compose's declarative UI approach and Firebase's real-time capabilities, you can build a smooth and interactive chat experience for your users.

Enhance the app further by adding user authentication, typing indicators, and media sharing capabilities!
