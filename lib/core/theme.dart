import 'package:flutter/material.dart';

class AppTheme {
  // 1) Color Palette
  static const Color primary = Color(0xFF00B894);
  static const Color accent  = Color(0xFF0984E3);
  static const Color bgLight = Color(0xFFF0F4F8);
  static const Color textDark = Color(0xFF2D3436);
  static const Color secondary = Color(0xFFFFC300);
  static const Color success = Color(0xFF06D6A0);
  static const String fontFamily = 'Nunito';

  // 2) Text Styles
  static final TextTheme textTheme = TextTheme(
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textDark, fontFamily: fontFamily),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textDark, fontFamily: fontFamily),
    bodyMedium: TextStyle(fontSize: 14, color: textDark, fontFamily: fontFamily),
  );

  // 3) Corner Radius & Spacing
  static const double radius = 16;
  static const double padding = 16;

  // 4) Animation Curves
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounce = Curves.bounceOut;

  // 5) ThemeData getter
  static ThemeData get lightTheme => ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(primary.value, <int, Color>{
            50: primary.withAlpha((255 * .1).round()),
            100: primary.withAlpha((255 * .2).round()),
            200: primary.withAlpha((255 * .3).round()),
            300: primary.withAlpha((255 * .4).round()),
            400: primary.withAlpha((255 * .5).round()),
            500: primary.withAlpha((255 * .6).round()),
            600: primary.withAlpha((255 * .7).round()),
            700: primary.withAlpha((255 * .8).round()),
            800: primary.withAlpha((255 * .9).round()),
            900: primary.withAlpha(255),
          }),
          // secondaryColor: accent,
        ),
        scaffoldBackgroundColor: bgLight,
        textTheme: textTheme,
        fontFamily: fontFamily,
        appBarTheme: AppBarTheme(
          color: primary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: textTheme.headlineSmall!.copyWith(color: Colors.white),
        ).copyWith(backgroundColor: primary),
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 4,
          margin: EdgeInsets.all(padding / 2),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      );
}
