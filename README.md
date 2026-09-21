# my_cs_flutter_app

## Description

This project is a Flutter test application designed for automating and interacting with Flutter widgets that uses a **Feature First** architecture. Each feature of the app is modular, containing its own screens, widgets, and state management logic. This approach ensures scalability and maintainability by keeping all related components of a feature in one place.

---

## Environment Setup

### macOS

#### 1. Installing Homebrew
[Homebrew](https://brew.sh/) is a package manager for macOS that simplifies software installation.

1. Open **Terminal**.
2. Run the following command to install Homebrew:
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Verify installation:
   ```sh
   brew --version
   ```

#### 2. Installing Xcode & CocoaPods
1. Open the **App Store**, search for **Xcode**, and click **Get / Install**.
2. Once installed, open Xcode and agree to the license agreement.
3. Install Rosetta 2 (for Apple Silicon Macs):
   ```sh
   sudo softwareupdate --install-rosetta --agree-to-license
   ```
4. Set the Xcode developer directory and run the first launch setup:
   ```sh
   sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
   ```
5. Accept the Xcode license:
   ```sh
   sudo xcodebuild -license
   ```
6. Verify command line tools:
   ```sh
   xcode-select --install
   ```
7. Install CocoaPods (required for iOS dependencies):
   ```sh
   brew install cocoapods
   ```

#### 3. Installing Visual Studio Code
1. Install VS Code via Homebrew:
   ```sh
   brew install --cask visual-studio-code
   ```
2. Verify installation:
   ```sh
   code --version
   ```

#### 4. Installing Android Studio & Android SDK
1. Install Android Studio via Homebrew:
   ```sh
   brew install --cask android-studio
   ```
2. Open **Android Studio** and complete the Setup Wizard to install necessary SDK components.
3. **Install Android SDK Command-line Tools**:
   - Open Android Studio -> **Settings / Preferences** -> **Languages & Frameworks** -> **Android SDK** -> **SDK Tools**.
   - Check **Android SDK Command-line Tools (latest)** and click **Apply**.
4. Add environment variables to `~/.zshrc` (or `~/.bash_profile`):
   ```sh
   echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.zshrc
   echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.zshrc
   echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.zshrc
   echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.zshrc
   echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.zshrc
   ```
5. Reload configuration:
   ```sh
   source ~/.zshrc
   ```
6. Accept Android Licenses:
   ```sh
   flutter doctor --android-licenses
   ```
7. Verify configuration:
   ```sh
   echo $ANDROID_HOME
   ```

#### 5. Install FVM & Flutter
1. Install FVM (Flutter Version Management):
   ```sh
   brew install fvm
   ```
2. Verify FVM installation:
   ```sh
   fvm --version
   ```
3. Install the stable version of Flutter:
   ```sh
   fvm install stable
   ```
4. Add environment variables to `~/.zshrc`:
   ```sh
   echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.zshrc
   echo 'export PATH="$PATH:$HOME/fvm/default/bin"' >> ~/.zshrc
   source ~/.zshrc
   ```
5. Navigate to project directory and set Flutter version:
   ```sh
   cd path/to/my_cs_flutter_app
   fvm use stable
   ```
6. Run Flutter Doctor to confirm everything is green:
   ```sh
   fvm flutter doctor
   ```

---

<details>
<summary><b>Windows Setup Guide</b> (click)</summary>

### Windows

#### 1. Installing Chocolatey
1. Open **PowerShell** as Administrator.
2. Set execution policy:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   ```
3. Install Chocolatey:
   ```powershell
   [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
4. Verify installation:
   ```powershell
   choco
   ```

#### 2. Install FVM & Flutter
1. Open PowerShell as Administrator and run:
   ```powershell
   choco install fvm
   ```
2. Verify FVM:
   ```powershell
   fvm --version
   ```
3. Install stable Flutter version:
   ```powershell
   fvm install stable
   ```
4. Navigate to project directory and set Flutter version:
   ```powershell
   fvm use stable
   ```
5. Verify active Flutter version:
   ```powershell
   fvm flutter --version
   ```

#### 3. Installing Android Studio
1. Install via Chocolatey:
   ```powershell
   choco install androidstudio
   ```
2. Set Environment Variables:
   ```powershell
   [Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Program Files (x86)\Android\android-sdk", "User")
   [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files (x86)\Android\android-sdk\platform-tools", "User")
   ```
3. Verify environment variables:
   ```powershell
   echo $env:ANDROID_HOME
   echo $env:Path
   ```

#### 4. Installing Visual Studio Code
1. Install via Chocolatey:
   ```powershell
   choco install vscode
   ```
2. Verify installation:
   ```powershell
   code
   ```

</details>

---

## Features

- **Home Screen**: A main screen with buttons that navigate to different component implementations.
- **Button Feature**: A screen with a custom button implementation.
- **Radio Button Feature**: A screen with a custom radio button implementation.
- **Switch Feature**: A screen with a switch implementation.
- **Slider Feature**: A screen with a slider implementation.
- **Progress Indicator Feature**: A screen with a progress bar implementation.

---

## Architecture: Feature First

The project is structured using a **Feature First** architecture. This means that the code is organized by feature, where each feature contains its own logic, UI, and state management components. This pattern promotes modularity and makes it easier to scale and maintain the app.

![image](https://github.com/user-attachments/assets/6204ccd7-7eea-4d6a-9207-576f802b8754)

---

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

---

## Running Tests from the Terminal

We have migrated from the legacy `flutter_driver` to the modern `integration_test` and `bdd_widget_test` architecture.

### 1. Generating BDD Code
If you modify or create new `.feature` files in the `integration_test/features` directory, you must generate the underlying Dart code before running the tests:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Executing Level 2 Tests (Widget Tests)
These tests run instantly in memory without needing an emulator:

```bash
fvm flutter test test/features/button_feature/button_widget_test.dart
```

### 3. Executing Level 3 Tests (Integration Tests)
To run End-to-End tests, you need a running iOS Simulator or Android Emulator. Follow these steps to launch a device and run the test:

**Step 1: List installed emulators/simulators**
```bash
fvm flutter emulators
```
*Note the ID of the emulator you want to use (e.g., `Pixel_7`).*

**Step 2: Launch the emulator**
```bash
fvm flutter emulators --launch <emulator_id>
```

**Step 3: Get the ID of the running device**
Once the emulator has booted up, list the active devices to get its exact connection ID:
```bash
fvm flutter devices
```
*For Android, the ID will typically look like `emulator-5554`. For iOS simulators, it's usually `ios`.*

**Step 4: Run the test on the specific device**
Pass the active device ID to the `-d` flag to avoid Flutter prompting for a device:
```bash
fvm flutter test integration_test/features/home_navigation_test.dart -d <device_id>
```

---

## Extra Configuration & Tools

### Extensions for Flutter on Visual Studio Code
1. **Flutter**: Support for Flutter development, debugging, and IntelliSense.
2. **Dart**: Support for the Dart programming language.
3. **Flutter Widget Snippets**: Snippets for commonly used Flutter widgets.
4. **Awesome Flutter Snippets**: Collection of commonly used Flutter snippets.

### Android Virtual Device (AVD)
1. Open **Android Studio**.
2. Go to `More Actions` > `Virtual Device Manager`.
3. Click `Create Device`, choose hardware profile (e.g. Pixel 9) and click `Next`.
4. Select a System Image (download if needed) and click `Next`.
5. Verify settings and click `Finish`.

### Installing Vysor
[Vysor](https://www.vysor.io/) allows viewing and controlling Android/iOS devices on your PC/Mac.
- macOS: `brew install --cask vysor`
- Windows: `choco install vysor`

### Device Management

**Android Devices**
```sh
adb devices
```

**iOS Devices**
```sh
xcrun simctl list devices
```

**Flutter Devices**
```sh
fvm flutter devices
```

**List Available Emulators**
```sh
fvm flutter emulators
```

**Launch a Specific Emulator**
```sh
fvm flutter emulator --launch Medium_Phone_API_35
```
