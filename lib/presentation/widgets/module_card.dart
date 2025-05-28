import 'package:flutter/material.dart';
import '../../core/models/module.dart';

class ModuleCard extends StatelessWidget {
  final Module module;
  final VoidCallback onTap;

  const ModuleCard({super.key, required this.module, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Adjust icon size based on screen width, with min/max
    double iconSize = screenWidth * 0.08; // Example: 8% of screen width
    if (iconSize < 24) iconSize = 24; // Min size
    if (iconSize > 40) iconSize = 40; // Max size

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Hero(
          tag: module.id,
          child: Text(module.icon, style: TextStyle(fontSize: iconSize)),
        ),
        title: Text(
          module.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Use theme and make bold
        ),
        subtitle: Text(
          module.description,
          style: Theme.of(context).textTheme.bodyMedium, // Explicitly use bodyMedium for proper styling
          maxLines: 2, // Limit to 2 lines
          overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
