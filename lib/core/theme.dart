import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 1) Professional Color Palette - Deep Teal & Cool Gray
  static const Color primary = Color(0xFF00796B); // Deep Teal
  static const Color primaryVariant = Color(0xFF004D40); // Darker Teal
  static const Color secondary = Color(0xFF0277BD); // Deep Sky Blue (Accent)
  static const Color secondaryVariant = Color(0xFF01579B); // Darker Sky Blue

  static const Color background = Color(0xFFECEFF1); // Cool Light Gray
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color error = Color(0xFFB00020); // Standard Material Error

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1A1F22); // Darkened from 0xFF263238 for better contrast
  static const Color onSurface = Color(0xFF1A1F22); // Darkened from 0xFF263238 for better contrast
  static const Color onError = Color(0xFFFFFFFF);

  // Original colors (can be kept for reference or specific uses if needed)
  // static const Color oldPrimary = Color(0xFF00B894);
  // static const Color oldAccent = Color(0xFF0984E3);
  // static const Color oldBgLight = Color(0xFFF0F4F8);
  // static const Color oldTextDark = Color(0xFF2D3436);
  // static const Color oldSecondary = Color(0xFFFFC300);
  // static const Color oldSuccess = Color(0xFF06D6A0);

  static const String fontFamily = 'Nunito';
  static const Color _lightShadowColor = Color(0x0D000000); // Black with 5% opacity

  // 2) Expanded Text Styles using Nunito
  static final TextTheme textTheme = GoogleFonts.nunitoTextTheme(
    TextTheme(
      // Display
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25, color: onBackground),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onBackground),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onBackground),
      // Headline
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: primary), // Emphasize with primary
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onBackground),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onBackground, shadows: const [
          Shadow(color: _lightShadowColor, offset: Offset(0, 1), blurRadius: 2),
        ]), // More subtle shadow
      // Title
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.15, color: onBackground),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: onSurface), // Common for ListTile titles
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: onSurface),
      // Body
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: onSurface),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: onSurface), // Common for body text
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: onSurface.withOpacity(0.8)), // Increased opacity from 0.7 for better visibility
      // Label
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: onPrimary), // For buttons
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onSurface.withOpacity(0.85)), // Increased opacity from 0.7
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onSurface.withOpacity(0.85)), // Increased opacity from 0.7
    ),
  );

  // 3) Corner Radius & Spacing
  static const double radius = 12; // Slightly smaller radius for a cleaner look
  static const double padding = 16;
  static const double smallPadding = 8;
  static const double largePadding = 24;

  // 4) Animation Curves (can be expanded)
  static const Curve defaultCurve = Curves.easeInOutCubic;
  static const Duration shortDuration = Duration(milliseconds: 300);
  static const Duration mediumDuration = Duration(milliseconds: 500);

  // 5) ThemeData getter
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryVariant, // Or a lighter shade if preferred
      onPrimaryContainer: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryVariant, // Or a lighter shade
      onSecondaryContainer: onSecondary,
      tertiary: secondary, // Can define a specific tertiary color
      onTertiary: onSecondary,
      tertiaryContainer: secondaryVariant,
      onTertiaryContainer: onSecondary,
      error: error,
      onError: onError,
      errorContainer: error.withOpacity(0.1),
      onErrorContainer: error,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: background.withOpacity(0.8), // For slightly different surfaces
      onSurfaceVariant: onBackground,
      outline: onBackground.withOpacity(0.3),
      shadow: Colors.black.withOpacity(0.08),
      inverseSurface: onSurface, // For elements on dark backgrounds if using a mixed theme
      onInverseSurface: surface,
      inversePrimary: primary.withOpacity(0.8),
    );

    return ThemeData(
      useMaterial3: true, // Enable Material 3 features
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      fontFamily: fontFamily, // Ensure Nunito is applied
      appBarTheme: AppBarTheme(
        backgroundColor: primary, // Or surface for a flatter look
        foregroundColor: onPrimary, // Text and icons on AppBar
        elevation: 2, // Subtle elevation
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: onPrimary),
        iconTheme: IconThemeData(color: onPrimary, size: 24),
      ),
      cardTheme: CardThemeData(
        elevation: 2, // Softer shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        margin: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding),
        color: surface, // Card background color
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 2,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: textTheme.labelLarge?.copyWith(color: primary),
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: BorderSide(color: primary.withOpacity(0.5), width: 1.5),
          textStyle: textTheme.labelLarge?.copyWith(color: primary),
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(color: onSurface.withOpacity(0.7)),
        hintStyle: textTheme.bodyMedium?.copyWith(color: onSurface.withOpacity(0.5)),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: onSurface.withOpacity(0.8), // Increased opacity from 0.7
        titleTextStyle: textTheme.titleMedium,
        subtitleTextStyle: textTheme.bodySmall?.copyWith(color: onSurface.withOpacity(0.85)), // Ensure subtitle text is visible
        contentPadding: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding / 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        selectedTileColor: primary.withOpacity(0.1),
        selectedColor: primary,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: surface, // Drawer background
        elevation: 4,
        width: 280, // Default drawer width
      ),
      dividerTheme: DividerThemeData(
        color: onBackground.withOpacity(0.12),
        thickness: 1,
        space: 1, // Minimal space for dividers
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 6,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: onBackground.withOpacity(0.9),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: background),
        actionTextColor: primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius / 2)),
        elevation: 4,
      ),
      // Add other component themes as needed (TabBarTheme, BottomNavigationBarTheme, etc.)
    );
  }

  // Optional: Define a dark theme as well
  // static ThemeData get darkTheme => ThemeData(...);

  // --- DARK THEME COLORS ---
  static const Color darkPrimary = Color(0xFF4DB6AC); // Teal 300
  static const Color darkPrimaryVariant = Color(0xFF26A69A); // Teal 400 (example, can be adjusted)
  static const Color darkSecondary = Color(0xFF4FC3F7); // Light Blue 300
  static const Color darkSecondaryVariant = Color(0xFF29B6F6); // Light Blue 400 (example)

  static const Color darkBackground = Color(0xFF121212); // Standard dark
  static const Color darkSurface = Color(0xFF1E1E1E); // Slightly lighter dark
  static const Color darkError = Color(0xFFCF6679); // Material dark error

  static const Color onDarkPrimary = Color(0xFF000000); // Black for high contrast on lighter primary
  static const Color onDarkSecondary = Color(0xFF000000); // Black for high contrast on lighter secondary
  static const Color onDarkBackground = Color(0xFFE0E0E0); // Light gray for text on dark background
  static const Color onDarkSurface = Color(0xFFE0E0E0); // Light gray for text on dark surface
  static const Color onDarkError = Color(0xFF000000); // Black for text on dark error color

  static const Color _darkShadowColor = Color(0x1AFFFFFF); // White with 10% opacity for dark theme shadows

  // --- DARK TEXT THEME ---
  static final TextTheme darkTextTheme = GoogleFonts.nunitoTextTheme(
    TextTheme(
      // Display
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25, color: onDarkBackground),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onDarkBackground),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0, color: onDarkBackground),
      // Headline
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: darkPrimary), // Emphasize with darkPrimary
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onDarkBackground),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.0, color: onDarkBackground, shadows: const [
          Shadow(color: _darkShadowColor, offset: Offset(0, 1), blurRadius: 2),
        ]),
      // Title
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.15, color: onDarkBackground),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: onDarkSurface),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: onDarkSurface),
      // Body
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: onDarkSurface),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: onDarkSurface),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: onDarkSurface.withOpacity(0.8)),
      // Label
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: onDarkPrimary), // For buttons (text on darkPrimary)
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onDarkSurface.withOpacity(0.85)),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: onDarkSurface.withOpacity(0.85)),
    ),
  );

  // --- DARK THEME DATA ---
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: onDarkPrimary,
      primaryContainer: darkPrimaryVariant,
      onPrimaryContainer: onDarkPrimary,
      secondary: darkSecondary,
      onSecondary: onDarkSecondary,
      secondaryContainer: darkSecondaryVariant,
      onSecondaryContainer: onDarkSecondary,
      tertiary: darkSecondary, // Can define a specific tertiary color
      onTertiary: onDarkSecondary,
      tertiaryContainer: darkSecondaryVariant,
      onTertiaryContainer: onDarkSecondary,
      error: darkError,
      onError: onDarkError,
      errorContainer: darkError.withOpacity(0.2), // Lighter version of error for containers
      onErrorContainer: onDarkError, // Text on error container
      surface: darkSurface,
      onSurface: onDarkSurface,
      surfaceContainerHighest: darkBackground.withOpacity(0.8),
      onSurfaceVariant: onDarkBackground,
      outline: onDarkBackground.withOpacity(0.3),
      shadow: Colors.black.withOpacity(0.2), // Darker shadow for dark theme
      inverseSurface: onDarkSurface, // For elements on light backgrounds if using a mixed theme
      onInverseSurface: darkSurface,
      inversePrimary: darkPrimary.withOpacity(0.8),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: darkBackground,
      textTheme: darkTextTheme,
      fontFamily: fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurface, // Or darkPrimary for a colored AppBar
        foregroundColor: onDarkSurface, // Text and icons on AppBar
        elevation: 1, // Subtle elevation for dark theme
        centerTitle: true,
        titleTextStyle: darkTextTheme.titleLarge?.copyWith(color: onDarkSurface),
        iconTheme: IconThemeData(color: onDarkSurface, size: 24),
      ),
      cardTheme: CardThemeData(
        elevation: 1, // Less pronounced shadow in dark theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        margin: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding),
        color: darkSurface, // Card background color
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimary,
          foregroundColor: onDarkPrimary,
          textStyle: darkTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 2, // Keep some elevation
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkPrimary, // Use darkPrimary for text buttons
          textStyle: darkTextTheme.labelLarge?.copyWith(color: darkPrimary),
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkPrimary,
          side: BorderSide(color: darkPrimary.withOpacity(0.7), width: 1.5), // Brighter border for dark theme
          textStyle: darkTextTheme.labelLarge?.copyWith(color: darkPrimary),
          padding: const EdgeInsets.symmetric(horizontal: largePadding, vertical: padding * 0.75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface.withOpacity(0.7), // Slightly different fill
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: darkPrimary, width: 2),
        ),
        labelStyle: darkTextTheme.bodyMedium?.copyWith(color: onDarkSurface.withOpacity(0.7)),
        hintStyle: darkTextTheme.bodyMedium?.copyWith(color: onDarkSurface.withOpacity(0.5)),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: onDarkSurface.withOpacity(0.8),
        titleTextStyle: darkTextTheme.titleMedium,
        subtitleTextStyle: darkTextTheme.bodySmall?.copyWith(color: onDarkSurface.withOpacity(0.85)),
        contentPadding: const EdgeInsets.symmetric(horizontal: padding, vertical: smallPadding / 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        selectedTileColor: darkPrimary.withOpacity(0.2), // Darker selection for dark theme
        selectedColor: darkPrimary,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: darkSurface, // Drawer background
        elevation: 2, // Standard elevation for dark theme
        width: 280,
      ),
      dividerTheme: DividerThemeData(
        color: onDarkBackground.withOpacity(0.2), // Brighter divider for dark theme
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: darkSurface,
        titleTextStyle: darkTextTheme.titleLarge,
        contentTextStyle: darkTextTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: 6, // Standard elevation
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: onDarkBackground.withOpacity(0.9), // Light background for SnackBar on dark theme
        contentTextStyle: darkTextTheme.bodyMedium?.copyWith(color: darkBackground), // Dark text on light SnackBar
        actionTextColor: darkPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius / 2)),
        elevation: 4,
      ),
      // Add other component themes as needed (TabBarTheme, BottomNavigationBarTheme, etc.)
    );
  }
}
