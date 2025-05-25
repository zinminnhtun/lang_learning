import 'package:flutter/material.dart';
import '../../core/models/module.dart';

class ModuleCard extends StatelessWidget {
  final Module module;
  final VoidCallback onTap;

  ModuleCard({required this.module, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Hero(
          tag: module.id,
          child: Text(module.icon, style: TextStyle(fontSize: 32)),
        ),
        title: Text(
          module.title,
          style: TextStyle(fontWeight: FontWeight.bold), // ပြင်လိုက်ပါ
        ),
        subtitle: Text(module.description),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
