import 'package:flutter/material.dart';

final brandingRutometro = ThemeData.from(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xff0061D0,
      <int, Color>{
        50: Color(0xffe2f2ff),
        100: Color(0xffb9ddff),
        200: Color(0xff8bc9ff),
        300: Color(0xff58b4ff),
        400: Color(0xff2ba3ff),
        500: Color(0xff0093ff),
        600: Color(0xff0085f6),
        700: Color(0xff0073e2),
        800: Color(0xff0061d0),
        900: Color(0xff0741b1),
      },
    ),
    accentColor: const Color(0xff0061D0),
    cardColor: const Color(0xfff2f2f2),
    backgroundColor: Colors.grey[50],
    errorColor: Colors.red,
  ),
).copyWith(
  scaffoldBackgroundColor: const Color(0xfff2f2f2),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff0061D0),
    foregroundColor: const Color(0xfff2f2f2),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: const Color(0xfff2f2f2),
    foregroundColor: Color(0xff0061D0),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xff0061D0),
    selectionColor: const Color(0xff0061D0).withOpacity(0.7),
  ),
);

final brandingRutometroDark = ThemeData.from(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xff0061D0,
      <int, Color>{
        50: Color(0xfff1faff),
        100: Color(0xffebf4ff),
        200: Color(0xffe2ecf9),
        300: Color(0xffd3dde9),
        400: Color(0xffb0b9c6),
        500: Color(0xff919aa6),
        600: Color(0xff69717c),
        700: Color(0xff555d68),
        800: Color(0xff363f49),
        900: Color(0xff161e27),
      },
    ),
    accentColor: const Color(0xff0073e2),
    cardColor: const Color(0xff161919),
    brightness: Brightness.dark,
  ),
).copyWith(
  scaffoldBackgroundColor: Colors.grey[800],
  dialogBackgroundColor: const Color(0xff161e27),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xff263238),
    foregroundColor: Colors.white,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xff141515),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff161919),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xff161e27),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xff161e27),
    selectionColor: const Color(0xff161e27).withOpacity(0.7),
  ),
);
