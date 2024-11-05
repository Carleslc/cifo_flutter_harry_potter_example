# harry_potter_example

**Repositori d'aplicacions: [cifo_flutter](https://github.com/Carleslc/cifo_flutter)**

Aplicació d'exemple per provar layouts i aprendre com funciona la navegació a Flutter, com controlar l'estat amb la llibreria [provider](https://pub.dev/packages/provider), com persistir dades utilitzant la llibreria [isar](https://pub.dev/packages/isar).

La primera pantalla conté una llista de personatges de Harry Potter, i en fer click en un d'ells s'obre una nova pantalla amb una imatge i els detalls del personatge seleccionat.

Cada personatge té una quantitat de valoracions generades aleatòriament. Es poden afegir valoracions fent click sobre les estrelles, modificant el valor mitjà de les seves valoracions.

Codi original: https://github.com/poqueque/cifo_2024s2_harry_potter/

<a href="https://idx.google.com/import?url=https%3A%2F%2Fgithub.com%2FCarleslc%2Fcifo_flutter_harry_potter_example%2F" target="_blank">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in IDX"
      src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>

## Instal·lació

1. S'ha d'haver instal·lat el [Flutter SDK](https://docs.flutter.dev/get-started/install).

2. Clonar el repositori:

```sh
git pull https://github.com/Carleslc/cifo_flutter_harry_potter_example.git
# GitHub CLI: gh repo clone Carleslc/cifo_flutter_harry_potter_example

cd cifo_flutter_harry_potter_example
```

3. Instal·lar les dependències:

```sh
flutter pub get
```

4. Executar l'aplicació amb `flutter run` o desde l'IDE.

## Estructura de l'aplicació

```
lib
├── main.dart
├── models
│   ├── character.dart
│   ├── character.g.dart
│   ├── favorites.dart
│   └── favorites.g.dart
├── providers
│   └── hogwarts_data.dart
├── screens
│   ├── character_detail.dart
│   ├── character_list.dart
│   ├── character_list_wide.dart
│   └── responsive_character_list.dart
├── services
│   └── database.dart
├── utils
│   ├── date_utils.dart
│   ├── random_utils.dart
│   └── responsive.dart
└── widgets
    ├── favorite_character_icon.dart
    ├── rating.dart
    └── toggle_icon.dart
```

L'inici de l'aplicació és a `main.dart`.

A `models` hi ha la clase `Character` per definir atributs d'un personatge i `Favorites` per la llista de personatges favorits.

Els fitxers acabats en `.g.dart` són autogenerats per la gestió de la base de dades [Isar](https://pub.dev/packages/isar).

A `screens` està el codi de les dues pantalles, `CharacterList` i `CharacterDetail`. La llista de personatges és responsiva utilitzant `responsive_character_list.dart` per seleccionar la pantalla `CharacterList` o `CharacterListWide` segons l'amplada i orientació de la pantalla.

A `widgets` hi ha els widgets propis que no corresponen a una pantalla determinada com el rating de les estrelles `Rating` o l'icona de favorit `FavoriteCharacterIcon`,

A `providers` hi ha `HogwartsData` amb les dades dels personatges i l'estat global de l'aplicació, utilitzant la llibreria [provider](https://pub.dev/packages/provider) per la gestió de l'estat i la llibreria [isar](https://pub.dev/packages/isar) per la persistència, mitjançant la clase `Database` a la carpeta `services`.

Finalment, a `utils` hi ha una extensió `RandomUtils` que s'utilitza per generar un número de valoracions aleatòries per cada personatge, altres extensions a `date_utils.dart` com `DurationExtension` i `DateFormatter` per donar format a la data de naixement, i diversos mètodes per comprovar la mida i orientació de la pantalla a `responsive.dart`.

## Imatges

![harry_potter_example_1.png](<./images/harry_potter_example_1.png>)

![harry_potter_example_2.png](<./images/harry_potter_example_2.png>)

## Recursos

- [google_fonts](https://pub.dev/packages/google_fonts)
- [provider](https://pub.dev/packages/provider)
- [intl](https://pub.dev/packages/intl)
- [path_provider](https://pub.dev/packages/path_provider)
- [isar](https://pub.dev/packages/isar)
