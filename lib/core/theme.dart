import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // New Color Palette
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color secondaryOrange = Color(0xFFF5A623);

  // Light Theme Colors
  static const Color lightPrimary = primaryBlue;
  static const Color lightPrimaryVariant = Color(0xFF357ABD); // Darker Primary Blue
  static const Color lightSecondary = secondaryOrange;
  static const Color lightSecondaryVariant = Color(0xFFD48E1F); // Darker Secondary Orange

  static const Color lightBackground = Color(0xFFF5F7FA); // Light Gray
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightError = Color(0xFFB00020); // Standard Material Error

  static const Color onLightPrimary = Colors.white;
  static const Color onLightSecondary = Colors.black; // For better readability on orange
  static const Color onLightBackground = Color(0xFF1A1F22); 
  static const Color onLightSurface = Color(0xFF1A1F22);
  static const Color onLightError = Colors.white;
  
  static const String fontFamily = 'Nunito';
  static const Color _lightShadowColor = Color(0x0D000000); // Black with 5% opacity

  // Light Text Theme
  static final TextTheme textTheme = GoogleFonts.nunitoTextTheme(
    TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25, color: onLightBackground),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onLightBackground),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onLightBackground),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: lightPrimary),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onLightBackground),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onLightBackground, shadows: const [
          Shadow(color: _lightShadowColor, offset: Offset(0, 1), blurRadius: 2),
        ]),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.15, color: onLightBackground),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: onLightSurface),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: onLightSurface),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: onLightSurface),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: onLightSurface),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: onLightSurface.withOpacity(0.8)),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: onLightPrimary), // For buttons on primary color
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onLightSurface.withOpacity(0.85)),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onLightSurface.withOpacity(0.85)),
    ),
  );

  static const double radius = 12;
  static const double padding = 16;
  static const double smallPadding = 8;
  static const double largePadding = 24;

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: lightPrimary,
      onPrimary: onLightPrimary,
      primaryContainer: lightPrimaryVariant,
      onPrimaryContainer: onLightPrimary,
      secondary: lightSecondary,
      onSecondary: onLightSecondary,
      secondaryContainer: lightSecondaryVariant,
      onSecondaryContainer: onLightSecondary,
      tertiary: lightSecondary, // Using secondary as tertiary for now
      onTertiary: onLightSecondary,
      tertiaryContainer: lightSecondaryVariant,
      onTertiaryContainer: onLightSecondary,
      error: lightError,
      onError: onLightError,
      errorContainer: lightError.withOpacity(0.1),
      onErrorContainer: lightError,
      surface: lightSurface,
      onSurface: onLightSurface,
      surfaceContainerHighest: lightBackground, 
      onSurfaceVariant: onLightBackground,
      outline: onLightBackground.withOpacity(0.3),
      shadow: Colors.black.withOpacity(0.08),
      inverseSurface: darkSurface, // Pointing to dark theme surface
      onInverseSurface: onDarkSurface,
      inversePrimary: darkPrimary.withOpacity(0.8), // Pointing to dark theme primary
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: lightBackground,
      textTheme: textTheme,
      fontFamily: fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: lightPrimary, // Updated
        foregroundColor: onLightPrimary, // Updated
        elevation: 2,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: onLightPrimary),
        iconTheme: IconThemeData(color: onLightPrimary, size: 24),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        margin: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding),
        color: lightSurface, // Updated
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimary, // Updated
          foregroundColor: onLightPrimary, // Updated
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          elevation: 2,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: lightPrimary, // Updated
          textStyle: textTheme.labelLarge?.copyWith(color: lightPrimary),
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lightPrimary, // Updated
          side: BorderSide(color: lightPrimary.withOpacity(0.5), width: 1.5), // Updated
          textStyle: textTheme.labelLarge?.copyWith(color: lightPrimary),
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurface.withOpacity(0.8), // Slightly more opaque for better contrast with lightBackground
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: lightPrimary, width: 2), // Updated
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(color: onLightSurface.withOpacity(0.7)),
        hintStyle: textTheme.bodyMedium?.copyWith(color: onLightSurface.withOpacity(0.5)),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: onLightSurface.withOpacity(0.8),
        titleTextStyle: textTheme.titleMedium?.copyWith(color: onLightSurface), // Ensure text color is onLightSurface
        subtitleTextStyle: textTheme.bodySmall?.copyWith(color: onLightSurface.withOpacity(0.85)),
        contentPadding: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding / 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        selectedTileColor: lightPrimary.withOpacity(0.1), // Updated
        selectedColor: lightPrimary, // Updated
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: lightSurface, // Updated
        elevation: 4,
        width: 280,
      ),
      dividerTheme: DividerThemeData(
        color: onLightBackground.withOpacity(0.12),
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: lightSurface, // Updated
        titleTextStyle: textTheme.titleLarge?.copyWith(color: onLightSurface),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: onLightSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 6,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: onLightBackground.withOpacity(0.9),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: lightBackground),
        actionTextColor: lightPrimary, // Updated
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius / 2)),
        elevation: 4,
      ),
    );
  }

  // --- DARK THEME COLORS ---
  static const Color darkPrimary = Color(0xFF77A5ED); // Lighter Primary Blue
  static const Color darkPrimaryVariant = Color(0xFF4A90E2); // Original Primary Blue
  static const Color darkSecondary = Color(0xFFF7B955); // Lighter Secondary Orange
  static const Color darkSecondaryVariant = Color(0xFFF5A623); // Original Secondary Orange

  static const Color darkBackground = Color(0xFF121212); // Standard dark
  static const Color darkSurface = Color(0xFF1E1E1E); // Slightly lighter dark
  static const Color darkError = Color(0xFFCF6679); // Material dark error

  static const Color onDarkPrimary = Colors.black; // For better contrast on lighter blue
  static const Color onDarkSecondary = Colors.black; // For better contrast on lighter orange
  static const Color onDarkBackground = Color(0xFFE0E0E0); 
  static const Color onDarkSurface = Color(0xFFE0E0E0);
  static const Color onDarkError = Colors.black;

  static const Color _darkShadowColor = Color(0x1AFFFFFF);

  // --- DARK TEXT THEME ---
  static final TextTheme darkTextTheme = GoogleFonts.nunitoTextTheme(
    TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25, color: onDarkBackground),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onDarkBackground),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onDarkBackground),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: darkPrimary),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onDarkBackground),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onDarkBackground, shadows: const [
          Shadow(color: _darkShadowColor, offset: Offset(0, 1), blurRadius: 2),
        ]),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.15, color: onDarkBackground),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: onDarkSurface),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: onDarkSurface),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: onDarkSurface),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: onDarkSurface),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: onDarkSurface.withOpacity(0.8)),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: onDarkPrimary),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onDarkSurface.withOpacity(0.85)),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onDarkSurface.withOpacity(0.85)),
    ),
  );

  // --- DARK THEME DATA ---
  static ThemeData get darkTheme {
    final darkColorScheme = ColorScheme( // Renamed to avoid conflict
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: onDarkPrimary,
      primaryContainer: darkPrimaryVariant,
      onPrimaryContainer: onDarkPrimary, // Or a lighter color if darkPrimaryVariant is too dark
      secondary: darkSecondary,
      onSecondary: onDarkSecondary,
      secondaryContainer: darkSecondaryVariant,
      onSecondaryContainer: onDarkSecondary,
      tertiary: darkSecondary,
      onTertiary: onDarkSecondary,
      tertiaryContainer: darkSecondaryVariant,
      onTertiaryContainer: onDarkSecondary,
      error: darkError,
      onError: onDarkError,
      errorContainer: darkError.withOpacity(0.2),
      onErrorContainer: onDarkError,
      surface: darkSurface,
      onSurface: onDarkSurface,
      surfaceContainerHighest: darkBackground,
      onSurfaceVariant: onDarkBackground,
      outline: onDarkBackground.withOpacity(0.3),
      shadow: Colors.black.withOpacity(0.2),
      inverseSurface: lightSurface, // Pointing to light theme surface
      onInverseSurface: onLightSurface,
      inversePrimary: lightPrimary.withOpacity(0.8), // Pointing to light theme primary
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme, // Use the darkColorScheme
      scaffoldBackgroundColor: darkBackground,
      textTheme: darkTextTheme,
      fontFamily: fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurface, // Updated
        foregroundColor: onDarkSurface, // Updated
        elevation: 1,
        centerTitle: true,
        titleTextStyle: darkTextTheme.titleLarge?.copyWith(color: onDarkSurface),
        iconTheme: IconThemeData(color: onDarkSurface, size: 24),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        margin: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding),
        color: darkSurface, // Updated
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimary, // Updated
          foregroundColor: onDarkPrimary, // Updated
          textStyle: darkTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          elevation: 2,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkPrimary, // Updated
          textStyle: darkTextTheme.labelLarge?.copyWith(color: darkPrimary),
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkPrimary, // Updated
          side: BorderSide(color: darkPrimary.withOpacity(0.7), width: 1.5), // Updated
          textStyle: darkTextTheme.labelLarge?.copyWith(color: darkPrimary),
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: darkPrimary, width: 2), // Updated
        ),
        labelStyle: darkTextTheme.bodyMedium?.copyWith(color: onDarkSurface.withOpacity(0.7)),
        hintStyle: darkTextTheme.bodyMedium?.copyWith(color: onDarkSurface.withOpacity(0.5)),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: onDarkSurface.withOpacity(0.8),
        titleTextStyle: darkTextTheme.titleMedium?.copyWith(color: onDarkSurface),
        subtitleTextStyle: darkTextTheme.bodySmall?.copyWith(color: onDarkSurface.withOpacity(0.85)),
        contentPadding: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding / 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        selectedTileColor: darkPrimary.withOpacity(0.2), // Updated
        selectedColor: darkPrimary, // Updated
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: darkSurface, // Updated
        elevation: 2,
        width: 280,
      ),
      dividerTheme: DividerThemeData(
        color: onDarkBackground.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: darkSurface, // Updated
        titleTextStyle: darkTextTheme.titleLarge?.copyWith(color: onDarkSurface),
        contentTextStyle: darkTextTheme.bodyMedium?.copyWith(color: onDarkSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 6,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: onDarkBackground.withOpacity(0.9), 
        contentTextStyle: darkTextTheme.bodyMedium?.copyWith(color: darkBackground),
        actionTextColor: darkPrimary, // Updated
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius / 2)),
        elevation: 4,
      ),
    );
  }
}
