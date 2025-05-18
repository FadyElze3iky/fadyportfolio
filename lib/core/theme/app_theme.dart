import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    // Custom colors inspired by the light mode image
    const background = Color(0xFFFBFBFB); // Very light gray
    const card =
        Color.fromARGB(255, 219, 219, 219); // White for cards/containers
    const border = Color(0xFFEBEBEB); // Soft light gray border
    const accent = Colors.black; // Black for primary accent
    const heading = Colors.black; // Main headings
    const subheading = Color(0xFF232323); // Subheadings
    const body = Color(0xFF52525B); // Body text
    const fontFamily = 'Inter';

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      cardColor: card,
      dividerColor: border,
      primaryColor: accent,
      hoverColor: subheading,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: background,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: heading,
          fontSize: 80,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headlineMedium: TextStyle(
          color: heading,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headlineSmall: TextStyle(
          color: subheading,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        bodyLarge: TextStyle(
          color: body,
          fontSize: 16,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          color: body,
          fontSize: 14,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          color: accent,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: accent,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: card,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: border),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: border),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: accent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintStyle: TextStyle(color: body),
        labelStyle: TextStyle(color: subheading),
      ),
    );
  }

  static ThemeData get darkTheme {
    // Custom colors inspired by the image
    const background = Color(0xFF0D0D0D); // Deep black
    const card = Color(0xFF181818); // Slightly lighter for cards/containers
    const border = Color(0xFF2A2A31); // Soft border
    const accent = Color(0xFFFF2566); // Neon pink/red accent
    const heading = Colors.white; // Main headings
    const subheading = Color(0xFFE4E4E7); // Subheadings
    const body = Color.fromARGB(255, 161, 161, 170); // Body text
    const fontFamily = 'Inter';

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      hoverColor: subheading,
      cardColor: card,
      dividerColor: border,
      primaryColor: accent,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: background,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: heading,
          fontSize: 80,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headlineMedium: TextStyle(
          color: heading,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
        headlineSmall: TextStyle(
          color: subheading,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        bodyLarge: TextStyle(
          color: body,
          fontSize: 16,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          color: body,
          fontSize: 14,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          color: subheading,
          fontSize: 12,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          color: accent,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: card,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: card,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: border),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: border),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: accent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintStyle: TextStyle(color: body),
        labelStyle: TextStyle(color: subheading),
      ),
    );
  }
}
