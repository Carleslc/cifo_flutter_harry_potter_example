import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import '../widgets/favorite_character_icon.dart';
import 'character_detail.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HogwartsApp.title),
      ),
      body: Consumer<HogwartsData>(
        builder: (BuildContext context, HogwartsData data, Widget? child) {
          return ListView(
            children: [
              for (Character character in data.characters)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: ListTile(
                    leading: Hero(
                      tag: character.name,
                      child: Image.network(character.imageUrl),
                    ),
                    title: Text(character.name),
                    subtitle: Text(
                      '${character.reviews} reviews',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    trailing: FavoriteCharacterIcon(character: character),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterDetail(character: character),
                        ),
                      );
                    },
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
