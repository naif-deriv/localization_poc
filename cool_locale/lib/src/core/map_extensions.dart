import 'string_helpers.dart';

/// Extension on `Map` to have a `get` method to access string values.
extension MapX on Map {
  /// Returns value of the key if the key exists and is a string, else it will return the passed key itself.
  /// If the value is a string with parameters to be replaced,
  /// then it returns the string with the parameters replaced with the values.
  /// <br>
  /// Examples:
  /// ```dart
  /// Map<String, dynamic> exampleMap = {
  ///   "label": "Hello {username}, you have {count} unread messages from {sender}.",
  /// }
  /// print(example.get(key: 'label', args: ['John', '1', 'Jane'])); // Hello John, you have 1 unread messages from Jane.
  /// ```
  ///
  /// <br>
  ///
  /// ```dart
  /// Map<String, dynamic> exampleMap = {
  ///  "label": "Hello",
  /// }
  /// print(example.get(key: 'label')); // Hello
  /// ```
  String get({
    required String key,
    List<Object>? args,
  }) {
    if (this[key] is String) {
      if (args == null) {
        return this[key].toString();
      } else {
        // The key is a string with parameters to be replaced.
        final listOfParamsToBeReplaced = extractString(str: this[key]);
        return convertString(
            str: this[key],
            listOfParamsToBeReplaced: listOfParamsToBeReplaced,
            replacementValues: args);
      }
    } else {
      return key;
    }
  }
}
