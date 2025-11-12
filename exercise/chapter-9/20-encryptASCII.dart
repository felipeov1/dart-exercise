
import '../reads.dart';

String encrypt(String text) {
  return text.codeUnits.map((code) => "$code ").join();
}

String decrypt(String encryptedText) {
  List<int> codeUnits = encryptedText
      .trim()
      .split(' ')
      .map(int.parse)
      .toList();
  
  return String.fromCharCodes(codeUnits);
}

void main() {

  String sentence = readString("Write a sentence:" );

  print("Encrypted:");
  String encrypted = encrypt(sentence);
  print(encrypted);

  print("Decrypted:");
  String decrypted = decrypt(encrypted);
  print(decrypted);
}