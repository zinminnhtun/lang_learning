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
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.themeMode,
          home: const HomeScreen(),
          locale: languageProvider.currentLocale,
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('my', ''), // Burmese
            Locale('zh', ''), // Chinese
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

    final mainDrawer = MainDrawer(
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _drawerOpen = false;

  void _toggleDrawer() {
    if (_drawerOpen) {
      Navigator.of(context).pop();
    } else {
      _scaffoldKey.currentState?.openEndDrawer();
    }
    setState(() {
      _drawerOpen = !_drawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(
        userName: 'သင့်နာမည်',
        userSubtitle: 'အသုံးပြုသူအဆင့်',
      ),
      appBar: AppBar(
        // No title, default hamburger menu on the left
      ),
      body: ModuleListScreen(),
    );
  }
}

class MainDrawer extends StatelessWidget {
  final String userName;
  final String userSubtitle;
  final String version;

  const MainDrawer({
    super.key,
    required this.userName,
    required this.userSubtitle,
    this.version = "1.0.0",
  });

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width * 0.8;
    return Drawer(
      width: drawerWidth > 350 ? 350 : drawerWidth,
      child: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppTheme.secondary,
                    child: Text(
                      userName.characters.first,
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    userSubtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  _DrawerItem(
                    icon: Icons.home,
                    label: 'ပင်မစာမျက်နှာ',
                    onTap: () {},
                  ),
                  _DrawerItem(
                    icon: Icons.menu_book,
                    label: 'သင်ခန်းစာများ',
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WordListScreen()),
                      );
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.favorite,
                    label: 'အကြိုက်ဆုံးများ',
                    onTap: () {},
                  ),
                  _DrawerItem(
                    icon: Icons.bar_chart,
                    label: 'တိုးတက်မှု',
                    onTap: () {},
                  ),
                  _DrawerItem(
                    icon: Icons.settings,
                    label: 'ဆက်တင်များ',
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Version Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Text(
                    'အပလီကေးရှင်း',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'ဗားရှင်း: $version',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.secondary),
      title: Text(label, style: Theme.of(context).textTheme.titleMedium),
      onTap: onTap,
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: AppTheme.secondary.withOpacity(0.08),
    );
  }
}
