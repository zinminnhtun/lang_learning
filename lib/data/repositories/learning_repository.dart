// lib/data/repositories/learning_repository.dart
import 'package:lang_fusion/core/models/module.dart';
import 'package:lang_fusion/core/models/lesson.dart';
import 'package:lang_fusion/core/models/quiz.dart';
import 'package:lang_fusion/core/models/question.dart';
import 'package:lang_fusion/core/models/multiple_choice_option.dart';

class LearningRepository {
  // Mock data
  static final List<Module> _mockModules = [
    Module(
      id: "mod_basics_th",
      title: "Thai Basics for Beginners",
      description: "Start your journey into the Thai language.",
      icon: "🇹🇭",
      lessons: [
        Lesson(
          id: "les_greetings_th",
          title: "Greetings",
          subtitle: "Learn common Thai greetings.",
          quizzes: [
            Quiz(
              id: "quiz_greetings_th_1",
              title: "Greetings Quiz 1",
              questions: [
                Question(
                  id: "q_hello_th_1",
                  text: "What is 'Hello' in Thai?",
                  hint: "Starts with S.",
                  options: [
                    MultipleChoiceOption(id: 'opt_hello_1', text: 'สวัสดี (Sawasdee)', isCorrect: true),
                    MultipleChoiceOption(id: 'opt_hello_2', text: 'ลาก่อน (Laa gòn)', isCorrect: false),
                    MultipleChoiceOption(id: 'opt_hello_3', text: 'ขอบคุณ (Khòp khun)', isCorrect: false),
                  ],
                ),
                Question(
                  id: "q_thankyou_th_1",
                  text: "What is 'Thank you' in Thai (male speaker)?",
                  options: [
                    MultipleChoiceOption(id: 'opt_thankyou_1', text: 'ขอบคุณครับ (Khòp khun kráp)', isCorrect: true),
                    MultipleChoiceOption(id: 'opt_thankyou_2', text: 'ขอบคุณค่ะ (Khòp khun kâ)', isCorrect: false),
                    MultipleChoiceOption(id: 'opt_thankyou_3', text: 'ขอโทษ (Khŏr thôht)', isCorrect: false),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  Future<List<Module>> getModules() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockModules;
  }

  Future<Module?> getModuleById(String moduleId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockModules.firstWhere((module) => module.id == moduleId);
    } catch (e) {
      return null; // Not found
    }
  }

  Future<Lesson?> getLessonById(String lessonId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    for (var module in _mockModules) {
      try {
        return module.lessons.firstWhere((lesson) => lesson.id == lessonId);
      } catch (e) {
        // Lesson not found in this module, continue searching
      }
    }
    return null; // Not found in any module
  }
}
