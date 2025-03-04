---
draft: false
title: Working with Text Fields and Form Validation in Jetpack Compose
linkTitle: Working with Text Fields and Form Validation
translationKey: working-with-text-fields-and-form-validation-in-jetpack-compose
description: Learn how to work with text fields and form validation in Jetpack Compose.
url: working-with-text-fields-and-form-validation-in-jetpack-compose
weight: 230
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Text Fields
  - Form Validation
---
Jetpack Compose is revolutionizing the way Android developers build user interfaces by making UI development more declarative, concise, and intuitive. One crucial aspect of many Android applications is the use of text fields and form validation. In this blog post, we’ll explore how to work with text fields in Jetpack Compose, implement form validation, and provide a better user experience by handling errors effectively.

## Introduction to Text Fields in Jetpack Compose

Text fields are essential components in most applications, allowing users to input information. Jetpack Compose provides the `TextField` and `OutlinedTextField` composables for collecting text input.

Here’s a basic example of a simple text field:

```kotlin
@Composable
fun SimpleTextField() {
    var text by remember { mutableStateOf("") }

    TextField(
        value = text,
        onValueChange = { text = it },
        label = { Text("Enter text") }
    )
}
```

### Outlined TextField

The `OutlinedTextField` provides an alternative UI style with a border around the input field:

```kotlin
@Composable
fun OutlinedTextFieldExample() {
    var text by remember { mutableStateOf("") }

    OutlinedTextField(
        value = text,
        onValueChange = { text = it },
        label = { Text("Enter text") }
    )
}
```

## Handling User Input with State Management

In Jetpack Compose, user input is managed using state. The `remember` function helps store and update the text state within a composable:

```kotlin
@Composable
fun StatefulTextField() {
    var text by remember { mutableStateOf("") }
    
    Column(modifier = Modifier.padding(16.dp)) {
        TextField(
            value = text,
            onValueChange = { text = it },
            label = { Text("Enter your name") }
        )
        Text("You entered: $text")
    }
}
```

## Implementing Form Validation

Form validation ensures that users input valid data before submitting a form. Let’s take an example where we validate an email input.

```kotlin
@Composable
fun EmailValidationForm() {
    var email by remember { mutableStateOf("") }
    var error by remember { mutableStateOf(false) }

    Column(modifier = Modifier.padding(16.dp)) {
        TextField(
            value = email,
            onValueChange = {
                email = it
                error = !android.util.Patterns.EMAIL_ADDRESS.matcher(it).matches()
            },
            label = { Text("Email") },
            isError = error,
            modifier = Modifier.fillMaxWidth()
        )
        if (error) {
            Text("Invalid email address", color = Color.Red, fontSize = 12.sp)
        }
    }
}
```

### Explanation

- The `error` state determines whether the entered email is valid.
- We use `Patterns.EMAIL_ADDRESS.matcher(it).matches()` to check if the email format is correct.
- If the email is invalid, an error message is displayed.

## Creating a Complete Form with Multiple Validations

Let’s build a form with email and password fields and add validation logic for both.

```kotlin
@Composable
fun LoginForm() {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var emailError by remember { mutableStateOf(false) }
    var passwordError by remember { mutableStateOf(false) }
    
    Column(modifier = Modifier.padding(16.dp)) {
        TextField(
            value = email,
            onValueChange = {
                email = it
                emailError = !android.util.Patterns.EMAIL_ADDRESS.matcher(it).matches()
            },
            label = { Text("Email") },
            isError = emailError,
            modifier = Modifier.fillMaxWidth()
        )
        if (emailError) {
            Text("Invalid email address", color = Color.Red, fontSize = 12.sp)
        }
        
        Spacer(modifier = Modifier.height(8.dp))

        TextField(
            value = password,
            onValueChange = {
                password = it
                passwordError = it.length < 6
            },
            label = { Text("Password") },
            isError = passwordError,
            visualTransformation = PasswordVisualTransformation(),
            modifier = Modifier.fillMaxWidth()
        )
        if (passwordError) {
            Text("Password must be at least 6 characters", color = Color.Red, fontSize = 12.sp)
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Button(
            onClick = { /* Handle login */ },
            enabled = !emailError && !passwordError && email.isNotEmpty() && password.isNotEmpty()
        ) {
            Text("Login")
        }
    }
}
```

### Enhancements

- **Real-time validation:** The errors update as the user types.
- **Button disabling logic:** The login button is disabled until valid inputs are provided.
- **Password masking:** `PasswordVisualTransformation()` ensures the password is not visible.

## Improving UX with Keyboard Actions and Focus Management

To improve the form’s usability, we can manage focus transitions when pressing Enter.

```kotlin
@Composable
fun EnhancedLoginForm() {
    val focusManager = LocalFocusManager.current
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    
    Column(modifier = Modifier.padding(16.dp)) {
        TextField(
            value = email,
            onValueChange = { email = it },
            label = { Text("Email") },
            keyboardOptions = KeyboardOptions.Default.copy(imeAction = ImeAction.Next),
            keyboardActions = KeyboardActions(onNext = { focusManager.moveFocus(FocusDirection.Down) }),
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        TextField(
            value = password,
            onValueChange = { password = it },
            label = { Text("Password") },
            keyboardOptions = KeyboardOptions.Default.copy(imeAction = ImeAction.Done),
            keyboardActions = KeyboardActions(onDone = { focusManager.clearFocus() }),
            visualTransformation = PasswordVisualTransformation(),
            modifier = Modifier.fillMaxWidth()
        )
    }
}
```

### Key Enhancements

- `ImeAction.Next` moves focus to the next field.
- `ImeAction.Done` hides the keyboard after input.
- `LocalFocusManager` handles focus transitions smoothly.

## Conclusion

Jetpack Compose makes working with text fields and form validation straightforward and efficient. By leveraging state management, error handling, and focus control, you can create polished, user-friendly forms. As Compose evolves, these practices will help you build robust and interactive applications effortlessly.

Happy coding with Jetpack Compose!
