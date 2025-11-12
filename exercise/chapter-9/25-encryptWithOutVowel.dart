import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");

  String vowelChars = "aeiouAEIOU";
  List<String> vowels = [];
  List<int> positions = [];
  String encryptedPhrase = "";

  for (int i = 0; i < phrase.length; i++) {
    String char = phrase[i];
    if (vowelChars.contains(char)) {
      vowels.add(char);
      positions.add(i);
    } else {
      encryptedPhrase += char;
    }
  }

  print("Encrypted $encryptedPhrase");

  List<String> decryptedList = encryptedPhrase.split('');
  
  for (int i = 0; i < vowels.length; i++) {
    decryptedList.insert(positions[i], vowels[i]);
  }

  String decryptedPhrase = decryptedList.join('');
  print("Decrypted $decryptedPhrase");
}