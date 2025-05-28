import 'package:flutter/material.dart';
import '../../data/models/word.dart';

class DetailScreen extends StatelessWidget {
  final Word word;
  const DetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(word.english)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('English: ${word.english}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Thai: ${word.thai}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Burmese: ${word.burmese}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
