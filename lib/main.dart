import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/core/theme.dart';
import 'package:my_cs_flutter_app/features/home/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: MainScreen(),
    );
  }
}
