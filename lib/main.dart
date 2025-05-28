// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/theme_notifier.dart';
import 'l10n/l10n.dart'; // Corrected import for localization
import 'core/providers/language_provider.dart';
// import 'presentation/screens/word_list_screen.dart'; // Assuming this is for a different feature
import 'presentation/screens/settings_screen.dart';
import 'presentation/screens/module_list_screen.dart'; // This might be the original/generic module list
import 'presentation/screens/learning_modules_screen.dart'; // Import new screen
import 'presentation/widgets/main_drawer.dart' as app_drawer; // Import with alias

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer2<ThemeNotifier, LanguageProvider>(
        builder: (context, themeNotifier, languageProvider, _) => MaterialApp(
          title: 'Lang Fusion',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
          home: const HomeScreen(), // Assuming HomeScreen is the main entry point with the drawer
          locale: languageProvider.currentLocale,
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('my', ''), // Burmese
            Locale('zh', ''), // Chinese
            Locale('th', ''), // Thai
          ],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routes: {
            '/home': (_) => const HomeScreen(),
            '/modules': (_) => ModuleListScreen(), // Existing module screen
            '/settings': (_) => SettingsScreen(),
            '/learning_modules': (_) => const LearningModulesScreen(), // New route
          },
        ),
      ),
    );
  }
}

// Assuming HomeScreen is where the MainDrawer is typically placed.
// If ModuleListScreen was the original 'home', this structure might need adjustment,
// but for this task, HomeScreen is assumed as the one with the drawer.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double wideScreenBreakpoint = 1200.0;
    final bool isWideScreen = screenWidth > wideScreenBreakpoint;

    final mainDrawer = app_drawer.MainDrawer(
      userName: S.of(context).translate('userName'), // Using translate method
      userSubtitle: S.of(context).translate('userSubtitle'), // Using translate method
    );

    // Using ModuleListScreen as the body for HomeScreen for now.
    // This might be swapped with LearningModulesScreen or another widget based on app flow.
    Widget currentScreenBody = ModuleListScreen();
    String currentTitle = S.of(context).translate('modules'); // Default title for home, using translate method

    // Example: If you want LearningModulesScreen to be the default on wide screens
    // if (isWideScreen) {
    //   currentScreenBody = const LearningModulesScreen();
    //   currentTitle = S.of(context).learning_modules_title;
    // }


    if (isWideScreen) {
      return Scaffold(
        appBar: AppBar(
          title: Text(currentTitle),
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            SizedBox(
              width: 280,
              child: mainDrawer,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: currentScreenBody,
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        drawer: mainDrawer,
        appBar: AppBar(
          title: Text(currentTitle),
        ),
        body: currentScreenBody,
      );
    }
  }
}
