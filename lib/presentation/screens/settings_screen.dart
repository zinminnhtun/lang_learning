import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/theme_notifier.dart';
import '../../core/providers/language_provider.dart';
import '../../core/localization/app_localizations.dart';
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
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('settings_title')),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // Appearance Section
          _SettingsSectionHeader(
            title: AppLocalizations.of(context).translate('theme'),
            icon: Icons.palette_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: colorScheme.surface,
              child: SwitchListTile(
                title: Text(AppLocalizations.of(context).translate('dark_mode')),
                subtitle: Text(
                  isDark 
                    ? 'Dark appearance is currently active' 
                    : 'Light appearance is currently active',
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
            title: AppLocalizations.of(context).translate('language'),
            icon: Icons.language_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: colorScheme.surface,
              child: Column(
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
            title: AppLocalizations.of(context).translate('notifications'),
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
                    title: const Text('Learning reminders'),
                    subtitle: const Text('Daily notifications to continue learning'),
                    value: true,
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
                    title: const Text('New content'),
                    subtitle: const Text('Notify when new modules are available'),
                    value: true,
                    onChanged: (val) {
                      HapticFeedback.lightImpact();
                      // Implement notification settings
                    },
                    secondary: null,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // About
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _AboutCard(),
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
            title.toUpperCase(),
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
              AppLocalizations.of(context).translate('about'),
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
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
                  label: const Text('Privacy Policy'),
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
                  label: const Text('Check for Updates'),
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
