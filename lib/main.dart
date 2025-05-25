import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/theme_notifier.dart';
import 'presentation/screens/module_list_screen.dart';
import 'presentation/screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) => MaterialApp(
          title: 'LangFusion',
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.themeMode,
          home: ModuleListScreen(),
          routes: {
            '/settings': (_) => SettingsScreen(),
          },
        ),
      ),
    );
  }
}
