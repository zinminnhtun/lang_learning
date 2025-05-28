import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        automaticallyImplyLeading: false, // To prevent back button if it's a main tab
      ),
      body: const Center(
        child: Text('Learn Screen - Lessons will be implemented here'),
      ),
    );
  }
}
