// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoritesDbCollection on Isar {
  IsarCollection<FavoritesDb> get favorites => this.collection();
}

const FavoritesDbSchema = CollectionSchema(
  name: r'favorites',
  id: 3451342447793213691,
  properties: {
    r'favoriteIds': PropertySchema(
      id: 0,
      name: r'favoriteIds',
      type: IsarType.longList,
    )
  },
  estimateSize: _favoritesDbEstimateSize,
  serialize: _favoritesDbSerialize,
  deserialize: _favoritesDbDeserialize,
  deserializeProp: _favoritesDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _favoritesDbGetId,
  getLinks: _favoritesDbGetLinks,
  attach: _favoritesDbAttach,
  version: '3.1.0+1',
);

int _favoritesDbEstimateSize(
  FavoritesDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.favoriteIds.length * 8;
  return bytesCount;
}

void _favoritesDbSerialize(
  FavoritesDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.favoriteIds);
}

FavoritesDb _favoritesDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoritesDb(
    favoriteIds: reader.readLongList(offsets[0]) ?? [],
  );
  return object;
}

P _favoritesDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoritesDbGetId(FavoritesDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoritesDbGetLinks(FavoritesDb object) {
  return [];
}

void _favoritesDbAttach(
    IsarCollection<dynamic> col, Id id, FavoritesDb object) {}

extension FavoritesDbQueryWhereSort
    on QueryBuilder<FavoritesDb, FavoritesDb, QWhere> {
  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavoritesDbQueryWhere
    on QueryBuilder<FavoritesDb, FavoritesDb, QWhereClause> {
  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritesDbQueryFilter
    on QueryBuilder<FavoritesDb, FavoritesDb, QFilterCondition> {
  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'favoriteIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'favoriteIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'favoriteIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'favoriteIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition>
      favoriteIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favoriteIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoritesDbQueryObject
    on QueryBuilder<FavoritesDb, FavoritesDb, QFilterCondition> {}

extension FavoritesDbQueryLinks
    on QueryBuilder<FavoritesDb, FavoritesDb, QFilterCondition> {}

extension FavoritesDbQuerySortBy
    on QueryBuilder<FavoritesDb, FavoritesDb, QSortBy> {}

extension FavoritesDbQuerySortThenBy
    on QueryBuilder<FavoritesDb, FavoritesDb, QSortThenBy> {
  QueryBuilder<FavoritesDb, FavoritesDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoritesDb, FavoritesDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FavoritesDbQueryWhereDistinct
    on QueryBuilder<FavoritesDb, FavoritesDb, QDistinct> {
  QueryBuilder<FavoritesDb, FavoritesDb, QDistinct> distinctByFavoriteIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favoriteIds');
    });
  }
}

extension FavoritesDbQueryProperty
    on QueryBuilder<FavoritesDb, FavoritesDb, QQueryProperty> {
  QueryBuilder<FavoritesDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavoritesDb, List<int>, QQueryOperations> favoriteIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favoriteIds');
    });
  }
}
