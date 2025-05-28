import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'package:lang_fusion/l10n/app_localizations.dart'; // Import AppLocalizations

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.editProfile,
          style: Theme.of(
            context,
          ).appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
        ),
        backgroundColor: AppTheme.secondary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: AppTheme.secondary,
              child: const Icon(
                Icons.person,
                size: 56,
                color: Colors.white,
              ), // Added const
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.yourName, // Localized
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                ), // Use AppTheme.radius
                prefixIcon: const Icon(Icons.edit), // Added const
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save), // Added const
              label: Text(AppLocalizations.of(context)!.save), // Localized
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
