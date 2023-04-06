import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import './myAppState.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favoriteWords = appState.favorites;

    if (favoriteWords.isEmpty) {
      return Center(
        child: Text('List is empty'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${favoriteWords.length} favorite words'),
        ),
        for (var word in favoriteWords)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(word.asCamelCase),
          )
      ],
    );
  }
}
