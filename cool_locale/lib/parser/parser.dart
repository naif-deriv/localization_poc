import 'dart:convert';
import 'dart:io';

import 'package:cool_locale/locale_entity/locale_entity.dart';

class Parser {
  static Future<String> readFile(File file) async {
    print('Parsing file: ${file.path}');

    /// Print file contents.
    String fileContents = await file.readAsString();

    print(fileContents);

    return fileContents;
  }

  static LocaleEntity createLocaleFromFile(String file) {
    final Map<String, dynamic> dataMap = jsonDecode(file);

    final Map<String, String> localeMap = Map<String, String>.from(dataMap);

    final String languageCode = _getLangaugeCodeFromMap(localeMap);

    localeMap.remove('@@locale');

    return LocaleEntity(languageCode, localeMap);
  }

  static String _getLangaugeCodeFromMap(Map<String, dynamic> map) {
    return map.entries
        .where((MapEntry<String, dynamic> kvPair) => kvPair.key == '@@locale')
        .first
        .value;
  }
}
