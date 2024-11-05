import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import '../widgets/favorite_character_icon.dart';

class CharacterList extends StatelessWidget {
  final bool showAppBar;
  final Character? selectedCharacter;
  final void Function(Character)? onCharacterSelected;

  const CharacterList({
    super.key,
    this.showAppBar = true,
    this.onCharacterSelected,
    this.selectedCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(title: const Text(HogwartsApp.title)) : null,
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
                    title: Text(
                      character.name,
                      style: TextStyle(
                        fontWeight: character == selectedCharacter
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      '${character.reviews} reviews',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    trailing: FavoriteCharacterIcon(character: character),
                    onTap: () {
                      data.selectedCharacter = character;

                      if (onCharacterSelected != null) {
                        onCharacterSelected?.call(character);
                      }
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
