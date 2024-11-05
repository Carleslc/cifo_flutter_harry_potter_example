import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import '../widgets/favorite_character_icon.dart';

class CharacterList extends StatefulWidget {
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
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late AppLocalizations l;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? AppBar(title: Text(l.appBarTitle)) : null,
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
                        fontWeight: character == widget.selectedCharacter
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      l.nReviews(character.reviews),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    trailing: FavoriteCharacterIcon(character: character),
                    onTap: () {
                      data.selectedCharacter = character;

                      if (widget.onCharacterSelected != null) {
                        widget.onCharacterSelected?.call(character);
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
