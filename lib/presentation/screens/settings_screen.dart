import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDark,
            onChanged: (val) => themeNotifier.toggleTheme(val),
            secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
    );
  }
} 