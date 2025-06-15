import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 113, 243, 230),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    surface: Color(0xFFE0F2F1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF212121),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    surface: Color(0xFF37474F),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);