import 'package:flutter/material.dart';

final brandingRutometro = ThemeData.from(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xffe4002a,
      <int, Color>{
        50: Color(0xffffeaee),
        100: Color(0xffffcbd3),
        200: Color(0xfff99699),
        300: Color(0xfff36c71),
        400: Color(0xffff444d),
        500: Color(0xffff282f),
        600: Color(0xfff61930),
        700: Color(0xffe4002a),
        800: Color(0xffd70022),
        900: Color(0xffca0013),
      },
    ),
    accentColor: const Color(0xffe4002a),
    cardColor: Colors.white,
    backgroundColor: Colors.grey[50],
    errorColor: Colors.red,
  ),
).copyWith(
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffe4002a),
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xffe4002a),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xffe4002a),
    selectionColor: const Color(0xffe4002a).withOpacity(0.7),
  ),
);

final brandingRutometroDark = ThemeData.from(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xff263238,
      <int, Color>{
        50: Color(0xffeceff1),
        100: Color(0xffcfd8dc),
        200: Color(0xffb0bec5),
        300: Color(0xff90a4ae),
        400: Color(0xff78909c),
        500: Color(0xff607d8b),
        600: Color(0xff546e7a),
        700: Color(0xff455a64),
        800: Color(0xff37474f),
        900: Color(0xff263238),
      },
    ),
    accentColor: const Color(0xffd70022),
    cardColor: const Color(0xff182025),
    brightness: Brightness.dark,
  ),
).copyWith(
  scaffoldBackgroundColor: Colors.grey[800],
  dialogBackgroundColor: const Color(0xff141515),
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
    color: Color(0xffd70022),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xffd70022),
    selectionColor: const Color(0xffd70022).withOpacity(0.7),
  ),
);
