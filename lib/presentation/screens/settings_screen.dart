import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/theme_notifier.dart';
import '../../core/providers/language_provider.dart';
import '../../l10n/l10n.dart'; // Changed import for gen_l10n
import '../../core/localization/language.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isDark = themeNotifier.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final loc = AppLocalizations.of(context); // Nullable AppLocalizations

    return Scaffold(
      appBar: AppBar(
        title: Text(loc?.settings ?? 'Settings'), // Updated
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // Appearance Section
          _SettingsSectionHeader(
            title: 'Theme', // Placeholder
            icon: Icons.palette_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: colorScheme.surface,
              child: SwitchListTile(
                title: Text(loc?.darkMode ?? 'Dark Mode'), // Updated
                subtitle: Text(
                  isDark 
                    ? 'Dark appearance is currently active' // Placeholder/Literal
                    : 'Light appearance is currently active', // Placeholder/Literal
                  style: textTheme.bodySmall,
                ),
                value: isDark,
                onChanged: (val) {
                  HapticFeedback.lightImpact();
                  themeNotifier.toggleTheme(val);
                },
                secondary: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Language Section
          _SettingsSectionHeader(
            title: loc?.language ?? 'Language', // Updated
            icon: Icons.language_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: colorScheme.surface,
              child: Column(
                // Language.supportedLanguages and _LanguageListTile remain as is
                children: Language.supportedLanguages.map((language) {
                  final isSelected = languageProvider.currentLocale.languageCode == language.code;
                  return _LanguageListTile(
                    language: language,
                    isSelected: isSelected,
                    onTap: () {
                      if (!isSelected) {
                        HapticFeedback.selectionClick();
                        languageProvider.changeLanguage(language.code);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Notifications Section
          _SettingsSectionHeader(
            title: 'Notifications', // Placeholder
            icon: Icons.notifications_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: colorScheme.surface,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Learning reminders'), // Hardcoded
                    subtitle: const Text('Daily notifications to continue learning'), // Hardcoded
                    value: true, // Example value
                    onChanged: (val) {
                      HapticFeedback.lightImpact();
                      // Implement notification settings
                    },
                    secondary: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorScheme.secondary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.notifications_active_rounded,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  Divider(indent: 72, height: 1),
                  SwitchListTile(
                    title: const Text('New content'), // Hardcoded
                    subtitle: const Text('Notify when new modules are available'), // Hardcoded
                    value: true, // Example value
                    onChanged: (val) {
                      HapticFeedback.lightImpact();
                      // Implement notification settings
                    },
                    secondary: null, // No icon for this one
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // About
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _AboutCard(), // _AboutCard uses placeholder for its title
          ),
        ],
      ),
    );
  }
}

class _SettingsSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SettingsSectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(), // Title is passed, could be localized or placeholder
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageListTile extends StatelessWidget {
  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageListTile({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary.withOpacity(0.1),
          child: Text(
            language.flag,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        title: Text(language.name),
        subtitle: Text(language.nativeName),
        trailing: isSelected
            ? Icon(Icons.check_circle_rounded, color: colorScheme.primary)
            : null,
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    // final loc = AppLocalizations.of(context); // Not needed here as per instructions for now

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About', // Placeholder for 'about'
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text( // Hardcoded as per instructions
              'Lang Fusion is a language learning app designed to help you learn new languages through immersive and interactive modules.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.privacy_tip_outlined),
                  label: const Text('Privacy Policy'), // Hardcoded
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.update),
                  label: const Text('Check for Updates'), // Hardcoded
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
