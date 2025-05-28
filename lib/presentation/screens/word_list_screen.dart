import 'package:flutter/material.dart';
import '../../data/repositories/word_repository.dart';
import 'detail_screen.dart';

class WordListScreen extends StatelessWidget {
  final repo = WordRepository();

  WordListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final words = repo.fetchWords();
    return Scaffold(
      appBar: AppBar(title: Text('စကားလုံးများနဲ့စကားစုများ')),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (_, i) {
          final w = words[i];
          return ListTile(
            title: Text(w.english),
            subtitle: Text('${w.thai} • ${w.burmese}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailScreen(word: w)),
            ),
          );
        },
      ),
    );
  }
}
