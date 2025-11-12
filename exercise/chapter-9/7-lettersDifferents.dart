import '../reads.dart';

void main() {
  String word = readString("write a word: ");

  List<String> allLetters = word.split('');
  Set<String> differentLetters = allLetters.toSet();

  print("difference $differentLetters.length");
}
