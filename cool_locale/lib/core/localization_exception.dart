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
  InvalidArgumentsException(int expected, int recieved)
      : super('Expected $expected arguments, but got $recieved.');
}
