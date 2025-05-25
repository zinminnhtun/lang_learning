import 'package:flutter/material.dart';
import '../../data/repositories/module_repository.dart';
import '../widgets/module_card.dart';
import 'lesson_list_screen.dart';
import '../widgets/adaptive_app_bar.dart';
import '../widgets/main_drawer.dart';

class ModuleListScreen extends StatelessWidget {
  final repo = ModuleRepository();

  @override
  Widget build(BuildContext context) {
    final modules = repo.fetchModules();

    return Scaffold(
      appBar: AdaptiveAppBar(title: 'ထိုင်းစာ-ထိုင်းစကား'),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (_, i) => ModuleCard(
            module: modules[i],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LessonListScreen(module: modules[i]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
