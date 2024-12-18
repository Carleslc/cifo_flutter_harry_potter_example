import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/character.dart';
import '../models/favorites.dart';
import '../services/database.dart';
import '../utils/random_utils.dart';

/// Provider que proporciona els personatges i l'estat de les reviews i els favorits
class HogwartsData extends ChangeNotifier {
  ///
  /// Personatges de Hogwarts
  ///
  List<Character> get characters => UnmodifiableListView(_characters);
  List<Character> _characters = [];

  final List<Character> _initialCharacters = [
    Character.withRating(
      name: 'Harry Potter',
      birthDate: DateTime(1980, 7, 31),
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
      birthDate: DateTime(1980, 3, 1),
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
      birthDate: DateTime(1979, 9, 19),
      strength: 6,
      magicPower: 9,
      speed: 7,
      imageUrl:
          'https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/500?cb=20120729103114&path-prefix=es',
      reviews: random.nextIntBetween(50, 100),
      rating: random.nextIntBetween(3, 5),
    ),
  ];

  /// Personatge seleccionat
  Character? get selectedCharacter => _selectedCharacter;
  Character? _selectedCharacter;

  set selectedCharacter(Character? selectedCharacter) {
    _selectedCharacter = selectedCharacter;
    notifyListeners();
  }

  //
  // Reviews
  //

  void addReview(Character character, int rating) {
    character.addReview(rating);

    _database.updateCharacter(character);

    notifyListeners();
  }

  //
  // Favorits
  //

  final Favorites<int> _favorites = Favorites();

  bool isFavorite(Character character) => _favorites.isFavorite(character.id);

  void toggleFavorite(Character character) {
    _favorites.toggleFavorite(character.id);

    _database.updateFavorites(_favorites.toList());

    notifyListeners();
  }

  ///
  /// Database
  ///
  final Database _database = Database();

  HogwartsData() {
    _init();
  }

  Future<void> _init() async {
    _characters = await _database.getAllCharacters();

    if (_characters.isEmpty) {
      _characters.addAll(_initialCharacters);
      await _database.updateCharacters(_characters);
      _characters = await _database.getAllCharacters();
    }

    final favoriteIds = await _database.getFavoriteIds();
    _favorites.setFavorites(favoriteIds);

    notifyListeners();
  }
}
