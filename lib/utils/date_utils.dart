import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DurationExtension on Duration {
  /// Duració en anys
  int get inYears => inDays ~/ 365.25;
}

extension DateFormatter on DateTime {
  // https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
  static final DateFormat _dateFormat = DateFormat.yMd();

  /// Formateig de la data
  ///
  /// `yMd` localized format
  ///
  /// es: `d/M/yyyy`\
  /// en: `M/d/yyyy`
  String formatDate() => _dateFormat.format(this);

  /// Inicialitza els formats de data i hora amb un locale determinat
  static Future<void> init([String? locale]) async {
    Intl.defaultLocale = locale;
    debugPrint('Locale: $locale');
    await initializeDateFormatting(locale);
  }
}
