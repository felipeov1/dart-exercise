import '../reads.dart';

void main() {
  String input = readString("write a string: ");

  int largestSize = 0;
  String largestChar = '';

  int currentSize = 0;
  String currentChar = input[0];

  for (int i = 0; i < input.length; i++) {
    if (input[i] == currentChar) {
      currentSize++;
    } else {
      if (currentSize > largestSize) {
        largestSize = currentSize;
        largestChar = currentChar;
      }
      currentChar = input[i];
      currentSize = 1;
    }
  }

  if (currentSize > largestSize) {
    largestSize = currentSize;
    largestChar = currentChar;
  }
  
  print("largest: $largestChar, size: $largestSize");
}