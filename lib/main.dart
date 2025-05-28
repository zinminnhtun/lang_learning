import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import screen files that will be created later
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/lesson_screen.dart';
import 'screens/review_screen.dart';
import 'screens/profile_screen.dart'; // Assuming ProfileScreen is used in routes

// Import providers that will be created later
import 'providers/user_progress_provider.dart';
import 'providers/learning_provider.dart';
import 'theme.dart'; // For ThemeProvider and AppTheme

// Main App Entry Point
void main() {
  runApp(const LinguaApp());
}

class LinguaApp extends StatelessWidget {
  const LinguaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProgressProvider()),
        ChangeNotifierProvider(create: (_) => LearningProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Lingua - Language Learning',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
            routes: {
              '/home': (context) => const MainScreen(),
              '/lesson': (context) => const LessonScreen(),
              '/review': (context) => const ReviewScreen(),
              '/profile': (context) => const ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}
