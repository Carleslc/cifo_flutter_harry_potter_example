import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import 'toggle_icon.dart';

class FavoriteCharacterIcon extends StatelessWidget {
  final Character character;
  final EdgeInsets? padding;

  const FavoriteCharacterIcon({
    super.key,
    required this.character,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HogwartsData>(
      builder: (BuildContext context, HogwartsData data, Widget? child) {
        return ToggleIcon(
          selected: data.isFavorite(character),
          icon: Icons.favorite,
          iconSelected: Icons.favorite_border,
          color: Theme.of(context).colorScheme.primary,
          onTap: () => data.toggleFavorite(character),
          padding: padding,
        );
      },
    );
  }
}
