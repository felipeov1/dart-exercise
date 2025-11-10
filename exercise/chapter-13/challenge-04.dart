import '../reads.dart';

void main() {
  int decimalNumber = readInt("write a decimal number: ");
  String binaryResult = "";

  if (decimalNumber == 0) {
    binaryResult = "0";
  } else {
    int number = decimalNumber;
    while (number > 0) {
      int remainder = number % 2;
      binaryResult = "$remainder$binaryResult";
      number = number ~/ 2;
    }
  }

  print("The binary representation of $decimalNumber is: $binaryResult");
}