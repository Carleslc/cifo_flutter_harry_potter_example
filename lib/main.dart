import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/hogwarts_data.dart';
import 'screens/character_list.dart';

void main() {
  runApp(const HogwartsApp());
}

class HogwartsApp extends StatelessWidget {
  static const title = 'Hogwarts App';

  const HogwartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HogwartsData>(
      create: (context) => HogwartsData(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple.shade400,
          ),
        ),
        home: const CharacterList(),
        debugShowCheckedModeBanner: true, // debug banner
      ),
    );
  }
}
