import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../l10n/l10n.dart'; // Import for gen_l10n AppLocalizations

class MainDrawer extends StatelessWidget {
  final String userName;
  // userSubtitle and version are no longer needed as per the new design.
  // final String userSubtitle; 
  // final String version;

  const MainDrawer({
    super.key,
    required this.userName,
    // required this.userSubtitle,
    // this.version = "1.0.0", 
  });

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final loc = AppLocalizations.of(context);

    void navigateTo(String? routeName) {
      Navigator.pop(context); // Close the drawer
      if (routeName != null && currentRoute != routeName) {
        Navigator.pushNamed(context, routeName);
      }
    }

    return Drawer(
      backgroundColor: colorScheme.surface, // Use new surface color
      elevation: 0, // Keep it flat
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // User Profile Snippet
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 30.0, left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: colorScheme.primary.withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "0 XP | 0 day streak", // Placeholder
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          
          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add some horizontal padding for items
              children: [
                DrawerNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home', // Placeholder
                  isSelected: currentRoute == '/home' || currentRoute == '/',
                  onTap: () => navigateTo('/home'),
                ),
                DrawerNavItem(
                  icon: Icons.school_rounded, 
                  label: 'Learn', // Placeholder
                  isSelected: currentRoute == '/learning_modules',
                  onTap: () => navigateTo('/learning_modules'),
                ),
                DrawerNavItem(
                  icon: Icons.sync_rounded,
                  label: 'Review', // Placeholder
                  isSelected: currentRoute == '/review',
                  onTap: () => navigateTo(null), // Not tappable for now
                ),
                DrawerNavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile', // Placeholder
                  isSelected: currentRoute == '/profile',
                  onTap: () => navigateTo(null), // Not tappable for now
                ),
                DrawerNavItem(
                  icon: Icons.leaderboard_rounded,
                  label: 'Leaderboard', // Placeholder
                  isSelected: currentRoute == '/leaderboard',
                  onTap: () => navigateTo(null), // Not tappable for now
                ),
                const SizedBox(height: 16), // Spacer before settings
                const Divider(height: 1, indent: 16, endIndent: 16), // Optional divider
                const SizedBox(height: 16), // Spacer after divider
                DrawerNavItem(
                  icon: Icons.settings_rounded,
                  label: loc?.settings ?? 'Settings',
                  isSelected: currentRoute == '/settings',
                  onTap: () => navigateTo('/settings'),
                ),
              ],
            ),
          ),
          // App Version removed
        ],
      ),
    );
  }
}

class DrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Add some vertical padding between items
      child: Material(
        color: isSelected ? colorScheme.primaryContainer.withOpacity(0.5) : Colors.transparent, // Updated selected background
        borderRadius: BorderRadius.circular(8), // Rounded corners for selection
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: colorScheme.primary.withOpacity(0.1),
          highlightColor: colorScheme.primary.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24, // Slightly larger icon
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.7),
                ),
                const SizedBox(width: 20), // Increased spacing
                Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AnimatedMenuIcon is no longer used by MainDrawer with the new design, so it can be removed from this file.
// If it's used elsewhere, it should be in its own file. For now, assuming it's only for the drawer.
// class AnimatedMenuIcon extends StatefulWidget { ... } 
// class _AnimatedMenuIconState extends State<AnimatedMenuIcon> with SingleTickerProviderStateMixin { ... }
