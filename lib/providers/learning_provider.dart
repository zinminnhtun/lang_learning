import 'package:flutter/material.dart';

class LearningProvider extends ChangeNotifier {
  List<String> _reviewWords = []; // Words marked for general review
  List<String> _mistakeWords = []; // Words the user made mistakes on
  
  int _dailyGoalMinutes = 15; // Default daily goal
  int _completedMinutesToday = 10; // Example, load from storage

  List<String> get reviewWords => List.unmodifiable(_reviewWords);
  List<String> get mistakeWords => List.unmodifiable(_mistakeWords);
  
  int get dailyGoalMinutes => _dailyGoalMinutes;
  int get completedMinutesToday => _completedMinutesToday;
  
  double get dailyProgress {
    if (_dailyGoalMinutes == 0) return 0.0; // Avoid division by zero
    return (_completedMinutesToday / _dailyGoalMinutes).clamp(0.0, 1.0);
  }

  void addReviewWord(String word) {
    if (!_reviewWords.contains(word)) {
      _reviewWords.add(word);
      notifyListeners();
      // TODO: Persist reviewWords to shared_preferences or database
    }
  }

  void removeReviewWord(String word) {
    if (_reviewWords.contains(word)) {
      _reviewWords.remove(word);
      notifyListeners();
      // TODO: Update persisted reviewWords
    }
  }

  void addMistakeWord(String word) {
    if (!_mistakeWords.contains(word)) {
      _mistakeWords.add(word);
      notifyListeners();
      // TODO: Persist mistakeWords
    }
  }

  void removeMistakeWord(String word) {
     if (_mistakeWords.contains(word)) {
      _mistakeWords.remove(word);
      notifyListeners();
      // TODO: Update persisted mistakeWords
    }
  }

  void clearMistakes() {
    _mistakeWords.clear();
    notifyListeners();
    // TODO: Update persisted mistakeWords
  }

  void updateDailyProgress(int minutes) {
    _completedMinutesToday = minutes.clamp(0, _dailyGoalMinutes * 2); // Allow exceeding goal but cap reasonably
    notifyListeners();
    // TODO: Persist completedMinutesToday
  }

  void setDailyGoal(int minutes) {
    if (minutes > 0) {
      _dailyGoalMinutes = minutes;
      notifyListeners();
      // TODO: Persist dailyGoalMinutes
    }
  }

  // TODO: Methods to load initial state from SharedPreferences or other storage
  // Future<void> loadInitialData() async {
  //   // Load _reviewWords, _mistakeWords, _dailyGoalMinutes, _completedMinutesToday
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // _dailyGoalMinutes = prefs.getInt('dailyGoal') ?? 15;
  //   // ... etc.
  //   notifyListeners(); // Notify after loading all data
  // }
}
