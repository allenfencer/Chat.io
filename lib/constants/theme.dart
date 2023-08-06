import 'package:chat_io/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade50,
    colorScheme: const ColorScheme.light(
      background: AppColor.backgroundColor,
      primary: AppColor.primaryColor,
    ),
    fontFamily: 'Mulish',
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade50,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      headlineSmall: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      bodyMedium: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      bodySmall: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade800,
      ),
      labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade800,
          letterSpacing: 0.7),
    ),
  );
}
