import 'package:flutter/material.dart';

import '../models/character.dart';
import '../utils/random_utils.dart';

/// Provider que proporciona els personatges i l'estat de les reviews i els favorits
class HogwartsData extends ChangeNotifier {
  ///
  /// Personatges de Hogwarts
  ///
  final List<Character> characters = [
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

  //
  // Reviews
  //

  void addReview(Character character, int rating) {
    character.addReview(rating);
    notifyListeners();
  }

  //
  // Favorits
  //

  final Set<Character> favorites = {};

  bool isFavorite(Character character) => favorites.contains(character);

  void toggleFavorite(Character character) {
    if (favorites.contains(character)) {
      favorites.remove(character);
    } else {
      favorites.add(character);
    }
    notifyListeners();
  }
}
