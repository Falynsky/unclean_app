// @dart = 2.12

import 'translations.dart';

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';
}
