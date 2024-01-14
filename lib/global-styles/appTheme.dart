import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xfffe734d);
  // refer: https://imagecolorpicker.com/en
  static final Map<int, Color> primaryShades = {
    100: Color(0xfffe734d),
    200: Color(0xffdf6444),
    300: Color(0xffbe5539),
    400: Color(0xff9f4730),
    500: Color(0xff803928),
    600: Color(0xff5f2a1d),
    700: Color(0xff3f1d15),
    800: Color(0xff200e0b),
  };
  static final Map<int, Color> primaryTints = {
    100: Color(0xffffeeea),
    200: Color(0xffffddd4),
    300: Color(0xffffcabc),
    400: Color(0xffffb9a7),
    500: Color(0xfffea68e),
    600: Color(0xfffe9578),
    700: Color(0xffff8463),
    800: Color(0xfffe734d),
  };

  static final Color secondaryColor = Color(0xffffd065);
  static final Map<int, Color> secondaryShades = {
    100: Color(0xffffd065),
    200: Color(0xffdfb759),
    300: Color(0xffbf9c4c),
    400: Color(0xff9f823f),
    500: Color(0xff7f6833),
    600: Color(0xff5f4d26),
    700: Color(0xff3f331a),
    800: Color(0xff201a0f),
  };
  // generalise with the following formula
  // refer: https://stackoverflow.com/questions/46595466/is-there-a-map-of-material-design-colors-for-flutter
  static final Map<int, Color> secondaryTints = {
    100: Color(0xfffff8f1),
    200: Color(0xfffff3da),
    300: Color(0xffffedc6),
    400: Color(0xffffe8b3),
    500: Color(0xffffe29f),
    600: Color(0xffffdc8c),
    700: Color(0xffffd779),
    800: Color(0xffffd065),
  };

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light().copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        // refer: https://coolors.co/contrast-checker/000000-fe744d
        secondary: secondaryColor,
        onSecondary: Color(0xff412020),
        // refer: https://coolors.co/contrast-checker/412020-ffd166
        background: Colors.white,
        onBackground: Colors.black),
  );
}
