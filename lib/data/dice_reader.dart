import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadFileContent(String fileName) async {
  return await rootBundle.loadString('assets/$fileName');
}

Future<List<String>> diceReader(String fileName) async {
  final string = await loadFileContent(fileName);
  final dice = LineSplitter().convert(string);
  return dice;
}
