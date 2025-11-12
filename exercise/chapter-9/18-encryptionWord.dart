import '../reads.dart';

String encryptWord(String word) {
  int length = word.length;
  int keepLength = length ~/ 2;
  String keptPart = word.substring(0, keepLength);
  int replaceCount = length - keepLength;
  String replacedPart = '?' * replaceCount;
  return keptPart + replacedPart;
}

void main() {
  String sentence = readString("Write a sentence to encrypt: ");

  String encryptedSentence = sentence.split(' ').map(encryptWord).join(' ');

  print(encryptedSentence);
}
