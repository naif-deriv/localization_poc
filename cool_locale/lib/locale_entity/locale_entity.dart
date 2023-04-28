import 'package:cool_locale/core/localization_exception.dart';

class LocaleEntity {
  /// en - es - du - etc.
  final String locale;

  /// Map of keys and values.
  final Map<String, String> _data;

  LocaleEntity(this.locale, Map<String, String> data) : _data = data;

  String getPhrase(String key) =>
      _data[key] ?? (throw InvalidKeyException(key));

  @override
  String toString() => '''
    LocaleEntity:
    locale: $locale, 
    data: 
    $_data

    End of LocaleEntity.
  ''';
}
