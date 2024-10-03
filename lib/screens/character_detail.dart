import 'package:flutter/material.dart';

import '../models/character.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
      ),
      body: Column(
        children: [
          // Imatge del personatge
          Expanded(
            child: Hero(
              tag: widget.character.name,
              child: Image.network(
                widget.character.imageUrl,
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
                      widget.character.name,
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
                      Rating(
                        value: widget.character.rating,
                        onSelect: (int value) {
                          // Update reviews
                          setState(() {
                            widget.character.reviews++;
                            widget.character.totalRatings += value;
                          });
                          debugPrint('Review: $value');
                          debugPrint('Rating: ${widget.character.rating}');
                        },
                      ),
                      Text(
                        '${widget.character.reviews} reviews',
                        style: const TextStyle(fontSize: 16),
                      ),
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
                      Text('${widget.character.strength}'),
                    ]),
                    Column(children: [
                      const Icon(Icons.auto_fix_normal),
                      const Text('Màgia'),
                      Text('${widget.character.magicPower}'),
                    ]),
                    Column(children: [
                      const Icon(Icons.speed),
                      const Text('Velocitat'),
                      Text('${widget.character.speed}'),
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
