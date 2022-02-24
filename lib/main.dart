import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    return MaterialApp(
      title: 'list',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() =>  RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _listbahasa = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final wordpair = WordPair.random();
    // throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(
        title: Text('awokawok'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return  ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
           if (i.isOdd) {
            return  Divider();
          }
          final int index = i ~/ 2;
          if (index >= _listbahasa.length) {
            _listbahasa.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_listbahasa[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    return  ListTile(
      title:  Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}