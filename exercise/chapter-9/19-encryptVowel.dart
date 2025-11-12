import '../reads.dart';

String encryptSentence(String sentence) {
  return sentence
      .toLowerCase()
      .replaceAll('a', '1')
      .replaceAll('e', '2')
      .replaceAll('i', '3')
      .replaceAll('o', '4')
      .replaceAll('u', '5');
}

void main() {
  
  String sentence = readString("Write a sentence to encrypt: ");

  String encryptedSentence = encryptSentence(sentence);

  print(encryptedSentence);
}