import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/hogwarts_data.dart';
import 'screens/responsive_character_list.dart';
import 'utils/date_utils.dart';

void main() async {
  // Inicialitza la localització de dates
  await DateFormatter.init(Platform.localeName);

  // Carrega l'aplicació
  runApp(const HogwartsApp());
}

class HogwartsApp extends StatelessWidget {
  const HogwartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HogwartsData>(
      create: (context) => HogwartsData(),
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appBarTitle,
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple.shade400,
          ),
        ),
        home: const ResponsiveCharacterList(),
        debugShowCheckedModeBanner: true, // debug banner
        // Localització
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Español
          Locale('ca'), // Català
        ],
      ),
    );
  }
}
