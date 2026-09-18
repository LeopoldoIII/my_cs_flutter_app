# my_cs_flutter_app


## Description

This project is a Flutter test application designed for automating and interacting with Flutter widgets. that uses a **Feature First** architecture. Each feature of the app is modular, containing its own screens, widgets, and state management logic. This approach ensures scalability and maintainability by keeping all related components of a feature in one place.

## Features

- **Home Screen**: A main screen with buttons that navigate to different component implementations.
- **Button Feature**: A screen with a custom button implementation.
- **Radio Button Feature**: A screen with a custom radio button implementation.
- **Switch Feature**: A screen with a switch implementation.
- **Slider Feature**: A screen with a slider implementation.
- **Progress Indicator Feature**: A screen with a progress bar implementation.

## Architecture: Feature First

The project is structured using a **Feature First** architecture. This means that the code is organized by feature, where each feature contains its own logic, UI, and state management components. This pattern promotes modularity and makes it easier to scale and maintain the app.


![image](https://github.com/user-attachments/assets/6204ccd7-7eea-4d6a-9207-576f802b8754)


## Application Automation

To enable automated testing for this application, we use **Widget Tests (Level 2)** for fast, isolated component testing and **Integration Tests (Level 3)** using **BDD (Behavior-Driven Development)** for complete End-to-End flows.

It’s essential to add unique identifiers (`ValueKey`) to the widgets we want to interact with during tests. This allows our test suites to reliably locate specific UI elements.

#### Example: Adding `ValueKey` to Widgets

Below is an example of how to add a `ValueKey` to the title in a `CustomAppBar`:

```dart
AppBar(
  title: Text(
    'Button',
    key: const ValueKey('navBarText'), // Unique key for the title text widget
    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
  centerTitle: true,
);
```

Using ValueKey in Tests (Widget Tests / Integration Tests):
```dart
await tester.tap(find.byKey(const ValueKey('navBarText')));
expect(find.byKey(const ValueKey('navBarText')), findsOneWidget);
```

## Running Tests from the Terminal

We have migrated from the legacy `flutter_driver` to the modern `integration_test` and `bdd_widget_test` architecture.

### 1. Generating BDD Code
If you modify or create new `.feature` files in the `integration_test/features` directory, you must generate the underlying Dart code before running the tests:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Executing Level 2 Tests (Widget Tests)
These tests run instantly in memory without needing an emulator:

```bash
flutter test test/features/button_feature/button_widget_test.dart
```

### 3. Executing Level 3 Tests (Integration Tests)
Ensure you have an iOS Simulator or Android Emulator running, then execute:

```bash
flutter test integration_test/features/home_navigation_test.dart
```


#TODO 
- execute app
- execute device simulator
- 

