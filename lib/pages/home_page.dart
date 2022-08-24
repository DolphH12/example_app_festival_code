import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:words_project/pages/saved_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _wordsSuggestions = [];
  final List<WordPair> _saved = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Words Generate'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SavedPage(saved: _saved),
                  ),
                );
              },
              icon: const Icon(Icons.list)),
        ],
      ),
      body: _buildSuggestions(),
    );
    // return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    _wordsSuggestions.addAll(generateWordPairs().take(100));
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: _wordsSuggestions.length,
      itemBuilder: (context, index) {
        return _cardWord(_wordsSuggestions[index]);
      },
    );
  }

  _cardWord(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return Column(
      children: [
        ListTile(
          title: Text(
            pair.asPascalCase,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
            setState(() {});
          },
        ),
        const Divider()
      ],
    );
  }
}
