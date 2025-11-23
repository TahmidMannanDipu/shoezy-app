import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(seedColor: Color(0xff43A847));

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Inter',
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: colorScheme.onSurface,
    ),
  ),
  colorScheme: colorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: 1,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colorScheme.outline),
    ),
    hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    prefixIconColor: colorScheme.primary,
  ),

);
