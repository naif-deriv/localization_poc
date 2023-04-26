import 'package:cool_locale/locale_entity/locale_entity.dart';
import 'package:cool_locale/src/core/string_helpers.dart';

class LocaleManager {
  /// singleton instane
  static final LocaleManager _instance = LocaleManager._internal();

  /// private constructor
  LocaleManager._internal();

  /// factory constructor
  factory LocaleManager() => _instance;

  String _currentLocaleCode = 'en';
  late LocaleEntity _currentLocale;

  final List<LocaleEntity> _locales = [];

  final Map<String, List<String>> _keysAndArgs = {};

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

  String get(
    String key,
    List<String>? args,
  ) {
    if (!_keysAndArgs.containsKey(key)) {
      final List<String> varsList = extractArgs(_currentLocale.getPhrase(key));
      _keysAndArgs[key] = varsList;
    }

    /// Compare args and vars length.
    if (_keysAndArgs[key] != args?.length) {
      /// TODO - throw error.
    }
  }

  void changeLocale(String newLocale) {
    _currentLocaleCode = newLocale;
    _currentLocale = _locales
        .firstWhere((LocaleEntity locale) => locale.locale == newLocale);
  }
}
