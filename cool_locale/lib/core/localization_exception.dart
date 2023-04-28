class LocalizationException implements Exception {
  /// Exception message to be shown to the user.
  final String message;

  /// Initializes an instance of [InvalidArgumentsException].
  LocalizationException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

class InvalidArgumentsException extends LocalizationException {
  /// Initializes an instance of [InvalidArgumentsException].
  InvalidArgumentsException({
    required List<String> expected,
    required List<String>? recieved,
  }) : super('Expected $expected arguments, but got $recieved.');
}

class InvalidKeyException extends LocalizationException {
  /// Initializes an instance of [InvalidKeyException].
  InvalidKeyException(String key) : super('Key $key does not exist.');
}

class LocaleManagerNotInitialized extends LocalizationException {
  /// Initializes an instance of [LocaleManagerNotInitialized].
  LocaleManagerNotInitialized()
      : super('LocaleManager is not initialized properly.');
}
