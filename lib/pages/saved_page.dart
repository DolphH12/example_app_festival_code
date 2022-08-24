import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key, required this.saved});
  final List<WordPair> saved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Words"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: saved.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            saved[index].asPascalCase,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
