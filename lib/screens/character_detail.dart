import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import '../utils/date_utils.dart';
import '../utils/responsive.dart';
import '../widgets/favorite_character_icon.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({
    super.key,
    required this.character,
    this.showAppBar = true,
  });

  final Character character;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    bool vertical = isVertical(context);

    return Scaffold(
      appBar: showAppBar ? AppBar(title: Text(character.name)) : null,
      body: Column(children: [
        // Imatge del personatge
        if (vertical)
          Expanded(
            child: Hero(
              tag: character.name,
              child: Image.network(
                character.imageUrl,
                fit: BoxFit.cover,
                width: 500,
              ),
            ),
          ),
        // Detalls del personatge
        if (vertical)
          _characterDetails(context)
        else
          Expanded(
            child: _characterDetails(context),
          ),
      ]),
    );
  }

  Widget _characterDetails(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Nom
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                character.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Edat
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '${character.birthDate.formatDate()}  (${character.age} anys)',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            // Reviews
            Consumer<HogwartsData>(
              builder: (
                BuildContext context,
                HogwartsData data,
                Widget? child,
              ) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Rating(
                      value: character.rating,
                      onSelect: (int rating) {
                        // Update reviews
                        data.addReview(character, rating);
                        debugPrint('Review: $rating');
                        debugPrint('Rating: ${character.rating}');
                      },
                    ),
                    Text(
                      '${character.reviews} reviews',
                      style: const TextStyle(fontSize: 16),
                    ),
                    // Favorit
                    FavoriteCharacterIcon(character: character),
                  ],
                );
              },
            ),
          ],
        ),
        // Atributs
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                const Icon(Icons.fitness_center),
                const Text('Força'),
                Text('${character.strength}'),
              ]),
              Column(children: [
                const Icon(Icons.auto_fix_normal),
                const Text('Màgia'),
                Text('${character.magicPower}'),
              ]),
              Column(children: [
                const Icon(Icons.speed),
                const Text('Velocitat'),
                Text('${character.speed}'),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
