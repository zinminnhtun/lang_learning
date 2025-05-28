import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors

// TODO: Import providers if data is fetched from them (e.g., LearningProvider for stats/mistakes)

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        automaticallyImplyLeading: false, // Assuming it's a main tab
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Review Stats
            _buildReviewStats(context),
            const SizedBox(height: 20),
            
            // Review Categories
            Text(
              'What would you like to review?',
              style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildReviewCategories(context),
            const SizedBox(height: 20),
            
            // Recent Mistakes
            _buildRecentMistakes(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewStats(BuildContext context) {
    // TODO: Replace with dynamic data from a provider
    String wordsReviewed = '45';
    String accuracy = '87%';
    String streak = '5 days';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.successGreen, AppTheme.successGreen.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
           BoxShadow(
            color: AppTheme.successGreen.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(context, 'Words Reviewed', wordsReviewed),
              _buildStatItem(context, 'Accuracy', accuracy),
              _buildStatItem(context, 'Streak', streak),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value) {
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
                color: Colors.white.withOpacity(0.9),
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildReviewCategories(BuildContext context) {
    // TODO: Counts could be dynamic
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCategoryCard(
                context,
                'Vocabulary Review',
                'Review learned words',
                Icons.book_outlined, // Changed icon
                AppTheme.primaryBlue,
                23, // Example count
                () { /* TODO: Navigate to vocabulary review */ }
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCategoryCard(
                context,
                'Mistake Review',
                'Practice difficult words',
                Icons.error_outline,
                AppTheme.secondaryOrange,
                8, // Example count
                () { /* TODO: Navigate to mistake review */ }
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildCategoryCard(
                context,
                'Pronunciation',
                'Speaking practice',
                Icons.mic_outlined, // Changed icon
                AppTheme.successGreen,
                12, // Example count
                () { /* TODO: Navigate to pronunciation practice */ }
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCategoryCard(
                context,
                'Grammar',
                'Sentence structure',
                Icons.sticky_note_2_outlined, // Changed icon
                Colors.purpleAccent, // Using a distinct color
                5, // Example count
                () { /* TODO: Navigate to grammar review */ }
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String subtitle, IconData icon, Color color, int count, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200, width: 1), // Subtle border
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 28), // Increased size slightly
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentMistakes(BuildContext context) {
    // TODO: Replace with dynamic list of mistakes from a provider
    List<Map<String, String>> mistakes = [
      {'word': 'Por favor', 'correct': 'Please', 'mistake': 'You answered: "Por favor" → "Thank you"'},
      {'word': 'Gracias', 'correct': 'Thank you', 'mistake': 'You answered: "Gracias" → "Goodbye"'},
      {'word': 'Sí', 'correct': 'Yes', 'mistake': 'You answered: "Sí" → "No"'},
    ];

    if (mistakes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text('No recent mistakes to review. Great job!', style: Theme.of(context).textTheme.bodyMedium),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Mistakes',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mistakes.length > 3 ? 3 : mistakes.length, // Show max 3 or less
          itemBuilder: (context, index) {
            final item = mistakes[index];
            return _buildMistakeItem(
              context,
              item['word']!,
              item['correct']!,
              item['mistake']!,
            );
          },
        ),
        if (mistakes.length > 3)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(onPressed: () { /* TODO: Navigate to full mistakes list */}, child: Text('View All Mistakes')),
          )
      ],
    );
  }

  Widget _buildMistakeItem(BuildContext context, String word, String correct, String mistake) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.secondaryOrange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                word,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue,
                    ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, size: 16, color: AppTheme.textSecondary),
              const SizedBox(width: 8),
              Text(
                correct,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            mistake,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){ /* TODO: Add to review session or view details */}, child: Text('Review This')),
          )
        ],
      ),
    );
  }
}
