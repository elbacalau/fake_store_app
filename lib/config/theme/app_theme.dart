import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color secondaryGreen = Color(0XFF3D9A42);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBeige = Color(0xFFFFF8E1);
  static const Color lightBrown = Color(0xFFD7CCC8);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryGreen,
      scaffoldBackgroundColor: white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
        ),
        titleTextStyle: TextStyle(color: white, fontSize: 20),
        iconTheme: IconThemeData(color: white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: secondaryGreen,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryGreen,
        secondary: secondaryGreen,
        surface: lightBrown,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: secondaryGreen),
        bodyMedium: TextStyle(color: secondaryGreen),
        bodySmall: TextStyle(color: primaryGreen),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightBeige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
