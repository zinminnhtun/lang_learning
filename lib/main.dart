import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'presentation/screens/module_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'LangFusion',
      theme: AppTheme.lightTheme,
      home: ModuleListScreen(),
    );
  }
}
