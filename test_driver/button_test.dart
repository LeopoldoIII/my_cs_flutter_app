import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Button feature test', () {
    FlutterDriver? driver;

    // Configurar el driver
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after tests are complete
    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    test('Navigate to Button feature and interact with button', () async {
      await driver?.tap(find.text('Button'));
      expect(await driver?.getText(find.byValueKey('navBarText')), 'Button');
      // await driver?.tap(find.byValueKey('Other button'));
    });
  });
}
