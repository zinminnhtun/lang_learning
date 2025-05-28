import 'package:flutter/material.dart';

class UserProgressProvider extends ChangeNotifier {
  int _totalXP = 1250;
  int _currentStreak = 45;
  int _level = 5;
  Map<String, double> _skillProgress = {
    'Speaking': 0.8,
    'Listening': 0.6,
    'Reading': 0.4,
    'Writing': 0.3,
  };
  // TODO: Add a list of achieved achievement IDs or objects
  // List<String> _achievedAchievements = ['first_lesson', '7_day_streak'];


  int get totalXP => _totalXP;
  int get currentStreak => _currentStreak;
  int get level => _level;
  Map<String, double> get skillProgress => Map.unmodifiable(_skillProgress); // Return unmodifiable map
  // List<String> get achievedAchievements => List.unmodifiable(_achievedAchievements);


  void addXP(int xp) {
    _totalXP += xp;
    // TODO: Implement level up logic if XP crosses a threshold
    // if (_totalXP >= xpForNextLevel(_level)) {
    //   _level++;
    //   // Potentially reset XP for the new level or carry over
    // }
    notifyListeners();
  }

  void updateSkillProgress(String skill, double progress) {
    if (_skillProgress.containsKey(skill)) {
      _skillProgress[skill] = progress.clamp(0.0, 1.0); // Ensure progress is between 0 and 1
      notifyListeners();
    }
  }
  
  void incrementStreak() {
    _currentStreak++;
    notifyListeners();
  }

  void resetStreak() {
    _currentStreak = 0;
    notifyListeners();
  }

  // void unlockAchievement(String achievementId) {
  //   if (!_achievedAchievements.contains(achievementId)) {
  //     _achievedAchievements.add(achievementId);
  //     notifyListeners();
  //   }
  // }

  // Example: xpForNextLevel - this would typically be more complex
  // int xpForNextLevel(int currentLevel) {
  //   return (currentLevel * 100) + 500; // e.g. Level 1 needs 600XP, Level 2 needs 700XP for next
  // }
}
