class LocaleEntity {
  final String locale;

  LocaleEntity(this.locale);

  final Map<String, String> _data = {};

  /// This method will initialize the data map and return a map of phrases
  /// that are variable and the number of variables they contain. This helps
  /// the [LocaleManager] class to check the number of parameters passed before
  /// fetching the string.
  Map<String, dynamic> initializeData(Map<String, String> data) {
    /// This will hold keys of phrases with variables and the number
    /// of variables in that phrase
    ///
    /// e.g.
    /// {
    ///   "welcomeMessage": "Welcome, {name}!",
    ///   "notificationMessage": "Welcome, {name}! You have {count} messages."
    /// }
    ///
    /// will be stored as
    ///
    /// {
    ///  "welcomeMessage": 1,
    ///  "notificationMessage": 2,
    /// }
    final Map<String, dynamic> variableStrings = {};

    data.forEach(<String, String>(key, value) {
      /// If phrase has variables add it to result map.
      if (value.contains('{')) {
        /// TODO - count variable words
        final int count = 0;
        variableStrings[key] = count;
      }

      _data[key] = value;
    });

    return variableStrings;
  }
}
