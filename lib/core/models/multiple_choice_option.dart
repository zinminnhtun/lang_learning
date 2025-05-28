// lib/core/models/multiple_choice_option.dart
class MultipleChoiceOption {
  final String id;
  final String text;
  final bool isCorrect;

  const MultipleChoiceOption({
    required this.id,
    required this.text,
    required this.isCorrect,
  });
}
