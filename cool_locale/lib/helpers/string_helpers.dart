/// Returns a string with the parameters replaced with the values.
/// Example:
///
/// ```dart
///
/// print(convertString(
/// label: "Hello {username}",
/// listOfParamsToBeReplaced: ["username"],
/// replacementValues: ["John"])); // Hello John
/// ```
///
/// Hello {name}, your name is {name}, the date today is {date}.
///
/// (name, date)
///
/// [name, name, date]
///
/// convertString(
/// str: Hello {name}, your name is {name}, the date today is {date}.
/// listOfParamsToBeReplaced: [name, name, date]
/// replacementValues [sahani, today.date]
/// )
String convertString({
  required String str,
  required List listOfParamsToBeReplaced,
  required List<Object> replacementValues,
}) {
  print('converting string');
  print('listOfParamsToBeReplaced: $listOfParamsToBeReplaced');
  print('replacementValues: $replacementValues');
  String convertedString = str;
  for (var i = 0; i < listOfParamsToBeReplaced.length; i++) {
    convertedString = convertedString.replaceAll(
        '{${listOfParamsToBeReplaced[i]}}', '${replacementValues[i]}');
  }
  return convertedString;
}

/// Returns a list of strings that are between curly braces.
List<String> extractString({required String str}) {
  print('extracting string');

  /// Create a RegExp object that match variables in the string.
  RegExp exp = RegExp(r"\{(.*?)\}");

  /// List of all matches in variable string. (List of variables).
  Iterable<RegExpMatch> matches = exp.allMatches(str);

  /// Result list.
  final List<String> list = [];

  /// Iterate through all matches and add them to the result list.
  for (var match in matches) {
    final String matchString = match.group(1)!;
    if (!list.contains(matchString)) {
      list.add(matchString);
    }
  }

  return list;
}

/// Returns a list of strings that are between curly braces.
List<String> extractArgs(String phrase) {
  /// Create a RegExp object that match variables in the string.
  RegExp exp = RegExp(r"\{(.*?)\}");

  /// List of all matches in variable string. (List of variables).
  Iterable<RegExpMatch> matches = exp.allMatches(phrase);

  /// Result list.
  final List<String> list = [];

  /// Iterate through all matches and add them to the result list.
  for (var match in matches) {
    final String matchString = match.group(1)!;
    if (!list.contains(matchString)) {
      list.add(matchString);
    }
  }

  return list;
}
