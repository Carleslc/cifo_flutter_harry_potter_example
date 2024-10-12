# harry_potter_example

**Repositori d'aplicacions: [cifo_flutter](https://github.com/Carleslc/cifo_flutter)**

Aplicació d'exemple per provar layouts, com funciona la navegació a Flutter i com controlar l'estat amb la llibreria [provider](https://pub.dev/packages/provider).

La primera pantalla conté una llista de personatges de Harry Potter, i en fer click en un d'ells s'obre una nova pantalla amb una imatge i els detalls del personatge seleccionat.

Cada personatge té una quantitat de reviews generades aleatòriament. Es poden afegir reviews fent click sobre les estrelles, modificant el valor mitjà de les seves reviews.

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
│   └── character.dart
├── providers
│   └── hogwarts_data.dart
├── screens
│   ├── character_detail.dart
│   └── character_list.dart
├── utils
│   ├── date_utils.dart
│   └── random_utils.dart
└── widgets
    ├── favorite_character_icon.dart
    ├── rating.dart
    └── toggle_icon.dart
```

L'inici de l'aplicació és a `main.dart`.

A `models` hi ha la clase `Character` per definir atributs d'un personatge.

A `screens` està el codi de les dues pantalles, `CharacterList` i `CharacterDetail`.

A `widgets` hi ha els widgets propis que no corresponen a una pantalla determinada com el rating de les estrelles `Rating` o l'icona de favorit `FavoriteCharacterIcon`,

A `providers` hi ha `HogwartsData` amb les dades dels personatges i l'estat global de l'aplicació, utilitzant la llibreria [provider](https://pub.dev/packages/provider).

Finalment, a `utils` hi ha una extensió `RandomUtils` que s'utilitza per generar un número de reviews aleatòries per cada personatge, i altres extensions a `date_utils.dart` com `DurationExtension` i `DateFormatter` per donar format a la data de naixement.

## Imatges

![harry_potter_example_1.png](<./images/harry_potter_example_1.png>)

![harry_potter_example_2.png](<./images/harry_potter_example_2.png>)

## Recursos

- [google_fonts](https://pub.dev/packages/google_fonts)
- [provider](https://pub.dev/packages/provider)
- [intl](https://pub.dev/packages/intl)
