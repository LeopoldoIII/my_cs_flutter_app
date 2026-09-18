import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_cs_flutter_app/features/button_feature/screens/button_screen.dart';

void main() {
  testWidgets('ButtonScreen renders title, text and button', (WidgetTester tester) async {
    // Nivel 2: Widget Test aislando el componente
    await tester.pumpWidget(MaterialApp(
      home: ButtonScreen(),
    ));

    // Validamos que exista el texto central
    expect(find.text('Screen Button'), findsOneWidget);

    // Validamos que exista el botón con el texto 'Other button'
    expect(find.text('Other button'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Simulamos un tap en el botón
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    
    // Al no tener funcionalidad, solo validamos que no hubo crash
    expect(tester.takeException(), isNull);
  });
}
