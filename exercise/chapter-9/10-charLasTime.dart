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

  int lastTimePos = upperPhrase.lastIndexOf(upperChar);

  print(lastTimePos);
}