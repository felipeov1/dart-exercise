import '../reads.dart';
import 'dart:math';

void main() {
  String phrase = readString("write a phrase: ");
  String cleanedPhrase = phrase.trim().replaceAll(RegExp(r'\s+'), ' ');
  
  if (cleanedPhrase.isEmpty) {
    return;
  }
  
  List<String> words = cleanedPhrase.split(' ');
  List<String> newWords = [];

  for (int i = 0; i < words.length; i += 2) {
    if (i + 1 < words.length) {
      String word1 = words[i];
      String word2 = words[i + 1];
      String reversedWord2 = word2.split('').reversed.join('');
      
      String newWord = "";
      int len1 = word1.length;
      int len2 = reversedWord2.length;
      int maxLen = max(len1, len2);

      for (int j = 0; j < maxLen; j++) {
        if (j < len1) {
          newWord += word1[j];
        }
        if (j < len2) {
          newWord += reversedWord2[j];
        }
      }
      newWords.add(newWord);
      
    } else {
      String lastWord = words[i];
      newWords.add(lastWord.split('').reversed.join(''));
    }
  }
  
  print(newWords.join(" "));
}