import 'package:flutter/material.dart';
import '../../core/models/module.dart';

class LessonListScreen extends StatelessWidget {
  final Module module;

  LessonListScreen({required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: module.id,
              child: Text(module.icon, style: TextStyle(fontSize: 28)),
            ),
            SizedBox(width: 12),
            Text(module.title),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: module.lessons.length,
        itemBuilder: (_, i) {
          final lesson = module.lessons[i];
          return ListTile(
            title: Text(lesson.title),
            subtitle: Text(lesson.subtitle),
            onTap: () {
              // TODO: navigate into lesson detail when you're ready
            },
          );
        },
      ),
    );
  }
}
