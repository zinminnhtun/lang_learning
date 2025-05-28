import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors

// TODO: Import UserProgressProvider to get dynamic data

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProgress = Provider.of<UserProgressProvider>(context); // Example
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false, // Assuming it's a main tab
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined), // Outlined icon
            onPressed: () {
              // TODO: Navigate to settings screen
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(context /*, userProgress */),
            const SizedBox(height: 24), // Increased spacing
            
            // Stats Overview
            _buildStatsOverview(context /*, userProgress.skillProgress */),
            const SizedBox(height: 24), // Increased spacing
            
            // Achievements
            _buildAchievements(context /*, userProgress.achievements */), // Assuming achievements are part of user progress
            const SizedBox(height: 24), // Increased spacing
            
            // Learning Streak
            _buildLearningStreak(context /*, userProgress.currentStreak, userProgress.streakHistory */), // Pass necessary streak data
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context /*, UserProgressProvider progress */) {
    // TODO: Use dynamic data from provider
    String userName = 'John Doe';
    String learningLanguage = 'Spanish';
    int level = 5; //progress.level;
    int totalXp = 1250; //progress.totalXP;
    int dayStreak = 45; //progress.currentStreak;
    int achievementsCount = 12; //progress.achievements.length;


    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryBlue, AppTheme.primaryBlue.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0,5)
          )
        ]
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person_outline, // Outlined icon
              size: 60,
              color: AppTheme.primaryBlue,
            ),
            // backgroundImage: NetworkImage(user.avatarUrl) // If you have avatar URLs
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Learning $learningLanguage • Level $level',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
          ),
          const SizedBox(height: 20), // Increased spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Better distribution
            children: [
              _buildProfileStat(context, '$totalXp', 'Total XP'),
              _buildProfileStat(context, '$dayStreak', 'Day Streak'),
              _buildProfileStat(context, '$achievementsCount', 'Achievements'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
        ),
      ],
    );
  }

  Widget _buildStatsOverview(BuildContext context /*, Map<String, double> skillProgress */) {
    // TODO: Use dynamic data from provider
     Map<String, double> skillProgress = {
      'Speaking': 0.8,
      'Listening': 0.6,
      'Reading': 0.4,
      'Writing': 0.3,
    };
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Progress',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20), // Increased spacing
          if (skillProgress.isEmpty) 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(child: Text("No progress data yet.", style: Theme.of(context).textTheme.bodyMedium)),
            )
          else
            ...skillProgress.entries.map((entry) {
              // Assign colors systematically or map from skill name
              Color progressColor = AppTheme.primaryBlue;
              if (entry.key == 'Speaking') progressColor = AppTheme.successGreen;
              if (entry.key == 'Reading') progressColor = AppTheme.secondaryOrange;
              if (entry.key == 'Writing') progressColor = Colors.purpleAccent;
              
              return _buildProgressBar(context, entry.key, entry.value, progressColor);
            }).toList(),
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context, String skill, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements(BuildContext context /*, List<Achievement> achievements */) {
     // TODO: Replace with dynamic achievement data
    List<Map<String, dynamic>> achievementsData = [
      {'icon': Icons.star_border_outlined, 'color': AppTheme.secondaryOrange, 'name': 'First Lesson'},
      {'icon': Icons.local_fire_department_outlined, 'color': Colors.redAccent, 'name': '7-Day Streak'},
      {'icon': Icons.menu_book_outlined, 'color': AppTheme.primaryBlue, 'name': '100 Words'},
      {'icon': Icons.check_circle_outline, 'color': AppTheme.successGreen, 'name': 'Perfect Score'},
      {'icon': Icons.translate_outlined, 'color': Colors.teal, 'name': 'Bilingual Beginnings'},
      {'icon': Icons.forum_outlined, 'color': Colors.indigo, 'name': 'Community Helper'},
    ];


    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Achievements',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () { /* TODO: Navigate to all achievements screen */ },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (achievementsData.isEmpty)
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(child: Text("No achievements unlocked yet.", style: Theme.of(context).textTheme.bodyMedium)),
            )
          else
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Adjust based on desired size and spacing
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1, // Make them square
              ),
              itemCount: achievementsData.length > 4 ? 4 : achievementsData.length, // Show a limited number, e.g., 4 or 8
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final ach = achievementsData[index];
                return _buildAchievementBadge(context, ach['icon'] as IconData, ach['color'] as Color, ach['name'] as String);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildAchievementBadge(BuildContext context, IconData icon, Color color, String name) {
    return Tooltip(
      message: name,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.3), width: 2),
        ),
        child: Icon(icon, color: color, size: 30), // Adjust size as needed
      ),
    );
  }

  Widget _buildLearningStreak(BuildContext context /*, int currentStreak, List<bool> streakHistory */) {
    // TODO: Use dynamic data for streak and history (e.g., list of booleans for past 7 days)
    List<bool> weekStreak = [true, true, true, true, true, false, false]; // Example: 5 day streak
    List<String> daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    int currentStreak = 5;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Streak: $currentStreak Days!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              bool isActive = weekStreak[index];
              return Column(
                children: [
                  Container(
                    width: 36, // Slightly larger
                    height: 36,
                    decoration: BoxDecoration(
                      color: isActive ? AppTheme.successGreen.withOpacity(0.8) : Theme.of(context).disabledColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                       border: isActive ? Border.all(color: AppTheme.successGreen, width: 2) : null,
                    ),
                    child: Icon(
                      isActive ? Icons.check_rounded : Icons.close_rounded,
                      color: isActive ? Colors.white : Theme.of(context).disabledColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    daysOfWeek[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isActive ? AppTheme.textPrimary : Theme.of(context).disabledColor,
                        ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
