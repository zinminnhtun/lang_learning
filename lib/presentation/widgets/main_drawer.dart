import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../core/localization/app_localizations.dart';
import 'package:flutter/services.dart';

class MainDrawer extends StatelessWidget {
  final String userName;
  final String userSubtitle;
  final String version;

  const MainDrawer({super.key, 
    required this.userName,
    required this.userSubtitle,
    this.version = "1.0.0",
  });

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    
    // Helper function to handle navigation and close drawer
    void navigateTo(String routeName) {
      Navigator.pop(context); // Close the drawer
      // Prevent pushing the same route again if already on it
      if (currentRoute != routeName) {
        Navigator.pushNamed(context, routeName);
      }
    }

    return Drawer(
      backgroundColor: colorScheme.surface,
      elevation: 0, // Flatter design
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary,
                  colorScheme.secondary,
                ],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // User Avatar
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white.withOpacity(0.25),
                      child: Text(
                        userName.characters.first.toUpperCase(),
                        style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // User Name
                  Text(
                    userName,
                    style: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  // User Status/Role
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      userSubtitle,
                      style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Navigation Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                DrawerNavItem(
                  icon: Icons.home_rounded,
                  label: AppLocalizations.of(context).translate('home'),
                  onTap: () => navigateTo('/home'),
                  isSelected: currentRoute == '/home' || currentRoute == '/',
                ),
                DrawerNavItem(
                  icon: Icons.menu_book_rounded,
                  label: AppLocalizations.of(context).translate('modules'),
                  onTap: () => navigateTo('/modules'),
                  isSelected: currentRoute == '/modules',
                ),
                DrawerNavItem( // New Item for Learning Modules
                  icon: Icons.school_rounded,
                  label: AppLocalizations.of(context).translate('learning_modules_title'),
                  onTap: () => navigateTo('/learning_modules'),
                  isSelected: currentRoute == '/learning_modules',
                ),
                DrawerNavItem(
                  icon: Icons.favorite_rounded,
                  label: AppLocalizations.of(context).translate('favorites'),
                  onTap: () => navigateTo('/favorites'),
                  isSelected: currentRoute == '/favorites',
                ),
                DrawerNavItem(
                  icon: Icons.bar_chart_rounded,
                  label: AppLocalizations.of(context).translate('progress'),
                  onTap: () => navigateTo('/progress'),
                  isSelected: currentRoute == '/progress',
                ),
                
                // Divider with label
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(color: colorScheme.onSurface.withOpacity(0.2)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          AppLocalizations.of(context).translate('settings').toUpperCase(),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: colorScheme.onSurface.withOpacity(0.2)),
                      ),
                    ],
                  ),
                ),
                
                DrawerNavItem(
                  icon: Icons.settings_rounded,
                  label: AppLocalizations.of(context).translate('settings'),
                  onTap: () => navigateTo('/settings'),
                  isSelected: currentRoute == '/settings',
                ),
                DrawerNavItem(
                  icon: Icons.language_rounded,
                  label: AppLocalizations.of(context).translate('language'),
                  onTap: () => navigateTo('/settings'),
                  showChevron: false,
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppLocalizations.of(context).currentLanguageName,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // App Version
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
                const SizedBox(width: 8),
                Text(
                  '${AppLocalizations.of(context).translate('app_version')}: $version',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedMenuIcon extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onTap;
  const AnimatedMenuIcon({super.key, 
    required this.isOpen,
    required this.onTap,
  });

  @override
  State<AnimatedMenuIcon> createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.isOpen) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedMenuIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          widget.onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            size: 28,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class DrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final bool showChevron;
  final Widget? trailing;

  const DrawerNavItem({super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.showChevron = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          splashColor: colorScheme.primary.withOpacity(0.1),
          highlightColor: colorScheme.primary.withOpacity(0.05),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primary.withOpacity(0.08) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isSelected 
                ? Border.all(color: colorScheme.primary.withOpacity(0.2), width: 1) 
                : null,
            ),
            child: Row(
              children: [
                // Left indicator for selected item
                if (isSelected)
                  Container(
                    width: 4,
                    height: 24,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                
                // Icon
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.75),
                ),
                const SizedBox(width: 16),
                
                // Label
                Expanded(
                  child: Text(
                    label,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                    ),
                  ),
                ),
                
                // Trailing widget or chevron
                if (trailing != null)
                  trailing!
                else if (showChevron)
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: colorScheme.onSurface.withOpacity(0.4),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
