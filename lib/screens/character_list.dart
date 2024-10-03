import 'package:flutter/material.dart';

import '../main.dart';
import '../models/character.dart';
import '../utils/random_utils.dart';
import 'character_detail.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HogwartsApp.title),
      ),
      body: ListView(
        children: [
          for (Character character in characters)
            Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                leading: Hero(
                  tag: character.name,
                  child: Image.network(character.imageUrl),
                ),
                title: Text(character.name),
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
      ),
    );
  }
}

List<Character> characters = [
  Character.withRating(
    name: 'Harry Potter',
    strength: 7,
    magicPower: 10,
    speed: 8,
    imageUrl:
        'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/500?cb=20160903184919',
    reviews: random.nextIntBetween(70, 100),
    rating: random.nextIntBetween(3, 5),
  ),
  Character.withRating(
    name: 'Ron Weasley',
    strength: 8,
    magicPower: 8,
    speed: 6,
    imageUrl:
        'https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/500?cb=20150523213430',
    reviews: random.nextIntBetween(40, 70),
    rating: random.nextIntBetween(1, 4),
  ),
  Character.withRating(
    name: 'Hermione Granger',
    strength: 6,
    magicPower: 9,
    speed: 7,
    imageUrl:
        'https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/500?cb=20120729103114&path-prefix=es',
    reviews: random.nextIntBetween(50, 100),
    rating: random.nextIntBetween(3, 5),
  ),
];
