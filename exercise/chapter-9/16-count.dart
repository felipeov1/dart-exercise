import '../reads.dart';

void main() {
  String phrase = readString("write a phrase: ");

  int letterCount = 0;
  int numberCount = 0;
  int spaceCount = 0;

  RegExp numReg = RegExp(r'[0-9]');
  RegExp letterReg = RegExp(r'[a-zA-Z]');

  for (int i = 0; i < phrase.length; i++) {
    String char = phrase[i];
    
    if (letterReg.hasMatch(char)) {
      letterCount++;
    } else if (numReg.hasMatch(char)) {
      numberCount++;
    } else if (char == ' ') {
      spaceCount++;
    }
  }
  
  print("\n");
  print("Letters: $letterCount");
  print("Numbers: $numberCount");
  print("Spaces: $spaceCount");
}