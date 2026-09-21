import 'package:flutter_test/flutter_test.dart';
import 'package:my_cs_flutter_app/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
}
