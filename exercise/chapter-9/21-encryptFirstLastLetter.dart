import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");

  String cleanedPhrase = phrase.trim().replaceAll(RegExp(r'\s+'), ' ');

  if (cleanedPhrase.isEmpty) {
    print("");
    return;
  }
  
  List<String> words = cleanedPhrase.split(' ');

  if (words.length > 1) {
    String temp = words[0];
    words[0] = words[words.length - 1];
    words[words.length - 1] = temp;
  }

  String newPhrase = words.join(' ');
  
  print(newPhrase);
}