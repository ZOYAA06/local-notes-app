# Local Notes App

A simple and clean Flutter task manager app with local data persistence using Hive.

## Features

- Add new tasks
- Mark tasks as completed
- Delete tasks
- Tasks persist after restarting the app
- Completed tasks have a distinct visual style
- Scrollable task list
- Clean and responsive UI

## Tech Stack

- Flutter
- Dart
- Hive
- hive_flutter

## Project Structure

```text
lib/
├── models/
│   └── task.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── task_storage.dart
├── widgets/
│   └── task_tile.dart
└── main.dart
```

## How It Works

The app uses Hive for local storage. Tasks are stored locally on the device, so they remain available even after the application is closed and reopened.

The application is structured into separate model, screen, widget, and storage-service layers to keep the code organized and maintainable.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Android device or emulator

### Run the Project

```bash
flutter pub get
flutter run
```

## Author

Zoya Shaikh
