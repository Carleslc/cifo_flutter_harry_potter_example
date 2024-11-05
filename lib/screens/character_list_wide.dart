import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import 'character_detail.dart';
import 'character_list.dart';

class CharacterListWide extends StatefulWidget {
  final void Function(Character)? onCharacterSelected;

  const CharacterListWide({super.key, this.onCharacterSelected});

  @override
  State<CharacterListWide> createState() => _CharacterListWideState();
}

class _CharacterListWideState extends State<CharacterListWide> {
  late AppLocalizations l;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l.appBarTitle),
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
                  onCharacterSelected: widget.onCharacterSelected,
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
    return Center(child: Text(l.selectCharacter));
  }
}
