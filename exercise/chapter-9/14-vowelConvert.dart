import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");
  String newPhrase = "";
  String vowels = "aeiou";

  for (int i = 0; i < phrase.length; i++) {
    String char = phrase[i];
    String lowerChar = char.toLowerCase();

    if (vowels.contains(lowerChar)) {
      newPhrase += char.toUpperCase();
    } else {
      newPhrase += char.toLowerCase();
    }
  }
  
  print(newPhrase);
}