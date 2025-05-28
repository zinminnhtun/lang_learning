// lib/core/models/lesson.dart
import 'package:lang_fusion/core/models/quiz.dart'; // Or import 'quiz.dart';

class Lesson {
  final String id;
  final String title;
  final String subtitle; // e.g. “Phrases you need”
  final List<Quiz> quizzes; // New field
  // you’ll expand this later—e.g. List<Word>, audio URLs…

  Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.quizzes, // Added to constructor
  });
}
