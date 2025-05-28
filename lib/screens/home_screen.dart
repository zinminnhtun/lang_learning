import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors and styles

// TODO: Import providers if data is fetched from them, e.g., UserProgressProvider

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing theme data for consistent styling
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Good morning, John!'), // Consider making name dynamic
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notification functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.military_tech_outlined), // Changed from Icons.streak to something more fitting for achievements/streaks
            onPressed: () {
              // TODO: Implement streak/achievement view functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daily Goal Card
            _buildDailyGoalCard(context),
            const SizedBox(height: 20),
            
            // Current Learning Focus
            _buildCurrentFocusCard(context),
            const SizedBox(height: 20),
            
            // Progress Overview
            _buildProgressOverview(context),
            const SizedBox(height: 20),
            
            // Quick Actions
            Text(
              'Quick Actions',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            _buildQuickActions(context),
            const SizedBox(height: 20),
            
            // Achievements
            _buildAchievements(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyGoalCard(BuildContext context) {
    // TODO: Replace static data with data from LearningProvider
    double dailyProgress = 0.7; // Example: 10 completed / 15 goal
    String progressText = '10 minutes completed • 5 minutes to go';
    String goalText = '15 min';

    return Container(
      padding: const EdgeInsets.all(20),
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
                'Daily Goal',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  goalText, // Dynamic from provider
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: dailyProgress, // Dynamic from provider
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 12),
          Text(
            progressText, // Dynamic from provider
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentFocusCard(BuildContext context) {
    // TODO: Replace with dynamic data
    String courseName = 'Spanish Basics';
    String lessonName = 'Lesson 3: Greetings & Introductions';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Use theme card color
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
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school,
                  color: AppTheme.secondaryOrange,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      lessonName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to the current lesson
              // Navigator.of(context).pushNamed('/lesson', arguments: {/* pass lesson id */});
            },
            child: const Text('Continue Learning'),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressOverview(BuildContext context) {
    // TODO: Replace with dynamic data from UserProgressProvider
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
            'Your Progress',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildSkillProgress(context, 'Speaking', skillProgress['Speaking']!, AppTheme.successGreen),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSkillProgress(context, 'Listening', skillProgress['Listening']!, AppTheme.primaryBlue),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSkillProgress(context, 'Reading', skillProgress['Reading']!, AppTheme.secondaryOrange),
              ),
              const SizedBox(width: 16),
              Expanded(
                // Added a default color for Writing if not in AppTheme
                child: _buildSkillProgress(context, 'Writing', skillProgress['Writing']!, Colors.purpleAccent), 
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillProgress(BuildContext context, String skill, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
        const SizedBox(height: 4),
        Text(
          '${(progress * 100).toInt()}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            context,
            'Vocabulary\nReview',
            Icons.book_outlined, // Changed to outlined
            AppTheme.primaryBlue,
            () {
              // TODO: Navigate to Vocabulary Review
              // Navigator.of(context).pushNamed('/review', arguments: {'type': 'vocabulary'});
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionCard(
            context,
            'Mistake\nReview',
            Icons.error_outline,
            AppTheme.secondaryOrange,
            () {
              // TODO: Navigate to Mistake Review
              // Navigator.of(context).pushNamed('/review', arguments: {'type': 'mistakes'});
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionCard(
            context,
            'Pronunciation\nPractice',
            Icons.mic_outlined, // Changed to outlined
            AppTheme.successGreen,
            () {
              // TODO: Navigate to Pronunciation Practice
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary, // Ensure text color contrasts with card
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements(BuildContext context) {
    // TODO: Fetch achievements dynamically
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Achievements',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to all achievements screen
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100, // Adjust height as needed
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildAchievementBadge(context, 'First Lesson', Icons.star_border_outlined, AppTheme.secondaryOrange),
              _buildAchievementBadge(context, '7-Day Streak', Icons.local_fire_department_outlined, Colors.redAccent),
              _buildAchievementBadge(context, '100 Words', Icons.menu_book_outlined, AppTheme.primaryBlue),
              _buildAchievementBadge(context, 'Perfect Score', Icons.check_circle_outline, AppTheme.successGreen),
              // Add more badges or load dynamically
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(BuildContext context, String title, IconData icon, Color color) {
    return Container(
      width: 80, // Fixed width for consistent sizing
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.3), width: 2),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
