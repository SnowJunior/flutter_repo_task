# GitHub Flutter App

A Flutter application built using the [Stacked](https://pub.dev/packages/stacked) architecture.

## Getting Started

### Clone the Repository
To get started with the project, clone this repository:
```sh
 git clone git@github.com:SnowJunior/flutter_repo_task.git
 cd flutter_repo_task
```

### Install Dependencies
Run the following command to install all required dependencies:
```sh
flutter pub get
```

### Generate Required Files
Since the project uses `stacked` with code generation, run `build_runner` to generate necessary files and remove conflicts:
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the Application
To start the application on an emulator or a connected device, use:
```sh
flutter run
```

## Project Structure
This project follows a modular structure to keep the codebase maintainable and scalable:

```
lib/
│-- services/          # Handles external API interactions
│-- viewmodels/        # Business logic and state management (Stacked ViewModels)
│-- presentations/     # Screens and reusable widgets
│   ├── screens/      # All screen UIs
│   ├── widgets/      # Reusable UI components
│-- theme/            # App theme and colors
│-- utils/            # Helper functions and utilities
│-- models/           # Data objects interacting with API and UI
│-- main.dart         # Application entry point
```

