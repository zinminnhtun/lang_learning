// lib/core/models/question.dart
import 'package:lang_fusion/core/models/multiple_choice_option.dart';

class Question {
  final String id;
  final String text; // This is the question text
  final List<MultipleChoiceOption> options;
  final String? hint; // Nullable, for an optional hint

  const Question({
    required this.id,
    required this.text,
    required this.options,
    this.hint,
  });
}
