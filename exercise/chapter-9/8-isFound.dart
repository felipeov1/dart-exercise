import '../reads.dart';

void main() {
  String phrase = readString("Write the phrase: ");
  String char = readString("Write the character: ");

  String searchChar = char;
  if (char.length > 1) {
    searchChar = char[0];
  }
  
  String upperPhrase = phrase.toUpperCase();
  String upperChar = searchChar.toUpperCase();

  int count = 0;
  for (int i = 0; i < upperPhrase.length; i++) {
    if (upperPhrase[i] == upperChar) {
      count++;
    }
  }

  print("The character '$searchChar' was found $count times.");
}