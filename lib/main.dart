import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/theme_notifier.dart';
import 'generated/l10n.dart'; 
import 'core/providers/language_provider.dart';
import 'presentation/screens/word_list_screen.dart';
import 'presentation/screens/settings_screen.dart';
import 'presentation/screens/module_list_screen.dart';
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
          darkTheme: AppTheme.darkTheme, // Use the new dark theme
          themeMode: themeNotifier.themeMode,
          home: const HomeScreen(),
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
            '/home': (_) => HomeScreen(),
            '/modules': (_) => ModuleListScreen(),
            '/settings': (_) => SettingsScreen(),
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

    // Use the imported MainDrawer
    final mainDrawer = app_drawer.MainDrawer(
      userName: S.of(context).translate('userName'),
      userSubtitle: S.of(context).translate('userSubtitle'),
    );

    if (isWideScreen) {
      // Wide screen layout: Persistent drawer
      return Scaffold(
        appBar: AppBar(
          title: Text('LangFusion'), // Or your app title
          automaticallyImplyLeading: false, // No hamburger icon
        ),
        body: Row(
          children: [
            SizedBox(
              width: 280, // Fixed width for the persistent drawer
              child: mainDrawer,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: ModuleListScreen(),
            ),
          ],
        ),
      );
    } else {
      // Narrow screen layout: Slide-out drawer
      return Scaffold(
        drawer: mainDrawer,
        appBar: AppBar(
          title: Text('LangFusion'), // Or your app title
          // Hamburger icon will be automatically added by Scaffold
        ),
        body: ModuleListScreen(),
      );
    }
  }
}
// Removed MyHomePage, local MainDrawer, and local _DrawerItem classes
// The HomeScreen now explicitly uses app_drawer.MainDrawer from the widgets directory.
// Localization delegates are unaffected.
