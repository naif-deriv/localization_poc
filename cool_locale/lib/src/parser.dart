import 'dart:io';

class Parser {
  static Future<String> readFile(File file) async {
    print('Parsing file: ${file.path}');

    /// Print file contents.
    String fileContents = await file.readAsString();

    print(fileContents);

    return fileContents;
  }
}
