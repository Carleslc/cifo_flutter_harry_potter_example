import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:harry_potter_example/screens/character_list.dart';

void main() {
  runApp(const HogwartsApp());
}

class HogwartsApp extends StatelessWidget {
  static const title = 'Hogwarts App';

  const HogwartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple.shade400),
      ),
      home: const CharacterList(),
    );
  }
}
