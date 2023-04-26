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
String convertString({
  required String str,
  required List listOfParamsToBeReplaced,
  required List<Object> replacementValues,
}) {
  String convertedString = str;
  for (var i = 0; i < listOfParamsToBeReplaced.length; i++) {
    convertedString = convertedString.replaceAll(
        '{${listOfParamsToBeReplaced[i]}}', '${replacementValues[i]}');
  }
  return convertedString;
}

/// Returns a list of strings that are between curly braces.
List extractString({required String str}) {
  RegExp exp = RegExp(r"\{(.*?)\}");
  Iterable<RegExpMatch> matches = exp.allMatches(str);
  final List<String> list = [];
  for (var match in matches) {
    list.add(match.group(1)!);
  }
  return list;
}
