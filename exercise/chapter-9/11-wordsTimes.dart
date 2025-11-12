import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");
  String cleanedPhrase = phrase.toLowerCase().trim();
  
  cleanedPhrase = cleanedPhrase.replaceAll(RegExp(r'[^\w\s]'), '');
  cleanedPhrase = cleanedPhrase.replaceAll(RegExp(r'\s+'), ' ');

  if (cleanedPhrase.isEmpty) {
    print("No words found.");
    return;
  }

  List<String> words = cleanedPhrase.split(' ');
  Map<String, int> wordCount = {};

  for (String word in words) {
    wordCount[word] = (wordCount[word] ?? 0) + 1;
  }

  wordCount.forEach((word, count) {
    print("$word: $count times");
  });
}