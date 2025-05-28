// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/theme_notifier.dart';
import 'l10n/l10n.dart'; // Correct relative import for l10n.dart
import 'core/providers/language_provider.dart';
// import 'presentation/screens/word_list_screen.dart';
import 'presentation/screens/settings_screen.dart';
import 'presentation/screens/module_list_screen.dart';
import 'presentation/screens/learning_modules_screen.dart';
import 'presentation/widgets/main_drawer.dart' as app_drawer;

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
          home: const HomeScreen(),
          locale: languageProvider.currentLocale,
          // Use AppLocalizations.supportedLocales directly
          supportedLocales: AppLocalizations.supportedLocales,
          // Use AppLocalizations.localizationsDelegates directly
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routes: {
            '/home': (_) => const HomeScreen(),
            '/modules': (_) => ModuleListScreen(),
            '/settings': (_) => SettingsScreen(),
            '/learning_modules': (_) => const LearningModulesScreen(),
          },
        ),
      ),
    );
  }
}

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

    // Use AppLocalizations for userName, and placeholders for others
    final String userName = AppLocalizations.of(context)?.yourName ?? 'User Name';
    const String userSubtitle = 'Student'; // Placeholder
    final String currentTitle = AppLocalizations.of(context)?.modules ?? 'Modules'; // Using getter if available, else placeholder

    final mainDrawer = app_drawer.MainDrawer(
      userName: userName,
      userSubtitle: userSubtitle,
    );

    Widget currentScreenBody = ModuleListScreen();
    // String currentTitle = 'Modules'; // Placeholder, already handled above

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
