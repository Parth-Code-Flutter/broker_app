import 'package:broker_app/utils/jsons/translations_json.dart';

extension Translation on String {
  String get translate {
    final translations = TranslationJson.translations;

    return translations[this]?['en'] ?? this;
  }
}
