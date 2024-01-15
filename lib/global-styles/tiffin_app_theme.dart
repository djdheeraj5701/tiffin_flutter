import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TiffinAppTheme {
  static const Color primaryColor = Color(0xfffe734d);
  // refer: https://imagecolorpicker.com/en
  static final Map<int, Color> primaryShades = {
    100: const Color(0xfffe734d),
    200: const Color(0xffdf6444),
    300: const Color(0xffbe5539),
    400: const Color(0xff9f4730),
    500: const Color(0xff803928),
    600: const Color(0xff5f2a1d),
    700: const Color(0xff3f1d15),
    800: const Color(0xff200e0b),
  };
  static final Map<int, Color> primaryTints = {
    100: const Color(0xffffeeea),
    200: const Color(0xffffddd4),
    300: const Color(0xffffcabc),
    400: const Color(0xffffb9a7),
    500: const Color(0xfffea68e),
    600: const Color(0xfffe9578),
    700: const Color(0xffff8463),
    800: const Color(0xfffe734d),
  };

  static const Color secondaryColor = Color(0xffffd065);
  static final Map<int, Color> secondaryShades = {
    100: const Color(0xffffd065),
    200: const Color(0xffdfb759),
    300: const Color(0xffbf9c4c),
    400: const Color(0xff9f823f),
    500: const Color(0xff7f6833),
    600: const Color(0xff5f4d26),
    700: const Color(0xff3f331a),
    800: const Color(0xff201a0f),
  };
  // generalise with the following formula
  // refer: https://stackoverflow.com/questions/46595466/is-there-a-map-of-material-design-colors-for-flutter
  static final Map<int, Color> secondaryTints = {
    100: const Color(0xfffff8f1),
    200: const Color(0xfffff3da),
    300: const Color(0xffffedc6),
    400: const Color(0xffffe8b3),
    500: const Color(0xffffe29f),
    600: const Color(0xffffdc8c),
    700: const Color(0xffffd779),
    800: const Color(0xffffd065),
  };

  static TextStyle primaryFontStyle = GoogleFonts.poppins();
  static TextStyle secondaryFontStyle = GoogleFonts.workSans();

  static TextStyle heading1TextStyle =
      primaryFontStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w900);

  static TextStyle heading2TextStyle =
      primaryFontStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w900);

  static TextStyle bodyLargeTextStyle =
      secondaryFontStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400);

  static TextStyle bodyRegularTextStyle =
      secondaryFontStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle bodySmallTextStyle =
      secondaryFontStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle captionTextStyle =
      secondaryFontStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w300);

  static TextStyle buttonTextStyle =
      primaryFontStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w300);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      padding:
          const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
      textStyle: MaterialStatePropertyAll(buttonTextStyle),
      shape: MaterialStateProperty.resolveWith((_) =>
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(primaryColor),
    )),
    checkboxTheme: CheckboxThemeData(
        checkColor: const MaterialStatePropertyAll(Colors.white),
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    iconTheme: const IconThemeData(
      size: 24,
    ),
    colorScheme: const ColorScheme.light().copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        // refer: https://coolors.co/contrast-checker/000000-fe744d
        secondary: secondaryColor,
        onSecondary: const Color(0xff412020),
        // refer: https://coolors.co/contrast-checker/412020-ffd166
        background: Colors.white,
        onBackground: Colors.black),
  );
}
