import 'package:cool_locale/locale_entity/locale_entity.dart';

class LocaleManager {
  /// singleton instane
  static final LocaleManager _instance = LocaleManager._internal();

  /// private constructor
  LocaleManager._internal();

  /// factory constructor
  factory LocaleManager() => _instance;

  String _currentLocale = 'en';

  final List<LocaleEntity> _locales = [];

  final Map<String, int> _variableStrings = {};

  void init({
    String locale = 'en',
    required List<String> locales,
  }) {
    for (String locale in locales) {
      /// TODO - send to parser and return a Map.
      ///
      /// TODO - init [Locale] class with the Map (This will also init _variableStrings)
    }
  }

  String get(String key, List<String>? args) {
    /// TODO - return string from _locales
    ///
    return '';
  }

  void changeLocale(String newLocale) {
    _currentLocale = newLocale;
  }
}
