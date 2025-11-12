import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");

  String newPhrase = phrase
    .replaceAll('0', 'ZERO')
    .replaceAll('1', 'ONE')
    .replaceAll('2', 'TWO')
    .replaceAll('3', 'THREE')
    .replaceAll('4', 'FOUR')
    .replaceAll('5', 'FIVE')
    .replaceAll('6', 'SIX')
    .replaceAll('7', 'SEVEN')
    .replaceAll('8', 'EIGHT')
    .replaceAll('9', 'NINE');
  
  print(newPhrase);
}