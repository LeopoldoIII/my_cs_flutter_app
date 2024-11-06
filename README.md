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
![image](https://github.com/user-attachments/assets/664f249a-8de3-442d-881d-4feaf2e8540b)





## Application Automation

To enable automated testing for this application, it’s essential to add unique identifiers (`ValueKey`) to the widgets we want to interact with during tests. This allows `flutter_driver` to reliably locate specific UI elements.

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

In this example:

key: const ValueKey('navBarText'): This identifier allows flutter_driver to locate the AppBar title in our automated tests.

Using ValueKey in Tests
To interact with this widget in a test, use the following code:

    await driver?.tap(find.byValueKey('navBarText'));
    String? navBarText = await driver?.getText(find.byValueKey('navBarText'));
    print('NavBar Text: $navBarText');

This practice of adding ValueKey to widgets makes automation easier and more reliable, as each widget can be located and interacted with consistently.

## Running Tests from the Terminal

To run automated tests using `flutter_driver`, follow these steps:

1. **Start the application in test mode**: Open a terminal in the root directory of the project and run the following command to start the app in test mode. Ensure that the `test_driver/app.dart` file is configured as the entry point for the tests.

```bash
   flutter run --target=test_driver/app.dart
```

This command launches the application in test mode, allowing flutter_driver to connect to it.

2. **Execute the test script**: Open a second terminal in the root directory and run the test script by specifying both the app entry file and the test file (e.g., button_test.dart).

```bash
   flutter drive --target=test_driver/app.dart --driver=test_driver/button_test.dart
```

Replace `button_test.dart` with the name of your test file if different. This command connects the test file to the app running in test mode, executing the specified test cases.

3. **Adjusting Timeout**: If the tests take longer to complete, you can add a timeout to avoid premature termination:

```bash
   flutter drive --target=test_driver/app.dart --driver=test_driver/button_test.dart --timeout=600
```

This allows more time for tests to connect and execute fully.


#TODO 
- execute app
- execute device simulator
- 

