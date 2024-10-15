import 'dart:collection';

import 'package:isar/isar.dart';

part 'favorites.g.dart';

/// p.e. Personatges favorits, E = int (Character Id)
class Favorites<E> extends Iterable<E> {
  Set<E> get favorites => UnmodifiableSetView(_favorites);
  final Set<E> _favorites = {};

  bool isFavorite(E element) => _favorites.contains(element);

  void toggleFavorite(E element) {
    if (_favorites.contains(element)) {
      _favorites.remove(element);
    } else {
      _favorites.add(element);
    }
  }

  void setFavorites(Iterable<E> favorites) {
    _favorites
      ..clear()
      ..addAll(favorites);
  }

  @override
  Iterator<E> get iterator => favorites.iterator;
}

/// Persistència de la llista de favorits
@Name('Favorites')
@Collection(accessor: 'favorites')
class FavoritesDb {
  final Id id = 0;

  final List<Id> favoriteIds;

  FavoritesDb({required this.favoriteIds});
}
