import 'package:flutter/material.dart';

import 'package:harry_potter_example/main.dart';
import 'package:harry_potter_example/models/character.dart';
import 'package:harry_potter_example/screens/character_detail.dart';
import 'package:harry_potter_example/utils/random_utils.dart';

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
          for (final (Character character, :reviews) in characters)
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
                      builder: (context) => CharacterDetail(
                        character: character,
                        reviews: reviews,
                      ),
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

typedef CharacterReviews = (Character character, {int reviews});

List<CharacterReviews> characters = [
  (
    const Character(
      name: 'Harry Potter',
      strength: 7,
      magicPower: 10,
      speed: 8,
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/500?cb=20160903184919",
    ),
    reviews: random.nextIntBetween(70, 100),
  ),
  (
    const Character(
      name: 'Ron Weasley',
      strength: 8,
      magicPower: 8,
      speed: 6,
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/500?cb=20150523213430",
    ),
    reviews: random.nextIntBetween(40, 70),
  ),
  (
    const Character(
      name: 'Hermione Granger',
      strength: 6,
      magicPower: 9,
      speed: 7,
      imageUrl:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/500?cb=20120729103114&path-prefix=es",
    ),
    reviews: random.nextIntBetween(50, 100),
  ),
];
