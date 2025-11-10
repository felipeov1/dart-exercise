import 'dart:io';

import '../reads.dart';

void main() {
  String input = readString("write the phrase: ");

  if (input.trim().isEmpty) {
    print("Invalid phrase.");
    return;
  }

  String upperCase = input.toUpperCase();
  String reversed = upperCase.split('').reversed.join();

  const String vowels = 'AEIOU ';
  List<String> finalCharacters = [];

  for (var i = 0; i < reversed.length; i++) {
    String character = reversed[i];

    if (!vowels.contains(character)) {
      finalCharacters.add('#');
    } else {
      finalCharacters.add(character);
    }
  }

  String encrypted = finalCharacters.join();

  print(encrypted);
}
