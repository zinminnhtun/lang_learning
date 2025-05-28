import 'package:flutter/material.dart';
import '../../data/repositories/module_repository.dart';
import '../widgets/module_card.dart';
import 'lesson_list_screen.dart';

class ModuleListScreen extends StatelessWidget {
  const ModuleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ModuleRepository();
    final modules = repo.fetchModules();
    const double breakpoint = 600.0;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < breakpoint) {
          // Use ListView for narrower screens
          return Padding(
            padding: const EdgeInsets.all(16),
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
          );
        } else {
          // Use GridView for wider screens
          int crossAxisCount = (constraints.maxWidth / 250).floor(); // Adjust 250 based on desired card width
          crossAxisCount = crossAxisCount > 1 ? crossAxisCount : 2; // Ensure at least 2 columns

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 3 / 2, // Adjust aspect ratio as needed
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
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
          );
        }
      },
    );
  }
}
