class LocaleEntity {
  /// en - es - du - etc.
  final String locale;

  /// Map of keys and values.
  final Map<String, String> _data;

  LocaleEntity(this.locale, Map<String, String> data) : _data = data;

  /// TODO - throw error when key does not exist.
  String getPhrase(String key) => _data[key] ?? '';
}
