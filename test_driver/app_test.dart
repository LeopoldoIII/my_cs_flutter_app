import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('My App UI Tests', () {
    FlutterDriver? driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after tests are complete
    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    test('Verify ButtonScreen navigation', () async {
      // Find the element by its key or text
      final buttonFinder = find.text('Botón');  // Text you want to tap

      // Tap on the button
      await driver?.tap(buttonFinder);

      // Verify navigation by checking if the new screen contains some expected text or widget
      final screenTitleFinder = find.text('Botón');
      expect(await driver?.getText(screenTitleFinder), 'Botón');
    });

    test('Verify SwitchScreen navigation', () async {
      // Find the SwitchScreen option by its text
      final switchFinder = find.text('Switch');

      // Tap on the option to go to the SwitchScreen
      await driver?.tap(switchFinder);

      // Find the Switch itself (use key or any identifiable widget)
      final switchTextFinder = find.text('Switch is OFF');

      // Check if the SwitchScreen is loaded by verifying some text or widget on that screen
      expect(await driver?.getText(switchTextFinder), 'Switch is OFF');
    });

    test('Toggle Switch and verify', () async {
      // Find the SwitchScreen option by its text
      final switchFinder = find.text('Switch');

      // Tap on the option to go to the SwitchScreen
      await driver?.tap(switchFinder);

      // Find the switch (use key or identifiable widget)
      final switchToggle = find.byType('Switch');  // Identify by widget type 'Switch'

      // Toggle the switch by tapping on it
      await driver?.tap(switchToggle);

      // Verify that the switch was toggled to "ON"
      final switchTextFinder = find.text('Switch is ON');
      expect(await driver?.getText(switchTextFinder), 'Switch is ON');
    });
  });
}
