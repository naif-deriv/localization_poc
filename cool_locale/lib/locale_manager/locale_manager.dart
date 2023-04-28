import 'package:cool_locale/core/localization_exception.dart';
import 'package:cool_locale/helpers/string_helpers.dart';
import 'package:cool_locale/locale_entity/locale_entity.dart';
import 'package:cool_locale/parser/parser.dart';

class LocaleManager {
  /// singleton instance
  static final LocaleManager _instance = LocaleManager._internal();

  /// private constructor
  LocaleManager._internal();

  /// factory constructor
  factory LocaleManager() => _instance;

  String get _chosenLangauge => _currentLocale?.locale ?? 'en';

  LocaleEntity? _currentLocale;

  final List<LocaleEntity> _locales = [];

  final Map<String, List<String>> _keysAndArgs = {};

  Future<void> init({
    String langaugeCode = 'en',
    required List<String> locales,
  }) async {
    for (String locale in locales) {
      final LocaleEntity localeEntity = Parser.createLocaleFromFile(locale);

      _locales.add(localeEntity);

      if (localeEntity.locale == langaugeCode) {
        _currentLocale = localeEntity;
      }
    }
  }

  void printData() {
    print("##### Printing LocaleManager Properties #####");

    for (LocaleEntity locale in _locales) {
      print(locale.toString());
    }
  }

  String getString(
    String key, {
    List<String>? args,
  }) {
    if (_currentLocale == null) {
      throw LocaleManagerNotInitialized();
    }

    /// Get String as it is from [LocaleEntity].
    String phrase = _currentLocale!.getPhrase(key);

    /// Check if phrase is in _keysAndArgs map.
    if (!_keysAndArgs.containsKey(key)) {
      /// Get args in that phrase.
      final List<String> varsList = extractArgs(phrase);

      /// Add phrase to _keysAndArgs map.
      _keysAndArgs[key] = varsList;
    }

    /// Check if args is valid.
    if (!_isValidArguments(args, _keysAndArgs[key]!)) {
      throw InvalidArgumentsException(
        expected: _keysAndArgs[key]!,
        recieved: args,
      );
    }

    /// Convert phrase.
    phrase = convertString(
      str: phrase,
      listOfParamsToBeReplaced: _keysAndArgs[key]!,
      replacementValues: args ?? [],
    );

    return phrase;
  }

  bool _isValidArguments(List<String>? args, List<String> phraseVariables) =>
      (args == null && phraseVariables.isEmpty) ||
      (args != null && args.length == phraseVariables.length);

  void changeLocale(String newLanguage) async {
    _currentLocale = _locales.firstWhere(
      (LocaleEntity locale) => locale.locale == newLanguage,
    );
    return;
  }
}
