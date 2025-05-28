// lib/core/models/quiz.dart
import 'package:lang_fusion/core/models/question.dart';

class Quiz {
  final String id;
  final String title; // e.g., "Greetings Quiz"
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}
