// lib/presentation/screens/learning_modules_screen.dart
import 'package:flutter/material.dart';
import 'package:lang_fusion/data/repositories/learning_repository.dart';
import 'package:lang_fusion/core/models/module.dart';
import '../../l10n/l10n.dart'; // Corrected to relative import path

class LearningModulesScreen extends StatefulWidget {
  const LearningModulesScreen({super.key});

  @override
  State<LearningModulesScreen> createState() => _LearningModulesScreenState();
}

class _LearningModulesScreenState extends State<LearningModulesScreen> {
  final LearningRepository _learningRepository = LearningRepository();
  late Future<List<Module>> _modulesFuture;

  @override
  void initState() {
    super.initState();
    _modulesFuture = _learningRepository.getModules();
  }

  @override
  Widget build(BuildContext context) {
    // Use placeholder as direct getter is not available on AppLocalizations (S)
    const String appBarTitle = 'Learning Modules'; 

    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: FutureBuilder<List<Module>>(
        future: _modulesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            const String noModulesText = "No modules found."; // Placeholder
            return const Center(child: Text(noModulesText));
          } else {
            final modules = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final module = modules[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Text(module.icon, style: const TextStyle(fontSize: 28)),
                    title: Text(module.title, style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(module.description, style: Theme.of(context).textTheme.bodyMedium),
                    onTap: () {
                      // TODO: Navigate to module details screen (e.g., lesson list for this module)
                      print('Tapped on module: ${module.id} - ${module.title}');
                      // Example: Navigator.pushNamed(context, '/module_detail', arguments: module.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
