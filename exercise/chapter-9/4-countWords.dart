import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");

  String trimmedPhrase = phrase.trim();

  String cleanedPhrase = trimmedPhrase.replaceAll(RegExp(r'\s+'), ' ');

  print(cleanedPhrase);

  if (cleanedPhrase.isEmpty) {
    print(0);
  } else {
    List<String> words = cleanedPhrase.split(' ');
    int wordCount = words.length;

    print(wordCount);
  }
}
