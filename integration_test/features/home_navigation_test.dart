// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './step/the_app_is_running.dart';
import './step/i_tap_text.dart';
import './step/i_see_text.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Home Navigation''', () {
    testWidgets('''Navigate to button screen''', (tester) async {
      await theAppIsRunning(tester);
      await iTapText(tester, 'Button');
      await iSeeText(tester, 'Screen Button');
    });
  });
}
