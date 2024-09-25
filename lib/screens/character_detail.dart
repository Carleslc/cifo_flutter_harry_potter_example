import 'package:flutter/material.dart';

import 'package:harry_potter_example/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;
  final int reviews;

  const CharacterDetail({
    super.key,
    required this.character,
    this.reviews = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        children: [
          // Imatge del personatge
          Expanded(
            child: Hero(
              tag: character.name,
              child: Image.network(
                character.imageUrl,
                fit: BoxFit.fitHeight,
                width: 500,
              ),
            ),
          ),
          // Detalls del personatge
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    // Nom
                    child: Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star_border),
                          Icon(Icons.star_border),
                        ],
                      ),
                      Row(children: [Text('$reviews reviews')]),
                    ],
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
          ),
        ],
      ),
    );
  }
}
