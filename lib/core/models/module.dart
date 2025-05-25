import 'lesson.dart';

class Module {
  final String id;
  final String title;
  final String description;
  final String icon;      // e.g. emoji or asset path
  final List<Lesson> lessons;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.lessons,
  });
}
