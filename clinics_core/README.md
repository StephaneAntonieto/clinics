# Clinics Core

The `clinics_core` library is a Dart package that provides foundational utilities, business logic, and reusable components for building clinic management applications. It is designed to integrate seamlessly with Flutter projects.

## Features

- **Functional Programming Utilities**: Includes `Either`, `Unit`, and `Nil` for functional programming paradigms.
- **REST Client**: A customizable `RestClient` built on `dio` with support for authentication and interceptors.
- **State Management**: Utilities for managing asynchronous states and overlay loaders.
- **Messaging System**: Tools for displaying success, error, and informational messages.
- **Constants**: Centralized storage for application-wide constants.

## Directory Overview

### `lib/src/fp`

- **`either.dart`**: Provides the `Either` class for functional error handling.
- **`unit.dart`**: Represents a unit type for functional programming.
- **`nil.dart`**: Represents a `Nil` type for functional programming.

### `lib/src/restClient`

- **`rest_client.dart`**: A REST client with built-in support for authentication and logging.
- **`interceptors/auth_interceptors.dart`**: Handles authentication headers using `SharedPreferences`.

### `lib/src/helpers`

- **`messages.dart`**: Provides utilities for showing top snack bar messages and managing message states.

### `lib/src/loader`

- **`clinics_loader.dart`**: A customizable loader widget for asynchronous operations.

### `lib/src/constants`

- **`local_storage_constants.dart`**: Defines constants for local storage keys.

### `lib/src`

- **`clinics_core_config.dart`**: A configuration class for setting up the core module in a Flutter application.

## Installation

1. Add the following dependency to your `pubspec.yaml`:
   ```yaml
   dependencies:
     clinics_core:
       path: ../clinics_core
   ```
2. Run `flutter pub get` to fetch the dependencies.

## Usage

### Importing the Library

To use the library, import the desired modules:

```dart
import 'package:clinics_core/clinics_core.dart';
```

### Example: Using the RestClient

```dart
final client = RestClient('https://api.example.com');
final response = await client.get('/endpoint');
```

### Example: Showing a Success Message

```dart
Messages.showSuccess('Operation completed successfully!', context);
```
