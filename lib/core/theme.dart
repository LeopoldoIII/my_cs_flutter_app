import 'package:flutter/material.dart';

// Define the main theme of the application
class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pink,
      elevation: 4.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold), // Reemplazo de headline1
      titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500), // Reemplazo de headline6
      bodyMedium: TextStyle(
          fontSize: 16.0, color: Colors.black87), // Reemplazo de bodyText2
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue, // Background color of buttons
      textTheme: ButtonTextTheme.primary, // Text color of buttons
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Button color (antes era primary)
        foregroundColor: Colors.white, // Text color (antes era onPrimary)
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
    ),
  );
}
