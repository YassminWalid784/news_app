import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static ThemeData applicationThemeData = ThemeData(
    primaryColor: const Color(0xFF39A552),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF39A552),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}
