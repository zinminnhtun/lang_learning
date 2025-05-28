import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors

// TODO: Import providers if data (e.g. user name for leaderboard) is fetched from them

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        automaticallyImplyLeading: false, // Assuming it's a main tab
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leaderboard
            _buildLeaderboard(context),
            const SizedBox(height: 24), // Increased spacing
            
            // Challenges
            _buildChallenges(context),
            const SizedBox(height: 24), // Increased spacing
            
            // Community Feed
            _buildCommunityFeed(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboard(BuildContext context) {
    // TODO: Replace with dynamic data
    // Example: Current user's rank could be highlighted
    int currentUserRank = 2; // Example

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
            'Weekly Leaderboard',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5, // Show top 5 or so
            itemBuilder: (context, index) {
              // Simulate data
              String userName = 'User ${index + 1}';
              if (index + 1 == currentUserRank) userName = 'You (John Doe)'; // Example
              return _buildLeaderboardItem(
                context,
                index + 1,
                userName,
                '${1500 - (index * 200)} XP',
                index + 1 == currentUserRank, 
              );
            },
          ),
           const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){/* TODO: Navigate to full leaderboard */}, child: Text('View Full Leaderboard')),
          )
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(BuildContext context, int rank, String name, String xp, bool isCurrentUser) {
    Color rankColor = rank <= 3 ? AppTheme.secondaryOrange : Theme.of(context).disabledColor;
    Color textColor = rank <=3 ? Colors.white : AppTheme.textPrimary;
    if (isCurrentUser && rank > 3) rankColor = AppTheme.primaryBlue; // Highlight current user even if not top 3

    return Container(
      margin: const EdgeInsets.only(bottom: 10), // Increased spacing
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrentUser ? AppTheme.primaryBlue.withOpacity(0.1) : Theme.of(context).canvasColor, // Subtle highlight
        borderRadius: BorderRadius.circular(12), // More rounded
        border: isCurrentUser ? Border.all(color: AppTheme.primaryBlue, width: 1.5) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 36, // Slightly larger
            height: 36,
            decoration: BoxDecoration(
              color: rankColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16), // Increased spacing
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            xp,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildChallenges(BuildContext context) {
    // TODO: Replace with dynamic challenge data
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Challenges', // Renamed for clarity
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
             TextButton(onPressed: (){/* TODO: Navigate to all challenges */}, child: Text('View All')),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150, // Increased height for better content display
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildChallengeCard(
                context,
                'Speed Learning',
                'Complete 10 lessons in 3 days',
                0.2, // Progress as double (2/10)
                '2/10 lessons',
                AppTheme.primaryBlue,
                () {/* TODO: View Challenge Details */}
              ),
              _buildChallengeCard(
                context,
                'Perfect Week',
                'Get 100% accuracy for 7 days',
                0.42, // Progress (3/7)
                '3/7 days',
                AppTheme.successGreen,
                () {/* TODO: View Challenge Details */}
              ),
              _buildChallengeCard(
                context,
                'Vocabulary Master',
                'Learn 50 new words this week',
                0.64, // Progress (32/50)
                '32/50 words',
                AppTheme.secondaryOrange,
                () {/* TODO: View Challenge Details */}
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChallengeCard(BuildContext context, String title, String description, double progressValue, String progressText, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 220, // Increased width
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5), width: 1.5), // Thicker border
           boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 4),
            Text(
              progressText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityFeed(BuildContext context) {
    // TODO: Replace with dynamic feed items
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Community Feed',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(icon: Icon(Icons.add_circle_outline), onPressed: (){ /* TODO: Create new post */ }, tooltip: 'New Post')
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3, // Show a few items
          itemBuilder: (context, index) {
            // Simulate data
            return _buildFeedItem(
              context,
              'Maria Rodriguez', // name
              'https://randomuser.me/api/portraits/women/${index+10}.jpg', // avatarUrl
              '2 hours ago', // time
              'Just completed my 30-day streak! 🎉 Spanish is getting easier every day. Thanks to everyone for the motivation!', // content
              12 + index * 3, // likes
              3 + index, // comments
              index % 2 == 0 // isLiked (example)
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeedItem(BuildContext context, String name, String avatarUrl, String time, String content, int likes, int comments, bool isLiked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShad<ctrl61>ow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.primaryBlue.withOpacity(0.2),
                // backgroundImage: NetworkImage(avatarUrl), // Use CachedNetworkImage for production
                child: avatarUrl.isNotEmpty ? ClipOval(child: Image.network(avatarUrl, fit: BoxFit.cover, width: 40, height: 40, errorBuilder: (c, o, s) => Icon(Icons.person, color: AppTheme.primaryBlue))) : Icon(Icons.person, color: AppTheme.primaryBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: (){ /* TODO: More options for post */})
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: () { /* TODO: Handle like */ },
                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.redAccent: AppTheme.textSecondary),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const SizedBox(width: 4),
              Text('$likes'),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () { /* TODO: Handle comment */ },
                icon: const Icon(Icons.comment_outlined, color: AppTheme.textSecondary),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const SizedBox(width: 4),
              Text('$comments'),
              const Spacer(),
              IconButton(
                onPressed: () { /* TODO: Handle share */ },
                icon: const Icon(Icons.share_outlined, color: AppTheme.textSecondary),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
