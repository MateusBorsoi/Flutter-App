import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    primary: Colors.indigo,
    secondary: Colors.white,
    tertiary: Colors.orange,
    error: Colors.red,
    brightness: Brightness.dark,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      shadowColor: Colors.black87,
      elevation: 5,
      foregroundColor: Colors.white),
);

ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    primary: Colors.indigo,
    secondary: Colors.grey.shade900,
    tertiary: Colors.orange,
    error: Colors.red,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      shadowColor: Colors.black87,
      elevation: 5,
      foregroundColor: Colors.white),
);
