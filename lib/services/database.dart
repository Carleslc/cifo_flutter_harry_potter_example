import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/character.dart';
import '../models/favorites.dart';

/// Persisteix les dades al dispositiu
class Database {
  /// Singleton
  static final Database _instance = Database._();
  Database._();
  factory Database() => _instance;

  Isar? _isar;

  Future<Isar> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [CharacterSchema, FavoritesDbSchema],
      directory: dir.path,
    );
    return _isar!;
  }

  //
  // Characters
  //

  Future<List<Character>> getAllCharacters() async {
    _isar ??= await _init();
    return _isar!.characters.where().findAll();
  }

  Future<void> updateCharacters(Iterable<Character> characters) async {
    _isar ??= await _init();
    await _isar!.writeTxn(() async {
      for (Character character in characters) {
        await _isar!.characters.put(character); // Insert or update
      }
    });
  }

  Future<void> updateCharacter(Character character) async {
    updateCharacters([character]);
  }

  //
  // Favorites
  //

  Future<List<Id>> getFavoriteIds() async {
    _isar ??= await _init();
    final FavoritesDb? favorites = await _isar!.favorites.get(0);
    return favorites?.favoriteIds ?? [];
  }

  Future<void> updateFavorites(List<Id> favorites) async {
    _isar ??= await _init();
    await _isar!.writeTxn(() async {
      await _isar!.favorites.put(
        FavoritesDb(favoriteIds: favorites),
      );
    });
  }
}
