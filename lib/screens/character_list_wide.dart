import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import 'character_detail.dart';
import 'character_list.dart';

class CharacterListWide extends StatelessWidget {
  final void Function(Character)? onCharacterSelected;

  const CharacterListWide({super.key, this.onCharacterSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HogwartsApp.title),
      ),
      body: Selector<HogwartsData, Character?>(
        selector: (_, data) => data.selectedCharacter,
        shouldRebuild: (Character? oldSelected, Character? newSelected) =>
            oldSelected?.id != newSelected?.id,
        builder: (
          BuildContext context,
          Character? selectedCharacter,
          Widget? child,
        ) {
          return Row(
            children: [
              Flexible(
                flex: 1,
                child: CharacterList(
                  showAppBar: false,
                  selectedCharacter: selectedCharacter,
                  onCharacterSelected: onCharacterSelected,
                ),
              ),
              Flexible(
                flex: 2,
                child: _characterDetail(selectedCharacter),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _characterDetail(Character? character) {
    if (character != null) {
      return CharacterDetail(character: character, showAppBar: false);
    }
    return Center(child: const Text('Escull un personatge'));
  }
}
